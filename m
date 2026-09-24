Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F827C9830E
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Sep 2026 18:00:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yIrEACM/1hk8RvSSdnwytl7iIy1+VcppA4PP9Tt2BDk=; b=mRWQFGhX4dOzm0Q94x8PkeL0n2
	aAMv6jNOGHVXFKodgdHn0CWDM3JHPat5+5rABCtkHO5ZUXlhhJLORuiCsFjByEbSnMZ79o/GJAOdx
	LkgKX+jjBZtHI4hf0joVbSXJTzR1rFDhsxC6boZRxQ6KnRf9GcraXQzdVesyOuS/j9MZ+zZ6cyQ0/
	sgdVlBe+3zfUi7xRqY6MaCdlMbQehm2KcaDQtohmcHjFl4ewC+kXoVqXFBK1SEgptTRUX2VXF0rmV
	xNVzihEXHb+6JA9y2m4EOrFBWTquXlrvwFkR4F9JQCl6HIK1ukOkhAPfLivypo9cqvbHxbk3qtCvC
	m7nkVbsg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9nkA-0000000Bqys-31RG;
	Thu, 24 Sep 2026 18:00:26 +0000
Received: from mail-qt1-x834.google.com ([2607:f8b0:4864:20::834])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9nk7-0000000BqxG-1N03
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Sep 2026 18:00:25 +0000
Received: by mail-qt1-x834.google.com with SMTP id d75a77b69052e-52f9fc510e1so8275671cf.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 24 Sep 2026 11:00:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1790272822; x=1790877622; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=yIrEACM/1hk8RvSSdnwytl7iIy1+VcppA4PP9Tt2BDk=;
        b=EcdN7Q3rP776qc8wZL2iTjjhL/qGk5NmmrMk87vwYPWp9hV0fqAmtAtWeTgTlln7wP
         EDp+TnSLgrKe1WGphYhPrl8Ak3VLf7nMpVYutpgDAjGKXB0S3Suho9UmkOT9URJv2m8D
         mI8U+awCZqV4q9n1zGUxP4/q7mCVbnBvKJYjYWSWT7Q4+Rw9yS/p5hYYPvhaJLU0SCz4
         m4YaZdVoyc2iV7S+ekT6dcpjBydEhS7bRsvw4QaNwJEb62ZDTXpzHnbX7jovxn4ekykq
         aFdhuRsGj3GqVlY37/ID5IE7etNUCNR2VlmMwoR7AVWoFv0zAxCdCzpBMQwXlm3R/qpW
         y+kA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790272822; x=1790877622;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yIrEACM/1hk8RvSSdnwytl7iIy1+VcppA4PP9Tt2BDk=;
        b=Ef7iRkAyA4chi0aAK3rL5oBCNFobd0dhCEh7SmTB0lU4b+Ze11Kk5dFXl9IeCcXI9T
         QBL6QmNgWnhtQGCJavGF6ilVfsSgsHtSLgeLSlkv6oNsjGxjtmVkgW8Gj9WCZg8v57GH
         EveVoDWnJNbzQiv2/pWdpG5Hjb4gnULLHypugYW78kDHC9bhJNJ+7LBOeYsprKNyaqqI
         U/BYboHhpToCFI4KSBlUGhjSRT5+w2V24b5FIA269BKKXh+Q0SiB/zVO3nzyiZQXbci8
         pQmMXwr0aYmZkytJqxcVB1Z/YxKv1HUrNPLzHFl5+p7hSVL4rTLjAt16uv/NU2opEUZM
         jn1w==
X-Forwarded-Encrypted: i=1; AKwUvBymAsuPZyTUCBF/ZpmRuv3QnoucNtJGJ+78Uh1/z4GPWZCDLjGgHuRYhiFwhs0vyNSOPgWzWNe2wzlI3AmECnI8@lists.infradead.org
X-Gm-Message-State: AFuF++ntCAnRg8LHilXGbVeayRZ8hvdITrKCgvmc/K1ruC8oveM82phV
	gWaYBs4ykPCCf10fzdKBFSE6PuuS1+pMQ5WRKVY0D+TXBoF/091rh+LJYR6qMAonKMg=
X-Gm-Gg: AYBFou3mh7LuUf8XdXaLZn0obXlHV49uXCgQOLutFtNkw1W8IgyzGfEEEEK2ekB6P0F
	mEm/ZLgcBWSHpsEvJAA+is0wvWu/uxSMKgx/VyW2Prw4HFGwY3L+txBC25fP+ftVWF/HWlysssT
	+eJXQp2a5KEdhJ51aF8D53lLkvWBL4qNOfNKT1B7G2/gsB6U1Ee5FuXUImAnmqpfhFEIqzEwyDO
	e+wZq/yP60LAJo7YdDpV7gqS3XcJSMumGCKAzlL/csRA4FWScQv2+kbI6eYsoIgAu8NzC/3Xl7a
	WOeUgT/9wNumn2c+lb+o9c8y77H5vq3SWOAfAatoHvsm+uRxUAmqpMOnMOinlmUORYAMlThIJbr
	a+LvSJtvXectjnwXTiruJ1b5rkrzGLAwRewCnbTMJIxs5csGpMx5zDlQyiA3Lid8Dc6rh6c0Ko1
	KuNBOoTbRGadxrKNz5pFTxu/5RxYYn65otVrE8biak1HNm9k+9CXSWR46vEuC0S2taXUmKj6ha8
	V338khgbmtBJZmyC+oZNjBnK0ow83vfDGn7WZ2ReEoAeZbfnQ88bG0=
X-Received: by 2002:ac8:5a46:0:b0:530:e682:87c with SMTP id d75a77b69052e-5330b6df434mr78501cf.33.1790272821894;
        Thu, 24 Sep 2026 11:00:21 -0700 (PDT)
Received: from gourry-fedora-PF4VCD3F (pool-173-79-60-52.washdc.fios.verizon.net. [173.79.60.52])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-532eb38d347sm47450101cf.25.2026.09.24.11.00.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 11:00:21 -0700 (PDT)
Date: Thu, 24 Sep 2026 14:00:18 -0400
From: Gregory Price <gourry@gourry.net>
To: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, 
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, linux-usb@vger.kernel.org, 
	linux-rdma@vger.kernel.org, selinux@vger.kernel.org, linux-sound@vger.kernel.org, 
	bpf@vger.kernel.org, linux-scsi@vger.kernel.org, linux-fbdev@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, linux-trace-kernel@vger.kernel.org, 
	linux-perf-users@vger.kernel.org, linux-arch@vger.kernel.org, linux-fsdevel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, linuxppc-dev@lists.ozlabs.org, 
	kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, 
	linux-s390@vger.kernel.org, sparclinux@vger.kernel.org, fuse-devel@lists.linux.dev
Subject: Re: [PATCH v3 05/40] mm/vma: ensure mmap_prepare doesn't set actions
 on a mergeable vma
Message-ID: <arVkwC_wNoTLjRYf@gourry-fedora-PF4VCD3F>
References: <20260917-b4-mmap-prepare-vma-flag-sanify-v3-0-4583d8a23bca@kernel.org>
 <20260917-b4-mmap-prepare-vma-flag-sanify-v3-5-4583d8a23bca@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260917-b4-mmap-prepare-vma-flag-sanify-v3-5-4583d8a23bca@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260924_110023_375594_A504DEA8 
X-CRM114-Status: GOOD (  21.91  )
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

On Thu, Sep 17, 2026 at 05:22:14PM +0100, Lorenzo Stoakes (ARM) wrote:
> When a user requests an mmap_action be performed in mmap_prepare, this
> involves populating the VMA range with data.
> 
> However, if the VMA is mergeable, it might then mistakenly be merged with
> another VMA without having populated the range.
> 
> Every mmap action currently available sets VMA flags such that the VMA
> cannot be merged.
> 
> However, to ensure that no future mmap action falls foul of this, assert
> that this is the case upon mmap_prepare validation.
> 
> Signed-off-by: Lorenzo Stoakes (ARM) <ljs@kernel.org>
> ---
>  mm/vma.c | 9 +++++++++
>  1 file changed, 9 insertions(+)
> 
> diff --git a/mm/vma.c b/mm/vma.c
> index d6ed10cefc8f..62f2ce1ad5a1 100644
> --- a/mm/vma.c
> +++ b/mm/vma.c
> @@ -2809,6 +2809,15 @@ static int mmap_validate(unsigned long prev_start, unsigned long prev_end,
>  int mmap_prepare_validate(const struct vm_area_desc *prev_desc,
>  			  const struct vm_area_desc *desc)
>  {
> +	/*
> +	 * It is not valid to execute mmap actions for VMAs which can be merged,
> +	 * as any such merge would leave portions of the mapping incorrectly
> +	 * unmapped.
> +	 */
> +	if (vma_flags_can_merge(&desc->vma_flags) &&
> +	    WARN_ON_ONCE(desc->action.type != MMAP_NOTHING))
> +		return -EINVAL;
> +

If you wanted to make this unit-testable, you could pull it out into a
separate function:

static bool mmap_action_is_valid(const struct vm_area_desc *desc)
{
	return desc->action.type == MMAP_NOTHING ||
		!vma_flags_can_merge(&desc->vma_flags);
}

then write:

if (WARN_ON_ONCE(!mmap_action_is_valid(desc)))
	return -EINVAL;

And you can write a unit test directly against mmap_action_is_valid

otherwise

Reviewed-by: Gregory Price (Meta) <gourry@gourry.net>

