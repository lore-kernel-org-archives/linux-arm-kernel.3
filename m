Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 481F2C02198
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Feb 2025 06:31:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LohDz1eP1+TlmpfNSbH5KZR78QndI8A09SSMYEkIlg8=; b=Iv/RpN3tMsNKJdpHx2tSOrTupt
	+Y+cHIKYelGVGXRUZM24fhSfu02hNk9cQqHuqpMIvf0emRyC+1ctIKdkEIgF/e63NP3FbLXYm2kLL
	hJS3f3aBb+IM0TzsDdCw6nC95v/tAu4aiCCzr9fgpimK546T5GhpPtyZqcVRPRMaRzipRbIdKhidr
	GD8yZU6C43utsHiT33coq0QseZgdTf5CFmBqQG+v6bCeece/Fdmc7V3PLCEeCNKLMbqgVfo39/ueH
	ICTvBsVb/S/0GsXwo4pUmKV9VBmSujL6Rv+/jtI3+Yt9Bf14td26kCJFbY19zcWUjx6JCJB2PeOZx
	1ci+Zj2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tipEi-0000000DpbQ-2bFY;
	Fri, 14 Feb 2025 06:31:40 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tipDG-0000000DpNQ-3QNl
	for linux-arm-kernel@lists.infradead.org;
	Fri, 14 Feb 2025 06:30:12 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <mfe@pengutronix.de>)
	id 1tipDB-0006zp-I1; Fri, 14 Feb 2025 07:30:05 +0100
Received: from pty.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::c5])
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <mfe@pengutronix.de>)
	id 1tipDB-000s8w-0M;
	Fri, 14 Feb 2025 07:30:05 +0100
Received: from mfe by pty.whiteo.stw.pengutronix.de with local (Exim 4.96)
	(envelope-from <mfe@pengutronix.de>)
	id 1tipDB-00EbY2-01;
	Fri, 14 Feb 2025 07:30:05 +0100
Date: Fri, 14 Feb 2025 07:30:04 +0100
From: Marco Felsch <m.felsch@pengutronix.de>
To: Peng Fan <peng.fan@oss.nxp.com>
Cc: shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
	festevam@gmail.com, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, marex@denx.de,
	Peng Fan <peng.fan@nxp.com>
Subject: Re: [PATCH V3] soc: imx8m: Unregister cpufreq and soc dev in cleanup
 path
Message-ID: <20250214063004.jvz5vukaxszcucd7@pengutronix.de>
References: <20241219145029.1776006-1-peng.fan@oss.nxp.com>
 <20250214034923.GA20275@localhost.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250214034923.GA20275@localhost.localdomain>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: mfe@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-arm-kernel@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250213_223010_870687_D49F5F73 
X-CRM114-Status: GOOD (  21.64  )
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

Hi Peng,

On 25-02-14, Peng Fan wrote:
> Hi Shawn,
> 
> On Thu, Dec 19, 2024 at 10:50:29PM +0800, Peng Fan (OSS) wrote:
> >From: Peng Fan <peng.fan@nxp.com>
> >
> >Unregister the cpufreq device and soc device when resource unwinding,
> >otherwise there will be warning when do removing test:
> >sysfs: cannot create duplicate filename '/devices/platform/imx-cpufreq-dt'
> >CPU: 0 UID: 0 PID: 1 Comm: swapper/0 Not tainted 6.13.0-rc1-next-20241204
> >Hardware name: NXP i.MX8MPlus EVK board (DT)
> >
> >Fixes: 9cc832d37799 ("soc: imx8m: Probe the SoC driver as platform driver")
> >Cc: Marco Felsch <m.felsch@pengutronix.de>
> >Signed-off-by: Peng Fan <peng.fan@nxp.com>
> >---
> 
> Any comments?
> 
> Thanks,
> Peng
> 
> >
> >V3:
> > Per Marco, drop remove function, use devm_add_action and update the patch
> > title accordingly.
> >
> >V2:
> > Add err check when create the cpufreq platform device
> > https://lore.kernel.org/all/20241217015826.1374497-1-peng.fan@oss.nxp.com/

This is got lost. Albeit platform_device_unregister() can handle
IS_ERROR() cases I don't like the fact that we do not return the error
if there is any during probe. Please see below.

> >
> > drivers/soc/imx/soc-imx8m.c | 23 +++++++++++++++++++++--
> > 1 file changed, 21 insertions(+), 2 deletions(-)
> >
> >diff --git a/drivers/soc/imx/soc-imx8m.c b/drivers/soc/imx/soc-imx8m.c
> >index 8ac7658e3d52..585631b7ae44 100644
> >--- a/drivers/soc/imx/soc-imx8m.c
> >+++ b/drivers/soc/imx/soc-imx8m.c
> >@@ -192,9 +192,20 @@ static __maybe_unused const struct of_device_id imx8_soc_match[] = {
> > 	devm_kasprintf((dev), GFP_KERNEL, "%d.%d", ((soc_rev) >> 4) & 0xf, (soc_rev) & 0xf) : \
> > 	"unknown"
> > 
> >+static void imx8m_unregister_soc(void *data)
> >+{
> >+	soc_device_unregister(data);
> >+}
> >+
> >+static void imx8m_unregister_cpufreq(void *data)
> >+{
> >+	platform_device_unregister(data);
> >+}
> >+
> > static int imx8m_soc_probe(struct platform_device *pdev)
> > {
> > 	struct soc_device_attribute *soc_dev_attr;
> >+	struct platform_device *cpufreq_dev;
> > 	const struct imx8_soc_data *data;
> > 	struct device *dev = &pdev->dev;
> > 	const struct of_device_id *id;
> >@@ -239,11 +250,19 @@ static int imx8m_soc_probe(struct platform_device *pdev)
> > 	if (IS_ERR(soc_dev))
> > 		return PTR_ERR(soc_dev);
> > 
> >+	ret = devm_add_action(dev, imx8m_unregister_soc, soc_dev);
> >+	if (ret)
> >+		return ret;
> >+
> > 	pr_info("SoC: %s revision %s\n", soc_dev_attr->soc_id,
> > 		soc_dev_attr->revision);
> > 
> >-	if (IS_ENABLED(CONFIG_ARM_IMX_CPUFREQ_DT))
> >-		platform_device_register_simple("imx-cpufreq-dt", -1, NULL, 0);
> >+	if (IS_ENABLED(CONFIG_ARM_IMX_CPUFREQ_DT)) {
> >+		cpufreq_dev = platform_device_register_simple("imx-cpufreq-dt", -1, NULL, 0);
		if (IS_ERROR(cpufreq_dev))
			return dev_err_probe(dev, "Failed to imx-cpufreq-dev device\n",
					     PTR_ERR(cpufreq_dev));

Regards,
  Marco

> >+		ret = devm_add_action(dev, imx8m_unregister_cpufreq, cpufreq_dev);
> >+		if (ret)
> >+			return ret;
> >+	}
> > 
> > 	return 0;
> > }
> >-- 
> >2.37.1
> >
> >
> 

