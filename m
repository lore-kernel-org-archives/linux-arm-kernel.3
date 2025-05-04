Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE4BEC369DC
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  4 May 2025 17:28:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nftdTmO05SB8jR5Xb7BUqAjqS2OUIEJt/PoKCc26nJ8=; b=gaJlIGGgMw7z3kZ9wgf6XZ6ADW
	UQRW87dWFRlumYVkKRoRo3u5aOa2uPZGTICgXlOeycGnOa21nXfkcXMSWNw29YdrUQYAzy10OKd/Z
	/qx0/VCfzQP6wqlItxj7q/DS6SoIGBJQDarqWZqLBpCrcV8UYANkHvH0HPMDR3nNFPtxViF2FDCD5
	t1JJf9cnFXgrYdagn2aTBAmvEa7LvPdAyPEetcoYZdaqwgxSroyU9qY8A4LMQla3+32vkSF2M2IWh
	ULWmA6G0qdmkErz4DKPBGv9gI9X6ktHU7mg7OLbfdNtadLIITUfq1434/byh+klVX02NeIf67kpxQ
	DAxpvOGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uBd86-00000005j8j-0lUo;
	Sun, 04 May 2025 17:27:54 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uBd5o-00000005igG-2FjT
	for linux-arm-kernel@lists.infradead.org;
	Sun, 04 May 2025 17:25:36 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-43cee550af2so4689825e9.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 04 May 2025 10:25:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746379530; x=1746984330; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nftdTmO05SB8jR5Xb7BUqAjqS2OUIEJt/PoKCc26nJ8=;
        b=w8DkfFdAGsQ0rbXnwsnN6XM49ewlT54YCgY7KUWVd0JFnSgAXiY5ssebZxEWKfkEJ5
         gsQfM9WzGJmef5nOTF1E28UhkwW4LMqUaUcOCXcLjhEHeS1NRO3Zge6H1WfQLNoxOUFP
         GmoUrMAd9pGvj+Gg67DpbOkz0I8tNywZc4/su/OcwK8tvzBdL2d5w3M7GV2euUF+QX/+
         tMdcfwc9cbSULlncLR8eksFPZgeA7rbdg+Cs4m1A4PB+GJVnIS9VhWckj+MzpfPX9XTT
         IU9fztm7mnoqOXL88zgpK7f+r7y2nYwGWjyFNxrU0lYXbeWYEYqsZITpPJ/SEOz7BTKA
         Vf2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746379530; x=1746984330;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nftdTmO05SB8jR5Xb7BUqAjqS2OUIEJt/PoKCc26nJ8=;
        b=GGkhKx+HVvPKTVne1le/kYwv7NVz4IbmstgWSQ2mqxU8HU0bpW9ByQxUdBf3jzrmiL
         my5SomgTNTfWk9xLR+I2jG//vIeaUYfArTsEB6hZqjIxXZT+tCt9CKfZUzX2MjmZIhRG
         +UaLZ9IsV8Qi5fqmWvd6SjKIILPpJK2EfnxOZR71POyNi28LWuuqYO3CFnKg94K+EyfC
         No8YgQlcJHIfpm+PTxH8nLZafsoSNuLF+TvYKmMjOBIE6sM37geXUCxo5xUKTx7pK0Sl
         44Th1IRMq+mwc3R2V37w0P/BwCYSOMducIvJAegyl80nYTo93MN9ibbfyVWADFSUoYWX
         dULg==
X-Forwarded-Encrypted: i=1; AJvYcCWTaAGC//2g91XywvaPGVPAVP3NTWjuiN7+VmIx8gBnN3AOf7NStemOH/uDQhYgGknFvN2xY1978KKJtvHK8CMk@lists.infradead.org
X-Gm-Message-State: AOJu0YxAaHQbinPGTkH/mqcUfMHd2lgjXtkiPhXzApQQIIJCFFhEQg2x
	dAfPSQP4ETyQPFyK+pLLqOxHnevFfHxl5c/vWUjYnnSzafB3TwjW9IdIwEittuI=
X-Gm-Gg: ASbGncuLkFs3oSrV/tJo5+kp7+Z6ydp7G99CuepWELi8/AOyKFK0Q8Lrq/93gc3F0n5
	J3rVp2RmYDfv4LE2u5e0wdLiovHhZqjE+zRJUjt9qFwN1axrmgatuG94G/wHvoDnOlA+kXZjIhm
	a2C4sNsHWxRFQAsfxRX7M67ko1K+m95egBzmcOaiwbJKZTiUAuFxrRjvkrTDdFQhJEWTF4zEFcu
	0xorItFxfsYoCEbTsRTRVYpmwGCj6THY5Xsb7WWO+iBag9BKKJZc3mOPFRxSXrEXXuZfJDojYRA
	nml4COFCfnykuh4ZCGbM1hg3WVsmjeq6eSVzYb7XqAmddmGv1faFElIY3u8=
X-Google-Smtp-Source: AGHT+IHYxvC6/SbBjRB3SVOL7PO5uHXZWOYurYW2a5R+02/GlhMX29rSr+LzjDeYnzALWWnO129Amw==
X-Received: by 2002:a05:6000:1789:b0:3a0:9538:8579 with SMTP id ffacd0b85a97d-3a099ad5a67mr2224721f8f.2.1746379530154;
        Sun, 04 May 2025 10:25:30 -0700 (PDT)
Received: from [192.168.1.28] ([178.197.207.88])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a099b0fe9dsm7896332f8f.71.2025.05.04.10.25.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 May 2025 10:25:29 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, 
 Alexey Charkov <alchark@gmail.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org
In-Reply-To: <20250503-wmt-soc-driver-v3-1-2daa9056fa10@gmail.com>
References: <20250503-wmt-soc-driver-v3-0-2daa9056fa10@gmail.com>
 <20250503-wmt-soc-driver-v3-1-2daa9056fa10@gmail.com>
Subject: Re: (subset) [PATCH v3 1/3] dt-bindings: hwinfo: Add
 VIA/WonderMedia SoC identification
Message-Id: <174637952896.102764.7995048226726382118.b4-ty@linaro.org>
Date: Sun, 04 May 2025 19:25:28 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250504_102532_595639_D0428685 
X-CRM114-Status: UNSURE (   7.61  )
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


On Sat, 03 May 2025 15:52:31 +0400, Alexey Charkov wrote:
> VIA/WonderMedia SoC's have a chip ID register inside their system
> configuration controller space, which can be used to identify
> appropriate hardware quirks at runtime. Add binding for it.
> 
> 

Applied, thanks!

[1/3] dt-bindings: hwinfo: Add VIA/WonderMedia SoC identification
      https://git.kernel.org/krzk/linux-dt/c/04e394d6e2a349d0522a6afe6db22f1f1a843e3a

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


