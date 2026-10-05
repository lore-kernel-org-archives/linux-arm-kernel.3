Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C8A8CA5FFC
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  5 Oct 2026 09:11:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=T9oxOuG7wNa3Rqa6hUzdfTKeLLzuEgWjUSJ0eKN2I8Q=; b=Q/KHnMjcwTu2NlMyz4VrFSDRE9
	1q6PKw+iN5DMibrE4DJNyoDYEXAcRgcpgmlAbSdRK8eWBVLPdqyc3vl7svau9g04lOiSz+J6hC+ge
	jd8ua6QlZsiMp1/FA0uvkR0XLADKJXfKA79l1m/QYle+ZMb5Ql6mDwK/10lAnv6o5wlg5O20uYrKi
	sWKPWjTYq0mma4h8SGNHbaODtZ/fnEZWnm/lXHbT8KhULum+LXE3DCMUMuo3TNw0+5DnGeoVhInaq
	O+LRfTtf5Uz23bdpm32BOXahv9rSgiF8NHIJAakDsa9Dt3UHv47A31Oi8BzLnJtnYPafbOtAIZhWT
	GCCLBx4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDejP-0000000FyWC-2yQq;
	Mon, 05 Oct 2026 09:11:35 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDejM-0000000FyVZ-39oo
	for linux-arm-kernel@lists.infradead.org;
	Mon, 05 Oct 2026 09:11:34 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6958xSY1872495
	for <linux-arm-kernel@lists.infradead.org>; Mon, 5 Oct 2026 09:11:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	T9oxOuG7wNa3Rqa6hUzdfTKeLLzuEgWjUSJ0eKN2I8Q=; b=F7Cz2q/TsBt3Itl7
	KRD1ug1h62PtAKBZh2lxFvSfnIKniBm2tq6ngc3tWjsA0etzeVS5WDQttWzeFkqp
	wVrMdtL0AJ0jQFKzaOJE5BjHk7+2y5EfQSOczc65f6DKJLgoplPbkK5EcMU3HILA
	BeVhLRw/KkIGwV2fSjOmpYKW5z8w5PtlSgo/7fHHdapDwuiUTD3KY6MRHxliBNSg
	IVi1ZMfxqpaCJd8nn64w+G4aje5nJvd1V9Niap0CG7rG1r/b8Y/ArBDPe0gzktLO
	ne4il0D9LZAzYUDfRqkW8p64RqCpINQFnEL3uU2XrF9eK5pfCGJ/ZLrCFYyiJgP+
	q3mSGw==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h41gn95a3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 05 Oct 2026 09:11:31 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-38dbf293831so2793829a91.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 05 Oct 2026 02:11:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791191491; x=1791796291; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=T9oxOuG7wNa3Rqa6hUzdfTKeLLzuEgWjUSJ0eKN2I8Q=;
        b=NLAR7/g7gqBkwWtcbTMPCUZ71tE2Ygc8n3l6CK1iU5f8aFYq4qGL9l6GICuv7chIjN
         4Jq8cbzlHCT2P7qXrIiip8469bPKCAAs+OWWHV2Ea1OM7RQOSA6JSzSHAjkKcbG3hmdE
         Hhm40AMIENpsm9r/Csqgr241Y55qvN/QDdodLaZg9TzHLXrluFUEjQkgvQQaoKmRdo0q
         Py0gT4DbZEeTpTKhp145nxavtpuNku3j52jVEnGc0mXKi1wIO6cBNFfpoeckzefiFOT3
         r1aPuq08foFuz4/OUSaX2NCoq9lmSdqCUTHW0LKadQbPLr4qwHSteRu4bf4eX5SNTqZJ
         rvjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791191491; x=1791796291;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=T9oxOuG7wNa3Rqa6hUzdfTKeLLzuEgWjUSJ0eKN2I8Q=;
        b=St8C47cEsUtv2die7lqpgUiouCgCf4uMROvtUi+OZCtsX6dShlvLFaGXUfB/B9vY8R
         ylth/p9axpeYIimOxrW2zuma9eHiLOecpFGopvlIUTtfGjcuyuYoEAjhc1y1qL+dODdK
         +ifk2JyTUM5iiRwl1HLELz+KNeqoLtWH2Lt2b9YHEP/oIrgVloqCuqI5pX8ALX2QkF21
         UWKtSCuughAQPoDA4E4IYvdjRRN2uzLKR29tUWW1zGLw0igaqh14cpgjAZMQaZtHGFy1
         4q2YJ1gLoTQbOsrLHq1ivsTPth8pUj2R2zYmHsyJmtxJrGLMIgk3bRu574tQRRnJ9K+v
         dYIQ==
X-Forwarded-Encrypted: i=1; AKwUvBzgYsFTkT1h0Hqt9GHWQhy4AKTm33mpy0iaxJs0KDJ+q6oU8JIRqQZY7iPw8h2gsPXmHEx9mWQ7YGEz6FJ5185p@lists.infradead.org
X-Gm-Message-State: AFq9FYLitOpGoNqIL2ZlBFE+NS7PaNWbv84dhVopAHkf9h9E1zrCojn4
	caexXQ1X1IcIAEzHtPMw7welHOEClsFUOUPDfx9w0IEafd79R3kbQ6QLsG/DeVY1fZNxXMwihQJ
	dkiDmm8vcHW2iF+As3M2WhPCyFNsOXD6swI7vD4VujdAvi8joOm109QK7onZp3SyMO6LrdPj7B4
	r1ZQ==
X-Gm-Gg: AYBFou2tl+4TJmyKzyId8dTzILXDsm1bqOVxyAZNztqcZfYO3+P/nUs18i2utTx7UhA
	ZkgAcf6S7GDcDzBFGW3Z53b4ZHSC0jbwePVM4Vvungc/MI2N6sluDC5LtRWHN//I5BfgUZyBC9V
	JP7jwKTowwwyKZzk+pRQz96Tqkn6lE+mRJk5YSMhwjEqjjuxeWpagiP8hDQY3CHv6ptV+jY5Kv1
	B13ggWhJ9kRSPygZC5HJ65BLufQRvFrXElSCnMpXDNdwtzGLiMNoSiSxr60tKzW47fevdyHClgf
	Ad9O0+OOBi4Zt+nLnSWbNraaJGA2SVYzAZ1Udz1kbr8kNK7AfMjL5Y6ZDW1uI6unjQYn68S6hih
	s6m3qIDifhu7cEuV9hSBgUFZm3DS+LrNObjoV1NuANZZRkjBFDEKEjyEoNMWtIWs+Pa46dQsUNy
	J2WoaIb2olcOZhJJLy
X-Received: by 2002:a17:90b:2791:b0:3a6:f90b:20ca with SMTP id 98e67ed59e1d1-3a787181deamr5551526a91.12.1791191491195;
        Mon, 05 Oct 2026 02:11:31 -0700 (PDT)
X-Received: by 2002:a17:90b:2791:b0:3a6:f90b:20ca with SMTP id 98e67ed59e1d1-3a787181deamr5551496a91.12.1791191490675;
        Mon, 05 Oct 2026 02:11:30 -0700 (PDT)
Received: from [10.50.19.182] (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a78d6b3ceasm10369860a91.10.2026.10.05.02.11.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 05 Oct 2026 02:11:30 -0700 (PDT)
Message-ID: <8d58dce8-36c2-4e03-b10e-0aac1466f848@oss.qualcomm.com>
Date: Mon, 5 Oct 2026 14:41:20 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v12 09/13] arm_mpam: propagate MSC access errors in
 mpam_reset_class_locked()
To: Andre Przywara <andre.przywara@arm.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        Hanjun Guo
 <guohanjun@huawei.com>,
        Sudeep Holla <sudeep.holla@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        "Rafael J . Wysocki" <rafael@kernel.org>, Len Brown <lenb@kernel.org>,
        James Morse <james.morse@arm.com>, Ben Horgan <ben.horgan@arm.com>,
        Reinette Chatre <reinette.chatre@intel.com>,
        Fenghua Yu <fenghuay@nvidia.com>
Cc: Jonathan Cameron <jic23@kernel.org>,
        Ganapatrao Kulkarni <ganapatrao.kulkarni@oss.qualcomm.com>,
        Trilok Soni <tsoni@quicinc.com>,
        Srinivas Ramana <sramana@qti.qualcomm.com>,
        Niyas Sait <niyas.sait@arm.com>, Lee Trager <lee@trager.us>,
        Ritwick Sharma <ritwick.sharma@arm.com>, Gavin Shan <gshan@redhat.com>,
        linux-acpi@vger.kernel.org--cc, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org
References: <20261001153439.3295416-1-andre.przywara@arm.com>
 <20261001153439.3295416-10-andre.przywara@arm.com>
Content-Language: en-US
From: Srivathsa L Rao <srivathsa.rao@oss.qualcomm.com>
In-Reply-To: <20261001153439.3295416-10-andre.przywara@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: IJMrtv0DUaOtMRm0VkYY806nkbha7VWL
X-Proofpoint-GUID: IJMrtv0DUaOtMRm0VkYY806nkbha7VWL
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA1MDAzNiBTYWx0ZWRfXw6AAr8guFV3p
 S8Nv9DrHlPvS0mwh2z6XGM7OlYmw2ERjwA5A2C5nEw3xwgi4Ul4hd3zOY0DeFsQRBFx6e08rDhb
 IBoJteir7Lu8PmLoEmaBuq069FMFJF/txhwp74yeLMDd2rDIIIjaBltJapn6PQk6MJIw2Brt/bA
 rGIkPPNLAv58AZRZ5z/8z6NcIx3/QcbLF/DiwZkpJbT+5X6PdoLjayHwFj3CsAq4jfriJHCE3FD
 26aLKDRa1LBjuog8hEQh3EIt0IUXv5Ahfn1wqu6svoeOQx6tdk/6kRyd0k5T/0f4DQ5nnTYxVfi
 58SQuuky82P7/nVIHMiIjd4sTxIGDf35VX+qt0tsIJUsXV9ZHCd0zvQzaaScgiUTCS9lRqhSFO6
 fpQ6OHMPSd3KL6RCTYwjJ/qtLUzv1qjL+NQ2mb3xPJboWCAFijSseOQTdRfHM79wKuQ/MOz23Jp
 5ojMDpjo2oLkR+/KdJA==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA1MDAzNiBTYWx0ZWRfX8SYNZFbPWFk7
 MYxlg4s5S4C61jwSo7Qo/q5bFHV0/Je06ES2QLwp7JpVtmdOacIZztnK4BoJMxSJ3/OYvENGeYE
 /ZI/PSluI6Osjx85U03dF+f/XMykaQc=
X-Authority-Analysis: v=2.4 cv=P9WvFSAu c=1 sm=1 tr=0 ts=6ac369c3 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=7CQSdrXTAAAA:8 a=EUspDBNiAAAA:8 a=7hQx6daNV2sWy6eBiVUA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-05_01,2026-10-02_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 clxscore=1015 spamscore=0 priorityscore=1501
 lowpriorityscore=0 adultscore=0 suspectscore=0 malwarescore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610050036
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261005_021132_805244_0D0005FE 
X-CRM114-Status: GOOD (  22.81  )
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

Hi Andre,

On 10/1/2026 9:04 PM, Andre Przywara wrote:
> The mpam_reset_ris() function can return an error, propagate this up
> through mpam_reset_component_locked() to mpam_reset_class_locked(),
> which is exported. The external caller is a void function, so cannot
> really handle the error at the moment, but at least we report everything
> on the MPAM interface side.
> 
> Signed-off-by: Andre Przywara <andre.przywara@arm.com>
> Reviewed-by: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>
> ---

Reviewed-by: Srivathsa L Rao <srivathsa.rao@oss.qualcomm.com>

Best Regards,
Srivathsa>   drivers/resctrl/mpam_devices.c  | 24 ++++++++++++++++++------
>   drivers/resctrl/mpam_internal.h |  2 +-
>   2 files changed, 19 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/resctrl/mpam_devices.c b/drivers/resctrl/mpam_devices.c
> index 60f6a39176ea1..c639aaa5f38e1 100644
> --- a/drivers/resctrl/mpam_devices.c
> +++ b/drivers/resctrl/mpam_devices.c
> @@ -3007,7 +3007,7 @@ static void mpam_enable_once(void)
>   	       mpam_partid_max + 1, mpam_pmg_max + 1);
>   }
>   
> -static void mpam_reset_component_locked(struct mpam_component *comp)
> +static int mpam_reset_component_locked(struct mpam_component *comp)
>   {
>   	struct mpam_vmsc *vmsc;
>   
> @@ -3021,26 +3021,38 @@ static void mpam_reset_component_locked(struct mpam_component *comp)
>   				 srcu_read_lock_held(&mpam_srcu)) {
>   		struct mpam_msc *msc = vmsc->msc;
>   		struct mpam_msc_ris *ris;
> +		int ret;
>   
>   		list_for_each_entry_srcu(ris, &vmsc->ris, vmsc_list,
>   					 srcu_read_lock_held(&mpam_srcu)) {
> -			if (!ris->in_reset_state)
> -				mpam_touch_msc(msc, mpam_reset_ris, ris);
> +			if (!ris->in_reset_state) {
> +				ret = mpam_touch_msc(msc, mpam_reset_ris, ris);
> +				if (ret)
> +					return ret;
> +			}
>   			ris->in_reset_state = true;
>   		}
>   	}
> +
> +	return 0;
>   }
>   
> -void mpam_reset_class_locked(struct mpam_class *class)
> +int mpam_reset_class_locked(struct mpam_class *class)
>   {
>   	struct mpam_component *comp;
> +	int ret;
>   
>   	lockdep_assert_cpus_held();
>   
>   	guard(srcu)(&mpam_srcu);
>   	list_for_each_entry_srcu(comp, &class->components, class_list,
> -				 srcu_read_lock_held(&mpam_srcu))
> -		mpam_reset_component_locked(comp);
> +				 srcu_read_lock_held(&mpam_srcu)) {
> +		ret = mpam_reset_component_locked(comp);
> +		if (ret)
> +			return ret;
> +	}
> +
> +	return 0;
>   }
>   
>   static void mpam_reset_class(struct mpam_class *class)
> diff --git a/drivers/resctrl/mpam_internal.h b/drivers/resctrl/mpam_internal.h
> index 68a6cf2b9cc73..09f8168fb4d2c 100644
> --- a/drivers/resctrl/mpam_internal.h
> +++ b/drivers/resctrl/mpam_internal.h
> @@ -465,7 +465,7 @@ void mpam_enable(struct work_struct *work);
>   void mpam_disable(struct work_struct *work);
>   
>   /* Reset all the RIS in a class under cpus_read_lock() */
> -void mpam_reset_class_locked(struct mpam_class *class);
> +int mpam_reset_class_locked(struct mpam_class *class);
>   
>   int mpam_apply_config(struct mpam_component *comp, u16 partid,
>   		      struct mpam_config *cfg);


