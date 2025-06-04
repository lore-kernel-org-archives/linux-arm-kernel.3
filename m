Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C048CC5B552
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Jun 2025 08:55:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:Date:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GLM7LBm37WJqJap/lEtkbB8hYDWJRhXgHcZgsy5d+m4=; b=KFaEKqPnLg7y2rj2JWcptcJGOc
	dGnxnMCM2eu6Egj3Va2STXZw1ij6GMYyDKY4TJzmbPwPVY2d2dxyHScOBMfvurtJ0b5X3/9IxVJtf
	GR6dWMfDlwIHbnRrj3PxcsGgm8v2Q95aYVJ2z1G3pMqmYOFtBf3onDluUtjEi0KoVBeIVeWe+PH4f
	QEePLetPriAeGxu/SjxTxq1LUyaoobvr/vCSKH0+KjwExDrdY6RKEvIYzlMK3p0TC/A5U3YYUTPq9
	ukH/8I3YHdPvvVJWf2Y912V5gFIDWEqi478E8YLc4inm0rrb44wAFTaSNfw5qh8eZZq+/NDBNILmC
	fl5R9A3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMju0-0000000Cxa0-0uVq;
	Wed, 04 Jun 2025 08:55:16 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMjru-0000000CxMW-18MX
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Jun 2025 08:53:07 +0000
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-451d7b50815so26927595e9.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 04 Jun 2025 01:53:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749027184; x=1749631984; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=GLM7LBm37WJqJap/lEtkbB8hYDWJRhXgHcZgsy5d+m4=;
        b=X2F43GPuu0yLrrmgXtaWxojv/NIP4BPr5G5JgVUvwKoqI4hKylN0KWeWgg1pLXjiVz
         1afXIGSR2K7rTfkfDjuNO+UxIARZSQwc9RpZRoKpOV1xeW6ZkwZPiCSHzCYFOVe5/RlX
         ESmUCu47IWstWiM9m8Iv3DqkyI/Msh9y/qqBjen/xVZWRVWXNSAVfn2sAry65S4N99wJ
         r1paXgjrO+hDmJ8r2Bf6rfkgDPliPqy5YDaOzvCYqTRl7E5VQ5pPc1F5GGjkJgJwsUx8
         YdapoS+o8oY8HzIKwRSbAdUYj/5LC7MAUFkltXLzd9+rx7ATZclWvIsl/OlU6a8x4knG
         Bn6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749027184; x=1749631984;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GLM7LBm37WJqJap/lEtkbB8hYDWJRhXgHcZgsy5d+m4=;
        b=AGAhTtCc4/AMo+/4O0VY/N0xRj7cQyIoXp15GpGosRArcT9ddfMbhjpkgOqy8p4k2n
         yteMHGU5LqU4HgTSsJ21f3T3QjmhwP7gxIxWwKxA64Whh/hSzsuxvnUQSllzWJY7ftxE
         QJd7fY/S36Pn5tw6dPykiAd6iR2Ut5n9QPSCiXFFmihcxfdPAz1JfmbB3W80wyQx1geQ
         s1ecx3cbkCTgNS1ffEO29SF+ZGsz9yd0mpYGonercZGjzwpQ494AYWFyGPmK5uxlPO+v
         NNe/M+quMJmz79cpRxtndSk5tTXiS9dV7udfNACho9y6uUuSvxdza51oSEiluGTC7GBU
         B2gA==
X-Forwarded-Encrypted: i=1; AJvYcCVL0CRuZv+vwhTCixSkJ6rhfu4A3mPLew6f2kUhCnnQyQcpRJL/WRDJbMCFd/GY8WhCqhZ1ScQk9LNc88OeB/Cy@lists.infradead.org
X-Gm-Message-State: AOJu0Yy/FtMtdG14jqhjYCuT+sE7G6XjSkaiXxrvTq1PVm4HD5UgJQsJ
	L71iWWGt+DpBOJLJVLG+H6bP0BuBp8uRmmA0pih8Thpa3/74xmBgXXdJ
X-Gm-Gg: ASbGncscf9/1vpW5pu/WmoEC94Z2gVGSixjLJPP3crpQyLmq9xmzMO2TcnqlglygJB4
	wYcAydEiKw8pZwUvhetxOIhARo8VIasgOGIyUDWrotosX+QtfbEBfVVSJiF7kDYw0hmdX7e3mWD
	jDB42f5n9KKI2KO1IET6REth/oOx/busViIDoFLwwIsjB4mTjJo9RinLSDf3E2lgM6QZdpcdmw7
	4DIBgT+U3sQcJRi2fr0w8cc79bJ4nBp+lN8ekR2xF3M4X+QH4okU4B3c+p31lYPBDAFQjJfgEpS
	LY5FyRaIv9lxVzdf1mVdRH028KtIDEG8RqBRNsI=
X-Google-Smtp-Source: AGHT+IEimdhpyVCbWCs8OZcEOw5A8tU+m2ddmRqylRHVPijI8dxrP/UOu9X8Wnc/BPaO81v0RDpm7w==
X-Received: by 2002:a05:600c:6749:b0:43c:f6c6:578c with SMTP id 5b1f17b1804b1-451f0ab417fmr15621325e9.15.1749027183601;
        Wed, 04 Jun 2025 01:53:03 -0700 (PDT)
Received: from krava ([176.74.159.170])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-450d7fa2566sm186916685e9.13.2025.06.04.01.53.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Jun 2025 01:53:03 -0700 (PDT)
From: Jiri Olsa <olsajiri@gmail.com>
X-Google-Original-From: Jiri Olsa <jolsa@kernel.org>
Date: Wed, 4 Jun 2025 10:53:00 +0200
To: Rong Tao <rtoax@foxmail.com>
Cc: andrii@kernel.org, eddyz87@gmail.com, rongtao@cestc.cn,
	Mykola Lysenko <mykolal@fb.com>,
	Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Martin KaFai Lau <martin.lau@linux.dev>, Song Liu <song@kernel.org>,
	Yonghong Song <yonghong.song@linux.dev>,
	John Fastabend <john.fastabend@gmail.com>,
	KP Singh <kpsingh@kernel.org>, Stanislav Fomichev <sdf@fomichev.me>,
	Hao Luo <haoluo@google.com>, Shuah Khan <shuah@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Amery Hung <ameryhung@gmail.com>,
	Juntong Deng <juntong.deng@outlook.com>,
	Oleg Nesterov <oleg@redhat.com>,
	"open list:BPF [SELFTESTS] (Test Runners & Infrastructure)" <bpf@vger.kernel.org>,
	"open list:KERNEL SELFTEST FRAMEWORK" <linux-kselftest@vger.kernel.org>,
	"moderated list:ARM/STM32 ARCHITECTURE" <linux-stm32@st-md-mailman.stormreply.com>,
	"moderated list:ARM/STM32 ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>,
	open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH bpf-next] selftests/bpf: Fix compile error of
 bin_attribute::read/write()
Message-ID: <aEAJbBH00yL2iTgn@krava>
References: <tencent_A6502A28AF21A3CA88B106F3421159869708@qq.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <tencent_A6502A28AF21A3CA88B106F3421159869708@qq.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250604_015306_306977_ED28FF3E 
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

On Wed, Jun 04, 2025 at 01:53:22PM +0800, Rong Tao wrote:
> From: Rong Tao <rongtao@cestc.cn>
> 
> Since commit 97d06802d10a ("sysfs: constify bin_attribute argument of
> bin_attribute::read/write()"), make bin_attribute parameter of
> bin_attribute::read/write() const.

hi,
there's already fix for this in bpf/master

thanks,
jirka

> 
> Signed-off-by: Rong Tao <rongtao@cestc.cn>
> ---
>  tools/testing/selftests/bpf/test_kmods/bpf_testmod.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/tools/testing/selftests/bpf/test_kmods/bpf_testmod.c b/tools/testing/selftests/bpf/test_kmods/bpf_testmod.c
> index e6c248e3ae54..e9e918cdf31f 100644
> --- a/tools/testing/selftests/bpf/test_kmods/bpf_testmod.c
> +++ b/tools/testing/selftests/bpf/test_kmods/bpf_testmod.c
> @@ -385,7 +385,7 @@ int bpf_testmod_fentry_ok;
>  
>  noinline ssize_t
>  bpf_testmod_test_read(struct file *file, struct kobject *kobj,
> -		      struct bin_attribute *bin_attr,
> +		      const struct bin_attribute *bin_attr,
>  		      char *buf, loff_t off, size_t len)
>  {
>  	struct bpf_testmod_test_read_ctx ctx = {
> @@ -465,7 +465,7 @@ ALLOW_ERROR_INJECTION(bpf_testmod_test_read, ERRNO);
>  
>  noinline ssize_t
>  bpf_testmod_test_write(struct file *file, struct kobject *kobj,
> -		      struct bin_attribute *bin_attr,
> +		      const struct bin_attribute *bin_attr,
>  		      char *buf, loff_t off, size_t len)
>  {
>  	struct bpf_testmod_test_write_ctx ctx = {
> @@ -567,7 +567,7 @@ static void testmod_unregister_uprobe(void)
>  
>  static ssize_t
>  bpf_testmod_uprobe_write(struct file *file, struct kobject *kobj,
> -			 struct bin_attribute *bin_attr,
> +			 const struct bin_attribute *bin_attr,
>  			 char *buf, loff_t off, size_t len)
>  {
>  	unsigned long offset = 0;
> -- 
> 2.49.0
> 

