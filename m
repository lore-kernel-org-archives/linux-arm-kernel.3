Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A965C5DF7D
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Aug 2026 14:24:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Z2McX24GWbeBYdnzk2sBQiJhDSCW8yUuujUpFcq2Eh8=; b=sFCjd4p+FjSYIduy0Il1edrzaw
	jhBc9HhtjZ6Ov06OInQu3POdIiTd/XkSbk7DZO2/ep1MZvW7+eEtCSVG3C9jlxIPpu9PYuWBEVcAO
	C3eCmrzIfJT7TsArH6nX7I1Bqq6U8ded4s1R8YDJCndbayPPkHuAsRrH65P5epCyqy5MQmzsP5gKR
	T678G+k/HDHp3LMkWXBFvnvj1xfcTaqtfGdmjQl3q0YdJholO5LKvUw1yFLrKGt23lejqvS6PBzje
	mBfjgaH7b7ma9lxV1WO77GieQymRxzclwnKft+2YB+r1OBW8zklb7LPgj9MCmZ2XV0L6hbnm3kT4E
	SnDm4uHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwKjF-00000008A5u-1Deb;
	Tue, 18 Aug 2026 14:23:49 +0000
Received: from out-165.mta1.migadu.com ([2001:41d0:203:375::a5] helo=mta1.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwKjC-00000008A5Z-2GM0
	for linux-arm-kernel@lists.infradead.org;
	Tue, 18 Aug 2026 14:23:48 +0000
X-Envelope-To: linux-arm-kernel@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=2zqtNHuHM9vTn2QiWb1DKB4n7bPmtKuVIDCe9D+lr/E=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1787063023; v=1; x=1787667823;
 b=orECpFyHc5E6M2nHs8Pb/8fw9/nc+QKTh3K8Yx4rCoYzkjKdSIa2GJcmmI1RjAb5KRhacRoc
 KF9BgSka1jMAgU7Nc8//5y5aXGL29pHo1I8kS+mheZ5ZEf0NVSW5681it6O3eznZmKkl5IPnxJZ
 wVOJ7dpPcXmT/LWeMsODR9Qs=
X-Envelope-To: linux-arm-kernel@lists.infradead.org
Received: from mail-lf1-f48.google.com (209.85.167.48)
	by smtp.migadu.com with ESMTPS id ab01655b4e4047dd;
	Tue, 18 Aug 2026 14:23:33 +0000
X-Migadu-Flow: FLOW_OUT
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-5b2a73da7e1so9529e87.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 18 Aug 2026 07:23:33 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+Rr1t3kEnE/WbyBMrc3p429RaPRV2OITDUFyxfWE9s0FtGwDWXDLRqEhf2PpXR3PfWPMJPky/CUYVtPPgqHwL2c9@lists.infradead.org
X-Gm-Message-State: AOJu0YyPejS4xcwjZdeh9KPS1ZBjR35GzNb8aesJLBON0UUjp5qUDmmc
	FFpMW3QCgK+yro+ajCwcrvx22mdRDQt6WSMfoO62GFy4d/zHr7P2kFGJZD2EzkIvVzJlj36FQRO
	/lgUDf4b9mYR5OIJIWXVmwV/MftBIbpf7g9Jx+4Ui
X-Received: by 2002:a05:6512:10cc:b0:5ae:b9c5:f29f with SMTP id
 2adb3069b0e04-5b471ecc992mr219425e87.2.1787063012292; Tue, 18 Aug 2026
 07:23:32 -0700 (PDT)
MIME-Version: 1.0
References: <20260731143541.956291-1-vdonnefort@google.com> <20260731143541.956291-5-vdonnefort@google.com>
In-Reply-To: <20260731143541.956291-5-vdonnefort@google.com>
From: Fuad Tabba <fuad.tabba@linux.dev>
Date: Tue, 18 Aug 2026 15:22:55 +0100
X-Gmail-Original-Message-ID: <CA+EHjTw9KcKgGDgD=khN8qGPgJAe9POhu1uLby9abDbogwu5sA@mail.gmail.com>
X-Gm-Features: AcwNN1XmyjAJIba9VPk2Ku7RXpeskFOmZC11eun7x4m1kPjfLEO1BYO5VQp3BtI
Message-ID: <CA+EHjTw9KcKgGDgD=khN8qGPgJAe9POhu1uLby9abDbogwu5sA@mail.gmail.com>
Subject: Re: [PATCH v4 04/17] KVM: arm64: Add a heap allocator for the pKVM hyp
To: Vincent Donnefort <vdonnefort@google.com>
Cc: maz@kernel.org, oupton@kernel.org, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, joey.gouly@arm.com, 
	seiden@linux.ibm.com, suzuki.poulose@arm.com, yuzenghui@huawei.com, 
	catalin.marinas@arm.com, will@kernel.org, kernel-team@android.com, 
	qperret@google.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260818_072346_788347_F591E245 
X-CRM114-Status: GOOD (  11.87  )
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

Hi Vincent,

On Fri, 31 Jul 2026 at 15:36, 'Vincent Donnefort' via kernel-team
<kernel-team@android.com> wrote:
...
> +static int hyp_allocator_destroy_chunk(struct hyp_allocator *allocator,
> +                                      struct chunk_hdr *prev,
> +                                      struct chunk_hdr *chunk)
> +{
> +       struct chunk_hdr *next;
> +
> +       next = prev ? chunk_get_next(chunk) : NULL;
> +       if (!hyp_allocator_can_destroy_chunk(allocator, prev, next, chunk))
> +               return -EINVAL;
> +
> +       /* Last chunk in the allocator */
> +       if (!prev) {
> +               allocator->first_unmapped = chunk_unmapped(chunk);
> +               allocator->head = allocator->tail = NULL;
> +               return 0;
> +       }

hyp_allocator_destroy_chunk() has only two callers, both in
hyp_allocator_free(), and both pass a non-NULL prev. So this !prev
branch cannot be reached, and nor can the matching "if (!prev) return
true;" in hyp_allocator_can_destroy_chunk() or the false arm of "next
= prev ? chunk_get_next(chunk) : NULL".

The empty-allocator reset it looks like it is handling already happens
in hyp_allocator_reclaim_chunk(), in the addr == allocator->start
case. Could these be dropped?

With that:

Reviewed-by: Fuad Tabba <fuad.tabba@linux.dev>

Cheers,
/fuad

