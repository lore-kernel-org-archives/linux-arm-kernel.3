Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3CD83D1036C
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Oct 2024 20:37:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=09r8SsGNZ34ZiyCPE+YPDY1tjwAlvhjANIoGjogob0I=; b=CjfwD8z0ZKcelzFw5m6AlNHd77
	ncBD6mCRQ71zwm31AKPGzKcxn1IqB087mbSToGMxbJwAnrmAVesdMKMF9uJ6eUwBLUzmg7QwXCqaN
	gYKd8gh3hNjfNIkk22JXy7dEjKAHvRtOe/e4YwFndT/ZNLtvyUlzKu+Yeb/JRiGLMOnzyZqMXq12b
	Pa77EfOpsZyc4MSMX16m/c8spnO7c/CsI40PCXsGd7s6nQS/8HH97pTEJiEpiTuBuAJ5S25zlUeLM
	FPXZJN9ft3RJRUXgWOnzr6xX/MRU70ydruOb4xudnGwLAD49XNwCh6i7IT1r9oIbLSCIyo/Ci2yNo
	u0bGOOSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t44aT-00000001kUD-112n;
	Thu, 24 Oct 2024 20:37:41 +0000
Received: from mout.gmx.net ([212.227.15.19])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t44IK-00000001iC6-1u1l
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Oct 2024 20:19:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.net;
	s=s31663417; t=1729801128; x=1730405928; i=wahrenst@gmx.net;
	bh=09r8SsGNZ34ZiyCPE+YPDY1tjwAlvhjANIoGjogob0I=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-Id:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=mCOITbe6kHxdddVppdEAfMpWuaJ7FXS8bFZWtv08QtIXMgFQPg8lO48zlrMFjNBf
	 IjaCVhUBQfVf8Dxzue6u/KszzyySDHkoBTWGyhM27HKPmtqcp1Sqawfvqrf6nxS8m
	 ZpBLZ+tZGo9LNkXeOnqzvuFnni1M1Bdw/kBogY8Kkf1JKv3X1pAKANKMPiHBroGfl
	 n+T8HJF1Yg+KwA/H/+geVhD27n32TGhUwFhm/yvtUka6lLbRGe75cXNqbUy7mVSPp
	 RmWsBz3E2BgB+z32FQXjP70h6L6fY0dJmSg3yRTuNFSoU3Q0fvzKGPbX/GSG9l40m
	 rsT+mjGe6+gqkblBMQ==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from stefanw-SCHENKER ([37.4.248.43]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MfpOd-1tWoL3372P-00ahnt; Thu, 24
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
	Stefan Wahren <wahrenst@gmx.net>,
	Douglas Anderson <dianders@chromium.org>
Subject: [PATCH 8/9] usb: dwc2: Implement recovery after PM domain off
Date: Thu, 24 Oct 2024 22:18:36 +0200
Message-Id: <20241024201837.79927-9-wahrenst@gmx.net>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241024201837.79927-1-wahrenst@gmx.net>
References: <20241024201837.79927-1-wahrenst@gmx.net>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:zkKVgRdB44ItjXckFDgPAlkuuQ2i0j7P5bnbkUiZdasbdzYhQAt
 P9aB5ib4nf0N+oSia4NHvIKYts72cBONmlSRqGoCcQ7ibpjNWt5EWDtrm97BJk2PPqYLjba
 BjWiG7tbr0EWFKAaJFKw4Aakpi4LERXa+wRyYlxTxjRRLYCNrHfZdEkxZHlsRk68fQJPRqJ
 ST516HzZLglAylSOYKMUw==
UI-OutboundReport: notjunk:1;M01:P0:H5kEY+3Mlns=;AcHF9pEJKh8r2X5rTvVoct2vQuF
 hqqbFxf+9UnM0tqC9UkdZWLVXEUytN9iXAZ4o8/2eYOcotjuH0kVNMBW32O5jVmNRW1ez6Cif
 8JyXMMV90D5tHOpQrDNx+61GxBjLw24HyYrl91VY+DJOFiyPhreuFtBLtSSw2yxmuFSylAGBK
 J+Y5eJ/nVeo/ysNnRGqP5PnyfFxkB6FQ56pOmGix2gpUwIAtA96SS3xzBYEiwa8xBLDJbNzPp
 x9T7/cGKlGJLBwNN/RVbM6rFnQ4qPdZHyD94Yzp47NriAj7m/AkW0TSF/HDHvaZ2iMJ5H9iqT
 +A5k+GPuHQdCZbZowerj182DNm8FhJ9giHAoqXRCyH65WPW1VXRvGjg97eCWn8q0qVWtAoUdU
 Ku+ah8YmRJBxuy50l5UvBNwpPF0d0td0eUydQvlBXFkng/eLAdhPMY+yP5/JRyfj7UQQxHFZ9
 OhRpIso4TwuSKVbvlszF2dzILMnTI+SEHyGTmwFaPPj/6DImfs+kOZdPosnEjRVSR8TAnEDFR
 85LAvebiJ/EhDAOnoJ1vRfzBL6C+e0Sjj8NNf+sW1FUWB/JQxxlMpY+6NXrX4GEFBKYaJd6qb
 8SAIXMwjB412l2padBCh9g4B5pBTX5do9jOpdn5b6Y0jDz08EJGE2pX5wo35L6CC/4k0XZbrp
 v/sjgTn9YYe5AYbGOBdNGqlcucQYm4J9ZTsOOJL4hISMuAJM3hUs+Stj81xrBLcvd1uwcKlmh
 tvEauX3ey1pKyeKZHEtMB4HoRjZYlL1Ye5wrtKZrd5k7rlrWtdr0kHxMNXmgUWIFGo8g9/pUE
 syTLd0jFoFyWRmVapgaVKi3Q==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241024_131857_097983_BCDB58DD 
X-CRM114-Status: GOOD (  17.31  )
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

According to the dt-bindings there are some platforms, which have a
dedicated USB power domain for DWC2 IP core supply. If the power domain
is switched off during system suspend then all USB register will lose
their settings.

Use GUSBCFG_TOUTCAL as a canary to detect that the power domain has
been powered off during suspend. Since the GOTGCTL_CURMODE_HOST doesn't
match on all platform with the current mode, additionally backup
GINTSTS. This works reliable to decide which registers should be
restored.

Signed-off-by: Stefan Wahren <wahrenst@gmx.net>
Reviewed-by: Douglas Anderson <dianders@chromium.org>
=2D--
 drivers/usb/dwc2/core.c     |  1 +
 drivers/usb/dwc2/core.h     |  2 ++
 drivers/usb/dwc2/platform.c | 38 +++++++++++++++++++++++++++++++++++++
 3 files changed, 41 insertions(+)

diff --git a/drivers/usb/dwc2/core.c b/drivers/usb/dwc2/core.c
index 9919ab725d54..c3d24312db0f 100644
=2D-- a/drivers/usb/dwc2/core.c
+++ b/drivers/usb/dwc2/core.c
@@ -43,6 +43,7 @@ int dwc2_backup_global_registers(struct dwc2_hsotg *hsot=
g)
 	/* Backup global regs */
 	gr =3D &hsotg->gr_backup;

+	gr->gintsts =3D dwc2_readl(hsotg, GINTSTS);
 	gr->gotgctl =3D dwc2_readl(hsotg, GOTGCTL);
 	gr->gintmsk =3D dwc2_readl(hsotg, GINTMSK);
 	gr->gahbcfg =3D dwc2_readl(hsotg, GAHBCFG);
diff --git a/drivers/usb/dwc2/core.h b/drivers/usb/dwc2/core.h
index 265791fbe87f..34127b890b2a 100644
=2D-- a/drivers/usb/dwc2/core.h
+++ b/drivers/usb/dwc2/core.h
@@ -667,6 +667,7 @@ struct dwc2_hw_params {
 /**
  * struct dwc2_gregs_backup - Holds global registers state before
  * entering partial power down
+ * @gintsts:		Backup of GINTSTS register
  * @gotgctl:		Backup of GOTGCTL register
  * @gintmsk:		Backup of GINTMSK register
  * @gahbcfg:		Backup of GAHBCFG register
@@ -683,6 +684,7 @@ struct dwc2_hw_params {
  * @valid:		True if registers values backuped.
  */
 struct dwc2_gregs_backup {
+	u32 gintsts;
 	u32 gotgctl;
 	u32 gintmsk;
 	u32 gahbcfg;
diff --git a/drivers/usb/dwc2/platform.c b/drivers/usb/dwc2/platform.c
index c1b7209b9483..4a3c81cd45d6 100644
=2D-- a/drivers/usb/dwc2/platform.c
+++ b/drivers/usb/dwc2/platform.c
@@ -685,6 +685,14 @@ static int __maybe_unused dwc2_suspend(struct device =
*dev)
 		regulator_disable(dwc2->usb33d);
 	}

+	if (is_device_mode)
+		ret =3D dwc2_gadget_backup_critical_registers(dwc2);
+	else
+		ret =3D dwc2_host_backup_critical_registers(dwc2);
+
+	if (ret)
+		return ret;
+
 	if (dwc2->ll_hw_enabled &&
 	    (is_device_mode || dwc2_host_can_poweroff_phy(dwc2))) {
 		ret =3D __dwc2_lowlevel_hw_disable(dwc2);
@@ -694,6 +702,24 @@ static int __maybe_unused dwc2_suspend(struct device =
*dev)
 	return ret;
 }

+static int dwc2_restore_critical_registers(struct dwc2_hsotg *hsotg)
+{
+	struct dwc2_gregs_backup *gr;
+
+	gr =3D &hsotg->gr_backup;
+
+	if (!gr->valid) {
+		dev_err(hsotg->dev, "No valid register backup, failed to restore\n");
+		return -EINVAL;
+	}
+
+	if (gr->gintsts & GINTSTS_CURMODE_HOST)
+		return dwc2_host_restore_critical_registers(hsotg);
+
+	return dwc2_gadget_restore_critical_registers(hsotg, DWC2_RESTORE_DCTL |
+						      DWC2_RESTORE_DCFG);
+}
+
 static int __maybe_unused dwc2_resume(struct device *dev)
 {
 	struct dwc2_hsotg *dwc2 =3D dev_get_drvdata(dev);
@@ -706,6 +732,18 @@ static int __maybe_unused dwc2_resume(struct device *=
dev)
 	}
 	dwc2->phy_off_for_suspend =3D false;

+	/*
+	 * During suspend it's possible that the power domain for the
+	 * DWC2 controller is disabled and all register values get lost.
+	 * In case the GUSBCFG register is not initialized, it's clear the
+	 * registers must be restored.
+	 */
+	if (!(dwc2_readl(dwc2, GUSBCFG) & GUSBCFG_TOUTCAL_MASK)) {
+		ret =3D dwc2_restore_critical_registers(dwc2);
+		if (ret)
+			return ret;
+	}
+
 	if (dwc2->params.activate_stm_id_vb_detection) {
 		unsigned long flags;
 		u32 ggpio, gotgctl;
=2D-
2.34.1


