Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F8A7C28B30
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 23 Mar 2025 23:02:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vmds4rrDLrfKJmwR2Z+ZSZKx1qRT0gZntXalkJpQH7Y=; b=SxqSZ1BlXKIz4Uog0wLmxPt0Md
	EdIGAxi5aS+dMTtCws51EKDHOpQPhpt3LhvxaHAOvFWvA9aJ5B3nCv1mlMaOwGz+eRP0Bx5RJrEAW
	rIcvOQi2MHcWEHsLpLTvAflyW2z+8larz1n7H6B5VNhJ1qyAHTno3WyLMxRZb94HGXWCKpYoiynHL
	VkwF6ilJx7nhg8FcID68I3/RGnErXcQYebXl9xl5ovoum7G8hEOWcnsqH8t3/KAkV6rDme8Qwbby2
	7pnQjnNEW3Qayc8rXwXVVVUFOc8tQWj5l++JhlQkHZ3aeZmqho5SIjpEDC7j6GUwekgLzZwKiFiIr
	aJCzgWrw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1twUKg-00000001sW6-0zGj;
	Sun, 23 Mar 2025 23:02:18 +0000
Received: from mail-ej1-x62b.google.com ([2a00:1450:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1twTyf-00000001p7v-2yCS
	for linux-arm-kernel@lists.infradead.org;
	Sun, 23 Mar 2025 22:39:34 +0000
Received: by mail-ej1-x62b.google.com with SMTP id a640c23a62f3a-ac2bb7ca40bso838510166b.3
        for <linux-arm-kernel@lists.infradead.org>; Sun, 23 Mar 2025 15:39:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742769572; x=1743374372; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vmds4rrDLrfKJmwR2Z+ZSZKx1qRT0gZntXalkJpQH7Y=;
        b=X06CIcpORvkySIjHbQKSU7dylDyD2+3gt0VshJl96PfUCMfo586FNsO63oA1gtKVUf
         VesvFIfgb+aHOKTVb5KYt3ACVYCBI6i47+X6NX5dmVNqL3RTvyakO9uMQ9EIgWOLnYTs
         H2GprlxlA8xLNfnWWMhQZmwe00KG+E9VGv6UtgFbKrqgMmmyzOF1xKGl56u3aPu838bd
         eSFlw/XdMOujoML/0V/SKJGQIleRehzWDW9nbwGcmN2ZJU44hi5g3eyVcF/mrJDJzp6K
         OVHm9lom5RwwJ1zz1PcFJYmoMlmNFpYGFG5O8iZuuB3xTPH882DjMWoIBvDMGneOK7S9
         xnhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742769572; x=1743374372;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vmds4rrDLrfKJmwR2Z+ZSZKx1qRT0gZntXalkJpQH7Y=;
        b=p21NyBh+H8zBvObxeeck1FmGZYVfy7WKD3dWKz5Vg0vobIWTTMNYsmRVcPuHdqIR4v
         b83302bbtxs97vt9dHYQ/AqVnNzzB5ps4aAShj2Z/HoxJy01O8B8jSXV3cpjFQNCTdtD
         r2TopznTAqB01AXNIQnw/JlflBpw9D/jZw6Eq2QvDexE8kpItZ6xeZbhTYzJW86V/3sz
         mpk24P3f+Zsqzvvofk8LtwnHpeOpZaE7qb4TnMskgIMyi7de1G0vPRPFMBaFE5dC2q2B
         zF+N4BEuPcs1cFQPqcF2nWNit0FtrHA2XaKrwvn7E6lYI3/u+z7FRqZofJsc9uQGwQBJ
         MV7Q==
X-Forwarded-Encrypted: i=1; AJvYcCWbevTIZEKXwnzfsA48EBXZpVZuW41rh921N27fB7PnrvQMxKOxLE2Aho/QDFep0roOXN9j3a3dGaYEXDQ1ZvGx@lists.infradead.org
X-Gm-Message-State: AOJu0Yxjxyjoc8hoHudekPbI1h3C8ZjzgjX8NmHfeLvFSIp5mVTvRHdv
	v+Inb0x/CsNb56NPGOGmRSGDCBt139rokwWb1Gl00FBX+eTg2hziCmxnU6kY9C8=
X-Gm-Gg: ASbGncudAt45sP5Q3CVycQvbq6HgtMCMKTZB0XzS7AdaGxRXv4ukw783KyFCi/+dG/d
	CAEgciQ90WG2WcaGyAr/0eQ4tAqr09MEMrxTL3BJzbSZxPaAc9zfXNa70oRJAx4xLB2XCCcLjjv
	uhav0mMHBdspbHYbqJELKHLr+aRrvI4rK2ejN2l6/++CIB6WO906jfKHYdW8j2Wa0mZeYTj+LOq
	KQ6HPlsvnRat/PwDRZRyT/Qob8Dket6oMuvwqHVjwjXfYZrCGiNi7lfhjdg5rSE9m0ua66/lhrF
	r2HE2yXL53PSCFVUIqd07BSgFrsLwnDBF+Dbxa+s9CrNgofTwkjbdeWWTVKNjl7eiWG0R68mEmD
	nzRdsY24IAAwveHbaI81/u9AQx9aQ
X-Google-Smtp-Source: AGHT+IEN5dOxnNTTla9a5uamRe8PZKZsb3egHapeEJMQ/eCTIADM/0J2Xb8LBoxvBHWdtuRNYkVBpg==
X-Received: by 2002:a17:907:bd88:b0:ac4:2ae:c970 with SMTP id a640c23a62f3a-ac402aec9f2mr753664066b.21.1742769571904;
        Sun, 23 Mar 2025 15:39:31 -0700 (PDT)
Received: from puffmais.c.googlers.com (8.239.204.35.bc.googleusercontent.com. [35.204.239.8])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac3ef86e44dsm559686666b.31.2025.03.23.15.39.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Mar 2025 15:39:31 -0700 (PDT)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Sun, 23 Mar 2025 22:39:30 +0000
Subject: [PATCH 14/34] mfd: sec: sort struct of_device_id entries and the
 device type switch
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250323-s2mpg10-v1-14-d08943702707@linaro.org>
References: <20250323-s2mpg10-v1-0-d08943702707@linaro.org>
In-Reply-To: <20250323-s2mpg10-v1-0-d08943702707@linaro.org>
To: Krzysztof Kozlowski <krzk@kernel.org>, Lee Jones <lee@kernel.org>, 
 Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Chanwoo Choi <cw00.choi@samsung.com>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Russell King <linux@armlinux.org.uk>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Peter Griffin <peter.griffin@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Will McVicker <willmcvicker@google.com>, kernel-team@android.com, 
 linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-clk@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rtc@vger.kernel.org, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250323_153933_874081_003B0039 
X-CRM114-Status: GOOD (  12.48  )
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

Sort struct of_device_id entries and the device type switch in _probe()
alphabetically, which makes it easier to find the right place where to
insert new entries in the future.

Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
 drivers/mfd/sec-i2c.c | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/drivers/mfd/sec-i2c.c b/drivers/mfd/sec-i2c.c
index 803a46e657a5a1a639014d442941c0cdc60556a5..ba0efb30877bf668fed7476a5e247e0dd4095806 100644
--- a/drivers/mfd/sec-i2c.c
+++ b/drivers/mfd/sec-i2c.c
@@ -174,12 +174,12 @@ static int sec_pmic_i2c_probe(struct i2c_client *client)
 	case S2MPS15X:
 		regmap = &s2mps15_regmap_config;
 		break;
-	case S5M8767X:
-		regmap = &s5m8767_regmap_config;
-		break;
 	case S2MPU02:
 		regmap = &s2mpu02_regmap_config;
 		break;
+	case S5M8767X:
+		regmap = &s5m8767_regmap_config;
+		break;
 	default:
 		regmap = &sec_regmap_config;
 		break;
@@ -204,11 +204,11 @@ static void sec_pmic_i2c_shutdown(struct i2c_client *i2c)
 
 static const struct of_device_id sec_pmic_i2c_of_match[] = {
 	{
-		.compatible = "samsung,s5m8767-pmic",
-		.data = (void *)S5M8767X,
-	}, {
 		.compatible = "samsung,s2dos05",
 		.data = (void *)S2DOS05,
+	}, {
+		.compatible = "samsung,s2mpa01-pmic",
+		.data = (void *)S2MPA01,
 	}, {
 		.compatible = "samsung,s2mps11-pmic",
 		.data = (void *)S2MPS11X,
@@ -221,15 +221,15 @@ static const struct of_device_id sec_pmic_i2c_of_match[] = {
 	}, {
 		.compatible = "samsung,s2mps15-pmic",
 		.data = (void *)S2MPS15X,
-	}, {
-		.compatible = "samsung,s2mpa01-pmic",
-		.data = (void *)S2MPA01,
 	}, {
 		.compatible = "samsung,s2mpu02-pmic",
 		.data = (void *)S2MPU02,
 	}, {
 		.compatible = "samsung,s2mpu05-pmic",
 		.data = (void *)S2MPU05,
+	}, {
+		.compatible = "samsung,s5m8767-pmic",
+		.data = (void *)S5M8767X,
 	},
 	{ },
 };

-- 
2.49.0.395.g12beb8f557-goog


