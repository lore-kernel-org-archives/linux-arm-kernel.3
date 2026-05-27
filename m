Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5615FCD5BC9
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 27 May 2026 10:05:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=G42y5I8R+7FiVelwxkSPiySmvc6XEZZzbq1j+Twey98=; b=q+UmWUbh1JkrP1pyU/cC01V/t0
	RFYvmgrvOyCfGJmLyV/+YnmM+58qvH1liJhTjHLjbmEDtfWeE7fVM8/MaTcJALTCPehgkvuFnIsDb
	YP6zrSWe1gP5yUS8XuUOk9ZMJlsYk/oUwsE7712d/Yywgh2t7CvyX92D/Kx/goK7pEjwnxhyQx+vK
	QKA26pJJ0tN3YZFlwLK9EHz5vfZT0l6k58TtWKib+B9MTDgUXqQtAyUtjoWIqNUIly1NsSYFEEA50
	lUWQih0hm4A5aGq/E87RV1WiVeEZG0/UkeCEpl4+ABNKfRFiaFNW9cgNSsWqaa4bnp8ePgfI7lHn9
	r/LsBRcw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSB8P-00000003iDl-2yCj;
	Wed, 27 May 2026 10:05:09 +0000
Received: from mail-pf1-x443.google.com ([2607:f8b0:4864:20::443])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSB8N-00000003iCh-2th3
	for linux-arm-kernel@lists.infradead.org;
	Wed, 27 May 2026 10:05:08 +0000
Received: by mail-pf1-x443.google.com with SMTP id d2e1a72fcca58-83975e992e1so4663032b3a.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 27 May 2026 03:05:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779876307; x=1780481107; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=G42y5I8R+7FiVelwxkSPiySmvc6XEZZzbq1j+Twey98=;
        b=ihYrRU9aPp9JRo1J70tOppgQjCHC41d7ReAjhQvBX9Pjc9mLGgakriH1GmqjkPncpJ
         FpYL5AoLzlmkbCOrhuXYLmaw97TNFwhGkamNsWbbZwmOqdBwQeYStzRj/sWf3KBH9qEk
         WymLyhFAXS4db8bCc2r6l+k8YgkG8dW+ObsTnpNQ15Y2/vB1RI0V/Q8wzmhS1ZjtxH8D
         jQgcNvbc1wpq/7xOFBYeYMneEUiENPIklk3UdMg9reJEDn9I1TBdE4nPDcs3FOqD1kl8
         iuEfFUY+SQ9+aHCtEE/RGbKzibCU1dhOoFkemQ7H0Icurwdp1LyEDSllc5/xAhZaXgxn
         wE6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779876307; x=1780481107;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=G42y5I8R+7FiVelwxkSPiySmvc6XEZZzbq1j+Twey98=;
        b=L7BT0W6GF0P9BVFWgfRxACeBGG7mAuGF6UPSqavIiWbjicNrEWvXvFl1DMQM6bc/j7
         VyVZX3e3+QyLXi0Oh9j9pNvC0W+G0pAx6qHyeERsyj1Fd852MLDfGFD2PWhvY2SX3/cs
         is5xxPBMWWmt8iwSl1GutXQiuC6NtzfmObdmFzheRlePxNu0oWXjLULfE9IkCuqHXsGt
         zCsxbvFGzNngErBfXf20fEoa1CGRDWLSk6dqHk7bws4up1PACUws/5XcUQ6/679DoJJg
         xQVJZEGEBH63p04RATKcGMIvuHIaaSkJBIRLGFsva7ZBm7TlyG8fzXjPfQpf3Pi8M7tG
         oGXg==
X-Forwarded-Encrypted: i=1; AFNElJ/fODGaln3KeQM60cefFQfDUV3340lEo/XAbHBnEv1eXj54u6K9I6gxfLil/KfHh/+wsQjfsN+oSmY94G5bSkEu@lists.infradead.org
X-Gm-Message-State: AOJu0YxsjWNrhNaI27+EKA1vWf37k+qLyjg72gmgCdzAuZSUGH4J3zRP
	aG2rzyd+kK1v0hyfUSgs/qvCNTokb7Cca1Q3jyt3fdAXljBIRLo3+gI=
X-Gm-Gg: Acq92OFt4+r4EeSNY0glSfCv2fw6JP/AnOFC7jfRNlDW4EIYBGQi0zSANhtB2rR4Zrz
	ZElD9Mmz16E9DkvPswne7xpAkznN34O6mF55cX9+c32oTN+JLbTPu5yOm/HoWP3Lpu0C2HY2Mfw
	TSMzTZ1XvG28b2Wa3iEfhBuec1m8HIszVAnmcsm+7uzcVEDBt55/TNu/5twR7lRChKMiMQbUyDU
	2cFz/f/y65rGGAOejsYJEeuzGoLXj7ZvHo1sKldD0oEdOBqGW7fRbP4rxS/ppmO29q957rvCLCd
	fdqUQYlAB7yPlm91D2xCBaTHY3kHikIfq4CAAAOR3ZkGtHNnUs3aY2slJzEmuXGncJaWXKKMNdD
	zdNxp46lNyCy+mS8TrqkNZWmXaquvDXidlPzj9Bc9DmuXwnuYzOXfWWPa8kn+DRHnsTSwkWCbx/
	QRNCLF/77+UVIR+mA/nzknZuQqtJaRWl5WCz9ApQL+FNDSi6bERC3ppVPXfK+9t9Gi7g==
X-Received: by 2002:a05:6a00:298f:b0:835:3d5e:1dd3 with SMTP id d2e1a72fcca58-8415f586b5bmr20394695b3a.42.1779876306515;
        Wed, 27 May 2026 03:05:06 -0700 (PDT)
Received: from localhost.localdomain ([211.196.223.197])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-841d6e806c7sm1951266b3a.1.2026.05.27.03.05.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 May 2026 03:05:06 -0700 (PDT)
From: Jinseok Kim <always.starving0@gmail.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	florian.fainelli@broadcom.com
Cc: bcm-kernel-feedback-list@broadcom.com,
	devicetree@vger.kernel.org,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] arm: dts: bcm2711: Fix typo in gpio-line-names
Date: Wed, 27 May 2026 19:04:37 +0900
Message-ID: <20260527100439.2507-1-always.starving0@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260527_030507_730666_933B590E 
X-CRM114-Status: GOOD (  11.54  )
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

Replace "RGMIO_MDC" with "RGMII_MDC" in gpio-line-names.

Signed-off-by: Jinseok Kim <always.starving0@gmail.com>
---
 arch/arm/boot/dts/broadcom/bcm2711-rpi-4-b.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/broadcom/bcm2711-rpi-4-b.dts b/arch/arm/boot/dts/broadcom/bcm2711-rpi-4-b.dts
index 353bb50ce542..5469fa663526 100644
--- a/arch/arm/boot/dts/broadcom/bcm2711-rpi-4-b.dts
+++ b/arch/arm/boot/dts/broadcom/bcm2711-rpi-4-b.dts
@@ -110,7 +110,7 @@ &gpio {
 			  "GPIO26",
 			  "GPIO27",
 			  "RGMII_MDIO",
-			  "RGMIO_MDC",
+			  "RGMII_MDC",
 			  /* Used by BT module */
 			  "CTS0",		/* 30 */
 			  "RTS0",
--
2.43.0

