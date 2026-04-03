Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2117BE8538E
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  3 Apr 2026 17:08:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EdsptTz5xoklegQKGGbpGPA+zyM6u0f+itXboswGrCU=; b=qCKLKcz3XD5zL+Cfrdo5/bZR8O
	pNqXwFcDlSDx+OP3g41I/0wYeV3HMxN3pH47qo+5IAyi8/evAFwh+00b83Uog9I800DRlpsuFvm1k
	9fWV9VsBrobaS5I4ZLngqsIqo8Hjd2nMIVOM7qZ/BIs4JShfLlU667Lbhz12KBw/JOpV3cb4W4eo2
	lFhf8rCCh7DGEpNYtALd0Qzwj0hs9kiwZzwBrvh0TYB6sCZP0VSBwz4HN/n4eJ4hZyH1OwsCljnWT
	O9pdLgRzadxQGpyOP2X7iKRwb3fRuNn+wl011bB3BtGMWzW6yRkCyuM5pBv/YfwOLd7hxUpA7HkYA
	I/YWOmWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8i0i-00000002Mrw-2Bqj;
	Fri, 03 Apr 2026 17:08:44 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8i0b-00000002MlP-4C2V
	for linux-arm-kernel@lists.infradead.org;
	Fri, 03 Apr 2026 17:08:41 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 277CE4456C;
	Fri,  3 Apr 2026 17:08:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 01543C4CEF7;
	Fri,  3 Apr 2026 17:08:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775236117;
	bh=denZNa2pe33zmfsBlt78CCTctUT565Jw4aDwOLwwftk=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=iWY1VgQxq+ySoIy8isHEwqB2iAx5EFVYwZC/mVU6MmHUfjpX+d/UBPJctIaMpBFaA
	 DnXaujaX19inbkRgG8+Y/MlkjkKhrmg507iZXEfyjveLUKX+pQakejr+oFRxnj0dw3
	 gldJODj8yMlkYcvD32TR9II+v2iHjAIeHnXycM/j8SfNyTpJRoCucicnE5o2YFILxS
	 4Cc80yn2MilGYEgH/wUEzPtgMFXcyBT5kvMhR3pIJbRWUmqIguiFolK0qMeFfqPay+
	 eK+BGVWFD4k5NHBdF3OJvzR9hLbMfhxte6imsiZqHbIKFXEHplBpXs0/GPmujyuee6
	 /1RD19B37bW5w==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D5ACDE85381;
	Fri,  3 Apr 2026 17:08:36 +0000 (UTC)
From: David Heidelberg via B4 Relay <devnull+david.ixit.cz@kernel.org>
Date: Fri, 03 Apr 2026 19:08:31 +0200
Subject: [PATCH WIP v3 02/11] Input: stmfts - Use dev struct directly
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260403-stmfts5-v3-2-5da768cfd201@ixit.cz>
References: <20260403-stmfts5-v3-0-5da768cfd201@ixit.cz>
In-Reply-To: <20260403-stmfts5-v3-0-5da768cfd201@ixit.cz>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Henrik Rydberg <rydberg@bitmath.org>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: Petr Hodina <petr.hodina@protonmail.com>, linux-input@vger.kernel.org, 
 linux-stm32@st-md-mailman.stormreply.com, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzk@kernel.org>, devicetree@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, phone-devel@vger.kernel.org, 
 David Heidelberg <david@ixit.cz>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=3250; i=david@ixit.cz;
 h=from:subject:message-id;
 bh=tDcuGFSTfadOXIkwoSMoRncuEwaVSpDmbusBAFubYco=;
 b=owEBbQKS/ZANAwAIAWACP8TTSSByAcsmYgBpz/QP26woI/c8S+QvoRrhVe5w2YHAqfPiP5KbV
 uhxsfux4V2JAjMEAAEIAB0WIQTXegnP7twrvVOnBHRgAj/E00kgcgUCac/0DwAKCRBgAj/E00kg
 cqIfD/oDctPz8rrdDQiz6CmexAyD9MEPFX0KZd2EjbiJb35j/163wCZvi8pcpCEpxll75niVXL+
 BMQVGI3jGIrVki/N8nLjOzuMJI/rLvZkEZBqy4Si1Keeo/JXdJFre1Di7BpJOsJNBVo0l0jsT2a
 a6h9zEyk5u3IgL3cZYtDK7R5Bcw3HWE1Az+Zx52gRlJAKAaJ/ki0HGaIaHmEKm6kGFi4wdEL0RS
 oNGdoi2TrACbRassy1VfnnOj8t4+na/5voCaw7dy+51Ny7h13TmVXg6201/ec1RKX9LAC8qqeYB
 cg6oiG1gdUce45icvY+o7+2ZdlHJtfBdPUohhrmiRM7EU9j9HQqMKRtdZt+SYULfI8LYKDJP67H
 WcuqdFR9+JaeCv2DUkLyttpOB7pjkU4lVFiclM4gYNXcQnN4shKHsPdb5GW6inPleclf41U96sP
 KFXHr9omuIsBu5Gk5YDZyEJM4OFXZkh/LxI4066duZQyOQPkPISxa3UHxMAGLh3dyB4ljQc/GHd
 klWC+n6c3djRfmAa49bQJTB0FpkOu+6MRRVNTvnG16+kjtps1Otiyl+qT3bKFxUvBwAmW1arW4c
 pRDoQXmOaxSQXlkoKzQcMEbg9Vk6/xFbGiWzqZOBMXUo4A616hJzP0hFl8BieyxGxXReUItXcDO
 M46hDIo66PdGLTA==
X-Developer-Key: i=david@ixit.cz; a=openpgp;
 fpr=D77A09CFEEDC2BBD53A7047460023FC4D3492072
X-Endpoint-Received: by B4 Relay for david@ixit.cz/default with auth_id=355
X-Original-From: David Heidelberg <david@ixit.cz>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260403_100838_090556_FB03F35C 
X-CRM114-Status: GOOD (  13.68  )
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
Reply-To: david@ixit.cz
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

From: David Heidelberg <david@ixit.cz>

Makes the code better readable and noticably shorter.

Signed-off-by: David Heidelberg <david@ixit.cz>
---
 drivers/input/touchscreen/stmfts.c | 21 +++++++++++----------
 1 file changed, 11 insertions(+), 10 deletions(-)

diff --git a/drivers/input/touchscreen/stmfts.c b/drivers/input/touchscreen/stmfts.c
index def6bd0c8e059..7b1e975a85668 100644
--- a/drivers/input/touchscreen/stmfts.c
+++ b/drivers/input/touchscreen/stmfts.c
@@ -619,6 +619,7 @@ static int stmfts_enable_led(struct stmfts_data *sdata)
 
 static int stmfts_probe(struct i2c_client *client)
 {
+	struct device *dev = &client->dev;
 	int err;
 	struct stmfts_data *sdata;
 
@@ -627,7 +628,7 @@ static int stmfts_probe(struct i2c_client *client)
 						I2C_FUNC_SMBUS_I2C_BLOCK))
 		return -ENODEV;
 
-	sdata = devm_kzalloc(&client->dev, sizeof(*sdata), GFP_KERNEL);
+	sdata = devm_kzalloc(dev, sizeof(*sdata), GFP_KERNEL);
 	if (!sdata)
 		return -ENOMEM;
 
@@ -639,13 +640,13 @@ static int stmfts_probe(struct i2c_client *client)
 
 	sdata->regulators[STMFTS_REGULATOR_VDD].supply = "vdd";
 	sdata->regulators[STMFTS_REGULATOR_AVDD].supply = "avdd";
-	err = devm_regulator_bulk_get(&client->dev,
+	err = devm_regulator_bulk_get(dev,
 				      ARRAY_SIZE(sdata->regulators),
 				      sdata->regulators);
 	if (err)
 		return err;
 
-	sdata->input = devm_input_allocate_device(&client->dev);
+	sdata->input = devm_input_allocate_device(dev);
 	if (!sdata->input)
 		return -ENOMEM;
 
@@ -664,7 +665,7 @@ static int stmfts_probe(struct i2c_client *client)
 	input_set_abs_params(sdata->input, ABS_MT_PRESSURE, 0, 255, 0, 0);
 	input_set_abs_params(sdata->input, ABS_DISTANCE, 0, 255, 0, 0);
 
-	sdata->use_key = device_property_read_bool(&client->dev,
+	sdata->use_key = device_property_read_bool(dev,
 						   "touch-key-connected");
 	if (sdata->use_key) {
 		input_set_capability(sdata->input, EV_KEY, KEY_MENU);
@@ -685,20 +686,20 @@ static int stmfts_probe(struct i2c_client *client)
 	 * interrupts. To be on the safe side it's better to not enable
 	 * the interrupts during their request.
 	 */
-	err = devm_request_threaded_irq(&client->dev, client->irq,
+	err = devm_request_threaded_irq(dev, client->irq,
 					NULL, stmfts_irq_handler,
 					IRQF_ONESHOT | IRQF_NO_AUTOEN,
 					"stmfts_irq", sdata);
 	if (err)
 		return err;
 
-	dev_dbg(&client->dev, "initializing ST-Microelectronics FTS...\n");
+	dev_dbg(dev, "initializing ST-Microelectronics FTS...\n");
 
 	err = stmfts_power_on(sdata);
 	if (err)
 		return err;
 
-	err = devm_add_action_or_reset(&client->dev, stmfts_power_off, sdata);
+	err = devm_add_action_or_reset(dev, stmfts_power_off, sdata);
 	if (err)
 		return err;
 
@@ -715,13 +716,13 @@ static int stmfts_probe(struct i2c_client *client)
 			 * without LEDs. The ledvdd regulator pointer will be
 			 * used as a flag.
 			 */
-			dev_warn(&client->dev, "unable to use touchkey leds\n");
+			dev_warn(dev, "unable to use touchkey leds\n");
 			sdata->ledvdd = NULL;
 		}
 	}
 
-	pm_runtime_enable(&client->dev);
-	device_enable_async_suspend(&client->dev);
+	pm_runtime_enable(dev);
+	device_enable_async_suspend(dev);
 
 	return 0;
 }

-- 
2.53.0



