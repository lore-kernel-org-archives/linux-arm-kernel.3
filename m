Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1AD4CCD4F2C
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 12 Jun 2026 08:45:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IptzJvEOpEyqJC6Y0bSpFGE8b6UEQBNCojgAbIIeMHQ=; b=fdjNdgRx8GKE3HuoNE2m2nqrvN
	QzpOmhF1mbBpt3akvnOpw1Nf4eAfx0VpWYg8SDtwgTHe+KmeQwY7FyFFTGr9IXT4rUNvW+BIWtlam
	hd3Xjgsk0bhfH0e3HzvBgy8llz9cAZfbo+bZ1143ZqvfXqgqV9S0uOT4BfKOFHoRrH9yKB1L+VrBB
	rTC6SpepSw6HBI9IdiQyDyysREZLqR3VBDk07sEDLaPpiJ3b6NiLgOq6F62pGtoPlrFCMQSlP9kGg
	JrTSbNB9TA7Ys2bHelxe5irjO9vhYmr4qLyrb0JOIPsXnuXesJWrJpfecb93P/Jv1/CNSY+cDRn2B
	JU4L55wg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXxVl-0000000AbvV-1Vt1;
	Fri, 12 Jun 2026 08:45:09 +0000
Received: from canpmsgout06.his.huawei.com ([113.46.200.221])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXxVi-0000000AbtM-1xTt
	for linux-arm-kernel@lists.infradead.org;
	Fri, 12 Jun 2026 08:45:08 +0000
dkim-signature: v=1; a=rsa-sha256; d=h-partners.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=IptzJvEOpEyqJC6Y0bSpFGE8b6UEQBNCojgAbIIeMHQ=;
	b=Qgwj5ABU+dlT8AcXkgaK1WsIsBFOajP+cutCE0DICt6giXo4fSeHnccWkhE8NWytiYyisImcv
	tCPQlyxTN1INBzLUUAS4ZTT5bhmQlnyqen29n0S0wFs7lssNd+f29BKBghVd0xh2yBG/h4I88/n
	SAboftgY10poy4mmhpBCUwA=
Received: from mail.maildlp.com (unknown [172.19.163.104])
	by canpmsgout06.his.huawei.com (SkyGuard) with ESMTPS id 4gcCYG37T8zRhQs;
	Fri, 12 Jun 2026 16:36:50 +0800 (CST)
Received: from kwepemf100008.china.huawei.com (unknown [7.202.181.222])
	by mail.maildlp.com (Postfix) with ESMTPS id 8DDF340363;
	Fri, 12 Jun 2026 16:44:45 +0800 (CST)
Received: from [10.174.179.37] (10.174.179.37) by
 kwepemf100008.china.huawei.com (7.202.181.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.36; Fri, 12 Jun 2026 16:44:44 +0800
Message-ID: <924fbfbc-995f-e291-8849-efcb8e01ef98@huawei.com>
Date: Fri, 12 Jun 2026 16:44:43 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v8 next 04/10] arm_mpam: Refactor rmid to reqPARTID/PMG
 mapping
Content-Language: en-US
To: James Morse <james.morse@arm.com>, <ben.horgan@arm.com>,
	<Dave.Martin@arm.com>, <tan.shaopeng@jp.fujitsu.com>,
	<reinette.chatre@intel.com>, <fenghuay@nvidia.com>, <tglx@kernel.org>,
	<will@kernel.org>, <hpa@zytor.com>, <bp@alien8.de>, <babu.moger@amd.com>,
	<dave.hansen@linux.intel.com>, <mingo@redhat.com>, <tony.luck@intel.com>,
	<gshan@redhat.com>, <catalin.marinas@arm.com>
CC: <linux-arm-kernel@lists.infradead.org>, <x86@kernel.org>,
	<linux-kernel@vger.kernel.org>, <wangkefeng.wang@huawei.com>,
	<sunnanyong@huawei.com>
References: <20260413085405.1166412-1-zengheng4@huawei.com>
 <20260413085405.1166412-5-zengheng4@huawei.com>
 <2944b506-a462-42f8-95cf-404241fb27f0@arm.com>
From: Zeng Heng <zengheng4@huawei.com>
In-Reply-To: <2944b506-a462-42f8-95cf-404241fb27f0@arm.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.174.179.37]
X-ClientProxiedBy: kwepems100002.china.huawei.com (7.221.188.206) To
 kwepemf100008.china.huawei.com (7.202.181.222)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260612_014507_137220_30B7F9DE 
X-CRM114-Status: UNSURE (   8.67  )
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
I tried to understand why there is insistence that CLOSID information
is necessary to support multiple control groups, but that is actually
not the case.

Before proceeding, please allow me to refer to base_partid as CPARTID
(control partition ID; I'm no longer borrowing the intPARTID concept
here). The associated partids_per_closid all share the same control
scheme.

The partids derived from partids_per_closid under a given CPARTID,
I will call MPARTID (monitor partition ID; no longer borrowing the
reqPARTID concept). These represent the PARTIDs used for different
monitoring groups under the same control scheme.


I've summarized the ID translation schemes from James and Martin as
follows:

  +-------------------------------+------------------+
  |            CLOSID       |{CDP}|       RMID       |
  +-------------------------------+------------+-----+
  |            MPARTID                         | PMG |
  |      CPARTID(or MPARTID_hi)   : MPARTID_lo |     |
  +--------------------------------------------+-----+

Where closid = cpartid (base_partid or mpartid_hi),
       rmid   = mpartid_lo * pmg_num + pmg,
with mpartid_lo in the range [0, partids_per_closid).

In this scheme, CLOSID and RMID are coupled together to form MPARTID,
which represents the monitor group PARTID.


In current patchset design, decoupling CLOSID and RMID, letting them
represent CPARTID and MPARTID respectively:

  +---------------------------------------------+
  |                    CLOSID             |{CDP}|
  +---------------------------------------------+
  |                    CPARTID                  |
  +---------------------------------------------+

  +---------------------------------------------+
  |                     RMID                    |
  +---------------------------------------+-----+
  |                   MPARTID             | PMG |
  |  MPARTID_hi(or CPARTID)  : MPARTID_lo |     |
  +---------------------------------------+-----+

Where closid  = cpartid (base_partid or mpartid_hi),
       rmid    = mpartid * pmg_num + pmg,
   and mpartid = mpartid_hi * partids_per_closid + mpartid_lo .

The design intent is to decouple CLOSID and RMID, rather than having
RMID depend on CLOSID to derive MPARTID. This decoupling is essential
for future dynamic allocation, because the relationship between MPARTID
and CPARTID must rely on table lookup rather than linear mapping. If
don't decouple in the static allocation design, we would need another
refactor when considering dynamic allocation extensibility.

The control path uses CLOSID alone (CPARTID), and the monitor path uses
RMID alone (the (MPARTID, PMG) pair). This definition also aligns
closely with the native resctrl concepts: CLOSID (Class of Service ID,
corresponding to CPARTID) and RMID (Resource Monitor ID, corresponding
to the (MPARTID, PMG) pair).


In the end, the number of control groups is determined by the number of
CPARTIDs. Both of these ID translation schemes support multiple control
groups.

Please allow me to rework the patch series into v9 based on my current
patches, incorporating your review feedback.


Best Regards,
Zeng Heng

