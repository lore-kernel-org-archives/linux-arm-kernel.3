Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 938D2D13588
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Oct 2024 09:36:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=b1grSvU5Tn2s3ry5oErdwTQ9/uQCVVjQWC+Dff+1YOQ=; b=0H+VLr12DFVWCmbvIr6C6LMNL5
	Peb9Iu03QpP8RHFNO71SUh925DG6tQkBs9N97Hu5cVgclU/8pm7exWA4zzVv428yQv1ZZAlV581/n
	QxIoEh56SJlREZumQV0pz0ACtOTQmxWV8QT6Ibytuj+XmZwxIPsdfsi0X0RVRuITHuVTRh3Q2TmS/
	/SLPqQwUgw9VuX1RPipayrygj3LQtGOAb3UEJvbz602oTL65gya3PR/A9c8WxU5VxkRwT/IJQFSDC
	gwNacYs3LHqFRGbZf7nMPhPsCxicOvjQLPiegkdytYD1iTEOYz1WDm50ukSeXSrkjcwLM1jx8cEUj
	vaGMzGbA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t5MAb-0000000AFkH-32Eo;
	Mon, 28 Oct 2024 09:36:17 +0000
Received: from mail-lf1-x12f.google.com ([2a00:1450:4864:20::12f])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t5Lxm-0000000ADgu-3mFE
	for linux-arm-kernel@lists.infradead.org;
	Mon, 28 Oct 2024 09:23:04 +0000
Received: by mail-lf1-x12f.google.com with SMTP id 2adb3069b0e04-539ebb5a20aso4019120e87.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 28 Oct 2024 02:23:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730107381; x=1730712181; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=b1grSvU5Tn2s3ry5oErdwTQ9/uQCVVjQWC+Dff+1YOQ=;
        b=MpSqRfd3LbtRk6gp1HLbFd+6ms+vBhiXK3WA+jGqR6JDwjK4hg9GmeBVBskxYEdnZu
         bRGX5Ckn6O/GAcfEVB55cRpxjsKq97Blbx9d+Jb0lERpp42+GJ9Ff75Xv0jYTg06hU/5
         nRQslFHO2ooYZ5vkJJ75uJBzGq+OFoz9mF/y7/qbgx7ign9njG0u5h/SXjscNjIX+ynH
         CHYjEPazJgxtdWFEizeV+b2ZmU061fqL8FO0tS7MU67efDG2Yi5NbDur0vOknZhrRDEj
         baza0iv0zKXkKDmGbhpPh4qRO1YvMCWmPe51BpT1kR+Aqtn9oGocnpu8g818qTYExK9r
         nFCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730107381; x=1730712181;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=b1grSvU5Tn2s3ry5oErdwTQ9/uQCVVjQWC+Dff+1YOQ=;
        b=OsfO9/MQWmZD3nLI/hImP199yk5YxwDqSrM6bQHkp1Zq4hl3/Saj6xDHcj4hSL2AG9
         seAmKtjaQDEc8N7AoWcss8XEjePpPC5ZW1Ju7UPYc7y2XheLaUs1YdkU8YIfSHfyUhkK
         M5BixbJVsYtUB/r+jgoUAHWsAO/0PbKZzCug4XN20EvFzGgr79wvPwgJ6YJVDjzAyiky
         zOlFR1Z188vH0KrJR0KzSH8vLFTIBQZNhJULWn1jz6+5hrfBp7JiWvRIPxoor/9BqviG
         K8cma873w2caBdLglTzqz40d6ouWsfhnjd6yftBcVOzi5jMt7p/DAPBH+lUPtIb1cofF
         XltA==
X-Forwarded-Encrypted: i=1; AJvYcCUuot+UkdZEtlkrR1s/nsYtUBW+oHj/86MCFzSZffBkIpgPpFSYA95LJ1Ez6y20Xe605951GE//1jVUgw7zz04r@lists.infradead.org
X-Gm-Message-State: AOJu0Yyk03lOdVyD3isWz7bwWmY8GxYkdfl/zkM9gB4z5caJq8aXDTJT
	WwvBfxxJl2u5gBHmu713YBLWo3ABu8lWMBYxiJMa46PIzVKLvJ3f
X-Google-Smtp-Source: AGHT+IEt083O6CT7AeEmqZollBJQYbaWxn/JpO0WvFxIhUiYyRXYkjBYaaUe1bqZgDhu1R3ZSUQKjQ==
X-Received: by 2002:a05:6512:124c:b0:539:8d2c:c01c with SMTP id 2adb3069b0e04-53b3491e0dfmr2664379e87.41.1730107381211;
        Mon, 28 Oct 2024 02:23:01 -0700 (PDT)
Received: from [192.168.1.105] ([178.136.36.129])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53b2e1af331sm1043785e87.152.2024.10.28.02.22.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Oct 2024 02:23:00 -0700 (PDT)
From: Markuss Broks <markuss.broks@gmail.com>
Date: Mon, 28 Oct 2024 11:22:35 +0200
Subject: [PATCH v4 07/10] soc: samsung: exynos-chipid: Add support for
 Exynos9810 SoC
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241028-exynos9810-v4-7-6191f9d0c0f1@gmail.com>
References: <20241028-exynos9810-v4-0-6191f9d0c0f1@gmail.com>
In-Reply-To: <20241028-exynos9810-v4-0-6191f9d0c0f1@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Lorenzo Pieralisi <lpieralisi@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Tomasz Figa <tomasz.figa@gmail.com>, Will Deacon <will@kernel.org>, 
 Mark Rutland <mark.rutland@arm.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzk@kernel.org>, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, linux-gpio@vger.kernel.org, 
 Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>, 
 Markuss Broks <markuss.broks@gmail.com>, 
 Maksym Holovach <nergzd@nergzd723.xyz>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1730107370; l=938;
 i=markuss.broks@gmail.com; s=20241024; h=from:subject:message-id;
 bh=UX/VlaIr9ETHnZFFn3Brzw/0L1791ZTGgYbdKg640mU=;
 b=f1vCIJ9anD7EW/S1jHqDde3L1h2YQMkMCv8esVK0ODs52bHlEJo+uZvBnxlE9r+4En0o2wM36
 HDV5y4csjghCKsEQGuTsT3hswbecYcvpcG1OGrMjTKXGGvfGgDeVZb7
X-Developer-Key: i=markuss.broks@gmail.com; a=ed25519;
 pk=p3Bh4oPpeCrTpffJvGch5WsWNikteWHJ+4LBICPbZg0=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241028_022302_953179_1310E7E9 
X-CRM114-Status: GOOD (  11.75  )
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

Exynos 9810 has the product ID of "0xE9810000". Add this ID to
the IDs together with the name of the SoC.

Co-developed-by: Maksym Holovach <nergzd@nergzd723.xyz>
Signed-off-by: Maksym Holovach <nergzd@nergzd723.xyz>
Signed-off-by: Markuss Broks <markuss.broks@gmail.com>
---
 drivers/soc/samsung/exynos-chipid.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/soc/samsung/exynos-chipid.c b/drivers/soc/samsung/exynos-chipid.c
index 94c7cc0d11e4c6f151336dc6e25495a31cbec02d..23cc20896b85a2da02f36703225a4f62e7538a62 100644
--- a/drivers/soc/samsung/exynos-chipid.c
+++ b/drivers/soc/samsung/exynos-chipid.c
@@ -59,6 +59,7 @@ static const struct exynos_soc_id {
 	{ "EXYNOS7885", 0xE7885000 },
 	{ "EXYNOS850", 0xE3830000 },
 	{ "EXYNOS8895", 0xE8895000 },
+	{ "EXYNOS9810", 0xE9810000 },
 	{ "EXYNOS990", 0xE9830000 },
 	{ "EXYNOSAUTOV9", 0xAAA80000 },
 	{ "EXYNOSAUTOV920", 0x0A920000 },

-- 
2.46.2


