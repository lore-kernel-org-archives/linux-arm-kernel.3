Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3880CC28B30
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 23 Mar 2025 22:48:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vE10aUiMRjd8RDkwLK4ZfbXWjVS481xd07k1tbR4ePA=; b=ipN339U+QbEk1xSABcRO0ha9QJ
	2nSgoeuDhqRRQGFRtTk/WCOx0uKr3LkdXRXKyu+f1I+OT9jQiUNETmIrBb7snRxn3sog1sNK4vAQa
	bS/czmRkWx6wR3FdtQGpZVEsz+dfTBUxvffKKpMTFwj9bwbtLyAP8ly6XmCWSDOtaNojnLopmmQoF
	dA7b3/Jby0daweqfOZlaPuj4s0ADZJ6cs7ozM/sPCvUVgKxHf8y5wqDGhRE4YooQACALOi5iJpSSn
	icMAIGeZxCo8zH1I7aOeZ8SMnc1Mjd6xhQTTyBIXCZv0pWBarx7Qo4fgKX+dejqO3ZRPDl29oV8vB
	Ph74pW2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1twU6u-00000001qxH-1WXT;
	Sun, 23 Mar 2025 22:48:04 +0000
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1twTyZ-00000001p4S-3VVr
	for linux-arm-kernel@lists.infradead.org;
	Sun, 23 Mar 2025 22:39:29 +0000
Received: by mail-ej1-x635.google.com with SMTP id a640c23a62f3a-ac2a81e41e3so805155366b.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 23 Mar 2025 15:39:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742769566; x=1743374366; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vE10aUiMRjd8RDkwLK4ZfbXWjVS481xd07k1tbR4ePA=;
        b=aSgS2J+nL4ocEKktmipLakRQNHC41ll60Hs+uklRRqS21Za0phZHDTrYJD19QLU9pw
         QBDtHkHHdQW1guwLOgA69fJy1OHIHXgA1ms7dpnAHUDrZHvBuOESIcyL8UovaJL/T6XB
         dp6hOuVBsgMvSYQqN115devP+IzHF/yYYL5GRAjerKQCDG9wf1hBDUiJrMhaTFd67qyN
         PZPm5iSx2FQ+j8XuyRaQNvUZeZouCrBPC8lJCcLmOwTwdW68r8xvK80yD5v9+HN5+tIb
         lTz0m7QixCAX3rHZ2pzxI8qLPlJp8s6BUszQOtUCTRzpnP8kukzC/zlxstyHqHtXVNpZ
         jrsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742769566; x=1743374366;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vE10aUiMRjd8RDkwLK4ZfbXWjVS481xd07k1tbR4ePA=;
        b=C0f2nFtHpje4UCTpBHxWI0/+ji3qmhOscu+tJHpc/NJvBs31Qi09jJcH0z4P3jRy7Z
         aVMHbfN4gJ2O04LICoU0xdAoKNWCYZ7dszAs7qNhrYzbAdwUsHKsTn+B2kQpfFPiFG4y
         pwAPem+GRn3kRh+m2m32cxYRTy7Zqq5nOxQtAtVt8JgCjk+XxL2KF1SagbjJHsBMbWwa
         0M2PvCjVJPZO+aXiP9AP30kuebyK0mbocTqzucXH7ATXvqJOnBK876ELVQuMnz/+QEtk
         GqNHwQg2FbHOimISGgW8Pl9DM+UYj7YMIPB8t4jRT4scli9qXeZdVBPIs7WmjiQ/GXwO
         RC1w==
X-Forwarded-Encrypted: i=1; AJvYcCX/L4ogKMWvG3gIVSuR4z0O3ORztOfc0WgTL//KUGiuju+Ocu0s4XqsBQErtwu0R/5YSdlQvnzJbLgQHGf8Ungc@lists.infradead.org
X-Gm-Message-State: AOJu0YyZO0v1GXRwBXou4i75BXY+9hhYMF+8mifk+Y/FUw/q52ceKw4+
	VwCEKNIJjnCES8kWgxVMaCfg4mnuR5+oBbaKJAhiCWefIyx9bEiRPYBWYD2QmP4=
X-Gm-Gg: ASbGncvr+M6jXq7oEwSQhrM7CHkdDy7fUhdiJDkkQcHIsWvNUKuF7yvhQuNJSVnnmAt
	QSMH+obA3L9xMT93OgkW0hrAQatXJ/L+vxevd+9eu2L+vj3LJ3hwK9hiZUSpwPPsI5skOlGWimf
	FWpazmZWThYIpxRqnstIh/j0CAopBVUb2/YuHbZU1RzMjCw3pQbo726EfXiKQx+bKg+LW2Q3dMu
	aybgoK1XGRWExKH5waQIe68KX37rHSW5MNnbEv0iIM1ugU6Cv0fhmiAUqZU7ApubWwliojaZewE
	/iWi15pJ/mj6n2tqb5bYK0hKXMbF/WX0P59XvOGmq6RH+44xmE82LQsVGBCVVDFhLr6cOjuMv3W
	a09cHlNtY6F7zZpI8JPKNyat3tK8k
X-Google-Smtp-Source: AGHT+IGpWEO6t55UagtbffDf7jAwBntYjANUq6862eIF7eGvrz/eDXOggCL/0jo6AVynnVDx8dSnbA==
X-Received: by 2002:a17:907:97cd:b0:ac3:8988:deda with SMTP id a640c23a62f3a-ac3f24d7916mr1017581866b.40.1742769565973;
        Sun, 23 Mar 2025 15:39:25 -0700 (PDT)
Received: from puffmais.c.googlers.com (8.239.204.35.bc.googleusercontent.com. [35.204.239.8])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac3ef86e44dsm559686666b.31.2025.03.23.15.39.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Mar 2025 15:39:25 -0700 (PDT)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Sun, 23 Mar 2025 22:39:20 +0000
Subject: [PATCH 04/34] mfd: sec: drop non-existing forward declarations
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250323-s2mpg10-v1-4-d08943702707@linaro.org>
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
X-CRM114-CacheID: sfid-20250323_153927_980268_2CE62ED0 
X-CRM114-Status: UNSURE (   9.77  )
X-CRM114-Notice: Please train this message.
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

sec_irq_resume() was removed in commit 6445b84abf91 ("mfd: Add s2mps11
irq driver") and sec_irq_exit() in commit 3dc6f4aaafbe ("mfd: sec: Use
devm_mfd_add_devices and devm_regmap_add_irq_chip") while the
prototypes were left. They should be removed.

Do so.

Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
 include/linux/mfd/samsung/core.h | 2 --
 1 file changed, 2 deletions(-)

diff --git a/include/linux/mfd/samsung/core.h b/include/linux/mfd/samsung/core.h
index f35314458fd22e43fa13034439406bea17a155c9..b7008b50392ab857751b89e0a05d2c27f6306906 100644
--- a/include/linux/mfd/samsung/core.h
+++ b/include/linux/mfd/samsung/core.h
@@ -72,8 +72,6 @@ struct sec_pmic_dev {
 };
 
 int sec_irq_init(struct sec_pmic_dev *sec_pmic);
-void sec_irq_exit(struct sec_pmic_dev *sec_pmic);
-int sec_irq_resume(struct sec_pmic_dev *sec_pmic);
 
 struct sec_platform_data {
 	struct sec_regulator_data	*regulators;

-- 
2.49.0.395.g12beb8f557-goog


