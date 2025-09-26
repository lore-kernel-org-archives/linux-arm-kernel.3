Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9BCC6CAC5AC
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 26 Sep 2025 04:03:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=P6T43NkvaDj01P2kx1drf+v8B79h0nA8PHSG7DCPm8Q=; b=kZR3phrFa8V6SXSmK3FNOjXVzG
	a8P5q8UkhQGPWOO2qOzhu2DPu2VlJPhYwZK9zYsW/L0mhcVxmS5S+BH6jDIRj8qsYbYAqsNG1XYQz
	1MU8I10KvFIHF1ESKt4gnwOzVwGurHovM2/M7SSuKzmePEkwR/vGrraeADEPPgJLeXE1TK+GTVks4
	baQVAEK4lpWIfmcKxFJhC8y5JXXZxQ3NAvM7h9lu3K3kJKp6KV3mXma6LT6GydREVYRxeXAfeHnVZ
	WhdkhBtnNT1LVDrWosZ/dA/OvMS8oe3mNMx4bz9gfzY3LvIp2KPpMUk4uwPlceqhaFOwkFpy7AL45
	GssXtDAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1zg9-0000000Fa0x-4B0c;
	Fri, 26 Sep 2025 04:03:29 +0000
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1zg7-0000000FZxd-1flL
	for linux-arm-kernel@lists.infradead.org;
	Fri, 26 Sep 2025 04:03:28 +0000
Received: by mail-wr1-x433.google.com with SMTP id ffacd0b85a97d-4060b4b1200so1614275f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 25 Sep 2025 21:03:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1758859405; x=1759464205; darn=lists.infradead.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=P6T43NkvaDj01P2kx1drf+v8B79h0nA8PHSG7DCPm8Q=;
        b=OOvh9c3esUGEZOf/uu0o9yozhuzasrWMn9SYZTxtwRfGYBhUQ72tqOOGWwHHzHo/1t
         2Pt40Ymc0wkcOfvpSHhHzzlD2prdTmVpMPGB1Na+TXOFbyKagDQ8GUrTNgWvBtzIYn7T
         HvDNnt34YjIefcgQr41TVSeCX2O9GpSnZArN+dQ3xFgtiS/t3eErM5M+gBc9sChzhkew
         5sx01vUnSxO+a6dR1h2oyh5EjSL2Q42mY7ifX2UI4GjdgH5cLUlWD3ekesbqtp7q/rab
         bRblfceTLOUl/lNb6rLL/WPmSjXR7EVpQjkMVNnqV/cfP77daogZbotYsCiebPahkmnR
         j6aA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758859405; x=1759464205;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=P6T43NkvaDj01P2kx1drf+v8B79h0nA8PHSG7DCPm8Q=;
        b=sWbW8j4c8yFefQV3YW8XNzteWFMq3SNmhlcQh911AIN5NmhgNWlAYmKGVS6wYPV0uA
         aJJNuUm4psOE0T0CrejxxgHC9D+zZJKkc2nnMRuKsHNg44KVaNGgoxa6zK7HzuZdyN+n
         TgVTlz/nPbR0+j7lCA4PJG2mn1TzhvmMm5qQJuZ6G9IJ0v5ALCOW8YEc5yMLdBl3aGzB
         7ZTQTRe85GSACMKYiYlEnp0wKX4Cw3ea0GSTReA2ycwFDK7qckrMVsZYtaN/pMYAKgmk
         KrggRMncicPBdPL7JJnsYDbiGuyyFFekp4Q5K9g3NrMGStDN9N52I9+wyIsksDD2AwAZ
         8QJw==
X-Forwarded-Encrypted: i=1; AJvYcCWfm2U8V5/74tVSiT4jDsuWjbiLUhv8AV9JfSSgnT/4GxOu+anX75Yq1UWPs8dx7JkhX3bAdl6+VXNTmXtm6yUI@lists.infradead.org
X-Gm-Message-State: AOJu0YxVD+Ba6ON8vpNw5JxUdR6tb8EFf2uxavbST9qNw/3eUdlThXuD
	VXs09JYzufllz2wcsFlBKkXq7jaucy3sm21HOzMlweyzV9tyr/aZatwfbTE9lUOK/R4=
X-Gm-Gg: ASbGncu1+StWqvfjwfb0KD7uJeP1fGodSkckP6YDtfiifOmkppYirXNosJhVVSJcLJT
	mOuDHlX7UhPZqcbhOSDwNmptgE82b4OqvmIFvQcYPUiT6kKIAyRRNhHxmwSJY6thZGL6AgrTUCi
	kwXpWbFdwbvkozwMjqNUoUD3L5hUfUNCW9QPj4jvX7Bi6vcMtgPlX46NCLsG+hTeA0zLsdFByon
	cmJz3blU057D8SvjgPVzq3jXyQaKkA+rYgz7fjbubw+ME4Pl4tteY/knha7MOyYmnLv4LutIw9v
	4AsW8H6XkgV2jV18+F8OVYgej1OW1QB0zoBBovhrYgJLznKrJFl/cJT/4rv38pcxs0FYBmrwKvR
	z2+ZWX6LVRZaoWGUpwgoOI+VoVgbue/zPAegsfdI=
X-Google-Smtp-Source: AGHT+IH8jSZ9cVpDSOMeLWUT/1JDNyhLeRJ9I2gTVKvtZXYra39O++P7RTag+3K6FCsm4O/uhokkGg==
X-Received: by 2002:a05:6000:1a8c:b0:3ee:1279:6e68 with SMTP id ffacd0b85a97d-40e4ce4baf5mr4739778f8f.47.1758859404873;
        Thu, 25 Sep 2025 21:03:24 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-40fe4237f32sm5197655f8f.63.2025.09.25.21.03.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Sep 2025 21:03:24 -0700 (PDT)
Date: Fri, 26 Sep 2025 07:03:21 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Duje =?utf-8?Q?Mihanovi=C4=87?= <duje@dujemihanovic.xyz>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: [PATCH next] clk: mmp: pxa1908: Fix IS_ERR() vs NULL check in probe()
Message-ID: <aNYQiRJDmOO0mEWs@stanley.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250925_210327_439662_9BA62FFA 
X-CRM114-Status: GOOD (  12.03  )
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

The devm_auxiliary_device_create() function returns NULL on error, it
never returns error pointers.  Change the IS_ERR() check to a NULL check.

Fixes: a787ab591c38 ("clk: mmp: pxa1908: Instantiate power driver through auxiliary bus")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/clk/mmp/clk-pxa1908-apmu.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/mmp/clk-pxa1908-apmu.c b/drivers/clk/mmp/clk-pxa1908-apmu.c
index 7594a495a009..e374d7733f56 100644
--- a/drivers/clk/mmp/clk-pxa1908-apmu.c
+++ b/drivers/clk/mmp/clk-pxa1908-apmu.c
@@ -97,8 +97,8 @@ static int pxa1908_apmu_probe(struct platform_device *pdev)
 		return PTR_ERR(pxa_unit->base);
 
 	adev = devm_auxiliary_device_create(&pdev->dev, "power", NULL);
-	if (IS_ERR(adev))
-		return dev_err_probe(&pdev->dev, PTR_ERR(adev),
+	if (!adev)
+		return dev_err_probe(&pdev->dev, -ENODEV,
 				     "Failed to register power controller\n");
 
 	mmp_clk_init(pdev->dev.of_node, &pxa_unit->unit, APMU_NR_CLKS);
-- 
2.51.0


