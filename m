Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32A70C79F9E
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  7 Sep 2026 10:50:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BsRNkVqvRX4LBFhDxliJNqtxJ2sDVqmHqxLP5AQTeQg=; b=DZfT3tFJmRwxKOQWUHr3wa1Vjr
	eayqPgwF+TW8c5Qz4crQ0hQYdtHGDI5V3bJoJqo4yMh5C3Lj3NKRSeQhanDDmz7rg+LuiTLTQgjpv
	Q+i2IFw91HdpMnHiVdAeDT52YdA5MF7QIEP8dfmTqC5iouY3mz45mljwqoTUvfxgr66wmHXea8xiQ
	nvqbZzcHAQFPyI1zpcrHTxAEohFSxhnObTsSuiwSnAkAH9ovqhN/fdPwfD19LQRc4nENk6DjT30HT
	iAbnfMqr5BKDQcyWC3Hz/2YtLOlzJfQlIAxbWAeFUNC6tymWKg5BAp9leVn67Lb0jZbzCJb4S+x2R
	emzrr0LA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3Wvn-00000006WfU-3fNN;
	Mon, 07 Sep 2026 10:50:31 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3Wvk-00000006WdS-1G1s
	for linux-arm-kernel@lists.infradead.org;
	Mon, 07 Sep 2026 10:50:28 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 620CE60D83;
	Mon,  7 Sep 2026 10:50:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 0721CC2BCF5;
	Mon,  7 Sep 2026 10:50:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1788778227;
	bh=hnblNZZZX74vCIQPbR7bbLsLlKR4prM6ow0xJLomnY4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=ZYf9AMVLCqqdHc2h1f1r+ZR52jmzwl7OhxC1m9g3Vz2FLBd9kjpS3Z95tQFEWHZ4s
	 3l0S99jfJhZCcnChuwoDtSDCRVsPbiCir9pifT/G4XeByi8zJa1oMZ0Q1+WMuToVnC
	 P2+7WLJ2n5c0gRx/OIOb7S4gptPyX5Mm16XRW8dZTzWe1noXw5E5xjUb5paX7DiYcj
	 CEdNxG6kcFqWR3PT69y+ljRobEbsJPAPNIxgkqO6/Ad9p8hysgrDcTjnDVqvwyxFcP
	 pRssoOApUaMVPOcZTlmAlUavzpeNNdH44cCMizFTiOjxKfgN37YJGt2T6kwtDx/CSr
	 uYf37dz/EZJFA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D9793C79F99;
	Mon,  7 Sep 2026 10:50:26 +0000 (UTC)
From: David Heidelberg via B4 Relay <devnull+david.ixit.cz@kernel.org>
Date: Mon, 07 Sep 2026 12:50:19 +0200
Subject: [PATCH v7 1/4] Input: stmfts - wait for controller ready after
 reset
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260907-stmfts5-v7-1-4a53381cd038@ixit.cz>
References: <20260907-stmfts5-v7-0-4a53381cd038@ixit.cz>
In-Reply-To: <20260907-stmfts5-v7-0-4a53381cd038@ixit.cz>
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
 David Heidelberg <david@ixit.cz>, stable@vger.kernel.org
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=4142; i=david@ixit.cz;
 h=from:subject:message-id;
 bh=YmMrxv3+joaFyhDdky+ZUqbM/9lF/0oWq3x6guxAV2s=;
 b=owEBbQKS/ZANAwAIAWACP8TTSSByAcsmYgBqnpbwAwkKuZp8iMC+4TNWLuqzbOQ67FVsHERWr
 RQJfGwiAHeJAjMEAAEIAB0WIQTXegnP7twrvVOnBHRgAj/E00kgcgUCap6W8AAKCRBgAj/E00kg
 cs9AD/9mAd9wZH7ZvgdJcGEic/BXuAnUNEa+Gzd7l1ycSC/I+JEXEOMyi3KY8UVnRfcvFMqK9qp
 6YZWzG2xGkIPJ7aoQNZQpLMS6BVs7lqGKuzpNmjcGM3P6inTAuj74yv/wVDPSUQfwzbETv6vtSP
 FUdlB3uXtHZ52nAzm/OiWnoNZPFI7d4IAYZdr7BWhl+IW6+lEgcowYYTZusMCOA2sBdLhxG1jvi
 05/bDV02N8yxOsKy3UQTxKts9FmukAE8b4MCOVTgJihHOl6ysq4Drw5NH4SPZSkt66OY9WUvTEP
 gcpE2Tr7IsN0aTbN6iuN3500VnaKGVUjHSFMB2RYGwPlfy8BlaFzEsaZXCYkF6iJ6pd5GwnaKZz
 ez7k584X5VxNSZwMAmB8HYQ1+pph7+voLWEmRYuC8YzqTtNwWamHo+I2b+rg/m59Z0pQfN8L3B+
 FwI2DGs0AgEpFnlgZwHAS5hU6Cji7tN5KG5UQoXuZFLAI3y02ErzRKgr1p4jrEIkWqhZyuTzPJA
 TnQgG8PEigcQkwAFyrESeY8W4zrHFaKNbo8QUkSDaQvkXTs0Z6jvEB/MAGxtUFvM8wgoJLXQPOe
 ymczNk9faRPZvJWGT4nNVSrAqPNTB6wP1FFEHhmXX2Xcpwb2FNjQXDulW2uzO3YSxSwI5HDz2S1
 rkViDVpSK76Z/sQ==
X-Developer-Key: i=david@ixit.cz; a=openpgp;
 fpr=D77A09CFEEDC2BBD53A7047460023FC4D3492072
X-Endpoint-Received: by B4 Relay for david@ixit.cz/default with auth_id=355
X-Original-From: David Heidelberg <david@ixit.cz>
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

After releasing the reset line stmfts_reset() sleeps a fixed 50 ms and
stmfts_power_on() another 50 ms before the first I2C access.  That is
enough for a warm reset, but when both supplies were really cut during
system suspend the controller boots from cold and can need longer.  If
it does, the first read fails, stmfts_resume() returns an error and the
touchscreen is left powered off with its interrupt disabled.

The controller posts a controller ready event once it has booted, and
the event parser already completes cmd_done on it.  Enable the interrupt
right after releasing reset and wait for that event instead of sleeping,
giving the controller 300 ms, the total budget the vendor driver allows.
Boards without a reset line keep the old timing.

Usually phones such as Pixel 4a and Xiaomi Mi 8 needs longer delay, so
without this change touchscreen stops working.

Fixes: 8a1f9de80e45 ("Input: stmfts - add optional reset GPIO support")
Cc: stable@vger.kernel.org
Signed-off-by: David Heidelberg <david@ixit.cz>
---
 drivers/input/touchscreen/stmfts.c | 34 ++++++++++++++++++++++++----------
 1 file changed, 24 insertions(+), 10 deletions(-)

diff --git a/drivers/input/touchscreen/stmfts.c b/drivers/input/touchscreen/stmfts.c
index 972687797f826..711e3ad8587a0 100644
--- a/drivers/input/touchscreen/stmfts.c
+++ b/drivers/input/touchscreen/stmfts.c
@@ -59,16 +59,18 @@
 #define STMFTS_MASK_X_MSB			0x0f
 #define STMFTS_MASK_Y_LSB			0xf0
 
 /* key related event masks */
 #define STMFTS_MASK_KEY_NO_TOUCH		0x00
 #define STMFTS_MASK_KEY_MENU			0x01
 #define STMFTS_MASK_KEY_BACK			0x02
 
+#define STMFTS_RESET_TIMEOUT_MS	300
+
 #define STMFTS_EVENT_SIZE	8
 #define STMFTS_STACK_DEPTH	32
 #define STMFTS_DATA_MAX_SIZE	(STMFTS_EVENT_SIZE * STMFTS_STACK_DEPTH)
 #define STMFTS_MAX_FINGERS	10
 #define STMFTS_DEV_NAME		"stmfts"
 
 static const struct regulator_bulk_data stmfts_supplies[] = {
 	{ .supply = "vdd" },
@@ -538,23 +540,30 @@ static int stmfts_read_system_info(struct stmfts_data *sdata)
 	sdata->chip_ver = reg[0];
 	sdata->fw_ver = be16_to_cpup((__be16 *)&reg[2]);
 	sdata->config_id = reg[4];
 	sdata->config_ver = reg[5];
 
 	return 0;
 }
 
-static void stmfts_reset(struct stmfts_data *sdata)
+static int stmfts_reset(struct stmfts_data *sdata)
 {
 	gpiod_set_value_cansleep(sdata->reset_gpio, 1);
 	msleep(20);
 
+	reinit_completion(&sdata->cmd_done);
 	gpiod_set_value_cansleep(sdata->reset_gpio, 0);
-	msleep(50);
+	enable_irq(sdata->client->irq);
+
+	if (!wait_for_completion_timeout(&sdata->cmd_done,
+					 msecs_to_jiffies(STMFTS_RESET_TIMEOUT_MS)))
+		return -ETIMEDOUT;
+
+	return 0;
 }
 
 static int stmfts_configure(struct stmfts_data *sdata)
 {
 	int err;
 
 	err = stmfts_command(sdata, STMFTS_SYSTEM_RESET);
 	if (err)
@@ -593,42 +602,47 @@ static int stmfts_power_on(struct stmfts_data *sdata)
 		return err;
 
 	/*
 	 * The datasheet does not specify the power on time, but considering
 	 * that the reset time is < 10ms, I sleep 20ms to be sure
 	 */
 	msleep(20);
 
-	if (sdata->reset_gpio)
-		stmfts_reset(sdata);
+	if (sdata->reset_gpio) {
+		err = stmfts_reset(sdata);
+		if (err) {
+			dev_err(&sdata->client->dev,
+				"controller not ready after reset: %d\n", err);
+			goto err_disable_irq;
+		}
+	} else {
+		enable_irq(sdata->client->irq);
+		msleep(50);
+	}
 
 	err = stmfts_read_system_info(sdata);
 	if (err)
-		goto err_disable_regulators;
-
-	enable_irq(sdata->client->irq);
-
-	msleep(50);
+		goto err_disable_irq;
 
 	err = stmfts_configure(sdata);
 	if (err)
 		goto err_disable_irq;
 
 	/*
 	 * At this point no one is using the touchscreen
 	 * and I don't really care about the return value
 	 */
 	(void)i2c_smbus_write_byte(sdata->client, STMFTS_SLEEP_IN);
 
 	return 0;
 
 err_disable_irq:
 	disable_irq(sdata->client->irq);
-err_disable_regulators:
+
 	regulator_bulk_disable(ARRAY_SIZE(stmfts_supplies), sdata->supplies);
 	return err;
 }
 
 static void stmfts_power_off(void *data)
 {
 	struct stmfts_data *sdata = data;
 

-- 
2.55.0



