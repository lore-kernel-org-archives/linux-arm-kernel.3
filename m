Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 283F8C44529
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Jul 2026 14:54:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8rdkwdHFhooXiJD5RHQu6PWVPro9MMDXLk7iFV/JEbc=; b=xTlkCddkuvV5+AJrvHajuwlmTA
	K/X4Li9nHXfE5JGEmeEcFyyi8ptggb3ZWsP/L0Rot8n/CTSY5LWIwZveeY14tyXJNzB52NZHO+8Uy
	yn+/kh13GsApzRm5Fm1tSUnV0aNyI5y8T0P1gSq8xJzV64sSGRrbFjQYuJsHYKSs66qQZn5qrjelx
	9/fYigmV/d6eGa9Rr5rAGuw2ejIhyNpAp4AfXHhhoiEyMAxqD2fVEXP931UeTKVd2GN95JlnrYYg3
	XYWIO5kiNWH3mZC7LQ/4RqBw9B8oGCrGzmS3LIyOON15hv36FUiKzeJgQU2kN3umbGGQgprX15Hco
	x18S9N+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmBrn-00000009hwT-068j;
	Tue, 21 Jul 2026 14:54:43 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmBrk-00000009hvw-2vO9
	for linux-arm-kernel@lists.infradead.org;
	Tue, 21 Jul 2026 14:54:41 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E058D152B;
	Tue, 21 Jul 2026 07:54:34 -0700 (PDT)
Received: from [192.168.178.24] (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 251EF3F86F;
	Tue, 21 Jul 2026 07:54:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1784645679; bh=MitdL30heQSAH7WS0YQpZljVY3sO1FWU+W23/+uIAe8=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=BBWuskjtszvLN5RjnQFmSXDBnb5rmM7GLCwJ9I/v92BznbOltddup6q68nKrSIduz
	 0kAsQHVSgQ1UqICtuVfak65akUtXJ0GRTZ45qz8zI/YqWlnxrGfJZxmzXl66TMH3uJ
	 PUpNBhzY/6DBQiViSY6vC9KLV0CKTrev1FKnnDg8=
Message-ID: <b943d2e7-9f74-40f6-bbaa-84642ea785eb@arm.com>
Date: Tue, 21 Jul 2026 16:54:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 16/16] arm_mpam: detect and enable MPAM-Fb PCC support
To: Niyas Sait <niyas.sait@arm.com>, Lorenzo Pieralisi
 <lpieralisi@kernel.org>, Hanjun Guo <guohanjun@huawei.com>,
 Sudeep Holla <sudeep.holla@kernel.org>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 "Rafael J . Wysocki" <rafael@kernel.org>, Len Brown <lenb@kernel.org>,
 James Morse <james.morse@arm.com>, Ben Horgan <ben.horgan@arm.com>,
 Reinette Chatre <reinette.chatre@intel.com>, Fenghua Yu <fenghuay@nvidia.com>
Cc: Jonathan Cameron <jic23@kernel.org>,
 Srivathsa L Rao <srivathsa.rao@oss.qualcomm.com>,
 Ganapatrao Kulkarni <ganapatrao.kulkarni@oss.qualcomm.com>,
 Trilok Soni <tsoni@quicinc.com>, Srinivas Ramana <sramana@qti.qualcomm.com>,
 linux-acpi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20260710144520.917375-1-andre.przywara@arm.com>
 <20260710144520.917375-17-andre.przywara@arm.com>
 <9ac5f187-ff48-434b-a1c0-7f73b442083c@arm.com>
Content-Language: en-GB
From: Andre Przywara <andre.przywara@arm.com>
In-Reply-To: <9ac5f187-ff48-434b-a1c0-7f73b442083c@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260721_075440_780523_E753BEC7 
X-CRM114-Status: UNSURE (   9.74  )
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
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

Hi Niyas,

On 7/14/26 14:32, Niyas Sait wrote:
> On 10/07/2026 15:45, Andre Przywara wrote:
>> +    cur->pcc_cl.dev = dev;
>> +    cur->pcc_cl.rx_callback = mpam_pcc_rx_callback;
>> +    cur->pcc_cl.tx_block = true;
>> +    cur->pcc_cl.tx_tout = 1000; /* 1s */
> 
> Should this timeout be based on nominal latency reported in PCC table 
> instead of being hard coded to 1s here? May be some multiple of nominal 
> latency reported

I originally thought that this would be handled by the PCC code, but 
that just parses the value, and puts it in the pcc_mbox_chan struct. 
Which we only get access to *after* we request the channel in the next 
line here.
But it's only mbox_send_message() that uses the value, so I think we can 
populate that value later on still. And yeah, some multiple of the 
nominal latency sounds reasonable.

Cheers,
Andre


