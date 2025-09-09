Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28944CA0FED
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Sep 2025 17:15:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=H3J9huOApoi8Y6hebVd9AzV0hA0WzoEyWAy0m3sVnzY=; b=KtcyJboLCYCXcijmnoE6HtAkY+
	iCJDeF63zovWiz3c+3P+ebhYJLQkQ88fJdjSu16Fn8WP5wrZGJO3qXyUjltD5hn5tSS/iuTF72fTc
	LTzunIA/Whvx1qwqCyoZf/aRmLZcKLCd46wxH1/sdlhm2fZ8zhG53bJhoPJ10aFPQ+0e/iqyqdMmA
	Cz4waGV4NAu4dt/wjb/H6xaKdSVIxcJEPl0olO+OYz8OPow3IjXJaFUYmJ3K4b1AcShOlM1x9q108
	cwabzO8149lhzcb4UhlaPZz+Ea7Vg86yT8A8NlUreHYyglbPYjWes4hnlqS6imkaRpBMtsvmSfuWS
	duEXX0Mg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uw1w5-00000008o43-1x3P;
	Tue, 09 Sep 2025 17:15:17 +0000
Received: from mail-ot1-x32f.google.com ([2607:f8b0:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvwJU-00000006elL-1L6G
	for linux-arm-kernel@lists.infradead.org;
	Tue, 09 Sep 2025 11:15:05 +0000
Received: by mail-ot1-x32f.google.com with SMTP id 46e09a7af769-74382048b8cso3770986a34.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 09 Sep 2025 04:15:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1757416503; x=1758021303; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=H3J9huOApoi8Y6hebVd9AzV0hA0WzoEyWAy0m3sVnzY=;
        b=H9dRpeUEEsC11sBxM3rTpnKrE01Sq1cJS9LaPT5KeK8TomcWnAmbYiVQF8ttexemTZ
         lTcWsH1RgbS6AMvV4GBNpgh6qlmrXCR8dxpDUIEYCOc3kay6lSjAjwCtWvakVNDRdKUr
         XO3WgzdmGQhu18KxAPEJiM1XrgSi+ysTSdhVCGUf3svG5mEcKzklEKasKBYGTBQQYuqU
         HigpB7E/ufV4xEB14nYSrML54K7e0C5PYE0lTOr4ksVWN4thwGn5UVLpy6TRbNd7Eu2P
         fk9YvV1Z2PumKcFLZY2h9z711WYfzooON+4P/qa4iZYez0YKh8HFC2yHzMvSSpnTKbdA
         psAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757416503; x=1758021303;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=H3J9huOApoi8Y6hebVd9AzV0hA0WzoEyWAy0m3sVnzY=;
        b=EKh226dfK4sUALJMlQ9LdPKoBcKdjURKyM5YmnIim4e9AQDc8VJF6/YDoAUzyYs7ml
         OgQhwbQNn/qsn8/VyYlGdTRq6DI1Z9yK9jWHunYKZv5+ymPuwAzlv2zNCHBaU/3xshUm
         uBcms6RScPPUpMMi0eJgQ8eged+xDpP9r+eL9Ntl6Ho0WcrXxpvAFqpq3tqbZ9nJQ9y7
         aWIbpZzAG1quZjN9bj985FDnpP0Mm12ZLtx14jm1aGD3otN3lPfy+M3jUMVBPDFoSc5G
         6FYDFwMso/VZBCst300cUs3PMVF4PK89H5+O7X2wiXeuGcCnQvbdRBgSFjzFB1PB2oTG
         Df9g==
X-Gm-Message-State: AOJu0Ywjfm/0Q1opRK5P6Xo3CeLJK8m5wQauk54HCRrO6iI35OW786bT
	f0F6VpljqcGpvuuE5fScuruHXPdC8DmpcW4hx66Rv/FGsS8UPw60qEO8P8NPdTwhKc0RsXb1lMq
	re+yGTzvbWfqHbV0yBRDxa36tY32RYMDYja7UNxAB6g==
X-Gm-Gg: ASbGncvSpWUlZjovWbJsecwAH8eXAxNAL7J67LtnFK4yEkgZzyo5+nDrOjuzRXotUbE
	H2pQ+iaspB8oRaRyA2oQESAPoBJ8f/M5GSUL4YWRExTXS7biNfj/RO1cHicGkPsvui+BaOLGZDJ
	MftzU2XMiAwM4p6/R3ZgkYT+dCoUFfV9ZF7q5U/RK9CrcIIbYBfcZQR8obFXCmOo98cxC3zIGf3
	7ttlD5oHAMjAcmE
X-Google-Smtp-Source: AGHT+IF3haCb/E1FzNUTbha289kFS363Kg33HMc7PBhqqE87V+/FyqUeuaGr+6CiNvSrkmkJwrmOIOH6XS4or1+1aBE=
X-Received: by 2002:a05:6808:13c6:b0:43a:d659:7822 with SMTP id
 5614622812f47-43b29ae7843mr4779835b6e.34.1757416502750; Tue, 09 Sep 2025
 04:15:02 -0700 (PDT)
MIME-Version: 1.0
References: <20250905162446.88987-1-smostafa@google.com>
In-Reply-To: <20250905162446.88987-1-smostafa@google.com>
From: Peter Griffin <peter.griffin@linaro.org>
Date: Tue, 9 Sep 2025 12:14:51 +0100
X-Gm-Features: Ac12FXx64qJXe2GQUzO8JtALwGYnJphXENgbpS-QSSifTl3glwftoVzGYAhwfsA
Message-ID: <CADrjBPqH==y5KaN6oBnGJ8407gx31sGVEFqqNdz8NG_vPuNPYw@mail.gmail.com>
Subject: Re: [PATCH] soc: samsung: exynos-pmu: Fix for CONFIG_DEBUG_PREEMPT
To: Mostafa Saleh <smostafa@google.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, krzk@kernel.org, alim.akhtar@samsung.com, 
	=?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250909_041504_365565_AFC9CA38 
X-CRM114-Status: GOOD (  13.70  )
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

Hi Mostafa,

Thanks for your patch and bug report, it's great to see more folks
running upstream Pixel 6 :)

On Fri, 5 Sept 2025 at 17:25, Mostafa Saleh <smostafa@google.com> wrote:
>
> Booting the kernel on Pixel-6 with `CONFIG_DEBUG_PREEMPT` prints the
> following WARN:
>
> [    0.784187][    T1] BUG: using smp_processor_id() in preemptible [00000000] code: swapper/0/1
> [    0.784328][    T1] caller is debug_smp_processor_id+0x20/0x30
> [    0.784433][    T1] CPU: 6 UID: 0 PID: 1 Comm: swapper/0 Not tainted 6.17.0-rc4-gd69eb204c255 #1 PREEMPT
> [    0.784439][    T1] Hardware name: Oriole (DT)
> [    0.784441][    T1] Call trace:
> [    0.784443][    T1]  show_stack+0x34/0xa0 (C)
> [    0.784453][    T1]  dump_stack_lvl+0x7c/0xb0
> [    0.784460][    T1]  dump_stack+0x18/0x24
> [    0.784464][    T1]  check_preemption_disabled+0xf8/0x100
> [    0.784470][    T1]  debug_smp_processor_id+0x20/0x30
> [    0.784476][    T1]  gs101_cpuhp_pmu_online+0x40/0x108
> [    0.784483][    T1]  cpuhp_invoke_callback+0x188/0x2d8
> [    0.784490][    T1]  cpuhp_issue_call+0xec/0x240
> [    0.784494][    T1]  __cpuhp_setup_state_cpuslocked+0x140/0x2c0
> [    0.784499][    T1]  __cpuhp_setup_state+0x58/0x88
> [    0.784504][    T1]  exynos_pmu_probe+0x2a4/0x380
> [    0.784508][    T1]  platform_probe+0x64/0xd0
> [    0.784516][    T1]  really_probe+0xd0/0x3b0
> [    0.784520][    T1]  __driver_probe_device+0x8c/0x170
> [    0.784524][    T1]  driver_probe_device+0x44/0x140
> [    0.784528][    T1]  __device_attach_driver+0xd8/0x180
> [    0.784532][    T1]  bus_for_each_drv+0x90/0xf8
> [    0.784536][    T1]  __device_attach+0xa8/0x1d0
> [    0.784540][    T1]  device_initial_probe+0x1c/0x30
> [    0.784544][    T1]  bus_probe_device+0xb4/0xc0
> [    0.784547][    T1]  device_add+0x4d0/0x700
> [    0.784550][    T1]  of_device_add+0x4c/0x78
> [    0.784556][    T1]  of_platform_device_create_pdata+0x9c/0x148
> [    0.784560][    T1]  of_platform_bus_create+0x1d0/0x370
> [    0.784563][    T1]  of_platform_bus_create+0x234/0x370
> [    0.784567][    T1]  of_platform_populate+0x84/0x178
> [    0.784571][    T1]  of_platform_default_populate_init+0xf0/0x120
> [    0.784579][    T1]  do_one_initcall+0x68/0x2d0
> [    0.784585][    T1]  kernel_init_freeable+0x2d8/0x358
> [    0.784589][    T1]  kernel_init+0x28/0x168
> [    0.784595][    T1]  ret_from_fork+0x10/0x20
>
> As this value is only read once, it doesn't require to be stable, so
> just use "raw_smp_processor_id" instead.

Can I ask what baseline you are running when you see this warning?

As this code got refactored recently in commit 78b72897a5c8 ("soc:
samsung: exynos-pmu: Enable CPU Idle for gs101") which is present in
linux-next but hasn't made its way to a proper release yet. After this
patch smp_processor_id() is always called with a raw_spin_lock() held
(so this warning shouldn't fire).

I just built next-20250909 locally to confirm, and with the above
patch reverted I see the warning you mention. So in summary I think
the issue has already been fixed by the above commit.

Thanks,

Peter

