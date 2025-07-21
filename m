Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DBB51C83F1A
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 21 Jul 2025 02:29:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/SPGnKt7ZomSM6P7QHvQ2bE89lggp4fQ/ZKyTPGX6IA=; b=pWaul9SSe+VuzKa8XIB0MRS/Hz
	yYUaGDjP1iBapGeIvLqYmLQeGW8lEYo3FZ5SDB/dRUoY04rsR55U8mmIKlrfRpE7sVtNunz36Umeu
	zKEHyjyCYVsMstyDKYn4JOCriuJcwUwfoRQCIxnR9kQmPFArcdepUK7dhHOELZVnptLU+jlRXTqet
	Xwi1VPVpE9YgnmAfbgIqDMCJ2rssZwPn1IJ6MeJkVZc+0hYDrAeN216BvQ2MNId6cL+UW+BGT03xm
	fOmFRlIp4lO5ixlUo+o2Ib74GonJT1icbSqXD5+WFPqHfln0iTw0egvQ4kdHG/UeDHsHgFSV0ts1t
	a9/qvNyg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1udgHE-0000000G0D1-1dNe;
	Mon, 21 Jul 2025 02:29:16 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1udgE4-0000000Fza7-3M4S;
	Mon, 21 Jul 2025 02:26:02 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 00468A527D3;
	Mon, 21 Jul 2025 02:26:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2F9BCC4CEE7;
	Mon, 21 Jul 2025 02:25:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753064759;
	bh=UdaRAhokbN4SPSUkNrG/50YNHIzHEKKeFyrZJ7S/C08=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=OPmFrSoHyf9rL/rcC6VNtWWyGuoSvlAzKSz3yG25hB8G/+zj3/rWEG6TOZY3l+9d8
	 bh+0Y/iBPuiTGVTqPGth6QP4qBcDEDxwsHSYkQOX2J1kNvwGghqNMqM/qS9lTQSCPX
	 45fyCF4VAUpzfe3tzqtVWazweJDP8my5uDg7vS8vaKV1izjoyjlq73qtBktrSJrFVU
	 MsOMQ2Pm/iRmBZQp8KIjl4aboyp2bzns+Hwvg18tXbfqTNSChEjVnUgspDObof3TiS
	 stQszLv0nGUDs6wHluP7XlB5UYwipzAv4OfzktUmtK96ZUmCJRjsrseWSV9ZUF+R2r
	 T+J9wZkmLlCGw==
Date: Mon, 21 Jul 2025 10:25:53 +0800
From: "Peter Chen (CIX)" <peter.chen@kernel.org>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Pawel Laszczak <pawell@cadence.com>, Roger Quadros <rogerq@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Michal Simek <michal.simek@amd.com>,
	Chunfeng Yun <chunfeng.yun@mediatek.com>,
	Mathias Nyman <mathias.nyman@intel.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Bastien Nocera <hadess@hadess.net>, Bin Liu <b-liu@ti.com>,
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, linux-tegra@vger.kernel.org,
	linux-omap@vger.kernel.org
Subject: Re: [PATCH 67/80] usb: Remove redundant pm_runtime_mark_last_busy()
 calls
Message-ID: <20250721022553.GB299578@nchen-desktop>
References: <20250704075225.3212486-1-sakari.ailus@linux.intel.com>
 <20250704075453.3222311-1-sakari.ailus@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250704075453.3222311-1-sakari.ailus@linux.intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250720_192600_973106_D8609977 
X-CRM114-Status: GOOD (  23.34  )
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

On 25-07-04 10:54:53, Sakari Ailus wrote:
> pm_runtime_put_autosuspend(), pm_runtime_put_sync_autosuspend(),
> pm_runtime_autosuspend() and pm_request_autosuspend() now include a call
> to pm_runtime_mark_last_busy(). Remove the now-reduntant explicit call to
> pm_runtime_mark_last_busy().
> 
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>

For chipidea and cdns3 parts:

Acked-by: Peter Chen <peter.chen@kernel.org>

Peter
> ---
> The cover letter of the set can be found here
> <URL:https://lore.kernel.org/linux-pm/20250704075225.3212486-1-sakari.ailus@linux.intel.com>.
> 
> In brief, this patch depends on PM runtime patches adding marking the last
> busy timestamp in autosuspend related functions. The patches are here, on
> rc2:
> 
>         git://git.kernel.org/pub/scm/linux/kernel/git/rafael/linux-pm.git \
>                 pm-runtime-6.17-rc1
> 
>  drivers/usb/cdns3/cdns3-gadget.c            | 1 -
>  drivers/usb/cdns3/cdnsp-gadget.c            | 1 -
>  drivers/usb/chipidea/core.c                 | 1 -
>  drivers/usb/chipidea/otg_fsm.c              | 1 -
>  drivers/usb/dwc3/core.c                     | 2 --
>  drivers/usb/dwc3/dwc3-am62.c                | 1 -
>  drivers/usb/dwc3/dwc3-imx8mp.c              | 1 -
>  drivers/usb/dwc3/dwc3-pci.c                 | 1 -
>  drivers/usb/dwc3/dwc3-xilinx.c              | 1 -
>  drivers/usb/gadget/udc/cdns2/cdns2-gadget.c | 1 -
>  drivers/usb/host/xhci-mtk.c                 | 1 -
>  drivers/usb/host/xhci-tegra.c               | 1 -
>  drivers/usb/misc/apple-mfi-fastcharge.c     | 1 -
>  drivers/usb/mtu3/mtu3_plat.c                | 1 -
>  drivers/usb/musb/musb_core.c                | 5 -----
>  drivers/usb/musb/musb_debugfs.c             | 5 -----
>  drivers/usb/musb/musb_dsps.c                | 1 -
>  drivers/usb/musb/musb_gadget.c              | 4 ----
>  drivers/usb/musb/omap2430.c                 | 1 -
>  19 files changed, 31 deletions(-)
> 
> diff --git a/drivers/usb/cdns3/cdns3-gadget.c b/drivers/usb/cdns3/cdns3-gadget.c
> index d9d8dc05b235..168707213ed9 100644
> --- a/drivers/usb/cdns3/cdns3-gadget.c
> +++ b/drivers/usb/cdns3/cdns3-gadget.c
> @@ -3251,7 +3251,6 @@ static void cdns3_gadget_exit(struct cdns *cdns)
>  	priv_dev = cdns->gadget_dev;
>  
>  
> -	pm_runtime_mark_last_busy(cdns->dev);
>  	pm_runtime_put_autosuspend(cdns->dev);
>  
>  	usb_del_gadget(&priv_dev->gadget);
> diff --git a/drivers/usb/cdns3/cdnsp-gadget.c b/drivers/usb/cdns3/cdnsp-gadget.c
> index 55f95f41b3b4..2ffe24a6e477 100644
> --- a/drivers/usb/cdns3/cdnsp-gadget.c
> +++ b/drivers/usb/cdns3/cdnsp-gadget.c
> @@ -1996,7 +1996,6 @@ static void cdnsp_gadget_exit(struct cdns *cdns)
>  	struct cdnsp_device *pdev = cdns->gadget_dev;
>  
>  	devm_free_irq(pdev->dev, cdns->dev_irq, pdev);
> -	pm_runtime_mark_last_busy(cdns->dev);
>  	pm_runtime_put_autosuspend(cdns->dev);
>  	usb_del_gadget_udc(&pdev->gadget);
>  	cdnsp_gadget_free_endpoints(pdev);
> diff --git a/drivers/usb/chipidea/core.c b/drivers/usb/chipidea/core.c
> index 694b4a8e4e1d..a6ce73dcc871 100644
> --- a/drivers/usb/chipidea/core.c
> +++ b/drivers/usb/chipidea/core.c
> @@ -1372,7 +1372,6 @@ static int ci_controller_resume(struct device *dev)
>  	ci->in_lpm = false;
>  	if (ci->wakeup_int) {
>  		ci->wakeup_int = false;
> -		pm_runtime_mark_last_busy(ci->dev);
>  		pm_runtime_put_autosuspend(ci->dev);
>  		enable_irq(ci->irq);
>  		if (ci_otg_is_fsm_mode(ci))
> diff --git a/drivers/usb/chipidea/otg_fsm.c b/drivers/usb/chipidea/otg_fsm.c
> index a093544482d5..929536dc96ec 100644
> --- a/drivers/usb/chipidea/otg_fsm.c
> +++ b/drivers/usb/chipidea/otg_fsm.c
> @@ -629,7 +629,6 @@ int ci_otg_fsm_work(struct ci_hdrc *ci)
>  				ci_otg_queue_work(ci);
>  			}
>  		} else if (ci->fsm.otg->state == OTG_STATE_A_HOST) {
> -			pm_runtime_mark_last_busy(ci->dev);
>  			pm_runtime_put_autosuspend(ci->dev);
>  			return 0;
>  		}
> diff --git a/drivers/usb/dwc3/core.c b/drivers/usb/dwc3/core.c
> index 8002c23a5a02..77b309ebd704 100644
> --- a/drivers/usb/dwc3/core.c
> +++ b/drivers/usb/dwc3/core.c
> @@ -279,7 +279,6 @@ static void __dwc3_set_mode(struct work_struct *work)
>  	}
>  
>  out:
> -	pm_runtime_mark_last_busy(dwc->dev);
>  	pm_runtime_put_autosuspend(dwc->dev);
>  	mutex_unlock(&dwc->mutex);
>  }
> @@ -2642,7 +2641,6 @@ int dwc3_runtime_idle(struct dwc3 *dwc)
>  		break;
>  	}
>  
> -	pm_runtime_mark_last_busy(dev);
>  	pm_runtime_autosuspend(dev);
>  
>  	return 0;
> diff --git a/drivers/usb/dwc3/dwc3-am62.c b/drivers/usb/dwc3/dwc3-am62.c
> index 9db8f3ca493d..e11d7643f966 100644
> --- a/drivers/usb/dwc3/dwc3-am62.c
> +++ b/drivers/usb/dwc3/dwc3-am62.c
> @@ -292,7 +292,6 @@ static int dwc3_ti_probe(struct platform_device *pdev)
>  	/* Setting up autosuspend */
>  	pm_runtime_set_autosuspend_delay(dev, DWC3_AM62_AUTOSUSPEND_DELAY);
>  	pm_runtime_use_autosuspend(dev);
> -	pm_runtime_mark_last_busy(dev);
>  	pm_runtime_put_autosuspend(dev);
>  	return 0;
>  
> diff --git a/drivers/usb/dwc3/dwc3-imx8mp.c b/drivers/usb/dwc3/dwc3-imx8mp.c
> index 3edc5aca76f9..37700d95bc09 100644
> --- a/drivers/usb/dwc3/dwc3-imx8mp.c
> +++ b/drivers/usb/dwc3/dwc3-imx8mp.c
> @@ -307,7 +307,6 @@ static int dwc3_imx8mp_resume(struct dwc3_imx8mp *dwc3_imx, pm_message_t msg)
>  	if (dwc3_imx->wakeup_pending) {
>  		dwc3_imx->wakeup_pending = false;
>  		if (dwc->current_dr_role == DWC3_GCTL_PRTCAP_DEVICE) {
> -			pm_runtime_mark_last_busy(dwc->dev);
>  			pm_runtime_put_autosuspend(dwc->dev);
>  		} else {
>  			/*
> diff --git a/drivers/usb/dwc3/dwc3-pci.c b/drivers/usb/dwc3/dwc3-pci.c
> index 54a4ee2b90b7..07dfa0b5d184 100644
> --- a/drivers/usb/dwc3/dwc3-pci.c
> +++ b/drivers/usb/dwc3/dwc3-pci.c
> @@ -321,7 +321,6 @@ static void dwc3_pci_resume_work(struct work_struct *work)
>  		return;
>  	}
>  
> -	pm_runtime_mark_last_busy(&dwc3->dev);
>  	pm_runtime_put_sync_autosuspend(&dwc3->dev);
>  }
>  #endif
> diff --git a/drivers/usb/dwc3/dwc3-xilinx.c b/drivers/usb/dwc3/dwc3-xilinx.c
> index 1e28d6f50ed0..0a8c47876ff9 100644
> --- a/drivers/usb/dwc3/dwc3-xilinx.c
> +++ b/drivers/usb/dwc3/dwc3-xilinx.c
> @@ -383,7 +383,6 @@ static int __maybe_unused dwc3_xlnx_runtime_resume(struct device *dev)
>  
>  static int __maybe_unused dwc3_xlnx_runtime_idle(struct device *dev)
>  {
> -	pm_runtime_mark_last_busy(dev);
>  	pm_runtime_autosuspend(dev);
>  
>  	return 0;
> diff --git a/drivers/usb/gadget/udc/cdns2/cdns2-gadget.c b/drivers/usb/gadget/udc/cdns2/cdns2-gadget.c
> index 7e69944ef18a..9b53daf76583 100644
> --- a/drivers/usb/gadget/udc/cdns2/cdns2-gadget.c
> +++ b/drivers/usb/gadget/udc/cdns2/cdns2-gadget.c
> @@ -2415,7 +2415,6 @@ int cdns2_gadget_resume(struct cdns2_device *pdev, bool hibernated)
>  
>  void cdns2_gadget_remove(struct cdns2_device *pdev)
>  {
> -	pm_runtime_mark_last_busy(pdev->dev);
>  	pm_runtime_put_autosuspend(pdev->dev);
>  
>  	usb_del_gadget(&pdev->gadget);
> diff --git a/drivers/usb/host/xhci-mtk.c b/drivers/usb/host/xhci-mtk.c
> index 208558cf822d..06043c7c3100 100644
> --- a/drivers/usb/host/xhci-mtk.c
> +++ b/drivers/usb/host/xhci-mtk.c
> @@ -670,7 +670,6 @@ static int xhci_mtk_probe(struct platform_device *pdev)
>  	}
>  
>  	device_enable_async_suspend(dev);
> -	pm_runtime_mark_last_busy(dev);
>  	pm_runtime_put_autosuspend(dev);
>  	pm_runtime_forbid(dev);
>  
> diff --git a/drivers/usb/host/xhci-tegra.c b/drivers/usb/host/xhci-tegra.c
> index 0c7af44d4dae..554b03e3ae92 100644
> --- a/drivers/usb/host/xhci-tegra.c
> +++ b/drivers/usb/host/xhci-tegra.c
> @@ -1394,7 +1394,6 @@ static void tegra_xhci_id_work(struct work_struct *work)
>  		}
>  
>  		tegra_xhci_set_port_power(tegra, true, true);
> -		pm_runtime_mark_last_busy(tegra->dev);
>  
>  	} else {
>  		if (tegra->otg_usb3_port >= 0)
> diff --git a/drivers/usb/misc/apple-mfi-fastcharge.c b/drivers/usb/misc/apple-mfi-fastcharge.c
> index 8e852f4b8262..47b38dcc2992 100644
> --- a/drivers/usb/misc/apple-mfi-fastcharge.c
> +++ b/drivers/usb/misc/apple-mfi-fastcharge.c
> @@ -134,7 +134,6 @@ static int apple_mfi_fc_set_property(struct power_supply *psy,
>  		ret = -EINVAL;
>  	}
>  
> -	pm_runtime_mark_last_busy(&mfi->udev->dev);
>  	pm_runtime_put_autosuspend(&mfi->udev->dev);
>  
>  	return ret;
> diff --git a/drivers/usb/mtu3/mtu3_plat.c b/drivers/usb/mtu3/mtu3_plat.c
> index 7b5a431acb56..cc8a864dbd63 100644
> --- a/drivers/usb/mtu3/mtu3_plat.c
> +++ b/drivers/usb/mtu3/mtu3_plat.c
> @@ -431,7 +431,6 @@ static int mtu3_probe(struct platform_device *pdev)
>  	}
>  
>  	device_enable_async_suspend(dev);
> -	pm_runtime_mark_last_busy(dev);
>  	pm_runtime_put_autosuspend(dev);
>  	pm_runtime_forbid(dev);
>  
> diff --git a/drivers/usb/musb/musb_core.c b/drivers/usb/musb/musb_core.c
> index c7234b236971..0acc62569ae5 100644
> --- a/drivers/usb/musb/musb_core.c
> +++ b/drivers/usb/musb/musb_core.c
> @@ -2031,7 +2031,6 @@ static void musb_pm_runtime_check_session(struct musb *musb)
>  		if (!musb->session)
>  			break;
>  		trace_musb_state(musb, devctl, "Allow PM on possible host mode disconnect");
> -		pm_runtime_mark_last_busy(musb->controller);
>  		pm_runtime_put_autosuspend(musb->controller);
>  		musb->session = false;
>  		return;
> @@ -2063,7 +2062,6 @@ static void musb_pm_runtime_check_session(struct musb *musb)
>  					      msecs_to_jiffies(3000));
>  	} else {
>  		trace_musb_state(musb, devctl, "Allow PM with no session");
> -		pm_runtime_mark_last_busy(musb->controller);
>  		pm_runtime_put_autosuspend(musb->controller);
>  	}
>  
> @@ -2090,7 +2088,6 @@ static void musb_irq_work(struct work_struct *data)
>  		sysfs_notify(&musb->controller->kobj, NULL, "mode");
>  	}
>  
> -	pm_runtime_mark_last_busy(musb->controller);
>  	pm_runtime_put_autosuspend(musb->controller);
>  }
>  
> @@ -2564,7 +2561,6 @@ musb_init_controller(struct device *dev, int nIrq, void __iomem *ctrl)
>  	musb_init_debugfs(musb);
>  
>  	musb->is_initialized = 1;
> -	pm_runtime_mark_last_busy(musb->controller);
>  	pm_runtime_put_autosuspend(musb->controller);
>  
>  	return 0;
> @@ -2887,7 +2883,6 @@ static int musb_resume(struct device *dev)
>  			error);
>  	spin_unlock_irqrestore(&musb->lock, flags);
>  
> -	pm_runtime_mark_last_busy(dev);
>  	pm_runtime_put_autosuspend(dev);
>  
>  	return 0;
> diff --git a/drivers/usb/musb/musb_debugfs.c b/drivers/usb/musb/musb_debugfs.c
> index 2d623284edf6..5092d62c2062 100644
> --- a/drivers/usb/musb/musb_debugfs.c
> +++ b/drivers/usb/musb/musb_debugfs.c
> @@ -106,7 +106,6 @@ static int musb_regdump_show(struct seq_file *s, void *unused)
>  		}
>  	}
>  
> -	pm_runtime_mark_last_busy(musb->controller);
>  	pm_runtime_put_autosuspend(musb->controller);
>  	return 0;
>  }
> @@ -119,7 +118,6 @@ static int musb_test_mode_show(struct seq_file *s, void *unused)
>  
>  	pm_runtime_get_sync(musb->controller);
>  	test = musb_readb(musb->mregs, MUSB_TESTMODE);
> -	pm_runtime_mark_last_busy(musb->controller);
>  	pm_runtime_put_autosuspend(musb->controller);
>  
>  	if (test == (MUSB_TEST_FORCE_HOST | MUSB_TEST_FORCE_FS))
> @@ -216,7 +214,6 @@ static ssize_t musb_test_mode_write(struct file *file,
>  	musb_writeb(musb->mregs, MUSB_TESTMODE, test);
>  
>  ret:
> -	pm_runtime_mark_last_busy(musb->controller);
>  	pm_runtime_put_autosuspend(musb->controller);
>  	return count;
>  }
> @@ -243,7 +240,6 @@ static int musb_softconnect_show(struct seq_file *s, void *unused)
>  		reg = musb_readb(musb->mregs, MUSB_DEVCTL);
>  		connect = reg & MUSB_DEVCTL_SESSION ? 1 : 0;
>  
> -		pm_runtime_mark_last_busy(musb->controller);
>  		pm_runtime_put_autosuspend(musb->controller);
>  		break;
>  	default:
> @@ -304,7 +300,6 @@ static ssize_t musb_softconnect_write(struct file *file,
>  		}
>  	}
>  
> -	pm_runtime_mark_last_busy(musb->controller);
>  	pm_runtime_put_autosuspend(musb->controller);
>  	return count;
>  }
> diff --git a/drivers/usb/musb/musb_dsps.c b/drivers/usb/musb/musb_dsps.c
> index 12f587ab8511..9f93ed59a7e6 100644
> --- a/drivers/usb/musb/musb_dsps.c
> +++ b/drivers/usb/musb/musb_dsps.c
> @@ -296,7 +296,6 @@ static void otg_timer(struct timer_list *t)
>  	if (err < 0)
>  		dev_err(dev, "%s resume work: %i\n", __func__, err);
>  	spin_unlock_irqrestore(&musb->lock, flags);
> -	pm_runtime_mark_last_busy(dev);
>  	pm_runtime_put_autosuspend(dev);
>  }
>  
> diff --git a/drivers/usb/musb/musb_gadget.c b/drivers/usb/musb/musb_gadget.c
> index 6869c58367f2..f6ea91df80e4 100644
> --- a/drivers/usb/musb/musb_gadget.c
> +++ b/drivers/usb/musb/musb_gadget.c
> @@ -1258,7 +1258,6 @@ static int musb_gadget_queue(struct usb_ep *ep, struct usb_request *req,
>  
>  unlock:
>  	spin_unlock_irqrestore(&musb->lock, lockflags);
> -	pm_runtime_mark_last_busy(musb->controller);
>  	pm_runtime_put_autosuspend(musb->controller);
>  
>  	return status;
> @@ -1642,7 +1641,6 @@ static void musb_gadget_work(struct work_struct *work)
>  	spin_lock_irqsave(&musb->lock, flags);
>  	musb_pullup(musb, musb->softconnect);
>  	spin_unlock_irqrestore(&musb->lock, flags);
> -	pm_runtime_mark_last_busy(musb->controller);
>  	pm_runtime_put_autosuspend(musb->controller);
>  }
>  
> @@ -1862,7 +1860,6 @@ static int musb_gadget_start(struct usb_gadget *g,
>  	if (musb->xceiv && musb->xceiv->last_event == USB_EVENT_ID)
>  		musb_platform_set_vbus(musb, 1);
>  
> -	pm_runtime_mark_last_busy(musb->controller);
>  	pm_runtime_put_autosuspend(musb->controller);
>  
>  	return 0;
> @@ -1915,7 +1912,6 @@ static int musb_gadget_stop(struct usb_gadget *g)
>  	 */
>  
>  	/* Force check of devctl register for PM runtime */
> -	pm_runtime_mark_last_busy(musb->controller);
>  	pm_runtime_put_autosuspend(musb->controller);
>  
>  	return 0;
> diff --git a/drivers/usb/musb/omap2430.c b/drivers/usb/musb/omap2430.c
> index 2970967a4fd2..191901317d7f 100644
> --- a/drivers/usb/musb/omap2430.c
> +++ b/drivers/usb/musb/omap2430.c
> @@ -151,7 +151,6 @@ static void omap_musb_set_mailbox(struct omap2430_glue *glue)
>  	default:
>  		dev_dbg(musb->controller, "ID float\n");
>  	}
> -	pm_runtime_mark_last_busy(musb->controller);
>  	pm_runtime_put_autosuspend(musb->controller);
>  	atomic_notifier_call_chain(&musb->xceiv->notifier,
>  			musb->xceiv->last_event, NULL);
> -- 
> 2.39.5
> 

-- 

Best regards,
Peter

