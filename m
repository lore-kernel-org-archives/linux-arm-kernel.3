Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6E3EC43458
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Jul 2026 04:05:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pvDvI4dnfztHHa3NeUm1AhJrwbMud7s42MrEuRwKfag=; b=HEfF9aux2rfnFtAcXRsQf2nUzc
	xJS9y6CKhoc6OAtupg+mNpud+7K7Tts8bSiprGKiqDQucQ2jdaUhLAex3IVrNjxvNNG1ZsgDVg5z8
	XxYJxkZvseTaQPI2C5b9MR5c4g7ym3eCYq+4zDAWMaC8CasT3TdQKK795eKTH6qritKIxQscYZwIh
	2rEQPr+FVQXO9jfaleI6c56S0+9VwqeDYnGnlq/c8djMIvUL1ZMHK9pbOZ7HKdNX+5w/CCdb4Z2wl
	v0dqSwem5K7GUfRZQXiU8wEJsA7MpD2bA5RH4IJRS03XYha+jFHomiqpCR9gkysyRQ2mDVI2ppoZ6
	M2Qcdviw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whg1I-00000000yLF-0R89;
	Thu, 09 Jul 2026 04:05:52 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whg1F-00000000yJO-25SP
	for linux-arm-kernel@lists.infradead.org;
	Thu, 09 Jul 2026 04:05:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1783569946;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=pvDvI4dnfztHHa3NeUm1AhJrwbMud7s42MrEuRwKfag=;
	b=e/Q9b9CvwCJePgOMn7dKIqPbpFaAiRjfOgvCC8L4NQ9cO+ItLAawkoX1ThYJZhzHjBG4h+
	z3rJ89+pVLWDV592XlTDtJH4sE3JBCGKXAf5zq7j6WP2LrqKY+aNweuernn1zmFkCkl9en
	jGBiycm62fKOaX9B96zKjqy2w9tvvAw=
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com
 [209.85.210.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-168-0FnhWK6pM6yUSZGos43zCA-1; Thu, 09 Jul 2026 00:05:44 -0400
X-MC-Unique: 0FnhWK6pM6yUSZGos43zCA-1
X-Mimecast-MFC-AGG-ID: 0FnhWK6pM6yUSZGos43zCA_1783569944
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-848568a6f62so930131b3a.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 08 Jul 2026 21:05:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783569943; x=1784174743;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pvDvI4dnfztHHa3NeUm1AhJrwbMud7s42MrEuRwKfag=;
        b=k6ru+GJa8UcyyyN65sSCpR4u6M8os20CHkt1fBhKLtrDgb7yViazxhn4IqkXkRtsRL
         xzCQo13/ZYsDDWbLIE9yUn25kp9N9f2JlZKv7iwgBqsE3wslUWKKDK5I0DlDrodqwiZN
         q9NPnB1/c43HmhfGranGYJu7pUP+qT2c+ZXqk6YHxbvD/NJ/RFjx6iSUHnndIK8Kpcs9
         Xq/K8vXNqwkwHEhi4wPK3CT+Pj3mihIfNXU7E0njUHzBjGxu1TRfdizs6+bxTttBIAw1
         HUo/i4DxyplalWtxehTDR+1aAm/LGu+G65WgtJ5woxRZsC2yWkSO5mtVNI1Har+Hil1n
         i+zw==
X-Forwarded-Encrypted: i=1; AHgh+RpZsZyXOGOupm8Qtm+kqnQPua07Pnb2nLTpikSnMNm9iG2gLX4V54YQaTmFEEHhpdBVSsjXQ0G5IhYFcQAsmUcM@lists.infradead.org
X-Gm-Message-State: AOJu0Yxpg8/krKSrwZ5yWXv0RZXHMkXhStJqRATcZp0VXYhNnoqnHh6J
	EnlF3JzlNone5+6HKuxO3FM4e78n5DJyJJqnQa9LGCkioZ8sNw7D594ZWDVHZ8+lPf5wyZ/cc0C
	QbdVqE6G2m3di0bE1C84doIvE/culXjgFu6BwsWwV+QasPeUkqTxXsg83Fll5feg594Oh+MCVjz
	8C
X-Gm-Gg: AfdE7ck2awiTcGRCoU7K+rgMZz9StzAfG3X/n6nlZuycdx1zuWcMNaScCOmSEyAf4Zv
	7hicaoZGxvY3D0o3wPiFRzVYO5dwQkyXu8pIyflIFYSVPia+OEm/jokPsZXj2Z6sd4lmiIBTXQF
	+avAaOUwPN7DSUXaHn0OXQaR2YDgmiPyu0uDNbsmuQt/sLysGRBFoV/xDlIQbFUZUgmT3OZjSUV
	ImcNdmYA9pzJFiUASvBuZS7x1TNEE49Ag5FtBNPIO+ujzod8lu9Es/kHRY9isn4OXs5ZsoMQjyZ
	JezVVAtzc/DOy39VYxOUTgZl8vk+Q0QSAthyOYNfabEB+URu4IA74tY7MRuZUmek5J/Gki6nYqA
	kJPXiTzHmiDTW8ejv/ReaJdFMPmG/PlH6ZAASIDwEavcGso9fcAm4bQ==
X-Received: by 2002:a05:6a00:91d6:b0:848:44ae:47c1 with SMTP id d2e1a72fcca58-84844ae87b9mr4478257b3a.78.1783569943591;
        Wed, 08 Jul 2026 21:05:43 -0700 (PDT)
X-Received: by 2002:a05:6a00:91d6:b0:848:44ae:47c1 with SMTP id d2e1a72fcca58-84844ae87b9mr4478243b3a.78.1783569943100;
        Wed, 08 Jul 2026 21:05:43 -0700 (PDT)
Received: from [192.168.68.51] (n175-34-8-244.mrk21.qld.optusnet.com.au. [175.34.8.244])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-847f6b93f8csm8277145b3a.19.2026.07.08.21.05.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Jul 2026 21:05:42 -0700 (PDT)
Message-ID: <56e6a456-92a4-4ea6-91fe-d379c5547c25@redhat.com>
Date: Thu, 9 Jul 2026 14:05:35 +1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] virt: arm-cca-guest: use migrate_disable() for
 attestation token requests
To: Kohei Enju <enju.kohei@fujitsu.com>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Suzuki K Poulose <suzuki.poulose@arm.com>,
 Sami Mujawar <sami.mujawar@arm.com>, Steven Price <steven.price@arm.com>
References: <20260612111007.49434-1-enju.kohei@fujitsu.com>
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <20260612111007.49434-1-enju.kohei@fujitsu.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 4Ry__adY5NYTD116UKYzk5ce_s0hIwSj1Heu8ATOlik_1783569944
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260708_210549_618762_BBEFC234 
X-CRM114-Status: GOOD (  19.96  )
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

On 6/12/26 9:09 PM, Kohei Enju wrote:
> The RSI attestation token init and continue calls must be issued from
> the same CPU. arm_cca_report_new() currently snapshots the CPU number
> and uses smp_call_function_single() to issue those calls on that CPU.
> 
> With CONFIG_DEBUG_PREEMPT=y, the smp_processor_id() call used for the
> snapshot triggers a debug splat [0] because it runs in preemptible
> context. The snapshot does not pin the task to that CPU; it is only used
> to choose the target CPU for smp_call_function_single(), which can fail
> if that CPU is no longer available.
> 
> Use migrate_disable() and issue the token init and continue operations
> directly, without the smp_call_function_single() callbacks. This keeps
> the token request sequence on the same CPU while preserving a sleepable
> context for the GFP_KERNEL allocations needed after the init call.
> 
> [0]
>   BUG: using smp_processor_id() in preemptible [00000000] code: cca-workload-at/264
>   caller is debug_smp_processor_id+0x20/0x30
>   CPU: 0 UID: 0 PID: 264 Comm: cca-workload-at Not tainted 7.1.0-rc1-00044-g55542ab273f2 #80 PREEMPT(lazy)
>   Hardware name: linux,dummy-virt (DT)
>   Call trace:
>    [...]
>    check_preemption_disabled+0xd8/0xf8
>    debug_smp_processor_id+0x20/0x30
>    arm_cca_report_new+0x48/0x278
>    tsm_report_read+0x154/0x1f8
>    tsm_report_outblob_read+0x20/0x38
>    configfs_bin_read_iter+0x118/0x208
>    vfs_read+0x220/0x318
>    [...]
> 
> Fixes: 7999edc484ca ("virt: arm-cca-guest: TSM_REPORT support for realms")
> Signed-off-by: Kohei Enju <enju.kohei@fujitsu.com>
> ---
> Changes:
> v3:
>    - Switch to migrate_disable() and call RSI directly, removing
>      smp_call_function_single() (Will, Suzuki)
>    - Remove arm_cca_attestation_init() helper and unused fields from
>      arm_cca_token_info
>    - Drop Reviewed-by tags since the approach changed from v2
> v2: https://lore.kernel.org/linux-arm-kernel/20260519101217.155740-1-enju.kohei@fujitsu.com/
>    - Add comment about why this path doesn't use migrate_disable()
> v1: https://lore.kernel.org/linux-arm-kernel/20260518033157.1865498-1-enju.kohei@fujitsu.com/
> ---
>   .../virt/coco/arm-cca-guest/arm-cca-guest.c   | 97 +++++++------------
>   1 file changed, 36 insertions(+), 61 deletions(-)
> 
Reviewed-by: Gavin Shan <gshan@redhat.com>


