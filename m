Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9264A606A5B2
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Nov 2026 15:57:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=rqs9J+mH;
	dkim=pass (1024-bit key, unprotected) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=fnGlHX+U
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=nmjX+gZnq1JmQb9kEyFBLchOqDlgvPlEFS1E5xvlvxE=; b=rqs9J+mH7m4lyw
	u76tAoQYfahk0m+D2Y+yHVH1ubolpgoRVDJdfHZzVjsLe8JZa8Zqe7ekr06xHmysRcljkZHuqXLAS
	rCaVUb6ymCVHYvqrzFabFLKGIfAFwd3X7twhOzFDtioImT7hjMKns50L3k0zHwqALf2JJCGj7cYPN
	IIbm6YqBsWuuR7eINmHecNk2u7w/2e+A5Ecce2qUHEtcmcTv5UhnYgkcFokBLM0jSq4+MQaKtk1iW
	oD8rU8yHKlLipGkD4v9kKSaoA0bkc3RVrCw1Lil8l123+i9aV3bNAELvAj8DA7M7M3sQs5bFWTTaf
	ZG1PcUkiRR+YQnJJgzeA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNuPj-0000000HEGZ-0wwp;
	Mon, 02 Nov 2026 15:57:39 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNuPh-0000000HEG7-0S8a
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Nov 2026 15:57:38 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 06AA11691;
	Mon,  2 Nov 2026 07:57:33 -0800 (PST)
Received: from [10.57.66.79] (unknown [10.57.66.79])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 8B8703F673;
	Mon,  2 Nov 2026 07:57:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1793635056; bh=17j2yXfs58CpqKQEHFy6H451nac5qtYTTRF17xOQiSw=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=fnGlHX+UPMKGBP4eiXdt3RMc/CD0IYMClJYY6xjctAvQ6jZVSB9jGzI//Eeq8Tlp1
	 b5pFugq0mn9nU1RHNbvkKV4aYN7E24deQtMM8+tufCWNMZWa39mw5yvvqiRx4GIOMG
	 XfBRk/rotWv3ZIXj8FtfUybUKIm4ZQabM2yXAqlk=
Message-ID: <46c28259-086e-4948-8c00-183f9e62114a@arm.com>
Date: Mon, 2 Nov 2026 15:57:33 +0000
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v1 1/2] KVM: arm64: CCA: Add support for configuring
 the Realm MEC policy
Content-Language: en-GB
To: Kohei Enju <enju.kohei@fujitsu.com>
Cc: linux-arm-kernel@lists.infradead.org, kvm@vger.kernel.org,
 kvmarm@lists.linux.dev, cgroups@vger.kernel.org, linux-coco@lists.linux.dev,
 Marc Zyngier <maz@kernel.org>, Fuad Tabba <tabba@google.com>,
 Oliver Upton <oupton@kernel.org>, Joey Gouly <joey.gouly@arm.com>
References: <20260724094120.166536-1-enju.kohei@fujitsu.com>
 <20260724094120.166536-2-enju.kohei@fujitsu.com>
 <46d78aa2-cacb-4efd-ae62-3026f5fe9b3f@arm.com>
 <amwrnJ1KhllC-gVu@FCCLS0092175.localdomain>
 <auio781Uu9Zzyq3i@FCCLS0092175.localdomain>
From: Suzuki K Poulose <suzuki.poulose@arm.com>
In-Reply-To: <auio781Uu9Zzyq3i@FCCLS0092175.localdomain>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261102_075737_230195_09808A67 
X-CRM114-Status: GOOD (  27.98  )
X-Spam-Score: -4.4 (----)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-7.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Kohei,

On 02/11/2026 15:19, Kohei Enju wrote:
> Hi Suzuki,
> 
> I sent the message below off-list a few weeks ago, but I'm following up
> on-list in case it didn't reach you.
> 
> Since then, I've started reworking the series based on the
> kvm_device_attr approach you suggested, and I'm currently testing it
> against v23 of the CCA host support.
> 
> I'd still appreciate any feedback on the ABI direction, as well as
> whether you see any concerns with posting the RFC series while the host
> support is not yet upstream.
> 
> Thanks,
> Kohei
> 
> On Fri, Oct 9, 2026 at 03:15:23PM +0900, Kohei Enju wrote:
>> On 07/31 14:09, Kohei Enju wrote:
>>> On 07/29 12:47, Suzuki K Poulose wrote:
>>>> Hello
>>>>
>>>> Thanks for sending the patch. Please find my comments inline below.
>>>>
>>>>
>>>> On 24/07/2026 10:40, Kohei Enju wrote:
>>>>> Introduce the KVM_ARM_RMI_CONFIG ioctl to allow userspace to configure
>>>>> Realm VM parameters before the Realm is created.
>>>>
>>>> This approach is something we tried in the past. Another option is to
>>>> add these as kvm_device_attr for the KVM VM, under a new group, e.g.,
>>>> KVM_ARM_VM_RMI_CTRL and add the following attributes :
>>>>
>>>> KVM_ARM_VM_RMI_CTRL_RPV 		-> Realm Personalization Value
>>>> KVM_ARM_VM_RMI_CTRL_MEASUREMENT_ALGO	-> Measuerment algo
>>>> KVM_ARM_VM_RMI_CTRL_MEC_PRIVATE		-> Private MEC Policy. By default to shared
>>>> ?
>>>
>>> Hi Suzuki, thanks for suggesting another option. That looks good to me,
>>> and I'd be happy with either approach.
>>> Anyway I'd like to wait for feedback from the maintainers and other
>>> reviewers.
>>
>> Hi Suzuki,
>>
>> I'm thinking of respinning the MEC policy series as RFC v2, as you
>> mentioned in the Core Collective WG last month.
>>
>> For the ABI, I'm planning to switch to the kvm_device_attr-based
>> approach you suggested instead of introducing a new VM ioctl. Before I
>> start reworking the series, do you have any concerns with that
>> direction?

...


>>
>> One other point is that the series still depends on the CCA host
>> support, which is not upstream yet. As a result, tools such as Sashiko
>> would likely be unable to identify the correct base tree and may not be
>> able to provide useful automated review feedback.
>>
>> Personally, I think this is acceptable since the series is still RFC and
>> the primary goal is to get feedback on the ABI and overall design rather
>> than seeking integration at this stage. However, I am aware that posting
>> patches on top of non-upstream trees can sometimes be problematic from a
>> review perspective.
>>
>> Do you have any concerns about posting an RFC series in this situation,
>> or would you prefer that I wait until the host support lands upstream?

It would be useful to have the RFC on the list to get an idea on shaping
the UABI. It may also be useful for people to verify the end-to-end
stack, including the remote attestation flow. (the branch we have is
ancient)

But nothing else, i.e, code correctness or functional reviews
etc (that rules out meaningful Sashiko reviews etc).

Suzuki



>>
>> Thanks,
>> Kohei


