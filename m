Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57799C79FB9
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Sep 2026 12:59:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NWHtsCUiemcaNOw8QS78Dn5hbjWnozO6hfjd10/VVAU=; b=UZQXCgXQnX0PV3OzpBhqMcZCsZ
	QeJ9TZznqEMIT8utftmFyrHR0c88j6514ECl8ASqFom3OlqKzZqa923QeKWpjWhF1NZK3jlJmdZ2Z
	l0oY3S8fqaL8HINucRKTuZQnTrwegjjjk2OoGReu9J/0PIxCbNMyq4o7HVHe6ohW8tDIRTGV05+ZX
	zQNVuJqWQNro7b1W44OTgnHdzPKwa8Ph48jyMrS0oSMGNTn20Ai+yumlKNHApHDfCITCnY/II8HW0
	tHJEZpQG0ApCRBMmbOl3e4t1Q0X9L8L9h7nqiTdBiYmXDIzur/av2eSXpaAP+fjCm3+cLW6XKM017
	l+cMcJvA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4e8q-0000000EMm0-33hn;
	Thu, 10 Sep 2026 12:44:36 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4e8o-0000000EMld-24cT
	for linux-arm-kernel@lists.infradead.org;
	Thu, 10 Sep 2026 12:44:35 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id DA328153B;
	Thu, 10 Sep 2026 05:44:27 -0700 (PDT)
Received: from [10.2.197.99] (ewhatever.cambridge.arm.com [10.2.197.99])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 2C66C3F7B4;
	Thu, 10 Sep 2026 05:44:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1789044271; bh=mWkbpWT4DcWBDnuPciUuXTxSlxhpPhycuu8HUKXHUOA=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=SLmLCa+f5BtxsTBKm8tudDDP9I7m2Cg/u7128g6wS0ro1bz11aFjbBGu9n2eIc41B
	 FUtlcYL2cz0Ua7c9tQZiKMZrQEHR995V9VnblJ8o99wKmNn9v9nIsWoV87xmmnPX4v
	 5teVkErMcFb7+nGSTnihU+gv7YTvkrknmBC8DZxk=
Message-ID: <be145c81-62e6-4aee-bea1-91357c36ad82@arm.com>
Date: Thu, 10 Sep 2026 13:44:26 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v17 10/20] KVM: arm64: coco: Disable Steal time accounting
 for coco guests
To: Fuad Tabba <fuad.tabba@linux.dev>
Cc: kvm@vger.kernel.org, kvmarm@lists.linux.dev, maz@kernel.org,
 will@kernel.org, catalin.marinas@arm.com, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, steven.price@arm.com,
 aneesh.kumar@kernel.org, oupton@kernel.org, gshan@redhat.com,
 joey.gouly@arm.com, yuzenghui@huawei.com, linux-coco@lists.linux.dev,
 gankulkarni@os.amperecomputing.com, sdonthineni@nvidia.com,
 alpergun@google.com, fj0570is@fujitsu.com, WeiLin.Chang@arm.com,
 lpieralisi@kernel.org, enju.kohei@fujitsu.com
References: <20260908162223.1683432-1-suzuki.poulose@arm.com>
 <20260908162223.1683432-11-suzuki.poulose@arm.com>
 <CA+EHjTw9ReyvsNT=y+-P6ng7VQ6Pvz9PFK9bO71qvTR1pOxx5Q@mail.gmail.com>
 <6152fc41-65f0-460f-90b4-1454c11bcba6@arm.com>
 <CA+EHjTxjk1JLR7Tf5LEfB_xypbUWnw3G3H-FT7bTE=nWTTRgAA@mail.gmail.com>
 <d22c863b-ea81-472c-b2a9-28f99e5b6f92@arm.com>
 <CA+EHjTx744tg1c3vX0Ugo8YN7n-wtq9-rWdjjSP+UXi8_vvq7g@mail.gmail.com>
Content-Language: en-US
From: Suzuki K Poulose <suzuki.poulose@arm.com>
In-Reply-To: <CA+EHjTx744tg1c3vX0Ugo8YN7n-wtq9-rWdjjSP+UXi8_vvq7g@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260910_054434_576839_7A8A0B9B 
X-CRM114-Status: GOOD (  15.18  )
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

On 10/09/2026 13:42, Fuad Tabba wrote:
> Hi Suzuki,
> 
> On Thu, 10 Sept 2026 at 11:28, Suzuki K Poulose <suzuki.poulose@arm.com> wrote:
> ...
>> Just to make sure I understand the picture:
>>
>> For coco VMs:
>>
>>    - check extension on coco KVM, KVM_CAP_STEAL_TIME => 0
>>
>> And a follow up DEVICE_HAS_ATTR => -EPERM ?
>>
>> But we tell the VMM, look you don't have the capabilit on this VM.
>> But if you try to set the attribute isn't it more appropriate to
>> say:
>>    -ENXIO - No you don't have that feature on this VM (-ENXIO)
>> rather than
>>    -EPERM - No, I won't let you do that.
>>
>> Remember we are doing only in the "VM" context. It is a minor nit
>> but I wanted to make sure we understand what we are thinking.
> 
> -ENXIO it is. I went back to api.rst for KVM_SET_DEVICE_ATTR: ENXIO is
> for a group or attribute that's "unknown/unsupported for this device",
> and EPERM for one that "cannot (currently) be accessed this way", a
> state or access-mode refusal, so a VM type that doesn't have the
> feature is the former. KVM_HAS_DEVICE_ATTR only documents ENXIO at
> all. Your patch is good as it is.
> 
> Reviewed-by: Fuad Tabba <fuad.tabba@linux.dev>

Cheers,

Suzuki


