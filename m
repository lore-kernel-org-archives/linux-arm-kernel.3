Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27523606A329
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Nov 2026 02:21:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=DyyCBNPY;
	dkim=pass (2048-bit key, unprotected) header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=2212171451 header.b=AfRgpS1b
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:Content-Transfer-Encoding
	:In-Reply-To:Subject:From:References:Message-Id:Content-Type:To:Mime-Version:
	Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=No6e7FX1QyMHXiq5uSkrdQU3PoMJKwFtYVvKfbAY2G0=; b=DyyCBNPYPyXZwq
	VM8LVYV3yW+SunNvQLunFPXgnNjah+PrnHnYOcTRLx4d16bBpUTu1JjVqnbFNFCPE3/xn+0bbKiTy
	oPST0uM3fsmbyMBr/Fl13nSeflNRfeKVvvPiuctMoAMPb+sE19sPJB/dS115BFNPuWmavDwnFoZpD
	PHUOxY+LuA0tqe8O5ljITSgVUe798qS8FOKRi9jwROwZHE3i6E7J+15ievGTU3RZCHGuZ19Qne6ji
	kLK/zsOeOEIF8cuisZ508UIFEXEwjQ2afPJsJw+HLlbpod3fHR67xKIAPQ5nxRyS5zt9VlzSi0ooe
	0jZxo0dI8XNZMJf/98TQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOQdI-00000004970-047d;
	Wed, 04 Nov 2026 02:21:48 +0000
Received: from va-1-114.ptr.blmpb.com ([209.127.230.114])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOQdF-0000000496h-09AT
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Nov 2026 02:21:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=2212171451; d=bytedance.com; t=1793758899; h=from:subject:
 mime-version:from:date:message-id:subject:to:cc:reply-to:content-type:
 mime-version:in-reply-to:message-id;
 bh=No6e7FX1QyMHXiq5uSkrdQU3PoMJKwFtYVvKfbAY2G0=;
 b=AfRgpS1bnIQW2x4jiAUjh8Zh2/fcYgU7xYeZpJKEwAQSOPhObCagEaIT4YK9SQ7NOmGOAJ
 88h2qDnnpwBcM4dltjgF/C0HZC3JPB3hfK+XKETsl6hakGuqJWHOF4kR94b1GIkwamrZOX
 fzgONbX9d/lCYkU49iwMh/e2jx/R91Auboh+Lb1arCz8d5vXLHGG7ecob0lkaFHAM9lRI+
 0Y8NwZnuo6o1Y68VxJ8WrG28nA32Lcz+h7syyi3z60dOp/i3n3denoYIW3UQpWLT1lKnLO
 +971rSQK608SCrI4HaI9k6ui6e0b1TSlSlGfwFzdI67DdsU8ayt/JRRqbZdJGA==
Date: Wed, 4 Nov 2026 10:21:24 +0800
X-Archived-By: <archiver.kernel.org>
Mime-Version: 1.0
User-Agent: Mozilla Thunderbird
To: "Catalin Marinas" <catalin.marinas@arm.com>
X-Original-From: Zhao Gongyi <zhaogongyi@bytedance.com>
Content-Type: text/plain; charset=UTF-8
Message-Id: <3d26a89a-7fa2-4daa-a919-82708410d104@bytedance.com>
References: <20261101171030.87343-1-zhaogongyi@bytedance.com> <aun4-MXVMZNrmvGr@arm.com>
From: "Zhao Gongyi" <zhaogongyi@bytedance.com>
Subject: Re: [PATCH] arm64: mm: validate /dev/mem mmap ranges without overflow
In-Reply-To: <aun4-MXVMZNrmvGr@arm.com>
X-Lms-Return-Path: <lba+26aea96b1+af7256+lists.infradead.org+zhaogongyi@bytedance.com>
Content-Transfer-Encoding: 7bit
Cc: "Will Deacon" <will@kernel.org>, "Mark Rutland" <mark.rutland@arm.com>, 
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261103_182145_150565_FACDC789 
X-CRM114-Status: UNSURE (   9.22  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-7.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Catalin,

On 11/3/26 11:08 PM, Catalin Marinas wrote:
> 
> Can we write this as:
> 
> int valid_mmap_phys_addr_range(unsigned long pfn, size_t size)
> {
>          phys_addr_t limit = PHYS_MASK + 1;
> 
>          return size <= limit && pfn <= (limit - size) >> PAGE_SHIFT;
> }
> 
> It would resemble the generic __access_ok() better where we need to
> check for similar overflow. I find it easier to read.
> 
> (happy to make the change when applying)
> 

Thanks, your version is clearer. Please feel free to make the change 
when applying.

Thanks,
Gongyi

