Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C597C79FA0
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  7 Sep 2026 19:59:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Ykn8R+5bxXefN33Ze9iKBwEjjXnMgUuxZmUBRl5EBxg=; b=gAfyi8oYKXS5Ml3yp1w4ZDoWvh
	bnWys8pgYE/P+jmFTJRP0UxXD9tZwEO/EPj9wmXDUe25Q5a5Kv9tjcSfAbZBHVsX05rBnVajaqvMA
	LIVikFejmkWxpLHNUxXeYmLlYMlBr8TwhB/5dUK0UkDbR0hnDT/CGcLcQIm2jSfeg3UJj5LCMODMf
	IRRQWV70ZRgVzN9usbCmXHDOlxHDc+isOpYStHoQcbfsZHkLrS94qv+f8ddIytnr/aJ0eBZ7h99A4
	V2ID2zx6JOweQPjO22JlNwspIL4H8cl8G62QhWCN04vLtz7aIm/rxeUhscWNhj0+KehcF/INiCalg
	y+K9r/ZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3fV4-00000007g5a-3s1R;
	Mon, 07 Sep 2026 19:59:30 +0000
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3fV2-00000007g5E-1xXl
	for linux-arm-kernel@lists.infradead.org;
	Mon, 07 Sep 2026 19:59:29 +0000
Received: by mail-pj1-x102c.google.com with SMTP id 98e67ed59e1d1-3856d6fbcb3so3098463a91.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 07 Sep 2026 12:59:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788811167; x=1789415967; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Ykn8R+5bxXefN33Ze9iKBwEjjXnMgUuxZmUBRl5EBxg=;
        b=nBTmFmC0RZ0pYn1qJEueERXvfQ9ieQkTZuc0kTucKzoiFBQEwAM+Tz5MOcxCYIDU+5
         NlV6vwfRMzNW4rJbwP3t0UAHQXgSuk6YzGvqunlqJyvS1jCD7te6Q8CNqBvvNdVwnDJe
         MMRs4gpgxe5RBWYZwuhiAF+fIH5CV8wPQHpVXpzwpLxclfJ0Y3tSZAsEuYFVGnv62Wk5
         7b19Vsdu131xmLTWJfsus1iSVfalMow+9GXM90MoDWwDuGgajyWfQgzJMklZKEvkalho
         3NSb0/g3jtOViOMZHdjAJib3DUwnN34JJVnCvyvbGpAuJa8hsyWKbwCtXsNdxPPtKnEL
         pd8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788811167; x=1789415967;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Ykn8R+5bxXefN33Ze9iKBwEjjXnMgUuxZmUBRl5EBxg=;
        b=au2W8tdObFG4vvMzLEcHIw2FhLloZLk27i9p+99Nd3Q8Fd3JJBxjmEoiUcSGPKvKjy
         4fw/Sye3leE8FpHisRdst146deNdpvuQSDWxLQEQwtTG9DleWuyIALh04mqY7zTBvtWv
         p3JfL0mGp6dOEVKv6fY6TlJSgBSGFOj3yAIIRkvhYGBWxZNPi9YldP+miAIPUGmkl8zO
         ThpCYfKLMA/ecGM7veaz+jEAgk2Y4oPcgj7mNF1ZrPjdIi3gP2TfrPsmUrv3D+9YhazR
         VG0yryg1tCekadqbVOzkQW7s6SFQssIjTVZ+NDZ2t2qYB7XYO3bfApdAZwGcW2C9MhqS
         8r2A==
X-Forwarded-Encrypted: i=1; AKwUvBxGFjcleCRyFsfqYW5fycv/1ulWcd+1DqBPTDuggQGE3LKc9NFema45xpXY7Uug2Tx42Hq7fhEtCiqns2KuMrjs@lists.infradead.org
X-Gm-Message-State: AFuF++mX8PXfoT8ksANJBEI5E9tvEwIJiWGzV92cWsh7SdBujk1Yl2LD
	y8qLAxHYxFuREk/g6MHzpbfizblga7QAfWmIgP9ahiXg/XYO3Vpe6eN7
X-Gm-Gg: AYBFou3CaP4FoMNasO5Aw35rMCE/rlcZ0koozurJsFeU9FpwQF3aSMcTsPd8ETyBdvX
	TrcZGv3Vt6rjeeuJwTVIcoKw2cYpBuJQBg0Si1d0mB747Iz8ye5jvpSNPePlXo8LRMPRynMNLUa
	6x6PQQk1FbDKCHNJZ8wOLj+nRIc60am+Bwh83kbMDvshGAA5sZpRmFCWgThasnpSLh2XLBwrhXH
	ptfosLS71/lwAyqgg5/qBz8nKQhkT3sNCdaRqM/jWePY39PkDemk/w7ne/d1wkzTbjbqt+gcvd8
	TUfP5k6PGuEaycf3Jnmcm0WVSxA4hB93/ph5q5pvqde6XZV8Ex0n1D9jh82d/z50P91UgodOGQs
	8XvYu7BUPSY/KWDR6D7xT5koHQPRd12vfNyevFvkm0Z72yneiYjw2dNqfgVwHETv6DA6Y251eic
	+Wk3lUvyjyj0GiS3GqWOzZB+HzmXNOy/BxM3UO8jfRMzM3OFl6iDnkCfkiSZc4r0gO/f4hRqx0h
	TnhAVV5Hzl/dA47a1UJEKJfIc8ApprA+IaNMGp3/fT0oeCG5akKxSfmVTc7LZctpXo2QX+tKURO
	agg5o6b74hx13yHoknc9GUpRw/86af8E2IcH1w==
X-Received: by 2002:a17:90b:33c1:b0:398:9bd1:3214 with SMTP id 98e67ed59e1d1-39b262dfa81mr34312237a91.21.1788811167343;
        Mon, 07 Sep 2026 12:59:27 -0700 (PDT)
Received: from ryzen.lan ([2601:644:8000:7a86::e34])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39b58187a9fsm3683932a91.3.2026.09.07.12.59.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 12:59:26 -0700 (PDT)
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
Subject: [PATCHv2] ARM: dts: BCM5301X: AC87U: specify switch
Date: Mon,  7 Sep 2026 12:59:24 -0700
Message-ID: <20260907195924.29510-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260907_125928_535022_7DD6AA96 
X-CRM114-Status: UNSURE (   9.27  )
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

Add labels to clarify which port is what.
    
Also set WAN MAC from nvram, which is offset by 1. Set in dts to avoid
having to handle this in userspace.

Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 v2: reword.
 .../dts/broadcom/bcm4709-asus-rt-ac87u.dts    | 40 +++++++++++++++++++
 1 file changed, 40 insertions(+)

diff --git a/arch/arm/boot/dts/broadcom/bcm4709-asus-rt-ac87u.dts b/arch/arm/boot/dts/broadcom/bcm4709-asus-rt-ac87u.dts
index 59400217f8c3..2fed02ebb1d7 100644
--- a/arch/arm/boot/dts/broadcom/bcm4709-asus-rt-ac87u.dts
+++ b/arch/arm/boot/dts/broadcom/bcm4709-asus-rt-ac87u.dts
@@ -26,6 +26,9 @@ memory@0 {
 	};
 
 	nvram@1c080000 {
+		compatible = "brcm,nvram";
+		reg = <0x1c080000 0x180000>;
+
 		et1macaddr: et1macaddr {
 			#nvmem-cell-cells = <1>;
 		};
@@ -77,6 +80,43 @@ &usb3_phy {
 	status = "okay";
 };
 
+&srab {
+	status = "okay";
+
+	ports {
+		port@0 {
+			label = "wan";
+
+			nvmem-cells = <&et1macaddr 1>;
+			nvmem-cell-names = "mac-address";
+		};
+
+		port@1 {
+			label = "lan1";
+		};
+
+		port@2 {
+			label = "lan2";
+		};
+
+		port@3 {
+			label = "lan3";
+		};
+
+		port@5 {
+			status = "disabled";
+		};
+
+		port@7 {
+			label = "cpu";
+		};
+
+		port@8 {
+			status = "disabled";
+		};
+	};
+};
+
 &nandcs {
 	partitions {
 		compatible = "fixed-partitions";
-- 
2.55.0


