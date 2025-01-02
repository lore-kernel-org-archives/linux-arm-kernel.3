Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31A74E7718B
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  2 Jan 2025 16:56:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KVwKHyu8Gg+zMPltZA366Kn5pjCmCCo125yHAly9hf8=; b=1c82T8emwzrRwI2hsJGKYA+StQ
	CrDNQTUJw+KSJfFqQvfHyE/SE5LHf6W6vivoRdh6tveREn8DMFCpM5jHriQc4QpXhlZP54sAW/OBc
	FDyM01qHjit97ySmLNwTEu/vDPd1O7qbZfK8V9KvlkZc72W95C8+kSV7eXroz7mdivRlpNMj/BjMV
	R2xc4CgWp3/34PvJ9H5wlrgnYg/p/03+HqAls9qmyPpNLPqxd80InDgcHQzNIk4NpOBtjr9XN/USH
	ooKiKAmSHqZ1HPfFnV2TxHBJY/c9gJb52zlCtk2N1nqplGuK5wGaVDkNCDVw0jBVettFEl6AX+kWo
	680qUe2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tTOUu-0000000AuQd-243b;
	Thu, 02 Jan 2025 16:56:36 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tTOSZ-0000000AtzS-3d8B;
	Thu, 02 Jan 2025 16:54:13 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id AA569153B;
	Thu,  2 Jan 2025 08:54:39 -0800 (PST)
Received: from [10.57.91.208] (unknown [10.57.91.208])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 23C923F673;
	Thu,  2 Jan 2025 08:54:02 -0800 (PST)
Message-ID: <1b09335c-f0b6-4ccb-9800-5fb22f7e8083@arm.com>
Date: Thu, 2 Jan 2025 17:53:58 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 10/15] riscv: pgtable: move pagetable_dtor() to
 __tlb_remove_table()
To: Qi Zheng <zhengqi.arch@bytedance.com>, peterz@infradead.org,
 agordeev@linux.ibm.com, palmer@dabbelt.com, tglx@linutronix.de,
 david@redhat.com, jannh@google.com, hughd@google.com, yuzhao@google.com,
 willy@infradead.org, muchun.song@linux.dev, vbabka@kernel.org,
 lorenzo.stoakes@oracle.com, akpm@linux-foundation.org, rientjes@google.com,
 vishal.moola@gmail.com, arnd@arndb.de, will@kernel.org,
 aneesh.kumar@kernel.org, npiggin@gmail.com, dave.hansen@linux.intel.com,
 rppt@kernel.org, ryan.roberts@arm.com
Cc: linux-mm@kvack.org, linux-arm-kernel@lists.infradead.org,
 linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org,
 linux-s390@vger.kernel.org, sparclinux@vger.kernel.org,
 linux-kernel@vger.kernel.org, x86@kernel.org, linux-arch@vger.kernel.org,
 linux-csky@vger.kernel.org, linux-hexagon@vger.kernel.org,
 loongarch@lists.linux.dev, linux-m68k@lists.linux-m68k.org,
 linux-mips@vger.kernel.org, linux-openrisc@vger.kernel.org,
 linux-sh@vger.kernel.org, linux-um@lists.infradead.org
References: <cover.1735549103.git.zhengqi.arch@bytedance.com>
 <0e8f0b3835c15e99145e0006ac1020ae45a2b166.1735549103.git.zhengqi.arch@bytedance.com>
Content-Language: en-GB
From: Kevin Brodsky <kevin.brodsky@arm.com>
In-Reply-To: <0e8f0b3835c15e99145e0006ac1020ae45a2b166.1735549103.git.zhengqi.arch@bytedance.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250102_085411_952368_A0CBCDD6 
X-CRM114-Status: UNSURE (   7.81  )
X-CRM114-Notice: Please train this message.
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

On 30/12/2024 10:07, Qi Zheng wrote:
>  static inline void riscv_tlb_remove_ptdesc(struct mmu_gather *tlb, void *pt)
>  {
> -	if (riscv_use_sbi_for_rfence())
> +	if (riscv_use_sbi_for_rfence()) {
>  		tlb_remove_ptdesc(tlb, pt);
> -	else
> +	} else {
> +		pagetable_dtor(pt);
>  		tlb_remove_page_ptdesc(tlb, pt);

I find the imbalance pretty confusing: pagetable_dtor() is called
explicitly before using tlb_remove_page() but not tlb_remove_ptdesc().
Doesn't that assume that CONFIG_MMU_GATHER_HAVE_TABLE_FREE is selected?
Could we not call pagetable_dtor() from __tlb_batch_free_encoded_pages()
to ensure that the dtor is always called just before freeing, and remove
the extra handling from arch code? I may well be missing something, I'm
not super familiar with the tlb handling code.

- Kevin

