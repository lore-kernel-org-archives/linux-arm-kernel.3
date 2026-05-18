Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 262B2CD343F
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 18 May 2026 04:29:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VAt7IsMFHJq5LL7MHyUipGEDyQkdeJ+DGVaEDh3ohQE=; b=y0nBs/lLFZdCTK/LQ91pGI5iew
	F+30v+3wS2d3T/Me59VjuhGnDR5kxhICk9y1xzwjpMH2HU9jBi84a11rAw3ckTz5g8qXv2BDcnyB0
	I+XtTRV3xH3GZHIeh7+Qo3lHq/Da9XSq9qe5Rz/cc0pRkmc2bW8qMkQ81TFYytgz5syfmhjxuoNEf
	Ur7aKBLv8YkMB+pDXskskpcVab2PWNB6wnsejvcPxyqewOyAmdvTj2iDufnZRn1sn96kwGOcLSwvL
	GsITeuHw/+a+I97xnSh6WkPa7H8sb9+oAs9NZjRghSPPG9vDxdSlbI+DVQGOgnrzfbgOD0R2iARKT
	VbJg/nXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOpb6-0000000EA3C-1BAl;
	Mon, 18 May 2026 04:28:56 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOpb3-0000000EA2Q-1Gb0
	for linux-arm-kernel@lists.infradead.org;
	Mon, 18 May 2026 04:28:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1779078530;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=VAt7IsMFHJq5LL7MHyUipGEDyQkdeJ+DGVaEDh3ohQE=;
	b=MJyjoDpeEWPUV4TVe2Qu677qKC5VV7Dlk1ofR+HG8mqjOtsuUnq4f2jy5lAVYQwB4aRZTr
	ZJXDvCLALapfYcmmuodbZmYH1ZimSGoMw1/+DM2V5lF4F+0WqQwZkSvGNJMtu/ngYuoS+b
	xKXoTmRBXbsrfwpxRc/uzO5bh4C77qg=
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com
 [209.85.215.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-403-ffWvwPj7OKGr-z2sfHP44w-1; Mon, 18 May 2026 00:28:48 -0400
X-MC-Unique: ffWvwPj7OKGr-z2sfHP44w-1
X-Mimecast-MFC-AGG-ID: ffWvwPj7OKGr-z2sfHP44w_1779078528
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-c8279604464so2520335a12.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 17 May 2026 21:28:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779078527; x=1779683327;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VAt7IsMFHJq5LL7MHyUipGEDyQkdeJ+DGVaEDh3ohQE=;
        b=AiDTABwVyibduUn1r10fc0PFKl4YaCvlySKCMELE1Fiuoz/dsKGDEr1I4XLipGZqzz
         oni127NIYtcqtrEZkXGW1ry/CMwsezkVzI3l3nYfgrNPjSU8A38QNldyP6D23fulQOqP
         xKYQEoZsx745esPd8MsOfAs/+JI1ei3DfJxA0jH8VP1MCe3A32/UKU47LQZrsjx9GGMN
         cBAr1dV/UKNLZkrdqQq1RrCJGeS/lGnOq8TmY38d7qfh5s1SXanKb6S3jn9wY2O16JXP
         j19B7AIbK+pcmBb8M9ym+XYZBP86id6PTMqVfEUP+JqzeEztkyt3Ve3TtxY6por4HS0O
         zT0Q==
X-Forwarded-Encrypted: i=1; AFNElJ8s9qUBA/hU7oUwF3CaANnc2Ez2GSNpao0r16FTl/rrBu4zPALAhrBT2xTreXK+VPbAiJYIqyc7xtNJmQYDtAAT@lists.infradead.org
X-Gm-Message-State: AOJu0Ywr8OmqAyMZQ2MORucoHr1czG7e2m5QHtxGxdTlO+XTrQSprynZ
	7yxssExVeVJbF6nNDi39sks+ieC2hFyT2/2ecX46LwP/AxanRvgvXnErblncn+w2A3CJbZvbj1D
	qkWBGSEfUkhkUTHOYkL33ksT8OOOKBf3F0V9gwtlbV8eLQR+zumhxltfoNAYzNsRVCtj0Pd1nTl
	/R
X-Gm-Gg: Acq92OFLJkDhNRux2fj87TEJFDypYg7A0UZSzc+nq3EKcGNX3gTXNXA+cZbJCq77Inx
	ApbbO76xYYG4QHNvJrl31gOi01W1tXwonmZtDs53uaH+fg2ZIuUldC+zouIEOg9ITBYZe+u+Sqg
	7b2D9bSBENe25E7H+cz53BzDFCzOCoNY7rTzFsKqAZFrlS+LTm3wT0FSruGupbmAb6lp/bBRXyx
	CN3iPFQoJF0X/fWSP62cA8va5wEwaFg4WRvM4BsEeaow+877EcdQ3Yyx32za2wnAkSZM/eQLNX4
	SPJXiXH7ULM/aD7OwcPyZYqLnE0Jnrp/McqMB1BcIUTvDgnodp/CZdVto4RjMm6m5uiEPF8Od0x
	dl/m3jAS1HXS6TASUCMfnFj5EPxlGgMWSVg10MQtOrVHI7Y+ATKXLSr29eQqNCCRa
X-Received: by 2002:a05:6a20:6a0e:b0:398:7256:3c0 with SMTP id adf61e73a8af0-3b22e71fc4amr14838693637.13.1779078527573;
        Sun, 17 May 2026 21:28:47 -0700 (PDT)
X-Received: by 2002:a05:6a20:6a0e:b0:398:7256:3c0 with SMTP id adf61e73a8af0-3b22e71fc4amr14838679637.13.1779078527097;
        Sun, 17 May 2026 21:28:47 -0700 (PDT)
Received: from [192.168.68.51] (n175-34-8-244.mrk21.qld.optusnet.com.au. [175.34.8.244])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c82bb07d2f2sm11414785a12.10.2026.05.17.21.28.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 17 May 2026 21:28:46 -0700 (PDT)
Message-ID: <4c79ff7b-5176-4fd7-8427-0f7a1113f31b@redhat.com>
Date: Mon, 18 May 2026 14:28:40 +1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] virt: arm-cca-guest: use raw variant of
 smp_processor_id() in arm_cca_report_new()
To: Kohei Enju <enju.kohei@fujitsu.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>
Cc: Sami Mujawar <sami.mujawar@arm.com>, Steven Price <steven.price@arm.com>,
 Suzuki K Poulose <suzuki.poulose@arm.com>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20260518033157.1865498-1-enju.kohei@fujitsu.com>
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <20260518033157.1865498-1-enju.kohei@fujitsu.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 8Yvh02u4KBoVo3C9RflUjbE3rGvbi7cPOUyAQMomf7A_1779078528
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260517_212853_427906_CB6E8E7D 
X-CRM114-Status: GOOD (  16.86  )
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

On 5/18/26 1:31 PM, Kohei Enju wrote:
> With CONFIG_DEBUG_PREEMPT=y, smp_processor_id() becomes an alias of
> debug_smp_processor_id(). This debug function complains when certain
> conditions that ensure CPU ID stability are not met, specifically when
> it's called from a preemptible context.
> 
> In arm_cca_report_new(), which runs in a preemptible context,
> smp_processor_id() triggers a splat [0] due to this.
> 
> However, the CPU ID obtained here is used as the target CPU for
> smp_call_function_single() to designate a specific CPU for subsequent
> operations, not to assert that the current thread will continue to
> execute on the same CPU. Therefore, snapshotting the CPU ID itself is
> correct, and thus there's no actual harm except for the splat.
> 
> Use raw_smp_processor_id() instead, to directly retrieve the current CPU
> ID without the debug checks, avoiding the unnecessary warning message
> while preserving the correct functional behavior.
> 
> [0]
>   BUG: using smp_processor_id() in preemptible [00000000] code: cca-workload-at/134
>   caller is debug_smp_processor_id+0x20/0x2c
>   CPU: 0 UID: 0 PID: 134 Comm: cca-workload-at Not tainted 7.0.0-rc1-gc74a64d12073 #1 PREEMPT
>   Hardware name: linux,dummy-virt (DT)
>   Call trace:
>    [...]
>    check_preemption_disabled+0xf8/0x100
>    debug_smp_processor_id+0x20/0x2c
>    arm_cca_report_new+0x54/0x230
>    tsm_report_read+0x184/0x260
>    tsm_report_outblob_read+0x18/0x38
>    configfs_bin_read_iter+0xf4/0x1dc
>    vfs_read+0x230/0x31c
>    [...]
> 
> Fixes: 7999edc484ca ("virt: arm-cca-guest: TSM_REPORT support for realms")
> Signed-off-by: Kohei Enju <enju.kohei@fujitsu.com>
> ---
>   drivers/virt/coco/arm-cca-guest/arm-cca-guest.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
Reviewed-by: Gavin Shan <gshan@redhat.com>


