Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1AFC7E8538B
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  3 Apr 2026 17:08:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=H5oAqUN/F/DHa2iy4ySOrRJPNvHWoaG6ubVFBR1QeIo=; b=SUsCJpFXb6L5RTgXRcJikismSJ
	w5wGceixMmTDK7YOtMWUes4d4vATh/H2G4HbMvXdV2rLN5xyAHSRgqidxR5gp0BZS9aLwWsstiZtm
	+i2HNpAuNlZ6iJZmvp4ozGUxjkJNDSqTHgLcr5y4mhzi8PdEX9ZMm4YWnnFc5+VorjoGyrDTAhX1x
	G0NrBu5D5NjK31Wu7f2W7Zk4SU068/emrsKV8pqSKM8vdd4yLDARH+cE2BceFxyZu747NVi5Pz37F
	AqQ9lHns9aKPyzmm4YQnC+KfixIOTh5ajjEFuCwjVY28ihGTWYaFeBDKaKBpKLTgRKrTJwqjOJ0oK
	eBpw0mrg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8i0i-00000002MsJ-3XyX;
	Fri, 03 Apr 2026 17:08:44 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8i0d-00000002Mms-2Qc7
	for linux-arm-kernel@lists.infradead.org;
	Fri, 03 Apr 2026 17:08:41 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 28A374472E;
	Fri,  3 Apr 2026 17:08:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id F3691C2BCB9;
	Fri,  3 Apr 2026 17:08:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775236118;
	bh=B25QG0BsQnjFLBiHl85pehw/gDD9JJ0lfU2fdaZnMcc=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=hSJOpvaOFZ87KKDxVGpeUboMT6JT53JJoIk81kvWu713uzJ3bu9s5Rh7edogG1AbJ
	 v80zYuKmqodsW3lBz5d/24gW+4Z45WlxavnUCHLMWkXGrPym1PULGAia34yy9zNGE8
	 cNVwAA3u8n6fuf8bq3VzgOkl5xgZyD/zgOgrNwpX0TlJY7Gt8AYBIMsu3di6Yo/afD
	 E3vYLA7KevoJmBJb6aGejHfe1bRoVphuakO/uXO7U1UXzlwGGLUz48HqusLrhWvyc4
	 2w58IL8YTMHcSrRhxhtA+WXQGYaDrPMgH3oDgzyN0czUYX+7FRkBjRC6RXp22ZTkPl
	 4bCl2IFRm/8yw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E8435E85385;
	Fri,  3 Apr 2026 17:08:37 +0000 (UTC)
From: David Heidelberg via B4 Relay <devnull+david.ixit.cz@kernel.org>
Date: Fri, 03 Apr 2026 19:08:37 +0200
Subject: [PATCH WIP v3 08/11] Input: stmfts - add optional reset GPIO
 support
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260403-stmfts5-v3-8-5da768cfd201@ixit.cz>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2354; i=david@ixit.cz;
 h=from:subject:message-id;
 bh=0H4tPbOaJAGUUm0gV1hJtlkmy5VinkfPf9XKlb62d/Y=;
 b=owEBbQKS/ZANAwAIAWACP8TTSSByAcsmYgBpz/QQW9t8Ua9CuM8zGK6neEShzwuW/HxqOtzx/
 WDfVNUFZyOJAjMEAAEIAB0WIQTXegnP7twrvVOnBHRgAj/E00kgcgUCac/0EAAKCRBgAj/E00kg
 clqPEACYGaJ7F2ne61ny7ICon2k6Kd28oYfIMioQqvdFM0jeIU8/qc23mpqUK9BteakDL9dz427
 Q2oU/6fVZrkY2eaX2TUpJShYuLpnd0i26mCvAY20J8nzLE9STuESYGkrvT52EMx3vAcK+NUH2Ls
 sjp6mNpXTCyUbAnhz7TEoSnln43BiEQpJ4Ho+lOyXvjGp7XytirLAksWti5kd2mF+MprhQMu027
 PnSNSHd+wjAge12lnYzsK3kkkOIkKUpNEVAeeScuc0ffZSo8DbktluAj491MU0UIBa72SkOa/cp
 DTPCSaQkvj3qR7LFuGO6Gac0kotIbjxGo+pGdCNl2Y5mAJYDw8V7Dgj7RGa/E7Lag28D8V7DlQ7
 oYN9wnAv7SNOw6Lg6wxPYqT3nLYwmt7dXo4N2ggTvmg/934c9D2LwQlERr+kzxMRsPvIHvw/53K
 ix9u6+IFsk/9K8tdz0jcnQRlo1miOPf4xLEGsVaCptad9GFvRYlLmv+YEg+ZUtTES/RB39SG/x8
 RnqW2iiyiltk6e4Jgu9lvYXww+18a2aZ6x+CQ57ZiI3xo6Tjl+r6iilqKG0UlXTI/S5Cj4HJ3Sk
 ru2ihmxrYwZrYAOcSQgqibKo9FayEoOXmTOXz5RZlrUexoMxy2FZhMtGbHekAnmaTxASFnnousA
 I8c0YzBRJ7GJkUw==
X-Developer-Key: i=david@ixit.cz; a=openpgp;
 fpr=D77A09CFEEDC2BBD53A7047460023FC4D3492072
X-Endpoint-Received: by B4 Relay for david@ixit.cz/default with auth_id=355
X-Original-From: David Heidelberg <david@ixit.cz>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260403_100839_694477_A83041AC 
X-CRM114-Status: GOOD (  14.49  )
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
index 5f7de5e687da2..04110006f54a0 100644
--- a/drivers/input/touchscreen/stmfts.c
+++ b/drivers/input/touchscreen/stmfts.c
@@ -77,6 +77,7 @@ static const struct regulator_bulk_data stmfts_supplies[] = {
 struct stmfts_data {
 	struct i2c_client *client;
 	struct input_dev *input;
+	struct gpio_desc *reset_gpio;
 	struct led_classdev led_cdev;
 	struct mutex mutex;
 
@@ -539,6 +540,15 @@ static int stmfts_read_system_info(struct stmfts_data *sdata)
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
@@ -548,6 +558,9 @@ static int stmfts_power_on(struct stmfts_data *sdata)
 	if (err)
 		return err;
 
+	if (sdata->reset_gpio)
+		stmfts_reset(sdata);
+
 	/*
 	 * The datasheet does not specify the power on time, but considering
 	 * that the reset time is < 10ms, I sleep 20ms to be sure
@@ -606,6 +619,10 @@ static void stmfts_power_off(void *data)
 	struct stmfts_data *sdata = data;
 
 	disable_irq(sdata->client->irq);
+
+	if (sdata->reset_gpio)
+		gpiod_set_value_cansleep(sdata->reset_gpio, 1);
+
 	regulator_bulk_disable(ARRAY_SIZE(stmfts_supplies),
 			       sdata->supplies);
 }
@@ -662,6 +679,12 @@ static int stmfts_probe(struct i2c_client *client)
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



