Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0AAC8E8538C
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  3 Apr 2026 17:08:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=E1wC+d+3NGV70Ek+1v3AVF2TWcpDVdtCv5a6ZNKkN/E=; b=Yx+cgOC9LZLGgJLm1BLshWC2n8
	63H+A0/s8ur5cOPaTrjnALMw1J1BRRKl+q+0xuPbFVdK6Oq5129IHEH2V3Pl/gjynIMDvcA0TNDbe
	KtdPAaNLDJhe+pv7XiLDS0Alxdat688Mfrj+Q0ELGYEZv/sl9/ZScQHqjBP8hh+6KQfLCAL99FY4/
	2ePMaMcnz/PyFytrKN25H4atjV+4Cq/SlPuhu6dax/2wE18GUZ0YsqBJ8N0O3I/NEs8cnjHESN7a0
	ZSAe+yOoChce22h6qpRL6RqOYh7zzKTD7k8iC494S5uqOchWBX84l8QE4yrp1T2a5FuQC1DZXelvP
	XP4K6pIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8i0h-00000002MqG-2773;
	Fri, 03 Apr 2026 17:08:43 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8i0c-00000002Mm8-1hAC
	for linux-arm-kernel@lists.infradead.org;
	Fri, 03 Apr 2026 17:08:40 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id D1E0F44718;
	Fri,  3 Apr 2026 17:08:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 9E321C2BCC6;
	Fri,  3 Apr 2026 17:08:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775236117;
	bh=Jd5hIGfiPnahT8dkJsoGA3qIVbAw/LNGEyDeatYvUyM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=fQ3mmr3bbLJlJcAijLaivoz/MvATvzKUtsAtFnIjusgLJZyOKnLexFoTs9f8kyJGd
	 YMJIokW8qZMTjTsF/55TjRSJ9PolPEwpD4TTjqErUBLNkWAMaoCHeYvQHFVGqQGK1H
	 s/QAIMByLVESRSRO7DRgKsvoyCVucP+AdA55cWjhqTOt+reVHCXmrhCOAOn1Eaicvf
	 60f8c4s3ttLwc8aWwZe7OJssvFudNqRMyuiFY4wUKIKq+cc/ALVzbl4788FmVIQ/V8
	 oMzw52YTGHeNFfdTfXF0JnGPhHqYRfssFqYqe/eBLF6ooVw6cRmNyC/aRNgKcA+OtN
	 OQ3qvUejcv6Ng==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 866A9E85385;
	Fri,  3 Apr 2026 17:08:37 +0000 (UTC)
From: David Heidelberg via B4 Relay <devnull+david.ixit.cz@kernel.org>
Date: Fri, 03 Apr 2026 19:08:34 +0200
Subject: [PATCH WIP v3 05/11] Input: stmfts - disable regulators when power
 on fails
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260403-stmfts5-v3-5-5da768cfd201@ixit.cz>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1598; i=david@ixit.cz;
 h=from:subject:message-id;
 bh=LIButZg+Qr0VYxOivFVqKi0JBvx+GtP/QaYfETouW78=;
 b=owEBbQKS/ZANAwAIAWACP8TTSSByAcsmYgBpz/QQDRJtfGA8dK851nFa0dQ2JxBOUNYT4wkCr
 AFhPDC+8smJAjMEAAEIAB0WIQTXegnP7twrvVOnBHRgAj/E00kgcgUCac/0EAAKCRBgAj/E00kg
 chRsD/4viI8uLlIse4j+WjF/Uq1x/n9t9g5nLR1KsGmY0DhwTdIBIuQmw8A9ImwhszZKGdkvp9l
 zmnv838m5M6RJkoPON0r40lybn8gqpnfj5m8ARTc6KPMLWU6TXDOq1TnEyOEe4hw108M8illqoz
 aIHkVowf54KSR1RVielpe2OVGn62cJaUXAYxwukiVR5TWBqJSW//S4vVhl3njlxteMy1/3UuFRB
 LRqQKsp0NsT+gE5e15nz8CT7I/ePTGRWHXAjZGwliX9Q8auG0XK353zzTZdByOc9hlPAHhXflRR
 o6QhQfzv8ZBNmVrqWORV8ylaLzMvgUP35aRQUNLUPwHTPb13v6mIVL1BgyvNYMHdKgpdwylKQTb
 FtVp7BvzWOohL6ZAOnElhUWs/68XwTh/hweYO5oGzDd5vXsm4QulPhMaRNuVec384gHW7hhyIxx
 OnnT/TJ9G/ZDjuZuEixwY3z1nOC+wBR7CxK2ATluQsXJGQtTznACmK5FI97hEtj3pERBAg7se9V
 uPnwfrcPf8PWAI/zKzfM3o6SP8FTv6PeJI+YCPTjjQKXhaRNpfYxhwPJeKWiyME3/ciS8iXt8RP
 JmMSYAVojQxXqBucqLcR7QxjqDqq+Ieoy5tCGWb3B+Fwf7ULEbO3mNg4eeGb7W2uLEk81zO4W+a
 RAOiIQYfrSrDGgg==
X-Developer-Key: i=david@ixit.cz; a=openpgp;
 fpr=D77A09CFEEDC2BBD53A7047460023FC4D3492072
X-Endpoint-Received: by B4 Relay for david@ixit.cz/default with auth_id=355
X-Original-From: David Heidelberg <david@ixit.cz>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260403_100838_492201_B4E13FB9 
X-CRM114-Status: GOOD (  11.31  )
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
index 71d9b747ccfc5..a90528b76f52b 100644
--- a/drivers/input/touchscreen/stmfts.c
+++ b/drivers/input/touchscreen/stmfts.c
@@ -557,7 +557,7 @@ static int stmfts_power_on(struct stmfts_data *sdata)
 
 	err = stmfts_read_system_info(sdata);
 	if (err)
-		return err;
+		goto power_off;
 
 	enable_irq(sdata->client->irq);
 
@@ -565,11 +565,11 @@ static int stmfts_power_on(struct stmfts_data *sdata)
 
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
@@ -585,7 +585,7 @@ static int stmfts_power_on(struct stmfts_data *sdata)
 
 	err = stmfts_command(sdata, STMFTS_FULL_FORCE_CALIBRATION);
 	if (err)
-		return err;
+		goto power_off;
 
 	/*
 	 * At this point no one is using the touchscreen
@@ -594,6 +594,11 @@ static int stmfts_power_on(struct stmfts_data *sdata)
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



