Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23FD3C369D1
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Apr 2025 12:20:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:Cc:To:From:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eQHrstufnXZRKPvtDgdg+W4sMQq7zym3/zBZDDdQKwo=; b=qizUyg3P8TT0onxGHDSdhOtAqq
	bTEzFXDBUxuPWCnuR4Gf47L+16iSsF2k6bYIxl+v44QHUntOfyheARU7WusjwgAvQFSCEIVY8aczL
	iAWIgnKwAHeYcGurtUWAzxIue/nJFRZ6/ulHojV9d7/WyRfblKBnQ+9S+VaarugOxA9ykvVVGj09J
	zggv4im4F3uXs5mNeRyIezj4k1HsLjqevLFoffQ7l2Tuv5vxgcyvplOthGQAZqPJTUMnBZkuRqCq7
	ttjQjsQDVXeJynC3Q3oxTuOyux7uhWvLTg2e3vhtolk8vlhrVA/c9MHerAAWjk+UFgOW+ReIPOG+M
	yt0f4qNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8I2l-0000000H6kb-3TDS;
	Fri, 25 Apr 2025 12:20:35 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8Ggs-0000000GpTf-0A0r
	for linux-arm-kernel@lists.infradead.org;
	Fri, 25 Apr 2025 10:53:55 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id EC1D3106F;
	Fri, 25 Apr 2025 03:53:47 -0700 (PDT)
Received: from [10.57.45.160] (unknown [10.57.45.160])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id DAD963F59E;
	Fri, 25 Apr 2025 03:53:49 -0700 (PDT)
Message-ID: <202ff57d-f88c-4cd8-995a-c9bdec7f8b18@arm.com>
Date: Fri, 25 Apr 2025 11:53:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 04/43] arm64: RME: Add wrappers for RMI calls
Content-Language: en-GB
From: Suzuki K Poulose <suzuki.poulose@arm.com>
To: Steven Price <steven.price@arm.com>, kvm@vger.kernel.org,
 kvmarm@lists.linux.dev
Cc: Catalin Marinas <catalin.marinas@arm.com>, Marc Zyngier <maz@kernel.org>,
 Will Deacon <will@kernel.org>, James Morse <james.morse@arm.com>,
 Oliver Upton <oliver.upton@linux.dev>, Zenghui Yu <yuzenghui@huawei.com>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Joey Gouly <joey.gouly@arm.com>, Alexandru Elisei
 <alexandru.elisei@arm.com>, Christoffer Dall <christoffer.dall@arm.com>,
 Fuad Tabba <tabba@google.com>, linux-coco@lists.linux.dev,
 Ganapatrao Kulkarni <gankulkarni@os.amperecomputing.com>,
 Gavin Shan <gshan@redhat.com>, Shanker Donthineni <sdonthineni@nvidia.com>,
 Alper Gun <alpergun@google.com>, "Aneesh Kumar K . V"
 <aneesh.kumar@kernel.org>
References: <20250416134208.383984-1-steven.price@arm.com>
 <20250416134208.383984-5-steven.price@arm.com>
 <d43d1813-5402-488c-aadc-6336dedeccbe@arm.com>
In-Reply-To: <d43d1813-5402-488c-aadc-6336dedeccbe@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250425_035354_118856_6DDF76A5 
X-CRM114-Status: GOOD (  15.86  )
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

On 25/04/2025 11:48, Suzuki K Poulose wrote:
> Hi Steven
> 
> On 16/04/2025 14:41, Steven Price wrote:
>> The wrappers make the call sites easier to read and deal with the
>> boiler plate of handling the error codes from the RMM.
>>
>> Reviewed-by: Gavin Shan <gshan@redhat.com>
>> Signed-off-by: Steven Price <steven.price@arm.com>
>> ---
>> Changes from v7:
>>   * Minor renaming of parameters and updated comments
>> Changes from v5:
>>   * Further improve comments
>> Changes from v4:
>>   * Improve comments
>> Changes from v2:
>>   * Make output arguments optional.
>>   * Mask RIPAS value rmi_rtt_read_entry()
>>   * Drop unused rmi_rtt_get_phys()
>> ---
>>   arch/arm64/include/asm/rmi_cmds.h | 508 ++++++++++++++++++++++++++++++
>>   1 file changed, 508 insertions(+)
>>   create mode 100644 arch/arm64/include/asm/rmi_cmds.h
>>
>> diff --git a/arch/arm64/include/asm/rmi_cmds.h b/arch/arm64/include/ 
>> asm/rmi_cmds.h
>> new file mode 100644
>> index 000000000000..27cd2751f3bf
>> --- /dev/null
>> +++ b/arch/arm64/include/asm/rmi_cmds.h
>> @@ -0,0 +1,508 @@
> 
> ...
> 
>> +
>> +/**
>> + * rmi_rtt_destroy() - Destroy an RTT
>> + * @rd: PA of the RD
>> + * @ipa: Base of the IPA range described by the RTT
>> + * @level: Depth of the RTT within the tree
>> + * @out_rtt: Pointer to write the PA of the RTT which was destroyed
>> + * @out_top: Pointer to write the top IPA of non-live RTT entries
>> + *
>> + * Destroys an RTT. The RTT must be non-live, i.e. none of the 
>> entries in the
>> + * table are in ASSIGNED or TABLE state.
> 
> minor nit: It may be worth emphasising that you mean HIPAS here and not
> RMI_ASSIGNED (as returned by RTT_READ_ENTRY). The key is, an unprotected
> live leaf mapping  (i.e., HIPAS=ASSIGNED_NS) is considered non-live.

Ah, I went back to the spec and TABLE is not a HIPAS ( :facepalm ).
They are indeed RmmRttEntryState type. So, the comment is fine as it is.
Please ignore ^

> 
> Either ways:
> 


> Reviewed-by: Suzuki K Poulose <suzuki.poulose@arm.com>

Suzuki

