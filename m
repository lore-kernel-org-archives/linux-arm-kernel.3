Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26850C43458
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 10 Jul 2026 19:01:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YUtnHG+BK9mkHTRK8KTulqBVc1mAgv0yZV42NgWuxko=; b=oAzDclszXEJRY4y7yfGrkFEa7O
	+rGseaOam8pDw3ZwFhCBazfO7CYNv7oIUj1Gjprjkux3w9yVLfdLP9IMUTOxpB7JAVz1HWmaznQMS
	2uKUrfdeTVTT6JVxPpmP8fb6qLGq3RgMMcUYkWIRQ864bFby6U73gADGrV1OZ6PM3y09qPya2V87t
	eDkPVme/gXVrrYZBtz8hLgcK3JmNXnb6KfWGeBE5UEJ1w2RisnBIo8AFaIKtuqT1P/xNLGt6bKqpl
	TZ48OWEa5L0aPquW4Nz8x9iCh/uhgvVwceWmN1Ahszy1HXNJ/O4Z+ANyhd/9VZiEsC07VQalvgmWz
	pOpdegPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wiGTA-00000005ZIN-0GKe;
	Fri, 10 Jul 2026 19:01:04 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wiGT6-00000005ZHy-44uQ
	for linux-arm-kernel@lists.infradead.org;
	Fri, 10 Jul 2026 19:01:02 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66AH3g7n1443830
	for <linux-arm-kernel@lists.infradead.org>; Fri, 10 Jul 2026 19:01:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	YUtnHG+BK9mkHTRK8KTulqBVc1mAgv0yZV42NgWuxko=; b=a4Su2zZcxKIbqtgu
	aVHcnGkUDhSYar4MzEDxWyLSpS4NWE2+g19EsgwmsWhLsUSsL7m32MHRiPAu2D4T
	sh86omXAqfp2ygLRoPNKcshw78PRkN3VggrXmpCky4LK2DvWKMrOtO57bKf3yy5C
	P4JHRNYGir07WoH8+7K8jNhorx/pZg9tn8O/onZuUmwfMyvFAOY9CkdEwpNL97mm
	FjkO3f1OKUSSN1p/04dREr4xSSsn0RjJhOD6QtRy4RDn10EdfAR8zdpAsCLMK/6T
	lc7X9nPNe15L572kbznEUYbeJ/MKziD+v0xpbtaFEvhFJVAE69rs0AXF811cECa1
	hOp/yA==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fanwebycq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 10 Jul 2026 19:01:00 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-380a638fb5bso1478155a91.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 10 Jul 2026 12:01:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783710060; x=1784314860; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=YUtnHG+BK9mkHTRK8KTulqBVc1mAgv0yZV42NgWuxko=;
        b=hguVSHLlyZrsIgKw9dBtxQ09icRsQI/Tjo0UdiHMY9zNmTKpcwEl+LWy2jRbmLAYxe
         10wn4GNlOx076Qj/fHmWCMf+a3xhfm+UpeSVBqf9eBFpmejOZx//y/qsLR7pF9kNbdXc
         gnR36daEmRub1ydYc78/u5Q/PwDcku1r5rz8yUolN/Z0XvLCemeyt9+U0FZGcSqRkdGX
         1VRRXt5J06xAPuweIZTOjWr8y2m4MZWeqyXZle4uDr9FwTqO+vZrMpiJG7thI+9rfa05
         TRm4t7lcKxHZxYf7b2F1usxeioZRRvvmCjqfyPnJ4UR1+fL7FsD0Mad7YEW8CHy5RNj2
         iM2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783710060; x=1784314860;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YUtnHG+BK9mkHTRK8KTulqBVc1mAgv0yZV42NgWuxko=;
        b=GeQHzy7/ieDOhcT+CJ6ENX6GsklIQNpnxLN3RLLaamdAwa9Fonjx5wVKRqQ/FVdOa4
         7lWLaoz/HdUetMQoiA53K2OEkTrCAli4gutv96/4rOq+kHh0zuBxUvwVw+F/1jujqFe3
         CIG9GA8tAwGZLaXWsre8D7a7xhGfDvmL1FgXGS36GIZtqROiC4ts1hu1kDUt0/FOnyGe
         hyWOf+PTEBnJCKoy9HriBk9+LEVH/IsPt6Gx9+hp4VFBjLjcEBJIlsnB6gPdY5UQPW2W
         vv0mzGsN8ZP9UrjRvTugcJ3yZvP/x0MdthvsQfJVh95hrLFUyTvslu0Sc7rsH4nW+hTJ
         +q+Q==
X-Forwarded-Encrypted: i=1; AHgh+RpJf5RE4x3EsvDbJMVUr1ODai9jL8UdNSklNOGPGQUXnmpVYco1aGGRPIJFAOaXAmT7QgHuZjQaL3DBZ44AmgqE@lists.infradead.org
X-Gm-Message-State: AOJu0YzkF71y/qGzHgMn9PWQdQuAFjx2ZOU2Y1JjD+eXagyEGV18dCmm
	PqKg4NnHykNWWK7IQVgjFM9DEnwNnlv7Z7WS+Oyypd+8xjdFBJCPk4yFg0PKyJxDTco5iad47o1
	ugu4GvPjh5nFF554+WIZu7IZTOURA9TSDHjjXdKSZLL1wBDrWolvGO512fWvwf5h11lET3KBLcY
	3kvw==
X-Gm-Gg: AfdE7ckQ68lTx7Ts8c8rP8dGrK4nEpHfEzK+IA3jZhqg+FJ/avU5zVDevaaYZiBa17/
	VUZuNbXOhf1W6zAJrfLCFprto+CT3cF7nSLm23xlFHxGK0LIo1jbO4mdNUsKuCQFeg96S1lGPHM
	Ocis8mklOp81fGLf1Js29d+KSkjQYnza/KX4KOsZNks/2uoVxp2ty74D1NwD0ibtP0ChmUy88+8
	oAVdi1heHqx9ASU/uI6kcQb2VsnWqDCtHeR2FeUfL0MkSw1k84BZUi5dRVGMP6dkZoTvMIlbrAP
	nNkjrJH65lukLO1Y/WyRu6zAIKRDeUfULkl+Esv7w2waXSdl87UH7vCKuC99CJdXDQAUIKYWk7d
	yUNBvukSS2/SeKArAmbx8WiSUaBLoOSulqxvh
X-Received: by 2002:a17:90b:1b06:b0:381:dd0:94e6 with SMTP id 98e67ed59e1d1-38dc7777d42mr196169a91.22.1783710059580;
        Fri, 10 Jul 2026 12:00:59 -0700 (PDT)
X-Received: by 2002:a17:90b:1b06:b0:381:dd0:94e6 with SMTP id 98e67ed59e1d1-38dc7777d42mr196123a91.22.1783710059153;
        Fri, 10 Jul 2026 12:00:59 -0700 (PDT)
Received: from localhost ([50.35.46.84])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3117483dec6sm44214111eec.11.2026.07.10.12.00.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jul 2026 12:00:58 -0700 (PDT)
Date: Fri, 10 Jul 2026 12:00:54 -0700
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
Subject: Re: [PATCH v3 08/16] arm_mpam: propagate MSC read errors for state
 saving functions
Message-ID: <20260710120054.000035dc@oss.qualcomm.com>
In-Reply-To: <20260710144520.917375-9-andre.przywara@arm.com>
References: <20260710144520.917375-1-andre.przywara@arm.com>
	<20260710144520.917375-9-andre.przywara@arm.com>
Organization: Qualcomm
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.51; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=LbIMLDfi c=1 sm=1 tr=0 ts=6a51416c cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=qC1CW/w66vtJz1P9yTJxNA==:17
 a=kj9zAlcOel0A:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=7CQSdrXTAAAA:8 a=rMF2o8FrK2TGcKdZMuAA:9 a=CjuIK1q_8ugA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEwMDE5MCBTYWx0ZWRfX3hs2YdBxx3Bl
 jA4DXMWf4MahwaHW9p8hTisgc+UoRV+UVAmu1QaTtHZ+Aiwc38rE01V7tjsplucLkB3upu6+Et2
 p6hBEsN/lJv8q2eEav2yafLBuCHLkT8PJuNJxXPyMWJmblLBnPhbvXcwx/5AWyCVZ7C7dxALnEa
 LCu3t2VZoGIdnNEtk9O/nYiA7QyMT7i3ZpJJO1LZuSAJcoPi1Y/kVB0dEj8zr+OY1SYHVBBG9L6
 JEJM+jy1kpZkD9lDvyojX1LepXvL7NP18n4ge/PpxOtfs4p/9krBPFSLt3bsXz8sKj9HJjAbb7g
 fB/AAcHl3B4CIcjptqglCAMesEcWX+74UCljUk/WNNdl7c/o7+8bpP/ruihNvWHUJGYWPhmpsYc
 NGgtJ+vDfGFxgzcEJlZOA8Lc8voiOfxxlyCvInvc4foMOFnO4uYJ3d7mGRqDgmE7IJENgmC2uDK
 VmjdrsEGJmeWndJdO9Q==
X-Proofpoint-ORIG-GUID: zhrQz2hAUuDUWWHJgakA_IQ4hBGTnX7O
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEwMDE5MCBTYWx0ZWRfXwW2jFvMJVWlr
 J30I89SOV2fotUOqq4PX/X09463F+wZ55ITaE5ypWbsXjdGJgycdK6BZrcDkwvxMNZXR2jKxbk8
 eICDCeEql96s2Hey8nyufAmUXvRjiyE=
X-Proofpoint-GUID: zhrQz2hAUuDUWWHJgakA_IQ4hBGTnX7O
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-10_05,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 suspectscore=0 lowpriorityscore=0 bulkscore=0
 clxscore=1015 impostorscore=0 priorityscore=1501 phishscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607100190
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260710_120101_021100_C93054F1 
X-CRM114-Status: GOOD (  25.39  )
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

On Fri, 10 Jul 2026 16:45:12 +0200
Andre Przywara <andre.przywara@arm.com> wrote:

> Allow the mpam_save_mbwu_state() function to return an error, and
> propagate read errors from the lower level up.

I'm not following why propagating errors is related to the
if (val != MSMON___L_NRDY)
as nothing in this patch is changing val.

> 
> Signed-off-by: Andre Przywara <andre.przywara@arm.com>
> ---
>  drivers/resctrl/mpam_devices.c | 30 +++++++++++++++++++-----------
>  1 file changed, 19 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/resctrl/mpam_devices.c b/drivers/resctrl/mpam_devices.c
> index 530ac0fe97b5..b2ecaba29fcc 100644
> --- a/drivers/resctrl/mpam_devices.c
> +++ b/drivers/resctrl/mpam_devices.c
> @@ -1782,7 +1782,7 @@ static int mpam_save_mbwu_state(void *arg)
>  {
>  	int i;
>  	u64 val;
> -	int ret = 0;
> +	int ret;
>  	struct mon_cfg *cfg;
>  	u32 cur_flt, cur_ctl, mon_sel;
>  	struct mpam_msc_ris *ris = arg;
> @@ -1799,8 +1799,12 @@ static int mpam_save_mbwu_state(void *arg)
>  		mon_sel = FIELD_PREP(MSMON_CFG_MON_SEL_MON_SEL, i) |
>  			  FIELD_PREP(MSMON_CFG_MON_SEL_RIS, ris->ris_idx);
>  		mpam_write_monsel_reg(msc, CFG_MON_SEL, mon_sel);
> -		mpam_read_monsel_reg(msc, CFG_MBWU_FLT, &cur_flt);
> -		mpam_read_monsel_reg(msc, CFG_MBWU_CTL, &cur_ctl);
> +		ret = mpam_read_monsel_reg(msc, CFG_MBWU_FLT, &cur_flt);
> +		if (ret)
> +			goto out_unlock;
> +		ret = mpam_read_monsel_reg(msc, CFG_MBWU_CTL, &cur_ctl);
> +		if (ret)
> +			goto out_unlock;
>  		mpam_write_monsel_reg(msc, CFG_MBWU_CTL, 0);
>  
>  		if (mpam_ris_has_mbwu_long_counter(ris)) {
> @@ -1811,20 +1815,24 @@ static int mpam_save_mbwu_state(void *arg)
>  		} else {
>  			u32 val32;
>  
> -			mpam_read_monsel_reg(msc, MBWU, &val32);
> +			ret = mpam_read_monsel_reg(msc, MBWU, &val32);
> +			if (ret)
> +				goto out_unlock;
> +
>  			val = val32;
>  			mpam_write_monsel_reg(msc, MBWU, 0);
>  		}
>  
> -		cfg->mon = i;
> -		cfg->pmg = FIELD_GET(MSMON_CFG_x_FLT_PMG, cur_flt);
> -		cfg->match_pmg = FIELD_GET(MSMON_CFG_x_CTL_MATCH_PMG, cur_ctl);
> -		cfg->partid = FIELD_GET(MSMON_CFG_x_FLT_PARTID, cur_flt);
> -		mbwu_state->correction += val;
> -		mbwu_state->enabled = FIELD_GET(MSMON_CFG_x_CTL_EN, cur_ctl);
> +		if (val != MSMON___L_NRDY) {

with ACQUIRE() you can just do
		if (val == MS_MON__L_NRDY)
			return;

and leave the rest where it was.
However I don't actually see what this has to do wiht the main purpose of the
patch to propagate errors. Perhaps a bit more detail in the commit message.

Thanks,

Jonathan


> +			cfg->mon = i;
> +			cfg->pmg = FIELD_GET(MSMON_CFG_x_FLT_PMG, cur_flt);
> +			cfg->match_pmg = FIELD_GET(MSMON_CFG_x_CTL_MATCH_PMG, cur_ctl);
> +			cfg->partid = FIELD_GET(MSMON_CFG_x_FLT_PARTID, cur_flt);
> +			mbwu_state->correction += val;
> +			mbwu_state->enabled = FIELD_GET(MSMON_CFG_x_CTL_EN, cur_ctl);
> +		}
>  		mpam_mon_sel_unlock(msc);
>  	}
> -
>  	return 0;
>  
>  out_unlock:


