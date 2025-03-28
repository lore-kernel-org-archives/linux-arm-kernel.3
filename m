Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E135C28B20
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 28 Mar 2025 14:10:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AGZF3iY+lrce/peuoGWoI8dxWV9rSVtCllywJ68wEfI=; b=NM6YY3Q/HQmEEZBFQ0zwPbo1C0
	+QJimWC+jgKDLuOCgt2IUBDUHA95dqy/+NqmuJ6z6yRm/6VR19VDOBYuhRBgjNjCvZrp7Oz3pycVa
	8ewbm5sAxMJ/yq9LeaWUPHYZ3knJanQPkUumL8W1zhRuY2adCJxJS0xVvfiIDYplWJVrA/t0Py362
	/9d8LrtiwwH4EHTB9lRgr1eIXaPMiTfuF4lYGxKiJYXDSBvMuWOl6Stk83l6GQLrGcybZDQLisyZ3
	fHbwnVUIPOB+GinV+IyrOsrYMfodZ6q04tP5tTdASszihTJbJCCqiiTda1Z9mLmFZS/e56h5aG9LT
	Qd7YcC9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tyAPE-0000000DYDu-2Gjk;
	Fri, 28 Mar 2025 14:09:56 +0000
Received: from mail-ed1-x530.google.com ([2a00:1450:4864:20::530])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1ty9ne-0000000DQkP-1Cky
	for linux-arm-kernel@lists.infradead.org;
	Fri, 28 Mar 2025 13:31:07 +0000
Received: by mail-ed1-x530.google.com with SMTP id 4fb4d7f45d1cf-5e5e22e6ed2so3160352a12.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 28 Mar 2025 06:31:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743168665; x=1743773465; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AGZF3iY+lrce/peuoGWoI8dxWV9rSVtCllywJ68wEfI=;
        b=EMCqBmpJODrXYXhWJ2HduDgx/RWWqPsEjPxnvX0R+Xb3davoiwSeGelmM6EpvgvB/i
         AVhIDX+ZT0fQnH3F3K5GwXcmsCiXmr/XFcUbvq55epTXhIz4e1pRCeHe6KZlA4v23myH
         QDG5w8qhtMUBb0OFQeOb9oHG9D/VQDPS367iKpOT6nhDG5MhyMGABFpvSrEfBV7bYIR5
         sUld5+9F1QnMDTitz0syI50WmXZMCCKpPxL0gck09E3nOG2bsoJdJ1zjvd6wqciQNLuP
         6gycAH5EzP9VSs4/dQc7aVJVebaBZPyW1IaTiGUbNzAMc3zbNF28UVDe7zDyqp+ShhiQ
         uxQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743168665; x=1743773465;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AGZF3iY+lrce/peuoGWoI8dxWV9rSVtCllywJ68wEfI=;
        b=Tcnx04MLMT3j40vpPoiJ0tdwhqg85KT2l5O524qjy+I3IHnkZQTxO1gvSEH0VTIlzS
         PbeMqTwEyxitSocW3fAVdzL3rLex9xgLYVh12Ix9motec7T+tRDDffJUnTGN9qjJ4ntK
         srGu+BeR8GoD8f4/A+rV79IpqOAr5FUT7Epeq8F4toKHD9z8XQsswrTe1AhjaLQGc7zf
         Fg7qGSa9CtWhWQEtl6/PUXj32VY1OL+ael5h6MqIsNdXncQ5ZEAPyL/QCCKt+Y/CRe0K
         Gcevey7uUVxrptfDBGJE+RZDhoiungKniJNEy3sug4SMmjczHnHnf0xYUmCds5RYazZe
         FTmA==
X-Forwarded-Encrypted: i=1; AJvYcCXNtIKjdjwc1CPWeJAcLsulkFeM8bYFSk4hEqLFMOzbpP+q1Icg84Ivna2WMYcXnX3VpyjUn94a437QX19S7gLD@lists.infradead.org
X-Gm-Message-State: AOJu0YyCSYAQXsNfYCa6dCRGCpITnQIzfPg+FK/SVnLyF21fs3OQ1FDv
	zxhtcafeZeUYSpa8Je4gEo+6dYicCR3KeFRmf4kgq/l3xUSUH0OAVv6G8yygsfs=
X-Gm-Gg: ASbGncvi5N7hrH64MxiwIGPoybu6ngOcyTpmBx0GqcNn/310w8hqPJ3Ui7Lt4fPoGeR
	Sx71yyixC8bVXtrTa//64cEDV0SpVw8mC13gfJmRFdX8b5pSMNP4Pwd0NODXXB+l08HA3ioKwKw
	G5XstCcjHbL2iY0bCOJhXo+ehudODY7MCeHJTzXQFOp+5esc77njjOQf3VPtAtjWLKKaO/gku3r
	5SAhKFBP+UCHiywaUULYdEUSpTr81dJMfrhD6xs9pUFLKMBYmJspLPfwHIhj/mtGYKzWEZqedys
	wMBNQBXNU4oQNCStfFDhihNSG6F3hblIlanCT+a1NYeFLVRqWqXQQxDmn9TPHJsrPB7oR6+43km
	gKjoVgWFlhFlK0OaGHN9aRrFI1A90
X-Google-Smtp-Source: AGHT+IE/8XexhkCjt++gZyl4aQeO3RmSnHYdltcD1RaSzcc8eBzKzYT4GuhaF+2UqXAsXXHHf+aEJg==
X-Received: by 2002:a17:907:84a:b0:ac7:31d5:20de with SMTP id a640c23a62f3a-ac731d52b5fmr47028466b.50.1743168664749;
        Fri, 28 Mar 2025 06:31:04 -0700 (PDT)
Received: from puffmais.c.googlers.com (8.239.204.35.bc.googleusercontent.com. [35.204.239.8])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5edc17e01f7sm1355284a12.79.2025.03.28.06.31.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Mar 2025 06:31:04 -0700 (PDT)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Fri, 28 Mar 2025 13:29:07 +0000
Subject: [PATCH v2 21/32] mfd: sec: convert to using MFD_CELL macros
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250328-s2mpg10-v2-21-b54dee33fb6b@linaro.org>
References: <20250328-s2mpg10-v2-0-b54dee33fb6b@linaro.org>
In-Reply-To: <20250328-s2mpg10-v2-0-b54dee33fb6b@linaro.org>
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
X-CRM114-CacheID: sfid-20250328_063106_336713_89508607 
X-CRM114-Status: GOOD (  12.90  )
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

Use MFD_CELL macro helpers instead of open coding. This makes the code
a bit shorter and more obvious.

Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
 drivers/mfd/sec-common.c | 57 ++++++++++++++++++------------------------------
 1 file changed, 21 insertions(+), 36 deletions(-)

diff --git a/drivers/mfd/sec-common.c b/drivers/mfd/sec-common.c
index e8e35f7d5f06b522a953e8f21603e6904401c983..448300ab547c10d81f9f2b2798d54c8a03c714d8 100644
--- a/drivers/mfd/sec-common.c
+++ b/drivers/mfd/sec-common.c
@@ -24,16 +24,13 @@
 #include "sec-core.h"
 
 static const struct mfd_cell s5m8767_devs[] = {
-	{ .name = "s5m8767-pmic", },
-	{ .name = "s5m-rtc", },
-	{
-		.name = "s5m8767-clk",
-		.of_compatible = "samsung,s5m8767-clk",
-	},
+	MFD_CELL_NAME("s5m8767-pmic"),
+	MFD_CELL_NAME("s5m-rtc"),
+	MFD_CELL_OF("s5m8767-clk", NULL, NULL, 0, 0, "samsung,s5m8767-clk"),
 };
 
 static const struct mfd_cell s2dos05_devs[] = {
-	{ .name = "s2dos05-regulator", },
+	MFD_CELL_NAME("s2dos05-regulator"),
 };
 
 static const struct mfd_cell s2mpg10_devs[] = {
@@ -45,53 +42,41 @@ static const struct mfd_cell s2mpg10_devs[] = {
 };
 
 static const struct mfd_cell s2mps11_devs[] = {
-	{ .name = "s2mps11-regulator", },
-	{ .name = "s2mps14-rtc", },
-	{
-		.name = "s2mps11-clk",
-		.of_compatible = "samsung,s2mps11-clk",
-	},
+	MFD_CELL_NAME("s2mps11-regulator"),
+	MFD_CELL_NAME("s2mps14-rtc"),
+	MFD_CELL_OF("s2mps11-clk", NULL, NULL, 0, 0, "samsung,s2mps11-clk"),
 };
 
 static const struct mfd_cell s2mps13_devs[] = {
-	{ .name = "s2mps13-regulator", },
-	{ .name = "s2mps13-rtc", },
-	{
-		.name = "s2mps13-clk",
-		.of_compatible = "samsung,s2mps13-clk",
-	},
+	MFD_CELL_NAME("s2mps13-regulator"),
+	MFD_CELL_NAME("s2mps13-rtc"),
+	MFD_CELL_OF("s2mps13-clk", NULL, NULL, 0, 0, "samsung,s2mps13-clk"),
 };
 
 static const struct mfd_cell s2mps14_devs[] = {
-	{ .name = "s2mps14-regulator", },
-	{ .name = "s2mps14-rtc", },
-	{
-		.name = "s2mps14-clk",
-		.of_compatible = "samsung,s2mps14-clk",
-	},
+	MFD_CELL_NAME("s2mps14-regulator"),
+	MFD_CELL_NAME("s2mps14-rtc"),
+	MFD_CELL_OF("s2mps14-clk", NULL, NULL, 0, 0, "samsung,s2mps14-clk"),
 };
 
 static const struct mfd_cell s2mps15_devs[] = {
-	{ .name = "s2mps15-regulator", },
-	{ .name = "s2mps15-rtc", },
-	{
-		.name = "s2mps13-clk",
-		.of_compatible = "samsung,s2mps13-clk",
-	},
+	MFD_CELL_NAME("s2mps15-regulator"),
+	MFD_CELL_NAME("s2mps15-rtc"),
+	MFD_CELL_OF("s2mps13-clk", NULL, NULL, 0, 0, "samsung,s2mps13-clk"),
 };
 
 static const struct mfd_cell s2mpa01_devs[] = {
-	{ .name = "s2mpa01-pmic", },
-	{ .name = "s2mps14-rtc", },
+	MFD_CELL_NAME("s2mpa01-pmic"),
+	MFD_CELL_NAME("s2mps14-rtc"),
 };
 
 static const struct mfd_cell s2mpu02_devs[] = {
-	{ .name = "s2mpu02-regulator", },
+	MFD_CELL_NAME("s2mpu02-regulator"),
 };
 
 static const struct mfd_cell s2mpu05_devs[] = {
-	{ .name = "s2mpu05-regulator", },
-	{ .name = "s2mps15-rtc", },
+	MFD_CELL_NAME("s2mpu05-regulator"),
+	MFD_CELL_NAME("s2mps15-rtc"),
 };
 
 static void sec_pmic_dump_rev(struct sec_pmic_dev *sec_pmic)

-- 
2.49.0.472.ge94155a9ec-goog


