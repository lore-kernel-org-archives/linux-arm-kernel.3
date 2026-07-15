Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0125C4450A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Jul 2026 05:44:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yUv3OMYlAJVCg65Ns07vkHCsxN93lcUrF3TSM4E88dE=; b=qpdbM9YzdThL03xMPvr+v1zsHE
	+dCiczUo1ZUv0fbKhaBk5rFo3bHj2O8cNtY0CWIBisPSwjLhc1ZUq7BlOG4OSjXpTWq24TermvO1r
	Qe1NSb5kqfXHhbMUjcRVyQ7fJck66eZ0Okv0lhCRi/yRv3jLaGwZl2IxaKKPqQDHzKEoHBdkeAaa+
	wEJu6SO107xJ49BRJd3nEuit5DS5lYAQz2M81lRtFlLpHYS3e+DyYMrydEM2FuOOGMmcSiS2XQNxF
	f1kPsnjx5ICC/UPaw9Ex2vVWTqR3s81dJXq44/RDBoADt51LFA7ct4/yyFpB46TCe0a/rPq4tdyuK
	qSesnsUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjsQE-0000000DpIY-30zm;
	Wed, 15 Jul 2026 05:44:42 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjsQB-0000000DpI5-2Dcv
	for linux-arm-kernel@lists.infradead.org;
	Wed, 15 Jul 2026 05:44:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1784094278;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=yUv3OMYlAJVCg65Ns07vkHCsxN93lcUrF3TSM4E88dE=;
	b=KHg2Vcl4Zz0ph0wAhLiX1tY5jAJNOQh1WoBSIcTf+ZSfMWbg/ZvCMf1Gj+fPoKrOvEBxgP
	00sO1hw8d07tDjd/GFDOPp9PmrRhGzwtflKeWZ6eFL7DbcUBSWB6GV1c4qXESx3ui1TCl9
	riP5EHRaxRmWV2vGcC7OXu/8IhYBHAw=
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com
 [209.85.210.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-252-tM41fD5RODaO3VhWt1918A-1; Wed, 15 Jul 2026 01:44:36 -0400
X-MC-Unique: tM41fD5RODaO3VhWt1918A-1
X-Mimecast-MFC-AGG-ID: tM41fD5RODaO3VhWt1918A_1784094275
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-8484f26852dso1882672b3a.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 14 Jul 2026 22:44:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784094275; x=1784699075;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yUv3OMYlAJVCg65Ns07vkHCsxN93lcUrF3TSM4E88dE=;
        b=XY3cA05orjyOzHM//tLwR3c0TQ7bwR3I8rIjDzB9hdtv4vB9yazTrNOtix4J8BStUJ
         nq6eOoXaZem52FOQlXHfV2YC/4n3ltP55ysveVamAkFCnc7MAFODo1zJjcYEUCAZIMsf
         m/qv7yhiQDcRrnMfoysMNYNRLal7wO0yIzzlONj2k2ktCTWhP4XDnHwkC7vMY9At/Q9K
         D0LABcAp1wLvHqus8TNYbcdittwgJPK7uZGDgSppRBoTFhQOcqCiS2ikbZDDY9b+eA1l
         /6mf7ZBZmIMneI3VyiGnidU7s6cWh0aphYa4XKb5JgDcogTy3QjfiDwMtB00sYRbzk0Q
         LidQ==
X-Forwarded-Encrypted: i=1; AHgh+RqRVpj7B2p9DKfaG/CC+EqhuQLfTn3EpLt8GE6+ZvLK9HLBcD3gaTuvfwGJUlAVvB8HzKaVbgE1uveFokgljKLS@lists.infradead.org
X-Gm-Message-State: AOJu0YyS5xrcZu0Ue7mPaXJMjZAiz6eS4cPqWXlII1+0QJl9eJRjxj8d
	aYb1bbQglCa4X6rAVrR+7cQML9/f2NY2a+NtHiJul0fUMGjFfS389Z670PD+NhOoXQEdzTCp6oL
	L/KRyaCJVIK9EpMjQ5BBPRyjBRokRydH9Slxx6emI7owG57/i/qxkxBPGIcmcl9wgb2lLZ/eI1/
	LI
X-Gm-Gg: AfdE7ck8eCAInsIS/a2eLA6UC3cwDUe9QJWMLLhK2hnKM5V+n6zqUcQM++QuSaX4v05
	3RyhEmEdzG6Im2n/Pfmv+4Ixy2WrtU7706q8Zu94xDH/KNeoIsP9cnHhMwaiGDko7NPJ8PHhJOy
	4NOfS3iKPu5IrDYiOBBW0NoDJDSk8ebt4bpVIYoX9eVHJOTD/tC/38LAOU/p8b5oXguBM0MSzqJ
	C1r3aUD2khzQ87LjlUJByBY/xlCsZ8eRn6X4Qvyd7t/G+mP9Ne5VMinHHhGIYgmD8CbK3wb+l2B
	vxxaF5JcX5I3tvytikAoQjc/D5GCm9ou5o757FtVT0i5C1E/9fvpkpCwuJ1KITahlNpMbWo4jv8
	XWblXZQ6jfgymn35yioiRNrk6irP74K24ofm19QYwCiih6M0NAslR4Q==
X-Received: by 2002:a05:6a00:3cc7:b0:845:d274:c01a with SMTP id d2e1a72fcca58-848896eb1e0mr14811784b3a.51.1784094275103;
        Tue, 14 Jul 2026 22:44:35 -0700 (PDT)
X-Received: by 2002:a05:6a00:3cc7:b0:845:d274:c01a with SMTP id d2e1a72fcca58-848896eb1e0mr14811746b3a.51.1784094274632;
        Tue, 14 Jul 2026 22:44:34 -0700 (PDT)
Received: from [192.168.68.51] (n175-34-8-244.mrk21.qld.optusnet.com.au. [175.34.8.244])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84a4f7dade0sm2497396b3a.46.2026.07.14.22.44.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Jul 2026 22:44:33 -0700 (PDT)
Message-ID: <8e36f71d-598b-45bf-a3ea-6d44ff728877@redhat.com>
Date: Wed, 15 Jul 2026 15:44:20 +1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 0/5] arm_mpam: resctrl: Counter Assignment (ABMC)
To: Ben Horgan <ben.horgan@arm.com>
Cc: amitsinght@marvell.com, baisheng.gao@unisoc.com,
 baolin.wang@linux.alibaba.com, carl@os.amperecomputing.com,
 dave.martin@arm.com, david@kernel.org, dfustini@baylibre.com,
 fenghuay@nvidia.com, james.morse@arm.com, jic23@kernel.org,
 kobak@nvidia.com, lcherian@marvell.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 peternewman@google.com, punit.agrawal@oss.qualcomm.com,
 quic_jiles@quicinc.com, reinette.chatre@intel.com, rohit.mathew@arm.com,
 scott@os.amperecomputing.com, sdonthineni@nvidia.com,
 tan.shaopeng@fujitsu.com, xhao@linux.alibaba.com, zengheng4@huawei.com,
 x86@kernel.org, leitao@kernel.org, kas@kernel.org, puranjay@kernel.org,
 usama.arif@linux.dev, kernel-team@meta.com
References: <20260707162440.12132-1-ben.horgan@arm.com>
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <20260707162440.12132-1-ben.horgan@arm.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 6osAQ5ooqhgYOzp8xMRUWykeVwJiVBoHSbsmDqcJ1G0_1784094275
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260714_224439_654483_E16D8C00 
X-CRM114-Status: GOOD (  16.30  )
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

On 7/8/26 2:24 AM, Ben Horgan wrote:
> Version 5 of this series addresses a few review comments but is pretty
> similar to v4. The precursors in x86/cache have been merged so there is no
> longer a need for this to go through there. It's likely easiest if this
> goes through arm64.
> 
> This series adds support for memory bandwidth monitoring. Counter assignment
> will be used for all platforms with memory bandwidth monitors rather than just
> those with insufficient counters as originally proposed.
> 
> rfc v1: https://lore.kernel.org/lkml/20260225205436.3571756-1-ben.horgan@arm.com/
> rfc v2: https://lore.kernel.org/lkml/20260319165540.381410-1-ben.horgan@arm.com/
> v3: https://lore.kernel.org/linux-arm-kernel/20260511154147.557481-1-ben.horgan@arm.com/
> v4: https://lore.kernel.org/lkml/20260520212458.1797221-1-ben.horgan@arm.com/
> 
> The code can be found at:
> https://gitlab.arm.com/linux-arm/linux-bh.git mpam_abmc_v5
> 
> Ben Horgan (2):
>    arm_mpam: resctrl: Pre-allocate assignable monitors
>    arm64: mpam: Add memory bandwidth usage (MBWU) documentation
> 
> James Morse (3):
>    arm_mpam: resctrl: Pick classes for use as MBM counters
>    arm_mpam: resctrl: Add resctrl_arch_config_cntr() for ABMC use
>    arm_mpam: resctrl: Add resctrl_arch_cntr_read() &
>      resctrl_arch_reset_cntr()
> 
>   Documentation/arch/arm64/mpam.rst |  22 +++
>   drivers/resctrl/mpam_internal.h   |   6 +-
>   drivers/resctrl/mpam_resctrl.c    | 318 +++++++++++++++++++++++++++---
>   3 files changed, 323 insertions(+), 23 deletions(-)
> 

The tests on NVidia's grace-hopper machine looks good: (a) no error or warning is seen
from the kunit-tests; (b) L3 cache partitioning and MBW (soft) limiting aren't broken,
still working to me; (c) The counter 'mbm_total_bytes' can be assigned to newly created
group and it gets increased when workload runs in the group.

Tested-by: Gavin Shan <gshan@redhat.com>

Thanks,
Gavin


