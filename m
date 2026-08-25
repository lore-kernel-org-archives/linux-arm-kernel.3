Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7EDA5C61DBC
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Aug 2026 16:07:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:Subject
	:MIME-Version:Date:Message-ID:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AajLJ5Gj0+qULCokDDjBehbuCuLcM7tNDW/urx1J8Uk=; b=A+YmA8bQGCc45Mz9qw9sUpEMlo
	g1Ceq1mMNk/yBmtKSKpGrYJhuRlHOUabyeXlZlkcglpH9lwuuOgJyVa4URDZIQO9L6qfTgjGBwWbi
	73dSgcGwjzNd+Jnvc3v0sc9NArE8LAK9quZR2B6HresMgXPTMdjtFcBxN1fGk7o//aC0iazBpcLqK
	l3i0QnWYtkliB9jl1CBhD/YyR0f2zez5iCx2SGqha4d92R9SX3F4AEmPsen0dsmhjk5HIpoDBz/EY
	5L8yQ7UCIAy6EYU5VoHvT6VgNiDYlXH8GZSBOASkwTe8EnH5CQl33p8wbtzxXkyYpMNPA942rLqaa
	OYs1mWZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wytgJ-000000015Uk-04fL;
	Tue, 25 Aug 2026 16:07:23 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wytgG-000000015UJ-0ZRi
	for linux-arm-kernel@lists.infradead.org;
	Tue, 25 Aug 2026 16:07:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1787674037;
	h=from:from:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=AajLJ5Gj0+qULCokDDjBehbuCuLcM7tNDW/urx1J8Uk=;
	b=TOFSogW+kFvSjkpATZZjGJFxaPlul5GYVOiXdwHMQ/fUABYJtsbvujw+MRqbaglu0Pf/l7
	e2NaVeLTuRFCejEmcgMBUZIbuBprIKhckKOyzKQ3o8LTnjWj8sFZTBDhQ9X1V8fOBQLepm
	gWHi3gDY4Xy1Q28v4njk8AiL9kmE90g=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-599-aA4NeUfeMGSuxdDoTU6smw-1; Tue, 25 Aug 2026 12:05:43 -0400
X-MC-Unique: aA4NeUfeMGSuxdDoTU6smw-1
X-Mimecast-MFC-AGG-ID: aA4NeUfeMGSuxdDoTU6smw_1787673942
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-9308eafb465so926461385a.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 25 Aug 2026 09:05:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787673942; x=1788278742;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:to:subject:reply-to:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=AajLJ5Gj0+qULCokDDjBehbuCuLcM7tNDW/urx1J8Uk=;
        b=IOutNXYNIS+RSYC5OTupF45/Ae7IfZhYiVcV4So4XJ6QroMmrqs9Zc2MnmS/OBZobE
         LLPGA2P7n3+K6Nv4Fb8pS14Zw1c1AVWM/NCNotKvfGQ/hcTKXUfgV1b4eBZXdfMNpfHo
         2zo682PXQ0iI29uWMdm7xOQzm0FfiGKeS0UXer2dn5B4gpiM9y5PZ30Zb7Q1k0PjiD76
         0gfd2LCJ92oKehSnT2t334leVoC0jXHVvkqx8FfzdxWPi9nuID1caBQFqaIZvm4Xd0wj
         TLIZmX+nurm1maBIFCs7qFkrnNMUNnCxzjqvzOX3SOEmpewh1kcsDQBbmG7Id1F3SU2s
         PXjw==
X-Forwarded-Encrypted: i=1; AHgh+RpwE4+gMuWFAGjWKp+u25lGfo/Cb0B/kMkdsRjjRAeZb1b4PikAeK9RyU6irRcFnx0k+rpPUxtkPWlc1VkUkLpx@lists.infradead.org
X-Gm-Message-State: AFuF++nrj9FICOLQbGlbEC0pk25zpQ+aNX7D8q6bd8HCVxhFvQI1Jftm
	4fMNQGbUWPnsgpP3Btgzk9E7qt8osebY6voG/QWh48WHNBgzQ0B31kzVqeikWDWLCtNJRCTh0qe
	IBFF4lyPUfBWCiDcCK60JJRFFNmYJpnkPbJb6grtQmXoo8vl+4bpZUv/VT0ao34+9+1Xx4Uz8mm
	NIrdDCSC0/1YU=
X-Gm-Gg: AR+sD11TYdIJ3LIb42kwbAx+Nz88ChSK+WVkJ3YBu1vebAlAr8eT2DVSptOb9gFBza7
	vj7P3OqgOyMUWtSr/F/4MDgVQqQrCulu9n5w1tTNMCbTemA6qNTaAaRgwOOE97dtEA+Z8veMpkB
	KbAGu7EyCEofacTGJUkIhNaTOTccUtnoQui0Ajq50OkVuakZYQQl1n06YpbRH0HXNrgv7H1ZHPJ
	fd9Si47vD+V6BxQFOxvirif6k376aElE1bbBIBuL7XWiigWa1bT43A1NEo9rp2qfSxPH2QC/bJF
	Kt4YX8HiW4vVVQbf2Ca61O2YYB0ZYrpQpgFj6N0lv6yr3Nbe/Sc3ELSKPhtH9mm51XvhGNvQWTA
	sPXzL+1ssKtXZHTUPZOcsOcBxTgGr1Vk9D/iepWPDmg==
X-Received: by 2002:a05:620a:4514:b0:937:71aa:23d with SMTP id af79cd13be357-93771aa03b7mr672418785a.44.1787673942285;
        Tue, 25 Aug 2026 09:05:42 -0700 (PDT)
X-Received: by 2002:a05:620a:4514:b0:937:71aa:23d with SMTP id af79cd13be357-93771aa03b7mr672406985a.44.1787673941737;
        Tue, 25 Aug 2026 09:05:41 -0700 (PDT)
Received: from [10.0.0.119] (97-127-68-83.mpls.qwest.net. [97.127.68.83])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9377e36879asm10965585a.17.2026.08.25.09.05.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 25 Aug 2026 09:05:41 -0700 (PDT)
Message-ID: <037e7485-2fd5-4d29-9e08-523a87cfd8e9@redhat.com>
Date: Tue, 25 Aug 2026 11:05:40 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: =?UTF-8?Q?Re=3A_=5Bfs-test=5D_=E2=9D=8C_FAIL=3A_Test_report_for_for?=
 =?UTF-8?Q?-kernelci_=287=2E2=2E0-rc7=2C_upstream-arm-next=2C_21d6ac05=29?=
To: will@kernel.org, catalin.marinas@arm.com,
 linux-arm-kernel@lists.infradead.org
References: <87021.126081216320600366@us-mta-482.us.mimecast.lan>
From: Eric Sandeen <esandeen@redhat.com>
In-Reply-To: <87021.126081216320600366@us-mta-482.us.mimecast.lan>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: HAkglEoSS7ZbKL7Jme7OFqPJegPp1jcwzdJd2KsWsRo_1787673942
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260825_090720_247678_1164885E 
X-CRM114-Status: GOOD (  19.55  )
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
Reply-To: sandeen@redhat.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

Hi Will, Catalin, linux-arm-kernel -

I've been trying to make sense of some of the automated testing like
this which seems to have been on autopilot for a while.

Is this testing/reporting something that is still useful to you?

I've been seeing the same btrfs test fail forever, I doubt it's arm-specific,
and I'm not sure anyone is looking into it.

Would you like this testing to continue or is just noise now?

Thanks,
-Eric

On 8/12/26 3:32 PM, cki-project@redhat.com wrote:
> Hi, we tested your kernel and here are the results:
> 
>     Overall result: FAILED
>              Merge: OK
>            Compile: OK
>               Test: FAILED
> 
> 
> Kernel information:
>     Commit message: Merge branch 'for-next/core' into for-kernelci
> 
> You can find all the details about the test run at
>     https://datawarehouse.cki-project.org/kcidb/checkouts/redhat:2754041714
> 
> One or more kernel tests failed:
>     Unrecognized or new issues:
>         xfstests - btrfs
>              aarch64
>                    Logs: https://datawarehouse.cki-project.org/kcidb/tests/redhat:2754041714_aarch64_kernel_kcidb_tool_21860756_9
>                    Non-passing ran subtests:
>                        ❌ FAIL generic/301
> 
>     We also see the following known issues which are not related to your changes:
>         Issue: [upstream] Hardware - Firmware test suite - auto-waive failures
>             URL: https://gitlab.com/cki-project/infrastructure/-/issues/779
>             Affected tests:
>                 Hardware - Firmware test suite [aarch64]
> 
> 
> 
> If you find a failure unrelated to your changes, please ask the test maintainer to review it.
> This will prevent the failures from being incorrectly reported in the future.
> 
> Please reply to this email if you have any questions about the tests that we
> ran or if you have any suggestions on how to make future tests more effective.
> 
>         ,-.   ,-.
>        ( C ) ( K )  Continuous
>         `-',-.`-'   Kernel
>           ( I )     Integration
>            `-'
> ______________________________________________________________________________
> 


