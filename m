Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02361CAC5B0
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 24 Sep 2025 09:59:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ym6707fq3Z/7taO/DrO5zucHsh4hcfX3oAy1NAejIM0=; b=r7EkvyPpU8rE4Km9nMUaD0fOYF
	9pf6omT1/Z5QYGQoHKfTw45b8xKio3KksUKuS/dqr+M6lMpi3iMud5GkczinCJEv43HryXGitUaXS
	7dO0+1mP7eJ+oFamJUWDsVB+M4Gr54bgWHrWya4WjvRQmo9bxcolx6Ubcb3HoF1isN0vmO+sCXqR1
	Jp7/Cy/nIKDBu7ObY99TUVTwcVclkPdZsEpVBGYt9eWoZE4jPLbuGAdiug3byM4GBTGYj1SRyKBos
	dQEhEGHbOpaAAnjiOmhraq3s5KyNdOEjODDSxdajx34MSIAWebmDlRMRvrmm7EEvQSmMl/8s8kEB4
	EADMbOnA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1MHO-0000000GHE5-04W0;
	Wed, 24 Sep 2025 09:59:18 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1MHK-0000000GHAA-2c7l
	for linux-arm-kernel@lists.infradead.org;
	Wed, 24 Sep 2025 09:59:16 +0000
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-45df0cde41bso45976265e9.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 24 Sep 2025 02:59:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=arturia.com; s=arturia; t=1758707953; x=1759312753; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ym6707fq3Z/7taO/DrO5zucHsh4hcfX3oAy1NAejIM0=;
        b=VFZcGRymcRMmkuU4uE+wxLYJRtTDNZSHuj2abRNhYFgrsMWPCyGa80IkhK80NR8eHr
         D+cUbYKbOwKzYyUlhFGQNymWnzgfIXXZ743S110T8CRaly4J+kSIRmNXLjVfXSNqBFdo
         tfRv2m9ft6E+MZs29NQCZj2JR4fT6OZX9SRnI/2tV1v842yAtFPIZycDn1W0C4gD7lvK
         5M1xAtyBLFZ46F+zulHn/QbgTi9mPr8KhX1X2XCOuR+EfEgg/l4SdDnTi1+SwnxioqOB
         AcMVKKE3iMV/8imxiXyhoHebo/Giw6dPzD4NwcnsU3kUyO+140wNDnSEuQ8rGnRqVFs1
         wn3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758707953; x=1759312753;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ym6707fq3Z/7taO/DrO5zucHsh4hcfX3oAy1NAejIM0=;
        b=f0ymGVpvKAbcwQEgaw3RAyo00z9YLjfAQMwCg+YtDvviKy8eZq2XvnSn2111rT0SHb
         LF0Gu8FE4TW3iJTeR0xfmG8SDmBy310utmWswByubilLITPZP/8t03/z2ZTXUHIvCmSq
         VlDYjw3NQx863RXfSaygOskWDzSa8+zsljCuI8EMoPohObCjwUOWCJwBECxNo5E+22ce
         8ypyL9CDPdwkOMEYl2kMcl62q+JNrNCQL8SvsVWrODhvSY0S1hXoOl2H3GoXBQKYtdn8
         SahjwUCLFAUgzscRktdsHfJLmEDZLTktM/m+79qvUkPaCpX+WWrOvEUaVbR4MGsJPz8R
         XQ/w==
X-Forwarded-Encrypted: i=1; AJvYcCV5V2eM2aKjDoAuECz3HO3aAJgKF5LDtrjZ79B8PimzrVHGnRiwAgffGC247yu2MKyonzJpiXSNMlFpi/zu1Cd3@lists.infradead.org
X-Gm-Message-State: AOJu0YzBLKHov6NJ93roc06Z5noVptgc9lb4mjgsaYGGM+bRgZlCt5y/
	Orgiem/Hhc5lw6V/iY104/x6P0Hu+LbrFzLIjlt0haBfTGTzn9f2XocbYKN13yZcJjQ=
X-Gm-Gg: ASbGncuofHDqBT4OTk+NI/WBa7TwKZLSggsY5JVTIH09FlzKG8v1kAjMXQzGV3Ez7EU
	O6p9mPeiaf112EQDyIxTpjJ12dkfRDDP1yPafHbI4wWRtfwGghEQM8PxRNXWIPRd+15zYYBopZF
	TC5+remQTtvGp9FomJuaj+XgrFkk9N6RT/FoHYsVd/RKEev8U0SBpdPZCISn8yDKkwy0TfpN5/z
	LE6CZC2gDU11YwFtevQPpHMuvdeX8GHHZRoe5A4USvwA0JoKmLW18TfBtXDjQ9AiK3tDyVSEA7i
	gdMNEPzCN+/EAFo93TnycF4Z9AOn5vw9vzCopgXxHvejHp5CQR4OI+UcZFI06ZLRppXg2+aLlv0
	R8s+5UtEFK02VMQtei+1z8Oof0mkdtkWfOHpoomXJgXAqlZP12VmUNfGArhQ=
X-Google-Smtp-Source: AGHT+IFw5ahu2jMrj2SZGLBmkUIeignINv/sQ0n0/PFoOuc9PlHmih4l5xsXSwxJhrQBfLFkFpSDyg==
X-Received: by 2002:a05:600c:1d20:b0:46d:9d28:fb78 with SMTP id 5b1f17b1804b1-46e1d9953cemr72776175e9.8.1758707952623;
        Wed, 24 Sep 2025 02:59:12 -0700 (PDT)
Received: from localhost.localdomain ([2a01:cb15:854c:e000:4c2c:f6a2:3825:3b1e])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-46e2a9be58bsm25633335e9.12.2025.09.24.02.59.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Sep 2025 02:59:12 -0700 (PDT)
From: Victor Krawiec <victor.krawiec@arturia.com>
To: heiko@sntech.de,
	vkoul@kernel.org,
	kishon@kernel.org
Cc: linux-rockchip@lists.infradead.org,
	linux-phy@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Victor Krawiec <victor.krawiec@arturia.com>
Subject: [PATCH] phy: rockchip-inno-usb2: fix otg state machine when in USB-C DFP mode
Date: Wed, 24 Sep 2025 11:56:45 +0200
Message-ID: <20250924095644.79259-2-victor.krawiec@arturia.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250924_025914_705888_FA101BB0 
X-CRM114-Status: GOOD (  28.75  )
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

In rockchip-inno-usb2 phy driver, we use a state machine called
'otg_sm_work' to dynamically manage power consumption for phy otg-port.
This state machine relies on EXTCON_USB_HOST state to manage host role.
The EXTCON_USB_HOST state is set depending on the OTG ID pin

On a device that does role switching with a USB-C connector (for example
using a fusb302 detection chip) the ID pin does not exists. Therefore the
EXTCON_USB_HOST state is never set. When in DFP mode this causes the state
machine to go in the DCP state instead of going in the A_HOST state. The
end result for the user is that the system does not enumerate connected
FS/HS devices.

This patch adds a 'set_mode' callback that allows the phy driver to be
notified when the role changes. The state machine can now check if the
device is in DFP state and do work accordingly"

Signed-off-by: Victor Krawiec <victor.krawiec@arturia.com>
---
This patch has been made by analyzing RK3399 TRM and Rockchip's vendor
tree which is based on a 6.6 Android kernel. The patch feels a bit like
hacking the state machine by bypassing the EXTCON_USB_HOST. I'm new to USB
driver development so it is very likely that I missed something. Please
see this patch as opening a new topic rather than as a clever solution.

Instead of using a boolean 'data_role_dfp' in the 'set_role' callback I
tried using 'extcon_set_state_sync' to set EXTCON_USB_HOST state.
Unfortunately since the drivers subscribes to the event it triggers two
concurrent executions of the state machine which makes the code very hard
to follow (see schema below)

Lastly the patch only works when using the same sequence as Rockchip's
vendor tree to put the phy in charger detection mode. This sequence is 
provided as a comment in their tree:
/* Set the PHY in charger detection mode.
 * The conditions for charger detection:
 * 1. Set the PHY in normal mode to keep the UTMI_CLK on.
 * 2. Set the utmi_opmode in non-driving mode.
 * 3. Set the utmi_xcvrselect to FS speed.
 * 4. Set the utmi_termselect to FS speed.
 * 5. Enable the DP/DM pulldown resistor.
 */
Thus the change in RK3399 registers.

bvalid_irq
    |
    |
otg_sm_work
    |            set_mode
    |               |
    |               |
    |        EXTCON_USB_HOST
    |               |
    |               |
    |       rockchip_otg_event
    |               |
    |               |
    |          otg_sm_work
    |               |
    |               |

 drivers/phy/rockchip/phy-rockchip-inno-usb2.c | 40 +++++++++++++++++--
 1 file changed, 37 insertions(+), 3 deletions(-)

diff --git a/drivers/phy/rockchip/phy-rockchip-inno-usb2.c b/drivers/phy/rockchip/phy-rockchip-inno-usb2.c
index b0f23690ec30..e8d99f67086e 100644
--- a/drivers/phy/rockchip/phy-rockchip-inno-usb2.c
+++ b/drivers/phy/rockchip/phy-rockchip-inno-usb2.c
@@ -26,6 +26,7 @@
 #include <linux/mfd/syscon.h>
 #include <linux/usb/of.h>
 #include <linux/usb/otg.h>
+#include <linux/usb/role.h>
 
 #define BIT_WRITEABLE_SHIFT	16
 #define SCHEDULE_DELAY		(60 * HZ)
@@ -190,6 +191,7 @@ struct rockchip_usb2phy_cfg {
  * @suspended: phy suspended flag.
  * @vbus_attached: otg device vbus status.
  * @host_disconnect: usb host disconnect status.
+ * @data_role_dfp: dual role dfp/ufp status.
  * @bvalid_irq: IRQ number assigned for vbus valid rise detection.
  * @id_irq: IRQ number assigned for ID pin detection.
  * @ls_irq: IRQ number assigned for linestate detection.
@@ -210,6 +212,7 @@ struct rockchip_usb2phy_port {
 	bool		suspended;
 	bool		vbus_attached;
 	bool            host_disconnect;
+	bool		data_role_dfp;
 	int		bvalid_irq;
 	int		id_irq;
 	int		ls_irq;
@@ -648,11 +651,37 @@ static int rockchip_usb2phy_exit(struct phy *phy)
 	return 0;
 }
 
+static int rockchip_usb2phy_set_mode(struct phy *phy,
+				     enum phy_mode mode, int submode)
+{
+	struct rockchip_usb2phy_port *rport = phy_get_drvdata(phy);
+
+	dev_dbg(&rport->phy->dev, "%s: mode=%d\n", __func__, (int)mode);
+
+	if (rport->port_id != USB2PHY_PORT_OTG)
+		return 0;
+
+	switch (mode) {
+	case PHY_MODE_USB_DEVICE:
+		rport->data_role_dfp = false;
+		break;
+	case PHY_MODE_USB_HOST:
+		rport->data_role_dfp = true;
+		break;
+	default:
+		dev_info(&rport->phy->dev, "illegal mode\n");
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
 static const struct phy_ops rockchip_usb2phy_ops = {
 	.init		= rockchip_usb2phy_init,
 	.exit		= rockchip_usb2phy_exit,
 	.power_on	= rockchip_usb2phy_power_on,
 	.power_off	= rockchip_usb2phy_power_off,
+	.set_mode	= rockchip_usb2phy_set_mode,
 	.owner		= THIS_MODULE,
 };
 
@@ -682,9 +711,12 @@ static void rockchip_usb2phy_otg_sm_work(struct work_struct *work)
 			rockchip_usb2phy_power_off(rport->phy);
 		fallthrough;
 	case OTG_STATE_B_IDLE:
-		if (extcon_get_state(rphy->edev, EXTCON_USB_HOST) > 0) {
+		if (extcon_get_state(rphy->edev, EXTCON_USB_HOST) > 0 ||
+			rport->data_role_dfp) {
 			dev_dbg(&rport->phy->dev, "usb otg host connect\n");
 			rport->state = OTG_STATE_A_HOST;
+			rphy->chg_state = USB_CHG_STATE_UNDEFINED;
+			rphy->chg_type = POWER_SUPPLY_TYPE_UNKNOWN;
 			rockchip_usb2phy_power_on(rport->phy);
 			return;
 		} else if (vbus_attach) {
@@ -729,6 +761,7 @@ static void rockchip_usb2phy_otg_sm_work(struct work_struct *work)
 			notify_charger = true;
 			rphy->chg_state = USB_CHG_STATE_UNDEFINED;
 			rphy->chg_type = POWER_SUPPLY_TYPE_UNKNOWN;
+			rockchip_usb2phy_power_off(rport->phy);
 		}
 
 		if (rport->vbus_attached != vbus_attach) {
@@ -759,7 +792,7 @@ static void rockchip_usb2phy_otg_sm_work(struct work_struct *work)
 		if (extcon_get_state(rphy->edev, EXTCON_USB_HOST) == 0) {
 			dev_dbg(&rport->phy->dev, "usb otg host disconnect\n");
 			rport->state = OTG_STATE_B_IDLE;
-			rockchip_usb2phy_power_off(rport->phy);
+			sch_work = true;
 		}
 		break;
 	default:
@@ -1294,6 +1327,7 @@ static int rockchip_usb2phy_otg_port_init(struct rockchip_usb2phy *rphy,
 	 */
 	rport->suspended = true;
 	rport->vbus_attached = false;
+	rport->data_role_dfp = false;
 
 	mutex_init(&rport->mutex);
 
@@ -1878,7 +1912,7 @@ static const struct rockchip_usb2phy_cfg rk3399_phy_cfgs[] = {
 			}
 		},
 		.chg_det = {
-			.opmode		= { 0xe454, 3, 0, 5, 1 },
+			.opmode		= { 0xe454, 8, 0, 0, 0x1d7 },
 			.cp_det		= { 0xe2ac, 2, 2, 0, 1 },
 			.dcp_det	= { 0xe2ac, 1, 1, 0, 1 },
 			.dp_det		= { 0xe2ac, 0, 0, 0, 1 },

base-commit: f83ec76bf285bea5727f478a68b894f5543ca76e
-- 
2.43.0


