Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4742FCA1002
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  4 Sep 2025 04:54:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Npc2kRdoiAQT8Oq6xsDbKE8d7v4q00xjFvwRzwJUB5g=; b=p6Kbsvvj806xkusrSwwlaCbK/w
	PmagiyzAnyrO2fdMmPuurOMAKZPbnpjk/KnhVV4qfxVJNFMaRPkeHpKy9udb/1mbpVAgwNfXN7Z90
	kNecF0+d4r0EdTrFnyY/kXqU/IZ/Nog8fy+jBIMXs/hz/vxq9yDGrnY/kf0yyVqSfDtA8RRNNCyaJ
	n1orDZdqG1sooI0fB382nto18rAuWUv66EcZ5NuLFk5JqWwPLOpN59gEGcTt1H+kwBClXTjv6Sazm
	eyHW5HLeCRnHdSJYntnj6MkMAxofgg71b9ONtpU/sVeYRaClke067iSDv9+TVkilouUlXUfHtM8P7
	v6SxTgSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uu1yx-0000000969W-2JLc;
	Thu, 04 Sep 2025 04:53:59 +0000
Received: from mail-pg1-x534.google.com ([2607:f8b0:4864:20::534])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uu1wE-000000095FO-3e3w
	for linux-arm-kernel@lists.infradead.org;
	Thu, 04 Sep 2025 04:51:12 +0000
Received: by mail-pg1-x534.google.com with SMTP id 41be03b00d2f7-b4c3d8bd21eso355454a12.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 03 Sep 2025 21:51:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1756961470; x=1757566270; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Npc2kRdoiAQT8Oq6xsDbKE8d7v4q00xjFvwRzwJUB5g=;
        b=H+BiOpmSzq7EiPFvxaAjaMhPUzfYzxW5ORNmhUQRzIarr/DJ+D7HpIhYQX8QKRdKyp
         6zaxclZbqJmY4uM2y/x5L7Q6PolIxgjKaNXflnwZL35vOTLewPQn+dh2TwjleL/g10tN
         OXm+F5Zj6qsNn4ZtRXWwtv9zhQqdF0HXoBsAjfhsnQowjJmA3R8DNY7fBuuYoVULwJUq
         LyBnxUzFy4VVJF542298dg3XiSOXUUtLiUxrKI7wRQUWAXFBTiHKPyqFferPzdr+Nuv2
         vsJM4wgHEDi9CUsi7DTM94NHOF9zU9OQoDR5/K7nLu/s9K9JAG8Wy0aIOZ/7Jl0fY9la
         njew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756961470; x=1757566270;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Npc2kRdoiAQT8Oq6xsDbKE8d7v4q00xjFvwRzwJUB5g=;
        b=sm5BGs//FH/Mtv5VRUpHUiLbdmfyG8/U0Ha6s0QxZ4j4rjhXRZPkGdFq+iQZmiORs4
         pZTFQeM8o7IOJzR9ncD2nwxlDGhYkCv0A9dsEuWzWbpxoIgE3u+Iu6/6cnC83JiC8VH9
         enkUG7Tjtsq8qt7LOktHjmemgjYx/Ra/pDFyOgZKPJrjFY+j06so6CMF1DVPLZaC9oZd
         8QVLUFH9IxLp5ZEpTkX8jyhcsbrD6dgvwkVAlK1vH/6i2vpQLT2VPvpczTPZChSZoMRC
         5CYyi/kzV5DaY6VcdbxRYlUxRc8r+W6zRTcVVolxs2SW2UZPaP0OVnb6AHPQb8eGGDfE
         JwqQ==
X-Forwarded-Encrypted: i=1; AJvYcCU3JogLbh36i55LKeHzvakwMLFxJieHpDs7bz/aNxJBQhVZGUZq809/7i7FhYx0NmvJSIZqycSr/0D9Q40+vqBX@lists.infradead.org
X-Gm-Message-State: AOJu0YwfvRITiEhofweTZGQd44jisSS8hg65eWrI/36sPN4BQOR02Jlb
	Ex40fQ8F6P/Db2+gUaCOixacuszois6AyNfqRlVGvigkkUvjbcnAjiSyoJ1oSmeRQkI=
X-Gm-Gg: ASbGncum2EueSuvqDMY0W0OU/T11DrGv2H14PaxsYPoTr9GuMB0m4vnzuKNropSMOOU
	YOm36S/A8uWxmq/gDwllRrCfsnb/oo5vGKbM5hTKMhZNvfbNsz/LjSviuIt3Z3jKwUjL+bdDf+i
	ZBXUrlXU5CQyUOCbsIVVXvEDv691ftJfdw6RmNZqiO1SaGTfjHrI4erphXytxSvkmtn5Zi5e5s1
	70QX/88rsM1iqE4tRAHjta6OYBPl/Ep9M6e9S/mDgUtgGYIcfdxthckoJ558V4O31Dy9fy3JR9M
	ffGGjVm+rHqcQCRvVp5BncEDUYUJEOvXeqn6L0B868uRPgPDVijRLGmUWSPiCUJ+XTJAM3MVPFP
	N3ZgfDuSz0pbCtzpR7fmaA75Xi5NF6ZRwYEE=
X-Google-Smtp-Source: AGHT+IE8fhkKtW59L/QwQVMzIGYIlMT+Sa1j2ECntDz+uUUuSYYnswDb8stymALrifXH0JUgm5Q2WA==
X-Received: by 2002:a17:902:d501:b0:245:f1bb:9bf9 with SMTP id d9443c01a7336-24944870959mr275858785ad.12.1756961469626;
        Wed, 03 Sep 2025 21:51:09 -0700 (PDT)
Received: from localhost ([122.172.87.183])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2490648c89bsm177058085ad.109.2025.09.03.21.51.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Sep 2025 21:51:08 -0700 (PDT)
Date: Thu, 4 Sep 2025 10:21:07 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Liao Yuanhong <liaoyuanhong@vivo.com>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	"open list:CPU FREQUENCY SCALING FRAMEWORK" <linux-pm@vger.kernel.org>,
	open list <linux-kernel@vger.kernel.org>,
	"moderated list:ARM/Mediatek SoC support:Keyword:mediatek" <linux-arm-kernel@lists.infradead.org>,
	"moderated list:ARM/Mediatek SoC support:Keyword:mediatek" <linux-mediatek@lists.infradead.org>
Subject: Re: [PATCH] cpufreq: mediatek: avoid redundant conditions
Message-ID: <20250904045107.rweiwjv3glbehuwb@vireshk-i7>
References: <20250903121228.385766-1-liaoyuanhong@vivo.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250903121228.385766-1-liaoyuanhong@vivo.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250903_215110_914904_C6E61A66 
X-CRM114-Status: GOOD (  16.84  )
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

On 03-09-25, 20:12, Liao Yuanhong wrote:
> While 'if (i <= 0) ... else if (i > 0) ...' is technically equivalent to
> 'if (i <= 0) ... else ...', the latter is vastly easier to read because
> it avoids writing out a condition that is unnecessary. Let's drop such
> unnecessary conditions.
> 
> Signed-off-by: Liao Yuanhong <liaoyuanhong@vivo.com>
> ---
>  drivers/cpufreq/mediatek-cpufreq.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/cpufreq/mediatek-cpufreq.c b/drivers/cpufreq/mediatek-cpufreq.c
> index fae062a6431f..00de1166188a 100644
> --- a/drivers/cpufreq/mediatek-cpufreq.c
> +++ b/drivers/cpufreq/mediatek-cpufreq.c
> @@ -123,7 +123,7 @@ static int mtk_cpufreq_voltage_tracking(struct mtk_cpu_dvfs_info *info,
>  						      soc_data->sram_max_volt);
>  				return ret;
>  			}
> -		} else if (pre_vproc > new_vproc) {
> +		} else {
>  			vproc = max(new_vproc,
>  				    pre_vsram - soc_data->max_volt_shift);
>  			ret = regulator_set_voltage(proc_reg, vproc,

Applied. Thanks.

-- 
viresh

