Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83D89CD4F3D
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 21 May 2026 16:05:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gntcCyWrVNPYG8uqabBln7PELV3BpVOXL1VwXsFFeSk=; b=b30FnXgsGNEUYxdu6Eh4JCfNPo
	vT/fnd36bHQkh/+GffBl+H73d+mMWiFITp1Eap2hjBQBK/TS6/midPrh52DQvkE22C1NVXscFbMNO
	aAyUA5H6jqm1MkDaPh1h4Lm7oeHX6DvxXRb/+4p3kYL3sC0uKE/FNRVVJT9SyOho9AKm18dX9ihsG
	iDWQPrS9Zxujbp/8vr5CZwKtbQNPJzwNPANd/xVi4wVBBY4ZMQ7s+uQC/nbbYOexB91x7r+d252U+
	Uz4EpVbDzhWreNrH2W4JrVnIBzZYXUyPrgdi7IPjBIOFW67z/d0Irfa5na/jTYSF+w1N42xpYReOg
	ZEc5HNjg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQ5tP-00000008RIZ-0Yj9;
	Thu, 21 May 2026 16:05:03 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQ5tM-00000008RHj-0CBR
	for linux-arm-kernel@lists.infradead.org;
	Thu, 21 May 2026 16:05:01 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 070B327DC;
	Thu, 21 May 2026 09:04:54 -0700 (PDT)
Received: from [192.168.178.24] (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 5746F3F85F;
	Thu, 21 May 2026 09:04:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1779379499; bh=WrS7fUya0tB6RvYKPlX4u1Tgmf4rlpi3+sFsH/ZRSiI=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=trXtDEBhxsLogmubRZ5go2fZdcja2PICflKOjlf7cuyxhtNmTeczOd8o2EYHQLoCf
	 /fVl1ys0J6bNpE9xgZdwOHtp0IIZP4o4VD+jPwpz8jNSsTVsVCdQyho3IN5OE2rZ5y
	 BYQLaSzeDj31a293zLownVRWmL6jhLIxtFbHuNSA=
Message-ID: <88ed47c1-f84f-4aac-8ec7-ffe87a2a8138@arm.com>
Date: Thu, 21 May 2026 18:04:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/5] arm_mpam: detect and enable MPAM-Fb PCC support
To: Niyas Sait <niyas.sait@arm.com>
Cc: ben.horgan@arm.com, catalin.marinas@arm.com, fenghuay@nvidia.com,
 guohanjun@huawei.com, james.morse@arm.com, jic23@kernel.org,
 lenb@kernel.org, linux-acpi@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 lpieralisi@kernel.org, rafael@kernel.org, reinette.chatre@intel.com,
 sudeep.holla@kernel.org, will@kernel.org
References: <20260429141339.3171205-6-andre.przywara@arm.com>
 <20260518111422.3269965-1-niyas.sait@arm.com>
Content-Language: en-US
From: Andre Przywara <andre.przywara@arm.com>
In-Reply-To: <20260518111422.3269965-1-niyas.sait@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260521_090500_132649_1CBC9C2F 
X-CRM114-Status: GOOD (  14.32  )
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

Hi Niyas,

On 5/18/26 13:14, Niyas Sait wrote:
> Hi Andre,
> 
> On Wed, Apr 29, 2026 at 04:13:39PM +0200, Andre Przywara wrote:
> 
>> +		msc->pcc_chan = pcc_mbox_request_channel(&msc->pcc_cl,
>> +							 pcc_subspace_id);
>> +		if (IS_ERR(msc->pcc_chan)) {
>> +			pr_err("Failed to request MSC PCC channel\n");
>> +			return (void *)msc->pcc_chan;
>> +		}
>> +
>> +		if (msc->pcc_chan->shmem_size < MPAM_FB_MAX_MSG_SIZE) {
>> +			pr_err("MPAM-Fb PCC channel size too small.\n");
>> +			pcc_mbox_free_channel(msc->pcc_chan);
>> +			return ERR_PTR(-ENOMEM);
>> +		}
> 
> I think this allocates one PCC channel per MSC instance.
> 
> MPAM-Fb spec. allows MPAM manager to support multiple MSCs and does not

Ouch, that's right, the MSC ID parameter in the protocol would be pretty 
pointless otherwise ;-)
I guess me testing with just one MSC kind of hides this problem ;-)

> require seperate channels per MSC. Each MSC is targeted via its msc_id
> in the MPAM_MSC_READ/WRITE commands.
> 
> So for systems where multiple MSC nodes point to the same PCC subspace,
> should we share one pcc_mbox_chan and serialize requests through it?

I think we serialise already, because we have this pcc_chan_lock. This 
makes sure that each access is done in isolation. But on the setup side 
we need to indeed make sure to share an already allocated channel, which 
required some code changes.

Thanks for pointing this out!

Cheers,
Andre


