Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50C72F30280
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 15 Mar 2026 18:53:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=350KM/6+2daHDI9WlGBqKpAtAShS5JM3o6/H9f3Cpo4=; b=NnUY8WRx4J/765cC59TAtV1Vgw
	o37E5X6U7JXrokahPFBw3ZHe8d+FwWcqDVbn+fs6iUX8xlPNFgw6A6tETdF7hU4StTKpP/S2XajbY
	1YPZbBGocewqggG5I1UB2/iahsi8lIy+tFF4WwZNh5cbOIn3C9l/8FUQMXFfIZ55EJFn3gWJ5bSY/
	9moVxY6jW+H5oBL6yGMp/wBfv0PfVBgq15d8YRDUN8s6RUJ7U7KRiXWRKW55FoBWGZWkmE/Ftb9Ws
	2ULF1Jat5o12M4sXHWRa1XXeFBAmb8ms2ea52NeECsUcjC2kPKGJ7GnlTEkPJTiiTKJRismqYn4HA
	Ay9y4t9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w1qa8-00000002pIo-01RR;
	Sun, 15 Mar 2026 18:52:56 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w1qa6-00000002pGu-1lGO
	for linux-arm-kernel@lists.infradead.org;
	Sun, 15 Mar 2026 18:52:54 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 6FDB561334;
	Sun, 15 Mar 2026 18:52:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 2E80BC2BCC6;
	Sun, 15 Mar 2026 18:52:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773600773;
	bh=AHcrVyLFhsqV2czjvo1gRKaS1rJDhDM0kX8i4qEwEug=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=pY1yDYvH/Nd8aj5Hphd0fw9cRtkyRnX9JnlF72vB1FcZbTBCpo73X5piAUX57SntM
	 GeahEL5LevmG1m3Gx0jZ7J2SOnTod02uHQyWSE+c+QgrMEjiHZz+Ced2ZKpnWGIOXr
	 Cl1Z4QhpLR6LwIeBxgNOsdW/2xMh3rtZHMNZbn12LMe6+7CngkufVYusXKvSiwOMw9
	 Yn+1fvZSD4DgzZG2PO5POe4mLaTbOHUPbMEJzfyBbmVDidAZOTuDAtKFPYv9W/plc4
	 3nNXPZ0+cu6c6w/1sljXSPUmxfpswCpCe6jur6HRh810XPnm10Mvm7iRwhbHmUD+Y5
	 O4XBWytHzl4Ww==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 25C10F30280;
	Sun, 15 Mar 2026 18:52:53 +0000 (UTC)
From: David Heidelberg via B4 Relay <devnull+david.ixit.cz@kernel.org>
Date: Sun, 15 Mar 2026 19:52:40 +0100
Subject: [PATCH WIP v2 04/11] Input: stmfts - abstract reading information
 from the firmware
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260315-stmfts5-v2-4-70bc83ee9591@ixit.cz>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1821; i=david@ixit.cz;
 h=from:subject:message-id;
 bh=XFaZaPRkaLRohySBuoaYMFPtZGjmqJauWlqz/Xv2L/c=;
 b=owEBbAKT/ZANAwAIAWACP8TTSSByAcsmYgBptv/5kO5OknDi5IJov8Qfi+fjgPxHlqfISspUX
 9v9Jtcd20eJAjIEAAEIAB0WIQTXegnP7twrvVOnBHRgAj/E00kgcgUCabb/+QAKCRBgAj/E00kg
 cklID/iclHlpBybWVTbVwtV9yu6KKK2NHsWvquiTMXw5Q2Bq3saKr8FtQtKP9L/2czJtn0NRkqN
 o+ewo546H4IC6GRCwDi/h7E78jmmSCEOZQ/TqJwtfHkiy7NlEQkh7PzGicEf0aWiFUWtZU7R5Qb
 heSr3eDWJ5lEmYkVWnKhPPW5qkgMFYAGflkF/AgAt2NW/teJZDBRPVCyejI61nm+9GNElmDU7kD
 npbdeNTOrE8bSa0ARIe5hNA8wWB8HQXOeHj7M1rrqxkpzQektIEnzAUzsChiRWeOt+8okL1nynJ
 t/q9051yzuuRApWOig8y1Vx1GGqXrbTCWYQdxcAvxT9C6nAJVuUjRtKSFNCni8utJDzdbGtDgmb
 NwmKCZ3gcInJWgypcE6Eq82HgJfyadW7zyDcRcoQtsGYJ7iySa64gAMPr7HnMHiqmspE7WsYMme
 OduxikMWh8kZkndd/2/XSEJnImGBacrGKNEj5UKBRziPeZ9jgQy0hgncm+iu9mCSQ92GydHM8JG
 MY90UJTp9MgyZSyIbqe5x9qmKtGm4Oi36bDD35ukl11KKbVcMzOh2ZXwIuk6nWBGwrtPBP2sti4
 5vl1kOqbOdbCsu3xG4zrh4CEDMqh0+L2+bwzg7rWQNBwpfaR6LQjKwR0HqhF1V0RLWhiF2T4pZi
 KKyZBG7ctPyMH
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

Improves readability and makes splitting power on function in following
commit easier.

Signed-off-by: David Heidelberg <david@ixit.cz>
---
 drivers/input/touchscreen/stmfts.c | 36 ++++++++++++++++++++++++------------
 1 file changed, 24 insertions(+), 12 deletions(-)

diff --git a/drivers/input/touchscreen/stmfts.c b/drivers/input/touchscreen/stmfts.c
index a9f240bac201e..c1c9570ddea2d 100644
--- a/drivers/input/touchscreen/stmfts.c
+++ b/drivers/input/touchscreen/stmfts.c
@@ -519,22 +519,11 @@ static struct attribute *stmfts_sysfs_attrs[] = {
 };
 ATTRIBUTE_GROUPS(stmfts_sysfs);
 
-static int stmfts_power_on(struct stmfts_data *sdata)
+static int stmfts_read_system_info(struct stmfts_data *sdata)
 {
 	int err;
 	u8 reg[8];
 
-	err = regulator_bulk_enable(ARRAY_SIZE(stmfts_supplies),
-				    sdata->supplies);
-	if (err)
-		return err;
-
-	/*
-	 * The datasheet does not specify the power on time, but considering
-	 * that the reset time is < 10ms, I sleep 20ms to be sure
-	 */
-	msleep(20);
-
 	err = i2c_smbus_read_i2c_block_data(sdata->client, STMFTS_READ_INFO,
 					    sizeof(reg), reg);
 	if (err < 0)
@@ -548,6 +537,29 @@ static int stmfts_power_on(struct stmfts_data *sdata)
 	sdata->config_id = reg[4];
 	sdata->config_ver = reg[5];
 
+	return 0;
+}
+
+static int stmfts_power_on(struct stmfts_data *sdata)
+{
+	int err;
+
+	err = regulator_bulk_enable(ARRAY_SIZE(stmfts_supplies),
+				    sdata->supplies);
+	if (err)
+		return err;
+
+	/*
+	 * The datasheet does not specify the power on time, but considering
+	 * that the reset time is < 10ms, I sleep 20ms to be sure
+	 */
+	msleep(20);
+
+
+	err = stmfts_read_system_info(sdata);
+	if (err)
+		return err;
+
 	enable_irq(sdata->client->irq);
 
 	msleep(50);

-- 
2.53.0



