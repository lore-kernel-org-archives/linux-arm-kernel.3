Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3644DCD8CA8
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 13 Jun 2026 09:00:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:Cc:To:From:References:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sq0s+oRTI4ktIqGHIWoR26Iy3TsaTBLMhBmwLGqvAa8=; b=TsMelnQZX940X5CT7ilDSKNBw5
	RdWPoFwIwck3fBcvqR7etn4z4wfFg9/nOQm7WQGxghtVPZ9CFP1wge7LA5iSAhmo9+hu8C/NyOdQq
	Ft490ot8ym1PJ2X1v4vz+E9+SuUMNb0lPINMNuUgDoLH6Mg0RTYPxKFK7cvtOSmNnMuavh7pxNTTN
	9pZnHW+Ar3osTrQ5JXyYH+Q3/G4pveb2W1RTh26nSgq8bd7rEgWWw1hugwW0C0a4FhkubL6lAqJq9
	a1pJWKkqVAu/FX5asWZllnwbemJcKpl6FpVMxIlmncQlIXcJNEwNkeqhbrz/Z/gigm7ezW1H/t3cz
	ZcLIVVtQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wYKDi-0000000C6gP-2DgK;
	Sat, 13 Jun 2026 09:00:02 +0000
Received: from dggsgout11.his.huawei.com ([45.249.212.51])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wYKDe-0000000C6fk-3cIc
	for linux-arm-kernel@lists.infradead.org;
	Sat, 13 Jun 2026 09:00:01 +0000
Received: from mail.maildlp.com (unknown [172.19.163.177])
	by dggsgout11.his.huawei.com (SkyGuard) with ESMTPS id 4gcr0w3xFWzYQtnc
	for <linux-arm-kernel@lists.infradead.org>; Sat, 13 Jun 2026 16:59:28 +0800 (CST)
Received: from mail02.huawei.com (unknown [10.116.40.112])
	by mail.maildlp.com (Postfix) with ESMTP id F39484058F
	for <linux-arm-kernel@lists.infradead.org>; Sat, 13 Jun 2026 16:59:51 +0800 (CST)
Received: from [10.174.179.37] (unknown [10.174.179.37])
	by APP1 (Coremail) with SMTP id cCh0CgB3ej8FHC1qecmJBg--.8230S3;
	Sat, 13 Jun 2026 16:59:51 +0800 (CST)
Message-ID: <c1d9064e-b31a-9055-da1e-ff7f7ff02762@huaweicloud.com>
Date: Sat, 13 Jun 2026 16:59:49 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: [PATCH v8 next 04/10 Resend v2] arm_mpam: Refactor rmid to
 reqPARTID/PMG mapping
Content-Language: en-US
References: <924fbfbc-995f-e291-8849-efcb8e01ef98@huawei.com>
From: Zeng Heng <zengheng@huaweicloud.com>
To: James Morse <james.morse@arm.com>, ben.horgan@arm.com,
 Dave.Martin@arm.com, tan.shaopeng@jp.fujitsu.com, reinette.chatre@intel.com,
 fenghuay@nvidia.com, tglx@kernel.org, will@kernel.org, hpa@zytor.com,
 bp@alien8.de, babu.moger@amd.com, dave.hansen@linux.intel.com,
 mingo@redhat.com, tony.luck@intel.com, gshan@redhat.com,
 catalin.marinas@arm.com
Cc: linux-arm-kernel@lists.infradead.org, x86@kernel.org,
 linux-kernel@vger.kernel.org, Kefeng Wang <wangkefeng.wang@huawei.com>,
 sunnanyong@huawei.com
In-Reply-To: <924fbfbc-995f-e291-8849-efcb8e01ef98@huawei.com>
X-Forwarded-Message-Id: <924fbfbc-995f-e291-8849-efcb8e01ef98@huawei.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CM-TRANSID: cCh0CgB3ej8FHC1qecmJBg--.8230S3
X-Coremail-Antispam: 1UD129KBjvJXoWxJF48Cry7XF4DAw1DKFWxWFg_yoWrCF45pr
	4fKw47tF1DGF15W3srJa18Xw18JrZ3trWDKw1jqrykX3sxAw18Gr1Utr10yFyUJry8Jr1j
	vryUtw1UCrn8JrUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUU9Ib4IE77IF4wAFF20E14v26ryj6rWUM7CY07I20VC2zVCF04k2
	6cxKx2IYs7xG6r1S6rWUM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4
	vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_tr0E3s1l84ACjcxK6xIIjxv20xvEc7Cj
	xVAFwI0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIE14v26rxl6s0DM28EF7xvwVC2z280aVCY1x
	0267AKxVW0oVCq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG
	6I80ewAv7VC0I7IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFV
	Cjc4AY6r1j6r4UM4x0Y48IcVAKI48JM4IIrI8v6xkF7I0E8cxan2IY04v7Mxk0xIA0c2IE
	e2xFo4CEbIxvr21lc7CjxVAaw2AFwI0_GFv_Wryl42xK82IYc2Ij64vIr41l4I8I3I0E4I
	kC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWU
	WwC2zVAF1VAY17CE14v26r4a6rW5MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr
	0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r4j6F4UMIIF0xvE42xK8VAvwI8IcIk0rVWU
	JVWUCwCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJb
	IYCTnIWIevJa73UjIFyTuYvjxUIa0PDUUUU
X-CM-SenderInfo: p2hqwxhhqjqx5xdzvxpfor3voofrz/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260613_015959_276686_8BBB419A 
X-CRM114-Status: UNSURE (   9.48  )
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

Hi James,

>> @@ -478,6 +518,7 @@ static int __read_mon(struct mpam_resctrl_mon *mon, struct mpam_component *mon_c
>>   		      enum resctrl_conf_type cdp_type, u32 closid, u32 rmid, u64 *val)
>>   {
>>   	struct mon_cfg cfg;
>> +	u32 reqpartid = rmid2reqpartid(rmid);
>>   
>>   	if (!mpam_is_enabled())
>>   		return -EINVAL;
>> @@ -493,8 +534,8 @@ static int __read_mon(struct mpam_resctrl_mon *mon, struct mpam_component *mon_c
>>   	cfg = (struct mon_cfg) {
>>   		.mon = mon_idx,
>>   		.match_pmg = true,
>> -		.partid = closid,
>> -		.pmg = rmid,
>> +		.partid = (cdp_type == CDP_CODE) ? reqpartid + 1 : reqpartid,
>> +		.pmg = rmid2pmg(rmid),
> 
> Not using the CLOSID here breaks multiple control groups.
> 

After carefully reviewing your comments and Martin's patch series,
I tried to understand why there's insistence that CLOSID information
is necessary to support multiple control groups, but that's actually
not the case.

Before proceeding, allow me to introduce CPARTID (control partition ID,
no longer borrowing the intPARTID concept). All partids_per_closid
PARTIDs associated with it share the same control scheme under this
CPARTID.

Each PARTID within the partids_per_closid associated with a CPARTID is
called MPARTID (monitor partition ID, no longer borrowing the reqPARTID
concept). It refers to the PARTID used to represent different monitoring
groups under the same control scheme.

I've summarized the ID conversion diagrams from you and Martin as
follows:

  +-------------------------+-----+------------------+
  |          CLOSID         |{CDP}|       RMID       |
  +-------------------------+-----+------------+-----+
  |                   MPARTID                  | PMG |
  +-------------------------------+------------+     |
  |    MPARTID_hi (base_partid)   : MPARTID_lo |     |
  +-------------------------------+------------+-----+

Where (closid|cdp) = base_partid,
               rmid = mpartid_lo * pmg_num + pmg,
        and mpartid = base_partid * partids_per_closid + mpartid_lo,
with mpartid_lo in the range [0, partids_per_closid).

In this scheme, CLOSID and RMID are coupled together to form MPARTID,
which represents the monitor group PARTID.



In current patchset design, decoupling CLOSID and RMID, letting them
represent CPARTID and (MPARTID,PMG) pair respectively, rather than
having RMID depend on CLOSID to derive MPARTID. This decoupling is
essential for future dynamic allocation, because the relationship
between MPARTID and CPARTID must rely on table lookup rather than linear
mapping. If don't decouple in the static allocation design, we would
need another refactor when considering dynamic allocation extensibility.

  +-------------------------------------------+-----+
  |                    CLOSID                 |{CDP}|
  +-------------------------------------------+-----+
  |              CPARTID (base_partid)              |
  +-------------------------------------------------+

  +-----------------------------------+-----+-------+
  |                   RMID_hi         |{CDP}|RMID_lo|
  +-----------------------------------+-----+-------+
  |                   MPARTID               |  PMG  |
  +--------------+--------------------------+       |
  |  MPARTID_hi  : MPARTID_lo (base_partid) |       |
  +--------------+--------------------------+-------+

Where (closid|cdp) = base_partid,
            rmid_lo = pmg,
  and (rmid_hi|cdp) = mpartid = mpartid_hi * (partid_num / 
partids_per_closid) + base_partid,
with mpartid_hi in the range [0, partids_per_closid).

The reason of using base_partid as MPARTID_lo is to keep base_partid
contiguous and CLOSIDs are allocated contiguously. This does mean
MPARTIDs under the same CPARTID won't be contiguous, but that's
inherently difficult to guarantee with dynamic allocation anyway.


The control path uses CLOSID alone (CPARTID), and the monitor path uses
RMID alone (the (MPARTID, PMG) pair). This definition also aligns
closely with the native resctrl concepts: CLOSID (Class of Service ID,
corresponding to CPARTID) and RMID (Resource Monitor ID, corresponding
to the (MPARTID, PMG) pair).


In the end, the number of control groups is determined by the number of
CPARTIDs. Both of these ID translation schemes support multiple control
groups.

Could you please help outline the pros and cons of each approach?
This will determine which direction I take for subsequent iterations.

Thanks in advance.


Best Regards,
Zeng Heng


