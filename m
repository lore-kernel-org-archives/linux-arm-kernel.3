Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C06A1C44501
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Jul 2026 09:35:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:Subject
	:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PH/Gw4sh0M36rXOvSAtDtas7L7cKJnAJeL9F/Vh4A3U=; b=jx7yqP9d1WB0Z/
	ZU/Z58hTC+ZCwZLFvqJXI2lH0ZwB261ZB2F6q5fTX0+ofcODb0XSquA069+LhHvtYIc4JSGTiGTYS
	xwYZdMztHKZhfksPxDDX5a71wL1nd9g1oDusw+BWmDD9WJeQVpssaaYAkiuaQMVrUG36R/lsZftf8
	nKFbY4xYS9Gijy5mC4eZO6gbKlG8uWksif8id0q6HZrSszdLpXrrO9rj57RpTZAGd2Att8g6JmIY4
	hFCpZ+brT1mD1Sv8SGH+VMwzIqsXR2MTAnhYbkPXZZz589yocYezYnSLs5hhEcKrw9CbEfmc48yzQ
	BdyTuyv9Cp7C/AaAjWgA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjZXh-0000000BTES-2YpH;
	Tue, 14 Jul 2026 09:35:09 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjZXf-0000000BTDc-2MkW
	for linux-arm-kernel@lists.infradead.org;
	Tue, 14 Jul 2026 09:35:08 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 636A32F;
	Tue, 14 Jul 2026 02:35:01 -0700 (PDT)
Received: from [10.1.34.162] (e121487-lin.cambridge.arm.com [10.1.34.162])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 4913D3F93E;
	Tue, 14 Jul 2026 02:35:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1784021705; bh=XM92JNOSdj3ojRIKBMMYaaElVGPDddS9HZgAe+hXh1Y=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=jbdJEVswRCgfjDqjKMQ1tBdBT4UJGWKOK2gb5TGJuXBdmxH+vQqs4p9eU1jMpIvp/
	 uyETnuUvAq37LE0JEh0f2TruzitCqNNHjvQ76zflxgRBInYYODrMV9otjKMFxe7LZb
	 WcVDVfpUhwqP+Q7qaUTpVaGTKx2SjzVLYdcBeIOY=
Message-ID: <8ffe2df2-90c2-45a1-ace2-185ef1f4e011@arm.com>
Date: Tue, 14 Jul 2026 10:35:02 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 03/36] arm64: hibernate: mask DAIF before restoring
 hibernated kernel
To: Jinjie Ruan <ruanjinjie@huawei.com>, linux-arm-kernel@lists.infradead.org
References: <20260709121333.23507-1-vladimir.murzin@arm.com>
 <20260709121333.23507-4-vladimir.murzin@arm.com>
 <68e740e3-5fa6-4ab7-92f1-3f570fc07801@huawei.com>
Content-Language: en-GB
From: Vladimir Murzin <vladimir.murzin@arm.com>
In-Reply-To: <68e740e3-5fa6-4ab7-92f1-3f570fc07801@huawei.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260714_023507_654548_32641C5F 
X-CRM114-Status: UNSURE (   7.52  )
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
Cc: mark.rutland@arm.com, maz@kernel.org, stable@vger.kernel.org, catalin.marinas@arm.com, will@kernel.org
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On 7/10/26 04:00, Jinjie Ruan wrote:
>> @ -465,9 +466,21 @@ int __nocfi swsusp_arch_resume(void)
>>  	if (el2_reset_needed())
>>  		__hyp_set_vectors(el2_vectors);
>>  
>> +	/*
>> +	 * It is necessary to mask all DAIF exceptions here as:
>> +	 *
>> +	 * - The copy of swsusp_arch_suspend_exit() in the hibernation
>> +	 *   text cannot handle taking any exceptions.
>> +	 *
>> +	 * - The suspended kernel masked all DAIF exceptions in
>> +	 *   swsusp_arch_resume(), and expects to be re-entered in the
>> +	 *   same state : with all DAIF exceptions masked.
>> +	 */
>> +	flags = local_daif_save();
>>  	hibernate_exit(virt_to_phys(tmp_pg_dir), resume_hdr.ttbr1_el1,
>>  		       resume_hdr.reenter_kernel, restore_pblist,
>>  		       resume_hdr.__hyp_stub_vectors, virt_to_phys(zero_page));
> hibernate_exit() is a noreturn function, the following
> local_daif_restore() will not be called.

Agree. I'll fix that in the next iteration.

Cheers
Vladimir


