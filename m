Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D45DFC88E7F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Sep 2026 14:48:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=N31h1AzvLTVLE4JkZfUHMakRC7JrcK8cme37Ix1dV/I=; b=K6UU/803Hq/gd+/esdufP4Yz9S
	CbKapaM5AabRPA2ylvoahQikgnKUxO0ze5C44rsGMSoXL+jXp44zLAKvyeM43ispoZrzoyCm8q4m8
	etynOLj/n+qMaji8NEWLQFKo17wGQCwsO2wnlCYD7Wf/zM5qibh/xgalbQIy4EvSTQYgit3y/0nzg
	RC7b5sEcBZh4yEi5yWWcNn0yYBpImOh+ETcCqJUGC5Qo+bZSok6bLsIk7Av9gYBC3/PjTBVwulYcj
	FjCrhQTYVPgN5Em3TCrT7JmvkJ1SR57ckz/2I1rrXD+Ka4WIv/rUKUC3vyO/PHMyJkdbIkA1CPSp2
	vjeW8JdQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6US6-000000070V9-37gn;
	Tue, 15 Sep 2026 14:48:06 +0000
Received: from mail-ed2-x10.google.com ([2a00:1450:4864:33::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6US2-000000070Ti-2qst
	for linux-arm-kernel@lists.infradead.org;
	Tue, 15 Sep 2026 14:48:05 +0000
Received: by mail-ed2-x10.google.com with SMTP id 4fb4d7f45d1cf-6a64c7cdb46so5958456a12.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 15 Sep 2026 07:48:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789483681; cv=none;
        d=google.com; s=arc-20260327;
        b=HZ/LX8/kZzhWTUqt9k8S0MO9Cy7NzFef/RUSu43ZEVvSAIKqd5HJCk1jU7+NoHOs5c
         9+bpYS+iu9W2/mOUJ/ZcVErzmLh5x04TD4hbyxMbOUb0lI42uGpSXnakljp92jKFa3bu
         RaclI/YbD4mSAN+779MU/hJdOFzg+QwfBdJ/geaH0czEq2OLyPJXn6fuNOmE7HBBbhrl
         1MYvyAgYuVHpc56DlDuhL+REuseAGK7H8B9qxKCle2sGHSiQmwVR0dqM4Bx654C7yse6
         3rsCmxpvhkkaFAfMokDBsAxDxgzAcgYV+ws77sOGz+OaGs0E2DoHLt+AaT8NdoEYR10d
         q/Qg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=N31h1AzvLTVLE4JkZfUHMakRC7JrcK8cme37Ix1dV/I=;
        fh=Bcv+F9GzewoR52QC4uhCt+up2rOcIahjcgMKbeH0J/s=;
        b=NNc7JxARX1GxFPN8Dh6IhWFLo8ZmXIqchZ1s0i2FXfCPczk+Yiw3XSnxsc2pPwIGhd
         8t/xfg6n9NAkwLtluDeKwHryG+8VD2vS8uQRGQTcG0LJLJpw3H7TwzyPSgJE/vNPpVK/
         cKCbHyUZikJmtyzRexM36o2mtV8IfCAK+PhmPTkaaanpEK8QyXFF1ZMjWiZDufA6QMRP
         60avba/gUBsRU6tyx2UKBuYf1pdvWR5uuH8PXcXpiyi1HygIi8fU13d7ODB0+Zi5OMoE
         hwh5YgNs9fvOJn0VJgTO0LExAKz5LdrVrufE1obUAsJSGy9OjHjJnbURVPtpSyFnqDYs
         wZCQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1789483681; x=1790088481; darn=lists.infradead.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=N31h1AzvLTVLE4JkZfUHMakRC7JrcK8cme37Ix1dV/I=;
        b=esBmQiMKokHsNJrJ7u42eYg53F1w0DuxUCqsJ2UWmsZz6lWdZgG3TGYPEMhq32h5QF
         6FJL0ULm5xzbsyneG3bfcgkgWskmch9hTvd7LxXvJq415eW/fTw/C5GNEzvFNEG3POI5
         xVhCDfZrKbR/4L+FcoVJgVFraXi3jiVYX00551hXuxPWk3qa3U4RwAugUixHP2gWHsWc
         6fVtfDPM5AVGibZuVCmJEU3ihgADYDC7RqCofLy1JOmAATziCgcqZeLXJMqW23Gn+i7W
         gBqyZ46KCSQdL13BpVZCw8+cDiyJI5zWlLNPxb2CTQPg1v/gOndQLAR/Ek9RC1TNMapm
         ILvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789483681; x=1790088481;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=N31h1AzvLTVLE4JkZfUHMakRC7JrcK8cme37Ix1dV/I=;
        b=bGX97m+oLuCVXwMUaBXwC/k0sxjC/D0BQUlQNPYuvXBOlznzp3f/wAC4dHNqXyvMHM
         n3N5O8qVyPACmWSDNxHA/67/Y+Jt71jV/+iXb8M4RMPj5C7juyVb54Qbe+1R49weALud
         f/e7DbrMovdj3H6urUVtxw6aIy09YK0SDs8y/7iWz5Q9xNFnkfoy3lfLzMchpZD2El54
         byvSQ0Z1EM9dU5STD7CKmg8G9vWybORbHcT6ABwH5rlPm1D99ymM/v+Z8tfj7NfudSk2
         lfE/PVHJyenAi9hSMA5wopzyYAok2a8Wfsl8pD5eDLvqW52gMrXwMw4GvPDVM/F0V+ub
         8mKA==
X-Forwarded-Encrypted: i=1; AKwUvByVMsVbizLOYNAQ/zu7Z/EPToX/yxRf3GeCrU1dosaaA6HEBiYmVem7ZYHkuiZikRxkB/WhtfuLh+27LqGZRtP4@lists.infradead.org
X-Gm-Message-State: AFuF++meSi/cB+fP9Nc9vQZCJPcZUncveyTVNYYPhFTbnL5L1YJuc7ut
	jjyFuOLcGVSfusljnfVJSDVQRJtCKIWx17Tji7ykNpVRIJX2eXis63hpAW2iNoxODpcS0DD9yQb
	1v/vszzTlHgN/2p+v5vTy4odMa5T8gJkGQksUynalx8fYwf2MjPOYse4=
X-Gm-Gg: AYBFou2FRLfPwHvheZYxvAcQUJGAiIozqnAdzl8art1ucw85VZnSfcd+Kl9n1Rfz+UW
	gVpu10EnQGeJ60d+SauljP5m+wB1qyG1HKsKZvyflIQ6rD+TRXn7/Bze1FqE/VfZ5oZ4kUynIr5
	HwocOML/j0YD6HveqOF24/gEubaRIA3AdkDlgctkuWCG6t9r1tg+TGMhyXQkMfsjoUVJPXdsrCY
	8Tu6DepSXXLdd25wb/Zx+atK24g30GkV0xrKqf7V6YVfxy3+tVSHsR9hdBoqoVxvr8VbqFOUpw7
	YRzoQvBM3zmws6YQjtgHlYGRsQaRJaSGuHs3E65AiZI1TKForHOBDMlgR7N82FALwMCox3+NGM5
	n3DAwr3gdPtXZtADIe/SkgQZH
X-Received: by 2002:a05:6402:4404:b0:6a9:98b1:6c36 with SMTP id
 4fb4d7f45d1cf-6a9f63e0d39mr5145656a12.31.1789483680985; Tue, 15 Sep 2026
 07:48:00 -0700 (PDT)
MIME-Version: 1.0
References: <20260914-exynos850_sram-v4-0-253871de0f61@linaro.org> <20260914-exynos850_sram-v4-2-253871de0f61@linaro.org>
In-Reply-To: <20260914-exynos850_sram-v4-2-253871de0f61@linaro.org>
From: Peter Griffin <peter.griffin@linaro.org>
Date: Tue, 15 Sep 2026 15:47:49 +0100
X-Gm-Features: AcwNN1WgvUO9gVcyHHtQQpCHP6veTmxEFNeRoziGdiQtPJVZo1SV7WyKK3oIExw
Message-ID: <CADrjBPr8EROpwaXsuqNBgyiJV5b041poTKzFRfrx-rCvH1CyRQ@mail.gmail.com>
Subject: Re: [PATCH v4 2/2] arm64: dts: exynos850: Add acpm SRAM node
To: Alexey Klimov <alexey.klimov@linaro.org>
Cc: Sam Protsenko <semen.protsenko@linaro.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Alim Akhtar <alim.akhtar@samsung.com>, Tudor Ambarus <tudor.ambarus@linaro.org>, 
	linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260915_074803_864622_BCFA5E92 
X-CRM114-Status: GOOD (  15.86  )
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

On Mon, 14 Sept 2026 at 17:58, Alexey Klimov <alexey.klimov@linaro.org> wrote:
>
> SRAM is used by the ACPM protocol to retrieve the ACPM channels
> information and configuration data. Add the SRAM node.
>
> Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
> ---

Reviewed-by: Peter Griffin <peter.griffin@linaro.org>

>  arch/arm64/boot/dts/exynos/exynos850.dtsi | 5 +++++
>  1 file changed, 5 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/exynos/exynos850.dtsi b/arch/arm64/boot/dts/exynos/exynos850.dtsi
> index 911643008b9f..2128749d7647 100644
> --- a/arch/arm64/boot/dts/exynos/exynos850.dtsi
> +++ b/arch/arm64/boot/dts/exynos/exynos850.dtsi
> @@ -176,6 +176,11 @@ soc: soc@0 {
>                 #size-cells = <1>;
>                 ranges = <0x0 0x0 0x0 0x20000000>;
>
> +               apm_sram: sram@2039000 {
> +                       compatible = "samsung,exynos850-acpm-sram";
> +                       reg = <0x2039000 0x30000>;
> +               };
> +
>                 chipid@10000000 {
>                         compatible = "samsung,exynos850-chipid";
>                         reg = <0x10000000 0x100>;
>
> --
> 2.51.0
>

