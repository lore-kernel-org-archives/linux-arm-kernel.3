Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A094C79FB7
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Sep 2026 13:31:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fF1cEFcgyVPOEPUq/61SXtv1bN/BnUewuuhHxkdbS5w=; b=2AvFaXvB0krnemA8ShOcmB+h0S
	TY5eN0CeeI72EiC97RQPf4/n1nUtUJ8ITxbpaXHBmjYVrBPrza25uc30CKrVd75jhdrYHnP1oRoAu
	9rUX00CfNk4+rllmkHAmNNeGofU3Vuca5tN4Y4D3J00lF85PsDN9v9bWYyGuZF3H/BHQ8qmk2zeuv
	ECyP7LS0wjyu6bpQCWjYHNCsrxFfRoCNp+1MN7wIGBUpBSBb5KT2OstjQzBIvcvKH1kVAm3KQkOL2
	ydrm2TL1i9Zq0rfBKf4AcCOY+Tw0ifYs00YpbjKVwghrpxAyd89leJZLQVAwWEIdZeHV0bmI7l+Aw
	SmaQXLmg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4IO5-0000000Bnzb-0yvf;
	Wed, 09 Sep 2026 13:30:53 +0000
Received: from mail-ej1-x632.google.com ([2a00:1450:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4IO2-0000000Bnyl-48QC
	for linux-arm-kernel@lists.infradead.org;
	Wed, 09 Sep 2026 13:30:52 +0000
Received: by mail-ej1-x632.google.com with SMTP id a640c23a62f3a-c28fde3bbd2so495766066b.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 09 Sep 2026 06:30:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788960649; x=1789565449; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:date
         :from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=fF1cEFcgyVPOEPUq/61SXtv1bN/BnUewuuhHxkdbS5w=;
        b=CUDv5biyOUYsDbx9S0gbChfpLcMv7E1RUJ+oFKlXB1cmVLW/2cwMhf0UDkAdQzfAgj
         V9w6cHPLq3PFtcj0YSK+cQsXmWv41NeQjePrKPL8Tgf13/uE/XpfUQfDNKIUZ9rzLkrO
         QpnpF95WpwFPNOJtS9ppqVMBhNWXV1WHMTsw7QuMOsE1RFBJylbq6gI5jYL1F0luLrTH
         yavqeEcuMitc9b4qmdjLr1u6Sp9g1TtPEKBqh8ftrlS550qCUCMnT0OhyI1XactQYZ6h
         6QOJbZOz/+6xUh/nJ6vvGTFqiIw7Iiq/DPzgSOASGmemUBdMk+NFfnouUZyen9Ya+RSc
         r/cA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788960649; x=1789565449;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:date
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=fF1cEFcgyVPOEPUq/61SXtv1bN/BnUewuuhHxkdbS5w=;
        b=N5OymWZLpxBA+vmqQ7OPzwpS3DvoaJEygXKul0vHSwCV1oRbWs0ypZxfEd+LEvoBD1
         mHw35qvhpn59ZK5Nq6lq5wuPK3/GX7XyNvBay8mV0PGYW1qK651OaK96fEdHUMBLkFFZ
         SUUVGx22ct2Xj8AHO43sYZcsjCVvsRkt9GCl7mt0EasnDEYPyNIIT1dBSxGKtfAh/ZFO
         PrQB3k4ehIiTb/tKL/hPEXG+rBSKPvPPWmaIek33f5ZsPQEWifqvViIoVDuNtj9OeO0N
         s3CzyEhv/K+EBjrn8psSTteSw+BOJOTuTFTKV6JtTl3fHvi+NfZluEayASVb4Gu6+riF
         aVhg==
X-Forwarded-Encrypted: i=1; AKwUvBwU2byh2dkrmb9uRWcYs39BuNcpPeL1mExBjP7YdivQS7AE3NAtTVDpbdYNwXt/I6gbB839u8KCTPD4MPzbuXiW@lists.infradead.org
X-Gm-Message-State: AFuF++lKVfNyzA/XoDXLdmLiJ7q48QcaFbqLreDwUzRspz1+q85rnCRc
	4WKsuO4mbiWgeUNjNeYbQvzonMceh0vKsNhlxwq+AvXC4twiaSIoCG9T
X-Gm-Gg: AYBFou2mFbhPuGS87+ZpyjjoGT9zq4B0Lxplt4taRyREckwP4smcLHKNxRqMwHl+Knq
	+6d+rgkusE81hHVem03Ck4kGl2zpZaM66HCvjaNY8V6qxSUfMx+otF+LH53EbAh9tqoDJZ0I8Mo
	tPQEVH0desswCDuvUDdrCOBMIbHkVUNwGbAVD8Oz5KZ95ZJRFbUjT121yynBvxuFKkR+0iik15T
	J6PMlCkZXFTS+XGAwZbtG895wjBSG3lAzrAk8zqv3jQvfcnTc7AQVGGVqmpOt8210qGMiUb7kFJ
	e7i55wgLi72TYrpUos1srVPbf4qBIUjzXykY1l5JInE/tEKMYARYTYjUGV+OvVGOJTubUj1ekHv
	2GffnGvhGbWeOl05AwiL5iRjao4IDVJ1VO4FWyh4/cuZzAOZyf2+hbrMotEdOcrZl2lRoPUh5UR
	/Hi7HKvjxtVOdhLyzEtkCfQa8N25TEDNnk9SLKWyrlBaVUkqZIKIfh3dyDosFRu1iJ5RII57fTF
	2RJ
X-Received: by 2002:a17:906:4789:b0:c24:e0dc:8b66 with SMTP id a640c23a62f3a-c260c8dc700mr1541952166b.6.1788960648727;
        Wed, 09 Sep 2026 06:30:48 -0700 (PDT)
Received: from localhost ([45.112.44.120])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c262ccca940sm616338266b.18.2026.09.09.06.30.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 06:30:48 -0700 (PDT)
From: Coiby Xu <coiby.xu@gmail.com>
X-Google-Original-From: Coiby Xu <Coiby.Xu@gmail.com>
Date: Wed, 9 Sep 2026 21:27:47 +0800
To: sashiko-reviews@lists.linux.dev
Cc: Jinjie Ruan <ruanjinjie@huawei.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Sourabh Jain <sourabhjain@linux.ibm.com>, 
	kexec@lists.infradead.org, Pratyush Yadav <pratyush@kernel.org>, 
	Dave Young <ruirui.yang@linux.dev>, Will Deacon <will@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, Mike Rapoport <rppt@kernel.org>, 
	Catalin Marinas <catalin.marinas@arm.com>, Pasha Tatashin <pasha.tatashin@soleen.com>, 
	Baoquan He <baoquan.he@linux.dev>, linux-arm-kernel@lists.infradead.org, 
	open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v5 1/9] crash_dump: Fix potential double free and UAF of
 keys_header
Message-ID: <aqFeOaIxKNMKVOTM@Rk>
References: <20260909003657.1570544-1-coiby.xu@gmail.com>
 <20260909003657.1570544-2-coiby.xu@gmail.com>
 <20260909005311.B1E471F00A3A@smtp.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260909005311.B1E471F00A3A@smtp.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260909_063051_053543_0F95DD82 
X-CRM114-Status: GOOD (  22.16  )
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

On Wed, Sep 09, 2026 at 12:53:11AM +0000, sashiko-bot@kernel.org wrote:
>Thank you for your contribution! Sashiko AI review found 2 potential issue(s) to consider:
>
>New issues:
>- [High] Prematurely clearing `is_dm_key_reused` breaks the ARM64 kexec_file_load retry loop and defeats hotplug dm-crypt key reuse.

Thanks for catching this issue! I'll send a new version to address this
issue.

>
>Pre-existing issues:
>- [High] Mapping crash-reserved memory with `kmap_local_page()` causes out-of-bounds reads if dm-crypt keys exceed a single page.

x86 is not supported so I think this concern can be dismissed.

>--
>
>commit 9cf0538566bf6406e97a7f29629856abff44a5b0
>Author: Coiby Xu <coiby.xu@gmail.com>
>
>crash_dump: Fix potential double free and UAF of keys_header
>
>This commit addresses a potential double free and UAF of keys_header when
>loading dm-crypt keys for kdump. It establishes an invariant to free
>keys_header at the end of kexec_file_load unless reuse=true.
>
>> diff --git a/arch/arm64/kernel/kexec_image.c b/arch/arm64/kernel/kexec_image.c
>> index b70f4df15a1ae..1a0ca54adc9a4 100644
>> --- a/arch/arm64/kernel/kexec_image.c
>> +++ b/arch/arm64/kernel/kexec_image.c
>> @@ -110,6 +110,7 @@ static void *image_load(struct kimage *image,
>>  		image->nr_segments -= 1;
>>  		kbuf.buf_min = kernel_segment->mem + kernel_segment->memsz;
>>  		kbuf.mem = KEXEC_BUF_MEM_UNKNOWN;
>> +		crash_dm_crypt_cleanup(image);
>
>[Severity: High]
>Does this call to crash_dm_crypt_cleanup() during a retry loop unintentionally
>free the keys_header buffer?
>
>Since crash_load_dm_crypt_keys() unconditionally clears the is_dm_key_reused
>flag before returning, any mid-retry cleanup performed here when segment
>placement fails will see the flag as false and wrongfully free the valid
>keys_header buffer.
>
>>  	}
>>
>>  	if (ret) {
>
>[ ... ]
>
>> diff --git a/kernel/crash_dump_dm_crypt.c b/kernel/crash_dump_dm_crypt.c
>> index c685497cd470e..f638fb4b8554c 100644
>> --- a/kernel/crash_dump_dm_crypt.c
>> +++ b/kernel/crash_dump_dm_crypt.c
>> @@ -84,18 +84,25 @@ static int add_key_to_keyring(struct dm_crypt_key *dm_key,
>
>[ ... ]
>
>> -static void get_keys_from_kdump_reserved_memory(void)
>> +static int get_keys_from_kdump_reserved_memory(void)
>>  {
>>  	struct keys_header *keys_header_loaded;
>> +	size_t keys_header_size;
>>
>> -	arch_kexec_unprotect_crashkres();
>> +	keys_header_size = get_keys_header_size(key_count);
>> +	keys_header = kzalloc(keys_header_size, GFP_KERNEL);
>> +	if (!keys_header)
>> +		return -ENOMEM;
>>
>> +	arch_kexec_unprotect_crashkres();
>>  	keys_header_loaded = kmap_local_page(pfn_to_page(
>>  		kexec_crash_image->dm_crypt_keys_addr >> PAGE_SHIFT));
>>
>> -	memcpy(keys_header, keys_header_loaded, get_keys_header_size(key_count));
>> +	memcpy(keys_header, keys_header_loaded, keys_header_size);
>
>[Severity: High]
>This is a pre-existing issue, but does this copy read out of bounds?
>
>kmap_local_page() guarantees mapping exactly one physical page frame. If user
>configuration has enough dm-crypt keys (e.g., > 10 keys, where each struct is
>388 bytes), keys_header_size easily exceeds the 4KB page size.
>
>Copying beyond the single-page mapping will cause out-of-bounds reads and
>could trigger a kernel panic on systems with HIGHMEM or when
>CONFIG_DEBUG_KMAP_LOCAL is enabled. Could memremap() be used instead?
>
>>  	kunmap_local(keys_header_loaded);
>>  	arch_kexec_protect_crashkres();
>> +
>> +	return 0;
>>  }
>
>[ ... ]
>
>> @@ -441,18 +458,33 @@ int crash_load_dm_crypt_keys(struct kimage *image)
>>  	r = kexec_add_buffer(&kbuf);
>>  	if (r) {
>>  		pr_err("Failed to call kexec_add_buffer, ret=%d\n", r);
>> -		kvfree((void *)kbuf.buffer);
>> -		return r;
>> +		goto out;
>>  	}
>> +
>>  	image->dm_crypt_keys_addr = kbuf.mem;
>>  	image->dm_crypt_keys_sz = kbuf.bufsz;
>>  	kexec_dprintk(
>>  		"Loaded dm crypt keys to kexec_buffer bufsz=0x%lx memsz=0x%lx\n",
>>  		kbuf.bufsz, kbuf.memsz);
>>
>> +out:
>> +	is_dm_key_reused = false;
>
>[Severity: High]
>Does prematurely clearing is_dm_key_reused here destroy the state needed for
>the segment placement retry loop?
>
>On ARM64, if the first attempt at segment placement fails, the kexec load
>code retries the loop. Since the flag is unconditionally cleared here, the
>first iteration will clear it. When the retry cleanup executes in
>image_load(), it will see is_dm_key_reused == false, freeing the keys_header
>buffer and leaving subsequent retries without the required keys.
>
>>  	return r;
>>  }
>
>-- 
>Sashiko AI review · https://sashiko.dev/#/patchset/20260909003657.1570544-1-coiby.xu@gmail.com?part=1

-- 
Best regards,
Coiby

