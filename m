Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12980E7717F
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Dec 2024 17:35:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=k4PNEAvRpkBk/rqFLCxtUDHCSBUV74NDCgtfS9lmOaQ=; b=k99L3C+H9WIRm0Epa82LOt+9JG
	iNn+J+YeLC562WSM3vwQcQoCVW7jCJGJyph6ydh0jcTe7ugzqpb/PddE6np4wJVcHE9ANGby2gYe3
	npS34rX5nJyd10lprzKKhnc8eF8Vz8svsfdQLgAElPZEbzADcEm5IfQHWVHJg5AZs2ViTItq7f5M3
	0hu6S8vvSEkn/ucjBdiOrtP++yQf83EB7jDfBH6TdQodV/9wiS75DDBYuTxSpiJyFHCblNCCFGVVh
	hdp2Qj0cE6/Gw2p5y8hfxva/bUORQjfI6GfRTmhQ0mh5FjdPnb8NF2ddzD03ZSZ2Ajm+0TRWMOvHX
	NcjQxwsA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tLn6D-00000001CqX-04At;
	Thu, 12 Dec 2024 17:35:41 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tLmeD-000000016c1-16ld
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Dec 2024 17:06:46 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D0D3E1762;
	Thu, 12 Dec 2024 09:07:07 -0800 (PST)
Received: from e133380.arm.com (e133380.arm.com [10.1.197.41])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id E23073F58B;
	Thu, 12 Dec 2024 09:06:38 -0800 (PST)
Date: Thu, 12 Dec 2024 17:06:36 +0000
From: Dave Martin <Dave.Martin@arm.com>
To: linux-kernel@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org, Zeng Heng <zengheng4@huawei.com>,
	Shaopeng Tan <tan.shaopeng@fujitsu.com>,
	James Morse <james.morse@arm.com>
Subject: Re: [RFC PATCH 1/6] arm_mpam: Clean up config update checks in
 mpam_apply_config()
Message-ID: <Z1sYHLZQBW9girSf@e133380.arm.com>
References: <20241212154000.330467-1-Dave.Martin@arm.com>
 <20241212154000.330467-2-Dave.Martin@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241212154000.330467-2-Dave.Martin@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241212_090645_342199_503440AC 
X-CRM114-Status: GOOD (  17.77  )
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

Hi all,

On Thu, Dec 12, 2024 at 03:39:55PM +0000, Dave Martin wrote:
> In mpam_apply_config(), a simple memcmp() test is used to check
> whether the config passed by the caller is already installed or
> not.
> 
> This check will never find a match except (very occasionally) by
> accident, since the component's version of the struct contains
> things that the caller won't pass or doesn't know (such as the
> garbage collection record).  There might also be random padding.
> 
> This may result in MSCs being reprogrammed unnecessarily.
> 
> Instead, only compare fields that the caller specified.  If
> anything is present in the caller's config and doesn't match the
> installed config, paste it across.  If nothing was pasted across
> then the MSC reprogramming step is skipped (as the previous code
> attempted to do).
> 
> Signed-off-by: Dave Martin <Dave.Martin@arm.com>
> 
> ---
> 
> There are comments in the code suggesting a change of this sort.
> I may or may not have gone in the right direction with this, and
> I have only tried to clean up the behaviour rather than optimising.
> 
> No attempt is made to skip unnecessary MSC register updates if the MSC
> reprogramming goes ahead.
> 
> NOT well tested, yet.
> ---

Oops, git rebase didn't spot that this patch had already been applied,
due to adjacent hunks inserted in the meantime from other patches.

This patch can be dropped from this series.

[...]

Cheers
---Dave

