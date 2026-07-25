Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9098C531C9
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 25 Jul 2026 21:57:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=tWxVEjNz8W1QtsXPhyFLrXWEYYl+6GsNRRe6Xr3SuC0=; b=zIVjlyiVPdYBW3N56J/O8GlF6E
	fk8qw2Y6iuzwaSLeb3WmYNK2aInLIR4jPdmqMdy3XCnxHZCaZbVEjft548SVi75bMw8AzgEAOPEjr
	FN587Ch7vYSKpUGozCDyvBDOsXYhxX4RvkS1EeaprD3va6+yOnfZIden9hJ9PGQNxVUvUM1ax52vS
	wXVity54pUFQzw87LFVpP/+wiGVzLmUuLm9A478NpjqgyTk502r2KemhF/UqHUQ0Gc3+V1XO/TGM0
	tk5ZYeE4xA76yPDUSN0N7ezNs/2c2DLcKpW3CsgytAnzzeRSmo4FU8kAOCdO0MGgSbF/33Jvib6Ne
	eRw6/P2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnkN7-00000000jhB-45eG;
	Sat, 25 Jul 2026 21:57:29 +0000
Received: from mail-pf1-x436.google.com ([2607:f8b0:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnkN5-00000000jgk-0iGa
	for linux-arm-kernel@lists.infradead.org;
	Sat, 25 Jul 2026 21:57:28 +0000
Received: by mail-pf1-x436.google.com with SMTP id d2e1a72fcca58-848479c9bd5so1106767b3a.3
        for <linux-arm-kernel@lists.infradead.org>; Sat, 25 Jul 2026 14:57:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785016646; x=1785621446; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=tWxVEjNz8W1QtsXPhyFLrXWEYYl+6GsNRRe6Xr3SuC0=;
        b=H5tpzmJvcucW9zCHdbrU5NUUvZiDPK7fQmDnfazdqP4iwCP/mMbxTGm6v0eZEVIDa0
         vRYu8O1Gka91lL7IV0w/r1F3lNWQbAzMxx++jodhfVgfv7qtg3Vjz5mcmJZUIfq8CFw1
         iCr/vPIiEf83EWivzCf6coKxbH4vDjWWoIsF1hRbIPUJKfIAgjMmQzLIzMzvNSEhmoh7
         72XogN2cjeskfL8imsHVW2kcAQBFt4PvZUkwPD4eaxeGj/qc6MZnmOgWUaMpsTTNv8za
         rQg2jjB3vK80xwz7RWA6VHCuYa2Wbcdj1mc6fFM9peZW4ud357xWys8p0bCFJREiCWcm
         loeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785016646; x=1785621446;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tWxVEjNz8W1QtsXPhyFLrXWEYYl+6GsNRRe6Xr3SuC0=;
        b=cRz3sh0ZnW7O5afRGRm1VaL2w6KXOJP6hDywlWHFTJYi4SPYdbWSa24o0D+AoYygUh
         h/xfp7AdhlLSZynuLQCvehfH40Flyq/6qC+CVgx+N63VA9lhqduJt/6aVaM4kNTLunMF
         W4/SPBvHigjMwqYWZauVe/40eIFDYVbxS5CsS5Y9CWqXqH/iaQ0qEMDpZ1BtBPO8ccdP
         M7ZKA1GibAsa/b3C6OLnHkwaXPpyht8kV/PagQ5UCHIKJbLWukI8/PG9a5OOK3apyfV9
         bIBNbIJs6OJG6yKGD4nS2MZ7GMFVnuxDaQslaomeNgQ+w+wqz8kF3EZeum01ra7+PoL4
         5JUA==
X-Forwarded-Encrypted: i=1; AHgh+Ro5B1Z1O7v7Q2PM+ykvuZfoXhOIF6KPklVVYP7sI5wbn/3fbW0OPqgjgxPvtJrjRmc7CeMJ10vrlLKO1qJ1q6/c@lists.infradead.org
X-Gm-Message-State: AOJu0Yw5J73fPCvF3wttFyhd6MJEIDP/wsVPZf1DGB0Z38l7KnL3m2ab
	yajFaM75zK2uwOLOwJ9LSaHwrAVy5Jfo/B/S6JBPvfPZk/rqi43pTklB
X-Gm-Gg: AR+sD11gTqiuJI/sqOylAb3mMaEdebteqhAZPMuwIEnO9WUWGa9eiJCDoeOqBShV3cg
	iN8c8RWgiaNVTU4DhY11ZCen2C60HD3zVMJr6YTEaVBao3hITqII8ZcX9hnxXK5NjBJwMKuEFhX
	9zzoakjdC1gENKXGLNkR1X+reSKL07yFRxbfQKbJmNh+lmh+4XHLPlqu1LWeoadb78kYt1lcBDR
	VX0l0Re2Fbg4c9ibMGcovC3d8KlGPzFtIPC6LtHlTSEgY9b1EDh8O7d7VrvSBhWvUT9zXW403IW
	9RccZVcBwSo2xrwz/Uu4owXYHdEDvsIvkNnCphSjLQAJ5Xy+E3PaCTQiayVWwnVoJEphwLfZxCa
	RU5+wA1jHcBMvuKrOH01PPHMlPHY+XAzeNEJuObLoQAUJ8p5AiBCbsarZHu/yzHbLVzXhuYi+0K
	rAEVncPPr3YAgSgCSzu9S7pt9hHpD8ZAIerO74SbQxCUVDwszNkchEKzhCW1wUflb6d6Vv0+bYt
	+DamRvhW01kbYeTAvqaFcVymW94U6xWfnWiA1902Ln3Ga9fH5G/ktk=
X-Received: by 2002:a05:6a00:99a:b0:84e:223b:98c2 with SMTP id d2e1a72fcca58-84e595f20b5mr2442186b3a.77.1785016646058;
        Sat, 25 Jul 2026 14:57:26 -0700 (PDT)
Received: from ryzen.lan ([2601:644:8000:7a86::e35])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84e532acee2sm1322290b3a.27.2026.07.25.14.57.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 Jul 2026 14:57:25 -0700 (PDT)
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
Subject: [PATCH] ARM: dts: BCM5301X: fix PCIe controller 2 second interrupt
Date: Sat, 25 Jul 2026 14:57:22 -0700
Message-ID: <20260725215722.9323-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260725_145727_212067_FB9B0AE1 
X-CRM114-Status: GOOD (  11.17  )
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

PCIe controller 2 has interrupts 0-4 mapping to GIC SPI 138-142. The
mapping for interrupt 1 was incorrectly set to 138 due to a copy-paste
error. Fix it to 139.

Assisted-by: opencode:big-pickle
Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 arch/arm/boot/dts/broadcom/bcm-ns.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/broadcom/bcm-ns.dtsi b/arch/arm/boot/dts/broadcom/bcm-ns.dtsi
index 392a25713669..bd52de0faa3e 100644
--- a/arch/arm/boot/dts/broadcom/bcm-ns.dtsi
+++ b/arch/arm/boot/dts/broadcom/bcm-ns.dtsi
@@ -141,7 +141,7 @@ axi@18000000 {
 
 			/* PCIe Controller 2 */
 			<0x00014000 0 &gic GIC_SPI 138 IRQ_TYPE_LEVEL_HIGH>,
-			<0x00014000 1 &gic GIC_SPI 138 IRQ_TYPE_LEVEL_HIGH>,
+			<0x00014000 1 &gic GIC_SPI 139 IRQ_TYPE_LEVEL_HIGH>,
 			<0x00014000 2 &gic GIC_SPI 140 IRQ_TYPE_LEVEL_HIGH>,
 			<0x00014000 3 &gic GIC_SPI 141 IRQ_TYPE_LEVEL_HIGH>,
 			<0x00014000 4 &gic GIC_SPI 142 IRQ_TYPE_LEVEL_HIGH>,
-- 
2.55.0


