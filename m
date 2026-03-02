Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA928EB3622
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Mar 2026 18:07:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=g5L7HOH+qGHmUa2TQzLnS5V8xHXQs5WAMIno5lumxs0=; b=QpFQ4Rnno16gyewq5Rbh/6IwPw
	sjpRRFldxO1Elh4Dg3pICibJjiiEY43axrv50x66ifpJB1op/aGPUZvA8/HJ7SBkg81DqUS30KDTA
	6L/lLC40pVLqhAYY/mJCOJh7E71mHiucbe4SeWT+Neg61EshiEkqF3m+lR/ZiktLHZQ1CmuAP35gi
	Pec5ghOKiJ3hUs8OMhYUmJ1mWsKo/aUtOXJWFOM8witQ5H9NIXoK25A/iQt/A7Z0orxIwWiWYUehN
	79Edwd+ZBqu2z4vtyxIYv2e8MxxOicXE2onDcAdG6dT8ZOnDJhRo5jcaY+LN8YfMf8D8QjNPGp0gW
	l21xnrSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vx7gM-0000000DeZe-2gDH;
	Mon, 02 Mar 2026 18:07:50 +0000
Received: from mail-qt1-x82e.google.com ([2607:f8b0:4864:20::82e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vx7gJ-0000000DeZG-36y3
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Mar 2026 18:07:49 +0000
Received: by mail-qt1-x82e.google.com with SMTP id d75a77b69052e-505d3baf1a7so17261cf.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 02 Mar 2026 10:07:47 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772474866; cv=none;
        d=google.com; s=arc-20240605;
        b=GsV/KzvWNnRoHLINt9/AN3Zd3zboLO7YW11IYrzG1k8EvvjowxDzOA/fORlIBYfmID
         xrVKHnqUELaAyBHAzlmilQR6ycRvPuYI+BhKYUGw1BPzhhBBbOqpF05zrvRJR3nbIVPf
         w5w+/4eGTT8kCZQnmVuQGgcXkmLmuDfXif29bBpy1goq0gYycNjRkIQ7OrQM+UxTmhFm
         7JNnxB+nApowrbqd503xJiYuWdA39AB6yWjKGjS8yzmsCn0cZ9k9O+0N78h/NHnQ6MA8
         Npuu0ddYkoeYVGnB6ZKK9Tlbu28wnvJ+UhfVoYlB+vmqVKAAhlqimORWejh5hYCYMQ6i
         W0Fw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=g5L7HOH+qGHmUa2TQzLnS5V8xHXQs5WAMIno5lumxs0=;
        fh=VFXcUrr3kGurp0SuF0YJGl5pPwUAd9HYetUbgSB3cYw=;
        b=DsS955wX9C3QKN5Wsz+nl89dYFuc4Erj3L6bWpx/DgLXL8fnuPiSLvI7991Yaug69Y
         5fwHbUUGtC8R/Xdl+Q9ivvTBWzP7ewUUSGAMljSp2mKSNPn+2zTSYfMHHIzq/elq8pIV
         nU8kixYOWGJuN5NcscIMGCzHAbFuF5V07NQXPYOsUg2qbZtElz93k0j+9F2Yeh+eCKWb
         IuQe0r2hfuXrlR72ncc0AqAqMp0DTgRmUCnLxGFNKh55+qqN3m778E2EGOssBdLyTLby
         Av9SxY8PSrn1bd/PE9G60URuaMfyMaJGlYMI/O9KMUECx/Dt5Mdt/Jl86qkwliuneuTu
         JD1Q==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1772474866; x=1773079666; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=g5L7HOH+qGHmUa2TQzLnS5V8xHXQs5WAMIno5lumxs0=;
        b=izqJZ/aQJtqGeUi8mXYZuRea8bKW7H5kI6bvGxl2LfLlXH1jtFD7VKr1BwttTqlBXU
         Zyk5cAIAxyysSUNwFrYVy6Zzxwu/e2zuh20FJ5gzUc+bLJqXf4XtFj4jEDjtdA7GSo+8
         EvrAnJX6gqk4FLsojACKsEY0oMOjO+/1HSZZ1NqBov6FgRbolRMgwxy6gVz/HCkmyS+a
         YTaALSXPDbA2FKCImDq4G/xOK1F0eCncRBrecFKPRG/s9nn8l4CnZNlNUGcx6eUlsYhO
         /rGYz5mHAuQlrDiUTb/VjqvfsRHpezYb9040pnRm68KporE0uXGaBbnTXXojwZFxr5bd
         8ThQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772474866; x=1773079666;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=g5L7HOH+qGHmUa2TQzLnS5V8xHXQs5WAMIno5lumxs0=;
        b=WGBsKwUAYKUtx1zYUudYh4ngOK+gIlnf0Q94u1PcSLW1Q3KtH+Vo7Xu1Im6ISxAO/o
         nsSN57MaSZWL1Msk4MvrPBNsGKIVPQg/6EVXEiF4Ix0H1Blnp7vGQiE1Dts1kqm1YyWC
         OGXMVzyRlPZ31/WycEq0ZwtdgAPVCRs/OP99lzHkxI0DT7n74CgrdknJx0F0gVmvTfVc
         3ASfU02nRAA33HXcehgseEtU34KxT6O8+kEDTREdRjTWAixe81RmcH0ylYlSPLBEwXzl
         0Bt6zXLg9ixaYlN4aGJC1qpJI0yAGnaLOApnujvQcRIabxvIfaliuvQCS0qsonhgMb9+
         4qfA==
X-Gm-Message-State: AOJu0YwtwWCHjfoOyPeU8ZiL45xP4xyG1Uadh605Y1cg21yMnNRe3NNK
	ZtWUSN4pctwtg9Q1ZpYVtPEgpKxlS2QPmsS0T/iRE+GGCmZ12AkIA273XkDRekOk8/6KfXRHta1
	XnFfKcc9FVK9kiVFN8vc1shFjcxLmB+3VvdTebRyUX1yVyEziy06/tXDe
X-Gm-Gg: ATEYQzwLhQiteaR5h6sWJzlMzZaDbnfnmE6AH7qKT7Dpu/GmDqdc4Ay4weJaBhqxnx8
	hwm4xXXgvmkn6u5a5aNy62RWatgtQ6KzXqH5kXMP7pUSAtR9cXam137+tMY7nnLtMYa18OTnCyz
	FfIEmJZ9ji+29WuGgSgP1fQDFMJiOIm84oMd0tFxHMhvh7P836DsygqbN4aTT14KfN/hG8V2Yrr
	J574fcUDJZQJODXZH8YubaU72dTns7OXPckdad4gN9PcRNxn1t95pCF7lik8HHEUjuDu7/UXcrO
	OlhpZI/k
X-Received: by 2002:ac8:5995:0:b0:4ff:cb72:7c03 with SMTP id
 d75a77b69052e-507617532dcmr23954281cf.3.1772474864882; Mon, 02 Mar 2026
 10:07:44 -0800 (PST)
MIME-Version: 1.0
References: <20260302115653.1517326-1-maz@kernel.org>
In-Reply-To: <20260302115653.1517326-1-maz@kernel.org>
From: Fuad Tabba <tabba@google.com>
Date: Mon, 2 Mar 2026 18:07:07 +0000
X-Gm-Features: AaiRm53f0ov5VDjDbU0EYarSY2nR7SD28ese3HWFZAeLmItAD8SpdFlW8YjuVQQ
Message-ID: <CA+EHjTxgfarNCipjYwfEp1fyF6oicxDw2_tbAQ9JNAjM90w6rQ@mail.gmail.com>
Subject: Re: [PATCH v2 00/11] arm64: Fully disable configured-out features
To: Marc Zyngier <maz@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	Will Deacon <will@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, 
	Mark Rutland <mark.rutland@arm.com>, Joey Gouly <joey.gouly@arm.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Oliver Upton <oupton@kernel.org>, 
	Zenghui Yu <yuzenghui@huawei.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260302_100747_844349_C958A24D 
X-CRM114-Status: GOOD (  18.56  )
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

Hi Marc,

On Mon, 2 Mar 2026 at 11:57, Marc Zyngier <maz@kernel.org> wrote:
>
> This is v2 of this series attempting at making the handling of
> features that are disabled at compile time a bit less awkward for
> non-userspace consumers of the sanitised feature bits.
>
> A few things have changed, thanks to Fuad and Suzuki spending time on
> reviewing this, but the overall behaviour is the same.
>
> * From v1 [1]:
>
>   - Mark ALL_HIDDEN and HIGHER_SAFE as incompatible
>
>   - Don't update a feature that is ALL_HIDDEN (or overridden) on the
>     secondary boot path
>
>   - Reduce the size of struct arm64_ftr_bits
>
>   - Add a helper for setting a field to its safe value
>
> [1] https://lore.kernel.org/r/20260219195533.2455736-1-maz@kernel.org

For the series:
Reviewed-by: Fuad Tabba <tabba@google.com>
Tested-by: Fuad Tabba <tabba@google.com>

Cheers,
/fuad





>
> Marc Zyngier (11):
>   arm64: Skip update of an idreg field affected by an override
>   arm64: Add a helper setting a feature field to its safe value
>   arm64: Add logic to fully remove features from sanitised id registers
>   arm64: Convert CONFIG_ARM64_PTR_AUTH to FTR_CONFIG()
>   arm64: Convert CONFIG_ARM64_SVE to FTR_CONFIG()
>   arm64: Convert CONFIG_ARM64_SME to FTR_CONFIG()
>   arm64: Convert CONFIG_ARM64_GCS to FTR_CONFIG()
>   arm64: Convert CONFIG_ARM64_MTE to FTR_CONFIG()
>   arm64: Convert CONFIG_ARM64_POE to FTR_CONFIG()
>   arm64: Convert CONFIG_ARM64_BTI to FTR_CONFIG()
>   arm64: Remove FTR_VISIBLE_IF_IS_ENABLED()
>
>  arch/arm64/include/asm/cpufeature.h |  15 +--
>  arch/arm64/kernel/cpufeature.c      | 141 +++++++++++++++++-----------
>  2 files changed, 94 insertions(+), 62 deletions(-)
>
> --
> 2.47.3
>

