Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 825B1CAC5B9
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 25 Sep 2025 20:00:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HAdEQBdz9dDV+qB/r+6Q6b9tiykVbAuQh1lcreO6d6U=; b=kWH73lKGwMCYHvng8WtErFpSfC
	+SXmdTEcNFKMBSRiPgJcA2cCgpIJ58S9S/fkE+Z/egpJ2jJCFwuUsky6GMpuBf9idWEZwKXK3t25f
	zbFCDia9G30/ECTJyKkQkNwrlI7JkjRdMMJVJxCZ15fD2GMjs43cEwnwbKLQ3tZwOVO3Hql4o7M+J
	qlNRXpz2ja0gcSkj93x/V+dEgvCJ0mlwFKbBFGq1ylGE9kcmpuJ87gxipQJdkuL9l0Rsuf5X46Ke7
	8do1bxJYsnNFR3zw4K4nHnP2QNrKvX07p7+Z0UYVzqkggD7yLE2W8aNcV4aQeepc5TAin7SjxRMJE
	aifR9AUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1s8C-0000000CWO5-0sLG;
	Thu, 25 Sep 2025 19:59:56 +0000
Received: from mail-pg1-x534.google.com ([2607:f8b0:4864:20::534])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1s85-0000000CWHm-2fe2
	for linux-arm-kernel@lists.infradead.org;
	Thu, 25 Sep 2025 19:59:50 +0000
Received: by mail-pg1-x534.google.com with SMTP id 41be03b00d2f7-b5579235200so1024381a12.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 25 Sep 2025 12:59:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1758830389; x=1759435189; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HAdEQBdz9dDV+qB/r+6Q6b9tiykVbAuQh1lcreO6d6U=;
        b=WQl5DVsvhqy4tCPxpPT97/AY6+ZmZJOXWfJJuQM9v4Z/xrx2fUZyDLLGiFEzQAx3Tu
         xOiypvAifwphm5M5OQnRml3sto8NJ0NBR3qs3RNKv8j0mZ5FsvjN+zKZ1ZAxWb93VTR6
         v0oke7NQnmmXpDdK68qgsRCsRkCnNSN8gxTDE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758830389; x=1759435189;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HAdEQBdz9dDV+qB/r+6Q6b9tiykVbAuQh1lcreO6d6U=;
        b=DEGdfZr48ENDMO81rh/hgJ7FQLQ/lG6eQCGtHoWVKTwI+I5pbxEtYBFXXQJ1U2B5Zu
         ttGqJFskk7Cvqkq5URX8z+p0Pt/llWD8gg1uDPCRR/xzjg40cCgltfQj7K3ca0TGUKdU
         NMi9z1GzF5WAABoFV+v8/yUR7AyeByj77wS5R0JKA3a+orMTpEKzBgC+T1GLMlzAifRy
         tRn+PFqivaZQ22J0qzkN573DCwWqKC8UwFyJ+3sIOIDQT4SdZrDletjPRwe+71myqaEx
         egtlrqP/9suIyvgpMchAPXrhD4N8rgn825V4zuFHNU43RMFeqgMyNFWgUz2250x31/nA
         17CA==
X-Forwarded-Encrypted: i=1; AJvYcCVmgLd2xgNoI8pXIkZTsh82MqvRZ82kut/HDTOseJcJzBlawl4MDRZ61/PG95wpMqm9UlrLBirQbqJ+EXfotOyE@lists.infradead.org
X-Gm-Message-State: AOJu0YybrW/lMf4+juUdnn/mSYx7nmPWsXmhiPm+9IjdaNECyFNnT3lH
	cT6NOWi3P2stHQpB5P98V4cznJhEu6pjrftO+3HCqp8fzxVjwJ570aNaFQDROcqYIlvHb66dZ+i
	YfI4=
X-Gm-Gg: ASbGnct6aTHDB4WT7pjV+hF+DF7iEDJOapyvElCWeLcQXSxkQM0INM5O+kFs2RmPPao
	OOpzZ+YEe2viVGdOZBWvBuCUyc54w8anmyuu5SpX1fu7oKlotwqnwXkcSGXMkpGJEF1DVbqouGy
	ymHGH+RlqyszAadHqbwmTABdQ2oPdYCFptjOHllLvtrV6U7lw7g9btt2qTSgw86K4pcwmqx07Kb
	nPNkO5wT6Z+3DvPE8vHVCwEQA/WTwCF43qk+q6FRlMZPNLeGbZ63+4WwvXfqYQMslGG9ofwzvUy
	+E/8ZWxo2eVKkrPVqPG4CDMom++wSftEZSlR5mgJN/ZIAT0+2EE8MzjPKza2XTs2Q3DOuhxS529
	G65mya2Gtt2EDxAVhE5bPN3XWMGzqB9cMPnhZNEcITEIAZK98qKiJJqMtIX77oV5udQ==
X-Google-Smtp-Source: AGHT+IFMA5K8mgxmNfCFQaRrGzX8mmrZud3qorknuk4G8KWWkMSTa7VlRu18HZYIDHU+VpmkrzCYAg==
X-Received: by 2002:a17:902:e5cf:b0:24c:d6c6:c656 with SMTP id d9443c01a7336-27ed49ba31fmr50543345ad.4.1758830388936;
        Thu, 25 Sep 2025 12:59:48 -0700 (PDT)
Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com. [209.85.215.177])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-27ed6ab6547sm33262635ad.129.2025.09.25.12.59.48
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 25 Sep 2025 12:59:48 -0700 (PDT)
Received: by mail-pg1-f177.google.com with SMTP id 41be03b00d2f7-b5579235200so1024371a12.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 25 Sep 2025 12:59:48 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUabf9HWdDkd/Z8/v1RBe/sPooBOHNif8mizzyBTV2AZ6ujn/bSUrkAdUlE1/p5ndWr5G26CPy8SHjpB/B3Q8zK@lists.infradead.org
X-Received: by 2002:a17:902:ec8b:b0:26a:f6e6:ef4f with SMTP id
 d9443c01a7336-27ed4a78d67mr40499335ad.60.1758830387808; Thu, 25 Sep 2025
 12:59:47 -0700 (PDT)
MIME-Version: 1.0
References: <20250925084806.89715-1-cuiyunhui@bytedance.com> <20250925084806.89715-3-cuiyunhui@bytedance.com>
In-Reply-To: <20250925084806.89715-3-cuiyunhui@bytedance.com>
From: Doug Anderson <dianders@chromium.org>
Date: Thu, 25 Sep 2025 12:59:35 -0700
X-Gmail-Original-Message-ID: <CAD=FV=VpCZzw24VH4DAvt5UhZHJD1TMO-t5HB8Kfw3pw+jO7sA@mail.gmail.com>
X-Gm-Features: AS18NWCOLLpqvX90nBBWu9Muo_va5K9CeZWn93TLpPGzigEq33VTJanz9wj8IRk
Message-ID: <CAD=FV=VpCZzw24VH4DAvt5UhZHJD1TMO-t5HB8Kfw3pw+jO7sA@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] riscv: add HARDLOCKUP_DETECTOR_PERF support
To: Yunhui Cui <cuiyunhui@bytedance.com>
Cc: akpm@linux-foundation.org, alex@ghiti.fr, anup@brainfault.org, 
	aou@eecs.berkeley.edu, atish.patra@linux.dev, catalin.marinas@arm.com, 
	johannes@sipsolutions.net, lihuafei1@huawei.com, mark.rutland@arm.com, 
	masahiroy@kernel.org, maz@kernel.org, mingo@kernel.org, 
	nicolas.schier@linux.dev, palmer@dabbelt.com, paul.walmsley@sifive.com, 
	suzuki.poulose@arm.com, thorsten.blum@linux.dev, wangjinchao600@gmail.com, 
	will@kernel.org, yangyicong@hisilicon.com, zhanjie9@hisilicon.com, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-perf-users@vger.kernel.org, linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250925_125949_681557_28A682B5 
X-CRM114-Status: GOOD (  15.19  )
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

On Thu, Sep 25, 2025 at 1:48=E2=80=AFAM Yunhui Cui <cuiyunhui@bytedance.com=
> wrote:
>
> Enable the HARDLOCKUP_DETECTOR_PERF function based on RISC-V SSE.
>
> Signed-off-by: Yunhui Cui <cuiyunhui@bytedance.com>
> ---
>  arch/riscv/Kconfig           |  3 +++
>  drivers/perf/riscv_pmu_sbi.c | 10 ++++++++++
>  2 files changed, 13 insertions(+)
>
> diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
> index badbb2b366946..bb4e8c5a18717 100644
> --- a/arch/riscv/Kconfig
> +++ b/arch/riscv/Kconfig
> @@ -186,6 +186,9 @@ config RISCV
>         select HAVE_PAGE_SIZE_4KB
>         select HAVE_PCI
>         select HAVE_PERF_EVENTS
> +       select PERF_EVENTS

I don't think you want to select this, do you? Just depend on it?

Other than that, this looks good to me.


-Doug

