Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F32FE7717D
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Dec 2024 23:03:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZK4h9MVOu/9hHVaZl4zKkp7NLqwJGJJgqac6hR7MTzI=; b=Aml1i+PEOkKOjheEQtrPhX9poK
	Mf/IB4GwzWXoWBZCCYHW3JHEDPpaLaXEL4//nmNxiZy/sGo/e4dl4pXHT/+m0LjjvGp2nWyadshy5
	2bQx0uG8Ovz++Lp3PDfWt8u4T+kZNYe41G/RwzAqx5NGT5Z80eM4/1hFUMTWiAcygOtm6b7aDjzwo
	yui/DjdI3e46vt5kn2cDe1hGcm9PYxnxt1gADZ2Bceazt7YCDXqad3WscRbL2EfVKXAwnf5OcTtAm
	pZfbScV1aP+97LSPDk+9kZqrQxNWqR8zvIZHS376OGWAPgREvejRHiphSrp69YUK+ce6ah0A1aybL
	ZflmfvDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tKmmW-00000009V8r-2dql;
	Mon, 09 Dec 2024 23:03:13 +0000
Received: from mail-lj1-x22e.google.com ([2a00:1450:4864:20::22e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tKmlT-00000009Uyk-2my5
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Dec 2024 23:02:08 +0000
Received: by mail-lj1-x22e.google.com with SMTP id 38308e7fff4ca-30024c73101so41445381fa.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 09 Dec 2024 15:02:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733785325; x=1734390125; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ZK4h9MVOu/9hHVaZl4zKkp7NLqwJGJJgqac6hR7MTzI=;
        b=Axz1wHi16Ozl9QfmHPYKHtdPjQkxz1H6xZioOwFuAz7X3iq4sBHGOkJ2idD3YCncuQ
         3JxJ7eA3tNP+Xq4yHD9/ZE134chnsxBUoWmqGm9QKTa0G34WbbA7ThSCHCG8AFikYEBf
         47MqeMIGGxffOEmNz1mIYwVxDzReiJs9d2cqCSZfoSnP+HLKgxf83qKDH9YRpc52y30y
         odHmllMYuO48Aj18dWca8C3kVcWQYoOuTR3iLY7RADK51NhOPdAuWOGn+MOZiUDj83Pf
         OxipVjJf2HJYARIHIGvyGmrUIzwVcvixdldsOPJnSUbrkImprdKongwTwaGnzRWk3h+I
         9XKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733785325; x=1734390125;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZK4h9MVOu/9hHVaZl4zKkp7NLqwJGJJgqac6hR7MTzI=;
        b=IqTI+l4JcN+a24xBjkjdW1WQvf8zXANT1lvl1dETej/mWCQ0YIFpKiDMK4F+SYW43q
         LgaKNfhOmm7HrsBARX5GvTWLxk2nzH1qeql2FBR4j3lj42exU2nY7wF3PXkVxE3tmOuw
         jktXV37zugCKaNk6hMi1msyFKKz6e1VOgs4iamUju13YTKbCETzYehyTieH/gVKwxFqQ
         MQLrHgptROyaIecs27EKGOE6i0BLrMqkO5YJI8kadI03Uy1gEqMr9o7GdkTHKUBzHJ9i
         luevyrijMoobHgZAa2Anp4wG5b6DbKdLlomNKcqxB3fxdwrBVVHeanq13OO6RCrI9VgS
         s3WQ==
X-Forwarded-Encrypted: i=1; AJvYcCVTr84Xi/vL8SMZT832Kzm9RnfW264w6W2VMW5DFFtjI4x5csKpdPmde/GQ/EFqpSpzCk+MhPqPOrbZo9xKTgZr@lists.infradead.org
X-Gm-Message-State: AOJu0Yxz5B5xH9cQYZOLGBLurBmezcItDZBAQayj8dWzeZuIOwV7wwZe
	QyPZUTJb4MBxrDec2QtO9suEr0fcfUsPhm1DhESot7lBlQvc3/biFgtJe/fxVp4=
X-Gm-Gg: ASbGncveDsiVJ5j98FbgQLX/MMLHB0tlS092OnHMj6/PnxSyN8RlH0BduChUWlk3IBs
	B3zCtnEsThpOlqq+VZPyLtVZpEQ7zPtHTQbZcEK87mv2jXHf8I2CuhkCObdoz/A91eYnAiHYA/2
	on6nGGlkpciiMUYumWpYtNsBQGFhJDKe+oR9+96Uu0wXzw3sxSLi/3YP9/QSzUzMH/Wcn00RHrY
	6xZ0RpV4iK3He6/ab/HDoMVqRBa28+A7GwWxbM3RBdTHytPS394yXyqsUjESTupwWlbgidF1iU7
	PpKWyJyUREGZcOfrPD1Fa8QqV320ZaTs4w==
X-Google-Smtp-Source: AGHT+IGnzZ2PJOWGOC6WltKgaOFUzxo3aZDddEYLzVRS44dM7WNYY9fUmV4e2qc5kDuxOcyc0FX6/Q==
X-Received: by 2002:a2e:be0b:0:b0:2ff:b8f5:5a17 with SMTP id 38308e7fff4ca-3023282c1femr3802651fa.5.1733785325460;
        Mon, 09 Dec 2024 15:02:05 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-30038ce97b4sm10022871fa.118.2024.12.09.15.02.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Dec 2024 15:02:04 -0800 (PST)
Date: Tue, 10 Dec 2024 01:02:01 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Douglas Anderson <dianders@chromium.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	Julius Werner <jwerner@chromium.org>, Jeffrey Hugo <quic_jhugo@quicinc.com>, 
	Roxana Bradescu <roxabee@google.com>, bjorn.andersson@oss.qualcomm.com, 
	linux-arm-kernel@lists.infradead.org, Trilok Soni <quic_tsoni@quicinc.com>, 
	linux-arm-msm@vger.kernel.org, Anshuman Khandual <anshuman.khandual@arm.com>, 
	Besar Wicaksono <bwicaksono@nvidia.com>, D Scott Phillips <scott@os.amperecomputing.com>, 
	Easwar Hariharan <eahariha@linux.microsoft.com>, Oliver Upton <oliver.upton@linux.dev>, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/6] arm64: cputype: Add QCOM_CPU_PART_KRYO_3XX_GOLD
Message-ID: <k64saaxnipegp4ot636apzewrs7dz2j7xdpqxg6iotbaderuia@hxqf63bwwztf>
References: <20241209174430.2904353-1-dianders@chromium.org>
 <20241209094310.3.I18e0288742871393228249a768e5d56ea65d93dc@changeid>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241209094310.3.I18e0288742871393228249a768e5d56ea65d93dc@changeid>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241209_150207_709495_B1DBEE24 
X-CRM114-Status: GOOD (  17.30  )
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

On Mon, Dec 09, 2024 at 09:43:13AM -0800, Douglas Anderson wrote:
> Add a definition for the Qualcomm Kryo 300-series Gold cores.
> 
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> ---
> I have no idea if this is actually right and no way to test it, but it
> fits the pattern of the other definitions. Someone from Qualcomm ought
> to confirm this.

This matches what I see on SDM845.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


> 
>  arch/arm64/include/asm/cputype.h | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/arch/arm64/include/asm/cputype.h b/arch/arm64/include/asm/cputype.h
> index 488f8e751349..c8058f91a5bd 100644
> --- a/arch/arm64/include/asm/cputype.h
> +++ b/arch/arm64/include/asm/cputype.h
> @@ -119,6 +119,7 @@
>  #define QCOM_CPU_PART_KRYO		0x200
>  #define QCOM_CPU_PART_KRYO_2XX_GOLD	0x800
>  #define QCOM_CPU_PART_KRYO_2XX_SILVER	0x801
> +#define QCOM_CPU_PART_KRYO_3XX_GOLD	0x802
>  #define QCOM_CPU_PART_KRYO_3XX_SILVER	0x803
>  #define QCOM_CPU_PART_KRYO_4XX_GOLD	0x804
>  #define QCOM_CPU_PART_KRYO_4XX_SILVER	0x805
> @@ -195,6 +196,7 @@
>  #define MIDR_QCOM_KRYO MIDR_CPU_MODEL(ARM_CPU_IMP_QCOM, QCOM_CPU_PART_KRYO)
>  #define MIDR_QCOM_KRYO_2XX_GOLD MIDR_CPU_MODEL(ARM_CPU_IMP_QCOM, QCOM_CPU_PART_KRYO_2XX_GOLD)
>  #define MIDR_QCOM_KRYO_2XX_SILVER MIDR_CPU_MODEL(ARM_CPU_IMP_QCOM, QCOM_CPU_PART_KRYO_2XX_SILVER)
> +#define MIDR_QCOM_KRYO_3XX_GOLD MIDR_CPU_MODEL(ARM_CPU_IMP_QCOM, QCOM_CPU_PART_KRYO_3XX_GOLD)
>  #define MIDR_QCOM_KRYO_3XX_SILVER MIDR_CPU_MODEL(ARM_CPU_IMP_QCOM, QCOM_CPU_PART_KRYO_3XX_SILVER)
>  #define MIDR_QCOM_KRYO_4XX_GOLD MIDR_CPU_MODEL(ARM_CPU_IMP_QCOM, QCOM_CPU_PART_KRYO_4XX_GOLD)
>  #define MIDR_QCOM_KRYO_4XX_SILVER MIDR_CPU_MODEL(ARM_CPU_IMP_QCOM, QCOM_CPU_PART_KRYO_4XX_SILVER)
> -- 
> 2.47.0.338.g60cca15819-goog
> 

-- 
With best wishes
Dmitry

