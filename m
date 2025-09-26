Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 934B2CAC5AE
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 26 Sep 2025 14:03:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FAQFz5KzQ5PJDFpmxMd37ypf2wb4q8c+gi1YbDBNReA=; b=Q1aFLDNGqvnulSmw530wN6cbYd
	TwOs3GAGWu/lJ2uuCxNBrtIuxGy77ZMxFe6FKPqeqbBSscNrYRJpkxQ/pxSoEuL6m7ASlXV6yzU12
	dUWwvS+8Ioj4qyP5A4P8lHaNgpBkPD1lgGsEmA/MatVhYGf3+A1/hCYF/UvRFecZ3HpVOK9XKLP+B
	gWblXzWS+BUErUVtza/N5Qilljn1QcVfui8uD9ad9rxPxiG10V8r7hSBSmb7jbRvahEbjTz/0JoGg
	j+klT/SXrcwJd2J9YsEsm9HQZ70SXXAcMYjrOe6MyOk52wdANuE+GsDUTcBbvkLNrcCQpIyjuZ5fj
	tKzIA8Tg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v292N-00000001neO-1afL;
	Fri, 26 Sep 2025 14:03:03 +0000
Received: from mail-pf1-x42d.google.com ([2607:f8b0:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v292E-00000001nVy-1oTO
	for linux-arm-kernel@lists.infradead.org;
	Fri, 26 Sep 2025 14:02:55 +0000
Received: by mail-pf1-x42d.google.com with SMTP id d2e1a72fcca58-77f68fae1a8so3075827b3a.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 26 Sep 2025 07:02:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1758895373; x=1759500173; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=FAQFz5KzQ5PJDFpmxMd37ypf2wb4q8c+gi1YbDBNReA=;
        b=Cehx/8Iw0+d3n9fQTxFK55apOwNjbGGG5mqPgtTuN8Z7e8gzfq5/EuS9wrdnaWrxrf
         ZoaC3e+4fgualqVD6h+/w2QykXcNfz9DgE+Y9lFe/y+ICHxYVIlODt4wKrtjORQouFuC
         SfDttFt64vNE6aEAYxqm1Y6L1POO4AkvU0OPPesr5z82M+QOtNX1h+KgO2nvrERyTCA7
         nR7k5O/gz8Xz/K0X3XCNJJMh3YdOdXZFO3nFh1mYbQhjHSOEm53hCefAmsvBCIzX90eI
         CFXgrl7birrb8NuxcUKZlrj1geeq8pt+SnqMoIunzQhh5xE/VfoWXOcWsGCpedV+8KXd
         oPqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758895373; x=1759500173;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FAQFz5KzQ5PJDFpmxMd37ypf2wb4q8c+gi1YbDBNReA=;
        b=g4jsSFcYQYBw6vmHVbqiuh1PkML2pSdAcn9T2+iAOc2ZZ3fYs4otHwvNdGv23Omjl2
         2KWVFHFTHcFHpdLIM3pI3MFw67eLAAgydrFuCoutG7psACFy+Tlu/cR2eHj6NqW0RAc/
         VEZeSXt4y8D3VhrHi2TnHKRqNJcoZOo/SltW/D7DCHOb96uW0pxnV0I1KcAV82A5q9KE
         n/zgw/onLQC4A//d2Sv7uVqAR5N/fl7Jnje+hxpYdPxgcJzTjSh5rd+IZZFE+fzPnDM3
         YBuG2ZAecCo/itKTtEb8rm5qNO0NOt0SpIuCzw14HGV25ObNOW96JrpMr4vknd0KzDN2
         eoLg==
X-Forwarded-Encrypted: i=1; AJvYcCV3eZUjjTuV12oqIWIKm+drs+KbFLyQ4Poi5jJ4tgfhMg8fIIYpw39yfTWikGTVwJ6jLYnMgi9HXkRHjOdbziCU@lists.infradead.org
X-Gm-Message-State: AOJu0Yyx8DnOaIdJSfOc3SjWtaHOIN515kWmYJB4Zsk8175r2gop2iRh
	PP5OQT5GirQo6oCXZsMgTTZyI8zsn2NCRxqzVC3NdOab6SOE3SkmYHWZ4EmQHKxAY7SEQKzgQLV
	QRDKS7QetL4F0xl589KUgMg2MUdhg2KLOPx7r7tz9bQ==
X-Gm-Gg: ASbGncuFuDEQ88r/tNjvgxCWnnJYu/bfpbWnCJzpxHtq5PEtwHOzmRhpj+2zCviiYGh
	+kT/0GN+2paipN+rLO/NSnTJev1Gk8Z7CaLNJbc3KT1xkk0iiEMTCIs03wPKpD2Tb4DAOEiwOUa
	+Em5bWAr1Kg/jrQv9VG5wITWdcnAlX5QSrKgl5DFNiO40o/wz8fV0895Qi8QP5fDOSXWaZV5Trj
	mqB7fHr
X-Google-Smtp-Source: AGHT+IFz6AI7lpE5Q8kgnAqtCZAxYnmhG/Rvd7Wo9Nq9LiN4mzX6xr07OsoVvbyMiYwIlavJn8NpCdDVr0w8GwFvOQA=
X-Received: by 2002:a05:6a00:189a:b0:776:20c2:d58b with SMTP id
 d2e1a72fcca58-780fced5d67mr9642567b3a.24.1758895373218; Fri, 26 Sep 2025
 07:02:53 -0700 (PDT)
MIME-Version: 1.0
References: <20250915-arm_coresight_power_management_fix-v3-0-ea49e91124ec@arm.com>
 <20250915-arm_coresight_power_management_fix-v3-4-ea49e91124ec@arm.com>
In-Reply-To: <20250915-arm_coresight_power_management_fix-v3-4-ea49e91124ec@arm.com>
From: Mike Leach <mike.leach@linaro.org>
Date: Fri, 26 Sep 2025 15:02:41 +0100
X-Gm-Features: AS18NWBe4V8nLEoUoypK6jQgD9k-iP_QbmBBzaexAk56LLbPgca2pL60e12kz6Q
Message-ID: <CAJ9a7Vg2OcN9LKZRP4GAu9YE4Kvj99Ti+=QWneZCjNE1s+D=DA@mail.gmail.com>
Subject: Re: [PATCH v3 04/31] coresight: etm4x: Correct polling IDLE bit
To: Leo Yan <leo.yan@arm.com>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>, James Clark <james.clark@linaro.org>, 
	Yeoreum Yun <yeoreum.yun@arm.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Yabin Cui <yabinc@google.com>, 
	Keita Morisaki <keyz@google.com>, Yuanfang Zhang <quic_yuanfang@quicinc.com>, coresight@lists.linaro.org, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250926_070254_477785_6196484F 
X-CRM114-Status: GOOD (  18.44  )
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

On Mon, 15 Sept 2025 at 11:33, Leo Yan <leo.yan@arm.com> wrote:
>
> Since commit 4ff6039ffb79 ("coresight-etm4x: add isb() before reading
> the TRCSTATR"), the code has incorrectly been polling the PMSTABLE bit
> instead of the IDLE bit.
>
> This commit corrects the typo.
>
> Fixes: 4ff6039ffb79 ("coresight-etm4x: add isb() before reading the TRCSTATR")
> Reviewed-by: Yeoreum Yun <yeoreum.yun@arm.com>
> Signed-off-by: Leo Yan <leo.yan@arm.com>
> ---
>  drivers/hwtracing/coresight/coresight-etm4x-core.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/hwtracing/coresight/coresight-etm4x-core.c b/drivers/hwtracing/coresight/coresight-etm4x-core.c
> index 02ad41da7356547a67c53ff0a9146aec844f89da..382ec1a1cdd035e76d451d0112afd3f029ecbdb6 100644
> --- a/drivers/hwtracing/coresight/coresight-etm4x-core.c
> +++ b/drivers/hwtracing/coresight/coresight-etm4x-core.c
> @@ -1926,7 +1926,7 @@ static int __etm4_cpu_save(struct etmv4_drvdata *drvdata)
>                 state->trcpdcr = etm4x_read32(csa, TRCPDCR);
>
>         /* wait for TRCSTATR.IDLE to go up */
> -       if (etm4x_wait_status(csa, TRCSTATR_PMSTABLE_BIT, 1)) {
> +       if (etm4x_wait_status(csa, TRCSTATR_IDLE_BIT, 1)) {
>                 dev_err(etm_dev,
>                         "timeout while waiting for Idle Trace Status\n");
>                 etm4_os_unlock(drvdata);
>
> --
> 2.34.1
>

Reviewed-by: Mike Leach <mike.leach@linaro.org>

--
Mike Leach
Principal Engineer, ARM Ltd.
Manchester Design Centre. UK

