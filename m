Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6A50C35FF3
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Mar 2025 18:03:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oXkYzz2Ho7HoWYUA45E8jVGK6oEmHJXqvRS4IbzYytA=; b=Glo3g3s4tATun7TR9k6V1+2BHN
	0OwRXLM/OotUewPpbnEV0EwhAZLT4dQ28SZPXg2J3ckhPhsbcdPtein8iMkQGMbyxUw3gMEZEbDQJ
	AqJR/iIhCqkXkQtEP5oO8A3cG8uoqUHLo0bP4eKEMjNRksig2g3yn9DU4Vx/bPoGf+1wBjsKJIxV9
	42VGGqhunFHquICfIgzb62tMvR+4K7BP8n3q9xe4IlO9DlFlhyOVbQjh17g9Yb8M+2/4/6Kvnr7Mz
	L0an9Htw9nJWx6MWbtg9bBfI0d+P9RgUNk1zAB0pLFziJxm1UgBZpuvF4fwvY2+JCeLH8b5oMlTdQ
	UgEuwFHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tsmuB-0000000C6ez-0MA9;
	Thu, 13 Mar 2025 18:03:39 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tsmSS-0000000C3VM-0YfO
	for linux-arm-kernel@lists.infradead.org;
	Thu, 13 Mar 2025 17:35:01 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-43cf58eea0fso8330095e9.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 13 Mar 2025 10:34:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741887298; x=1742492098; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=oXkYzz2Ho7HoWYUA45E8jVGK6oEmHJXqvRS4IbzYytA=;
        b=ax6hIawJE0Vp17WDvoYgsuy+4sbvbVSB0N46sspgS/l1kqh892JMD9Aq9ZD5lQ8SV3
         ECLSRCtTB9sEioWoN0PfyVw4bgxvc7btvHLkcjixEcrVChtK21sahA1z9R0sDooCVWmc
         hFvBleUNQVD65fEx5uzBzzKwQBl/501L9PHwW/K7YmttuSY3zsr4OrFIwu8hsuK7JnqZ
         989nIf4L0o2OH7HOYkrBtuwbL29qJLXyvkOXufrXvHTXz/d1KrFKhlLYNi7zgx5Ywnaf
         07X893m+V6wjwSLEjuDg5CYGLi1y8Wi7yVE46MbHU4g7ZvQWBMAHJsyDlfA87QM/ay7H
         LX0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741887298; x=1742492098;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oXkYzz2Ho7HoWYUA45E8jVGK6oEmHJXqvRS4IbzYytA=;
        b=sjAukrSnR6NN3g2GXDaflRZBH9MgPIMtaWf6/6u4NOY6Ep72RyztKH2rdxquION3i2
         4wmpRmRmP2ADH5tFitBW9GnT7SLU55vkwd2TSOLJCKZGZs+AEsLA0S+/GYcXofGaZl/t
         6RwTjlm/+b4ofa6KktOFAdtv0gYwfRX/Pgtb88bpBixeIk7DL54zupAFJgdz+tMmfXWe
         BqDVjv+mfwQqcPd3HhwV9VwB/QDykPEQFL+TfBdNUhtd/iXDAD2zke1/umPW1+aMYNLf
         icrusSA4iiit1iOF7vdpccNhVXVY/sqMIS/V/e1zUF9azDXZdn5mHJDUFwP4n6BsDSRY
         vWRw==
X-Forwarded-Encrypted: i=1; AJvYcCUm6EvGBRB/58l7VMh9OkpvmhmQk5Z0WRX8Iqk/gD5zCh/h/6fj0WVbXm2pzHqZmyzP/qQ0YONmepm/2l72dzAa@lists.infradead.org
X-Gm-Message-State: AOJu0YyZXhrlzhP2q8o6z8YAe4fQhfpaYBKyDfKFTVZAcgRpqpjbvfgA
	BcwpaVmhv+ZyN9oBKZ5cwYkCXdva2u8w6QrEoNAi388b5Nmh8m70+q/zEuDrPBZPSnpW9PMi95s
	QqZrxmoy/ZNatl0bdX96NGZDXZrOzlzrGJYlfJQ==
X-Gm-Gg: ASbGncvUsTsnHZFPPzQ2eUnFHUBy40f9SFuUI7KzxLEFLNiGurwmSFClDmroE5W6dZd
	+jZjVhU2K/p7b3jB9ELnMvA7efCjnN7leCwuRIX5ZEUbprdVMQgwy0m/UGDt4QStp33WWiK5KSf
	AvlyFzIfx7a/M6dNO+k9Sill2TC2afw5J/6QSfAGdHECxxMKmEr2myR27EHGX6nKasfMuBWw==
X-Google-Smtp-Source: AGHT+IE1c9T0TY/pjJhjtchTkkrxDWqZJglz/azIkv2TkxGPgH3NolVO9vmQFRaJtQOUi7YI3c4g7vzs00zqUmzqNzw=
X-Received: by 2002:a5d:5989:0:b0:38d:cf33:31d6 with SMTP id
 ffacd0b85a97d-39263b006c5mr11690959f8f.3.1741887297667; Thu, 13 Mar 2025
 10:34:57 -0700 (PDT)
MIME-Version: 1.0
References: <20250311-wip-obbardc-qcom-defconfig-interconnects-builtin-v1-1-675b6bc57176@linaro.org>
 <CACr-zFC=mPNeeHMp9XnSby+cMQaPWt_3s8iUiCN+EnVPeGad8Q@mail.gmail.com>
 <uljqxwfgl26txrfqvkvzzpj6qurgmwcbuot7gu2u6rwjaqgncb@jeuyi4mexjff>
 <CACr-zFDSFizYmrVN-dV334n1kq17UB9k4FxrV20NNQCQMhzrwg@mail.gmail.com>
 <92dd35a2-d1cc-4f2b-b3a8-5752ec33b0d3@kernel.org> <CACr-zFCYWEFPO8yExp_8hOQdVtC9Zwu1ZOZNksSeyyS6Ht0e9A@mail.gmail.com>
 <Z9HjMyjzE9XlqrEj@x1>
In-Reply-To: <Z9HjMyjzE9XlqrEj@x1>
From: Christopher Obbard <christopher.obbard@linaro.org>
Date: Thu, 13 Mar 2025 17:34:46 +0000
X-Gm-Features: AQ5f1JrDO9V43KtazVC9qZW1Wz_qdtZmiVsFJZOGkGi6dHNCT7HLwGuh8qsdaME
Message-ID: <CACr-zFAHGcQtwSz0EF0kt7_PUXxwi3GZY2BmAVedbLjh3+4LhA@mail.gmail.com>
Subject: Re: [PATCH] arm64: defconfig: Enable Qualcomm interconnects as built-in
To: Brian Masney <bmasney@redhat.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Dmitry Baryshkov <lumag@kernel.org>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250313_103500_171409_A85EEB25 
X-CRM114-Status: GOOD (  15.43  )
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

Hi Brian,

On Wed, 12 Mar 2025 at 19:40, Brian Masney <bmasney@redhat.com> wrote:
>
> Hi Christopher,
>
> On Wed, Mar 12, 2025 at 12:10:56PM +0100, Christopher Obbard wrote:
> > For reference, I am working on updating initramfs generation tools in
> > Debian/Fedora to include the required interconnect modules. Currently
> > the interconnect drivers are built as modules in these distros, but
> > are not included in the initrd. That is where my confusion initially
> > stemmed from.
>
> From a Fedora and centos-stream-9/10 perspective, we have dracut
> updated so that the interconnect modules are included in the initramfs
> by default.
>
> https://github.com/dracutdevs/dracut/blob/master/modules.d/90kernel-modules/module-setup.sh#L74
>
> Let me know if you are seeing a specific issue with the initramfs on
> Fedora and I can help you.

Awesome, turns out I am wrong and the interconnect drivers are in fact
present in the latest nightly Fedora 42 image I am testing:

$ lsinitramfs initramfs-6.14.0-0.rc3.29.fc42.aarch64.img  | grep interconnect
usr/lib/modules/6.14.0-0.rc3.29.fc42.aarch64/kernel/drivers/interconnect
usr/lib/modules/6.14.0-0.rc3.29.fc42.aarch64/kernel/drivers/interconnect/imx
usr/lib/modules/6.14.0-0.rc3.29.fc42.aarch64/kernel/drivers/interconnect/imx/imx-interconnect.ko.xz
usr/lib/modules/6.14.0-0.rc3.29.fc42.aarch64/kernel/drivers/interconnect/imx/imx8mm-interconnect.ko.xz
usr/lib/modules/6.14.0-0.rc3.29.fc42.aarch64/kernel/drivers/interconnect/imx/imx8mn-interconnect.ko.xz
usr/lib/modules/6.14.0-0.rc3.29.fc42.aarch64/kernel/drivers/interconnect/imx/imx8mp-interconnect.ko.xz
usr/lib/modules/6.14.0-0.rc3.29.fc42.aarch64/kernel/drivers/interconnect/imx/imx8mq-interconnect.ko.xz
usr/lib/modules/6.14.0-0.rc3.29.fc42.aarch64/kernel/drivers/interconnect/qcom
usr/lib/modules/6.14.0-0.rc3.29.fc42.aarch64/kernel/drivers/interconnect/qcom/icc-osm-l3.ko.xz
usr/lib/modules/6.14.0-0.rc3.29.fc42.aarch64/kernel/drivers/interconnect/qcom/icc-smd-rpm.ko.xz
usr/lib/modules/6.14.0-0.rc3.29.fc42.aarch64/kernel/drivers/interconnect/qcom/qnoc-msm8916.ko.xz
usr/lib/modules/6.14.0-0.rc3.29.fc42.aarch64/kernel/drivers/interconnect/qcom/qnoc-msm8953.ko.xz
usr/lib/modules/6.14.0-0.rc3.29.fc42.aarch64/kernel/drivers/interconnect/qcom/qnoc-msm8996.ko.xz
usr/lib/modules/6.14.0-0.rc3.29.fc42.aarch64/kernel/drivers/interconnect/qcom/qnoc-qcm2290.ko.xz
usr/lib/modules/6.14.0-0.rc3.29.fc42.aarch64/kernel/drivers/interconnect/qcom/qnoc-sa8775p.ko.xz
usr/lib/modules/6.14.0-0.rc3.29.fc42.aarch64/kernel/drivers/interconnect/qcom/qnoc-sc7280.ko.xz
usr/lib/modules/6.14.0-0.rc3.29.fc42.aarch64/kernel/drivers/interconnect/qcom/qnoc-sc8180x.ko.xz
usr/lib/modules/6.14.0-0.rc3.29.fc42.aarch64/kernel/drivers/interconnect/qcom/qnoc-sc8280xp.ko.xz
usr/lib/modules/6.14.0-0.rc3.29.fc42.aarch64/kernel/drivers/interconnect/qcom/qnoc-sdm845.ko.xz
usr/lib/modules/6.14.0-0.rc3.29.fc42.aarch64/kernel/drivers/interconnect/qcom/qnoc-sdx75.ko.xz
usr/lib/modules/6.14.0-0.rc3.29.fc42.aarch64/kernel/drivers/interconnect/qcom/qnoc-sm6115.ko.xz
usr/lib/modules/6.14.0-0.rc3.29.fc42.aarch64/kernel/drivers/interconnect/qcom/qnoc-sm8150.ko.xz
usr/lib/modules/6.14.0-0.rc3.29.fc42.aarch64/kernel/drivers/interconnect/qcom/qnoc-sm8250.ko.xz
usr/lib/modules/6.14.0-0.rc3.29.fc42.aarch64/kernel/drivers/interconnect/qcom/qnoc-sm8450.ko.xz
usr/lib/modules/6.14.0-0.rc3.29.fc42.aarch64/kernel/drivers/interconnect/qcom/qnoc-x1e80100.ko.xz



Thanks,

Chris

