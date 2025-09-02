Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17306CA1007
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  2 Sep 2025 22:57:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=78JjK4tXcA8g9uPjMvbbjnVHA1m2U/+rqmg+Iy3ERTE=; b=W5vDYpffgSg3hrv9GUmNYk3UbG
	sA5Wsno3Tf+TO/sllIWt/6JUEj7ZMkKyHSt4/I4X+TJaNBAijbNd/3OxukjSHQeSrTk9zp9sOvG4m
	OKT9XTc2L1oUMB+zKGbWtt4+2PfRtcwUArQdl7bHT6i/7/l6gJaaPeiS5iLCfyTe48iuWw1kzIZrU
	MmwJepH9ZfUN6B7LRbLdnyaFlJLQ9uEX2EIgAFQ8QiYtV4AmsI024QjyseZC3cdOTvJZX1d9A2v26
	X0mULZ8Mlv46R5se8gbKwDjsT1YhGOTxEJF1vbPMKxdyGWwzRXHGU1qMznlebhC2ErEdZe6eLx6JY
	Abtn9kDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utZwo-00000002Ucc-0k3x;
	Tue, 02 Sep 2025 22:57:54 +0000
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utWJt-00000001YCl-1JPk
	for linux-arm-kernel@lists.infradead.org;
	Tue, 02 Sep 2025 19:05:30 +0000
Received: by mail-pl1-x62a.google.com with SMTP id d9443c01a7336-24622df0d95so43964355ad.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 02 Sep 2025 12:05:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756839928; x=1757444728; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=78JjK4tXcA8g9uPjMvbbjnVHA1m2U/+rqmg+Iy3ERTE=;
        b=Fqdlfu2QoLWddam9scKlVWtztf1oRwbpdnOs/vkYgb4CLI7ZsVH3Voy2UiD10Sy8eu
         5V+fxxzKPL5+J8P4fET+f14VYqzrYZrsSHq5HAzluP44eeKamV1CezCkjElRIc0/IKig
         mr8fXWF0tfWqYeH9AAp1f+JmOnH6wJLxXrKPDUz8bWgiIWOS17/VXOwUEdYDIP31eO3B
         nCa79f73cEIgW2ZDzOW8DN++uoI+ah5XMyrMl8fJxwD/ZW10aXStEbVIv1L03kKjH3EY
         Pf6XLcqoz0jBPz2TYvDBS51pCDm7E+ZO1Ox9r0+bsGK63Vi9qUNnBX46Y95gQFhZg3VN
         L/AQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756839928; x=1757444728;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=78JjK4tXcA8g9uPjMvbbjnVHA1m2U/+rqmg+Iy3ERTE=;
        b=VG5iTbHYQA5sw6nInA6bVMcu2cfKhfjvhNmaD0fweul9hLFSPINDuuHKvSF55Pj8c5
         LxuTppfRJ2Oh1RP3D+fiI7hlenYtYBj9vzGIq87hoGWYw/zvAhOY254JJuIJmPv2Hmlg
         e7oE1AfCv83nQDMyYrQSnfM3oDU2SsqvMRwjyrr0KZtE398i7kWRVPV16S12O2B8pIOf
         QzKxq2aNxUUwvatSthDIF/szpZnn36fi39SBvYVshURIGvZ48Fo3U2Z5DXIurlO7LBKJ
         5Kt4L0PS0HEXVgvde56plZlw5HW5jP06I8ppuQNQL0i+b/y9UOWkudxYZZSsDFyvsjEj
         nKfw==
X-Forwarded-Encrypted: i=1; AJvYcCXeEvVzmsYb4g3ePUt4asZYs9WjSnZhCjYrQgBL+aXsZ78BNcdEOOxSoNRoUbaU4C0zUkqiep5fNqb6RRpMyvkh@lists.infradead.org
X-Gm-Message-State: AOJu0YxAunI+Wv+w9PE8vnco5s8oG9u4R+hD7tRDDJmb1nD0DyN1M1x+
	8IX6gJCRn7dtl4m/dvQ+FNkQclVKPSFNRjOFYQz2DSFuN1qpE4opwG2o
X-Gm-Gg: ASbGncvNY80GVs71+Vm99ayWCcxpqMqQb8gcL2IhlTJFXn76ZmFd+Rsi/Q7AbVDJsJ1
	z3c7rbaBHrAlq52/gvInXptdyBVpZkkHiofhAQEaXRY0DDWstd9F/qAeHoYTNf+t0LD0t1/2yLT
	1Bbo5+TBSCewYYM1m5oSOscmCo1Y8yCXEeXZ5DVvDxNHKj8WQcsKUpk+a9a2m1Ri5TcKX2DzrlJ
	oqzZXOIRU634d9hk5a9F6QYi3trnkw0qY/aQdaPjejLSPyccIOkZ6EaeKpVhTgZx7U2KvFBuzWv
	Jr60Krq0G7qolYHFKzY9jpLEIqhRh/AvI9QwDvKfUxvJHzKf49xmSulm8gGtLhx/xUTq6co2wu3
	sZNNni06ysgygo42Rg1E/CQ6HlN7YqnCuNNSSYu4gC4okgg==
X-Google-Smtp-Source: AGHT+IEGvSjCtN2tazfJOvk7JjCLXCOhTbAtGkB2W3n5ns9Jne3onIDumA+e7R7UQzVPVwR1WktAOw==
X-Received: by 2002:a17:903:2f8a:b0:24a:e25d:c70d with SMTP id d9443c01a7336-24ae25dca0emr91663435ad.48.1756839928286;
        Tue, 02 Sep 2025 12:05:28 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-327da90ed87sm15053668a91.23.2025.09.02.12.05.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Sep 2025 12:05:27 -0700 (PDT)
Date: Tue, 2 Sep 2025 12:05:26 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Wim Van Sebroeck <wim@linux-watchdog.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org
Subject: Re: [PATCH 1/4] dt-bindings: watchdog: samsung-wdt: Define cluster
 constraints top-level
Message-ID: <8b935f78-99dc-4857-bb5b-2a1636103772@roeck-us.net>
References: <20250830-watchdog-s3c-cleanup-v1-0-837ae94a21b5@linaro.org>
 <20250830-watchdog-s3c-cleanup-v1-1-837ae94a21b5@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250830-watchdog-s3c-cleanup-v1-1-837ae94a21b5@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250902_120529_354793_154F58FB 
X-CRM114-Status: GOOD (  10.65  )
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

On Sat, Aug 30, 2025 at 12:18:57PM +0200, Krzysztof Kozlowski wrote:
> Properties should be always constrained in top-level part of the
> bindings, so move the samsung,cluster-index constrain from if: block.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Acked-by: Guenter Roeck <linux@roeck-us.net>

