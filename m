Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 753C9C98321
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Sep 2026 16:15:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UX7EgEFsk5EAatKOOTUC+al3WpafligDGOXSJOLt4Hw=; b=M2uNtYmO8kZeK7gAqAwN3saYfO
	DXDa5p40rGptkd2Fnroc2QuCNVa4GgXuoZ3Po67ft43OVN61S44CJGUzEhowCwyBE9BUluWJcXjM9
	KoaCRzXP9dMqBpP8pRuS3fPq9hEHunnVNa7+uDIwKuSJAz7lYYTNN7cEtB7YX4ZzvN90SsrVfKZw2
	TQsklI+dJv6pmlsJ/ZgPEeq7PNTHXwZi0a7DtjG13jwfdr4HpSMCKnVtoDTQn1meLHXOVYypO4y86
	cJe7Cbsr2olZTixQvCMELGhYHAZxqFr7Pv8VMb4riRJXJbX3GjRfC72aLUdyCVrwFaN44UTmL++/t
	6TozA5+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9m6n-0000000BZNL-0usA;
	Thu, 24 Sep 2026 16:15:41 +0000
Received: from out-237.mta1.migadu.com ([95.215.58.237] helo=mta1.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9m6h-0000000BZJr-05Ef
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Sep 2026 16:15:36 +0000
X-Envelope-To: linux-arm-kernel@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=UX7EgEFsk5EAatKOOTUC+al3WpafligDGOXSJOLt4Hw=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1790266533; v=1; x=1790871333;
 b=xtK/V5rE0nZEKEt+pCWKgoJP/ZBaBz1M56WR8vBqtEX2t0flfX9Gze/fwklHbU6naQynTFva
 pJvYT9QKBob8K4OrL8mD9/aoAtFwNqw8CaDrEypAWPl1I+IqRbWBNSPEsQl7aMd1xvARc+AVrKv
 ixkR9eIWGm5Ad3fbBb5PoAuE=
X-Envelope-To: linux-arm-kernel@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id 974c15c8f00c7a07;
	Thu, 24 Sep 2026 16:15:33 +0000
X-Mizu-Trace-ID: 974c15c8f00c7a07
X-Migadu-Flow: FLOW_OUT
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-5b8c42da963so11644e87.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 24 Sep 2026 09:15:31 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBwUAl1U57luZ5wDXe6iAH+IBCYE4NJ/xJaJr4loHs38/EI+mzVWsJZsviKajy4s0K2t1id05TAfQ9hwSkZt3WqI@lists.infradead.org
X-Gm-Message-State: AFuF++lBniLtrKTl/W9gmnUjXYFN/l9Y5Es/u5XbXdPezuQrTsATKbfU
	nazNsAkmaEy//jCYTzNkSDVS8TvKX/IgNqdEXZFgPP6Kyub8UUh2B+Git+GDgEIWoKSAmuxWFN4
	m95zeYG5ens25eYDulkf35SzxcGOrFAsyI82IRBVu
X-Received: by 2002:a05:6512:32c9:b0:5b8:d442:fdc8 with SMTP id
 2adb3069b0e04-5b8de5d9325mr177197e87.11.1790266530330; Thu, 24 Sep 2026
 09:15:30 -0700 (PDT)
MIME-Version: 1.0
References: <20260924095154.807726-1-vdonnefort@google.com>
In-Reply-To: <20260924095154.807726-1-vdonnefort@google.com>
From: Fuad Tabba <fuad.tabba@linux.dev>
Date: Thu, 24 Sep 2026 17:14:54 +0100
X-Gmail-Original-Message-ID: <CA+EHjTzOZi-N4XCRKGBKqa2=PJZRyVskooGgT4HWAwErUTMROA@mail.gmail.com>
X-Gm-Features: AclHuK_tH6CK7thhQNxrfh8ab79-Xf84DjyiuvCMf80g1V6Cn9QTyhYpfN_0fio
Message-ID: <CA+EHjTzOZi-N4XCRKGBKqa2=PJZRyVskooGgT4HWAwErUTMROA@mail.gmail.com>
Subject: Re: [PATCH] KVM: arm64: Remove PAGE_SIZE alignment for hyp event ELF sections
To: Vincent Donnefort <vdonnefort@google.com>
Cc: maz@kernel.org, oupton@kernel.org, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, joey.gouly@arm.com, 
	seiden@linux.ibm.com, suzuki.poulose@arm.com, yuzenghui@huawei.com, 
	catalin.marinas@arm.com, will@kernel.org, kernel-team@android.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260924_091535_218121_1DBFF933 
X-CRM114-Status: GOOD (  10.66  )
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

On Thu, 24 Sep 2026 10:51:54 +0100, Vincent Donnefort
<vdonnefort@google.com> wrote:
> .hyp.event_ids is mapped as part of .hyp.rodata. As a consequence this
> section does not need any page-alignment. Remove it to save a page worth
> of memory.
>
> Fixes: 0a90fbc8a170 ("KVM: arm64: Add event support to the nVHE/pKVM hyp and trace remote")

Could you either drop the Fixes: tag or say in the message what goes
wrong without this patch? As it stands the message describes a
one-page saving, and the tag makes it a candidate for stable.

With that:
Reviewed-by: Fuad Tabba <fuad.tabba@linux.dev>

Tested with the hypervisor remote ftrace selftests, in pKVM and in nVHE:
Tested-by: Fuad Tabba <fuad.tabba@linux.dev>

Cheers,
/fuad

