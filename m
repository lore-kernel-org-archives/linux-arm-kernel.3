Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F38FBCD13DE
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 30 Apr 2026 16:40:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vSLKw/EEYLKveE2xBfEMTup8/azVODA4pMSSclWxodw=; b=0zMM6Bzafq3bX4CTPZY59/gkDz
	4+MPdLFs1N9gSJJE0kG7kcEg2xNJU7T7T9/GB09hepMkFgrO8veaUkIOgeDxN3Oazqzag0m3lX2c/
	0fo+6KD8kz36RQ/3HwNP9Mv51FUE5bFONYr9uvJPoITZr0K1Ve2QAdJyYQFcLQrLmtgXVp5r86wNA
	0TPhAmZ2gz5Fgtaprl1HuEDdpaNdGDuDrR2Z8YFdsfGlCNTqQ8ECN+gXvMVZlxyoPANPXMauR/+HK
	3iu/frv5T+0HTcia1HF5Ou3ri0X06opJJQ3xF5RZLnoEPSoRB7FkrLy0KjQcHvdzugae9ynFOSLV0
	GyjQMisg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIUR9-00000005kFj-1ZX0;
	Thu, 30 Apr 2026 16:40:27 +0000
Received: from m16.mail.163.com ([117.135.210.5])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIUR4-00000005k9y-0FyA;
	Thu, 30 Apr 2026 16:40:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=vS
	LKw/EEYLKveE2xBfEMTup8/azVODA4pMSSclWxodw=; b=Q/S+pJtk04i9h8WuFE
	0fZEh0udPon40eNurFhhR91lmf3n6abGkbo05EE7IsBvBMImfPSM1HOebmu5nvE8
	HspkYhLaZk/lKGsSlqpTTe4nQTvnNevpd7l6/gXCIa8S8DAhL7zQTjFEyKVc9rKJ
	9XVZ5iVvH92Xg7BBBfyXSZuxs=
Received: from zhb.. (unknown [])
	by gzga-smtp-mtada-g0-3 (Coremail) with SMTP id _____wDnUmm+hfNptZrZCg--.19910S3;
	Fri, 01 May 2026 00:39:27 +0800 (CST)
From: Hans Zhang <18255117159@163.com>
To: Thinh.Nguyen@synopsys.com,
	gregkh@linuxfoundation.org,
	peter.griffin@linaro.org,
	andre.draszik@linaro.org,
	tudor.ambarus@linaro.org,
	mathias.nyman@intel.com,
	chunfeng.yun@mediatek.com,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	badhri@google.com,
	heikki.krogerus@linux.intel.com
Cc: linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	Hans Zhang <18255117159@163.com>
Subject: [PATCH 1/6] usb: dwc3: Use FIELD_MODIFY()
Date: Fri,  1 May 2026 00:39:14 +0800
Message-Id: <20260430163919.47372-2-18255117159@163.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260430163919.47372-1-18255117159@163.com>
References: <20260430163919.47372-1-18255117159@163.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: _____wDnUmm+hfNptZrZCg--.19910S3
X-Coremail-Antispam: 1Uf129KBjvJXoW7urW7uF4xtFW5Xryktr4ruFg_yoW8XrW7pr
	y8tr1a9an3t3WfA3s3WF4jyF1Yq348tryIga47twnrZwn8CrWUWFZxGFy5XF1UJasagFyU
	Wa1xtry5GFZFgaDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0piXAw-UUUUU=
X-Originating-IP: [240e:b8f:927e:5900:c497:d540:b00d:97f4]
X-CM-SenderInfo: rpryjkyvrrlimvzbiqqrwthudrp/xtbCxADojGnzhcDnvgAA3m
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260430_094022_988441_826EF7EB 
X-CRM114-Status: UNSURE (   7.68  )
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

Use FIELD_MODIFY() to remove open-coded bit manipulation.
No functional change intended.

Signed-off-by: Hans Zhang <18255117159@163.com>
---
 drivers/usb/dwc3/core.c | 12 ++++--------
 1 file changed, 4 insertions(+), 8 deletions(-)

diff --git a/drivers/usb/dwc3/core.c b/drivers/usb/dwc3/core.c
index 58899b1fa96d..f95201470ab2 100644
--- a/drivers/usb/dwc3/core.c
+++ b/drivers/usb/dwc3/core.c
@@ -425,8 +425,7 @@ static void dwc3_ref_clk_period(struct dwc3 *dwc)
 	}
 
 	reg = dwc3_readl(dwc, DWC3_GUCTL);
-	reg &= ~DWC3_GUCTL_REFCLKPER_MASK;
-	reg |=  FIELD_PREP(DWC3_GUCTL_REFCLKPER_MASK, period);
+	FIELD_MODIFY(DWC3_GUCTL_REFCLKPER_MASK, &reg, period);
 	dwc3_writel(dwc, DWC3_GUCTL, reg);
 
 	if (DWC3_VER_IS_PRIOR(DWC3, 250A))
@@ -456,12 +455,9 @@ static void dwc3_ref_clk_period(struct dwc3 *dwc)
 	decr = 480000000 / rate;
 
 	reg = dwc3_readl(dwc, DWC3_GFLADJ);
-	reg &= ~DWC3_GFLADJ_REFCLK_FLADJ_MASK
-	    &  ~DWC3_GFLADJ_240MHZDECR
-	    &  ~DWC3_GFLADJ_240MHZDECR_PLS1;
-	reg |= FIELD_PREP(DWC3_GFLADJ_REFCLK_FLADJ_MASK, fladj)
-	    |  FIELD_PREP(DWC3_GFLADJ_240MHZDECR, decr >> 1)
-	    |  FIELD_PREP(DWC3_GFLADJ_240MHZDECR_PLS1, decr & 1);
+	FIELD_MODIFY(DWC3_GFLADJ_REFCLK_FLADJ_MASK, &reg, fladj);
+	FIELD_MODIFY(DWC3_GFLADJ_240MHZDECR, &reg, decr >> 1);
+	FIELD_MODIFY(DWC3_GFLADJ_240MHZDECR_PLS1, &reg, decr & 1);
 
 	if (dwc->gfladj_refclk_lpm_sel)
 		reg |=  DWC3_GFLADJ_REFCLK_LPM_SEL;
-- 
2.34.1


