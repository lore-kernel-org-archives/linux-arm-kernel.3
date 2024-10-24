Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88CFDD10374
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Oct 2024 20:39:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+xEThDmQ7pfAOY3UNaiZU7Wtb02xRWnrFRg9OV2hgNc=; b=csiIB20SqjJJXV0u75I2F3kn7Z
	spFyVcEqpiSv/nLSnGuA3fUX32rqyCVcvQ+o8PkvLoOjcwQVzf7hUmt4caLD+T+9GWKuYUxOIFgXy
	MIQvml8psXo0laEOAjUPGSy0fX2OkB+G7a50107lA5PIfpf3n0IiDPWxq1CzgYE8mDpWsHOhttEJu
	KOJjnQxILCwgU1Zm5X9FEyFeH21kQyQd7WNZQ/9thZNqpW+MOCwY1+7XZWKhNjB4ulRz70qte58gc
	kOYcGdlc9IE9o1YQOpaN7l5e7p0KF9LTQxwdHUYKVFjCjytwGpsEck8gOuqCT/ejofI0Np/xxySfH
	6vqi15Wg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t44by-00000001kbg-1DXq;
	Thu, 24 Oct 2024 20:39:14 +0000
Received: from mout.gmx.net ([212.227.15.15])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t44IL-00000001iBr-04fV
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Oct 2024 20:19:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.net;
	s=s31663417; t=1729801128; x=1730405928; i=wahrenst@gmx.net;
	bh=+xEThDmQ7pfAOY3UNaiZU7Wtb02xRWnrFRg9OV2hgNc=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-Id:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=XTf6+f+KOy4BdeP4kCd5vR2ryMWEUxYHFI1GDqBf7FzwCGSmOSnYQvcWKJj/rXuT
	 a7zRRXu3NsxMgILZ/5rPKPqYZVI8ftdGWQypV4gSiAiAUFzylmMYBmoda/wYa+4WW
	 cOf1TsNv1BBdP4V8yni2ecZhpIxoXuRok3Gqi0w1CJj963pqxSJXgbpnIVM/f3egv
	 onT70ySWr/8YySSbkwGE4jThxp2R6ZZ/8B15DmFwH4ip5NceMrY/jnfkXtas7ADqf
	 KmxI17C0TxtnJ8u5xQNJhAtqxLllIsAsDQuptmAM1rwhAAoslBxCijDK7VvTMZDgI
	 EI7Vz94sIVnol927HA==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from stefanw-SCHENKER ([37.4.248.43]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1Mlf4S-1tlLBq0Zfe-00qK3m; Thu, 24
 Oct 2024 22:18:48 +0200
From: Stefan Wahren <wahrenst@gmx.net>
To: Russell King <linux@armlinux.org.uk>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Ray Jui <rjui@broadcom.com>,
	Scott Branden <sbranden@broadcom.com>,
	Vinod Koul <vkoul@kernel.org>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	Minas Harutyunyan <hminas@synopsys.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Lukas Wunner <lukas@wunner.de>,
	Peter Robinson <pbrobinson@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	kernel-list@raspberrypi.com,
	bcm-kernel-feedback-list@broadcom.com,
	dmaengine@vger.kernel.org,
	linux-mmc@vger.kernel.org,
	linux-usb@vger.kernel.org,
	Stefan Wahren <wahrenst@gmx.net>
Subject: [PATCH 7/9] usb: dwc2: Refactor backup/restore of registers
Date: Thu, 24 Oct 2024 22:18:35 +0200
Message-Id: <20241024201837.79927-8-wahrenst@gmx.net>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241024201837.79927-1-wahrenst@gmx.net>
References: <20241024201837.79927-1-wahrenst@gmx.net>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:eRif5tIwK3koxZ75G+M0l8840Bnvc3475TVXGPWA5N/tjqiBGB4
 7tDs8j7h/LOypzExOB9hOlGUlucZi2oyE7ZbTIInuypdLHwXBJKsqbgDxXdnqatbmz3PU/Z
 n2nbULH+IWZFQyyusbRmagDZA+Bqrn6ohaePW3trTLiUgcwlXcck+4QJR/0XW5yg8si710u
 Qyf7Mv950o+/4VhV2vcJQ==
UI-OutboundReport: notjunk:1;M01:P0:E4sKnrR0dlE=;nlS9kirPC1tE1GHjl61oQOZYgIF
 H7lsXm15P4VyVpYtaqlHZm9x2Nzfc0Clz6wLhQNnNSyw29pRdw919ysDt7I3FTtVstWM45aQG
 MrnI+IkFEbJPu839p1EFSA62XsTMhoLSiMF6mc+GpwbXLMt0FAB+MxX1k+epY5fpeOqxJoIc9
 Dza/dpxw/7BJiWiG7fVxg6+HrKd6Q0Sk4bMYim4Kt4nmKGKFaIqFElVnFsdZL0eGp5DbGUt2l
 ySr3ZrxTxmJUc7NREq7UYcfF4ZkXhQypMSnpEpDl98eARmLtLdO0RWW+yrVulvkH4ZZj9dLfH
 anWnPHsazNXl4veUiVx98Ftxg+/7RMVv50C00MB9N8YEOE+rAi1hq1L38OgAoVpZVNk5PAsWZ
 hwGdIC+UWVBKG8RCrlNL3YxAQFZZuHG1DtuBV8l9gm1kL96b2O1hE+rlCE4MMIFvqYGSjbFl9
 rckLOBb41BWCLie4M46tqs3DkOmQrKzMiYgyRuh49NveRgLNYZvxSft2HCU5Uq0OGNlmPFLQQ
 Hw5cjQORY5MFlJa15nDRB6OO2tuDQ8DhFy4+SDtbhhSYXTxxBQUowjEcJm1Jax1WGDgxJK3wN
 aGwkc3UIyeIweVMDfDol9lRBxdPrapKIwmsdUSev4bh4JRMgcPqBocObi7vJPPAXtSo2OVWAx
 mp/tw98VG8i5hIHkkjBFMZDYmKBjXiq03Ae18tdlojnDt5pasq1cbaK/hwPgBQM8g3/kpODES
 nORllTAya9FAjl+ZOAInZFKOHj9BbWzTn5lTKHKvD/Toas3gJAE+eeiwcUANsfYCZ8kJhX11b
 tYJ26AI4vG6XbnEOV00tPBQQ==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241024_131857_504947_14589FD3 
X-CRM114-Status: GOOD (  15.65  )
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

The DWC2 runtime PM code reuses similar patterns to backup and
restore the registers. So consolidate them in USB mode specific
variants. This also has the advantage it is reusable for further
PM improvements.

Special care is taken for DCFG register during device mode restore.

Signed-off-by: Stefan Wahren <wahrenst@gmx.net>
=2D--
 drivers/usb/dwc2/core.h   |  15 ++++++
 drivers/usb/dwc2/gadget.c | 108 +++++++++++++++++++-------------------
 drivers/usb/dwc2/hcd.c    |  99 +++++++++++++++++-----------------
 3 files changed, 121 insertions(+), 101 deletions(-)

diff --git a/drivers/usb/dwc2/core.h b/drivers/usb/dwc2/core.h
index 48f4b639ca2f..265791fbe87f 100644
=2D-- a/drivers/usb/dwc2/core.h
+++ b/drivers/usb/dwc2/core.h
@@ -1128,6 +1128,7 @@ struct dwc2_hsotg {
 #define DWC2_HS_IOT_ID		0x55320000

 #define DWC2_RESTORE_DCTL BIT(0)
+#define DWC2_RESTORE_DCFG BIT(1)

 #if IS_ENABLED(CONFIG_USB_DWC2_HOST) || IS_ENABLED(CONFIG_USB_DWC2_DUAL_R=
OLE)
 	union dwc2_hcd_internal_flags {
@@ -1437,6 +1438,9 @@ int dwc2_hsotg_tx_fifo_total_depth(struct dwc2_hsotg=
 *hsotg);
 int dwc2_hsotg_tx_fifo_average_depth(struct dwc2_hsotg *hsotg);
 void dwc2_gadget_init_lpm(struct dwc2_hsotg *hsotg);
 void dwc2_gadget_program_ref_clk(struct dwc2_hsotg *hsotg);
+int dwc2_gadget_backup_critical_registers(struct dwc2_hsotg *hsotg);
+int dwc2_gadget_restore_critical_registers(struct dwc2_hsotg *hsotg,
+					   unsigned int flags);
 static inline void dwc2_clear_fifo_map(struct dwc2_hsotg *hsotg)
 { hsotg->fifo_map =3D 0; }
 #else
@@ -1484,6 +1488,11 @@ static inline int dwc2_hsotg_tx_fifo_average_depth(=
struct dwc2_hsotg *hsotg)
 { return 0; }
 static inline void dwc2_gadget_init_lpm(struct dwc2_hsotg *hsotg) {}
 static inline void dwc2_gadget_program_ref_clk(struct dwc2_hsotg *hsotg) =
{}
+static inline int dwc2_gadget_backup_critical_registers(struct dwc2_hsotg=
 *hsotg)
+{ return 0; }
+static inline int dwc2_gadget_restore_critical_registers(struct dwc2_hsot=
g *hsotg,
+							 unsigned int flags)
+{ return 0; }
 static inline void dwc2_clear_fifo_map(struct dwc2_hsotg *hsotg) {}
 #endif

@@ -1507,6 +1516,8 @@ int dwc2_host_exit_partial_power_down(struct dwc2_hs=
otg *hsotg,
 void dwc2_host_enter_clock_gating(struct dwc2_hsotg *hsotg);
 void dwc2_host_exit_clock_gating(struct dwc2_hsotg *hsotg, int rem_wakeup=
);
 bool dwc2_host_can_poweroff_phy(struct dwc2_hsotg *dwc2);
+int dwc2_host_backup_critical_registers(struct dwc2_hsotg *hsotg);
+int dwc2_host_restore_critical_registers(struct dwc2_hsotg *hsotg);
 static inline void dwc2_host_schedule_phy_reset(struct dwc2_hsotg *hsotg)
 { schedule_work(&hsotg->phy_reset_work); }
 #else
@@ -1546,6 +1557,10 @@ static inline void dwc2_host_exit_clock_gating(stru=
ct dwc2_hsotg *hsotg,
 					       int rem_wakeup) {}
 static inline bool dwc2_host_can_poweroff_phy(struct dwc2_hsotg *dwc2)
 { return false; }
+static inline int dwc2_host_backup_critical_registers(struct dwc2_hsotg *=
hsotg)
+{ return 0; }
+static inline int dwc2_host_restore_critical_registers(struct dwc2_hsotg =
*hsotg)
+{ return 0; }
 static inline void dwc2_host_schedule_phy_reset(struct dwc2_hsotg *hsotg)=
 {}

 #endif
diff --git a/drivers/usb/dwc2/gadget.c b/drivers/usb/dwc2/gadget.c
index 96d703f4c509..2e071a0342f8 100644
=2D-- a/drivers/usb/dwc2/gadget.c
+++ b/drivers/usb/dwc2/gadget.c
@@ -5223,6 +5223,9 @@ int dwc2_restore_device_registers(struct dwc2_hsotg =
*hsotg, unsigned int flags)
 	}
 	dr->valid =3D false;

+	if (flags & DWC2_RESTORE_DCFG)
+		dwc2_writel(hsotg, dr->dcfg, DCFG);
+
 	if (flags & DWC2_RESTORE_DCTL)
 		dwc2_writel(hsotg, dr->dctl, DCTL);

@@ -5309,6 +5312,49 @@ void dwc2_gadget_program_ref_clk(struct dwc2_hsotg =
*hsotg)
 	dev_dbg(hsotg->dev, "GREFCLK=3D0x%08x\n", dwc2_readl(hsotg, GREFCLK));
 }

+int dwc2_gadget_backup_critical_registers(struct dwc2_hsotg *hsotg)
+{
+	int ret;
+
+	/* Backup all registers */
+	ret =3D dwc2_backup_global_registers(hsotg);
+	if (ret) {
+		dev_err(hsotg->dev, "%s: failed to backup global registers\n",
+			__func__);
+		return ret;
+	}
+
+	ret =3D dwc2_backup_device_registers(hsotg);
+	if (ret) {
+		dev_err(hsotg->dev, "%s: failed to backup device registers\n",
+			__func__);
+		return ret;
+	}
+
+	return 0;
+}
+
+int dwc2_gadget_restore_critical_registers(struct dwc2_hsotg *hsotg,
+					   unsigned int flags)
+{
+	int ret;
+
+	ret =3D dwc2_restore_global_registers(hsotg);
+	if (ret) {
+		dev_err(hsotg->dev, "%s: failed to restore registers\n",
+			__func__);
+		return ret;
+	}
+	ret =3D dwc2_restore_device_registers(hsotg, flags);
+	if (ret) {
+		dev_err(hsotg->dev, "%s: failed to restore device registers\n",
+			__func__);
+		return ret;
+	}
+
+	return 0;
+}
+
 /**
  * dwc2_gadget_enter_hibernation() - Put controller in Hibernation.
  *
@@ -5326,18 +5372,9 @@ int dwc2_gadget_enter_hibernation(struct dwc2_hsotg=
 *hsotg)
 	/* Change to L2(suspend) state */
 	hsotg->lx_state =3D DWC2_L2;
 	dev_dbg(hsotg->dev, "Start of hibernation completed\n");
-	ret =3D dwc2_backup_global_registers(hsotg);
-	if (ret) {
-		dev_err(hsotg->dev, "%s: failed to backup global registers\n",
-			__func__);
-		return ret;
-	}
-	ret =3D dwc2_backup_device_registers(hsotg);
-	if (ret) {
-		dev_err(hsotg->dev, "%s: failed to backup device registers\n",
-			__func__);
+	ret =3D dwc2_gadget_backup_critical_registers(hsotg);
+	if (ret)
 		return ret;
-	}

 	gpwrdn =3D GPWRDN_PWRDNRSTN;
 	udelay(10);
@@ -5485,20 +5522,9 @@ int dwc2_gadget_exit_hibernation(struct dwc2_hsotg =
*hsotg,
 	dwc2_writel(hsotg, 0xffffffff, GINTSTS);

 	/* Restore global registers */
-	ret =3D dwc2_restore_global_registers(hsotg);
-	if (ret) {
-		dev_err(hsotg->dev, "%s: failed to restore registers\n",
-			__func__);
-		return ret;
-	}
-
-	/* Restore device registers */
-	ret =3D dwc2_restore_device_registers(hsotg, flags);
-	if (ret) {
-		dev_err(hsotg->dev, "%s: failed to restore device registers\n",
-			__func__);
+	ret =3D dwc2_gadget_restore_critical_registers(hsotg, flags);
+	if (ret)
 		return ret;
-	}

 	if (rem_wakeup) {
 		mdelay(10);
@@ -5532,19 +5558,9 @@ int dwc2_gadget_enter_partial_power_down(struct dwc=
2_hsotg *hsotg)
 	dev_dbg(hsotg->dev, "Entering device partial power down started.\n");

 	/* Backup all registers */
-	ret =3D dwc2_backup_global_registers(hsotg);
-	if (ret) {
-		dev_err(hsotg->dev, "%s: failed to backup global registers\n",
-			__func__);
-		return ret;
-	}
-
-	ret =3D dwc2_backup_device_registers(hsotg);
-	if (ret) {
-		dev_err(hsotg->dev, "%s: failed to backup device registers\n",
-			__func__);
+	ret =3D dwc2_gadget_backup_critical_registers(hsotg);
+	if (ret)
 		return ret;
-	}

 	/*
 	 * Clear any pending interrupts since dwc2 will not be able to
@@ -5591,11 +5607,8 @@ int dwc2_gadget_exit_partial_power_down(struct dwc2=
_hsotg *hsotg,
 {
 	u32 pcgcctl;
 	u32 dctl;
-	struct dwc2_dregs_backup *dr;
 	int ret =3D 0;

-	dr =3D &hsotg->dr_backup;
-
 	dev_dbg(hsotg->dev, "Exiting device partial Power Down started.\n");

 	pcgcctl =3D dwc2_readl(hsotg, PCGCTL);
@@ -5612,21 +5625,10 @@ int dwc2_gadget_exit_partial_power_down(struct dwc=
2_hsotg *hsotg,

 	udelay(100);
 	if (restore) {
-		ret =3D dwc2_restore_global_registers(hsotg);
-		if (ret) {
-			dev_err(hsotg->dev, "%s: failed to restore registers\n",
-				__func__);
-			return ret;
-		}
-		/* Restore DCFG */
-		dwc2_writel(hsotg, dr->dcfg, DCFG);
-
-		ret =3D dwc2_restore_device_registers(hsotg, DWC2_RESTORE_DCTL);
-		if (ret) {
-			dev_err(hsotg->dev, "%s: failed to restore device registers\n",
-				__func__);
+		ret =3D dwc2_gadget_restore_critical_registers(hsotg, DWC2_RESTORE_DCTL=
 |
+							     DWC2_RESTORE_DCFG);
+		if (ret)
 			return ret;
-		}
 	}

 	/* Set the Power-On Programming done bit */
diff --git a/drivers/usb/dwc2/hcd.c b/drivers/usb/dwc2/hcd.c
index cb54390e7de4..32fa606e5d59 100644
=2D-- a/drivers/usb/dwc2/hcd.c
+++ b/drivers/usb/dwc2/hcd.c
@@ -5477,6 +5477,49 @@ int dwc2_restore_host_registers(struct dwc2_hsotg *=
hsotg)
 	return 0;
 }

+int dwc2_host_backup_critical_registers(struct dwc2_hsotg *hsotg)
+{
+	int ret;
+
+	/* Backup all registers */
+	ret =3D dwc2_backup_global_registers(hsotg);
+	if (ret) {
+		dev_err(hsotg->dev, "%s: failed to backup global registers\n",
+			__func__);
+		return ret;
+	}
+
+	ret =3D dwc2_backup_host_registers(hsotg);
+	if (ret) {
+		dev_err(hsotg->dev, "%s: failed to backup host registers\n",
+			__func__);
+		return ret;
+	}
+
+	return 0;
+}
+
+int dwc2_host_restore_critical_registers(struct dwc2_hsotg *hsotg)
+{
+	int ret;
+
+	ret =3D dwc2_restore_global_registers(hsotg);
+	if (ret) {
+		dev_err(hsotg->dev, "%s: failed to restore registers\n",
+			__func__);
+		return ret;
+	}
+
+	ret =3D dwc2_restore_host_registers(hsotg);
+	if (ret) {
+		dev_err(hsotg->dev, "%s: failed to restore host registers\n",
+			__func__);
+		return ret;
+	}
+
+	return 0;
+}
+
 /**
  * dwc2_host_enter_hibernation() - Put controller in Hibernation.
  *
@@ -5492,18 +5535,9 @@ int dwc2_host_enter_hibernation(struct dwc2_hsotg *=
hsotg)
 	u32 gpwrdn;

 	dev_dbg(hsotg->dev, "Preparing host for hibernation\n");
-	ret =3D dwc2_backup_global_registers(hsotg);
-	if (ret) {
-		dev_err(hsotg->dev, "%s: failed to backup global registers\n",
-			__func__);
-		return ret;
-	}
-	ret =3D dwc2_backup_host_registers(hsotg);
-	if (ret) {
-		dev_err(hsotg->dev, "%s: failed to backup host registers\n",
-			__func__);
+	ret =3D dwc2_host_backup_critical_registers(hsotg);
+	if (ret)
 		return ret;
-	}

 	/* Enter USB Suspend Mode */
 	hprt0 =3D dwc2_readl(hsotg, HPRT0);
@@ -5697,20 +5731,9 @@ int dwc2_host_exit_hibernation(struct dwc2_hsotg *h=
sotg, int rem_wakeup,
 	dwc2_writel(hsotg, 0xffffffff, GINTSTS);

 	/* Restore global registers */
-	ret =3D dwc2_restore_global_registers(hsotg);
-	if (ret) {
-		dev_err(hsotg->dev, "%s: failed to restore registers\n",
-			__func__);
+	ret =3D dwc2_host_restore_critical_registers(hsotg);
+	if (ret)
 		return ret;
-	}
-
-	/* Restore host registers */
-	ret =3D dwc2_restore_host_registers(hsotg);
-	if (ret) {
-		dev_err(hsotg->dev, "%s: failed to restore host registers\n",
-			__func__);
-		return ret;
-	}

 	if (rem_wakeup) {
 		dwc2_hcd_rem_wakeup(hsotg);
@@ -5777,19 +5800,9 @@ int dwc2_host_enter_partial_power_down(struct dwc2_=
hsotg *hsotg)
 		dev_warn(hsotg->dev, "Suspend wasn't generated\n");

 	/* Backup all registers */
-	ret =3D dwc2_backup_global_registers(hsotg);
-	if (ret) {
-		dev_err(hsotg->dev, "%s: failed to backup global registers\n",
-			__func__);
-		return ret;
-	}
-
-	ret =3D dwc2_backup_host_registers(hsotg);
-	if (ret) {
-		dev_err(hsotg->dev, "%s: failed to backup host registers\n",
-			__func__);
+	ret =3D dwc2_host_backup_critical_registers(hsotg);
+	if (ret)
 		return ret;
-	}

 	/*
 	 * Clear any pending interrupts since dwc2 will not be able to
@@ -5858,19 +5871,9 @@ int dwc2_host_exit_partial_power_down(struct dwc2_h=
sotg *hsotg,

 	udelay(100);
 	if (restore) {
-		ret =3D dwc2_restore_global_registers(hsotg);
-		if (ret) {
-			dev_err(hsotg->dev, "%s: failed to restore registers\n",
-				__func__);
-			return ret;
-		}
-
-		ret =3D dwc2_restore_host_registers(hsotg);
-		if (ret) {
-			dev_err(hsotg->dev, "%s: failed to restore host registers\n",
-				__func__);
+		ret =3D dwc2_host_restore_critical_registers(hsotg);
+		if (ret)
 			return ret;
-		}
 	}

 	/* Drive resume signaling and exit suspend mode on the port. */
=2D-
2.34.1


