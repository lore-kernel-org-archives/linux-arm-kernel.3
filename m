Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B375C87FC9
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Jul 2025 11:16:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CYjGaCie3d/4kI14FYpa59dXYlKDuW8dpIG5d2+A1Mk=; b=jQxIOBc1wOdy7zzCHBZrFASLT5
	amwuu2BH4MBtJaBOpUfiyUuIKWrJd64LrpLoKk7P8sBFezLzRqhkJu5eUBQDjN+WYc2bgV2menE7N
	ub1DofCMev4Zg4fUkVtlINZMzjaagLnwC/uron57bklCwWmRzbZonzoKfNTwDhIFnYQbt1j2xiP7M
	OExw7pXnZe7slk/QCDnO6UhTpKzKQx9jJmfKJ1s8H9lhHJlbgr9Ezd1oZlwqoh4B7wOsBEBa3Csld
	+Cx1Pb2IWL8PTVFcSf3mXLvAtlrg66/MTslShB/j53oPPuSvOS57qrG2K3nVIxIzeISZ2UD3/2ID4
	Z/wsZuYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugLqI-0000000EKkX-3act;
	Mon, 28 Jul 2025 11:16:31 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugLnq-0000000EKaB-3Ip5
	for linux-arm-kernel@lists.infradead.org;
	Mon, 28 Jul 2025 11:14:00 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D7B99152B;
	Mon, 28 Jul 2025 04:13:47 -0700 (PDT)
Received: from [10.57.87.40] (unknown [10.57.87.40])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 829243F66E;
	Mon, 28 Jul 2025 04:13:53 -0700 (PDT)
Message-ID: <f0e12d1e-110d-4a56-9f77-8fe2d664b0d1@arm.com>
Date: Mon, 28 Jul 2025 12:13:51 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64/mm: Fix use-after-free due to race between memory
 hotunplug and ptdump
Content-Language: en-GB
To: Dev Jain <dev.jain@arm.com>, catalin.marinas@arm.com, will@kernel.org
Cc: anshuman.khandual@arm.com, quic_zhenhuah@quicinc.com,
 kevin.brodsky@arm.com, yangyicong@hisilicon.com, joey.gouly@arm.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 mark.rutland@arm.com, maz@kernel.org, stable@vger.kernel.org
References: <20250728103137.94726-1-dev.jain@arm.com>
From: Ryan Roberts <ryan.roberts@arm.com>
In-Reply-To: <20250728103137.94726-1-dev.jain@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250728_041358_875231_7BD00BB6 
X-CRM114-Status: GOOD (  10.01  )
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

On 28/07/2025 11:31, Dev Jain wrote:
> Memory hotunplug is done under the hotplug lock and ptdump walk is done
> under the init_mm.mmap_lock. Therefore, ptdump and hotunplug can run
> simultaneously without any synchronization. During hotunplug,
> free_empty_tables() is ultimately called to free up the pagetables.
> The following race can happen, where x denotes the level of the pagetable:
> 
> CPU1					CPU2
> free_empty_pxd_table
> 					ptdump_walk_pgd()
> 					Get p(x+1)d table from pxd entry
> pxd_clear
> free_hotplug_pgtable_page(p(x+1)dp)
> 					Still using the p(x+1)d table
> 
> which leads to a user-after-free.

I'm not sure I understand this. ptdump_show() protects against this with
get_online_mems()/put_online_mems(), doesn't it? There are 2 paths that call
ptdump_walk_pgd(). This protects one of them. The other is ptdump_check_wx(); I
thought you (or Anshuman?) had a patch in flight to fix that with
[get|put]_online_mems() too?

Sorry if my memory is failing me here...

