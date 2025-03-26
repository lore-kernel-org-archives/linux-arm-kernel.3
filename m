Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D53DC36008
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 26 Mar 2025 14:55:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=6EuDjXKidQBl0tqYxtEZ2ruC/3IuVI6jN86tCBBzL/s=; b=3X1ciTjkFK5mzXWazdaQRmh3Xm
	b9SLl001y0I2xxNsqZhWvTCfsNPLry71S76vCODvYYQdVzX5wPG/QLJUIabhp17WdQAYbrp2UaLRj
	FTd3vk4mD/6kuedCXeX4MnCWTnkZXWHXr6PLiEQd/CpXDcARr+lFgSrY/3JW2IWZgzC/KEqaP5xe3
	jv+Y106SuZ1oO2UVa6s+TbRJ4zWZ+hJsdZS8P2OUu+F22EErk6SFM9+5CUMq03hfs+LY7iPsYK/lL
	QNg1ozHoinOdEeW4aNC0CzNfi9MtEhgNxQS3SHqr35Xj/mt9QiOabasxzlqN7dJs2Dauz4CmGCEfU
	Y+1J4wFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txSAU-00000008lU1-47fv;
	Wed, 26 Mar 2025 14:55:46 +0000
Received: from mail-lj1-x229.google.com ([2a00:1450:4864:20::229])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txRvL-00000008iTe-26Os
	for linux-arm-kernel@lists.infradead.org;
	Wed, 26 Mar 2025 14:40:09 +0000
Received: by mail-lj1-x229.google.com with SMTP id 38308e7fff4ca-30db2c2c609so19762031fa.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 26 Mar 2025 07:40:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743000005; x=1743604805; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=6EuDjXKidQBl0tqYxtEZ2ruC/3IuVI6jN86tCBBzL/s=;
        b=GLPgejKfQaoaHOA1KiVIO4TPK3y9XfOUYJKdwdTL2NTz3uKbD8QxdEzs5RPUmKWaRU
         pI+nFf1eFIf1atDvTDRNXadX01MdYJAFSJHH1Tq7vzquZ1ClxbPs0En5QF4fslvXwfrE
         Xm5tv5ijuNozqHfiGj2LViob+aKLASbbVcYnkPsSOG5S9qkNIWjXyDmBOSSVzrepY8hz
         if5qok5vEF0NM8PdLUYYDEVWajGmQVTei7JSLxwO0uvWT8IjSAlGXz/WIX5Xr9eHhVjA
         qTGX5BFw7IRCtzGXIfUdwU65kW5TZrUVyfV1ahQyzaqSNkP9GMqNCiGZdPeKd1z7h8Iy
         knUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743000005; x=1743604805;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6EuDjXKidQBl0tqYxtEZ2ruC/3IuVI6jN86tCBBzL/s=;
        b=uO6a9oLGa6byvyE4qfVyNMItz9reShuK4DWN9QuDMiwzaSkZBqkhZh20g0gDh3U6wZ
         +2u44KOW3G5nehApE8sFHb8t9EYlBD/bHnPUei/14ONXQ2OtiOAfMXcLUZ3u3LFulqOS
         AST/Z0w4X1zx7wgjHWTP+o7AxCXwLo3Pg/CiXZDdvfVsSm/PlLQ0uS4xs1oMcUJ+zDV9
         Ihv58PGxlognZjOlIa/tohh4ADLW+m4RL8+ACPWdvcgC3O32iFM0oAfX8d67kB/HS5ou
         25X4P6mNOKukFNZkUIxzN7x374BhdLyOTF7U72+f6op+QSTwH8UeyisLOZ6fQ85jnO7S
         I2+w==
X-Gm-Message-State: AOJu0YyyL5FIBfTZgi3F6mscQeb/yMUtUAnfRqLXs1UTAux28iHXlgcj
	fav234RqZWFyk2jJP5H2qk2aRT3KrSmbgyTQns3lJKY0QsXGXuHZ
X-Gm-Gg: ASbGnctWNpQeNmtNT4KPj+ToWaLgI2heSSaMf8WLw4PPFJAzMLNezicVZQjdpLu8wDp
	D3TnvXYrdBEdXxDgSO/IYrLJFe5t54TqEcYyEOrPeldjvpYiT9WMuuF+lXsC4TtFRkjrT6gL/1y
	YNDTMk+EBk+eRdWcyByXLPr1nI6rjBScZfAdViWhyyb8aXHgdV4QA0wpbfL+BnPuK2DXTqS6zZy
	yHFghLLwUMMiyOX3EpDZFcX2+V7/VBV0NRxuJMKIcpNeuyCUaqEM48i+3or+TieK2R7ZpneBQ08
	RQpHhNq1AESjqerahauooK8zUyBgs7B2uQMHEc3neKF6ceiyewt5UjuwEglfkQYCEzHXREApKW3
	zLLdSZuVTqu744BUH+zqKcx8=
X-Google-Smtp-Source: AGHT+IGGn5bSE4gjHMGAHWfQJJacrQvAex99kJygteLoNoccgFY1I0pKwaSx1wgBttcnB2NtTW5XBQ==
X-Received: by 2002:a05:651c:c9:b0:30b:ef98:4653 with SMTP id 38308e7fff4ca-30dc5f50f0fmr19151fa.36.1743000004960;
        Wed, 26 Mar 2025 07:40:04 -0700 (PDT)
Received: from [192.168.1.11] (83-233-6-197.cust.bredband2.com. [83.233.6.197])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-30d7d7e05f8sm21595771fa.32.2025.03.26.07.40.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Mar 2025 07:40:04 -0700 (PDT)
From: Marcus Folkesson <marcus.folkesson@gmail.com>
Date: Wed, 26 Mar 2025 15:39:47 +0100
Subject: [PATCH] i2c: davinci: add I2C_FUNC_PROTOCOL_MANGLING to feature
 list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250326-i2c-v1-1-82409ebe9f2b@gmail.com>
X-B4-Tracking: v=1; b=H4sIALIR5GcC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1MDYyMz3UyjZF1TUzPDpDQLU+M0ixQloMqCotS0zAqwKdGxtbUA+hD6FVU
 AAAA=
X-Change-ID: 20250326-i2c-5561bf853f8d
To: Bartosz Golaszewski <brgl@bgdev.pl>, Andi Shyti <andi.shyti@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Marcus Folkesson <marcus.folkesson@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1325;
 i=marcus.folkesson@gmail.com; h=from:subject:message-id;
 bh=Im/ujHBZDbDagi4RGHUSi6sQR6/F1nq9HzO7V8ZfdGk=;
 b=owEBbQKS/ZANAwAIAYiATm9ZXVIyAcsmYgBn5BG9NAOxehASk4e1pFtaO3cbQpTn2CrmEBGM2
 YmGZqjRpYmJAjMEAAEIAB0WIQQFUaLotmy1TWTBLGWIgE5vWV1SMgUCZ+QRvQAKCRCIgE5vWV1S
 MpMqD/0ZBxXUzH+XujR8gYWy6eMIbJDaF2Aov8H/slrc+vlPbqozidmexoUC7AoEB4s9tdotYmx
 hF2ko8DQXK4XFcyqI37/JoB+OEb+cce00U0sHGA3jJypk4Dj5KkwL4IgAKkuObZ9YmiX0xZ3F1H
 tSOgVQNmhI88KbUNV57wDPmMr2z8KYHK+D/7pi56iCRVr4VvCS84tyBcN8gZSAi3ayYObAkgTx1
 M7gG60WyPOZmobjQPacpz+lFslnBHj5UExruDrGvPTffQQZsc3wykz5zutpLVrqlbbrV/XfybmC
 KWzxI9dFp9Zb+nTiMT+ge3qbwYbvU5Lh5urpn0ImO2aUVdo1hvMqi5ezjnPEBA7y1WMU5vW/Dwy
 V0R8fYx5vPVhTmNSQDm9dega5t2AR2uO+bSq1cyowU5GWcrZ0nl/bdj4cuIQw68XCoHOWQjsXI/
 UqyrXLxz4773FZzS3kAEZaQbiOnJUcOcI7W89rjY9dXoKkdULqbuY91I0vKcCe5dHwLHixUm39m
 w+yMLA04IukrY6rNCXMhWwsR9qLbclRWpCKCTabz1U2eAgJZeHdD46UYu7yO9Na+46I2ulrC4gk
 vs10XGNbwEjp7/mxQ6zR22GSRa4qYcyGjWQ8BLRAUT/DzpZS6sziUQoFPwkAG7l/2LqPLzVk8bL
 kdabjV5sNdNojog==
X-Developer-Key: i=marcus.folkesson@gmail.com; a=openpgp;
 fpr=AB91D46C7E0F6E6FB2AB640EC0FE25D598F6C127
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250326_074007_549585_D2A49D66 
X-CRM114-Status: GOOD (  11.67  )
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

The driver do support I2C_M_IGNORE_NAK, so add
I2C_FUNC_PROTOCOL_MANGLING to the feature list.

Signed-off-by: Marcus Folkesson <marcus.folkesson@gmail.com>
---
The driver do support I2C_M_IGNORE_NAK, so the
I2C_FUNC_PROTOCOL_MANGLING bit should be set.

I2C_M_IGNORE_NAK is the only supported "mangling-feature" though, but
other i2c bus drivers also seems to support only a subset of available
mangling-features, so I guess this is ok.
---
 drivers/i2c/busses/i2c-davinci.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/i2c/busses/i2c-davinci.c b/drivers/i2c/busses/i2c-davinci.c
index 6a909d339681214ed4f382b62f8cd924f4295e69..6a3d4e9e07f45ecc228943e877cde1fd9d72e8cb 100644
--- a/drivers/i2c/busses/i2c-davinci.c
+++ b/drivers/i2c/busses/i2c-davinci.c
@@ -551,7 +551,8 @@ i2c_davinci_xfer(struct i2c_adapter *adap, struct i2c_msg msgs[], int num)
 
 static u32 i2c_davinci_func(struct i2c_adapter *adap)
 {
-	return I2C_FUNC_I2C | I2C_FUNC_SMBUS_EMUL;
+	return I2C_FUNC_I2C | I2C_FUNC_SMBUS_EMUL |
+		I2C_FUNC_PROTOCOL_MANGLING;
 }
 
 static void terminate_read(struct davinci_i2c_dev *dev)

---
base-commit: 1e26c5e28ca5821a824e90dd359556f5e9e7b89f
change-id: 20250326-i2c-5561bf853f8d

Best regards,
-- 
Marcus Folkesson <marcus.folkesson@gmail.com>


