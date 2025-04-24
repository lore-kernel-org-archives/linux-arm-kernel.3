Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85A51C369CB
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Apr 2025 03:05:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VJgVkYspiLr69iy7tyKuhkRGOkGOu7zIaIZdJSWEPzk=; b=GXzuXeH9rl5dlkDCXC//PG5bVa
	1EPxY0oEdHWYPhF7WLuIPygCYjoQ/HYmFMVHuuEgNJo+2PMUakbyVdygJL7yKXfRclETVQamcbmKZ
	egDdBepnNk2nETJpXLtuzPZUMT2B2km9t/DGAAnE1G5y6b6gvledOn62QkJGIU0GABUxnCrkkKkb8
	M4aUAC+a44aOQz/VelWMJQNpGdW/ws9CuS0Suz2GP6StMukAp+dN7Zm340ybJ/9qD22B+I9mKPcvn
	GP3mqSdRQVLr4i40/u8+EknXUwVVQ/QT7+SScDgojgaIDzmS6vdO2AD20KIy00sqIXiBmo4aLH2EI
	Q4T+MPag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7mtw-0000000Cgc8-2cxl;
	Thu, 24 Apr 2025 03:05:24 +0000
Received: from mail-lj1-x244.google.com ([2a00:1450:4864:20::244])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7mrx-0000000CgPS-1NuY
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Apr 2025 03:03:23 +0000
Received: by mail-lj1-x244.google.com with SMTP id 38308e7fff4ca-30f30200b51so6605571fa.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 23 Apr 2025 20:03:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745463799; x=1746068599; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VJgVkYspiLr69iy7tyKuhkRGOkGOu7zIaIZdJSWEPzk=;
        b=Gazz+irRzdymdfRler+clp+po3VfaAZN64hARnLr0y1YM2aq3/r8Ap1UUHPZmoZVuQ
         zM0TiwqDSmSdBX8l2r4g/e2GgDGenN4S649YCCTtqK4oJcMYpbboejLtA6awge8Rvp2F
         SjwFT0OML+IpL0Y9OahR1apZjiZsontfKkhoBn2GUrdpTlSUIR3/s1oFaxuisrxX/Kc8
         H7nPAVnpZ0DfZQGrhrFpJ3j8zocbBpYEMOhnnjgaTY/1kY9yjPbchTnt9JCo4TDxtemG
         6cewtVX+4FtV8T1fJwQJuPy7UNs62JyFQ4zOKkYKxJWgxebOMXxRM7TzlqCP5BVanBfj
         6zUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745463799; x=1746068599;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VJgVkYspiLr69iy7tyKuhkRGOkGOu7zIaIZdJSWEPzk=;
        b=Lk6jDCOU4ZT0MEwAMTvbj6XO4nrsnJQaXi94b27/iDZjGzjlwigsBk87UZZrVtK3y2
         CdHSyq/MtfukPMmd6XYW1ixRTmEJQgOImGyzWWAgHbhhK+62aQAE08Ij25yA6HlZPiGH
         MARxgFnK0BPBOIDDEp6aP2erUnkFmnbawiU29D8GyxRD41OolKwY4+xJOa4F9gTBP4V+
         j3/qrb5qxb6wZQ6KvefK5LaA/m6griMzmaaCbot8D0gyZszR0eZu+7pngNNdrPo7R9Vj
         IWLuI+LmEqqRzN1RisNcJhuCe4nBCq3FYwBII8fym3k7n5LeEDA1okG7m8Jz4+Ra5Fz5
         z3mg==
X-Forwarded-Encrypted: i=1; AJvYcCUwCf46UurPA4lLrbQUN137/NGbF0KdNwIEsl323OsjFBZ9TFjheZB3uFIZWxsTDfyvuoKmTy6yvNUKLwFPgnrk@lists.infradead.org
X-Gm-Message-State: AOJu0Yx/PTGqc4is3FPeNu2Zhl0Y+ICl0ioFV6xvR6fxmKsSiAX+nz+Y
	IkNF6zHsvcJ6Lhpj9Fu6xcHb/x98NKJPMjUJQJqoq3KyAlCCT6VcA4vAYUf8BwCyhe/PW2fkOZV
	NiQNmVGGTMDchGo61ZOT4j1Gy0b8=
X-Gm-Gg: ASbGncvZJYwUmSIx3o8kTIGky3sVlKIbU00ZQ6IlyYifw6jfnnAC6ORVRaE8Q4Bh9BB
	LssiEIEAHbnw1w0IH+tduns7XmNOIJ/StIH+ODLfGG19te6Dtc/rqSZeQ4v8HdZt0a5HruF6JoJ
	IR1WhO9PqFxY96+7gnOFp6ng==
X-Google-Smtp-Source: AGHT+IHEFdU6AkUjEDsg9os0FKyDTupZOXaV8Eg0JIYI3IbQ+wKen8hrgMsyt3fgQt+8e2hv23seZ7XdRIJjTGcx9NQ=
X-Received: by 2002:a05:651c:1549:b0:30b:b956:53c2 with SMTP id
 38308e7fff4ca-3179e9ee6c1mr3610421fa.11.1745463798645; Wed, 23 Apr 2025
 20:03:18 -0700 (PDT)
MIME-Version: 1.0
References: <20250401104518.25391-1-bsdhenrymartin@gmail.com> <f59af2ac-a7a2-4490-8858-30c7f98e4149@kernel.org>
In-Reply-To: <f59af2ac-a7a2-4490-8858-30c7f98e4149@kernel.org>
From: henry martin <bsdhenrymartin@gmail.com>
Date: Thu, 24 Apr 2025 11:03:09 +0800
X-Gm-Features: ATxdqUFi3ltLX0JNZInCro5GgmN0f5TCi8PDuD-PAPOj1o31dYGRRL_n0J8qIWI
Message-ID: <CAEnQdOowa1LJbe7Uj4yR+r=NSysyTbagpvbfR0toc=BBk-UaTg@mail.gmail.com>
Subject: Re: [PATCH v2] backlight: pm8941: Add NULL check in exynos_generic_icc_probe()
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: georgi.djakov@linaro.org, s.nawrocki@samsung.com, a.swigon@samsung.com, 
	alim.akhtar@samsung.com, linux-pm@vger.kernel.org, 
	linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250423_200321_371705_BA425BB2 
X-CRM114-Status: GOOD (  12.23  )
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

Just a friendly reminder about the patch below which received your Reviewed=
-by
tag but hasn't been applied yet. Could you let me know if there are any fur=
ther
actions needed?

Krzysztof Kozlowski <krzk@kernel.org> =E4=BA=8E2025=E5=B9=B44=E6=9C=881=E6=
=97=A5=E5=91=A8=E4=BA=8C 19:00=E5=86=99=E9=81=93=EF=BC=9A
>
> On 01/04/2025 12:45, Henry Martin wrote:
> > devm_kasprintf() returns NULL when memory allocation fails. Currently,
> > exynos_generic_icc_probe() does not check for this case, which results
> > in a NULL pointer dereference.
> >
> > Add NULL check after devm_kasprintf() to prevent this issue.
> >
> > Fixes: 2f95b9d5cf0b ("interconnect: Add generic interconnect driver for=
 Exynos SoCs")
> > Signed-off-by: Henry Martin <bsdhenrymartin@gmail.com>
> > ---
>
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>
> Best regards,
> Krzysztof

