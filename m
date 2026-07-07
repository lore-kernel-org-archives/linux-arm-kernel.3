Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 877C8C43458
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Jul 2026 08:36:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mBkwwnHGuzcY60618y6u0CNrluVSVkNQLCREmDyHKaA=; b=oiHsD0CHyaz+PNdz/pqdpaAABD
	jFr6dIAYvoP0xJ5CLGJPs14M+q9b18rHyOKBtCa8bNtGYXX5B/7ybN8+cLEXNI0GHYK+JbMZweTqE
	qTaEq9AQKnUA2zS2uT3W5gspMlCfC9R+CEPVa619Vh+df+eLW12WR0DIR38lfjj5x0A3Z2x2D8/WJ
	w7dbVmOeDnmOYBkQcka6cTndb4Z36q5ZzAw9XBoRdexufK21mx1AIdjg1MCjRv1A093RbBKOBZCN1
	DHBF0Xzbg0o/QjUjSGvVgye6DU7GW4C8LsjgZzibfbmG2EOjHaqYLIIV53da/foNj2cOklO5lXCad
	w6kq9e+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wh1Hd-0000000EUiO-2OkH;
	Tue, 07 Jul 2026 08:36:01 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wh1HX-0000000EUhW-2KuU
	for linux-arm-kernel@lists.infradead.org;
	Tue, 07 Jul 2026 08:36:00 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id DDBCF2379;
	Tue,  7 Jul 2026 01:35:48 -0700 (PDT)
Received: from [10.2.212.8] (e134344.arm.com [10.2.212.8])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 37E5E3F85F;
	Tue,  7 Jul 2026 01:35:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1783413353; bh=u3RlVTowKqTUJwgRzp3SA9YrCrbi3lk5EF2OOQEph4A=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=RQ6Y0C2Wptt8NGN3y917WJAMNoPF9+mkViw0HKaM+pw37cU5w3GN2wq/zSyBfkaPQ
	 douyxLGmNgkVyeJzYO7uti42uJmucdVttqpysAYMQ9G+LnV4dh7WrDzO9Bbla8RDM6
	 pN19sG4XRgGtc5XGE2xYWPrh/LDVrceOe3vBzEcs=
Message-ID: <e9185282-94b9-4de4-89db-f9451e47b506@arm.com>
Date: Tue, 7 Jul 2026 09:35:49 +0100
MIME-Version: 1.0
User-Agent: Thunderbird Daily
Subject: Re: [PATCH v4 2/3] arm_mpam: resctrl: Add pass-through
 resctrl_arch_preconvert_bw()
To: Reinette Chatre <reinette.chatre@intel.com>
Cc: james.morse@arm.com, fenghuay@nvidia.com, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, tglx@linutronix.de, mingo@redhat.com,
 bp@alien8.de, dave.hansen@linux.intel.com, hpa@zytor.com, corbet@lwn.net,
 x86@kernel.org, linux-doc@vger.kernel.org, dave.martin@arm.com
References: <20260706160639.2136674-1-ben.horgan@arm.com>
 <20260706160639.2136674-3-ben.horgan@arm.com>
 <4c520a28-9a72-4abd-8e5b-654a312c92fd@intel.com>
Content-Language: en-US
From: Ben Horgan <ben.horgan@arm.com>
In-Reply-To: <4c520a28-9a72-4abd-8e5b-654a312c92fd@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260707_013556_368676_EFFC0B3F 
X-CRM114-Status: GOOD (  10.65  )
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

Hi Reinette,

On 7/6/26 22:33, Reinette Chatre wrote:
> Hi Ben,
> 
> On 7/6/26 9:06 AM, Ben Horgan wrote:
>> resctrl rounds up the percentage value of the MBA based on the bw_gran. As
>> MPAM uses a binary fixed point fraction format for MBA rather than a
>> decimal percentage, this introduces rounding errors.
>>
>> Without this additional rounding, if the user reads the value in an MB
>> schema and then writes it back to the schema, the value in hardware won't
>> change. However, with this additional rounding, this guarantee is broken
>> for systems with mbw_wd < 7.
>>
>> resctrl is introducing resctrl_arch_preconvert_bw() to allow the arch code
>> to specify the conversion resctrl does to the user-provided bandwidth
>> value. Add the MPAM version of resctrl_arch_preconvert_bw(). This does no
>> conversion.
>>
>> Signed-off-by: Ben Horgan <ben.horgan@arm.com>
>> Reviewed-by: Reinette Chatre <reinette.chatre@intel.com>
>>
> 
> Unfortunately the "---" separator is missing here.

Another silly mistake.. sorry about that. I've corrected locally and
will send a respin in a day or two.

Thanks,

Ben

> 
>> Changes since v3:
>> Parameter order switch (Reinette)
>> Add Reinette's R-b
>> ---
> Reinette


