Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 338A5F3027F
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 15 Mar 2026 18:53:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lrRNiYRDHJWADuPV+GjQkcd1zwPfRuA2POtEfBnpZDs=; b=r4MUg12GNVTp+gvzScqSoecApV
	6puw5SzQl5KsIZuR6V44sJ3Mav6nTODa6vmSKG0/RlJBrhasPMb+Alh4kQghlDWwWy8uxiyNjJP04
	ww5YNwfmsXLmcrppUFo530+k1xKU3swGNS0Xe+I3oVrhpXN9DOoKJLZErQJntWLvP9pfXTg8yO12c
	zb5/s9KPdSzQovkIUZBnd5Kxq5YNjGpZ8vokLk0RjgRiFKqqtMahrGTM8MopkgyMGeyajLeh1ChUK
	Ey9Zpw1uD/kmAvQIRCbe7vojEt/uJ/60/lcs0PN1WCw9h3ioKbzrdAyjnuFDJ8fe3+m7N5huEHrhf
	jJnAXxYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w1qa7-00000002pIY-2ueA;
	Sun, 15 Mar 2026 18:52:55 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w1qa6-00000002pGw-1lYv
	for linux-arm-kernel@lists.infradead.org;
	Sun, 15 Mar 2026 18:52:54 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 7AC1961336;
	Sun, 15 Mar 2026 18:52:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 42D4BC2BCF4;
	Sun, 15 Mar 2026 18:52:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773600773;
	bh=qua4z1+dduswjPIAqw2Xaw9gznNNtYVooXIHVFd03DU=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=mu9zAYsAmWH3q/tekgJujaeA7dI3wlszIc9DBz6N5F3G5aNGtvZLkCWkt95qbscT0
	 x8iBPfD1uu8DtQDQKkVrrwW9WqFodijpsoXQDxYY9u07BPq7zf4CP2VKan200Ha/Kj
	 blJQOiF1/gMhVDti8ceDWZqhsvbzUSf/CCsTmnvIzy8DRYicw3bxJ0hl5bqYHzedwD
	 OYUPGFXhIGVkL16f+kPf6jRr8j0dFyllHmg2ge8z2b8Joc6fT1n3qrZ+wjkSlmp8MV
	 +Zc/a+TtGYgx3xXGFW4tzzOENw1uvrTLDrOmjpuO0IgzaNxtQBLnrmN6k9F4lIWc66
	 4P2ao1vqdq35g==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3933FF3027F;
	Sun, 15 Mar 2026 18:52:53 +0000 (UTC)
From: David Heidelberg via B4 Relay <devnull+david.ixit.cz@kernel.org>
Date: Sun, 15 Mar 2026 19:52:41 +0100
Subject: [PATCH WIP v2 05/11] Input: stmfts - disable regulators when power
 on fails
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260315-stmfts5-v2-5-70bc83ee9591@ixit.cz>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1598; i=david@ixit.cz;
 h=from:subject:message-id;
 bh=2qW8ngTjzm302YCB/fjirEd8lBZHppTYTL/irHDu0sU=;
 b=owEBbQKS/ZANAwAIAWACP8TTSSByAcsmYgBptv/53lQgPZkVE/1ff0MlL4oM6tmmzYpj7LZkM
 I5gtNehdp6JAjMEAAEIAB0WIQTXegnP7twrvVOnBHRgAj/E00kgcgUCabb/+QAKCRBgAj/E00kg
 ckTBD/9d4Fas9MuxGRDBXkRc2fYIYSoRcXx3TcyfKoIpKrnKUiK8rzfIU0SlAg599HVJq/cpPA8
 t507y5DmYEyhyMwSGAFKUnp366aMbjBfX68OV3Zd1ofuv/IpqFwITPliK0N7EuNo/RSQZCBo6m4
 n7TqvPnXGYBJdg51oS9ZYyFhfvmRYm/JMuHTv9EE/hlgOEMS0h40CbticIBAnLqUGaRIxCJNU2L
 Ita88L14n5Qj7eKV9XF08aiVVC9jfT5WPnNmMZFkkYRrQA2ux729GVwUJc7dywNMBl5c8cMjfJR
 hqAOcTfglNYc4X3LYx8p+HrWv9yEsU8X+qyztoXxay7qriMRC7uwBXLjUnpGTg3XE5f3JF0j34u
 /uKRr5zUPrL8805QQF2HKlEXb+Tl2ldFi7ZrsIKivSpuVxSkOOkK4B4g9jlIcRsmT6MwqcWGRMa
 gVS53sC9SIrVRjrAXzw7DSIfjijn4seWDo1QMA5u1zsP8ST2iK2o7MqUphqIgldofokB4bON/v8
 lbgb3wImj5mUgeykHlkU1IkqmlKtBMF4Vl6ATvDNjAw3u3AgXDwAVhtwU3YGZi4fGym3hnG0XNE
 ugj0bO65jbRvjTbAa+LtkKMdq0uOylPQrE0W7tAYp1GJgUfhAtZk52ortLkepchu4YQMZofd4wu
 dPGniMVnb5dUODg==
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

We must power off regulators after failing at power on phase.

Signed-off-by: David Heidelberg <david@ixit.cz>
---
 drivers/input/touchscreen/stmfts.c | 13 +++++++++----
 1 file changed, 9 insertions(+), 4 deletions(-)

diff --git a/drivers/input/touchscreen/stmfts.c b/drivers/input/touchscreen/stmfts.c
index c1c9570ddea2d..bf176907177d0 100644
--- a/drivers/input/touchscreen/stmfts.c
+++ b/drivers/input/touchscreen/stmfts.c
@@ -558,7 +558,7 @@ static int stmfts_power_on(struct stmfts_data *sdata)
 
 	err = stmfts_read_system_info(sdata);
 	if (err)
-		return err;
+		goto power_off;
 
 	enable_irq(sdata->client->irq);
 
@@ -566,11 +566,11 @@ static int stmfts_power_on(struct stmfts_data *sdata)
 
 	err = stmfts_command(sdata, STMFTS_SYSTEM_RESET);
 	if (err)
-		return err;
+		goto power_off;
 
 	err = stmfts_command(sdata, STMFTS_SLEEP_OUT);
 	if (err)
-		return err;
+		goto power_off;
 
 	/* optional tuning */
 	err = stmfts_command(sdata, STMFTS_MS_CX_TUNING);
@@ -586,7 +586,7 @@ static int stmfts_power_on(struct stmfts_data *sdata)
 
 	err = stmfts_command(sdata, STMFTS_FULL_FORCE_CALIBRATION);
 	if (err)
-		return err;
+		goto power_off;
 
 	/*
 	 * At this point no one is using the touchscreen
@@ -595,6 +595,11 @@ static int stmfts_power_on(struct stmfts_data *sdata)
 	(void) i2c_smbus_write_byte(sdata->client, STMFTS_SLEEP_IN);
 
 	return 0;
+
+power_off:
+	regulator_bulk_disable(ARRAY_SIZE(stmfts_supplies),
+			       sdata->supplies);
+	return err;
 }
 
 static void stmfts_power_off(void *data)

-- 
2.53.0



