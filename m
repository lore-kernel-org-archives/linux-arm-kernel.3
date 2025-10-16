Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B378CCD183
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 16 Oct 2025 08:22:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oBBdec07DnXHPLlkhx/kTRhSSBmJ1d438R+ruAA70Rs=; b=yThBaZYEvGubTb0UEOchrXvKeU
	Ffvpm2SB1DEeSdK9lz19yMfn7v/P81GHkqCLBQkr+db6gQyaHLJSkq0N6dwHNHwqviD1QjF0zx1PM
	NIam4xUFxr84+AW/6uxGtl/9aiMOiSmodJTFzfY38bgb2vKjxbO7GtgDe+ZKQauYLAln40C/KR1fl
	AeOTF8QGwmX8lX5HpP6QMVOYf6FpUA5LEMQ3L0HqGMLZQ2BjDrZbxbZtGFYrMYCOyJELYOUZYQ7KZ
	g16TXQpS4LFp4V/KdkzEMnr4H8o87/iDgK7QLNkYnALZPiuBB2tID3MHB8vHIwNy7ki4rFz9HIkKL
	d+HOAewA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9JFt-00000003uJo-1qeW;
	Thu, 16 Oct 2025 08:22:37 +0000
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9JFq-00000003uIX-3fP7
	for linux-arm-kernel@lists.infradead.org;
	Thu, 16 Oct 2025 08:22:36 +0000
Received: by mail-ed1-x531.google.com with SMTP id 4fb4d7f45d1cf-63befe5f379so595442a12.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 16 Oct 2025 01:22:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1760602953; x=1761207753; darn=lists.infradead.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=oBBdec07DnXHPLlkhx/kTRhSSBmJ1d438R+ruAA70Rs=;
        b=C+wLBtdq53ta3/dv1QG1H6CUCE7eNL1VGZ/ic0BQb8vcy1y8l1AcTnNba5+zrdoLav
         TtMEoiqHz0UXCQLzFXWraXD/x3wy95qWYrT3d1hfWSswfr9XYKzXKPDbksBWCu/wxje4
         Fi7MFsqqkD+4M9LauIFTJ8c/Rvg7AwCQ5sWj8lTNgP4YA4gngmNThJiukcDpQMF1/vdr
         9Ev68seWUnqw+PmZkTgi5JgY+ABQUINClKLdPqpP3fONPrJmZkeRfzI81t7BS8t+6v8S
         m0sjjqJYnTi013lAU7hSAWvJFQzCJSNLTQo+fKcr0KLI6mRFnJlVlwR6Em7GgQKuLsDz
         1VBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760602953; x=1761207753;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=oBBdec07DnXHPLlkhx/kTRhSSBmJ1d438R+ruAA70Rs=;
        b=n84nbHzsWXai3YAXn++4CJKV8zknUXzyebN+pgl7whkjOgcZtbaHE9+M3/PDK2qIJO
         VXfSuUbtnHsBQSt0legbcUAftLwvFvHy8be8K8/r/Wz7SlXpeUtLPiDrUFx6sWEx6EQL
         1rOwj8ULi4M0pzpEgovwILp/OshSqwStktb8TCirYSa/t0/XQbmSQabx0kcAU/vV1hVb
         SKvxeNSRvpm1jKwSs22sYNMKKli2OEYZ1cP5oM4AVkg3WXOpIVx/V+D4/ygFYqYPYHY3
         cn0N2Adlb2vBKcM1eoR+XibTm4PJ/b586fyaN6qssZ1/sjSUFxHCiQr4K+grD/bdh88G
         9qDg==
X-Forwarded-Encrypted: i=1; AJvYcCXh79wD1hCiE5NmU6ihQaN9KWCU4KD0n+XVG5EH7XP3B7Tiyf477/J0b4j9jvTdJEgxj9ItPpXdv43N0WFtbrBB@lists.infradead.org
X-Gm-Message-State: AOJu0YyBNBSC/sxiFWOMJi+zGvOvbxvWvH84Xoh2xuLzKZ24W9p3BHsN
	UDnXwBMaXoze9KBL1UfuEP4T6JXRcPl779sY3vLxK3zFk2lcWoyw7myl9P15drPjdGI=
X-Gm-Gg: ASbGnctAuAoq53d/kNx9mlAQQSpJe8lW986x6PJQd1qZiqEH20KkFwEvqa+CW1/ecIa
	wv024ecSL4+NiNBx8CpVnQS4XEfQPwgw2jRbZX6/F6L9ZpKrS9Da0ELhkmmwvupJQYT40dLkvXa
	fAZERuHwqAV9uit/kSMKjcr6426eZ4KfPF8kCk2M2SqZd91anqSKfeFsqqrC2pjQwNDJkWturqN
	9bh22nXALLYgWZWhEBbYHprUrOsReCZj7hy2HC4gQILxmcBeh/1wb2sxREWOadIxJEIENvVUcVd
	ibh/7y7g1cQP245MRp0SP2+11n9JH3SF9eGuQXoC6Suic+/tzOQEByMVu9aJh115L6/qfd4xx/j
	4ohs7g/+mMt4Xq8YgMExdirGa0izck6w8WGR7liZ9U+DxdPustQ3WZ8fefTHX5bIuuT3pd+MgjC
	+aDRRJLAaW4tNawb2l9Q==
X-Google-Smtp-Source: AGHT+IGSt650n9l8ivg1ZcCBjVV9spK1fxIgYVcQeuSemjU+fLA1qbxGFofJQsP8Vwjza4IFOhR66g==
X-Received: by 2002:a05:6402:84a:b0:62f:50cb:764c with SMTP id 4fb4d7f45d1cf-639d5c699efmr29854311a12.35.1760602952962;
        Thu, 16 Oct 2025 01:22:32 -0700 (PDT)
Received: from draszik.lan ([80.111.64.44])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-63bea024febsm3932663a12.4.2025.10.16.01.22.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Oct 2025 01:22:32 -0700 (PDT)
Message-ID: <0ccec501bd01a4e3a2e5087a52fe7a9b32d97c75.camel@linaro.org>
Subject: Re: [PATCH 4/9] arm64: dts: exynos: gs101: fix clock module unit
 reg sizes
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>
To: Peter Griffin <peter.griffin@linaro.org>, Rob Herring <robh@kernel.org>,
  Krzysztof Kozlowski	 <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Alim Akhtar	 <alim.akhtar@samsung.com>, Tudor
 Ambarus <tudor.ambarus@linaro.org>, Michael Turquette
 <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Sam Protsenko	
 <semen.protsenko@linaro.org>, Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Chanwoo Choi <cw00.choi@samsung.com>
Cc: Will McVicker <willmcvicker@google.com>, Krzysztof Kozlowski	
 <krzk@kernel.org>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, Krzysztof
 Kozlowski	 <krzysztof.kozlowski@linaro.org>, kernel-team@android.com
Date: Thu, 16 Oct 2025 09:22:31 +0100
In-Reply-To: <20251013-automatic-clocks-v1-4-72851ee00300@linaro.org>
References: <20251013-automatic-clocks-v1-0-72851ee00300@linaro.org>
	 <20251013-automatic-clocks-v1-4-72851ee00300@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-2+build3 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251016_012235_087771_232EB14C 
X-CRM114-Status: GOOD (  11.01  )
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

On Mon, 2025-10-13 at 21:51 +0100, Peter Griffin wrote:
> The memory map lists each clock module unit as having a size of
> 0x10000. Additionally there are some undocumented registers in this regio=
n
> that need to be used for automatic clock gating mode. Some of those
> registers also need to be saved/restored on suspend & resume.
>=20
> Fixes: 86124c76683e ("arm64: dts: exynos: gs101: enable cmu-hsi2 clock co=
ntroller")
> Fixes: 4982a4a2092e ("arm64: dts: exynos: gs101: enable cmu-hsi0 clock co=
ntroller")
> Fixes: 7d66d98b5bf3 ("arm64: dts: exynos: gs101: enable cmu-peric1 clock =
controller")
> Fixes: e62c706f3aa0 ("arm64: dts: exynos: gs101: enable cmu-peric0 clock =
controller")
> Fixes: ea89fdf24fd9 ("arm64: dts: exynos: google: Add initial Google gs10=
1 SoC support")
> Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
> ---
> =C2=A0arch/arm64/boot/dts/exynos/google/gs101.dtsi | 14 +++++++-------
> =C2=A01 file changed, 7 insertions(+), 7 deletions(-)

Reviewed-by: Andr=C3=A9 Draszik <andre.draszik@linaro.org>

