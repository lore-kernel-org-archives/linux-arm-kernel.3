Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06EBEC36002
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Apr 2025 12:55:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vnbe48AO71vHxLIqa6wKoIQjII3SgOedEce7jQxnB1c=; b=D5ugnKDyCbu+XN1iHfLOhSOyJs
	9qFgEfbbQCnR7rWopITkXtXUoJcxbDjLPC2dqWTwkbZa4PgrONT8bbSb7U/GoDgQqcuhgMrTiEGFl
	kJE/9004oWXzF31wdgBsbo+DZW1yxf8NG/fq+elEiwQUNpyJjTCaeuoofYiwv2qEAexVIxHfIbblR
	BDp3HFIK5Q33aK60nWAoJm2eJB22var0zDO9uvpZFGDjvzn42IlsXuoEhAVIQgZ1b0q572iRcPm0c
	obT1SrNKgaqIjvZQwfA2Ah5d3l/NPNP6xj9Jw6uXmGBjnyqwcElg9TrLxgoAdHMTiQwf66gAPhfGM
	u7a3JFPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2UxI-00000007DEl-2P94;
	Wed, 09 Apr 2025 12:55:00 +0000
Received: from mail-lj1-x244.google.com ([2a00:1450:4864:20::244])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2Uui-00000007Cot-43Pm
	for linux-arm-kernel@lists.infradead.org;
	Wed, 09 Apr 2025 12:52:22 +0000
Received: by mail-lj1-x244.google.com with SMTP id 38308e7fff4ca-30bfb6ab47cso61536991fa.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 09 Apr 2025 05:52:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744203139; x=1744807939; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vnbe48AO71vHxLIqa6wKoIQjII3SgOedEce7jQxnB1c=;
        b=G6V02pie2Kx3oXIrxgeyLu80CWbKq6VypAHEgSJq3VxRDsdI9MTx476/hUzuyW5nHo
         Zos1op//E0QwKPXLFAdiiVCSKmHW7InWVvYVXt2Yamp7nK+hIgpCyq8EOi6L/IU4ILMm
         3jSOrXZmfRxOe1sUwEdfCp/ZRA2+nsHz/r9RSDIqZClOnA4id347oSJrDL3iwZEEeW1i
         7wPzcyEnNxVd6FVNB+qPJHmUqQMQZauXciFuJiPcRtjr6jQNmSF6acTc6/9uSVNW96Al
         eZt0mXQqQMkPHQ41cw9etgjaQb/dFHz/c/GiHPQHBBQbhLIczHna9pYi/6MkdVYEazbi
         hj1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744203139; x=1744807939;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vnbe48AO71vHxLIqa6wKoIQjII3SgOedEce7jQxnB1c=;
        b=cjbSf2G23Zxv7JVaF/RQoAOMFaHrWZsmWpiHJuh7AvnDxu/dXo51sRHjuwGQHW6R9l
         W0jAGT2QpurPIHDaEm77ZCPEW98UA4oFFVZe2vhG9M6pcQlFHtKYsZO3dGFEXHAUJhsW
         3hd323TYBMMDyp1chAt1Va1NPmZwZo4J9ZxhAom7NAEeoYLbRoiqt3VRXhBDGWPkWLVf
         R2VU0/FZDd/F2uBijYNgR0xX9HYMJp62M5jb7CmVlBpz5lqwtzRM+D90/ak2w2viFAwa
         JS4mou4tzXC7s7vnkeYIRcNqadwXnV7qU9tkHlFFguFkTIGOlVSc/gKuvCa0rCL9b82W
         r3sA==
X-Forwarded-Encrypted: i=1; AJvYcCX3BQzrKN9WlDn32QFdIDdJNJaPh64oa8+EZ9qOWlm7oNTi3Y/TxfIRP7hk8AP+MyS5SsqoUd9oIFZC2YLHrCN3@lists.infradead.org
X-Gm-Message-State: AOJu0Yyqqyjb1cFjONKU+lFgKOAzQj3jwSNobu5Im6o7lhwuqpvIRtvG
	xRYqfmET6saWgFHCEpetdHZQeuV5E546AmJ02yO9S6FyRtNw5JPPFiVOcMzqEPowPwqRrcx2Mcn
	cR4wTJDxxHiig4QkxxKok8kRxSZo=
X-Gm-Gg: ASbGncuUYOdw/sh0jO06H9pPudYyDTBwK3p4kvmQ+a6Nzm3lvzM0OwCHAiEtIjDBMmG
	hebhPfBOyqDre0NiNYNg4gucGjDJgyPkELqHq41GJ1Pe/p8GWnToLf9i/lWWvph4OHaDJqpzFVU
	9WSJOEw3mVjWKEQtinV7YSdw==
X-Google-Smtp-Source: AGHT+IGdHNOtvdCerY9pg8Q3eWXZ6Xsli0U3CirBEEFOA4oaaLZ/9WuOnbKqs9UCWS6SuAwXiGwGa9XbIxRoeJv+6i8=
X-Received: by 2002:a05:651c:54f:b0:30d:e104:a942 with SMTP id
 38308e7fff4ca-30f45078046mr7055251fa.38.1744203138983; Wed, 09 Apr 2025
 05:52:18 -0700 (PDT)
MIME-Version: 1.0
References: <20250409124542.47166-1-bsdhenrymartin@gmail.com>
In-Reply-To: <20250409124542.47166-1-bsdhenrymartin@gmail.com>
From: henry martin <bsdhenrymartin@gmail.com>
Date: Wed, 9 Apr 2025 20:52:08 +0800
X-Gm-Features: ATxdqUHAqov07ZrNPtI7qo4io2YYdsdoXQrB8Z46RMN6AaIBAh08vSDcMkMStwY
Message-ID: <CAEnQdOoMBvm_T813t_1uuNsQxqro=zXwM6d2b=NOiihicUNHcg@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] cpufreq: scpi: Fix null-ptr-deref in scpi_cpufreq_get_rate()
To: sven@svenpeter.dev, j@jannau.net, alyssa@rosenzweig.io, neal@gompa.dev, 
	rafael@kernel.org, viresh.kumar@linaro.org
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250409_055221_003013_2D266F06 
X-CRM114-Status: GOOD (  18.42  )
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

Sorry for the noise - please disregard this patch as it was sent in error.

Henry Martin <bsdhenrymartin@gmail.com> =E4=BA=8E2025=E5=B9=B44=E6=9C=889=
=E6=97=A5=E5=91=A8=E4=B8=89 20:45=E5=86=99=E9=81=93=EF=BC=9A
>
> cpufreq_cpu_get_raw() can return NULL when the target CPU is not present
> in the policy->cpus mask. scpi_cpufreq_get_rate() does not check for
> this case, which results in a NULL pointer dereference.
>
> Fixes: 343a8d17fa8d ("cpufreq: scpi: remove arm_big_little dependency")
> Signed-off-by: Henry Martin <bsdhenrymartin@gmail.com>
> ---
> V1 -> V2: Use `if (unlikely(!policy))` instead of `if (!policy)`
>
>  drivers/cpufreq/scpi-cpufreq.c | 13 ++++++++++---
>  1 file changed, 10 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/cpufreq/scpi-cpufreq.c b/drivers/cpufreq/scpi-cpufre=
q.c
> index 17cda84f00df..dcbb0ae7dd47 100644
> --- a/drivers/cpufreq/scpi-cpufreq.c
> +++ b/drivers/cpufreq/scpi-cpufreq.c
> @@ -29,9 +29,16 @@ static struct scpi_ops *scpi_ops;
>
>  static unsigned int scpi_cpufreq_get_rate(unsigned int cpu)
>  {
> -       struct cpufreq_policy *policy =3D cpufreq_cpu_get_raw(cpu);
> -       struct scpi_data *priv =3D policy->driver_data;
> -       unsigned long rate =3D clk_get_rate(priv->clk);
> +       struct cpufreq_policy *policy;
> +       struct scpi_data *priv;
> +       unsigned long rate;
> +
> +       policy =3D cpufreq_cpu_get_raw(cpu);
> +       if (unlikely(!policy))
> +               return 0;
> +
> +       priv =3D policy->driver_data;
> +       rate =3D clk_get_rate(priv->clk);
>
>         return rate / 1000;
>  }
> --
> 2.34.1
>

