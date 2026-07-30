Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C573C53200
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 30 Jul 2026 01:34:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=quLfiHhuhZ4rZmR4UvnAX3/eBCRvvPk2hc96l8xk9uA=; b=uvXB4aVXo5lvY81uqYEb3NiG2A
	YkqzAbOsc5A+KQFjYe10XpK2TomOKt42C0f1wWWb5FJz7EmLSPOqnWKXg7QPUXpbh8nr6TTW9YFrE
	X+yRiyAJZgYOPQtpsUncLQ/hzUQ0R4aOgNhzCpGvm286TWBEQMJJvJMIIFaqTemrSTNH2gKItiYN5
	/5U0/yA6b8SLh4m4cpYR3mQE1ZL7+46JKUDRUz1H23YEkADwNWmpgDFwixD+Hp6eqBpthYnmHEBe3
	PJg64awv/KctZoZlrdkh6jxq0oxQ94Q7k3enhSlW4Vp9s34h7Jmhll9OjpxTkoVaJfDfU/kOjYdZ3
	F364DwZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpFf5-00000009GEK-3pV9;
	Thu, 30 Jul 2026 01:34:15 +0000
Received: from trager.us ([52.5.81.116])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpFf3-00000009GDv-3AuT
	for linux-arm-kernel@lists.infradead.org;
	Thu, 30 Jul 2026 01:34:14 +0000
Received: from c-73-254-161-40.hsd1.wa.comcast.net ([73.254.161.40] helo=[192.168.1.226])
	by trager.us with esmtpsa (TLSv1.3:TLS_AES_128_GCM_SHA256:128)
	(Exim 4.92.3)
	(envelope-from <lee@trager.us>)
	id 1wpFen-0008Ic-CM; Thu, 30 Jul 2026 01:33:57 +0000
Message-ID: <2228a2be-96b1-4c8a-9786-6ba07fd302c0@trager.us>
Date: Wed, 29 Jul 2026 18:33:49 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 03/10] arm_mpam: propagate MSC access errors for MBWU
 counters
To: Andre Przywara <andre.przywara@arm.com>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>, Hanjun Guo
 <guohanjun@huawei.com>, Sudeep Holla <sudeep.holla@kernel.org>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 "Rafael J . Wysocki" <rafael@kernel.org>, Len Brown <lenb@kernel.org>,
 James Morse <james.morse@arm.com>, Ben Horgan <ben.horgan@arm.com>,
 Reinette Chatre <reinette.chatre@intel.com>, Fenghua Yu <fenghuay@nvidia.com>
Cc: Jonathan Cameron <jic23@kernel.org>,
 Srivathsa L Rao <srivathsa.rao@oss.qualcomm.com>,
 Ganapatrao Kulkarni <ganapatrao.kulkarni@oss.qualcomm.com>,
 Trilok Soni <tsoni@quicinc.com>, Srinivas Ramana <sramana@qti.qualcomm.com>,
 Niyas Sait <niyas.sait@arm.com>, linux-acpi@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20260729134124.2506269-1-andre.przywara@arm.com>
 <20260729134124.2506269-4-andre.przywara@arm.com>
Content-Language: en-US
From: Lee Trager <lee@trager.us>
In-Reply-To: <20260729134124.2506269-4-andre.przywara@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260729_183413_827246_D0D72A70 
X-CRM114-Status: GOOD (  11.65  )
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

On 7/29/26 6:41 AM, Andre Przywara wrote:

> @@ -1767,6 +1781,7 @@ static int mpam_save_mbwu_state(void *arg)
>   {
>   	int i;
>   	u64 val;
> +	int ret;
>   	struct mon_cfg *cfg;
>   	u32 cur_flt, cur_ctl, mon_sel;
>   	struct mpam_msc_ris *ris = arg;
> @@ -1777,7 +1792,8 @@ static int mpam_save_mbwu_state(void *arg)
>   		mbwu_state = &ris->mbwu_state[i];
>   		cfg = &mbwu_state->cfg;
>   
> -		if (WARN_ON_ONCE(!mpam_mon_sel_lock(msc)))
> +		ACQUIRE(mon_sel_lock, guard)(msc);
> +		if (ACQUIRE_ERR(mon_sel_lock, &guard))
>   			return -EIO;
>   
>   		mon_sel = FIELD_PREP(MSMON_CFG_MON_SEL_MON_SEL, i) |
> @@ -1788,7 +1804,9 @@ static int mpam_save_mbwu_state(void *arg)
>   		mpam_write_monsel_reg(msc, CFG_MBWU_CTL, 0);
>   
>   		if (mpam_ris_has_mbwu_long_counter(ris)) {
> -			val = mpam_msc_read_mbwu_l(msc);
> +			ret = mpam_msc_read_mbwu_l(msc, &val);
> +			if (ret)
> +				return ret;
>   			mpam_msc_zero_mbwu_l(msc);
>   		} else {
>   			u32 val32;
I think checking for (val & MSMON____L_NRDRY) is still required before 
updating the saved state. mpam_msc_read_mbw_l() can return 0 while 
setting val to MSMON___L_NRDY when it cannot obtain a stable value. The 
state saving path later adds val to mbwu_state->correction, so the 
sentinel would corrupt the saved correction. Additionally, as Ben noted 
during the v3 review, hardware may also set the NRDY bit.
> @@ -1804,7 +1822,6 @@ static int mpam_save_mbwu_state(void *arg)
>   		cfg->partid = FIELD_GET(MSMON_CFG_x_FLT_PARTID, cur_flt);
>   		mbwu_state->correction += val;
>   		mbwu_state->enabled = FIELD_GET(MSMON_CFG_x_CTL_EN, cur_ctl);
> -		mpam_mon_sel_unlock(msc);
>   	}
>   
>   	return 0;

