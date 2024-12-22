Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54A9FE7718D
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 22 Dec 2024 14:36:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8qtqb2q9SZdIxrsGX5zFz/zmOaa7ahdn4J/z+KWdZJM=; b=0jvF/k/n4bLBjMNsCap0dC+RYz
	pVxtfF4WOmmwiEsblxrgOYFTCFlzOZNOW+30ae2HQZ83BVC0f9oMOCYcRxU/s7RTRmG7ujgJ3j+i8
	08RZf7+MSJSXMlZmUlVc2srlqASQrrmWj593X40zrtVVVy7MF/a2LoDq4gEHMoWHrSsBOGmd3Cnu3
	a9WUmAL59KDeMGwyzogyqrMDMeWBfzermCPI4oGT+vLDnv2ny9FF0jld945h+TsTvHZKWQM0EfEBB
	e/OB4Dd577L829mHvQ8nUF+GAK6G4la/FldWGUh9HRGnyzqjFEX4qKdNZ5fPNnqc++eVE73f/kw1m
	02pEeQZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tPN3d-00000008Oeb-27cu;
	Sun, 22 Dec 2024 14:35:50 +0000
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tPMuI-00000008NTf-3ADw
	for linux-arm-kernel@lists.infradead.org;
	Sun, 22 Dec 2024 14:26:12 +0000
Received: by mail-ej1-x62d.google.com with SMTP id a640c23a62f3a-aa6647a7556so72280366b.2
        for <linux-arm-kernel@lists.infradead.org>; Sun, 22 Dec 2024 06:26:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1734877569; x=1735482369; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8qtqb2q9SZdIxrsGX5zFz/zmOaa7ahdn4J/z+KWdZJM=;
        b=Oq9fyimubT4Cqo0xPbuh/3aR9rY9Ty+Qk9ye/ok+jE2oq9BmlE8glBLn4lZDFXvOfh
         W7muHa07ZBEwxj+TJfw4eOGrmAgYkPuoXAFjNpd2Le18QjjP2mVxQNnMddQp1gR06Qen
         k4GKP3qSv1fAm2VI1+9YU/N6JQ2F741C2D/l7gembZWJ5qm+7uaqx1JQrDoo8pd5ZEeK
         cckZ702tRr/uv6u7X2YqZbyclTAMeLijCT1gtv2gWGTJIEFCkyHtHKvHDcKQpazo2wVg
         2peQQ5pj8nQrJg6kMZ/sfbIa6/eO5+b3Y30ZQ5Fa4NDF7bz7Bcr2r3v4UeRzL25opFsK
         KAsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734877569; x=1735482369;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8qtqb2q9SZdIxrsGX5zFz/zmOaa7ahdn4J/z+KWdZJM=;
        b=RaAiFLR1NR8LI5bp7y65DxDnQap9t1lOyyM4vi/Rqi8d6h7B9EWnUjT2BCNt9+VSaP
         h25m4nOo3y8LSmGyhoUB8LPKqw/141rNj6Zh6/oUfNaBBbDOYB8y6q/uTk1GO69TqGqS
         OdUwldO7CHtpmCGqkvo9TYIuaRBywdcmOUU2DbdZDLa5lcX3sohzZIrE//x8Ttp+91+Q
         AtJ+cjbCVcAPEiK2VTjLnXzIuORbfbmOv9YkbeRXGp8mb0exLcd3YKYayZhhB25IGBG1
         hNHuhoZMBdaWYd0hqu2VGkOlXZXCvHbseIaaJZp1+QXOQmTcEQL+myRKRXLdQEsuRhNO
         /T+A==
X-Forwarded-Encrypted: i=1; AJvYcCWeAEARb6jKrNc6+Hwn4zcJXAoGQNDAL1eKbqXS0+Wx830xUX4Ppz89MzC1tlqo9K/S3I+U4azvOs/UGS9gJIbr@lists.infradead.org
X-Gm-Message-State: AOJu0YzbjPGNm4qR2OmQ5dwAFqKQ3K1wNYB9/fjDCplvz4FCq0D99pN9
	N1pDC2Is1OfUyAnocCEMvbWMbQ9xW3NhscIgL4DRzemFqD5DDYKShoek+QM/Zl8=
X-Gm-Gg: ASbGnctKzHu+kF/Fu3obk3d4DLgF2l2mJtWnkSJXiSvuio2Q6k4nzeUzU90z1mkcwSj
	0ROXQ9QycRL8PgYjMiFxER8W/7z4Vh0TKoHDoKa/z97ZJqVYOK4fEu8TfAwH/AlPzSvRbQ1jIuR
	tbm+rCqD2+vHQjaAFD8EreB6/SNxHRJTS7DSUf3adAHgHe1JYXHtiI87R7UOD+B5c/eFWG1ptHm
	zl1muFvTOxqTiViw6LkpZCZpIprf2G+/l4G8D7Zs48C/IouXGJT9jYJrLpN2rUnnaaBpw+3Go4g
	NJqSYd7glDhsQ4uS0KSLgzKgOnVeJPg=
X-Google-Smtp-Source: AGHT+IGJEflLR7LUL0jWhIG8if351byh4oOU18ryBTE4nHXQMghZCSJJMazHqwq4sLeRDspVGmm4qg==
X-Received: by 2002:a17:907:3faa:b0:aac:619:6411 with SMTP id a640c23a62f3a-aac3352c94amr296886666b.11.1734877569000;
        Sun, 22 Dec 2024 06:26:09 -0800 (PST)
Received: from [127.0.1.1] (78-11-220-99.static.ip.netia.com.pl. [78.11.220.99])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aac0e82f577sm392716066b.18.2024.12.22.06.26.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Dec 2024 06:26:08 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>, Rob Herring <robh@kernel.org>, 
 Sam Protsenko <semen.protsenko@linaro.org>
Cc: Conor Dooley <conor+dt@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20241211033027.12985-1-semen.protsenko@linaro.org>
References: <20241211033027.12985-1-semen.protsenko@linaro.org>
Subject: Re: [PATCH] arm64: dts: exynos: Specify reserved secure memory
 explicitly
Message-Id: <173487756773.3738.7711760267747537170.b4-ty@linaro.org>
Date: Sun, 22 Dec 2024 15:26:07 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241222_062610_804556_C0802E5E 
X-CRM114-Status: UNSURE (   9.08  )
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


On Tue, 10 Dec 2024 21:30:27 -0600, Sam Protsenko wrote:
> Instead of carving out the secure area in 'memory' node, let's describe
> it in 'reserved-memory'. That makes it easier to understand both RAM
> regions and particular secure world memory region. Originally the device
> tree was created in a way to make sure it was well aligned with the way
> LittleKernel bootloader modified it. But later it was found the
> LittleKernel works fine with properly described reserved regions, so
> it's possible now to define those in a cleaner way.
> 
> [...]

Applied, thanks!

[1/1] arm64: dts: exynos: Specify reserved secure memory explicitly
      https://git.kernel.org/krzk/linux/c/11fd6c9b047c30c72dcea3f79c0acb7deb69c822

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


