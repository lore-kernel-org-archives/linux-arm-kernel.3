Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0FC30C02190
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 30 Jan 2025 10:25:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZD1UotWZinoa9Btjp8PatWXKXLCNsLJqcY7V15WjKeU=; b=RkJA+kw18PLGHXgzhtTyhH+aUd
	a2SexgBaUwkFX7UHcnyoNEgupdHsCtsiPftVp/y8CxrgdJ/VG2Fh2mgdZLWZs5TLoSNVRZjkGGcaj
	5UlCwaByHOlAaGwohF5ZEUUv/psIVG/HTHotL3Cushuw45HdfXgEYykR2rhFddXusN6WmkVP7QJIA
	4Zc6DDcQ3Ih8G2kvmgg9JEIULAzRAv3ystN3Txmyy6ULxeXPCkmdr/ULAp325Bw8wmLq7hOh9MSY0
	uDNo64Myfp29WJDl+PHLXeX3UmiuWgJM3T3njsKQ5TAa8ZRM/OZ8+wnQjWK31/Gu5lE3j40hhp0lv
	SogXUjrQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tdRjf-00000008cbQ-0GQX;
	Thu, 30 Jan 2025 10:25:23 +0000
Received: from linux.microsoft.com ([13.77.154.182])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tdRhJ-00000008bzd-45w4
	for linux-arm-kernel@lists.infradead.org;
	Thu, 30 Jan 2025 10:22:59 +0000
Received: from [10.156.205.88] (unknown [167.220.238.88])
	by linux.microsoft.com (Postfix) with ESMTPSA id 160822109CD7;
	Thu, 30 Jan 2025 02:22:53 -0800 (PST)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 160822109CD7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1738232577;
	bh=ZD1UotWZinoa9Btjp8PatWXKXLCNsLJqcY7V15WjKeU=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Glx4m7JYGvmBUByiNou3MhDxn502oeVLmJJ9la4VrUNKGY4ZLwfQpYoD9iXYvKHiE
	 Tc6qTSCJ5IBEwV1c/plANWOVB60oOLolaf3wd1E/9lSiL+uRy5RTwG6+EjPNLs/aX6
	 mOvu+53CPqeumQWZMj6AtbR3QqIla86j/EtI1uKY=
Message-ID: <c034b597-e128-4356-bcc9-79fb5e39a844@linux.microsoft.com>
Date: Thu, 30 Jan 2025 15:52:52 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/8] unwind: Implement generic sframe unwinder library
To: Weinan Liu <wnliu@google.com>, Josh Poimboeuf <jpoimboe@kernel.org>,
 Steven Rostedt <rostedt@goodmis.org>, Indu Bhagat <indu.bhagat@oracle.com>,
 Peter Zijlstra <peterz@infradead.org>
Cc: Mark Rutland <mark.rutland@arm.com>, roman.gushchin@linux.dev,
 Will Deacon <will@kernel.org>, Ian Rogers <irogers@google.com>,
 linux-toolchains@vger.kernel.org, linux-kernel@vger.kernel.org,
 live-patching@vger.kernel.org, joe.lawrence@redhat.com,
 linux-arm-kernel@lists.infradead.org
References: <20250127213310.2496133-1-wnliu@google.com>
 <20250127213310.2496133-5-wnliu@google.com>
Content-Language: en-US
From: Prasanna Kumar T S M <ptsm@linux.microsoft.com>
In-Reply-To: <20250127213310.2496133-5-wnliu@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250130_022258_074909_BAF60EF7 
X-CRM114-Status: GOOD (  33.95  )
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


On 28-01-2025 03:03, Weinan Liu wrote:
> This change introduces a kernel space unwinder using sframe table for
> architectures without ORC unwinder support.
>
> The implementation is adapted from Josh's userspace sframe unwinder
> proposal[1] according to the sframe v2 spec[2].
>
> [1] https://lore.kernel.org/lkml/42c0a99236af65c09c8182e260af7bcf5aa1e158.1730150953.git.jpoimboe@kernel.org/
> [2] https://sourceware.org/binutils/docs/sframe-spec.html
>
> Signed-off-by: Weinan Liu <wnliu@google.com>
> ---
>   include/linux/sframe_lookup.h |  43 ++++++++
>   kernel/Makefile               |   1 +
>   kernel/sframe_lookup.c        | 196 ++++++++++++++++++++++++++++++++++
>   3 files changed, 240 insertions(+)
>   create mode 100644 include/linux/sframe_lookup.h
>   create mode 100644 kernel/sframe_lookup.c
>
> diff --git a/include/linux/sframe_lookup.h b/include/linux/sframe_lookup.h
> new file mode 100644
> index 000000000000..1c26cf1f38d4
> --- /dev/null
> +++ b/include/linux/sframe_lookup.h
> @@ -0,0 +1,43 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +#ifndef _LINUX_SFRAME_LOOKUP_H
> +#define _LINUX_SFRAME_LOOKUP_H
> +
> +/**
> + * struct sframe_ip_entry - sframe unwind info for given ip
> + * @cfa_offset: Offset for the Canonical Frame Address(CFA) from Frame
> + *              Pointer(FP) or Stack Pointer(SP)
> + * @ra_offset: Offset for the Return Address from CFA.
> + * @fp_offset: Offset for the Frame Pointer (FP) from CFA.
> + * @use_fp: Use FP to get next CFA or not
> + */
> +struct sframe_ip_entry {
> +	int32_t cfa_offset;
> +	int32_t ra_offset;

The ra_offset is not present for x86_64 in SFrame FRE as per the spec. I 
am wondering whether this struct should change based on the architecture 
or just set ra_offset calculated from cfa_offset for x86_64.

> +	int32_t fp_offset;
> +	bool use_fp;
> +};
> +
> +/**
> + * struct sframe_table - sframe struct of a table
> + * @sfhdr_p: Pointer to sframe header
> + * @fde_p: Pointer to the first of sframe frame description entry(FDE).
> + * @fre_p: Pointer to the first of sframe frame row entry(FRE).
> + */
> +struct sframe_table {
> +	struct sframe_header *sfhdr_p;
> +	struct sframe_fde *fde_p;
> +	char *fre_p;
> +};
> +
> +#ifdef CONFIG_SFRAME_UNWINDER
> +void init_sframe_table(void);
> +int sframe_find_pc(unsigned long pc, struct sframe_ip_entry *entry);
> +#else
> +static inline void init_sframe_table(void) {}
> +static inline int sframe_find_pc(unsigned long pc, struct sframe_ip_entry *entry)
> +{
> +	return -EINVAL;
> +}
> +#endif
> +
> +#endif /* _LINUX_SFRAME_LOOKUP_H */
> diff --git a/kernel/Makefile b/kernel/Makefile
> index 87866b037fbe..705c9277e5cd 100644
> --- a/kernel/Makefile
> +++ b/kernel/Makefile
> @@ -131,6 +131,7 @@ obj-$(CONFIG_WATCH_QUEUE) += watch_queue.o
>   
>   obj-$(CONFIG_RESOURCE_KUNIT_TEST) += resource_kunit.o
>   obj-$(CONFIG_SYSCTL_KUNIT_TEST) += sysctl-test.o
> +obj-$(CONFIG_SFRAME_UNWINDER) += sframe_lookup.o
>   
>   CFLAGS_stackleak.o += $(DISABLE_STACKLEAK_PLUGIN)
>   obj-$(CONFIG_GCC_PLUGIN_STACKLEAK) += stackleak.o
> diff --git a/kernel/sframe_lookup.c b/kernel/sframe_lookup.c
> new file mode 100644
> index 000000000000..846f1da95d89
> --- /dev/null
> +++ b/kernel/sframe_lookup.c
> @@ -0,0 +1,196 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +#include <linux/module.h>
> +#include <linux/sort.h>
> +#include <linux/sframe_lookup.h>
> +#include <linux/kallsyms.h>
> +#include "sframe.h"
> +
> +#define pr_fmt(fmt)	"sframe: " fmt
> +
> +extern char __start_sframe_header[];
> +extern char __stop_sframe_header[];
> +
> +static bool sframe_init __ro_after_init;
> +static struct sframe_table sftbl;
> +
> +#define SFRAME_READ_TYPE(in, out, type)					\
> +({									\
> +	type __tmp;							\
> +	memcpy(&__tmp, in, sizeof(__tmp));				\
> +	in += sizeof(__tmp);						\
> +	out = __tmp;							\
> +})
> +
> +#define SFRAME_READ_ROW_ADDR(in_addr, out_addr, type)			\
> +({									\
> +	switch (type) {							\
> +	case SFRAME_FRE_TYPE_ADDR1:					\
> +		SFRAME_READ_TYPE(in_addr, out_addr, u8);		\
> +		break;							\
> +	case SFRAME_FRE_TYPE_ADDR2:					\
> +		SFRAME_READ_TYPE(in_addr, out_addr, u16);		\
> +		break;							\
> +	case SFRAME_FRE_TYPE_ADDR4:					\
> +		SFRAME_READ_TYPE(in_addr, out_addr, u32);		\
> +		break;							\
> +	default:							\
> +		break;							\
> +	}								\
> +})
> +
> +#define SFRAME_READ_ROW_OFFSETS(in_addr, out_addr, size)		\
> +({									\
> +	switch (size) {							\
> +	case 1:								\
> +		SFRAME_READ_TYPE(in_addr, out_addr, s8);		\
> +		break;							\
> +	case 2:								\
> +		SFRAME_READ_TYPE(in_addr, out_addr, s16);		\
> +		break;							\
> +	case 4:								\
> +		SFRAME_READ_TYPE(in_addr, out_addr, s32);		\
> +		break;							\
> +	default:							\
> +		break;							\
> +	}								\
> +})
> +
> +static struct sframe_fde *find_fde(const struct sframe_table *tbl, unsigned long pc)
> +{
> +	int l, r, m, f;
> +	int32_t ip;
> +	struct sframe_fde *fdep;
> +
> +	if (!tbl || !tbl->sfhdr_p || !tbl->fde_p)
> +		return NULL;
> +
> +	ip = (pc - (unsigned long)tbl->sfhdr_p);
> +
> +	/* Do a binary range search to find the rightmost FDE start_addr < ip */
> +	l = m = f = 0;
> +	r = tbl->sfhdr_p->num_fdes;
> +	while (l < r) {
> +		m = l + ((r - l) / 2);
> +		fdep = tbl->fde_p + m;
> +		if (fdep->start_addr > ip)
> +			r = m;
> +		else
> +			l = m + 1;
> +	}
> +	/* use l - 1 because l will be the first item fdep->start_addr > ip */
> +	f = l - 1;
> +	if (f >= tbl->sfhdr_p->num_fdes || f < 0)
> +		return NULL;
> +	fdep = tbl->fde_p + f;
> +	if (ip < fdep->start_addr || ip >= fdep->start_addr + fdep->size)
> +		return NULL;
> +
> +	return fdep;
> +}
> +
> +static int find_fre(const struct sframe_table *tbl, unsigned long pc,
> +		const struct sframe_fde *fdep, struct sframe_ip_entry *entry)
> +{
> +	int i, offset_size, offset_count;
> +	char *fres, *offsets_loc;
> +	int32_t ip_off;
> +	uint32_t next_row_ip_off;
> +	uint8_t fre_info, fde_type = SFRAME_FUNC_FDE_TYPE(fdep->info),
> +			fre_type = SFRAME_FUNC_FRE_TYPE(fdep->info);
> +
> +	fres = tbl->fre_p + fdep->fres_off;
> +
> +	/*  Whether PCs in the FREs should be treated as masks or not */
> +	if (fde_type == SFRAME_FDE_TYPE_PCMASK)
> +		ip_off = pc % fdep->rep_size;
> +	else
> +		ip_off = (int32_t)(pc - (unsigned long)tbl->sfhdr_p) - fdep->start_addr;
> +
> +	if (ip_off < 0 || ip_off >= fdep->size)
> +		return -EINVAL;
> +
> +	/*
> +	 * FRE structure starts by address of the entry with variants length. Use
> +	 * two pointers to track current head(fres) and the address of last
> +	 * offset(offsets_loc)
> +	 */
> +	for (i = 0; i < fdep->fres_num; i++) {
> +		SFRAME_READ_ROW_ADDR(fres, next_row_ip_off, fre_type);
> +		if (ip_off < next_row_ip_off)
> +			break;
> +		SFRAME_READ_TYPE(fres, fre_info, u8);
> +		offsets_loc = fres;
> +		/*
> +		 * jump to the start of next fre
> +		 * fres += fre_offets_cnt*offset_size
> +		 */
> +		fres += SFRAME_FRE_OFFSET_COUNT(fre_info) << SFRAME_FRE_OFFSET_SIZE(fre_info);
> +	}
> +
> +	offset_size = 1 << SFRAME_FRE_OFFSET_SIZE(fre_info);
> +	offset_count = SFRAME_FRE_OFFSET_COUNT(fre_info);
> +
> +	if (offset_count > 0) {
> +		SFRAME_READ_ROW_OFFSETS(offsets_loc, entry->cfa_offset, offset_size);
> +		offset_count--;
> +	}
> +	if (offset_count > 0 && !entry->ra_offset) {
> +		SFRAME_READ_ROW_OFFSETS(offsets_loc, entry->ra_offset, offset_size);
> +		offset_count--;
> +	}
> +	if (offset_count > 0 && !entry->fp_offset) {
> +		SFRAME_READ_ROW_OFFSETS(offsets_loc, entry->fp_offset, offset_size);
> +		offset_count--;
> +	}
> +	if (offset_count)
> +		return -EINVAL;
> +
> +	entry->use_fp = SFRAME_FRE_CFA_BASE_REG_ID(fre_info) == SFRAME_BASE_REG_FP;
> +
> +	return 0;
> +}
> +
> +int sframe_find_pc(unsigned long pc, struct sframe_ip_entry *entry)
> +{
> +	struct sframe_fde *fdep;
> +	struct sframe_table *sftbl_p = &sftbl;
> +	int err;
> +
> +	if (!sframe_init)
> +		return -EINVAL;
> +
> +	memset(entry, 0, sizeof(*entry));
> +	entry->ra_offset = sftbl_p->sfhdr_p->cfa_fixed_ra_offset;
> +	entry->fp_offset = sftbl_p->sfhdr_p->cfa_fixed_fp_offset;
> +
> +	fdep = find_fde(sftbl_p, pc);
> +	if (!fdep)
> +		return -EINVAL;
> +	err = find_fre(sftbl_p, pc, fdep, entry);
> +	if (err)
> +		return err;
> +
> +	return 0;
> +}
> +
> +void __init init_sframe_table(void)
> +{
> +	size_t sframe_size = (void *)__stop_sframe_header - (void *)__start_sframe_header;
> +	void *sframe_buf = __start_sframe_header;
> +
> +	if (sframe_size <= 0)
> +		return;
> +	sftbl.sfhdr_p = sframe_buf;
> +	if (!sftbl.sfhdr_p || sftbl.sfhdr_p->preamble.magic != SFRAME_MAGIC ||
> +	    sftbl.sfhdr_p->preamble.version != SFRAME_VERSION_2 ||
> +	    !(sftbl.sfhdr_p->preamble.flags & SFRAME_F_FDE_SORTED)) {
> +		pr_warn("WARNING: Unable to read sframe header.  Disabling unwinder.\n");
> +		return;
> +	}
> +
> +	sftbl.fde_p = (struct sframe_fde *)(__start_sframe_header + SFRAME_HDR_SIZE(*sftbl.sfhdr_p)
> +						+ sftbl.sfhdr_p->fdes_off);
> +	sftbl.fre_p = __start_sframe_header + SFRAME_HDR_SIZE(*sftbl.sfhdr_p)
> +		+ sftbl.sfhdr_p->fres_off;
> +	sframe_init = true;
> +}
Other than the minor suggestion, the code looks good to me.

Reviewed-by: Prasanna Kumar T S M <ptsm@linux.microsoft.com>.


