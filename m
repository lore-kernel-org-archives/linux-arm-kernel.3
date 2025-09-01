Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 907AECA0FF0
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  1 Sep 2025 17:01:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ICiwcLIU71Izuhu8fP8tVO8odVf8d1Nj7kJu4RHQNHg=; b=jleMN+DCmsZoVQbVI2SK1AXHjy
	L7uPUW0UCwo3lW9TB+7p4LdrdSr/G0Nb3x3RcAct6sVb8oWH1/+J0W1MnRE3ZeDFLtz7aRPsWCYGO
	BqTx35JstDJtSn5bSxUT9TTwPNekQw1Lq5BCgyQ8Dv36ElmilBPDgIDvmLjq4xnBSvYMOam1534u2
	6D5kUFfiPvug3Quy7USDYmlI61flaHz2Ipy30PqJJ8H35RTpJeGFzek2ZiRqEqrPJWvzlpNX+KILr
	19+KrQop/e933KOYURaOPrIiDpSCnSmjVCI3m+dIfSd3u0luFVW7rVWWUG/oNkOAkNlDJTacUs88d
	xRhSFwfQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ut7tr-0000000DNFO-3V2h;
	Mon, 01 Sep 2025 17:00:59 +0000
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ut4YV-0000000CgKG-0fbB
	for linux-arm-kernel@lists.infradead.org;
	Mon, 01 Sep 2025 13:26:44 +0000
Received: by mail-ej1-x636.google.com with SMTP id a640c23a62f3a-afcb731ca55so76609266b.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 01 Sep 2025 06:26:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1756733201; x=1757338001; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ICiwcLIU71Izuhu8fP8tVO8odVf8d1Nj7kJu4RHQNHg=;
        b=XR6/oNnSaIQmq20RXglr0Zm8128L8wRqTEyuN82jU+dHXe2XV3ta5MKKING8oXa7vO
         rw08DSY7wFSISWuuJqsjqdbSBizX6PrcMDh6CHRPMvN76K83032eaPvAQh15P9oY69Ii
         7Szvy5zJ6m+eAcMGO6ITtwX1BMV8sOss29K4yCYZwBL++5qByTQlqVXu1/30otGrYxA1
         bmqv4psBajDwnqK7G/nNYInMIeqcsp933sQl5poiCUY2NsnB+n3LxVAnTZHsy4Ii/Gb9
         6kL5z/iVtD2xe4LA7pcMyuqLN+lwPpKcuaOYiKlAvtC4S51OFPmBXrGzwAF5pY19YCMQ
         ZzYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756733201; x=1757338001;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ICiwcLIU71Izuhu8fP8tVO8odVf8d1Nj7kJu4RHQNHg=;
        b=YSNN2GcZwl07Lv4jOAbUaGQpPgoiw8L7X7JoZ0yEbJb2qQorCcUCK22uzSTSlzACTs
         v4bj8UJFLhpuC8lTASpW/d/MeY8Bxy2bXMex4idXSK9Z3+gTmrkca5QDu3GmJN6kks9U
         co8kC4aZTua6Pm1kcZDpEI5Llf+SqKR4BW8taoQbiOPrm6KfpN7r1FaqifnX3sqYgTux
         JDKFNpI0rQp32LX/O8pC7uQxJS3KVIUZfgbsj+JsjOdr9odDhFmo1rLl3EW1+6oDN4yS
         MlMu2ATU5L6bEVEGUJFmAt7t6K0zQmPoFRzhM6n86om/saLE8s8TzsinZLOgQutmVqzk
         cVJA==
X-Forwarded-Encrypted: i=1; AJvYcCUs5LbpQIqEwcqPvz+dGkUFsGVSMZkr5yUi9CuYrSo5p7JNoP8jnuclKllsrlzn+6pX1l3zg+T/XQIICbjdpXkw@lists.infradead.org
X-Gm-Message-State: AOJu0YzwklMBJboCWetXZR9J8vUEwwNRKr2xWLUwJAzk7uFrne+wNLJq
	E+ibNTtbL2f7N1aUGVR8pRXsIPamZMfNud/1qo01llI5tgk1KfTFhReXG79SIy4R+CM=
X-Gm-Gg: ASbGncupxYHNVdeSlGUpLYfP+FZaX2tK2KUW/v5cNH2vpFIrC8neQkaufzARirgpuWB
	ty6v2o16I1vt6tA1HBAfDB0I2uSB/jXVXb6O4lnQagSBFk0gc3cRg2GTD8baZMxYrz2ctu85CFS
	jlmPRij4vtwrR6sOnbBePI55grfaNhb7zbRxQZibLhxsnzN1b5DK2fNi+KZ5BCkSjCoix8mW6E3
	VxyXR+V8/xY5pu9gVKtcVwrsZKQWtlxRfVoHRWqU8A9ilxdFV1QDgxRYpiR6M2AdJrhaHcp5x1G
	DR4Dhy3BBRWlAsqygfZU6m8CkOdI7s4/WHt+4dfPecIcGEISFLZ7+4vqqb1Y5jh88fMj3eUDWpd
	wEEUGUeYy0mdwCBQIWAEd7l1xxQWFhfrZ69Fhvk8=
X-Google-Smtp-Source: AGHT+IHQTmAvbsKv0D4j4Hvyh4K0kyRVksjF4qrxn2f9tAR+H9KrYnWzvnDmgth3oDHi6jyc4O8txA==
X-Received: by 2002:a17:906:16da:b0:b04:1fc6:1347 with SMTP id a640c23a62f3a-b041fc67c80mr223542566b.0.1756733201076;
        Mon, 01 Sep 2025 06:26:41 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.123])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b04241b2e7esm305997566b.43.2025.09.01.06.26.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Sep 2025 06:26:39 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, Russell King <linux@armlinux.org.uk>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org
In-Reply-To: <20250830-s3c-cleanup-nand-v1-4-05b99ef990fe@linaro.org>
References: <20250830-s3c-cleanup-nand-v1-0-05b99ef990fe@linaro.org>
 <20250830-s3c-cleanup-nand-v1-4-05b99ef990fe@linaro.org>
Subject: Re: (subset) [PATCH 4/4] ARM: s3c6400_defconfig: Drop
 MTD_NAND_S3C2410
Message-Id: <175673319874.45844.111501190462962489.b4-ty@linaro.org>
Date: Mon, 01 Sep 2025 15:26:38 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250901_062643_217247_2D3AA71A 
X-CRM114-Status: UNSURE (   9.05  )
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


On Sat, 30 Aug 2025 19:01:12 +0200, Krzysztof Kozlowski wrote:
> MTD_NAND_S3C2410 driver was removed from the kernel, so cleanup
> defconfig as well.
> 
> 

Applied, thanks!

[4/4] ARM: s3c6400_defconfig: Drop MTD_NAND_S3C2410
      https://git.kernel.org/krzk/linux/c/ae6f637a456c1de75a582afa9cb6169813e89b83

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


