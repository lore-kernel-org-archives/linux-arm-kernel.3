Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04BDDF30280
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 15 Mar 2026 18:53:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wAAqdNA2UNI5kEpPuvbVmuf0LWb41mzPkqRHml9NdmI=; b=QoIgdX9jO0IFBjuNBBMEUlSuee
	jLI7Mv0/zQajiLTxYbKmWeg59tclCSIWwFWeCopfFDsDIm19atLzpnxrRk1BvCfw+6CKxvgRTHUC+
	aE/zpyzopQ0cBJPuJP1Wje38IfYoIsjRoPirSucVO4JY+L9s6Rk6rNP6qMrEH5mVcYl5acs8puHdD
	34EsjOdmeQsY7XmUYMOyp/j2p2lGrNasOvyeQC2/YS5D1PPe5KV3QUJvrJTJg/VjkO5ytk0qoWNx6
	wFW9Ylgt1ehzZcBoQ/UKzIo12/LEgYBSG9MvgFt7tfxnXV8wUiqEjIhPdFzMf5WHJ9+LEsoWwydGR
	9TDFcM/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w1qaL-00000002pQl-1QgB;
	Sun, 15 Mar 2026 18:53:09 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w1qa7-00000002pGx-0DoQ
	for linux-arm-kernel@lists.infradead.org;
	Sun, 15 Mar 2026 18:52:57 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id BCE144443E;
	Sun, 15 Mar 2026 18:52:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 7DE74C2BCC7;
	Sun, 15 Mar 2026 18:52:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773600773;
	bh=kD90Pnoe+NlXfnVFBh+ajGZPNGOL6hV6WmqC/acHvQQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=DIEVAqFz+8Ig+lvH4GhnPSysLvd8fLtPHSf/K0dTOnVTGcMny/vMw5UmySsRElzrD
	 qxFUqSgN7RlO5msu1zM6BQaHhy+Sp8SZk30LB2GR0CxO2jnUMr5+8GcF94EWRcvOhM
	 5tcYTIY8UU0faC/RzH0f9rai+gRe1finYC0UGa8WO6E3rwdYaxTD0fOGJ/PyDIjs+V
	 irb+iEDgSvsqutIem04ALpq+jShyeME9X2dpWAl2cTp0rqqS0D33A2r/I0neJHnsHb
	 Rp92NNFgs88kB85lQw7GI23FLMBLB8ZQVR9nGbFl2eW5ubeNJbpEGJjJSpl4ISPNUA
	 XtJC3h2d3lNEA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 71D86F30280;
	Sun, 15 Mar 2026 18:52:53 +0000 (UTC)
From: David Heidelberg via B4 Relay <devnull+david.ixit.cz@kernel.org>
Date: Sun, 15 Mar 2026 19:52:44 +0100
Subject: [PATCH WIP v2 08/11] Input: stmfts - add optional reset GPIO
 support
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260315-stmfts5-v2-8-70bc83ee9591@ixit.cz>
References: <20260315-stmfts5-v2-0-70bc83ee9591@ixit.cz>
In-Reply-To: <20260315-stmfts5-v2-0-70bc83ee9591@ixit.cz>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2354; i=david@ixit.cz;
 h=from:subject:message-id;
 bh=Em8LYVoDWru3Ze7de0xKRKpEP94aiXt6/9C91H5R1mc=;
 b=owEBbQKS/ZANAwAIAWACP8TTSSByAcsmYgBptv/6s4qIoNdujZmmRqRVBiJys5HkVglAFzyP+
 R5WsIFNQ/uJAjMEAAEIAB0WIQTXegnP7twrvVOnBHRgAj/E00kgcgUCabb/+gAKCRBgAj/E00kg
 cn2qD/9kd9xFzBy/yAD4HTM/loZdNokNzuHgsxlh8FIsTOlDUoXtPe9sndnELN4qHVjtsfNtZ0O
 48PfOOvSsGY/rOFqRd/Jxi7OnTtZWDJozTdN55+Mph5DpENKt0s43YiaOkEmryRbDxEh/SM30zO
 DwrTbLld7eTGL6YohdtKi80fWKl8Mfj90fBbWeokSlDqA7qjxqsOHlNuNAlqTXd/kjU0n2m/O66
 XW3EEWdDP9Ck2PwuDsLWoxzRoTtU2RrxeDnX5jPDZru76QmAeGp5MlS2pvJ0wfb4BvoDfr9RJIt
 bDL40MULru+xiomx2EgRtpsnbNc2AV0oqYuJnxDPvkpOCzjnqfiYW6AsSjLtiZrzje5qxMwqZHH
 9UySLkVuLojNUyxsf1jRecSBIC2XNepZeiG01FjFHJlc2c+E+R/a817V1A+j14vnb/SwsQm7Y7D
 6fPK0981RJylEXuEgYAVqBZk0cfVKxpM+SIKwhZdvpjgIMsKBiBA7cQCbbo8mTB2RxpaygRl9eg
 OVjneIVOrUaaZ0cm0PgbdKGwizNAhYkiG6BQlq4IEtBHH1ckjbph3TBBKhRy9UTgATpmwExhPqD
 35e1LnfvEMwPTfkvBxbfCq9oG1b0fW2a5rMXciwEuy7Gc2uTcZhLiD9QWNzkbeOLLuqvkKzgUyO
 1bd2rYkG6kZyqew==
X-Developer-Key: i=david@ixit.cz; a=openpgp;
 fpr=D77A09CFEEDC2BBD53A7047460023FC4D3492072
X-Endpoint-Received: by B4 Relay for david@ixit.cz/default with auth_id=355
X-Original-From: David Heidelberg <david@ixit.cz>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260315_115255_138166_FF915499 
X-CRM114-Status: GOOD (  14.26  )
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

From: Petr Hodina <petr.hodina@protonmail.com>

Add support for an optional "reset-gpios" property. If present, the
driver drives the reset line high at probe time and releases it during
power-on, after the regulators have been enabled.

Signed-off-by: Petr Hodina <petr.hodina@protonmail.com>
Co-developed-by: David Heidelberg <david@ixit.cz>
Signed-off-by: David Heidelberg <david@ixit.cz>
---
 drivers/input/touchscreen/stmfts.c | 23 +++++++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/drivers/input/touchscreen/stmfts.c b/drivers/input/touchscreen/stmfts.c
index 4dfaf3a6077d9..2c10256e09c5e 100644
--- a/drivers/input/touchscreen/stmfts.c
+++ b/drivers/input/touchscreen/stmfts.c
@@ -77,6 +77,7 @@ static const struct regulator_bulk_data stmfts_supplies[] = {
 struct stmfts_data {
 	struct i2c_client *client;
 	struct input_dev *input;
+	struct gpio_desc *reset_gpio;
 	struct led_classdev led_cdev;
 	struct mutex mutex;
 
@@ -540,6 +541,15 @@ static int stmfts_read_system_info(struct stmfts_data *sdata)
 	return 0;
 }
 
+static void stmfts_reset(struct stmfts_data *sdata)
+{
+	gpiod_set_value_cansleep(sdata->reset_gpio, 1);
+	msleep(20);
+
+	gpiod_set_value_cansleep(sdata->reset_gpio, 0);
+	msleep(50);
+}
+
 static int stmfts_power_on(struct stmfts_data *sdata)
 {
 	int err;
@@ -549,6 +559,9 @@ static int stmfts_power_on(struct stmfts_data *sdata)
 	if (err)
 		return err;
 
+	if (sdata->reset_gpio)
+		stmfts_reset(sdata);
+
 	/*
 	 * The datasheet does not specify the power on time, but considering
 	 * that the reset time is < 10ms, I sleep 20ms to be sure
@@ -607,6 +620,10 @@ static void stmfts_power_off(void *data)
 	struct stmfts_data *sdata = data;
 
 	disable_irq(sdata->client->irq);
+
+	if (sdata->reset_gpio)
+		gpiod_set_value_cansleep(sdata->reset_gpio, 1);
+
 	regulator_bulk_disable(ARRAY_SIZE(stmfts_supplies),
 			       sdata->supplies);
 }
@@ -663,6 +680,12 @@ static int stmfts_probe(struct i2c_client *client)
 	if (err)
 		return err;
 
+	sdata->reset_gpio = devm_gpiod_get_optional(dev, "reset",
+						    GPIOD_OUT_HIGH);
+	if (IS_ERR(sdata->reset_gpio))
+		return dev_err_probe(dev, PTR_ERR(sdata->reset_gpio),
+				     "Failed to get GPIO 'reset'\n");
+
 	sdata->input = devm_input_allocate_device(dev);
 	if (!sdata->input)
 		return -ENOMEM;

-- 
2.53.0



