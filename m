Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3FC13C02192
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Feb 2025 08:39:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Cohisc53PIngdtiEuKddzpfpUOAYLyd71oVKYWuoODo=; b=li5KyrQ4o1oSLg0MNFFMkXrm+N
	USqutwJFkn1AnRKCcBUtpAtu8c6AQH2ntvkSWNOgA8B7/8+0Xm7x3NJtY9R8kDmxQnsyNCSRoQRTl
	HgykdLBDL1F+u+N/p5ZMznAlqGhDjuaGAZsKMZpM4OowInMfvS8UPb55Bd9ayFtKzWaznw4hauzg9
	D3UjalPxOOGGyv1mwEbzrWfr8jt5JYDY7olkyDisrBl691Zi1dPAq6BhOL0U7ge4Qu3HGxJF8/w4i
	la01Wmy5YA9FtdnbF8BepO9w9XGDZws9TBGNtyiN1fe8/iHPTpKjgW27Y0S/tohfSYUonBfzrOkho
	VueeYcAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tgJtm-00000008qwu-3iTb;
	Fri, 07 Feb 2025 08:39:43 +0000
Received: from mx1.tq-group.com ([93.104.207.81])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tgJr3-00000008qEz-2xPi
	for linux-arm-kernel@lists.infradead.org;
	Fri, 07 Feb 2025 08:36:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1738917415; x=1770453415;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Cohisc53PIngdtiEuKddzpfpUOAYLyd71oVKYWuoODo=;
  b=EFLUKublbHiO+rCtMaSxL4+9jjwy+CAoytCiL6CsKpKQngN8ZWFOR3o1
   JOZGloKVh1vJU9t8JRulhMyF3NPb6pZhw1LhMiH5wX5gT827eAHCnHdFg
   ETtk+ZJaAlZDgzMZQ4xRF3UE+qln4SCNtOkgUI54tARh8BafL3SaJ8ybG
   5zNoNqItWaj9r8A295JCJeRMu5qqNLnuEN6XNEWTgigFfr7LQVIfZ+xP2
   9DrLXBxOP6JtZyP+ATFz6xngpMtPJ6eCwrOsHJp64ZDS4UHUMNz3notIy
   33K6+1ZmEk6I0iGTCl1BkQ0yNrfdV6IhK+AtZ8SMjpRs3VvRxF3N4sT4e
   Q==;
X-CSE-ConnectionGUID: EENx/bX8QuCOnQ9UWiMVVw==
X-CSE-MsgGUID: SOaYPm6BSvGKFA24Uq0bVg==
X-IronPort-AV: E=Sophos;i="6.13,266,1732575600"; 
   d="scan'208";a="41636069"
Received: from vmailcow01.tq-net.de ([10.150.86.48])
  by mx1.tq-group.com with ESMTP; 07 Feb 2025 09:36:31 +0100
X-CheckPoint: {67A5C60E-1B-8F72533B-EF5B5974}
X-MAIL-CPID: E05294FDD4142515796B62385014CE81_1
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 68995164DDA;
	Fri,  7 Feb 2025 09:36:25 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ew.tq-group.com;
	s=dkim; t=1738917386;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Cohisc53PIngdtiEuKddzpfpUOAYLyd71oVKYWuoODo=;
	b=ezGpVGzl/xjUJadO46srQmbebuHY9bFSt1a7eiIH+TrFVR3vfVtSgIxn8UBsrhETpVZ3ug
	xQpKvj32fRLVOYzd580v5MgQws5fadQYu7FYV3EWHkmmsZb1HzT0XwhGBR0TC3WXL2tV/s
	PLCr4DSiloE7CmzDCmzTFj/q6ad3PtHgMw21Fo+BfKlaT5wJ075vqvloGNNLFWXOPXH5My
	tuo+V+LWa7yrsPHsPH2psTWwRC+lquKEq3Va3MPN1l4XGoztqNdqOjUj8pr0AyLBnUEK+p
	aFmVBFlAhWdeX7R4TFz7IK1Ih6ctVz3nUAwp0nfGcfcnHxiNYu7XPAkZBDXtDQ==
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Cc: Alexander Stein <alexander.stein@ew.tq-group.com>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Frank Li <Frank.Li@nxp.com>
Subject: [PATCH v2 01/10] nvmem: imx-ocotp: Sort header alphabetically
Date: Fri,  7 Feb 2025 09:36:06 +0100
Message-Id: <20250207083616.1442887-2-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250207083616.1442887-1-alexander.stein@ew.tq-group.com>
References: <20250207083616.1442887-1-alexander.stein@ew.tq-group.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250207_003654_036358_5C7994F3 
X-CRM114-Status: GOOD (  11.61  )
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

Move linux/delay.h to the right position.

Reviewed-by: Frank Li <Frank.Li@nxp.com>
Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
 drivers/nvmem/imx-ocotp.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/nvmem/imx-ocotp.c b/drivers/nvmem/imx-ocotp.c
index 79dd4fda03295..c5086a16450ac 100644
--- a/drivers/nvmem/imx-ocotp.c
+++ b/drivers/nvmem/imx-ocotp.c
@@ -15,6 +15,7 @@
  */
 
 #include <linux/clk.h>
+#include <linux/delay.h>
 #include <linux/device.h>
 #include <linux/io.h>
 #include <linux/module.h>
@@ -22,7 +23,6 @@
 #include <linux/of.h>
 #include <linux/platform_device.h>
 #include <linux/slab.h>
-#include <linux/delay.h>
 
 #define IMX_OCOTP_OFFSET_B0W0		0x400 /* Offset from base address of the
 					       * OTP Bank0 Word0
-- 
2.34.1


