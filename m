Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9867CCA0FFF
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 30 Aug 2025 17:19:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZX6cnQtxQxZvee9YX/ODpRQkmgtz5DN0rLc02L7Qaak=; b=jkvXxSFBaroMeDe92jpIZyYnfr
	bWRF3BzXbPZPoJ8N2SDtMqGHwFB1JQ0UG6+dPwdJWm0l8FipkpBSLmADQrq/nXoaaTnML0nW3VtHQ
	gh331j/utMeKtOhB1/utuGo1PRlvfeag2T0Sinf50BLVYD7E9oAxsycEgDBxUFnWKY8qOu6WCHji6
	RbyIznpWjy9PPankx17UxafCFcLq5ElRgM6b6ei0GV5usi5ufvdaUshlJ48FtJXGirVBKBRdCqy71
	U6VrAWCRQhqgcSlgOnrpSyHLifhOIMg94/8V4Nxe7c304UGzPG+/oh3jEPjk6xpcGAEN+ZTOhDkde
	SlEC2+MQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1usPEz-00000008Dnh-13Pm;
	Sat, 30 Aug 2025 17:19:49 +0000
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1usOx9-00000008BcO-3Lne
	for linux-arm-kernel@lists.infradead.org;
	Sat, 30 Aug 2025 17:01:25 +0000
Received: by mail-ej1-x635.google.com with SMTP id a640c23a62f3a-aff17215facso9593666b.2
        for <linux-arm-kernel@lists.infradead.org>; Sat, 30 Aug 2025 10:01:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1756573282; x=1757178082; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZX6cnQtxQxZvee9YX/ODpRQkmgtz5DN0rLc02L7Qaak=;
        b=cn8i0XmTpnYy4Emf0i8D7anhabM/X6p7I4qVN/D0CzNwG/do+8o18z2nmkp4hi98fj
         6d5jfcyn16IAq4IR67lGZ0lmC0mP02Bu7JsOUjiacRSvqJKDGw4UGXvo4ZiEKM67te/5
         JFYxywwZcoK611VHHvliDt6DYiUMTBQIz8nt98aBZghoLvRCMlGfLhV7k/3HACcFp4+E
         qnoHpJPPHX2kz6fvKe7+HOtATWXz2Tp3Mg3UFziMrfaJdf7HOmNINLU+BQir+mHp2BVA
         0zYXjxRm1hFAl/jaG8u3erih5M4mSuIMxK7G8ecAyWu5RouC53EGlPTXInPH7aA58/U0
         j80A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756573282; x=1757178082;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZX6cnQtxQxZvee9YX/ODpRQkmgtz5DN0rLc02L7Qaak=;
        b=qHnL9k2+FrbvUJeDnJJg4boLS9fjC4hR+q3ZB71wmHwMa7UOEDKYIlU59kAoj4BsKI
         rivNw3kJacqjYhgtwwho6zTfShGCq6NPbITa7BN5Zm8frZatDQhexVqgrOYKgX8Txnh8
         AQUiRh+cM1tIHNzob3VKXfhuX5bvqB6574aT4TjsD8pZehnOdIarR7jl7S9A9cq9GgHp
         ZuoaNOAoNtQzXPOlzYh70lGCqjg32f2u4NCYHX9SG/U9mF69EbBgEt3BoGHgP56DjlhR
         IoyFdJFSaXmOnrg+BGi2cAOdDykWXjGtTRN+TSrZB1hEZSIfN73m5eEY6j1R7Gf6bQtD
         pXfw==
X-Forwarded-Encrypted: i=1; AJvYcCWG2Be3zO27fxyeH1sBriRleB/dQaTN0wK5AzKzZAUutxFeebtF4rxyGGeh6Pzg1iF0aBEPp0xHO12KuJ29xAlX@lists.infradead.org
X-Gm-Message-State: AOJu0YyL0rFTgmnWtKp9KTLkYSCbu5Rl8CQMGjUfmA5beSbrvJyN6qbj
	AMHQK0QpWMVH4sa5DVFRWEBExJnVNb7ndHIDX0UqfzmKYvKZkupU5w33Q4DIb9RxeG8=
X-Gm-Gg: ASbGncstwICQGd/roQaCGfyeV5WmnJ+vSA7cLNWYX7tVrInt2HgcYPx6T09285x9sJ9
	ArEYu4uVcMRG8nhsg2AGCCYZYYBzgvt7uXq6ValyuR8Mn97CH6uWnx2KIh1lGaTrkaNHyUj6j6x
	+u4TVW3/uiEZnDEoMz+I3AVO6W56/EzKUdSWuO7E4fRTrfmlVI2gS8dcagn5eFiQ3xQKs613+yi
	40xVJqS30WniE+OzFd90WZpSAbLGGl0rGOaJLbxjQjuSzQULgZN6Y+qwQK+V5Tx/B3Rrhgq9z3g
	SCjRibeU1bGuKOqvsc5kgY+XdOpAeySNuVKnERSamUciiadotcCB9V6JtDsBz9YFmJfdYs7A9X4
	ZcM7FqhMpHycfFUgaZGI3fah96yinlN3yQXS2VRY=
X-Google-Smtp-Source: AGHT+IG6v7udHvpdgU+cS2oIvFGVg1zj3T8UwQ+2al+IoXWKlYP8p1wC/7NRk4XZOd4DR47tWUgP7w==
X-Received: by 2002:a17:907:1c9f:b0:afe:d028:ebf5 with SMTP id a640c23a62f3a-aff0f0207fbmr225223566b.5.1756573282447;
        Sat, 30 Aug 2025 10:01:22 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.123])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aff12a6b404sm309038766b.88.2025.08.30.10.01.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 30 Aug 2025 10:01:21 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Sat, 30 Aug 2025 19:01:12 +0200
Subject: [PATCH 4/4] ARM: s3c6400_defconfig: Drop MTD_NAND_S3C2410
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250830-s3c-cleanup-nand-v1-4-05b99ef990fe@linaro.org>
References: <20250830-s3c-cleanup-nand-v1-0-05b99ef990fe@linaro.org>
In-Reply-To: <20250830-s3c-cleanup-nand-v1-0-05b99ef990fe@linaro.org>
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, Russell King <linux@armlinux.org.uk>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=775;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=euoiA9H0IBKKhfmhLLup7i4X9ldC4By6je6Eq7Dk2mU=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBosy5Z0MFsP7uvApyA5lBYdFGTBsKp1EP93sAPl
 S4mTXnlm7mJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaLMuWQAKCRDBN2bmhouD
 1yaGD/9ps5kKEsFoE7cwJV5YbXWQRh6c12gbpekdIil86expD66B4EqE9aJiprN1sJkisVMeRa9
 KzRKfWDrkotxbxmxcF1S8RlACyBAHc9O1eBaYD4p9ZJSmDXGManBHmMuAXnrCvajSUcQxDoZXkz
 lA8BX31lmw7dl/WBYqnDaUjox3pRJJLOIH9Bpsi+O2Zh/LKbL3LjCbmDNvQ825c2jSHfcKeZcZO
 lVu+NnN7j87OY3gdsky0Fy7iY5gGnvyem8yBOYVBjlk4aUQV4el8npkzE95mcUbLGWdxuOZUOO6
 OQ8y9ng5eMnxd4wxWE7xehibqDn1RODbA2ku2wCuQkcFQgubF5QgH8rk8KTVWrTM67xfwQ+9lNp
 NPlWwUL8feF6EgFXQF/PlfSc+L3Ajmi+5SuyQAu0pN25MoLTAvguRBaz0HSWBZ/ccH+FaTCpnqT
 2qgqIMd49hgAiNnCbVQq6Q7JU1r0CpKbw8XHdOZYGGMJj+FGR7JLoOeJAbhUlSymvkzcoPNI/Rn
 5eGcJbkCph5qNXCMqMCKMc+twgH0f0KDwQ3z/C9fGSrusirQ23ULNb2MHGgts4ZE5aeycJm7nGh
 rZJ4sSZwAnbR/aw5brRpow4Jk3rucpmHcBrFYvBaAMgnClM9qhC/lRVoyrDipkQCbidFAmRh3P2
 AuhCtHO2e/1GaLQ==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250830_100123_844797_10D6CA3E 
X-CRM114-Status: GOOD (  11.39  )
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

MTD_NAND_S3C2410 driver was removed from the kernel, so cleanup
defconfig as well.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

I will take it via Samsung SoC.
---
 arch/arm/configs/s3c6400_defconfig | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/arm/configs/s3c6400_defconfig b/arch/arm/configs/s3c6400_defconfig
index a37e6ac408251903212a7e6cdd5972c10bc10b79..967b1cb22136cb60ff8eccf15997c669ac2ec743 100644
--- a/arch/arm/configs/s3c6400_defconfig
+++ b/arch/arm/configs/s3c6400_defconfig
@@ -11,7 +11,6 @@ CONFIG_MODULE_UNLOAD=y
 # CONFIG_BLK_DEV_BSG is not set
 CONFIG_MTD=y
 CONFIG_MTD_RAW_NAND=y
-CONFIG_MTD_NAND_S3C2410=y
 CONFIG_BLK_DEV_LOOP=y
 CONFIG_BLK_DEV_RAM=y
 CONFIG_EEPROM_AT24=y

-- 
2.48.1


