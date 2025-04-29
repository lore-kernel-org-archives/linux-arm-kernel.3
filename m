Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F07A5C369DC
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Apr 2025 08:51:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=bQ3Du2msqS99gBPXd5VzJGX2ImDSOyuqnj7RIZBT6Dg=; b=EHAd/H75TgF8Mx
	gyl4q+qiIUlO7Jvud0a4deUg+gIT7a/1CxqIEEiSjrFNQnuAzM6lG2RtRstIp8bYaLA27VTaSYZOg
	KX2CGkitTFhBKBBhcDWeKAjFKkZM2bn/fqtF2p1Eppzf+WKJrZjyx515DtSRBD64pZfgd8y9sNTnQ
	YB7p4qO/xGF5P9LBsU0Uv+tmOUqleANLV8MgvQJ6YTChHq3qXXwHehX0C6oGow4Yo0FnQsK4ey4GD
	HCD2RUwKzQbVdAxR8RrrOp21tKYg4soTvPKgniMGV43NiGGvFqPtFOUdar2WWgUjRAtPEL7XN3QLu
	AT06FrYwE3fzGMjDHziw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9ggb-000000090LO-2KCz;
	Tue, 29 Apr 2025 08:51:29 +0000
Received: from mail-ej1-x632.google.com ([2a00:1450:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9gee-00000008zso-3r5N
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Apr 2025 08:49:30 +0000
Received: by mail-ej1-x632.google.com with SMTP id a640c23a62f3a-ac2c663a3daso1126931866b.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 29 Apr 2025 01:49:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745916567; x=1746521367; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=bQ3Du2msqS99gBPXd5VzJGX2ImDSOyuqnj7RIZBT6Dg=;
        b=plWYCETXMqkODxDsOhbak9ZaXoCKEy9YwgZaG/KTojZxbo4ErP/8pD3z/mUACIQPbS
         pHy/Bx6gA+FSHdyZ7ny6o2rw16CihOWbLMmhLHhUFC0xoFk6BOrNeAtk81cXYNveLk0z
         q1EP8g/6Q4Wv4CRLJ/EmmXIMs6R/RnyLWbkJEXrJHjCAptbz2a4V0MngLkYTk2ou7TQD
         ihOVcievMe84JNOh4EZXxPTU+koNhpokyP0zLeXjvL/4L6HVRXWNZHLjVs5XhVEmNzPT
         9GRBlh/9LdgQfNTe2Y/cQBK1o2nqgVyT35mUXrYd/CTc9NuNajRIpsdpGtSb4l+ZRFLU
         I7AA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745916567; x=1746521367;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bQ3Du2msqS99gBPXd5VzJGX2ImDSOyuqnj7RIZBT6Dg=;
        b=Ao1LtnKBxfvNepRWm7Ao+b3dSePtLwksoBjiBOHBxC5l1RCtf01HMerg/dvyfwMyyg
         F3aSx7wu5MG2Fv61YIHdypTsCPRhrudamf3ceYNdwLbpRuEKPqNxPszdVOoytWHr4Eaw
         sL19aSj3Q+lXQBhf2OGUjQEb/Ct2IR3L1euNoIEPqGBeNMriRtUkcmqUrhNAHgunoUS2
         ORq8VV/oi6rMANeVZwi3gCgQwJbF7H1PIdfC3iSYo3/qTmCrXOypZZgbBserTeAM/wV3
         3zcWq33+5Li04xZiSFKFX0n2CQaoURe9qeyWziv/VsKskkvdjCwhnwPIvyOyjTHKH8iL
         sGqw==
X-Forwarded-Encrypted: i=1; AJvYcCXhiU9aTpxhDe0iaXKCpUekFmGTqI6cLL/l9+sUj9XU8jAeGhK9fOfGcIZRxrbkXXXfPOitl26/YqGMPT/gLv3t@lists.infradead.org
X-Gm-Message-State: AOJu0YxO7z4iJeSGdtWRi13AMjlBwaQAp2OwXdrhPrHyGDandKDB5PgR
	ZxZx0iYCRVf57EEbMEZqy9E/yfPrUqzm548+egtFjdU/SqIuRgvbjdLki3ZCCR8=
X-Gm-Gg: ASbGncsKaENIUgPBi51HjV/4eKly3gxVijJBqZqSSU7wFDK7HWUW1hkcpcGAWN/crHR
	/8QZd12Ag9PQdd6/6KWNXj8g1G2l+1MfmdELSIquu9GHXhs3PtynqBXteHxtT0YDumLMUeuFnh1
	/HR29zC802GXZ6pDpBca5nysV2m+NW7RcRHPJw0ssLq0X7B7B/027Q9pCS4V4eEJ9LLwgd+g18C
	NqgyYoLDBkEKfx/lQfDHbHdf3tOt2AQCrO/NyE6FhuuaENV6/WfXsn5qyyJMCDjl1sZC6Xb111s
	tFloC4tRqXSw2aoVlZbsx5rgWEvIq7T4vp1fUkUgBPACo5IFAqvAARG+6uMYl8sr+/HmecBUdf5
	6VRzSzcGC3R8WQuNIas31/T/i
X-Google-Smtp-Source: AGHT+IGUOSkbNQi0TijAb91lwptPj1wuZauO4Jmzd3aIvKCh68E4hLv9NlgmiXg+nD07/oJegV0vGg==
X-Received: by 2002:a17:906:6a23:b0:ac6:bca0:eb70 with SMTP id a640c23a62f3a-ace84b55d83mr1224307466b.56.1745916567365;
        Tue, 29 Apr 2025 01:49:27 -0700 (PDT)
Received: from puffmais.c.googlers.com (8.239.204.35.bc.googleusercontent.com. [35.204.239.8])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5f7ec0e6331sm3546619a12.78.2025.04.29.01.49.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Apr 2025 01:49:26 -0700 (PDT)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Subject: [PATCH 0/2] phy: exynos5-usbdrd: FIELD_PREP fixes
Date: Tue, 29 Apr 2025 09:49:23 +0100
Message-Id: <20250429-exynos5-phy-field-prep-v1-0-39eb279a3e0e@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAJSSEGgC/x2MWwqAIBAArxL73UL5wOgq0YflmgthohBFdPekz
 xmYeaBQZiowNg9kOrnwESv0bQNrsHEjZFcZRCd0p8SAdN3xKBpTuNEz7Q5TpoT9Iska6ZQxEmp
 cpefrH0/z+37CgqzVaAAAAA==
X-Change-ID: 20250428-exynos5-phy-field-prep-1b3ea73d4773
To: Vinod Koul <vkoul@kernel.org>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, 
 Krzysztof Kozlowski <krzk@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, 
 Kaustabh Chakraborty <kauschluss@disroot.org>, 
 Sam Protsenko <semen.protsenko@linaro.org>
Cc: Peter Griffin <peter.griffin@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Will McVicker <willmcvicker@google.com>, kernel-team@android.com, 
 linux-phy@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250429_014928_964050_C44E78EE 
X-CRM114-Status: UNSURE (   6.23  )
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

These patches fix some recently introduced usage issues of
FIELD_PREP().

Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
André Draszik (2):
      phy: exynos5-usbdrd: fix setting LINKSYSTEM_FLADJ on exynos7870
      phy: exynos5-usbdrd: s/FIELD_PREP_CONST/FIELD_PREP where appropriate

 drivers/phy/samsung/phy-exynos5-usbdrd.c | 63 +++++++++++++++-----------------
 1 file changed, 29 insertions(+), 34 deletions(-)
---
base-commit: 33035b665157558254b3c21c3f049fd728e72368
change-id: 20250428-exynos5-phy-field-prep-1b3ea73d4773

Best regards,
-- 
André Draszik <andre.draszik@linaro.org>


