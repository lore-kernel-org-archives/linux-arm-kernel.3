Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65556CDE00D
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Nov 2025 12:01:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0gWt+h8z2Ss7R5dPrx1HuHd/mFqNB+Z89pG6552t6M0=; b=Or8Soxb6M4il1lfr2KKakxM0BM
	GgGPDFRYn1D19ysjn/0n05p6wCyDGGvetwdxVIFpd4HbZIJDNXNYulN2DCFcypgk/FQ3OqZ0gtf5N
	n1PBdg8on/ee4Ft3KJVj0K0UX2qvxjimm5ZUv5KN8YMujbQYZbjtTKh2nJp2pf38SpCfPKaqt5g5L
	FrRO5AKWYfi7eImOOmQ1OhtEsZGZFbrMf0Js3LnG53L7BIlsWu5XCkWqKz6nLcf+DtTB0FF8K0yRK
	VOhXXZjz12LKBlWNWB9tmizWmxzrfYBdm3dT02ff6xgyhc6ES6Io0fWXAJPd8H52cgvrB1p8JSfek
	tA6137+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJsUy-0000000CAEH-0OY5;
	Fri, 14 Nov 2025 12:01:52 +0000
Received: from mail-oi1-x22e.google.com ([2607:f8b0:4864:20::22e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJsUu-0000000CADZ-2D3F
	for linux-arm-kernel@lists.infradead.org;
	Fri, 14 Nov 2025 12:01:50 +0000
Received: by mail-oi1-x22e.google.com with SMTP id 5614622812f47-45033024e59so853858b6e.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 14 Nov 2025 04:01:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1763121707; x=1763726507; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=0gWt+h8z2Ss7R5dPrx1HuHd/mFqNB+Z89pG6552t6M0=;
        b=XKVDPunRt8J/jyz9+ec3aL25lPwwrUtTVHSB5cm6HKcM/dRJsVGq4F9doD2xWFVyyD
         JfzIV2As1vq5bZ8N9twtSrwI0OJc0b5hKMIWbKB2vV9Oe0NvnLafgwQzT52Qh3XnfpIn
         pkcJ1aXPC30LM92OcJSP4Mt8HLxNVH7Q4rXQG2ghR9EIE/kmtId22Rqwe8bsPCJC1WA9
         iEqGUCM+5ZpsgI71riZ8z6sWOsQeg4gVUSD6iKqeImuPEpQaQ8QijO+ZpzbtikmHPtrU
         zhMtg7NCsgY0DuN3Jgh0xM5gonnM2F1ctYtiIDMcEJUcH734mLiM3SUdysvkhy/WAeAX
         HPMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763121707; x=1763726507;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0gWt+h8z2Ss7R5dPrx1HuHd/mFqNB+Z89pG6552t6M0=;
        b=sI1aVL4YHpW4OletsDWVTg8J0DrmPD42+jdM/VlSX1+Yrs8izuWI+CdxKPVpbL1t95
         Nc4lYXCyUHA0+E5TlYZIvM6snX9tyG47Va7YgTfE3qOy2NtGJ0ohAUVjeT4fgcmEFLJb
         G5b17nE2R9NrEWMDMdUa+x5Jv4zqzYRbnu0T59nh2vpklrmOTyvcLJDISivnWONul0Xk
         mmCZrpPDsJNGvH9jpIdqZac0FQeeY0E+Ebg7mMkSCTUDtVylGW8y8f2DpbR4fyPeekcT
         TRP99JgmYo88fYnG32L2PfDbe2Wx7CZ+N08EURMGozACHUPywvTWHoZNY8PAXxIFxvDQ
         ytMA==
X-Forwarded-Encrypted: i=1; AJvYcCUxXvH3hYVCoPS4EXCbyUiEIGhCunP7KC4B/So2KqrI1GjcYrOhH6VlLSAm7RD+V+f33GtqPvnilOaoOfHu+tnz@lists.infradead.org
X-Gm-Message-State: AOJu0Yzo+5cO7CpYLY6AnSvsGdstgFZ8tcODj4l5q1r7UHipxOg6pJiR
	uTFGPixI1hE3b1+z+Ryu+w3rg6YCRIkZ98fTCn9k0DjqNA8KzAMKp23btfNdyw9FUAMr4YUflxY
	16QdZq7tIRRSwu9PEFjt/eJ4O6cRTbK5NvQzcF++GjA==
X-Gm-Gg: ASbGncvQuXIp/DgDpukyqwJhCmrvA4hOq2a1g4NO6HLEuzxkp9y7bV1OcbB08t7x+N0
	o7pjq4bP/j/Ovy/tXCR43TxS/+58GHWFCT6Q8ksIrQQPc+6HR72ab1VYv/uKjKnV9SjUJKraoac
	YtIIskLwUHSpI0cPR9+KTGpvfE3M1GZkIMYFZz1oDIqgmL9Iv6zXRjpckuFuAwDco8L+sCR1IdX
	d0T/DXruM2y9owKKSK1M9H/WU4u+xpw1flkzSrTo1D22tEfb3arocZQKRq6
X-Google-Smtp-Source: AGHT+IF3Ojmnkwzvj4mx3ICJHFTOSGE3H8DgYxvKJpIkWpFelTepwYr55k26BWA5PAiTHMni0lGmEZlB7MjGprr6OVk=
X-Received: by 2002:a05:6808:2185:b0:450:4e1:3afc with SMTP id
 5614622812f47-450975b1462mr1041084b6e.36.1763121707459; Fri, 14 Nov 2025
 04:01:47 -0800 (PST)
MIME-Version: 1.0
References: <20251103-remove-pmu-syscon-compat-v1-0-f2cb7f9ade6f@linaro.org>
 <20251103-remove-pmu-syscon-compat-v1-1-f2cb7f9ade6f@linaro.org>
 <20251112-naughty-romantic-hamster-e213eb@kuoka> <065678f2-3fbe-448e-83ae-e8b3e7ba96b3@kernel.org>
In-Reply-To: <065678f2-3fbe-448e-83ae-e8b3e7ba96b3@kernel.org>
From: Peter Griffin <peter.griffin@linaro.org>
Date: Fri, 14 Nov 2025 12:01:36 +0000
X-Gm-Features: AWmQ_bkL-XznKpYxkyk_6EauUHZUY13AZ8Gsg9pORNPYYA-SZiOeIuJstEYBnmI
Message-ID: <CADrjBPp_1APTM6uS9GqBRVfqHiwsiaQ7FD+5+uZakUFc2PDyzg@mail.gmail.com>
Subject: Re: [PATCH 1/2] dt-bindings: soc: samsung: exynos-pmu: remove syscon
 for google,gs101-pmu
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
	Tudor Ambarus <tudor.ambarus@linaro.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Alim Akhtar <alim.akhtar@samsung.com>, linux-arm-kernel@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, dan.carpenter@linaro.org, 
	kernel-team@android.com, willmcvicker@google.com, arnd@arndb.de
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251114_040149_483059_A1146C41 
X-CRM114-Status: GOOD (  13.51  )
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

Hi Krzysztof,

Thanks for the review feedback!

On Wed, 12 Nov 2025 at 10:23, Krzysztof Kozlowski <krzk@kernel.org> wrote:
>
> On 12/11/2025 11:22, Krzysztof Kozlowski wrote:
> >>      oneOf:
> >> +      - items:
> >
> > I expect new version (see other comment), so also please change items
> > into enum and drop const from below. items is redundant for one entry in
> > compatible (by convention) and having it as enum already makes it ready
> > for growing the enumeration for future devices.
> >
> >> +          - const: google,gs101-pmu
> >
>
>
> Ah, and there is also checkpatch warning about length of commit msg.

I just sent a new version addressing this and the other comments.

Thanks,

Peter

