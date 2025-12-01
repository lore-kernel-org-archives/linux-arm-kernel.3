Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 233D7D116F5
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  1 Dec 2025 16:20:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cspTNBzt+I5BtqKUZhFjJeUVwDFagEE/l2BBHLFNpxc=; b=gzKgH+xYVCusCw52QlvjQ9AfEX
	SLy23+fy5DwGgJQ1A/IoKOpTB32xeP7rTHfc0bIuKQjavTQ8LaPa5+6gaPkeNWEgCOi1asz9SiG2U
	uLx5I+PvOfQFFpjT5r60cj/g2MEwjiDXpK7TYOYeVYI//1oIKbJ2mB/OdylPgEWW+zvRhbZxojq3n
	XFaWsyFvL+JpcleSUqR2RBk+sChE5pwo72SrRpSFYTUNjsVMdpTaZlirOtZhm2EmGjSTC2mf6x7ah
	1sIQqesKVj6Ix9NxXbKlnncmxiyqKVO9jcbYpTUF/j27RiVvsi5lPNuJrSYZGLAA4E+pWI7j/uA3b
	DGCghYxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQ6do-00000004FSw-0UxU;
	Mon, 01 Dec 2025 16:20:44 +0000
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQ6dl-00000004FSH-0cfu
	for linux-arm-kernel@lists.infradead.org;
	Mon, 01 Dec 2025 16:20:42 +0000
Received: by mail-pf1-x42f.google.com with SMTP id d2e1a72fcca58-7b89c1ce9easo5299523b3a.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 01 Dec 2025 08:20:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1764606039; x=1765210839; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=cspTNBzt+I5BtqKUZhFjJeUVwDFagEE/l2BBHLFNpxc=;
        b=npv0lIGg4qIUmkZR5NE+IKUVMnhqcgBAPpNnHb6PT0JlmtbUi6S1sXfxRfr3vuUDGM
         gBYvt4elKF44EETxTawVCdNfL0VZo0yY+L5K06FbqPSXxJcPTZyZ9AyEJJIcN/qh0tup
         b/mbC0Fj8Gb/6PctMtb/elV1Oy6nKBUrPEN8B/H5fkdG3WWM6YxNlSnzOi9A0rTUh4p0
         Gf4Cev5iDIvJj7GAN0VE7wH0wWxzIDX6hmv4drXYitWd+yGI5Tsg/jjzLys9A9Ohug2Z
         4KlJCOxZg5yUQEPnjG7l8OudsLNyzi3MZwnYTpE93rk1kYCMLukrTRVZdggQ1uDcyRPj
         Stag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764606039; x=1765210839;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cspTNBzt+I5BtqKUZhFjJeUVwDFagEE/l2BBHLFNpxc=;
        b=FYKiqO/mhXDUM1vr3Cw8ZZEvVkepYrwjxZkXQRKelLGe33HOhl6pVBC1etucaOdi5S
         vhNwWM++FbrxCqX1hsT7ylTZa0yUUqInAf6q9Q8Nj5AZADORJw1PWEZ6Fyyqx+ItU1Um
         eDmRiYMienbpTsYmxpChZXF44sOtBWhkMhsD3eI8wEVSRMMyxBr7vtRjwQiKUi33S+Tm
         /zVzcBacQ645ttmguO/a6/Hp07R7cYbFOugjSNrUdko5FLsAAB43DsLq0zICGdefwXSB
         LulqZJddo9gMvlSacE900D6wiJOfzfQpjTwcIBDRRXaxdygcRSGz/TmqmbLUS4rxJ64H
         083Q==
X-Forwarded-Encrypted: i=1; AJvYcCVZUWM3VZyROdBba8vFK0RjuScu4386+5luyM0FVOvenF29AzlDC2UBFhqoWM6zAXRwLQk1IEaij/WBI3eYkkg0@lists.infradead.org
X-Gm-Message-State: AOJu0YzbmPI7MFpSWpuGYAZUQ+3baiCw5pUnWjzvxqnglDHjeXAWWpB5
	po4AdwbyP6c+eFVQk5m+bp0jXTVmJJ4jaRnnsstzOHSssob87gr7yQU4g7gr3lQnmck=
X-Gm-Gg: ASbGncu7siWYTqe07fqgD5yL1zlgng4Y4cKNULH+Rb2s/eQ0LbyaAlawrVmvwHR/g/F
	pELlgMywmHa7R8fM4xy26wE1D41c8JTZ3yZBKghKSvvuYceQPfTDFibKyXszETqApvtJwPsK37h
	9mLZXSRQIaKXlZJ2k6dH9Mm69ZIcxU4cYZ/7iufSlfVPRtK5br5V/+ij/NKSbsMQZ+qtWTmJ5dO
	E3L/OYauppkfPmPjpqCHfKPKAvipRqAK/zR9t0VcLbwZUvLXEjPShNM0O+KLbBIwMKLOURO6DNz
	2WfDwm5uOEMJKBhHXroKvnePdBHefFN9tDRulhStRtGH++owv/kipSWB+SUcHrCnayPYgwgOPu0
	fjKAN18gqbwlekR0o/ZW0iXPHTxHfbpExrq1qSWkbBtJNF1xvn7a7bO/CRNRhIhEfGgMa3LIhG5
	IQQP7mabZk7A1ukQ==
X-Google-Smtp-Source: AGHT+IEC7gGRxUyVtd+YE469cDLd2n7LeD/hmDQKTfHSUTd0/7SmlOv1H6YZTofFyUN0T2uY8DHV7Q==
X-Received: by 2002:a05:6a20:2448:b0:345:e30f:d6da with SMTP id adf61e73a8af0-36150f059e2mr47497364637.37.1764606039144;
        Mon, 01 Dec 2025 08:20:39 -0800 (PST)
Received: from p14s ([2604:3d09:148c:c800:7234:1ea8:3e35:6ee3])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7d15e9c3e41sm14161217b3a.33.2025.12.01.08.20.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Dec 2025 08:20:38 -0800 (PST)
Date: Mon, 1 Dec 2025 09:20:35 -0700
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Srinivas Kandagatla <srini@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>, linux-remoteproc@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org,
	linux-sound@vger.kernel.org
Subject: Re: [PATCH 0/4] ASoC / rpmsg / remoteproc / soc: qcom: Constify
 buffer passed to send functions
Message-ID: <aS3AU0gEEOvWs4Uw@p14s>
References: <20251130-rpmsg-send-const-v1-0-cb11c7e0a024@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251130-rpmsg-send-const-v1-0-cb11c7e0a024@oss.qualcomm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251201_082041_207491_F8C495F8 
X-CRM114-Status: GOOD (  18.01  )
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

On Sun, Nov 30, 2025 at 01:36:07PM +0100, Krzysztof Kozlowski wrote:
> Dependencies / merging
> ======================
> Entire patchset is one logical chain, all further patches depend on
> previous ones, thus everything should be taken via same tree or shared
> between trees with tags.  Probably everything should go via ASoC with
> necessary acks.
> 
> Also, first patch or two patches could be taken now for this merge
> window...
> 
> Description
> ===========
> The remoteproc and rpmsg send-like functions should not modify data
> being sent, so buffer should be marked as pointer to const.  This is not
> only self-documenting code but actually increases the actual safety and
> clearly documents who is the owner of passed buffer.
> 
> Best regards,
> Krzysztof
> 
> ---
> Krzysztof Kozlowski (4):
>       remoteproc: mtp_scp_ipi: Constify buffer passed to scp_ipi_send()
>       remoteproc: mtp_scp: Constify buffer passed to scp_send_ipi()
>       rpmsg: Constify buffer passed to send API
>       ASoC: qcom:: Constify GPR packet being send over GPR interface
> 
>  drivers/remoteproc/mtk_scp.c       |  2 +-
>  drivers/remoteproc/mtk_scp_ipi.c   |  2 +-
>  drivers/rpmsg/mtk_rpmsg.c          |  4 ++--
>  drivers/rpmsg/qcom_glink_native.c  | 13 ++++++++-----
>  drivers/rpmsg/qcom_smd.c           | 10 ++++++----
>  drivers/rpmsg/rpmsg_core.c         |  8 ++++----
>  drivers/rpmsg/rpmsg_internal.h     |  8 ++++----
>  drivers/rpmsg/virtio_rpmsg_bus.c   | 24 +++++++++++++-----------
>  drivers/soc/qcom/apr.c             |  8 ++++----
>  include/linux/remoteproc/mtk_scp.h |  2 +-
>  include/linux/rpmsg.h              | 17 +++++++++--------
>  include/linux/rpmsg/mtk_rpmsg.h    |  2 +-
>  include/linux/soc/qcom/apr.h       |  4 ++--

Acked-by: Mathieu Poirier <mathieuu.poirier@linaro.org>

I'll let Bjorn decide if he wants to include this in his upcoming pull request.

Thanks,
Mathieu

>  sound/soc/qcom/qdsp6/audioreach.c  |  6 +++---
>  sound/soc/qcom/qdsp6/audioreach.h  |  4 ++--
>  sound/soc/qcom/qdsp6/q6apm.c       |  3 ++-
>  sound/soc/qcom/qdsp6/q6apm.h       |  2 +-
>  17 files changed, 64 insertions(+), 55 deletions(-)
> ---
> base-commit: 7a9e871ce4c7c8a7d75eaef8407083a0525de2dd
> change-id: 20251130-rpmsg-send-const-ae216a1fbd8f
> 
> Best regards,
> -- 
> Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> 

