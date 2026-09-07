Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99F39C79FA0
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  7 Sep 2026 19:47:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=OETNujE7LMv/ipC540SMkvUZvl3I7u1TcYnMN40akSI=; b=DT1yCK4VDdwwlxvpTwQWxvj5A9
	m6HNdSpchbcsUXY0t6DvuE2d49uJBmhJDCz+DpHmECtSOTqfILGWV32J6Jh8l7TTeKq9aYBylMVoR
	fuhfqy4lvIQHY/J1We43lZjk9b4/eaQMZF9MoRFY5mFdvedz2ROSHaQffw+aYFReKc7c8GKoRQmzD
	Pr59tMBH7QfbygITaUmiAfLbtzPRK/WROaIZLFtHKgzhz9CYZzyYE5Vpq254Ia5ZGGU5o3tYtQ5Y8
	hxLqQdBRirBWDPO41G15naFOXyse2e+rklEFwoJGkGCGcXHRtp2WwHJ8RA3SWptba3oiMR7hH+P1Y
	eHUy7vKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3fIq-00000007fhj-3SRj;
	Mon, 07 Sep 2026 19:46:52 +0000
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3fIo-00000007fhA-26WJ
	for linux-arm-kernel@lists.infradead.org;
	Mon, 07 Sep 2026 19:46:51 +0000
Received: by mail-pj1-x102e.google.com with SMTP id 98e67ed59e1d1-3964e480f76so4479255a91.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 07 Sep 2026 12:46:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788810410; x=1789415210; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=OETNujE7LMv/ipC540SMkvUZvl3I7u1TcYnMN40akSI=;
        b=kuCVkevAwEoNHgjnUVTaVE013TRwmFs70x07U5hfi40P/c0zWIJHThMG6f/FHc6d/S
         y2eairsbQHRdkG6s3XxTlbIbR/3QaLo8YLnm+yqihdw7TFGeZC+ePo63szQRtz6XB8yk
         GW1c4Bpxp6IA4wrfjRpi7d539jXILpYHATCUr18gicLaDMgwu/5mKPpAQhGlvh1duGl4
         b0swOt59Tc/QyvuHkz4++bsIACbM6ITto1pxvVT1o+21dfA/c8y+wUXHxij+Ns5YuwDJ
         ZKlOODH1Evt82S4F6D+F7C8+Ry+G5js7WdQgso1211M68NylGLeSU9cgwp21T2ZhMHH+
         ZekA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788810410; x=1789415210;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OETNujE7LMv/ipC540SMkvUZvl3I7u1TcYnMN40akSI=;
        b=aNjbglEWzSpksEAifcfmH14YXmZYL2lbCIKI/8h7ufOv9+IdYfzkFG8anNPedRO7Aq
         7RzDdtSz1l+G3K7AW2GHIzcdobSWYib+fY7BRf+v9shTQ7TAFQRozmVSmJJRpo3UH6dH
         faiDynQOmM50C+WfP8O+zuXY8fzTdIylH+akpQuYxVdtncmrirD1kimTGvL5eH5vvEgm
         /9UGTfJGnsgmq0qQ+wSec1knd7G9gsYEMxBXG+HZwh6u8oBLYA85sxbK2RK0iBDjl3Mq
         7fFty/EOAXnwJTGEll6dknaOq6PKL2BwHgGkIHrGJkOIT9rALx7IV7uILdfGrhX/EY2g
         7VkQ==
X-Forwarded-Encrypted: i=1; AKwUvBy9fp5Oi1C1O2iDgmAAXvRAAZfI3FRjjcrtzFvBMJUSimgmoK3Z3jDaewqAsJ0/fyCsePAOLNLi7+qo7+94Mkkb@lists.infradead.org
X-Gm-Message-State: AFuF++n6l/IIOmNOmQjNBMLb2SakBiFX1wcUb/wL0GhmWEDEGxtBZREi
	b+X85lKZM1kohWraEnjhuhIa+jrAxVVVDuDX+Wcau7ZeBzIDFFayr2pd
X-Gm-Gg: AYBFou2icP8GrV1iC2Ru5p6sDOKW83PggsNsb/kk1xtLnGsN7TR7fpQSS4i3AMZcoMG
	TJ3kJMOnDiIaGd/FFWWYywuor93njGROKS2AUe3xHBIEZsbSCfjg1mrLuAWTf5eP++X3MnrYggE
	6fs2PI0WVb6HWSC447oLw5ID2UAOdtJfRCPs4+iJ2nGj1i/26+N70v9OZNLVO0Pz0sgQjo5iIr3
	kUqZv5LGQIqUUaiEXgd4xAGifWhqzEV+lNdjWz6rVDSrnvWsbDqXu/LS5q9dNPWHnJR9LBAEs9+
	pVnUcZbu4ahCup0KL7JZCVHE3a7TeqKnpyCeG36AIPg7X+VlJALbTUbV0cNHXZqhrD1ZEwh5Hxy
	Bb0kMAHG1W6gMkcmNdotYau0VaCPLzetmv5yr5RMahTLtgNmOpcW7VudqpHgVO6dQVPTmGZh9o6
	BDDQEWKqJnBcoN5m2XUJfvS4G63QzceF4ICgXiaXC/A0M+Zf5ug6zgTsvPU03zigkmh0xXkA3Do
	KOa04zYXXIv/AUBH8vLdKY69TZihN27cUyAD0KOT9gIRLPvCMgxrfGf3mfglu3SPjN0SE8vCgT0
	+dr6xglaSEWpWGZNknCfLDbDSbfKveB1junmkw==
X-Received: by 2002:a17:90b:1d4f:b0:398:9be5:b417 with SMTP id 98e67ed59e1d1-39b26221eb1mr36435852a91.18.1788810409626;
        Mon, 07 Sep 2026 12:46:49 -0700 (PDT)
Received: from ryzen.lan ([2601:644:8000:7a86::e34])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39b08bcc090sm28219277a91.4.2026.09.07.12.46.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 12:46:48 -0700 (PDT)
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
Subject: [PATCH] ARM: dts: BCM5301X: AC68U: add nvram node
Date: Mon,  7 Sep 2026 12:46:47 -0700
Message-ID: <20260907194647.23151-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260907_124650_545371_6E297E37 
X-CRM114-Status: GOOD (  10.99  )
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

Add it and set for gmac0, which is the only GMAC used on this board.

nvram size found from a random bootlog online.

Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 .../boot/dts/broadcom/bcm4708-asus-rt-ac68u.dts    | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/arch/arm/boot/dts/broadcom/bcm4708-asus-rt-ac68u.dts b/arch/arm/boot/dts/broadcom/bcm4708-asus-rt-ac68u.dts
index 3fe17bd7b86d..42618b5d6509 100644
--- a/arch/arm/boot/dts/broadcom/bcm4708-asus-rt-ac68u.dts
+++ b/arch/arm/boot/dts/broadcom/bcm4708-asus-rt-ac68u.dts
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
 
@@ -83,3 +92,8 @@ button-rfkill {
 &usb3_phy {
 	status = "okay";
 };
+
+&gmac0 {
+	nvmem-cells = <&et0macaddr 0>;
+	nvmem-cell-names = "mac-address";
+};
-- 
2.55.0


