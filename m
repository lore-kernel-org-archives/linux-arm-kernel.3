Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5DD2D0C5FD
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Oct 2024 10:45:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JRrp6JLKk7ZewfhLxhmIMUVWuQ9FaYJ7taL+ewhOlow=; b=AdAsg9yFYDnzYUZHWU1J+2f8yS
	j3eyPpUHLA7vWSBJ5w4WsZKbAbBToNSUyunfl3JhLaUU1hUyqvvJF8c/dpeB3RInOJQgIQdWKC5Rd
	IX2BVYzfdwOmEmT+kQIIakWjFA4xkrVGEENy/k8KqMNBJ+RW7BswEQMUCOxeNZjbbzzNtMj2TOSaZ
	UOaKGYFJusCADFB9MfRuDSDFbWEuq+FieEeoNhvWG61soEyHigU12H5AF507S40ViWABgrefO6Axa
	Nxu+Ko4BaSx6GbhB6Rm9SdhZVJ7chjKTKSKlhqw1zeXFvpHwFRHRqvczVP8oVnDWFNIitMHcgtUFQ
	Y820atJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t4Hoc-00000003OZC-30Ay;
	Fri, 25 Oct 2024 10:45:10 +0000
Received: from mout.gmx.net ([212.227.17.22])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t4HgR-00000003NPd-0oa5
	for linux-arm-kernel@lists.infradead.org;
	Fri, 25 Oct 2024 10:36:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.net;
	s=s31663417; t=1729852594; x=1730457394; i=wahrenst@gmx.net;
	bh=JRrp6JLKk7ZewfhLxhmIMUVWuQ9FaYJ7taL+ewhOlow=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-Id:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=PRWTmLP/VQd2nMDt66hlDPjNqXP89Hcf5M/7j9H7cztnwzZ2J9RAouh9MIeiWOgl
	 0I0/usUQynrFmaiS4Np/yqIUCbPS+n2evAAL6LigwHsnG6WBMekVC3KksmHi3ksn0
	 iZ4HEIyM9SGFugULHMfPdTAVBSlWETVtlsMuil9xLB2XEeu2izkQe9eHzqcTBHANb
	 RNjLdaQlvrS8jJSMKWGCKjQupE377g29r/iVvZ5snzY8pfdLfXy6aM1ljNd6t241p
	 I7rGYDNeRl38AihGCTDoZmHAwKQVLvb0cYeGkP15oVhclq89ejDZM5rIT8IpDr1k8
	 esuG4Zbk6qqYKdfyiw==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from stefanw-SCHENKER ([37.4.248.43]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MtOGU-1ttVQS2KAY-013Pmc; Fri, 25
 Oct 2024 12:36:34 +0200
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
	"Ivan T . Ivanov" <iivanov@suse.de>,
	linux-arm-kernel@lists.infradead.org,
	kernel-list@raspberrypi.com,
	bcm-kernel-feedback-list@broadcom.com,
	dmaengine@vger.kernel.org,
	linux-mmc@vger.kernel.org,
	linux-usb@vger.kernel.org,
	Stefan Wahren <wahrenst@gmx.net>
Subject: [PATCH V5 6/9] usb: dwc2: gadget: Introduce register restore flags
Date: Fri, 25 Oct 2024 12:36:18 +0200
Message-Id: <20241025103621.4780-7-wahrenst@gmx.net>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241025103621.4780-1-wahrenst@gmx.net>
References: <20241025103621.4780-1-wahrenst@gmx.net>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:3avDBliNzEcs6oIpGJspN+k6fohsov4qbRg5nvIJUrLCIkRywmC
 tEjSG84jBaok3RUL3gQ52nwfQ1M9XkDRdHYWies0VYpsfgFJY+ug0VpCBTgV5zi7pbY2ZsI
 5rQBl4liK/dzR37yNLq4h/sRTBcdK8BNODu9DAAD51YZN2p0DcV+Js26dwUvUdLUe+6l2Xu
 8xlkKrPRy1vzXhURYLtmQ==
UI-OutboundReport: notjunk:1;M01:P0:UbcCWlK87hM=;HWroYRHXLl0YxR8ty4UfDJedLR7
 3OcFP764Y9yum+aPsS9Mbm1IBAkw1LGCM3n94FSWmPs8CySQKaqCZi+4H34zGTMTFCmrAEZVZ
 hv2bRhSnpzsZBwvk9Z1+I28tntAMQirczyW7WORergEaQkiOuBWr8iH6tUY+yX4aWLK+ER6H4
 Tq5K3NV9mREfUbqX+haC+QvOnmcD8j2ZHqQ6oOpeHoyTfpKkf6Ps58aDw10SkZ5OJY33xym3b
 KHA+8ItCnme0tnXwLxBUJf8+gDJt+RuRqKzaPkQ072a/8+ze4bdcm4U+nkJd6IoP9XydcDwB6
 4GaV/9eRLAvsUTbph3F9h/aRZlyzuqlU7IeLC1seSg3YG0CkDqQ/0IVORCG30GoesnJ19WJsu
 XPInytJSHa0wJt//O1aEkYRBKmOuI9TDI13l8rggQgA6wZYIFWLX/qCsxpmG33SOjaIbRkScM
 r6dsOvcFwYJRFWjxFSHkO/E5opJiMW38M/1P3LJdmusGP7g/QW9+5cAKajjEVws/PvZw9t/xk
 nYfvOXEzNExZWG7vF1471SLW5gL9rGc9lwdZsAqSbWLOf4uLjpSkMdbqPQzhkIXHeQORzpKBm
 pnWKEqCSBbkGeslUWBt8XaCFPBpWs0YtEWN+I5yQPmcbjMo+XT1NkwaanbwwAeB37Ce2ApYIv
 DtzaFimg9Ou0XH3jtV1XxeWwLgF4N4M/esDVkRjdJVIq/HqYV4PSSKn8IvdCA2GD4BM8bJOBZ
 m2mHTrDRZS7B0oW+nJ2RTWQYDCmhObiwkFaECY18pX0q/6rRI9egfz/r7Dk5K2V/88AEzDjZj
 iz0g9+/FZyakyKcIMLAZNKAQ==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241025_033643_604872_EAE598AE 
X-CRM114-Status: GOOD (  13.78  )
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


