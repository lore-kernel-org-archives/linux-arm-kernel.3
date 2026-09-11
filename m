Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 832C1C88E4D
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Sep 2026 20:35:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=kHBzfgquaXRWdYlhp+0HjCKIr2/nM/SVVPzQiQe/cr0=; b=mwitfceipfgidwkgD/a7AE8/Fd
	oZOlEEWpseOPF950DCrlplXw12J7zyx0a9kbE28F23GRkNZz5ywyXQIwIOz8nycoroTf0eJJFEegp
	awNqFonCxQA2VgG0OR+EliL0xzvfmZ6TX+4Fhp9xyYWScgJHyB+pvphD1gMBMb+TGlz//VE2TMkuf
	fQeJyoaAMAHZ0DC50CsjrLLOit4wRElu1LXVPAXACKRBjDz6aedXliK0gVSC8ybC0yj5ri5uVfzwx
	grsnLTAnuyLHLKOo7SIkAixUbnq8HE7zX/DrlcbOyiZxuO9/tYHBs6TAzVZjA2TYBnbSJLQs1tlF+
	gkZsAwQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x57y4-000000006eQ-3qCs;
	Fri, 11 Sep 2026 20:35:28 +0000
Received: from mail-pj2-x10.google.com ([2607:f8b0:4864:39::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x57y1-000000006dq-1VT5
	for linux-arm-kernel@lists.infradead.org;
	Fri, 11 Sep 2026 20:35:27 +0000
Received: by mail-pj2-x10.google.com with SMTP id d9443c01a7336-2db1ca06b03so1435105ad.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 11 Sep 2026 13:35:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789158924; x=1789763724; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=kHBzfgquaXRWdYlhp+0HjCKIr2/nM/SVVPzQiQe/cr0=;
        b=TzjqrPR4AvkWhw7LTAU6XzPhZ6HJyLPx5pdwIqnlRyTZX2d693ErOqFhQLvrLjWqum
         Mvba3wCthEVGFSOhIW/WNCVBrEL5DVLvOptgHjN7gQpIRhYU5ZHeaiZm+wj247phr4w7
         NxpspDhMnup6KfzAg77KFH2pa8s2i7jjHvdFhdrvatECTt3z/MtOVWmq2MnMcdOq7LGQ
         DgcBzXjycYKsBwO2Br/C7DDhKi3/kOrJt6X0ugchZGb3oDm7CQxksRIVOaLvd+k2q1he
         J6NsJaCiocq9VFwKGAFd9FuNKe6UEXlu10a5bij2Y6TWLyMIRRi//WGcIKxSLUqNmk5p
         TW0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789158924; x=1789763724;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kHBzfgquaXRWdYlhp+0HjCKIr2/nM/SVVPzQiQe/cr0=;
        b=f305Jh14Cy6L213D/0wSqN65rjvzfegYfmsVUMypmj9Y0/EZnswgCYzP8jovyun5qS
         cPEVgmrePkIl0p46DygLUq7kxpilfG9s2eDl8b/H+4HiT3G+A9vLTEm+qaH7Dr7kc6TZ
         BBUmE5cCjMGcEOHYXUzCgoGYazEMeVWgKL8+wsyq/Y1cNZzuk++m8CIDwzbDnh0gWqti
         NI4TgK2Wam3q6vTvep0xXhwqaYYGbDJCVPQXiZLtg4EpwpPFY+3j/BL0M14GlfPJk2VQ
         3z8HTiiGh03TggYf8XWNupcQui11nsuCYMLz5LPWeMzdwp2hmUoXqIoQha456VYKflIy
         0q0g==
X-Forwarded-Encrypted: i=1; AKwUvBxH6aUxtf+3jz3+AHC3ziPn6s4cqeiCbsitRhd+Nkqpg479C+FJ84+Hch662c82wPgeYZEMBhOE2hnpND5sXfA5@lists.infradead.org
X-Gm-Message-State: AFuF++mgh0t0NgTVc1AXMFyrGo80kym0AtMxzTtFVVSoTG0U9Y0TGtap
	+ug+dPiV1Nyo3mRSHO0ynx2xPGu0BHSDQviv8ui3mkrsa4FKMnO2RngW
X-Gm-Gg: AYBFou3oWCjQwMA3aeZS0gcdDAUg1/C0mtC6ckApnxjaRs9br4di2yOKLw06AotrCRH
	aWaWzfGQ+GRHaKLTpZN+9baxxXbIGY715CKXnmrQcGR3kA65HCCEl9lwVWlMB1STnC3rwj0DTnb
	t7Xti1QL1+8C8hFZ2HfTO0vjxUKREyDAaNk2SDuSHVbuQGcZFAOGlXIzNcMP1x9Ua+wu5VeIKEb
	VRuMW09vd8BbABzHjpBQQX8SH9p2HpEaFXEHzDITqjVrEgYrEiffj72AnaEtNVVBeKLXbmGX/bY
	SKcwrBQ2yUpxkCiPeDfCbpDgYxCWVqIR6IB2Hx8Ar1i6T7owLF0OqGCK50Fj+g1LsJ0e3G/wwen
	uU7B+so24LHgqPsdWCo6f+swFFhYPMcHiD2fz/LRWzqwwtOrFfruuIvDdmNUsYJodcouWU9BV9M
	rD7UU4NhEvvEGphMPQgkwVErvtFMFVL82kvTcjNoqQbvbPrzGnAQ5KlbnGjPAmFFnC9zjM9BSl5
	MxGZ/4QdtMUfJiI0YabMsXCfj5UzU0dlrqMUvFbAkWiuDZ7bA9kuT+x6IMZuw6dhsK/x5Mmlk7s
	m3z1kvuAmTSdHm1+T+H8F13zx3ymKNlvcZdIH/nkKxfE1+Zf
X-Received: by 2002:a17:903:2452:b0:2db:2c05:5d92 with SMTP id d9443c01a7336-2dd2a1fbb4fmr61652715ad.8.1789158924270;
        Fri, 11 Sep 2026 13:35:24 -0700 (PDT)
Received: from ryzen.lan ([2601:644:8000:7a86::e35])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2dd2cca6b7bsm16865345ad.3.2026.09.11.13.35.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Sep 2026 13:35:23 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: devicetree@vger.kernel.org
Cc: Florian Fainelli <florian.fainelli@broadcom.com>,
	Hauke Mehrtens <hauke@hauke-m.de>,
	=?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org (moderated list:BROADCOM BCM5301X ARM ARCHITECTURE),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCHv2] ARM: dts: BCM5301X: R7000: add nvram node
Date: Fri, 11 Sep 2026 13:35:22 -0700
Message-ID: <20260911203522.105474-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260911_133526_189314_75337671 
X-CRM114-Status: UNSURE (   9.81  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

Add it and set MAC for gmac2, to avoid having to handle in userspaace.

nvram size found from a random bootlog online.

Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 v2: set gmac2 instead.
 .../boot/dts/broadcom/bcm4709-netgear-r7000.dts    | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/arch/arm/boot/dts/broadcom/bcm4709-netgear-r7000.dts b/arch/arm/boot/dts/broadcom/bcm4709-netgear-r7000.dts
index 24ba8f8f9bf3..6ea845f3ac1d 100644
--- a/arch/arm/boot/dts/broadcom/bcm4709-netgear-r7000.dts
+++ b/arch/arm/boot/dts/broadcom/bcm4709-netgear-r7000.dts
@@ -25,6 +25,15 @@ memory@0 {
 		      <0x88000000 0x08000000>;
 	};
 
+	nvram@1c080000 {
+		compatible = "brcm,nvram";
+		reg = <0x1c080000 0x180000>;
+
+		et0macaddr: et0macaddr {
+			#nvmem-cell-cells = <1>;
+		};
+	};
+
 	leds {
 		compatible = "gpio-leds";
 
@@ -104,3 +113,8 @@ &usb3 {
 &usb3_phy {
 	status = "okay";
 };
+
+&gmac2 {
+	nvmem-cells = <&et0macaddr 0>;
+	nvmem-cell-names = "mac-address";
+};
-- 
2.55.0


