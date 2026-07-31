Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A096C55167
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 31 Jul 2026 10:11:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=K9dY2H808Dp/6uy1n4CWr6HmC/jUngPktQ7cJPU2xVg=; b=oLTYHlrTYvkm0bUTWhEA4GZl0x
	vCC0j2DdrJCZ1P7IRY/pECiLaiw688G7ygY3BmAPXPcFBpZXLfjHX9gyc1sJ53+wkXPG724i7SPP5
	VRgeICdONxT/+a+gL6t7bpHvyc7hRRZAO10JIK8tSFaTZLsut5UZ8QYZK7zVgCuu5iuNs7rvhJF/Q
	ix+L8Gcwd8hR7Kag10lMAgdABtkJSoEnwwk3+kGXrRoJDD6ICPoQ28Dt0yECzr4ORTuYcjengnzK+
	9i5taz4dAXEVmWkSkBr3sxnab1LK+Fq434WysK9TiX2kH1JZ/35jdEMYrFtlqTkh1i9nxMRDL3OuM
	YRT/Yb6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpkDU-0000000CHbl-2pZU;
	Fri, 31 Jul 2026 10:11:48 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpkDR-0000000CHap-2noy
	for linux-arm-kernel@lists.infradead.org;
	Fri, 31 Jul 2026 10:11:47 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 210D7165C;
	Fri, 31 Jul 2026 03:11:38 -0700 (PDT)
Received: from [192.168.178.24] (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 4D4AF3F86F;
	Fri, 31 Jul 2026 03:11:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1785492702; bh=RLS3/hfdCm6N4efnsqtV235Qxd88UElm9zNsArg8c8o=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=bnRfKAlmHFVVBv9DMLUdgTeR1G/1D3Ncia+1IKAI5TDeb9jIfXNynWvyDrP7+YKT8
	 jo8Nz0tKjkZv0/B/D+MntRD7ncpk6xVBBkragociRiJ9KSN9Tcoqexjapf2+5zW5hj
	 PqRV/xtD5nYgdiAr9WDOdwnhZY+oXFzQkzG2ES5I=
Message-ID: <d22d8dae-e005-4353-a360-c38f2a52b2f4@arm.com>
Date: Fri, 31 Jul 2026 12:11:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 10/10] arm_mpam: detect and enable MPAM-Fb PCC support
To: Lee Trager <lee@trager.us>, Lorenzo Pieralisi <lpieralisi@kernel.org>,
 Hanjun Guo <guohanjun@huawei.com>, Sudeep Holla <sudeep.holla@kernel.org>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 "Rafael J . Wysocki" <rafael@kernel.org>, Len Brown <lenb@kernel.org>,
 James Morse <james.morse@arm.com>, Ben Horgan <ben.horgan@arm.com>,
 Reinette Chatre <reinette.chatre@intel.com>, Fenghua Yu <fenghuay@nvidia.com>
Cc: Jonathan Cameron <jic23@kernel.org>,
 Srivathsa L Rao <srivathsa.rao@oss.qualcomm.com>,
 Ganapatrao Kulkarni <ganapatrao.kulkarni@oss.qualcomm.com>,
 Trilok Soni <tsoni@quicinc.com>, Srinivas Ramana <sramana@qti.qualcomm.com>,
 Niyas Sait <niyas.sait@arm.com>, Ritwick Sharma <ritwick.sharma@arm.com>,
 linux-acpi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20260730152539.2712312-1-andre.przywara@arm.com>
 <20260730152539.2712312-11-andre.przywara@arm.com>
 <c3d43f56-b875-4bbd-b249-1a5f33cd54ed@trager.us>
Content-Language: en-GB
From: Andre Przywara <andre.przywara@arm.com>
In-Reply-To: <c3d43f56-b875-4bbd-b249-1a5f33cd54ed@trager.us>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260731_031145_844080_BE784360 
X-CRM114-Status: GOOD (  12.62  )
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

Hi Lee,

On 7/31/26 00:28, Lee Trager wrote:
> 
> On 7/30/26 8:25 AM, Andre Przywara wrote:
>> +static struct mpam_pcc_chan *mpam_pcc_chan_get(struct device *dev,
>> +                           int subspace_id)
>> +{
>> +    struct mpam_pcc_chan *cur;
>> +
>> +    guard(mutex)(&pcc_chan_list_lock);
>> +
>> +    list_for_each_entry(cur, &pcc_chan_list, pcc_chans) {
>> +        if (cur->subspace_id == subspace_id) {
>> +            kref_get(&cur->refcount);
>> +
>> +            return cur;
>> +        }
>> +    }
>> +
>> +    cur = kzalloc_obj(*cur);
>> +    if (!cur)
>> +        return ERR_PTR(-ENOMEM);
>> +
>> +    cur->pcc_cl.dev = dev;
>> +    cur->pcc_cl.tx_block = true;
>> +
>> +    cur->pcc_chan = pcc_mbox_request_channel(&cur->pcc_cl, subspace_id);
>> +    if (IS_ERR(cur->pcc_chan)) {
>> +        long err = PTR_ERR(cur->pcc_chan);
>> +
>> +        kfree(cur);
>> +        return ERR_PTR(err);
>> +    }
>> +
>> +    /* Timeout based on the "nominal latency" from the PCC ACPI 
>> table. */
>> +    cur->pcc_cl.tx_tout = cur->pcc_chan->latency * 5;
> I think this may need a unit conversion. ACPI 6.6 describes PCC nominal 
> latency in microseconds, and the PCC mailbox driver appears to copy that 
> value directly into pcc_chan->latency. However mbox_client::tx_tout is 
> documented in milliseconds.

Ah, good point, they are indeed using different units.
Will fix that.

Thanks,
Andre

> If I'm reading that correctly, assigning latency * 5 would make the 
> timeout 1000 times longer than intended. Would something like this be 
> better?
> 
> cur->pcc_cl.tx_tout = DIV_ROUND_UP_ULL((u64)cur->pcc_chan->latency * 5, 
> USEC_PER_MSEC);


