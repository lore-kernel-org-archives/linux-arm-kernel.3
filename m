Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09722CA1007
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  2 Sep 2025 21:54:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=h0tyuMeYrRF3UuyC0u24L8yefESvpiLXMf//ew+AAMA=; b=Dv0QpgjPH0LOzQ1K+5JTqkKhO+
	lZ0zbZ0zoAQGD8Rm7s1+/XWS0Rch81jzqVw8Ttjtq9J4OoTQvFHmOTCnaGrRvqfl//mWjK2/3xTYm
	b8OicwQ0GBekl3RA0VvUSvqPVI/ux6K9uaAF8KwZlxVQMJe+DriHzWcgfMDzePdNTjBK4LD7LmE2b
	fdMjj3Leb1SqECTmgDucFwH15ztNcDD0aWRHS9NWD7yj6yTxSNihTKsEjBftZtDOGgQtJY9FJLuRF
	ITY7rMimscD40CG2tTLJJc0UVSakVY1dkQVRUoYsUKiKyR1VuyDyNPluskUm/w3zPpcXe90YEjpv2
	H1GQfEYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utYx5-00000002H6a-1OLa;
	Tue, 02 Sep 2025 21:54:07 +0000
Received: from mail-pg1-x52f.google.com ([2607:f8b0:4864:20::52f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utWLC-00000001Yai-2Tse
	for linux-arm-kernel@lists.infradead.org;
	Tue, 02 Sep 2025 19:06:51 +0000
Received: by mail-pg1-x52f.google.com with SMTP id 41be03b00d2f7-b4cb3367d87so3289908a12.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 02 Sep 2025 12:06:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756840010; x=1757444810; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=h0tyuMeYrRF3UuyC0u24L8yefESvpiLXMf//ew+AAMA=;
        b=f07dZyUDwNfgiycjEk5Ah6TeGPOM/ZWKN91cTdH6JXfB6MUTyJbIgoGdrdUMTm+ozv
         RU+LnWoP6AuieewS4VwdP63DmEd3lbNvFMirCGgXMLYRThgIb2/0SkuqCYMrGTe0ps51
         1YO2bR2aalDYWDrp9ZnsSakN0Dz3lSzBJUBO0qmlYvrxkW34ymUYTwqP06jWseCR4qMB
         3+Z66jmzUAyoPPJ9+mpKvBap8uf2eV9ePy7423CkkQepgL1Ona2uzZED1+6kUtmGTtlW
         HzQt4lwUiP5hAXoU0jI06Q23+CK2BlR0CraVDJHcpd167Cu2+NbGhhDHanG1Xqq1GPk1
         6ENQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756840010; x=1757444810;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=h0tyuMeYrRF3UuyC0u24L8yefESvpiLXMf//ew+AAMA=;
        b=FcI1+j78aYSqQ8K788WSgD2N6WDSmeGAPI35FSzX2MxvlGHJEyj5Xs7rpFuv8MMQeF
         KzpPf6Ch+4nL9oSjF9hnWctWslOsF/EZFu2mWPnZSBPC7IACz6g809lrWBjD7MC7cVS+
         DMz1a3QWy2mLkglux5Lz1mm4qoSFFmWh2GEMcXXydZ2xsQzEJwIbmTdDq6QK8i0hPZfu
         E8HHrFGRP79w2onI4jkrSyjWNunCSbovmaxbV8noXorgFaxEvhypa4uuke6FmUzg1ZNM
         rcgVGT/lK+WfARGH/nXfJY2CahtcmZGHGDqnmIeCkaF3BSKx91Kg6OASQKkek4Fzlc8m
         u3yw==
X-Forwarded-Encrypted: i=1; AJvYcCUrq63T0GdvtoJ3GSHgcMX2xHt7Zb3MEuswbPiJOqr4ZbetlfzBCEh7nM8pajJl3UaCcNmLwEUM9BZUNwt9ez5N@lists.infradead.org
X-Gm-Message-State: AOJu0YzLMIWlJJ7f4LIK59Dm8ULRY3J3g+HlDSYh3HPqmkbAAmDOdhXL
	E5/EsIqB97tFfeXbhzIubzLm75y89Bxnash21SheSfg2xy+Xd3k8M7nd
X-Gm-Gg: ASbGnctFjpYGfRG7e8iGS8wk8Y0saTUzn11N9mUFo8wtcUAQ10f7PLFg92yqzXTA35E
	wfVmJNAmYVwJUBhOESW1b3PdMKekU5CJLLRRXaGB80GYHkHgGZ/iVWHtx+3Bqw4yGy5aIQIH7Js
	bIIDaYI/XsC/dffTMAEWuwrC3pLSWucLwT14TuIYwVgdiHosq6Ea1LHwKfQ8wZ8tSsO1xkY9TQO
	NhiAYGOtZ+bvUktEU6AW6pouN/WkSi5aL2gCuZsbmv3RZyO1oV1LTqGXKXMmR8PK9UUsC+nu2qv
	nDS/A+lwUuW3Xa2sR1dBuyqBojlKb/84G2z+WEf9vkb4cayfchb3H2rrukywQz5I2upec+baE9S
	3/CyTj9749tVLuqO1HrwEKIfNEzTuEMhl5cA=
X-Google-Smtp-Source: AGHT+IGiaaNenZIIlYQ031zqIJ8csfv12moDoXvpOr+m9JD1YnwbUBskbJecUQoUMXDhWons6OPv4g==
X-Received: by 2002:a17:903:1211:b0:246:ceda:ebeb with SMTP id d9443c01a7336-24944aa2848mr155824775ad.33.1756840009795;
        Tue, 02 Sep 2025 12:06:49 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-24903702354sm140993485ad.19.2025.09.02.12.06.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Sep 2025 12:06:49 -0700 (PDT)
Date: Tue, 2 Sep 2025 12:06:48 -0700
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
Subject: Re: [PATCH 4/4] dt-bindings: watchdog: samsung-wdt: Split if:then:
 and constrain more
Message-ID: <fc652345-1dcd-4adf-a472-907c9692de89@roeck-us.net>
References: <20250830-watchdog-s3c-cleanup-v1-0-837ae94a21b5@linaro.org>
 <20250830-watchdog-s3c-cleanup-v1-4-837ae94a21b5@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250830-watchdog-s3c-cleanup-v1-4-837ae94a21b5@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250902_120650_626917_2AF2397D 
X-CRM114-Status: GOOD (  14.98  )
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

On Sat, Aug 30, 2025 at 12:19:00PM +0200, Krzysztof Kozlowski wrote:
> Binding defined two if:then: blocks covering different conditions but
> not fully constraining the properties per each variant:
> 1. "if:" to require samsung,syscon-phandle,
> 2. "if:" with "else:" to narrow number of clocks and require or disallow
>    samsung,cluster-index.
> 
> This still did not cover following cases:
> 1. Disallow samsung,syscon-phandle when not applicable,
> 2. Narrow samsung,cluster-index to [0, 1], for SoCs with only two
>    clusters.
> 
> Solving this in current format would lead to spaghetti code, so re-write
> entire "if:then:" approach into mutually exclusive cases so each SoC
> appears only in one "if:" block.  This allows to forbid
> samsung,syscon-phandle for S3C6410, and narrow samsung,cluster-index
> to [0, 1].
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Acked-by: Guenter Roeck <linux@roeck-us.net>

