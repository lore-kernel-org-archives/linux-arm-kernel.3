Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16241D1036C
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Oct 2024 20:42:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JRrp6JLKk7ZewfhLxhmIMUVWuQ9FaYJ7taL+ewhOlow=; b=PiXc7W6vRZmzPgb2AdNFSbfdVk
	E8161BQ8A5rE0joBvTiRMcGE+xSnYhfW4piAEuogf3OKqXFT5Vw7zCLrwoSMiIFgXobdc9W4TzX6J
	hsNVH6hRh1rIaqsuHSqeMAe5jld67ZT2l4PlsjK3+H+uqhIPawZa54KMy3/ZrVUtV4AhWvG5uiK+C
	J4JhIIttcR9bE4F1MLTKfIcN6F1y6zSUa+LMCV+5ujA9bazC9sXbIrKFV9YSALP39s1CDaU5/JRsf
	ct+9hC4R3GdQWGzEMI2qXryOV2MIasCQM6LUdZTcTrnoDXQ8CpEe7Ja+mK1BRpEPy1CqbANCWmjk2
	z8TzVzxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t44f4-00000001lJ2-1DBR;
	Thu, 24 Oct 2024 20:42:26 +0000
Received: from mout.gmx.net ([212.227.15.15])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t44IL-00000001iBp-1XuH
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Oct 2024 20:19:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.net;
	s=s31663417; t=1729801127; x=1730405927; i=wahrenst@gmx.net;
	bh=JRrp6JLKk7ZewfhLxhmIMUVWuQ9FaYJ7taL+ewhOlow=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-Id:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=ph1S/yzxaSFMuUMjJULTbbm+fsL+wECSBxU56vEZvnETgFB+vq+2R0WCmBVU8Yi6
	 k6zzyp950Q+YXdcOLDZ5VoszNaOFSBPQgkcUaeaKbQiY6XWlG4B94CMNRbCGv1RAi
	 IUBW3HrVGrtPWUb+UYTnTgNaue6GBkjgfoBIQO0hq66zb9t7TDyfFq6yMWarqHEG6
	 U/gtNnWNQNRIhu/xt0CB03HB1YY4lonltbw2f1lsYTmLjLpL8S08b8FuHo1nRMQg8
	 KaB6oYgyzphWEplATpMD8LM4cJrNKVlCLD1N2ukly5CA1Og9i2nDOnZWSnFf3VIl1
	 bKRykL/6LjR6SvE1vQ==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from stefanw-SCHENKER ([37.4.248.43]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1Ml6qM-1tkmxX2UY8-00mTVU; Thu, 24
 Oct 2024 22:18:47 +0200
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
Subject: [PATCH 6/9] usb: dwc2: gadget: Introduce register restore flags
Date: Thu, 24 Oct 2024 22:18:34 +0200
Message-Id: <20241024201837.79927-7-wahrenst@gmx.net>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241024201837.79927-1-wahrenst@gmx.net>
References: <20241024201837.79927-1-wahrenst@gmx.net>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:CqgYeeZNUwYzTJ4GE0juj9SGPyyOYxIPFyKOUz1FCHoELlxSPBO
 uCLm65+qf767P9c8nkrvo5VhNJ7oPFi4WFKbWl3AseMCGXpBsR/KLyp1MCdLM+nMMpNRV9T
 /pnK0vR8LoRYHBV2HlLfMXf+44c7VWxKOP19k6KPCJG3KnWLT1eF+bRkJMlQYx3ZO3OC3BV
 mioA28LqtZbvj1VyXmTZA==
UI-OutboundReport: notjunk:1;M01:P0:hZar9UeG20M=;j9ZFZy0OgPtqao0NNzl58dNPiZt
 EpetYR4ISrhIiTBcgszQxelh4/1CiqikfvXspNioGdzClbIku0Ca1slnzFl7p4gMzTnZzyGXD
 WspSwVPO2xQq13VhQorPUu2G0Ugx3T720iQsHjk96uMR5O1EDfZurG0DpLGPIrSV2A30r8gw5
 KnYXZsm/siTlVMeAapnw3wCinkgXGrFs38airnjTltCGbjOvTXdLNla3j5TR+ASk+biUDEfUB
 y9hsFE/rFoYqVAqZv+dRHaIXzr6wv0nR51lzYvIUkcCl2+zZ7aDSTLHaHKi/hnua5R63omMbR
 wVZsWXvBxvUAKlgnHufIXU13+aRm9Z+oeB140OsochtcJsuY6NpQOMBnJJV04lT7JhIVXCnUE
 saiVnVyWl77MWY5cLDLJduPA3uKZ4A4lF3FcInPJV6H2sc4GPk4+DvJ/TFmiAH0KkHPAourcH
 gl0Sw2LjYjWR2uSuwJeIeIoU2jdNyhiSRa3DtW94Eh4/i0M5gF4RZgCfrOdcyrOtk90rIIrbd
 31oWHzbscthVEFo3TT+RhKrXo8P6lT4Kl8Rle7kHIr8k66brM+Y2+fLHji/B6gh9/1379BRhZ
 CjIkp2jrIIbfBUSmHP7DoMCFWGmrTto/1iUonxGlDoZaqOnh50mVEt079FecoxfDzfxymvJyW
 HA28UYhsdQb9Y8xkyxblKuwSvMjirFIcPfwrFJ0wW81KGjNiedDQ8D1bguartUg84+eHpIFQQ
 6SkHFnL0XQrTcQA9UTnVr/0gYOSrYvQAWzQngQhZ8zsaW7uJsSc5PcGEh3sXakkdNH0G4GDHj
 g3gsx4tQHeVpU1JuMO6gSz/Q==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241024_131857_738211_57998435 
X-CRM114-Status: GOOD (  13.14  )
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

dwc2_restore_device_registers() use a single boolean
to decide about the register restoring behavior.
So replace this with a flags parameter, which can
be extended later.

No functional change intended.

Signed-off-by: Stefan Wahren <wahrenst@gmx.net>
=2D--
 drivers/usb/dwc2/core.h   |  6 ++++--
 drivers/usb/dwc2/gadget.c | 12 +++++++-----
 2 files changed, 11 insertions(+), 7 deletions(-)

diff --git a/drivers/usb/dwc2/core.h b/drivers/usb/dwc2/core.h
index 2bd74f3033ed..48f4b639ca2f 100644
=2D-- a/drivers/usb/dwc2/core.h
+++ b/drivers/usb/dwc2/core.h
@@ -1127,6 +1127,8 @@ struct dwc2_hsotg {
 #define DWC2_FS_IOT_ID		0x55310000
 #define DWC2_HS_IOT_ID		0x55320000

+#define DWC2_RESTORE_DCTL BIT(0)
+
 #if IS_ENABLED(CONFIG_USB_DWC2_HOST) || IS_ENABLED(CONFIG_USB_DWC2_DUAL_R=
OLE)
 	union dwc2_hcd_internal_flags {
 		u32 d32;
@@ -1420,7 +1422,7 @@ int dwc2_hsotg_set_test_mode(struct dwc2_hsotg *hsot=
g, int testmode);
 #define dwc2_is_device_connected(hsotg) (hsotg->connected)
 #define dwc2_is_device_enabled(hsotg) (hsotg->enabled)
 int dwc2_backup_device_registers(struct dwc2_hsotg *hsotg);
-int dwc2_restore_device_registers(struct dwc2_hsotg *hsotg, int remote_wa=
keup);
+int dwc2_restore_device_registers(struct dwc2_hsotg *hsotg, unsigned int =
flags);
 int dwc2_gadget_enter_hibernation(struct dwc2_hsotg *hsotg);
 int dwc2_gadget_exit_hibernation(struct dwc2_hsotg *hsotg,
 				 int rem_wakeup, int reset);
@@ -1459,7 +1461,7 @@ static inline int dwc2_hsotg_set_test_mode(struct dw=
c2_hsotg *hsotg,
 static inline int dwc2_backup_device_registers(struct dwc2_hsotg *hsotg)
 { return 0; }
 static inline int dwc2_restore_device_registers(struct dwc2_hsotg *hsotg,
-						int remote_wakeup)
+						unsigned int flags)
 { return 0; }
 static inline int dwc2_gadget_enter_hibernation(struct dwc2_hsotg *hsotg)
 { return 0; }
diff --git a/drivers/usb/dwc2/gadget.c b/drivers/usb/dwc2/gadget.c
index e7bf9cc635be..96d703f4c509 100644
=2D-- a/drivers/usb/dwc2/gadget.c
+++ b/drivers/usb/dwc2/gadget.c
@@ -5203,11 +5203,11 @@ int dwc2_backup_device_registers(struct dwc2_hsotg=
 *hsotg)
  * if controller power were disabled.
  *
  * @hsotg: Programming view of the DWC_otg controller
- * @remote_wakeup: Indicates whether resume is initiated by Device or Hos=
t.
+ * @flags: Defines which registers should be restored.
  *
  * Return: 0 if successful, negative error code otherwise
  */
-int dwc2_restore_device_registers(struct dwc2_hsotg *hsotg, int remote_wa=
keup)
+int dwc2_restore_device_registers(struct dwc2_hsotg *hsotg, unsigned int =
flags)
 {
 	struct dwc2_dregs_backup *dr;
 	int i;
@@ -5223,7 +5223,7 @@ int dwc2_restore_device_registers(struct dwc2_hsotg =
*hsotg, int remote_wakeup)
 	}
 	dr->valid =3D false;

-	if (!remote_wakeup)
+	if (flags & DWC2_RESTORE_DCTL)
 		dwc2_writel(hsotg, dr->dctl, DCTL);

 	dwc2_writel(hsotg, dr->daintmsk, DAINTMSK);
@@ -5414,6 +5414,7 @@ int dwc2_gadget_exit_hibernation(struct dwc2_hsotg *=
hsotg,
 	u32 gpwrdn;
 	u32 dctl;
 	int ret =3D 0;
+	unsigned int flags =3D 0;
 	struct dwc2_gregs_backup *gr;
 	struct dwc2_dregs_backup *dr;

@@ -5476,6 +5477,7 @@ int dwc2_gadget_exit_hibernation(struct dwc2_hsotg *=
hsotg,
 		dctl =3D dwc2_readl(hsotg, DCTL);
 		dctl |=3D DCTL_PWRONPRGDONE;
 		dwc2_writel(hsotg, dctl, DCTL);
+		flags |=3D DWC2_RESTORE_DCTL;
 	}
 	/* Wait for interrupts which must be cleared */
 	mdelay(2);
@@ -5491,7 +5493,7 @@ int dwc2_gadget_exit_hibernation(struct dwc2_hsotg *=
hsotg,
 	}

 	/* Restore device registers */
-	ret =3D dwc2_restore_device_registers(hsotg, rem_wakeup);
+	ret =3D dwc2_restore_device_registers(hsotg, flags);
 	if (ret) {
 		dev_err(hsotg->dev, "%s: failed to restore device registers\n",
 			__func__);
@@ -5619,7 +5621,7 @@ int dwc2_gadget_exit_partial_power_down(struct dwc2_=
hsotg *hsotg,
 		/* Restore DCFG */
 		dwc2_writel(hsotg, dr->dcfg, DCFG);

-		ret =3D dwc2_restore_device_registers(hsotg, 0);
+		ret =3D dwc2_restore_device_registers(hsotg, DWC2_RESTORE_DCTL);
 		if (ret) {
 			dev_err(hsotg->dev, "%s: failed to restore device registers\n",
 				__func__);
=2D-
2.34.1


