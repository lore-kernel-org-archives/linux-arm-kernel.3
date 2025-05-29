Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76867C54FB3
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 29 May 2025 20:19:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=feoDuyj3wm8ANzQm10okhE/r2LfgWDr6a+GGqveBvZg=; b=P+t08+i74KWsiUYIkhIHYgUEK/
	EyUHc7SX6k/HrNtTBPutYkltUWu1UyMO0RO/xVF6ECSiZEj39NyQqNR4/NgIp05RRGodtUCqRa0KX
	Gn0FuG5S+lq4waRHGEITH6djbnD0P+KTtEl0BgEFOhZduE0OZmJFBUZ3yKS0zbJR0WAnga/B+fsbt
	M5WlqDzpOmC29+ETPcmZmbXlg4Iohf2N6SPYdzm52xz7kTsWG+DAjaHEarjZUaO81pn6mTfKogxEU
	wKP8WHdaWjRSZYv8nrarIoi/aDk9rjw79RM2MGELGgL3VQ1tMk9McVFO27/oUIrhm+8H4yccaeowM
	v5NJZXhg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKjid-0000000GUI6-0rRz;
	Thu, 29 May 2025 20:19:15 +0000
Received: from mail-vs1-xe2f.google.com ([2607:f8b0:4864:20::e2f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKjfM-0000000GTzR-0CMT
	for linux-arm-kernel@lists.infradead.org;
	Thu, 29 May 2025 20:15:53 +0000
Received: by mail-vs1-xe2f.google.com with SMTP id ada2fe7eead31-4e45a626663so350048137.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 29 May 2025 13:15:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748549750; x=1749154550; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=feoDuyj3wm8ANzQm10okhE/r2LfgWDr6a+GGqveBvZg=;
        b=ciR+W81EJ9QsnxDctqckhEXUNg3yEApe03RAZU/oh4LnVeWPq+s+tcBcrOFGIpt4r/
         iS9N3GhqkEpBMecfFrdijUx3dEbSiDs2LqEA6h8mKs5X2ymu98yweAn+nMlPWtF5W1WM
         hMEUXzoLJLNg80mBMuSTQUomxEx4eRkPfBvBuclOywMujgG87aZ1to5KJ4ZdjudUHDLQ
         u1e55RQGUgPjTvXdMKPi96ongU8Mdm2LafCTibNUszRwchAapRv/meO4f+HWRctwCv2X
         VQw3tI4J9msqYD6x03q6uJwITx3x5jwvM3fB3B0L9kCgWjcwnhIRaJHnjMxnr05W6OCk
         rwwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748549750; x=1749154550;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=feoDuyj3wm8ANzQm10okhE/r2LfgWDr6a+GGqveBvZg=;
        b=DD6kf4HmGTu3ql8SDB3M0eDuzQXLDmGnTu0n3ul4IMGMKCYNgy7/yRMvsNx1IkQd9V
         hHrC72f0efTqbYEqoLyop+ampyOTS0t2HUF8f+RZM0GkszkRdXr49ooSSdHl9xTZtzlb
         P+23El67r8xlgEDTfQykrzREDzMaHW1hbjz+QmpFrrhGZzKB3elR0QuyU0TcNyEnIkcr
         1CR5/YSa4bu425wBLPG2En8wzCnoYoC8sovLgDzxGt4GUpjADsDgMTFE4+pJnJliSGDf
         2FSGlDyDFSWj3DFERB/bNXJmgTV/cZFhTabI5YhgEYuJEfqZxcNa/YIH2lEkT7K8uXoF
         IxBQ==
X-Forwarded-Encrypted: i=1; AJvYcCW26S6t8NP2u0mRJTr1Kk+1Q3ueWrlFvTIE8yGyR7Izk/jmaELxwsNxOM8yAvAdwdK5Zp7sduvyVanS5y1K3VUL@lists.infradead.org
X-Gm-Message-State: AOJu0Yx7hIrjPpf3EYHoE14H5MJktTWSasyUYvU7X19ATdicuoob6Wdn
	25fSbKBHOsFuF02rggwyCEurHSERTmYnYlfKcP0MTc/0AZdxVhUDgHP2
X-Gm-Gg: ASbGncsfDrOm+rKI6oKp5vrO8X0vKAMVEyY82eWGx7FCrRQc9EkZKQNaXCp72O3c88k
	KObvFDOWoOycEyWjg0UPTZt1Ea6+imk68V8ahE6mxEXryrRBvkuUrSsHrcqV1ijR8DgwXC0Gdjl
	gaAWntiXefNdXctShhKKuRaY2o2eB71C8bQmwbsp+ZoZQclUg4jDNsPsew1fSNHzqjx+Dehcwqm
	TcOmBvO7jenNwtReqdWUDuL4cSOgHcoq1iSGAgK/9pqdAuqbiVPd1GYq49VSZhftVM66gNKyUo9
	AW7zo/AyAeLaY5GM71XARgFyj7BO1b4bfakAlAuB6SJYMwjGOQ==
X-Google-Smtp-Source: AGHT+IGwAq3hjktBz6xGfJGBPKp4OnbEDRwsJ/PGkc5U8ZAIJddZqt/FeICNOUoTO2GiAb/IluXZUA==
X-Received: by 2002:a05:6102:441a:b0:4e2:eb32:247c with SMTP id ada2fe7eead31-4e6e40f719dmr1420185137.8.1748549750224;
        Thu, 29 May 2025 13:15:50 -0700 (PDT)
Received: from hiago-nb ([67.159.246.222])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-87e2a3b63besm1655803241.30.2025.05.29.13.15.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 May 2025 13:15:49 -0700 (PDT)
Date: Thu, 29 May 2025 17:15:44 -0300
From: Hiago De Franco <hiagofranco@gmail.com>
To: Peng Fan <peng.fan@nxp.com>
Cc: Ulf Hansson <ulf.hansson@linaro.org>,
	"Peng Fan (OSS)" <peng.fan@oss.nxp.com>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	"linux-pm@vger.kernel.org" <linux-pm@vger.kernel.org>,
	"linux-remoteproc@vger.kernel.org" <linux-remoteproc@vger.kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Bjorn Andersson <andersson@kernel.org>,
	Hiago De Franco <hiago.franco@toradex.com>,
	"imx@lists.linux.dev" <imx@lists.linux.dev>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	Daniel Baluta <daniel.baluta@nxp.com>,
	"Iuliana Prodan (OSS)" <iuliana.prodan@oss.nxp.com>,
	Fabio Estevam <festevam@gmail.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>
Subject: Re: [PATCH v2 3/3] remoteproc: imx_rproc: add power mode check for
 remote core attachment
Message-ID: <20250529201544.azoqdrgnlqfxi6mb@hiago-nb>
References: <20250521041840.GB28017@nxa18884-linux>
 <CAPDyKFpSb+KsfDr1-=uk4TF4Op1dUQ9rDwPP5sSpMfxDRDhnZA@mail.gmail.com>
 <20250523191713.nylhi74jq6z4hqmr@hiago-nb>
 <CAPDyKFq6HG6iTZRnBSN25vhCU8Zj1c+r_ufGbiBsJ16N+1bJVg@mail.gmail.com>
 <20250527000510.fofehmsdhifcwlys@hiago-nb>
 <20250527023921.GA14252@nxa18884-linux>
 <CAPDyKFqZkcaGfss=Oi+H9UERFU29jY2t5uTPnGVGQgSAJSeCoA@mail.gmail.com>
 <20250527134525.f7yzs4ww64xxmjmr@hiago-nb>
 <20250528173813.rxqu6pzqgu4m5joo@hiago-nb>
 <PAXPR04MB845941FFF347274012A0ECA88866A@PAXPR04MB8459.eurprd04.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <PAXPR04MB845941FFF347274012A0ECA88866A@PAXPR04MB8459.eurprd04.prod.outlook.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250529_131552_111662_22254647 
X-CRM114-Status: GOOD (  41.26  )
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

On Thu, May 29, 2025 at 03:54:47AM +0000, Peng Fan wrote:

[...]

> > We are making progress ;-)
> > 
> > With the patches you shared Ulf (I added them on top of the current
> > master branch), it works as expected, dev_pm_genpd_is_on() returns 0
> > when I boot the kernel without M4 running and it returns 1 when I
> > boot the kernel with M4 running with a hello-world demo.
> > 
> > However now I tried to, if dev_pm_genpd_is_on() returns 1, put the
> > DETACHED state, something as
> > 
> > if (dev_pm_genpd_is_on(priv->pd_list->pd_devs[0]))
> > 	priv->rproc->state = RPROC_DETACHED;
> > 
> > In this case I used 0 because I understand this is the
> > IMX_SC_R_M4_0_PID0 defined in my device tree overlay:
> > 
> > 		power-domains = <&pd IMX_SC_R_M4_0_PID0>,
> > 				<&pd IMX_SC_R_M4_0_MU_1A>;
> > 
> > But in this case, the kernel does not boot anymore, I see the "Starting
> > kernel..." and nothing else.
> 
> Please add "earlycon" in bootargs to see where it hangs.

Thanks Peng! I was able to catch the kernel panic yesterday, however I
must say that today I was doing the tests again and the issue is gone.
Sorry, I might have done something wrong yesterday with the tests.
Anyway, here is the log:

[    1.271163] remoteproc remoteproc0: imx-rproc is available
[    1.280296] remoteproc remoteproc0: attaching to imx-rproc
[    1.285756] Unable to handle kernel paging request at virtual address ffff80005ae3dd79
[    1.293624] Mem abort info:
[    1.294655] mmc0: SDHCI controller on 5b010000.mmc [5b010000.mmc] using ADMA
[    1.296386]   ESR = 0x0000000096000005
[    1.307194]   EC = 0x25: DABT (current EL), IL = 32 bits
[    1.312473]   SET = 0, FnV = 0
[    1.315566]   EA = 0, S1PTW = 0
[    1.318649]   FSC = 0x05: level 1 translation fault
[    1.323510] Data abort info:
[    1.326370]   ISV = 0, ISS = 0x00000005, ISS2 = 0x00000000
[    1.331846]   CM = 0, WnR = 0, TnD = 0, TagAccess = 0
[    1.336882]   GCS = 0, Overlay = 0, DirtyBit = 0, Xs = 0
[    1.342182] swapper pgtable: 4k pages, 48-bit VAs, pgdp=0000000096bc1000
[    1.348870] [ffff80005ae3dd79] pgd=0000000000000000, p4d=1000000097054003, pud=0000000000000000
[    1.357565] Internal error: Oops: 0000000096000005 [#1]  SMP
[    1.363198] Modules linked in:
[    1.366236] CPU: 2 UID: 0 PID: 47 Comm: kworker/u16:3 Not tainted 6.15.0-03667-g3f5f09105c40-dirty #826 PREEMPT
[    1.376405] Hardware name: Toradex Colibri iMX8QXP on Colibri Evaluation Board V3 (DT)
[    1.384313] Workqueue: events_unbound deferred_probe_work_func
[    1.390128] pstate: 00000005 (nzcv daif -PAN -UAO -TCO -DIT -SSBS BTYPE=--)
[    1.397076] pc : rproc_handle_resources.constprop.0+0x78/0x1d0
[    1.402896] lr : rproc_boot+0x368/0x56c
[    1.406717] sp : ffff8000819c3990
[    1.410017] x29: ffff8000819c3990 x28: ffff80005ae3dd7d x27: 0000000000000000
[    1.417145] x26: 0000000000000000 x25: ffff0000015ec038 x24: ffff800080f0c0a8
[    1.424268] x23: ffff8000813a6110 x22: 00000000d999ad79 x21: ffff0000015ec000
[    1.431392] x20: 0000000026665683 x19: ffff80005ae3dd79 x18: 0000000000000006
[    1.438516] x17: ffff000001799400 x16: ffff000001798e00 x15: 4addd15cca11c529
[    1.445639] x14: 53ebce6d5564d787 x13: 4addd15cca11c529 x12: 53ebce6d5564d787
[    1.452763] x11: 95a1e33b6b190674 x10: 9e3c9abdb41ca345 x9 : ab17b4eaffd6fd1c
[    1.459887] x8 : d5da055de4cfbb87 x7 : dfd7fa31596acbbc x6 : 9946d97107d0dcca
[    1.467011] x5 : ffff0000010c7800 x4 : 00000000000003fc x3 : ffff0000010c7780
[    1.474134] x2 : fffffffffffffff0 x1 : ffff8000814a3000 x0 : ffff8000814a3000
[    1.481261] Call trace:
[    1.483690]  rproc_handle_resources.constprop.0+0x78/0x1d0 (P)
[    1.487705] mmc0: new HS400 MMC card at address 0001
[    1.489502]  rproc_boot+0x368/0x56c
[    1.495349] mmcblk0: mmc0:0001 Q2J55L 7.09 GiB
[    1.497929]  rproc_add+0x184/0x190
[    1.504356]  mmcblk0: p1 p2
[    1.505747]  imx_rproc_probe+0x458/0x528
[    1.509238] mmcblk0boot0: mmc0:0001 Q2J55L 16.0 MiB
[    1.512437]  platform_probe+0x68/0xc0
[    1.512452]  really_probe+0xc0/0x38c
[    1.520584] mmcblk0boot1: mmc0:0001 Q2J55L 16.0 MiB
[    1.520951]  __driver_probe_device+0x7c/0x15c
[    1.527522] mmcblk0rpmb: mmc0:0001 Q2J55L 4.00 MiB, chardev (242:0)
[    1.529377]  driver_probe_device+0x3c/0x10c
[    1.544263]  __device_attach_driver+0xbc/0x158
[    1.548586]  bus_for_each_drv+0x84/0xe0
[    1.552407]  __device_attach+0x9c/0x1ac
[    1.556231]  device_initial_probe+0x14/0x20
[    1.560401]  bus_probe_device+0xac/0xb0
[    1.564221]  deferred_probe_work_func+0x9c/0xec
[    1.568741]  process_one_work+0x14c/0x28c
[    1.572735]  worker_thread+0x2cc/0x3d4
[    1.576473]  kthread+0x12c/0x208
[    1.579687]  ret_from_fork+0x10/0x20
[    1.583253] Code: 8b36c033 9100127c 54000924 d503201f (b9400261)
[    1.589337] ---[ end trace 0000000000000000 ]---

But again, the issue is not happening anymore ;-) I will keep testing to
see if the issue happens again, but for now is working fine, I can now
attach to the remote processor.

This is the git diff on top of Ulf patches I have been testing:

diff --git a/drivers/pmdomain/core.c b/drivers/pmdomain/core.c
index 6da25e2c81d2..661a6aad40a8 100644
--- a/drivers/pmdomain/core.c
+++ b/drivers/pmdomain/core.c
@@ -599,6 +599,23 @@ int dev_pm_genpd_set_performance_state(struct device *dev, unsigned int state)
 }
 EXPORT_SYMBOL_GPL(dev_pm_genpd_set_performance_state);
 
+bool dev_pm_genpd_is_on(struct device *dev)
+{
+        struct generic_pm_domain *genpd;
+        bool is_on;
+
+        genpd = dev_to_genpd_safe(dev);
+        if (!genpd)
+                return false;
+
+        genpd_lock(genpd);
+        is_on = genpd_status_on(genpd);
+        genpd_unlock(genpd);
+
+        return is_on;
+}
+EXPORT_SYMBOL_GPL(dev_pm_genpd_is_on);
+
 /**
  * dev_pm_genpd_set_next_wakeup - Notify PM framework of an impending wakeup.
  *
diff --git a/drivers/remoteproc/imx_rproc.c b/drivers/remoteproc/imx_rproc.c
index 627e57a88db2..9688370f9bb5 100644
--- a/drivers/remoteproc/imx_rproc.c
+++ b/drivers/remoteproc/imx_rproc.c
@@ -18,6 +18,7 @@
 #include <linux/of_reserved_mem.h>
 #include <linux/platform_device.h>
 #include <linux/pm_domain.h>
+#include <linux/pm_runtime.h>
 #include <linux/reboot.h>
 #include <linux/regmap.h>
 #include <linux/remoteproc.h>
@@ -891,9 +892,7 @@ static int imx_rproc_attach_pd(struct imx_rproc *priv)
 {
 	struct device *dev = priv->dev;
 	int ret;
-	struct dev_pm_domain_attach_data pd_data = {
-		.pd_flags = PD_FLAG_DEV_LINK_ON,
-	};
+	bool test;
 
 	/*
 	 * If there is only one power-domain entry, the platform driver framework
@@ -902,7 +901,16 @@ static int imx_rproc_attach_pd(struct imx_rproc *priv)
 	if (dev->pm_domain)
 		return 0;
 
-	ret = dev_pm_domain_attach_list(dev, &pd_data, &priv->pd_list);
+	ret = dev_pm_domain_attach_list(dev, NULL, &priv->pd_list);
+	printk("hfranco: returned pd devs is %d", ret);
+	for (int i = 0; i < ret; i++) {
+		test = dev_pm_genpd_is_on(priv->pd_list->pd_devs[i]);
+		printk("hfranco: returned value is %d", test);
+		if (test) {
+			priv->rproc->state = RPROC_DETACHED;
+			break;
+		}
+	}
 	return ret < 0 ? ret : 0;
 }
 
@@ -1146,6 +1154,9 @@ static int imx_rproc_probe(struct platform_device *pdev)
 		}
 	}
 
+	pm_runtime_enable(dev);
+	pm_runtime_get_sync(dev);
+
 	ret = rproc_add(rproc);
 	if (ret) {
 		dev_err(dev, "rproc_add failed\n");
diff --git a/include/linux/pm_runtime.h b/include/linux/pm_runtime.h
index 756b842dcd30..16d1fca2a8c5 100644
--- a/include/linux/pm_runtime.h
+++ b/include/linux/pm_runtime.h
@@ -95,6 +95,7 @@ extern void pm_runtime_put_suppliers(struct device *dev);
 extern void pm_runtime_new_link(struct device *dev);
 extern void pm_runtime_drop_link(struct device_link *link);
 extern void pm_runtime_release_supplier(struct device_link *link);
+bool dev_pm_genpd_is_on(struct device *dev);

 int devm_pm_runtime_set_active_enabled(struct device *dev);
 extern int devm_pm_runtime_enable(struct device *dev);

This is the rproc output when bootaux is used:

root@colibri-imx8x-07308754:~# dmesg | grep hfranco
[    0.478475] hfranco: returned pd devs is 2
[    0.478496] hfranco: returned value is 1
root@colibri-imx8x-07308754:~# dmesg | grep rproc
[    0.478797] remoteproc remoteproc0: imx-rproc is available
[    0.478878] remoteproc remoteproc0: attaching to imx-rproc
[    0.478961] remoteproc remoteproc0: remote processor imx-rproc is now attached

I will cleanup everything and try to come up with a patch. Ulf, in this
case, as your patches have not yet been merged, should I wait for them?

Thanks for all the help guys.

> 
> > 
> > I am using the pm_runtime functions before rproc_add():
> > 
> > @@ -1146,6 +1154,9 @@ static int imx_rproc_probe(struct
> > platform_device *pdev)
> >                 }
> >         }
> > 
> > +       pm_runtime_enable(dev);
> > +       pm_runtime_get_sync(dev);
> 
> I think only make this apply for i.MX8QX/8QM/DX, then no
> impact to other patforms.

All right, I will check how to do this. Thanks.

> 
> Regards,
> Peng

Best regards,
Hiago.

