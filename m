Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59440C5518F
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Aug 2026 11:15:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NlvQqMPX1ZBZq6vczB6DK1Q1sg9iUABmibDLc459ooE=; b=2dIo7tM+IkUq1WkcVDkdBYRS42
	R2bGFtQPxUpwzKjvBRvlXU0itCMBtAitVSetzwVO9mwxYS28WlmZPadZXekOkMcJHRQapeowYbj3X
	tNOIE9lyje0Ap8oVqjy274bJ4YIUuvrhc26VxOju2myRFVVQ6OhN5w1LKjH6lDil0wij/5QALkmPC
	Pcq5Za3iDFs2ZkJJERQPRFNdsjF+1sqCKJtxSoFayJHigCYhMsNva8BPkc3HaUI/5EpQLNoFUXyMh
	2AqSexEiXKNsEUsNdykpD1HFl7Lh1/n6FKXhtxsp+7/ddzEZ/7D7cGrphY+VHmykyAw46l9e7+aq5
	OCjy+WIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrD6x-00000001eds-2yON;
	Tue, 04 Aug 2026 11:15:07 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrD6x-00000001edB-0vHa
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Aug 2026 11:15:07 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 25FFD60A59;
	Tue,  4 Aug 2026 11:15:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 211D21F000E9;
	Tue,  4 Aug 2026 11:14:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785842105;
	bh=NlvQqMPX1ZBZq6vczB6DK1Q1sg9iUABmibDLc459ooE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=ZnHoS2uq+Wpn11Z4etXu+hxwCLOTiTcnmGh7C2+5V3PHkGFMDITE9z6uYgjCeYU/L
	 fC2NEuRAvvmECwZZAk2YEwJi/IwoCe8YsK5WKKXZVKTQd4iez0HYq95u5/tbxm135G
	 BW+tRjPZmgs+NDRQXQS+Z1PArA8qMZ3MY68n34Q2d8TV/awui74P0GXMnIVCuorty7
	 wc+LZ/aDpCuNW+K8lOzK6vW28Jlb7Q6F04ycjuf6wruLgZ+JZ8nOR4jzNd1mJrn889
	 QN98PED33opeHD+Qj9pfIsMlzShSZ8hTwHnXReg/xD7GXlIty0nulMgyNHSoKB2eaN
	 uL1Z8zxWAFNqw==
Date: Tue, 4 Aug 2026 12:14:43 +0100
From: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
To: Pedro Falcato <pfalcato@suse.de>
Cc: David Hildenbrand <david@kernel.org>, 
	Andrew Morton <akpm@linux-foundation.org>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>, 
	Helge Deller <deller@gmx.de>, Madhavan Srinivasan <maddy@linux.ibm.com>, 
	Michael Ellerman <mpe@ellerman.id.au>, "Liam R. Howlett" <liam@infradead.org>, 
	Vlastimil Babka <vbabka@kernel.org>, Mike Rapoport <rppt@kernel.org>, 
	Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, 
	"Matthew Wilcox (Oracle)" <willy@infradead.org>, Jan Kara <jack@suse.cz>, Zi Yan <ziy@nvidia.com>, 
	Baolin Wang <baolin.wang@linux.alibaba.com>, Nico Pache <npache@redhat.com>, 
	Ryan Roberts <ryan.roberts@arm.com>, Dev Jain <dev.jain@arm.com>, Barry Song <baohua@kernel.org>, 
	Lance Yang <lance.yang@linux.dev>, Usama Arif <usama.arif@linux.dev>, 
	Kevin Brodsky <kevin.brodsky@arm.com>, Muhammad Usama Anjum <usama.anjum@arm.com>, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-parisc@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, linux-mm@kvack.org, linux-fsdevel@vger.kernel.org
Subject: Re: [PATCH v2 4/6] mm/s390: constify ptep_get() argument
Message-ID: <anHJh7rPomeJgVHc@lucifer>
References: <20260803164400.531199-1-pfalcato@suse.de>
 <20260803164400.531199-5-pfalcato@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260803164400.531199-5-pfalcato@suse.de>
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

On Mon, Aug 03, 2026 at 05:43:58PM +0100, Pedro Falcato wrote:
> It's a simple READ_ONCE() dereference, therefore it can be const.
>
> Signed-off-by: Pedro Falcato <pfalcato@suse.de>

Even I can't be pedantic about this one... :) so:

Reviewed-by: Lorenzo Stoakes (ARM) <ljs@kernel.org>

> ---
>  arch/s390/include/asm/pgtable.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/arch/s390/include/asm/pgtable.h b/arch/s390/include/asm/pgtable.h
> index e882663a58e7..ec331ec92943 100644
> --- a/arch/s390/include/asm/pgtable.h
> +++ b/arch/s390/include/asm/pgtable.h
> @@ -986,7 +986,7 @@ static inline void set_pte(pte_t *ptep, pte_t pte)
>  }
>
>  #define ptep_get ptep_get
> -static inline pte_t ptep_get(pte_t *ptep)
> +static inline pte_t ptep_get(const pte_t *ptep)
>  {
>  	return READ_ONCE(*ptep);
>  }
> --
> 2.55.0
>

--
Cheers, Lorenzo

