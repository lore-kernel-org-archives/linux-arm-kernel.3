Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4AD4AC44501
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 10 Jul 2026 18:45:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=z+OQYxq6XVFtfTI3prmJj4k7rM7HASfxezwfOnaXnKk=; b=pfB1kBTvJRZBxein7cvmGZoTrl
	fHpnyOFCnaGWrvFj1Kb0kFdgAQnwPaX0WDGgzsuLl9QD2/3RxhrNCquML6mUACmvRQP6OOQAZ8otg
	ZmK0Xvbow6HD7A1k6yUlkqkTB/pPCM0SADgLjUqnXuqmfCQbIagqfH6S0BonwV7AtNjDdBCymvzOg
	kOlZ2OSvOxxwR7ilJ9+UqoO0QvefNxN58Tz26pr3suzIcaqCLzmf5oP6t14trRq7cSnPkUbmyl3eW
	xL7Wry3lubTkjKucKe/O4NAa4MOtuQvNYsvFd+QSqQQioJkCxAfwLMTw6bLCT6H88RZIrBAXSO9f1
	6EfgKp2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wiGDe-00000005XUT-3l9T;
	Fri, 10 Jul 2026 18:45:02 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wiGDc-00000005XTe-3BSh
	for linux-arm-kernel@lists.infradead.org;
	Fri, 10 Jul 2026 18:45:01 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66AH3Xhx1502022
	for <linux-arm-kernel@lists.infradead.org>; Fri, 10 Jul 2026 18:45:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	z+OQYxq6XVFtfTI3prmJj4k7rM7HASfxezwfOnaXnKk=; b=BXWcv9yQghXGUJfj
	LUV2tpUDR3QUfh2xA1u1WPeXoFSPEAHPahLalkdhVL3d0T/nf35q6NIrDiVpF/Io
	BghSi5DR4tY8YZpn0rRG+fRhvlegUAnjnxalh9gb+Tq4zgQKbfGNs0/EB1RqwsaU
	htbPGrxuKYcwEcRgx1jDHeeZ1cSMlGU1uoLx3w6iuMFLqRmCtoKKKl2V1qD6fUCB
	pORU+v2AjJridYsot+TVZgFFIyr9Zk367qi57IaZvC5oy0UZQVB8DjX4lrLfjbET
	VxGcVM+il5+j+IvoiUtxfXnQe8RbhNwmSMd+Y15LCQa4ewlu6719sUrfmooLaUKU
	7yyVxw==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fb3xvrj8c-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 10 Jul 2026 18:45:00 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-c860544c077so76324a12.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 10 Jul 2026 11:45:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783709099; x=1784313899; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=z+OQYxq6XVFtfTI3prmJj4k7rM7HASfxezwfOnaXnKk=;
        b=C4PySy2aXte+/ynRcqpkNV27rETheB0cxYQk0ACS0XP4SIZvIIBGy98kC4a71Y5b3d
         wwRUbdrpy1RL6LzucdLvDHq9TG0B0GSAGUR9YaLl8wLMgC4J8nDy0u8YbVNPtAONxaX7
         cCicLwqCwma0qNqfmwmg7Tiu94OkMW1ahAx54A+OZJemeAJkQgWqFM4kvKATCyaco3aS
         l0dETWI3XzwYdzcDaL9GsKmpz4HOThYE1zDbPrKsTbMH16eRcRg+1ed0o5nIzpG6MiMK
         c4ZGf9Qd1+Ww2S/rGQu/cdyhS7Pnrjy0iYLXvNjDHEyG9ZSkeB/jpELLL/YkbxgvUMiB
         sCdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783709099; x=1784313899;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=z+OQYxq6XVFtfTI3prmJj4k7rM7HASfxezwfOnaXnKk=;
        b=dlhJTcHnFrmekg1pOjH7pVOEgooApZDpYXg0yWAM9s3S7KH4nBA/rWKKyw05sAB0F8
         dEiu0y6Xg46Hj+Zm4MUcKJtzzXVqGnbUjkJRDCqRpUHdE17winNQQIT+yf/qBapDi0Ay
         9F8xo64SyqFcAoT606eE8GH9nG68wsoToDJf2IlBLuokQ8ZC7LatCKCAfFHVZQOjN4i+
         uJZXHBJB+AoGleMTsQ/n3f5MbmW8kDH7Vm7COG1LAPGWcoQ77XFrR58veiIxAvY7M0hE
         9c5mDOAjDAavY3KerzS3+Up+KCyWpqfE4TuSalkj4BHJePTrgL3dHMMohjH5fJEKopoi
         ZhXQ==
X-Forwarded-Encrypted: i=1; AHgh+Rqs762wWyI6soY0DjtnP+dCvRco3NV8BOcudNa2X4QLISMmnEZLiX7Mum4a6b9oXZNsK3PWW4o7nk5O+s0NlgNV@lists.infradead.org
X-Gm-Message-State: AOJu0YzoziqI9q8Vt09JeFDPTlOpaE9VAyPzbNsKCcNb20P8iW2R1Esa
	7s13YclRLPDMnm3mYY9ET9c4uoH7TdUGBfs7svwSQZXp/dNLiGlNhCZinG0VT3ZQ406BeoRDuxG
	ykcflblxfU8WEVdPD/qIXPlQMbr4rh9lsWyZVbxm5yaexcrQHBoBDG74A4v0ufNfQQ+FASasRnw
	btDQ==
X-Gm-Gg: AfdE7ckzAJ2NFyDDg350nQtnlKCSdWra4YlZiJjG8iaQK+IWwjzMl5A2Svu+mEVcpcd
	/iYFv0p0/fR0/SBr8oNHQ169de5caoV25pIg0rcZkAHRNWDYUCFYTsDRZCvCe1xPetARh+GjRJ3
	enn7SftZSdMo/G4eAjTUC2Glv4E8ouk8NejDUD6vY+ebAGZPhHfxLi2hhbmZBkVP/oh1oMuJP9C
	AoA/NjheJAUu1LRcUJWbda/4RGL/PCj7mEA57QnMeePWL6Iat6bR6LyzUkYCXQV93JR87oYMYwZ
	8byYFNUfFDUPTN5bXzBHKMx7cp8uDEbrVzDceamvrIgJX6RcdcpgJQ6GNGsVtsMpi73Twki37kt
	rVsEU3WwqldQkwWhR+ZM3yOjiE6TCXeGbKpTT
X-Received: by 2002:a05:6a20:3d0c:b0:3c0:9c1b:d0be with SMTP id adf61e73a8af0-3c110a24bb4mr244263637.73.1783709099606;
        Fri, 10 Jul 2026 11:44:59 -0700 (PDT)
X-Received: by 2002:a05:6a20:3d0c:b0:3c0:9c1b:d0be with SMTP id adf61e73a8af0-3c110a24bb4mr244236637.73.1783709099235;
        Fri, 10 Jul 2026 11:44:59 -0700 (PDT)
Received: from localhost ([50.35.46.84])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31189cd8234sm33343564eec.9.2026.07.10.11.44.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jul 2026 11:44:58 -0700 (PDT)
Date: Fri, 10 Jul 2026 11:44:54 -0700
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
Subject: Re: [PATCH v3 05/16] arm_mpam: propagate MSC read errors for msmon
 helpers
Message-ID: <20260710114454.00003aa9@oss.qualcomm.com>
In-Reply-To: <20260710144520.917375-6-andre.przywara@arm.com>
References: <20260710144520.917375-1-andre.przywara@arm.com>
	<20260710144520.917375-6-andre.przywara@arm.com>
Organization: Qualcomm
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.51; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: WjwC3ihZFKwYbbI0LzMqGA3BL0ueBY-Q
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEwMDE4OCBTYWx0ZWRfX8YAC3Iv/pBc9
 E2tIt1AP3Z+RC/UOBmpRNKsZM/vPOWxIoVRaCbQBjUjycRJBHQII4g2gHYLYJ5IobgOBTpljvyL
 mlfxQZygZYhCUweReB5m/ywGEeldJ59ZGVd+nGgberhdnp7bnbzV54yakMnjIy/5ZgXU94GGFUx
 3c/8vffepv4clbcjoyF4FXxsTVfj0HWEwDjhLx7VnvipAF9yWz1p2D1i6V6ylW7WCuucC3//Vp7
 uuGt0bf7VbZCmIH57t0eKj16NtaAPvUFKr00dejDzQEXZw8Ui+ATbcipXkgCplCpmvTTATF60fa
 T2FCq9eHJhVgYhPW/Xkro7/E1vycdaeLnMzDyY7YPhNCFAGQSEWJMaMLywpAs7zt3HbBLzZHA0v
 +bpTS6sOusBq3IaLvy0rqkysHlysI4k1EnVThe2MmK+AF7SkkawPbeWSiPOte5vow1+vWeG7MdD
 TWx65SQi86fO/CqdaOw==
X-Proofpoint-GUID: WjwC3ihZFKwYbbI0LzMqGA3BL0ueBY-Q
X-Authority-Analysis: v=2.4 cv=HInz0Itv c=1 sm=1 tr=0 ts=6a513dac cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=qC1CW/w66vtJz1P9yTJxNA==:17
 a=kj9zAlcOel0A:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=7CQSdrXTAAAA:8 a=gC5c3gsx8QPM0zVGbwkA:9 a=CjuIK1q_8ugA:10
 a=3WC7DwWrALyhR5TkjVHa:22 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEwMDE4OCBTYWx0ZWRfX61u84o41JPcT
 aBDGNy+GXbOJAiDaY1qYZNJCETAYhrp5QTVc6p/DTlZzx+rTFaicvAlPLZ4nRJJRxKpnimHuFWR
 dxfWjbLvAQaNpMttrWwwu493Ewlq6Hc=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-10_05,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 malwarescore=0 impostorscore=0 suspectscore=0 lowpriorityscore=0
 bulkscore=0 phishscore=0 clxscore=1015 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607100188
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260710_114500_812351_6C7141E1 
X-CRM114-Status: GOOD (  23.84  )
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

On Fri, 10 Jul 2026 16:45:09 +0200
Andre Przywara <andre.przywara@arm.com> wrote:

> Allow the helper functions for msmon accesses to return an error, and
> propagate read errors from the lower level up.
> 
> Signed-off-by: Andre Przywara <andre.przywara@arm.com>
Hi Andre,

Trivial style suggestions.  I'm fussy - I read a lot of code ;)

Jonathan

> ---
>  drivers/resctrl/mpam_devices.c | 18 ++++++++++++------
>  1 file changed, 12 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/resctrl/mpam_devices.c b/drivers/resctrl/mpam_devices.c
> index 3b6f9e552a9f..041fca018e68 100644
> --- a/drivers/resctrl/mpam_devices.c
> +++ b/drivers/resctrl/mpam_devices.c
> @@ -1201,25 +1201,31 @@ static void gen_msmon_ctl_flt_vals(struct mon_read *m, u32 *ctl_val,
>  	}
>  }
>  
> -static void read_msmon_ctl_flt_vals(struct mon_read *m, u32 *ctl_val,
> -				    u32 *flt_val)
> +static int read_msmon_ctl_flt_vals(struct mon_read *m, u32 *ctl_val,
> +				   u32 *flt_val)
>  {
>  	struct mpam_msc *msc = m->ris->vmsc->msc;
> +	int ret;
>  
>  	switch (m->type) {
>  	case mpam_feat_msmon_csu:
> -		mpam_read_monsel_reg(msc, CFG_CSU_CTL, ctl_val);
> -		mpam_read_monsel_reg(msc, CFG_CSU_FLT, flt_val);
> +		ret = mpam_read_monsel_reg(msc, CFG_CSU_CTL, ctl_val);
> +		if (!ret)
> +			ret = mpam_read_monsel_reg(msc, CFG_CSU_FLT, flt_val);
Burn a few lines to make this flow absolutely standard with errors as
the out of line sections.  Obviously it is a minor thing but the more
standard code is, the easier it is to review,

		ret = mpam_read_monsel_reg(msc, CFG_CSU_CTL, ctl_val);
		if (ret)
			return ret;

		return mpam_read_monsel_reg(msc, CFG_CS_FLT, flt_val);


>  		break;
>  	case mpam_feat_msmon_mbwu_31counter:
>  	case mpam_feat_msmon_mbwu_44counter:
>  	case mpam_feat_msmon_mbwu_63counter:
> -		mpam_read_monsel_reg(msc, CFG_MBWU_CTL, ctl_val);
> -		mpam_read_monsel_reg(msc, CFG_MBWU_FLT, flt_val);
> +		ret = mpam_read_monsel_reg(msc, CFG_MBWU_CTL, ctl_val);
> +		if (!ret)
> +			ret = mpam_read_monsel_reg(msc, CFG_MBWU_FLT, flt_val);

Same for this one.

>  		break;
>  	default:
>  		pr_warn("Unexpected monitor type %d\n", m->type);
> +		return -EINVAL;
>  	}
> +
> +	return ret;
With returns above, this can go.

>  }
>  
>  /* Remove values set by the hardware to prevent apparent mismatches. */


