Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55738C3600C
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  3 Apr 2025 09:29:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EOEB7IVKZaW1PZ6sIgI8umGsLZ0fzThiODmAgEs2dvM=; b=AMfRwOYzUmMI1P598Y/Waqn/FP
	WogU9vhvUMSD8Vdz1KeQFSJdiGEEmzDoR9UQDF5TT4n8qjHQc19KMexqUTE1AJc1LrtjTFKTj0pfK
	v59fzsKff3zn5gbhTF4ekFS8sOnZKxpzxFnymIZ5+ztu1F3lGfnueo6W5VZIaooKJKEKKUG/8jcKT
	jnlDgDvWdx8h/hAgcGpYv2BOeopbChMAh6n51NSTXN6ll4FRqqzr3CNFZ0BQErmT6UD2JIRI1z6rX
	uxnODo0ndf69rL8Samn8vOFR0kuzC+JI+eCi4NpIFBOghG0VAITMbEHhHu2VtWYzyPHII49iWgGqu
	QRXZSpEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0Gt7-00000008PPJ-2Y9j;
	Thu, 03 Apr 2025 09:29:29 +0000
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0GPo-00000008JlV-0GML
	for linux-arm-kernel@lists.infradead.org;
	Thu, 03 Apr 2025 08:59:13 +0000
Received: by mail-ed1-x532.google.com with SMTP id 4fb4d7f45d1cf-5efe8d9ebdfso1352052a12.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 03 Apr 2025 01:59:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743670750; x=1744275550; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EOEB7IVKZaW1PZ6sIgI8umGsLZ0fzThiODmAgEs2dvM=;
        b=g8xn4Yl6vMwZUAA8VYkXpiBKD96N3kbqzWjyt2wdWE0CvYjDMXvlcn2uAFGV0CTNoW
         cd5sBZro8RaHkcnv6bkKadbG17X6DXnv0QqcpembpgWLyGeaV4h1VHb6pJLuik41RBoT
         uWQG5ewqlywjNTiuXVesjftcLkkxFhHtQlBtQeJQVOjDrL5vSgobrJm/t8NeBAyivuQN
         hU73FZEOI3enToBg/7B3Oe4hhncoABRN3PhZv/ES9ggJ3BiZS8WmxAzRsPXyahbV4NLr
         bc5lku7hG0pB4A0ocEtL44A+yI68gA7eYIuTZP5SZAe5skljxx5ZcKbCHIhbFcJdHSZy
         Tx1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743670750; x=1744275550;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EOEB7IVKZaW1PZ6sIgI8umGsLZ0fzThiODmAgEs2dvM=;
        b=qC2XgHE7a5UDIt0aflhMddd0KIuTVyp6qUuwN6HoDTQZDCOsThkc01lZz+xaqWpg7O
         k/fILVls/geCY7hl2QVENCrKIlyt/vBzwIb++OXJqCGV/yxpoKf8kPNkv3ASL5n/3RPx
         9lbfaZ16VAra7rFVmC8bDcwIBXSwrAeCZU0xuBHeTMxHuUJkxipkeVbxfkF3Y2e+wq2d
         wTXZ8xPjYYp1I0lsVoMtxXfl3BC11P+zcAII2LR7KlJfCOoqcF/sh8wPZtx7NdL2P8t4
         0uYlDGEBbVzwOSrhEVLG7t/7cJ1BizWdilvMilaZaVLjmXrrl/9w19H1J+frQcnpatoe
         eVGA==
X-Forwarded-Encrypted: i=1; AJvYcCXrU74O4u0IKMYykRhLCxiOjYbG0hRb8J7V+5bJ7/LJms13ygPrgeudhSpWGZMtfQJNjqbW59P6H5RAuU0wkryJ@lists.infradead.org
X-Gm-Message-State: AOJu0YzxWwlnwnqMl3h5fMltzKvZIHLhG91v7+Oe8gZHE5z7X0/F9CMN
	Iq8fXSBJgUS21fod+qUzo/+JOsnE/j2G+KlslJgRb4mhFAPLo7wqQPCP950tlKI=
X-Gm-Gg: ASbGncseZ6rPf9ocUzzy9wUPXe/FodhL4u7sINCezwAyOT6W00jmGEHqTzsPBj+eRGS
	kguU3uFHR8bp4mATYqMQdKB2iYUYcZjed/1wMGHQL5zArdN+j4uMzo8ShKwnPSAojmQ18rFoMdW
	T+WgKdk+pRfMDnzbBTOB8hYPdMhnsOA9r+grMWzToeMhv9NtaxZuZoLQCXEHwGqpPqTMmKAY9xc
	kYxzt6D3itVredO5y7/f74VEsqiT2FGuxA8RwquNj6OH1NOLLcoXvrPZyuSuQyjtTDgKbIOwEFb
	qO0TTOrpK45GXUwxh5bMqiv8bcLm9TDDbfCorIznzPNx9hYsC7AorMELG8eYFC+5su4GQgWj2t/
	Uki/5f6LIKTHNVzi1lts6f5vgcioV
X-Google-Smtp-Source: AGHT+IF/mj/FrJ8Kxms7tCENqFVdFFdcidKVA2nEXR0Y75YsHneWseB8Fi5sl71j96aNLNBmEO4yJQ==
X-Received: by 2002:a05:6402:2682:b0:5e7:7262:2b75 with SMTP id 4fb4d7f45d1cf-5f087184cddmr1440611a12.11.1743670750284;
        Thu, 03 Apr 2025 01:59:10 -0700 (PDT)
Received: from puffmais.c.googlers.com (8.239.204.35.bc.googleusercontent.com. [35.204.239.8])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5f0880a535fsm637614a12.80.2025.04.03.01.59.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Apr 2025 01:59:09 -0700 (PDT)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Thu, 03 Apr 2025 09:59:08 +0100
Subject: [PATCH v3 16/32] mfd: sec: don't ignore errors from sec_irq_init()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250403-s2mpg10-v3-16-b542b3505e68@linaro.org>
References: <20250403-s2mpg10-v3-0-b542b3505e68@linaro.org>
In-Reply-To: <20250403-s2mpg10-v3-0-b542b3505e68@linaro.org>
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
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250403_015912_100501_A2F6136B 
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

sec_irq_init() can fail, we shouldn't continue and ignore the error in
that case, but actually error out.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
 drivers/mfd/sec-common.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/mfd/sec-common.c b/drivers/mfd/sec-common.c
index f4c606c5ee5a809a106b13e947464f35a926b199..bb0eb3c2d9a260ddf2fb110cc255f08a0d25230d 100644
--- a/drivers/mfd/sec-common.c
+++ b/drivers/mfd/sec-common.c
@@ -183,7 +183,9 @@ int sec_pmic_probe(struct device *dev, unsigned long device_type,
 
 	sec_pmic->pdata = pdata;
 
-	sec_irq_init(sec_pmic);
+	ret = sec_irq_init(sec_pmic);
+	if (ret)
+		return ret;
 
 	pm_runtime_set_active(sec_pmic->dev);
 

-- 
2.49.0.472.ge94155a9ec-goog


