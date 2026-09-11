Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 663ADC88E4A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Sep 2026 01:25:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=c58X8ecI9cB05ly16RbhbStXD3+pVr/Huxc1EWTQbes=; b=tmpUajZXYda1ZHxNeGCRTAbTrW
	1duxkEbjdb3y6W63PxcH6iiWn7zRYv6YqFsM39Daj2Jn9+Dn23eYGRZiH+uhos5ARSTzbsqaAsieW
	JQy67zzrxATSWqgfjSz6iKWtyJ/Ri0dLKXPPj+09Kwd5Z09KcwkKqQxt4ZJZD2L3dXm8DQ5l5Fjcx
	xVONfXsqw0cpenBUTNVnCBjZxYCm4fec0tZdI7sLvzdl1bJsrHLfYJj6SNxZMpwzQd70K067rDAu0
	7bq778822ZnwHz1uSjNAFnH2jf/bftXC05cI17RRlU8uT168d1e9+aLU6hM/O+z5KWE/T8ti4UCNu
	dsUa+yBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4q14-0000000Ff3U-0E55;
	Fri, 11 Sep 2026 01:25:22 +0000
Received: from canpmsgout06.his.huawei.com ([113.46.200.221])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4q10-0000000Ff2t-2iWB
	for linux-arm-kernel@lists.infradead.org;
	Fri, 11 Sep 2026 01:25:20 +0000
dkim-signature: v=1; a=rsa-sha256; d=h-partners.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=c58X8ecI9cB05ly16RbhbStXD3+pVr/Huxc1EWTQbes=;
	b=hKeFIytpUKGNGHnKNt+jVrk28bOpl+Wbb2Y6jJ3uatSCB9pPzYr0PPze44XkpVSMy3dDfi69H
	Y383P3yvjSetY0Ley0mwqbo4kDMRMUuXcfUqWYF3RS0iNv9p35fOyWMFRyupylbneMH1cCqMKRr
	vNiSJxXQxfvS5SpUuj2UDLA=
Received: from mail.maildlp.com (unknown [172.19.163.0])
	by canpmsgout06.his.huawei.com (SkyGuard) with ESMTPS id 4hgxQT0JHczRhXP;
	Fri, 11 Sep 2026 09:14:09 +0800 (CST)
Received: from kwepemf100008.china.huawei.com (unknown [7.202.181.222])
	by mail.maildlp.com (Postfix) with ESMTPS id 19B1540561;
	Fri, 11 Sep 2026 09:25:02 +0800 (CST)
Received: from [10.174.179.37] (10.174.179.37) by
 kwepemf100008.china.huawei.com (7.202.181.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Fri, 11 Sep 2026 09:25:01 +0800
Message-ID: <18e70561-f2d1-444c-00d3-97093bd1bb5e@huawei.com>
Date: Fri, 11 Sep 2026 09:25:00 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH] arm64: io: Reject present-invalid user prot in
 ioremap_prot()
Content-Language: en-US
To: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>
CC: <suzuki.poulose@arm.com>, <anshuman.khandual@arm.com>, <gshan@redhat.com>,
	<david@kernel.org>, <wangkefeng.wang@huawei.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
References: <20260905033148.3657516-1-zengheng@huaweicloud.com>
 <aqFWAWNzYagW2NNH@arm.com> <aqFZco-0kpQIIxZQ@willie-the-truck>
 <aqGSUg488DHcQp9N@arm.com>
From: Zeng Heng <zengheng4@huawei.com>
In-Reply-To: <aqGSUg488DHcQp9N@arm.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.174.179.37]
X-ClientProxiedBy: kwepems200002.china.huawei.com (7.221.188.68) To
 kwepemf100008.china.huawei.com (7.202.181.222)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260910_182519_021293_6F3F66B2 
X-CRM114-Status: GOOD (  19.97  )
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

Hi Catalin,

On 2026/9/10 1:07, Catalin Marinas wrote:
> On Wed, Sep 09, 2026 at 02:04:50PM +0100, Will Deacon wrote:
>> On Wed, Sep 09, 2026 at 01:50:09PM +0100, Catalin Marinas wrote:
>>> On Sat, Sep 05, 2026 at 11:31:48AM +0800, Zeng Heng wrote:
>>>> From: Zeng Heng <zengheng4@huawei.com>
>>>>
>>>> Mapping a stack-top page via /dev/mem with PROT_NONE and then reading
>>>> that process's /proc/<pid>/cmdline triggers a spurious WARN in
>>>> ioremap_prot() through generic_access_phys():
>>>>
>>>>    WARNING: ./arch/arm64/include/asm/io.h:275 at generic_access_phys
>>>>    Call trace:
>>>>      generic_access_phys+0x1c8/0x228 (P)
>>>>      __access_remote_vm+0x2b4/0x398
>>>>      access_remote_vm+0x14/0x30
>>>>      get_mm_cmdline+0xf8/0x2a0
>>>>      proc_pid_cmdline_read+0x68/0x120
>>>>
>>>> generic_access_phys() passes the full pgprot derived from the user PTE
>>>> to ioremap_prot(). A PROT_NONE /dev/mem mapping is encoded as PAGE_NONE,
>>>> which clears PTE_VALID and sets the software PTE_PRESENT_INVALID bit.
>>>> On arm64 such an entry is still pte_present(), so follow_pfnmap_start()
>>>> reports the pfn and generic_access_phys() reaches ioremap_prot().
>>>> The PTE_USER assertion, which is meant to catch kernel prots being
>>>> passed by mistake, then fires for a PROT_NONE user mapping
>>>> that legitimately lacks PTE_USER, producing the spurious WARN.
>>>>
>>>> Reject a user prot encoding a present-invalid (i.e. PROT_NONE) entry up
>>>> front so that generic_access_phys() cleanly fails the access instead
>>>> of warning. Note that PTE_PRESENT_INVALID aliases the PTE_NG bit and
>>>> is only meaningful when PTE_VALID is clear, so both bits must be
>>>> checked together.
>>>>
>>>> Fixes: 8f098037139b ("arm64: io: Extract user memory type in ioremap_prot()")
>>>> Signed-off-by: Zeng Heng <zengheng4@huawei.com>
>>>> ---
>>>>   arch/arm64/include/asm/io.h | 4 ++++
>>>>   1 file changed, 4 insertions(+)
>>>>
>>>> diff --git a/arch/arm64/include/asm/io.h b/arch/arm64/include/asm/io.h
>>>> index 21c8e400107c..bbfbc4682639 100644
>>>> --- a/arch/arm64/include/asm/io.h
>>>> +++ b/arch/arm64/include/asm/io.h
>>>> @@ -272,6 +272,10 @@ static inline void __iomem *ioremap_prot(phys_addr_t phys, size_t size,
>>>>   	pgprot_t prot;
>>>>   	ptval_t user_prot_val = pgprot_val(user_prot);
>>>>   
>>>> +	if ((user_prot_val & (PTE_VALID | PTE_PRESENT_INVALID)) ==
>>>> +	     PTE_PRESENT_INVALID)
>>>> +		return NULL;
>>>> +
>>>>   	if (WARN_ON_ONCE(!(user_prot_val & PTE_USER)))
>>>>   		return NULL;
>>> I wonder whether we should just drop the warning and return NULL if
>>> !PTE_USER && PTE_UXN. The latter check would also catch execute-only
>>> mappings (Sashiko pointed out this case still trips the warning). The
>>> PROT_NONE case would be covered automatically as well since PTE_USER is
>>> cleared, PTE_UXN set. Maybe add a comment that that pte_protnone()
>>> relies on !PTE_USER && PTE_UXN, so it's not that we avoid the PROT_NONE
>>> issue by chance.
>> Hmm, do we want exec-only mappings to be readable via /dev/mem?
> Ah, yes, got confused on how it reaches this path. It doesn't make sense
> to allow exec-only to be readable. Also if we mmap(PROT_EXEC) /dev/mem,
> PTE_UXN ends up set anyway via pgprot_noncached(). But it does have
> PTE_VALID, so the above won't catch it.
>
> Checking !PTE_USER should be sufficient here and return NULL. For the
> warning, I think we can check PTE_NG first but it only works without
> kpti.

Thanks for your reply. I agree that checking PTE_USER is sufficient here.

I'll drop the WARN_ON_ONCE() and return NULL directly when PTE_USER
is not set. And I won't add a PTE_NG check for the warning since, as you
pointed out, that would not work reliably with KPTI.


Best regards,
Zeng Heng


