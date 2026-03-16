Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7871CF013D0
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Mar 2026 08:31:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:Subject
	:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KKbPsDAO7LVmJHxlSzEBfeRUi2Nm7cblhvtLj41WeSc=; b=kTl60bTjUXy5Vx
	L5buGz7/3yT3Myka82rEX4tHcmDMfrkoDs+TIfjbp2Re0JRemO1B2eKmHhxdqSB5hCddQ9RynGDzi
	BVH6ipK3Mfja1zAPf12BZ2jFf2ifuv+Vdwc9ZO8NHfnT1DL2LhaXwTrFaPYmDVTt+LZLgLUA/3h9S
	EfGY/aAowEh4hgwchA5HUbamtDuMP/Ku/sEw4CGw9vJ3CK+F3zRxydnZNIZ4DE9JJXi89T6vBh+xQ
	RWN/Qqykx1liYOk9YjSmVuRHCgL7g6DEAs950m/PlIdjuwUavV+XLSjTvnjpU0DvSSeNLhZebXSIU
	2NhxmZj4XtkdY07+2aiA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w23Lo-00000003Yi4-28ie;
	Mon, 16 Mar 2026 08:31:00 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w23Ll-00000003Yhc-0ZmE
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 16 Mar 2026 08:30:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=KKbPsDAO7LVmJHxlSzEBfeRUi2Nm7cblhvtLj41WeSc=; b=pfK2sN8Hr3GE9ZcVqY2pGcmjzk
	I1wMZpcfdjvscKHVtP+QIylkf86NoPUDEioewxinNJ+xgbWg1Znd7SG/ce3il/xwr+UwJDyb/nLhm
	r2kZx7F5akYZX9NA4d2GmYwzksu8S4lluQiMGsIRVBnFkN8gjgskIbI4af4kujQnQQIr+1PIbFd0O
	vNp9EaL1IqR+SR6Op0XV0jo+4vvnx8XoovEI0ivoSGVJ0Pd5xgAjhtlsf7g1nWYiAOAA/WQnMDuFT
	/FjcuHpOzVObQiwBY4v91/Z/vwvlOcJOk8e70P0mLv4uUohftz46QNEzQwqcKBtv1pQuQKUaV56JS
	Z3kUqzdw==;
Received: from [113.46.200.225] (helo=canpmsgout10.his.huawei.com)
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w23Lf-00000006GkC-2BEb
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Mar 2026 08:30:55 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=KKbPsDAO7LVmJHxlSzEBfeRUi2Nm7cblhvtLj41WeSc=;
	b=kdN/AfpZHzSBWHHnCUnfqcNeRn1Y/Ti1cCp31akA99MbW27C46+M+yFh4UoVlwWbikcPlzB3/
	fttUjkdYCbO7/xktrNNsfIedMKs84ZayJMRR1X8n8u/Y8ESNA4PLnEpzLQoidyveVf9eBSUiI/5
	McuUwxrVB59tOXLe1Ip8wWg=
Received: from mail.maildlp.com (unknown [172.19.163.200])
	by canpmsgout10.his.huawei.com (SkyGuard) with ESMTPS id 4fZ7Sl43qDz1K96p;
	Mon, 16 Mar 2026 16:25:27 +0800 (CST)
Received: from dggpemf500011.china.huawei.com (unknown [7.185.36.131])
	by mail.maildlp.com (Postfix) with ESMTPS id 9389940563;
	Mon, 16 Mar 2026 16:30:23 +0800 (CST)
Received: from [10.67.109.254] (10.67.109.254) by
 dggpemf500011.china.huawei.com (7.185.36.131) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Mon, 16 Mar 2026 16:30:20 +0800
Message-ID: <b541bd3a-7407-d743-70de-f9665479dec2@huawei.com>
Date: Mon, 16 Mar 2026 16:30:19 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.0
Subject: Re: [PATCH v13 11/12] arm64: Use generic TIF bits for common thread
 flags
To: Heiko Carstens <hca@linux.ibm.com>
References: <20260313094738.3985794-1-ruanjinjie@huawei.com>
 <20260313094738.3985794-12-ruanjinjie@huawei.com>
 <20260313101022.13729C56-hca@linux.ibm.com>
Content-Language: en-US
From: Jinjie Ruan <ruanjinjie@huawei.com>
In-Reply-To: <20260313101022.13729C56-hca@linux.ibm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.67.109.254]
X-ClientProxiedBy: kwepems200002.china.huawei.com (7.221.188.68) To
 dggpemf500011.china.huawei.com (7.185.36.131)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260316_083052_366682_2CAB4AB8 
X-CRM114-Status: UNSURE (   9.03  )
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
Cc: mark.rutland@arm.com, schuster.simon@siemens-energy.com, andreas@gaisler.com, kees@kernel.org, catalin.marinas@arm.com, dave.hansen@linux.intel.com, ldv@strace.io, song@kernel.org, linux-kselftest@vger.kernel.org, hpa@zytor.com, agordeev@linux.ibm.com, shuah@kernel.org, jremus@linux.ibm.com, linux-arch@vger.kernel.org, linux-s390@vger.kernel.org, gor@linux.ibm.com, will@kernel.org, deller@gmx.de, x86@kernel.org, mingo@redhat.com, linux-arm-kernel@lists.infradead.org, borntraeger@linux.ibm.com, kmal@cock.li, tglx@kernel.org, thuth@redhat.com, ryan.roberts@arm.com, arnd@arndb.de, anshuman.khandual@arm.com, linux-kernel@vger.kernel.org, kevin.brodsky@arm.com, charlie@rivosinc.com, pengcan@kylinos.cn, broonie@kernel.org, bp@alien8.de, richard.weiyang@gmail.com, dvyukov@google.com, jgross@suse.com, wad@chromium.org, yeoreum.yun@arm.com, oleg@redhat.com, luto@amacapital.net, svens@linux.ibm.com, liqiang01@kylinos.cn, mathieu.desnoyers@efficios.com, akpm@linux-foundation.org, reddybalavignesh9979@gmail.com, macro@orcam.me.uk
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org



On 2026/3/13 18:10, Heiko Carstens wrote:
> On Fri, Mar 13, 2026 at 05:47:37PM +0800, Jinjie Ruan wrote:
>> Use the generic TIF bits defined in <asm-generic/thread_info_tif.h> for
>> standard thread flags (TIF_SIGPENDING, TIF_NEED_RESCHED, TIF_NOTIFY_RESUME,
>> TIF_RESTORE_SIGMASK, TIF_SINGLESTEP, etc.) instead of defining
>> them locally.
>>
>> Arm64-specific bits (TIF_FOREIGN_FPSTATE, TIF_MTE_ASYNC_FAULT, TIF_SVE,
>> TIF_SSBD, etc.) are renumbered to start at bit 16 to avoid conflicts.
>>
>> This enables RSEQ optimizations which require CONFIG_HAVE_GENERIC_TIF_BITS
>> combined with the generic entry infrastructure (already used by arm64).
>>
>> Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
>> ---
>>  arch/arm64/Kconfig                    |  1 +
>>  arch/arm64/include/asm/thread_info.h  | 62 ++++++++++++---------------
>>  arch/s390/include/asm/thread_info.h   |  7 ++-
> 
> Acked-by: Heiko Carstens <hca@linux.ibm.com> # s390
> 
>>  arch/x86/include/asm/thread_info.h    |  6 +--
>>  include/asm-generic/thread_info_tif.h |  5 +++
>>  5 files changed, 38 insertions(+), 43 deletions(-)
> 
> FWIW, I guess you want to do the same for loongarch was well?

Good point. I will include the LoongArch changes in the next version of
this patchset.

Thanks!

