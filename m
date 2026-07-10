Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A23DC43458
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 10 Jul 2026 18:49:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0Ss9oAhVsJIGIgV741scL9PWQQaX3OT8OnIGzEUK6To=; b=LEmoxW/2f/+6bIZOkuOhQNpTUk
	AaZujcvwDSDjAEdTLa0+OqsGWYqB/T0mM7sBNqSkUj7KTyAfYQrPuus0Dj8p9yqYwEZ3EgFAt1P/t
	QSqPTmPc7jMqTvkSKf6e+9eL9ra+kDVXbg/djX8NdqMUrN0sw0ol+nLOGkxzYH8f6GKIMRh/Ee7Qk
	7YGX+yeNkt4jOiw+ZixX3eFvnth1Flk6LJhtJbKw50HX72Mjt3FBsq31ITDor9fWdBQbj0QosbNs4
	yi59AqFwEm0vhKYVfM8NBZ5F7MwDWyDIwpmAnR2PIOku13aKA6aJ0HIAeXSm5pKOCNNOo1r8bTsSr
	rrvlYC4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wiGHb-00000005Y0g-1s1K;
	Fri, 10 Jul 2026 18:49:07 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wiGHY-00000005Y03-1YJL
	for linux-arm-kernel@lists.infradead.org;
	Fri, 10 Jul 2026 18:49:05 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66AH5OHg1407742
	for <linux-arm-kernel@lists.infradead.org>; Fri, 10 Jul 2026 18:49:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0Ss9oAhVsJIGIgV741scL9PWQQaX3OT8OnIGzEUK6To=; b=KFStoFOEL5/meHet
	eMjesuOr55KGrdbwXnsmgYk2tN+eR2tLXO+SmKQpB06g1ee6iYOTIBqs3A+uLDKs
	jR07lo44K4lu7VO+3aqrg85AEsPsKk/Ob8Gn5M30ekwrN+l3sKqDvfywMvruzMTw
	oneSgcr0gy0xhw4p/CXGAAxJS/smftIXS6+NDo5H7qEEDg+LAHRcc6avMRpMzQ+d
	A0R3ErXvEvsDy9BYjA9o0bbKAXaNoPHe24ZmxlrXsgKnDz2ATA2aokUxOZlPO2G5
	cuw45vAO8HN4nj2BzemCi0VFTypfc2xKzHZayqgy3ZC9LYlDEH03AlJMoWDGIFkv
	LvPm9g==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fax5fa227-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 10 Jul 2026 18:49:03 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-38c7e26ecabso1166061a91.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 10 Jul 2026 11:49:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783709342; x=1784314142; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=0Ss9oAhVsJIGIgV741scL9PWQQaX3OT8OnIGzEUK6To=;
        b=hDR+wh62ZyB+spUs7hXe8JsGJ0WUdBnyyHIvZwa7UbjY/YdniXYSWtMc2bXOKi0ntc
         jIEz4RotfTlRZJtw2IVnmPqpNo5auL1LLNpGMj/hD82geNtorlUfV7sUAjJnYkZrIbuC
         CTU/9+5FkpKZDFoOJupquLAYBNpN3nCWeTOG6aGPV7nuUyoEi8n+J6uZy5LhHqlZilsi
         A4FUN1U7SoaSbAGEhwxp00pbZqn27HQo7BOPyllGwXs4RCcgbrj7vX+ODBoGewFs4H+Y
         i4gOGrGxofEIBqoIxEiRsVdC9dw7I4jx9f1cYZJQtXMY6O3bCEhdgDQaqNVS5J+iQ5ze
         a61w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783709342; x=1784314142;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0Ss9oAhVsJIGIgV741scL9PWQQaX3OT8OnIGzEUK6To=;
        b=Aqi7dD6uK4luCOdyn9ViwkpB53aUraVJLKRmm7PdUl3cMdnFC5b+HwZX/WwPxcPOKt
         K4bdDzZr3sLmGSkvlMoW+VtOJg8F0rGDOfCJ0W+nQynGgx7J8wSJsoiueUdMDxxHDtqr
         ST5ij51QAFgfHpfO6ckz8b9g6MACAQIseQplpLkEOFw83uGcuNjZ1WCbCNPpPZeqTLdW
         NwPPRnTVnUZZ9m+x6VrQz168xXgudzKtwbRZYTDIyWbpJySFSt0wM4or4lEte2B0MjXH
         gl/tvEykv9GM5NCYFME4G+sk74YQlK6aytOWFhWFvwhqLQ7XFLGrY20ou+zEnqNlieNz
         2H5A==
X-Forwarded-Encrypted: i=1; AHgh+RqwXw2WRX2zfQlxuyyi8sO4qONHu6RARXm89yqqUDxyw5M7nCPU5ROmdk1k3zDx9FoRLlE5PuqnsOqIeunInQjg@lists.infradead.org
X-Gm-Message-State: AOJu0Yw13DdcWDCJnyNI381ld8ZYLW4HDZNJG1ouw37SS1SWzYDZkZDo
	zS9TOVkGDw1WDudLoYxCcZE8HyhHK09famZJziJoyXCrNx9vlmqm0ASoveOciNLuEH2XokHt1Wf
	YSbFbjJKtjp3KRJAX5F+Q+kNTPTf5UbTLbs49tUvW1A8tyN26kE92pZKeO+h2FDdNpgJBPOkF8g
	Aoow==
X-Gm-Gg: AfdE7cl+qYZlxlV4/jnJTgilbA6a2DgFyHutD7BpEsYqsCXnCKJvjSBdWFBACacCRDU
	nPt9KncQcpIlnyUm+0AAhBU2sM50Pta+L6WOFdD/mAYHW+oysVcvG2j0NFeSf/S5LGNm9JM3YU4
	ohcIaQvIJmt4lvbPIvGPep9E2XFKosf75XV4wuVdXV8cLUB7JsxhqRScZwL+Kph7mmdffhlcPVo
	5ENdNJfmnO6jz+y1QI0kKVoSP7Su0Q3q1u4KcQKn+tZ/4xdwYjix3ze6tz3maLfTd7/bH/oLQDg
	o3XAezJvW+hSqN7FGcsjf+EnejfTNHJob7qYJKNmIQqjmzJB8+xMhkTvQoytjpBW52VEMFglWGi
	t0Z63BwucoacieKG0cX20OZ3MMsQ06sqK8h2M
X-Received: by 2002:a17:90b:2e8f:b0:380:8b14:d8e1 with SMTP id 98e67ed59e1d1-38dc7b3f8ccmr143461a91.24.1783709342102;
        Fri, 10 Jul 2026 11:49:02 -0700 (PDT)
X-Received: by 2002:a17:90b:2e8f:b0:380:8b14:d8e1 with SMTP id 98e67ed59e1d1-38dc7b3f8ccmr143416a91.24.1783709341636;
        Fri, 10 Jul 2026 11:49:01 -0700 (PDT)
Received: from localhost ([50.35.46.84])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31174839f89sm43384913eec.10.2026.07.10.11.48.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jul 2026 11:49:01 -0700 (PDT)
Date: Fri, 10 Jul 2026 11:48:56 -0700
From: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>
To: Andre Przywara <andre.przywara@arm.com>
Cc: Lorenzo Pieralisi <lpieralisi@kernel.org>,
        Hanjun Guo
 <guohanjun@huawei.com>,
        Sudeep Holla <sudeep.holla@kernel.org>,
        Catalin
 Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        "Rafael J
 . Wysocki" <rafael@kernel.org>, Len Brown <lenb@kernel.org>,
        James Morse
 <james.morse@arm.com>, Ben Horgan <ben.horgan@arm.com>,
        Reinette Chatre
 <reinette.chatre@intel.com>,
        Fenghua Yu <fenghuay@nvidia.com>, Jonathan
 Cameron <jic23@kernel.org>,
        Srivathsa L Rao
 <srivathsa.rao@oss.qualcomm.com>,
        Ganapatrao Kulkarni
 <ganapatrao.kulkarni@oss.qualcomm.com>,
        Trilok Soni <tsoni@quicinc.com>,
        Srinivas Ramana <sramana@qti.qualcomm.com>,
        Niyas Sait
 <niyas.sait@arm.com>, linux-acpi@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 06/16] arm_mpam: propagate MSC read errors for
 __ris_msmon_read()
Message-ID: <20260710114856.00000ab5@oss.qualcomm.com>
In-Reply-To: <20260710144520.917375-7-andre.przywara@arm.com>
References: <20260710144520.917375-1-andre.przywara@arm.com>
	<20260710144520.917375-7-andre.przywara@arm.com>
Organization: Qualcomm
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.51; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=Ab2B2XXG c=1 sm=1 tr=0 ts=6a513e9f cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=qC1CW/w66vtJz1P9yTJxNA==:17
 a=kj9zAlcOel0A:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=7CQSdrXTAAAA:8 a=P_KzPmMKhQUQMaRR1ykA:9 a=CjuIK1q_8ugA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-ORIG-GUID: ZklO2WVs5KM66d8QBMJhAa38aPjj7_a0
X-Proofpoint-GUID: ZklO2WVs5KM66d8QBMJhAa38aPjj7_a0
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEwMDE4OSBTYWx0ZWRfX5NVxquura5gK
 D2XoXIUI8vT5q9tey61zqLZIwDK0Bjye7NKd8PwkheUTVeewVwqYDgZfjeuF5Pz/WlDV+n0V/ia
 /cKpwVrRd5Hn41qieceUDDhTvPLCFRw=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEwMDE4OSBTYWx0ZWRfX5XOYMHKiISIK
 0hcpM+IPBvxeZgPyKOCa+crC8MfE3NshTo41k5tdAgIEhOvZTUKkdIA1qDovnx11PRtsRBAWyLF
 lYDBpCLnZbudd06qYO/bUKNEX8G44/P0I/0x+z/YMbt0LDeTbF4LXHqlkYBo7vdbZy7qhuQfPrG
 vjjh/C9bLrTN6TjYSrCx4IwdlWhMlEp4r9jE28tvMLG5Zu6NGw+kT+d56ZSJeIt2ZNQKQ7mLft5
 N2tT8ELsSZYF867+HpsCRejJFA9hbV208PUQrHKL/Xq7R3oSbP8rfGbEyOmmiq4/jMMjKwU9brN
 XkeneBJP106LZshBFtZfHuqh1XP50zmaoOeat1Da+rHGIIUzGYJL/GEa/93xwj8TA1RHaf3nx5M
 ld70HrXToC3jmDFPagpGV2wz5qQPD5mLDTvXNob0gPLly7N3tmhY4ZiTw+a2tsNKUL8Q5eL9Xge
 okb53V853OAt6uhX2Eg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-10_05,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 malwarescore=0 phishscore=0 bulkscore=0
 suspectscore=0 impostorscore=0 lowpriorityscore=0 priorityscore=1501
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607100189
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260710_114904_529222_8D406030 
X-CRM114-Status: GOOD (  28.92  )
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

On Fri, 10 Jul 2026 16:45:10 +0200
Andre Przywara <andre.przywara@arm.com> wrote:

> Allow the function for RIS accesses to return an error, and propagate
> read errors from the lower level up.
> 
> Signed-off-by: Andre Przywara <andre.przywara@arm.com>
> ---
>  drivers/resctrl/mpam_devices.c | 23 +++++++++++++++++++----
>  1 file changed, 19 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/resctrl/mpam_devices.c b/drivers/resctrl/mpam_devices.c
> index 041fca018e68..84a8715464be 100644
> --- a/drivers/resctrl/mpam_devices.c
> +++ b/drivers/resctrl/mpam_devices.c
> @@ -1297,6 +1297,10 @@ static u64 mpam_msmon_overflow_val(enum mpam_device_features type,
>  	return overflow_val;
>  }
>  
> +/*
> + * This function might be called via smp_call_function_any(), so propagate
> + * errors inside the arg struct.
> + */
>  static void __ris_msmon_read(void *arg)
>  {
>  	u64 now;

Similar comments on ACQUIRE() making things easier here.
Note I'd introduce it as a trivial precursor patch before the rest of
this rework.


> @@ -1339,7 +1343,9 @@ static void __ris_msmon_read(void *arg)
>  	 * Read the existing configuration to avoid re-writing the same values.
>  	 * This saves waiting for 'nrdy' on subsequent reads.
>  	 */
> -	read_msmon_ctl_flt_vals(m, &cur_ctl, &cur_flt);
> +	ret = read_msmon_ctl_flt_vals(m, &cur_ctl, &cur_flt);
> +	if (ret)
> +		goto out_unlock;
>  
>  	if (mpam_feat_msmon_mbwu_31counter == m->type)
>  		overflow = cur_ctl & MSMON_CFG_x_CTL_OFLOW_STATUS;
> @@ -1364,7 +1370,9 @@ static void __ris_msmon_read(void *arg)
>  
>  	switch (m->type) {
>  	case mpam_feat_msmon_csu:
> -		mpam_read_monsel_reg(msc, CSU, &now32);
> +		ret = mpam_read_monsel_reg(msc, CSU, &now32);
> +		if (ret)
> +			goto out_unlock;
>  		nrdy = now32 & MSMON___NRDY;
>  		now = FIELD_GET(MSMON___VALUE, now32);
>  
> @@ -1385,7 +1393,9 @@ static void __ris_msmon_read(void *arg)
>  			else
>  				now = FIELD_GET(MSMON___L_VALUE, now);
>  		} else {
> -			mpam_read_monsel_reg(msc, MBWU, &now32);
> +			ret = mpam_read_monsel_reg(msc, MBWU, &now32);
> +			if (ret)
> +				goto out_unlock;
>  			nrdy = now32 & MSMON___NRDY;
>  			now = FIELD_GET(MSMON___VALUE, now32);
>  		}
> @@ -1748,6 +1758,7 @@ static int mpam_restore_mbwu_state(void *_ris)
>  {
>  	int i;
>  	u64 val;
> +	int ret = 0;
>  	struct mon_read mwbu_arg;
>  	struct mpam_msc_ris *ris = _ris;
>  	struct mpam_class *class = ris->vmsc->comp->class;
> @@ -1760,10 +1771,14 @@ static int mpam_restore_mbwu_state(void *_ris)
>  			mwbu_arg.val = &val;
>  
>  			__ris_msmon_read(&mwbu_arg);
> +			if (mwbu_arg.err) {
> +				ret = mwbu_arg.err;
return here.  It's consistent with some of the existing code and
general makes things more readable.

Obviously ignore any comments like this if they are about code
which will change later making the comment wrong!

> +				break;
> +			}
>  		}
>  	}
>  
> -	return 0;
> +	return ret;
>  }
>  
>  /* Call with MSC cfg_lock held */


