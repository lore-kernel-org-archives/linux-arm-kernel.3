Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5749CC77B7C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Jun 2025 22:56:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iGoGv4M1C+MnsxklP51gvZiEaBlAZhHG8aX3l/ONSWk=; b=pX9xA54lC38642p5CQ8tZK8Jv+
	Cng3NDW8hQoiKhioYGW7aBNON1D0PFTs9un4d9nBY5UT3I6Ds1sAP+VUQzylWQWUhKU1q1fK9PxUL
	gFjjDGgRFswan1X5XXTiloBsHhrJy6BXG7ldLKTRmjsvf11ksIw/RmO7BuQrX7lyGiQ7rMdNoYn2t
	YjUn3yud5/dt+Era8H6mV3/wfnnFcYdsqtVPMtCYTY6a8up7q8pZY4k8hAJGVx5lY1i9Qwdqsms0q
	TumTxJ2HjFe5Supa34w6JO5pEg5BWPccbwk9UXd3338lJV+zm+Mgx4hbE1oJS64niP8t0UXKa/Gdj
	Jr8Q/IWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUZ2r-0000000A87i-2pVD;
	Wed, 25 Jun 2025 22:56:45 +0000
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUYtg-0000000A6JZ-22Av
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Jun 2025 22:47:17 +0000
Received: by mail-ed1-x52c.google.com with SMTP id 4fb4d7f45d1cf-6097b404f58so598079a12.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 25 Jun 2025 15:47:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1750891630; x=1751496430; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iGoGv4M1C+MnsxklP51gvZiEaBlAZhHG8aX3l/ONSWk=;
        b=CCoKVzssy7HTmtZuG7qAXj0BpA6N6R2Oz21hr67EGLp7Ngj6A2R53CU37FhTcmtBZ1
         mzgTKVDNz5C7QWeApfyjFEuOCuT7wD+dOkS/otlvbmRmoxEyZk9P3PZiop7iwKj+QHnY
         IasR5BszWlzmNyegOaXaqxyjib345dzKl3XXg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750891630; x=1751496430;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iGoGv4M1C+MnsxklP51gvZiEaBlAZhHG8aX3l/ONSWk=;
        b=wGZSNMfzOal8FgpfJiSpUcfP4dK1TvL5tPxmBhH4dOd9QjYhtz5K7BT+J3NcnC3Wnw
         p6eNifixVRsBQhx49mQyecloBAQj861BFn1raQJuNJPDMQYYBnwgTZ4Bo7dEg55fEZQJ
         XbC/tFin1ZEXAsgfHG3bvaqaVn+7A2RPEuS1IUC+VZ7JKU9+wKqcbzwEsZaTIpZiTHeV
         hFLoy9BLi+taSxSyXgtbWtzHLngQ9kAnbt13CtdCXiIYzclBAhDbNAQ2p7Fc06NmKQlr
         a+BeMUBM/8R1hvFnSC3A+lZ9NUJl6L0VQ7KsoRDyYZWrhzKbIhmxnFtNMoOLmuJ/zOYQ
         ZnmQ==
X-Forwarded-Encrypted: i=1; AJvYcCUwCiQrSkqaCtHIs4sJmPdBEsS3TXF+F7bhZ3iI2SIx1nSUe+/qJi1X59/7yIoBhPFbJ7B7feo52SSUB8nF2wRy@lists.infradead.org
X-Gm-Message-State: AOJu0YzY8qIZ31hgF0j7Nt2BTHZEE/KwjiJk6x2KxsErlJKY/M8NACQH
	z47Gmw4X51bcfnFR+DdTDR6qt9iUix0nEiSNXcGRuPxEPRqEMSOBxfvZSl9izi5iYRFI50TjZxJ
	AOuq0qg==
X-Gm-Gg: ASbGnctP641mW5F9L4lApNmFZg9HS+5UPl2YS4llaKQ79kCRR/M2iUNXS9NCWuvDXr1
	rEVgdT41sagRrrELYJLWQFMANigxpIDUAbid9IxHdG7YsNzZoQnwaQ2ejAYVXcxDc+YFsedB/c2
	+vrGy7EPZ20ytS774qnt35+qZq/+k/U6HGCZithnP+zxkznQTxOjIg1L4KIgwcHBKKmPBv8CxWP
	syYE0eyS0oUQ7G0R9cdtSKPVA/V5fYcoImnkh5YiTAyN1tK+EJpf5IXbswmNaEG6tFuCOCrc0jd
	7SEpkOC3yCQ9qmZZrgeFldkVisj5BAyVGyQ5CldbKD6TMC0xi1Y2hY7xu7qf5vqFGFcVdBNnG88
	eAegmjyKdqbzetIRFf8DIshXTFBAjXL/v1Rzf
X-Google-Smtp-Source: AGHT+IGr2dvp7gQEjQigUU89g4dCgqrPQx7i0sSu30spLfrNB/u2OlkihGQ0U872wp1sTair0OaqYA==
X-Received: by 2002:a05:6402:4314:b0:60c:4521:aa84 with SMTP id 4fb4d7f45d1cf-60c4dbfc190mr4248460a12.15.1750891630384;
        Wed, 25 Jun 2025 15:47:10 -0700 (PDT)
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com. [209.85.218.52])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-60c2f196f84sm3046272a12.14.2025.06.25.15.47.00
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Jun 2025 15:47:00 -0700 (PDT)
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-ae0bde4d5c9so76473666b.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 25 Jun 2025 15:47:00 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVL7LA86acZRHAMw4kobLPPBRQpprFhtNqCs3jlsHXNwBg/Z4nKdgWWkHex2lnI0VFBKGQo6SstzQ1tQL7TJi1x@lists.infradead.org
X-Received: by 2002:a17:907:3cd6:b0:ae0:5fbf:7de0 with SMTP id
 a640c23a62f3a-ae0be9da16fmr463188266b.36.1750891619817; Wed, 25 Jun 2025
 15:46:59 -0700 (PDT)
MIME-Version: 1.0
References: <20250619114805.16968-1-yangyicong@huawei.com> <20250619114805.16968-3-yangyicong@huawei.com>
In-Reply-To: <20250619114805.16968-3-yangyicong@huawei.com>
From: Doug Anderson <dianders@chromium.org>
Date: Wed, 25 Jun 2025 15:46:44 -0700
X-Gmail-Original-Message-ID: <CAD=FV=VtgsV6JOFrcT30duCbJT5hsY=WX2sjbejhkD9CS_o95w@mail.gmail.com>
X-Gm-Features: Ac12FXwpoeRdpVl5yGax8DcHEQYqw-9sHO7NkrK7Za_mNNH5Sqr3K1ZMLW7Xg4o
Message-ID: <CAD=FV=VtgsV6JOFrcT30duCbJT5hsY=WX2sjbejhkD9CS_o95w@mail.gmail.com>
Subject: Re: [RESEND PATCH v2 2/2] arm64/watchdog_hld: Add a cpufreq notifier
 for update watchdog thresh
To: Yicong Yang <yangyicong@huawei.com>
Cc: catalin.marinas@arm.com, will@kernel.org, akpm@linux-foundation.org, 
	sumit.garg@linaro.org, kernelfans@gmail.com, lecopzer.chen@mediatek.com, 
	tglx@linutronix.de, song@kernel.org, linux-arm-kernel@lists.infradead.org, 
	jonathan.cameron@huawei.com, zhanjie9@hisilicon.com, prime.zeng@hisilicon.com, 
	yangyicong@hisilicon.com, linuxarm@huawei.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250625_154716_557590_DFE84D3F 
X-CRM114-Status: GOOD (  15.07  )
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

Hi,

On Thu, Jun 19, 2025 at 4:48=E2=80=AFAM Yicong Yang <yangyicong@huawei.com>=
 wrote:
>
> From: Yicong Yang <yangyicong@hisilicon.com>
>
> arm64 depends on the cpufreq driver to gain the maximum cpu frequency
> to convert the watchdog_thresh to perf event period. cpufreq drivers
> like cppc_cpufreq will be initialized lately after the initializing of
> the hard lockup detector so just use a safe cpufreq which will be
> inaccurency. Use a cpufreq notifier to adjust the event's period to
> a more accurate one.
>
> Signed-off-by: Yicong Yang <yangyicong@hisilicon.com>
> ---
>  arch/arm64/kernel/watchdog_hld.c | 58 ++++++++++++++++++++++++++++++++
>  1 file changed, 58 insertions(+)

I haven't had time to go through carefully and look for every possible
race condition. ...but at least this does attempt to get a bit safer
than v1 was. I also agree that it seems hard to believe this could
make things worse than not having this patch. Thus, I'm OK with:

Reviewed-by: Douglas Anderson <dianders@chromium.org>

