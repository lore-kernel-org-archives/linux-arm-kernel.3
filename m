Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 890BDC79F8C
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Sep 2026 06:23:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:Cc:To:From:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Re0shYGhVZ3gJbu2HKvEFSLbs2EMlZ+lZN0kAR5bu/g=; b=ZaKc3jmtOIxBIpRxgXAxfl1p9/
	cJ2VqOXHJ/nbwOzy5yN6KotoCcnKNUsoRxDECDsvWpf6FZTMEGzMuLIvtpdzF2U2HU/tT1VpqiTVi
	jaXyZjBMSQczpn8Mudyki91vKI7jM2lMxps6gmw4E5NggeY0DdlQI/ospQsvvlUlakRhgIoHvRzTD
	e8wO4PuSW6FwlqlWnJ1hfl3+ocbj+T2Lm5d++8YsdD7aU6s3BCL5D9MFnMu7afgBo7ZzlrSSbQPhn
	mzb/FE7AwgiaN9npYQiZIGrEJB9Se39LwIghQzXDU0NT3s8oYl+sYhUoAPpjq/p9TbQEKWnaYgQXn
	Ov3n1hFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4BiP-0000000Arpg-2zLh;
	Wed, 09 Sep 2026 06:23:25 +0000
Received: from dggsgout11.his.huawei.com ([45.249.212.51])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4BiM-0000000Arp7-02F2
	for linux-arm-kernel@lists.infradead.org;
	Wed, 09 Sep 2026 06:23:24 +0000
Received: from mail.maildlp.com (unknown [172.19.163.198])
	by dggsgout11.his.huawei.com (SkyGuard) with ESMTPS id 4hfrLr2159zYQtvn
	for <linux-arm-kernel@lists.infradead.org>; Wed,  9 Sep 2026 14:22:12 +0800 (CST)
Received: from mail02.huawei.com (unknown [10.116.40.112])
	by mail.maildlp.com (Postfix) with ESMTP id 0C36640561
	for <linux-arm-kernel@lists.infradead.org>; Wed,  9 Sep 2026 14:23:05 +0800 (CST)
Received: from [10.174.179.37] (unknown [10.174.179.37])
	by APP1 (Coremail) with UTF8SMTPSA id cCh0CgB3YAtH+6BqQMYyBQ--.9414S3;
	Wed, 09 Sep 2026 14:23:04 +0800 (CST)
Message-ID: <5a17b91a-1720-eda5-a3b7-5c7b438087b9@huaweicloud.com>
Date: Wed, 9 Sep 2026 14:23:03 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH] arm64: io: Reject present-invalid user prot in
 ioremap_prot()
Content-Language: en-US
From: Zeng Heng <zengheng@huaweicloud.com>
To: catalin.marinas@arm.com, suzuki.poulose@arm.com,
 anshuman.khandual@arm.com, gshan@redhat.com, david@kernel.org,
 will@kernel.org
Cc: wangkefeng.wang@huawei.com, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20260905033148.3657516-1-zengheng@huaweicloud.com>
In-Reply-To: <20260905033148.3657516-1-zengheng@huaweicloud.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CM-TRANSID: cCh0CgB3YAtH+6BqQMYyBQ--.9414S3
X-Coremail-Antispam: 1UD129KBjvJXoW7Zw15uF4xtw1UWr47Zw15twb_yoW8tF17pF
	1kur1kWrWDGa4IyFsFgr92gF45Cws5JFZYg34vqF12vF12vFWxJrsYg345W348AFs293y8
	KrsIg3s8XryUtFDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUkKb4IE77IF4wAFF20E14v26r4j6ryUM7CY07I20VC2zVCF04k2
	6cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4
	vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_JFI_Gr1l84ACjcxK6xIIjxv20xvEc7Cj
	xVAFwI0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVWxJr0_GcWl84ACjcxK6I8E87Iv6xkF7I
	0E14v26rxl6s0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40E
	x7xfMcIj6xIIjxv20xvE14v26r1j6r18McIj6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x
	0Yz7v_Jr0_Gr1lF7xvr2IY64vIr41lc7I2V7IY0VAS07AlzVAYIcxG8wCY1x0262kKe7AK
	xVWUtVW8ZwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F4
	0E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_Jw0_GFyl
	IxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxV
	AFwI0_Jr0_Gr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r1j
	6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Jr0_GrUvcSsGvfC2KfnxnUUI43ZEXa7IU17KsU
	UUUUU==
X-CM-SenderInfo: p2hqwxhhqjqx5xdzvxpfor3voofrz/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260908_232322_433417_6D2EAA5D 
X-CRM114-Status: GOOD (  18.45  )
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

    Kindly ping.


On 2026/9/5 11:31, Zeng Heng wrote:
> From: Zeng Heng <zengheng4@huawei.com>
> 
> Mapping a stack-top page via /dev/mem with PROT_NONE and then reading
> that process's /proc/<pid>/cmdline triggers a spurious WARN in
> ioremap_prot() through generic_access_phys():
> 
>    WARNING: ./arch/arm64/include/asm/io.h:275 at generic_access_phys
>    Call trace:
>      generic_access_phys+0x1c8/0x228 (P)
>      __access_remote_vm+0x2b4/0x398
>      access_remote_vm+0x14/0x30
>      get_mm_cmdline+0xf8/0x2a0
>      proc_pid_cmdline_read+0x68/0x120
> 
> generic_access_phys() passes the full pgprot derived from the user PTE
> to ioremap_prot(). A PROT_NONE /dev/mem mapping is encoded as PAGE_NONE,
> which clears PTE_VALID and sets the software PTE_PRESENT_INVALID bit.
> On arm64 such an entry is still pte_present(), so follow_pfnmap_start()
> reports the pfn and generic_access_phys() reaches ioremap_prot().
> The PTE_USER assertion, which is meant to catch kernel prots being
> passed by mistake, then fires for a PROT_NONE user mapping
> that legitimately lacks PTE_USER, producing the spurious WARN.
> 
> Reject a user prot encoding a present-invalid (i.e. PROT_NONE) entry up
> front so that generic_access_phys() cleanly fails the access instead
> of warning. Note that PTE_PRESENT_INVALID aliases the PTE_NG bit and
> is only meaningful when PTE_VALID is clear, so both bits must be
> checked together.
> 
> Fixes: 8f098037139b ("arm64: io: Extract user memory type in ioremap_prot()")
> Signed-off-by: Zeng Heng <zengheng4@huawei.com>
> ---
>   arch/arm64/include/asm/io.h | 4 ++++
>   1 file changed, 4 insertions(+)
> 
> diff --git a/arch/arm64/include/asm/io.h b/arch/arm64/include/asm/io.h
> index 21c8e400107c..bbfbc4682639 100644
> --- a/arch/arm64/include/asm/io.h
> +++ b/arch/arm64/include/asm/io.h
> @@ -272,6 +272,10 @@ static inline void __iomem *ioremap_prot(phys_addr_t phys, size_t size,
>   	pgprot_t prot;
>   	ptval_t user_prot_val = pgprot_val(user_prot);
>   
> +	if ((user_prot_val & (PTE_VALID | PTE_PRESENT_INVALID)) ==
> +	     PTE_PRESENT_INVALID)
> +		return NULL;
> +
>   	if (WARN_ON_ONCE(!(user_prot_val & PTE_USER)))
>   		return NULL;
>   


