Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 028BFEEC2BE
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Feb 2026 01:46:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xVorqkjNZo3F7uj4F7Bq9iG2jOVtSpIQsPuQvSGI2W8=; b=kVxE2A50WPCIprWUkymt6xCbZz
	mXtM0cLXDpmMPiTBJ/pHU1t79j7hc/zwsoTcWsclRkzYhzTOXehiYAux+sqandeDBNZIxURbbHVLa
	2Ib9Zf6cpO0SZpf7mRmLCtzuxSRhEG9rxhhLr1JGSJjImMemyNK9IbG+iWvgK4JMVmKdw609h+zin
	A6gRKt7zljz7RhmG6p7YmT5NyrY6DbOwAZt/c2FXPiaTJN1zgsbBgXlusRQj06hgXJ9joWCjT7nLd
	EBbQX3cdZXmnsJckOWfSTN5TIjclCJp7yg2T/Ql/ztft3/lzXd1OmEVYCTDDBV8StSUg+jIkdfUJ+
	A1yH+BWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuhUq-00000001INV-3MVK;
	Tue, 24 Feb 2026 01:45:56 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuhUm-00000001IKA-1usy
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Feb 2026 01:45:53 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 30738445A3;
	Tue, 24 Feb 2026 01:45:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 0708CC4AF0F;
	Tue, 24 Feb 2026 01:45:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771897550;
	bh=lOXUdHAknlORz4WutDBBxQ6j9aq0kZdEzSPNA6F+0dU=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=I+uVTJIHP+ZDDlQ/KOiwLEIAa6BdI2G6Fc+3ZRIihnVrjyrJ8wSX8hjoFGydo7CbM
	 54byam3yvvcudJzlerXJbdOhx3uI+p+17GuSNs1QHCiiELeBs/h5xnmckAxDMVMAa2
	 GPGCmU1Goz0s9m6ASRsHKHrM/BwjS+6hEzkv9CpKQb7LBvDuSZxOiDYqB+/10IM9mS
	 e0BA2Wr8ktz1NKL6lNlVj8veB1zBjy53rNolA6R6bXQQWlQN1yYSC7oQpvqEG5sCXH
	 UHfygnS9VCAdXbrcGhHxHPOHVl+lOPrsiMko/DeuqPnO2u4xo2yR2tQ+CBP9+bH0Je
	 sb/Eby7/SIGug==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F26B5EEC2BE;
	Tue, 24 Feb 2026 01:45:49 +0000 (UTC)
From: Amit Sunil Dhamne via B4 Relay <devnull+amitsd.google.com@kernel.org>
Date: Tue, 24 Feb 2026 01:45:36 +0000
Subject: [PATCH v8 6/6] usb: typec: tcpm/tcpci_maxim: deprecate WAR for
 setting charger mode
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260224-max77759-charger-v8-6-eb86bd570e9c@google.com>
References: <20260224-max77759-charger-v8-0-eb86bd570e9c@google.com>
In-Reply-To: <20260224-max77759-charger-v8-0-eb86bd570e9c@google.com>
To: Sebastian Reichel <sre@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
 Lee Jones <lee@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Badhri Jagan Sridharan <badhri@google.com>, 
 Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
 Peter Griffin <peter.griffin@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, Mark Brown <broonie@kernel.org>, 
 Matti Vaittinen <mazziesaccount@gmail.com>, 
 Andrew Morton <akpm@linux-foundation.org>
Cc: linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-usb@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 RD Babiera <rdbabiera@google.com>, Kyle Tso <kyletso@google.com>, 
 Amit Sunil Dhamne <amitsd@google.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1771897548; l=4045;
 i=amitsd@google.com; s=20241031; h=from:subject:message-id;
 bh=mMnQywZ79m54T70kkS6R9rVtGFJGQ8QQS9OrefFa+7E=;
 b=Vbo0B2I/nwEwbqLC6gBrYXB5R07Va9I3qkpkxI4KgO6MbYtH1j180oL4AaqA+gtTnRYPwij5K
 /lYf1+FreblCsbwBnn2t1anY9pq95brB/G2CZ65/ZJ0pDASX8l1TcOY
X-Developer-Key: i=amitsd@google.com; a=ed25519;
 pk=wD+XZSST4dmnNZf62/lqJpLm7fiyT8iv462zmQ3H6bI=
X-Endpoint-Received: by B4 Relay for amitsd@google.com/20241031 with
 auth_id=262
X-Original-From: Amit Sunil Dhamne <amitsd@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260223_174552_558095_FBD93992 
X-CRM114-Status: GOOD (  17.87  )
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
Reply-To: amitsd@google.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

From: Amit Sunil Dhamne <amitsd@google.com>

TCPCI maxim driver directly writes to the charger's register space to
set charger mode depending on the power role. As MAX77759 chg driver
exists, this WAR is not required.

Instead, use a regulator interface to source vbus when typec is in
source power mode. In other power modes, this regulator will be turned
off if active.

Signed-off-by: Amit Sunil Dhamne <amitsd@google.com>
Reviewed-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Reviewed-by: André Draszik <andre.draszik@linaro.org>
---
 drivers/usb/typec/tcpm/tcpci_maxim.h      |  1 +
 drivers/usb/typec/tcpm/tcpci_maxim_core.c | 54 +++++++++++++++++++------------
 2 files changed, 34 insertions(+), 21 deletions(-)

diff --git a/drivers/usb/typec/tcpm/tcpci_maxim.h b/drivers/usb/typec/tcpm/tcpci_maxim.h
index b33540a42a953dc6d8197790ee4af3b6f52791ce..b314606eb0f67ddbc80d8760244aa6dee61bebc1 100644
--- a/drivers/usb/typec/tcpm/tcpci_maxim.h
+++ b/drivers/usb/typec/tcpm/tcpci_maxim.h
@@ -60,6 +60,7 @@ struct max_tcpci_chip {
 	struct tcpm_port *port;
 	enum contamiant_state contaminant_state;
 	bool veto_vconn_swap;
+	struct regulator *vbus_reg;
 };
 
 static inline int max_tcpci_read16(struct max_tcpci_chip *chip, unsigned int reg, u16 *val)
diff --git a/drivers/usb/typec/tcpm/tcpci_maxim_core.c b/drivers/usb/typec/tcpm/tcpci_maxim_core.c
index 19f63865079658fb2a446dc390262d141b940e9a..c0ee7e6959edf9666e499a6fa085fbca9f2b07f3 100644
--- a/drivers/usb/typec/tcpm/tcpci_maxim_core.c
+++ b/drivers/usb/typec/tcpm/tcpci_maxim_core.c
@@ -10,6 +10,7 @@
 #include <linux/kernel.h>
 #include <linux/module.h>
 #include <linux/regmap.h>
+#include <linux/regulator/consumer.h>
 #include <linux/usb/pd.h>
 #include <linux/usb/tcpci.h>
 #include <linux/usb/tcpm.h>
@@ -35,12 +36,6 @@
  */
 #define TCPC_RECEIVE_BUFFER_LEN				32
 
-#define MAX_BUCK_BOOST_SID				0x69
-#define MAX_BUCK_BOOST_OP				0xb9
-#define MAX_BUCK_BOOST_OFF				0
-#define MAX_BUCK_BOOST_SOURCE				0xa
-#define MAX_BUCK_BOOST_SINK				0x5
-
 static const struct regmap_range max_tcpci_tcpci_range[] = {
 	regmap_reg_range(0x00, 0x95)
 };
@@ -202,32 +197,49 @@ static void process_rx(struct max_tcpci_chip *chip, u16 status)
 	tcpm_pd_receive(chip->port, &msg, rx_type);
 }
 
+static int get_vbus_regulator_handle(struct max_tcpci_chip *chip)
+{
+	if (IS_ERR_OR_NULL(chip->vbus_reg)) {
+		chip->vbus_reg = devm_regulator_get_exclusive(chip->dev,
+							      "vbus");
+		if (IS_ERR_OR_NULL(chip->vbus_reg)) {
+			dev_err(chip->dev,
+				"Failed to get vbus regulator handle\n");
+			return -ENODEV;
+		}
+	}
+
+	return 0;
+}
+
 static int max_tcpci_set_vbus(struct tcpci *tcpci, struct tcpci_data *tdata, bool source, bool sink)
 {
 	struct max_tcpci_chip *chip = tdata_to_max_tcpci(tdata);
-	u8 buffer_source[2] = {MAX_BUCK_BOOST_OP, MAX_BUCK_BOOST_SOURCE};
-	u8 buffer_sink[2] = {MAX_BUCK_BOOST_OP, MAX_BUCK_BOOST_SINK};
-	u8 buffer_none[2] = {MAX_BUCK_BOOST_OP, MAX_BUCK_BOOST_OFF};
-	struct i2c_client *i2c = chip->client;
 	int ret;
 
-	struct i2c_msg msgs[] = {
-		{
-			.addr = MAX_BUCK_BOOST_SID,
-			.flags = i2c->flags & I2C_M_TEN,
-			.len = 2,
-			.buf = source ? buffer_source : sink ? buffer_sink : buffer_none,
-		},
-	};
-
 	if (source && sink) {
 		dev_err(chip->dev, "Both source and sink set\n");
 		return -EINVAL;
 	}
 
-	ret = i2c_transfer(i2c->adapter, msgs, 1);
+	ret = get_vbus_regulator_handle(chip);
+	if (ret) {
+		/*
+		 * Regulator is not necessary for sink only applications. Return
+		 * success in cases where sink mode is being modified.
+		 */
+		return source ? ret : 1;
+	}
+
+	if (source) {
+		if (!regulator_is_enabled(chip->vbus_reg))
+			ret = regulator_enable(chip->vbus_reg);
+	} else {
+		if (regulator_is_enabled(chip->vbus_reg))
+			ret = regulator_disable(chip->vbus_reg);
+	}
 
-	return  ret < 0 ? ret : 1;
+	return ret < 0 ? ret : 1;
 }
 
 static void process_power_status(struct max_tcpci_chip *chip)

-- 
2.53.0.371.g1d285c8824-goog



