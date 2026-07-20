Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28A49C44515
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Jul 2026 21:17:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YsqnHj4FyimjgtMv7CmV+usAxupMfWT9SKb2CMqETk8=; b=FZsy/wbO9bVrDomqb9HuEz6rrZ
	kqrd1OCbcwtiU+XnIDOF42hV8eeFhCiTu7BDyq6L4QO7rM0R1zjiB1gNETcHLi9bYziMIMz7nvFa0
	sKs1+GjgSlGLYpCdMj3hSl5uvGjGZZLzdU/nGQ0TGgw2gC+7z961bHSESNyGU20yesTG5Jmflu0Ns
	3Esx20GbBHco6C/tcfxQtVAsJNqUSgBlueh3zxEngQju+8t4NnNwoGCS+9dGMTMdBxH97McZK9m3c
	n0h0a5A+UQnmvZAUpSYjhu8YzNSTP2vIGZHk/Ksyq4fJ89Vcq8hQWJ8HiSyz/43Ikb5kE5DgcRTa/
	rY4FVN+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wluWA-00000007r5k-214E;
	Mon, 20 Jul 2026 20:23:14 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wluW9-00000007r5M-1C3n
	for linux-arm-kernel@lists.infradead.org;
	Mon, 20 Jul 2026 20:23:13 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 5715560A7A;
	Mon, 20 Jul 2026 20:23:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 434B51F000E9;
	Mon, 20 Jul 2026 20:23:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784578992;
	bh=YsqnHj4FyimjgtMv7CmV+usAxupMfWT9SKb2CMqETk8=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=MRrj/xa+nulFVu8CP3Y32amun/1OABrisq9piQuKX76H6aR2GpXfrTlLPLCqey6nm
	 Mw9r9QIeRmwSJ+im7EphxjZRJOEyBrJ+XzAS42XZgjqfOu7u1FsOImgKawuVEYzuCA
	 A0gcMboPGVaVMrl0hw3vVKZcLe5Z4ArPpw337Jahl8y8pJmpsNUsrLUh9gEyagwK5e
	 mjGHOpzBSp9/JGyJdWB93AhX2gsv6AgPVw/ccKUyZ+8hPpoo+ziiOavoar2iZz3qon
	 vsYgJR2v1uX9UxOoiN0XK1WsumlL4z9au9Oe13Xbf/0ikfELUNKWzVHeuQqR5Godor
	 UuHpwBOR96p0A==
Date: Mon, 20 Jul 2026 21:23:06 +0100
From: Jonathan Cameron <jic23@kernel.org>
To: Richard Cheng <icheng@nvidia.com>
Cc: catalin.marinas@arm.com, will@kernel.org, ryan.roberts@arm.com,
 ardb@kernel.org, kevin.brodsky@arm.com, anshuman.khandual@arm.com,
 yang@os.amperecomputing.com, chaitanyas.prakash@arm.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-cxl@vger.kernel.org, newtonl@nvidia.com, kristinc@nvidia.com,
 mochs@nvidia.com, kaihengf@nvidia.com, kobak@nvidia.com
Subject: Re: [PATCH] arm64/mm: Check the requested PFN range during memoroy
 removal
Message-ID: <20260720212306.674bd0d1@jic23-huawei>
In-Reply-To: <20260720020655.9607-1-icheng@nvidia.com>
References: <20260720020655.9607-1-icheng@nvidia.com>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.52; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
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

On Mon, 20 Jul 2026 10:06:55 +0800
Richard Cheng <icheng@nvidia.com> wrote:

Hi Richard, 

Please run a spell checker over your commit messages. 
"memory" in the patch description for example.

Fix itself looks correct to me.


> prevent_memory_remove_notifier() advances pfn while checking whether the
> range contains early memory. After the loop, pfn points to end_pfn, but
> it is passed to can_unmap_without_split(). This checks the range
> immediately after the requested memory instead of the range being
> offlined.
> 
> Consequently, valid requests can be rejected with shifted address range,
> while an unsafe request can be accepted when the following range is
> unmapped. This was observed with CXL DAX memory, where the final memory
> block was incorrectly allowed offline.
> 
> Pass arg->start_pfn so the leaf-split check examines the requested
> range.
> 
> Fixes: 95a58852b0e5 ("arm64/mm: Reject memory removal that splits a kernel leaf mapping")
> Signed-off-by: Richard Cheng <icheng@nvidia.com>
> ---
> The bug occurred on a machine with CXL Type-3 device.
> Branch: cxl-next
> 
> Before 95a58852b0e5:
> 
> """
> $ sudo echo offline > memory557056/state
> write error: Operation not permitted
> $ sudo dmesg
> ---[snip]---
> [440008000000 440010000000] splits a leaf entry in linear map
> 
> $ sudo echo offline > memory558079/state
> $ cat memory558079/state
> offline
> """
> 
> After:
> """
> $ sudo echo offline > memory557056/state
> write error: Operation not permitted
> [440000000000 440008000000] splits a leaf entry in linear map
> 
> $ sudo echo offline > memory558079/state
> write error: Operation not permitted
> [441ff8000000 442000000000] splits a leaf entry in linear map
> 
> My fix corrects the checked range and prevents the false acceptance.
> 
> Best regards,
> Richard Cheng.
> ---
>  arch/arm64/mm/mmu.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/mm/mmu.c b/arch/arm64/mm/mmu.c
> index a25d8beacc83..18a8b0d3714e 100644
> --- a/arch/arm64/mm/mmu.c
> +++ b/arch/arm64/mm/mmu.c
> @@ -2194,7 +2194,7 @@ static int prevent_memory_remove_notifier(struct notifier_block *nb,
>  		}
>  	}
>  
> -	if (!can_unmap_without_split(pfn, arg->nr_pages))
> +	if (!can_unmap_without_split(arg->start_pfn, arg->nr_pages))
>  		return NOTIFY_BAD;
>  
>  	return NOTIFY_OK;
> 
> base-commit: 5ca04f3ba91f1773bbd5da6d9c654ccc1ba7831d


