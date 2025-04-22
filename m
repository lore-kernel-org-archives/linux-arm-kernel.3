Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8FD10C369C2
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Apr 2025 16:13:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=01iWsWRnKaXYUJ6i/NON00y6jMFX6UcPEC4jPm/g2hU=; b=hGDmf8H4BxcK/2VRWCAFtBpGIg
	Tpwh9Mz/U9mKyr35cOnYCCDoRmBr3A4FnEDVLHjhi+Qo1LdxOCRky194vKCMfe+lfpnSH4If6vk1p
	R5vl1AUvVi9MxAd7LUkHCaaNJG3Jdhblv6nuYN6AbRWnJ8ftCJJUflO0fhg9vxeRirraeu0pM/7Qa
	Jjg91kWqiEk2+9JcCp89JGhk7wMRaChuMYEWv7QiAF3KUpxkKitFN3Hnhy6XSUjXYGBFKef0L4CAl
	+STM0tktDllHWWnzCnqKDpRG4DUrpm+DZWw5nWUjSu3VlmGxtLx2vjVQVd/7912Opht3PHs8G8gMa
	B97lc43g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7GFT-00000007r01-40WR;
	Tue, 22 Apr 2025 16:13:27 +0000
Received: from mail-yw1-x112d.google.com ([2607:f8b0:4864:20::112d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7DvD-00000007LxT-0F5a
	for linux-arm-kernel@lists.infradead.org;
	Tue, 22 Apr 2025 13:44:24 +0000
Received: by mail-yw1-x112d.google.com with SMTP id 00721157ae682-6fee50bfea5so40835287b3.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 22 Apr 2025 06:44:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745329461; x=1745934261; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=01iWsWRnKaXYUJ6i/NON00y6jMFX6UcPEC4jPm/g2hU=;
        b=CD1BA//b8jpc6TGk9lYdD/zsIg4H+xBdvAeZ7AQh8EUEzjveW5pz93PMDT1NJkyTh0
         PeFnfPsdh/RnUgoIGb5PnCXvwFHSL8z6Xs2zQu0DVYvELpHsMuIDozg7LAr7vXZMhbsG
         vhiJNl/08T/77kAz9H0JhBWtFl20sleIWdxggxj+1jOTWww1elm2r8bF3FPD/dHGwhQ0
         LtZPZQK0L9Nc4pOGUsajA6Vr3ePH4/eMe4BO26Y+HufBXyYr+cPmebNiw+f7prL8CEVs
         EjHt8zCOAjh+xnSx/lrN/hQew8Z8tNIEELdU0wQMUUWGxodYMPKHIIcI4PleawhmOi9B
         5bag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745329461; x=1745934261;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=01iWsWRnKaXYUJ6i/NON00y6jMFX6UcPEC4jPm/g2hU=;
        b=E+mLG7rESNYN/RlnoL862sL0FqUlN02iwVND28g627+QvEbVahT/sY5UDzkN0AE+P3
         /afNljAQ+AiAsowYWkOQMgDDggbdnTPrnVaoTKWWrw6umuMN4tNCC5JQrdtwf6lIz8ZR
         T6BxccAFNEu1bLRTFv1Onmsi1PL6nUc5gORppWXTxdF8oFg0vmLpLxo1DD2Sttahcgzs
         XaUHnzUd8cqh4zJ6akqkoWhSNalHx4zvwtAF2IiqcpQYgxTsL0t5K8ksfKZLfw6hi4yE
         JDuo4Lq1adrCyDgC0wPBAaNf45XlVrxaFs28BlBno9I88MBEWpfJIBRE1xSuMFCVFBZK
         7+7Q==
X-Forwarded-Encrypted: i=1; AJvYcCXgZA8g8kpHvuRxFhQQgwOnvSe5/Lna18brK6I91LNFNNk58zEdDUspXoX/ZssoghOy1m4NjMNHRkUAZJe9sFY8@lists.infradead.org
X-Gm-Message-State: AOJu0YyeBdWKfcBK6NiMEv3TRx8hAE4a4W0o/Nw2fqYfT7+JIi59U7F+
	BPj2snBO4vNYRO4X0TXGlmjqMxCs/VfV+3mGLu+xUZLqYcWzw96YQcvk0G3sCT6FjvWlmybrKTn
	3Qm5LT8vWAXqb0jztpdU8R1tztiM=
X-Gm-Gg: ASbGncvVkLpBFU/XRbOud0MaPGiYXfXSNBvg8PkWonxw6+aNaEfJRk3VTyar8vyqwGD
	F7xVFtRv6NWCkEXUAjBvCDA1OCIhskdXx3M8vVtnqj9/F4Yge0ghYfWE3ovdbehgiD39882CM33
	lXlhr7IXfyWQf8y7vobg32LK4=
X-Google-Smtp-Source: AGHT+IFB0dsAITdx8kdX4E2ydKgnUeAe4cFVnylPhUhldLMfCcBI8Xtwn4NktwjCacq5FAj+GCAiAMlZsGz4uy29IlY=
X-Received: by 2002:a05:690c:6f87:b0:700:b007:a33e with SMTP id
 00721157ae682-706ccd0a2dcmr235402417b3.16.1745329461380; Tue, 22 Apr 2025
 06:44:21 -0700 (PDT)
MIME-Version: 1.0
References: <20250417-spmi-nvmem-v2-0-b88851e34afb@gmail.com>
 <20250417-spmi-nvmem-v2-1-b88851e34afb@gmail.com> <20250422133619.GA1095169-robh@kernel.org>
In-Reply-To: <20250422133619.GA1095169-robh@kernel.org>
From: Sasha Finkelstein <fnkl.kernel@gmail.com>
Date: Tue, 22 Apr 2025 15:44:10 +0200
X-Gm-Features: ATxdqUFsls2M4OH434tZGU5ecAW3B2mwbfmPhFEi7JO7p4M-mTLMLWRteEtCKs4
Message-ID: <CAMT+MTTwY=z1-_94ws+Oi+wvE2PA_s57dPmpMABC26q=MPw1Mg@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] dt-bindings: spmi: Add generic SPMI NVMEM
To: Rob Herring <robh@kernel.org>
Cc: Sven Peter <sven@svenpeter.dev>, Janne Grunau <j@jannau.net>, 
	Alyssa Rosenzweig <alyssa@rosenzweig.io>, Neal Gompa <neal@gompa.dev>, 
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, asahi@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250422_064423_094980_395FB7DC 
X-CRM114-Status: GOOD (  12.84  )
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

On Tue, 22 Apr 2025 at 15:36, Rob Herring <robh@kernel.org> wrote:
> > +title: Generic SPMI NVMEM
>
> What makes this generic?
>
> A generic driver is great, but "generic" or "simple" bindings are
> generally a mistake.

There is nothing apple-specific in that driver, just re-exporting
several registers as cells. If you think that it is a mistake, I can
rename it to apple-pmic, or something similar.

> > +      - const: spmi-nvmem
>
> What happens when there's some other feature of the PMIC exposed that's
> not nvmem?

If you have a PMIC that needs more features exposed, then you'd have to
use a different driver. Or am i not understanding the question correctly?

