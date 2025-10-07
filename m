Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35C01CCA472
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Oct 2025 11:18:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vfRZW1u7QrD8wKs/E/qokjfPak76+Jqb1NI8oZKYmR8=; b=De6Awv36u4Bq6UoMbghYXQauSF
	qwHxB7r2QMd0+FTQOD9fGoxO4861kVroyqqgZifD07tqvKeRvotHKCPQH1Q7155x6+ajmgm0+GSZm
	HrORmi/NT70eTBS89wB4sQN4p6sEUOTOUggCSpchPJTk6hOPXQZjh7KGZl3RHyaer46wX0jFMjAm8
	jIqOMTAQYob8CKnuOpBRhD4eHu98jQusbB5LshPmElQbGnYSeNhgS7oiCdJgRhpVEtR9n8BiSDjoe
	3yeudoKShcLXwg7P4ioRrGiXNi1Y+JYDJpooTRSCZ36wBk3I5RJpLN4St3rJ9tJNkcrO0iBx02kyJ
	Lum/ziIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v65hu-00000001rex-0rn6;
	Tue, 07 Oct 2025 11:18:14 +0000
Received: from mail-pf1-x434.google.com ([2607:f8b0:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v65hs-00000001rcq-2BqB
	for linux-arm-kernel@lists.infradead.org;
	Tue, 07 Oct 2025 11:18:13 +0000
Received: by mail-pf1-x434.google.com with SMTP id d2e1a72fcca58-781251eec51so4601359b3a.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 07 Oct 2025 04:18:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759835892; x=1760440692; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vfRZW1u7QrD8wKs/E/qokjfPak76+Jqb1NI8oZKYmR8=;
        b=bwtCnON2Szu2sUlo1OIQKxbCeACjkzlpMdK3PBh4QJ9QKRn4g7C6rDoQKGki6Zx6lq
         W2eTVeQZtOdgmHUoUuYXRSET8YQoA1n/TisN/8T6uWrpyW2ANYEnUlxztHu2o2CpRwlJ
         EpuF0BjeW+sz17yHR91gE4nFUJzVfCu4UZxgpOBfDqB07D0IKO504g7R3mGMPOxhw/0I
         sFVDjb0hrA+WcdubK9xXVj4mpefWqtkXM0xSBS4dx81cRsoOEr72+weWOu0oPR5o1Fiq
         da/rTMGirv87BhR9/BOr0wyN1I9eLSlIebaREfpMKUAF6NcItIYPXgGl9NyLaA4Fd1Wc
         PaSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759835892; x=1760440692;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vfRZW1u7QrD8wKs/E/qokjfPak76+Jqb1NI8oZKYmR8=;
        b=JIN9/rRky7HW/8GwARYyVAgdA6TL5asBUkVNrnh7DXjPlJyxTpyyMQVp95LL7mIhxM
         hpFH+JQ80Uta2GbRQG2Zb0IUWNAcm1i7K2krLnoXGRAa0bg7V82vou0GenAU8vIOpzGp
         ulAo+M4kz+nX3MDDyiIsOatWoBJ0PNxu0BM/1/Kl0CxWMEx+5ZLX3p63CCkvKS3OfME4
         8W90lZGVx95ymR3sqoyjR7HtRuuyNSE9H6vVtCxx0zDQ7kjujfc+7+d9j50qkeuDvgNx
         5njCqBUhurd09rQhUxM4ZleAXCy5ax0eKwJFfRuo/FHjggf9YUAmkdJIEkrZN+lrej8s
         gsCg==
X-Forwarded-Encrypted: i=1; AJvYcCVYAE3+UXp7EzhrVoOWACCgKV6h9HipFM6FVoWnpcr8iCf9KIoBp0o++ui4rRiVqJuh2dR8NSrWSqR37lKcAI+C@lists.infradead.org
X-Gm-Message-State: AOJu0YyChOjVkVhKC5OXTuJW5LF5gBAQh9oZmUyR3UQe0xIc9OCiTlSE
	ZsF4cs7kWsobtpgmXyumDRC40bx+RC/zAVVn9M2piif4FuKdHQ5ZiM3c
X-Gm-Gg: ASbGncu3Vz+nEAm8A7Ke3bTj/1YI2D9Lxq2BaeaEM6LK+0qg5ExQE4d7js8CRDEzT54
	dx8KJpcjwv3PAUSgBrwkrltljqAOhxVZ8+xKT2xlEPl2olO5NhTlOBFQty05l/motu6s+dIfEsX
	OcvejIsKhIPHGk9uCAfnTXAcarWSRGj2EHhFmOttVlXh0kVBpCyiYeYB5aQ165d/hQ42/se/0vg
	d3sfMtolLVECOInUgi3k/XP/YwNiiQ4jbj7a2t0OlfTfMxmco3axEqOFRmJTSZPELCkHNQAPKEb
	OrDBV41HHzbqOoLJkRuvifMFQR/bG8C9uYyGSmlopcDxYpOIMnWTxb8eskGQ4tEToAqki4coLOK
	W48BNP/CsRdlVOMJS3yH1J0cG3bxuzooMdehm5MvxnBvIx35FmUEY9+RxX/ylz2cbV7eX01KMyz
	HV2gjB4QwvL5E1HUdgjCbg79WJHAKnt7K7b3qf2UeCVw==
X-Google-Smtp-Source: AGHT+IGtobxlQxOmzElmeLrz6XbtLmYqUVeHEzRkuSFLIl/0CLj9uRwuwV2m/uCsqAKd9lcGvF8YVA==
X-Received: by 2002:a17:902:ef0c:b0:28e:cc3a:371b with SMTP id d9443c01a7336-28ecc3a3963mr25458815ad.57.1759835891715;
        Tue, 07 Oct 2025 04:18:11 -0700 (PDT)
Received: from [192.168.2.3] (2403-580a-80ed-0-4835-5a07-49e7-f115.ip6.aussiebb.net. [2403:580a:80ed:0:4835:5a07:49e7:f115])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-28e8d1d31bdsm162509045ad.94.2025.10.07.04.18.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Oct 2025 04:18:11 -0700 (PDT)
From: James Calligeros <jcalligeros99@gmail.com>
Date: Tue, 07 Oct 2025 21:16:48 +1000
Subject: [PATCH v3 07/13] mfd: macsmc: Wire up Apple SMC hwmon subdevice
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251007-macsmc-subdevs-v3-7-d7d3bfd7ae02@gmail.com>
References: <20251007-macsmc-subdevs-v3-0-d7d3bfd7ae02@gmail.com>
In-Reply-To: <20251007-macsmc-subdevs-v3-0-d7d3bfd7ae02@gmail.com>
To: Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>, 
 Alyssa Rosenzweig <alyssa@rosenzweig.io>, Neal Gompa <neal@gompa.dev>, 
 Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Jean Delvare <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>, 
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
 Jonathan Corbet <corbet@lwn.net>, 
 James Calligeros <jcalligeros99@gmail.com>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-rtc@vger.kernel.org, linux-hwmon@vger.kernel.org, 
 linux-input@vger.kernel.org, linux-doc@vger.kernel.org
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=744;
 i=jcalligeros99@gmail.com; h=from:subject:message-id;
 bh=EBXsHgi+TPtnux5Mjfvq3s8Tobe6+wN+A1W9K6WofCg=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDBlPvm1dVi8Ud3Oy5Jr9b70ezTox1bZcTX7RxhNtd28es
 6nxv3nxUUcpC4MYF4OsmCLLhiYhj9lGbDf7RSr3wsxhZQIZwsDFKQATWanJyLC3I+z5shiFivn/
 fhV4mitU2Nmznvq/6W5DGuupxz6KdRsZGX6JH93744nU5dT2JfGTeufsYWn+etDq6ZXeTB6t3T8
 s7TkA
X-Developer-Key: i=jcalligeros99@gmail.com; a=openpgp;
 fpr=B08212489B3206D98F1479BDD43632D151F77960
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251007_041812_584988_3DE6C23D 
X-CRM114-Status: GOOD (  11.05  )
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

Add the SMC hwmon functionality to the mfd device

Reviewed-by: Neal Gompa <neal@gompa.dev>
Signed-off-by: James Calligeros <jcalligeros99@gmail.com>
---
 drivers/mfd/macsmc.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/mfd/macsmc.c b/drivers/mfd/macsmc.c
index 500395bb48da..51dd667d3b5f 100644
--- a/drivers/mfd/macsmc.c
+++ b/drivers/mfd/macsmc.c
@@ -46,6 +46,7 @@
 
 static const struct mfd_cell apple_smc_devs[] = {
 	MFD_CELL_OF("macsmc-gpio", NULL, NULL, 0, 0, "apple,smc-gpio"),
+	MFD_CELL_OF("macsmc-hwmon", NULL, NULL, 0, 0, "apple,smc-hwmon"),
 	MFD_CELL_OF("macsmc-reboot", NULL, NULL, 0, 0, "apple,smc-reboot"),
 	MFD_CELL_OF("macsmc-rtc", NULL, NULL, 0, 0, "apple,smc-rtc"),
 };

-- 
2.51.0


