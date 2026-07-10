Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB7B4C43458
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 10 Jul 2026 18:57:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NUwraeVAIbOxkgowZVXW9RaxpXRVvqBvyF4xRm9fCHw=; b=P3A1QZ8XKgZsH+odHh0vNxCoDr
	es+VdqBss46O1TahgSx/z5V0p/QGv6IQtM3FK0YMWEBmQy8FMNpr6KQZ2Md+3w2SX+8uFg2CuKAb/
	W7slVAUKAwU1ckODI7alRd3282bopWos2223p33FQfGzdW9fvekEMEmMuG8EYM6uYQ8v+8d3g9Rrz
	6q6OI9OlT00BnolomfZpRGCJESaVIjJQnNZDVck0XwTelu5v/LFVivAkoNTGnFUZEhPPceWD3F/Ya
	cZuNF9W1Wc1E5dyVlVxM+CXqkI4zwkzp/g7aVilHqE/XFtRzAOklK1jldkameNmbmSB4nk5Y6S4Gv
	WsbPohPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wiGPQ-00000005Yls-2lqP;
	Fri, 10 Jul 2026 18:57:12 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wiGPO-00000005YlU-3FMX
	for linux-arm-kernel@lists.infradead.org;
	Fri, 10 Jul 2026 18:57:11 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66AH3qbV1308027
	for <linux-arm-kernel@lists.infradead.org>; Fri, 10 Jul 2026 18:57:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	NUwraeVAIbOxkgowZVXW9RaxpXRVvqBvyF4xRm9fCHw=; b=osvB0wjHZUONx161
	Nq48eHZ6D4AUiNb2uhT52YWljU0x7kVtjYOYjpyA2u/n+MsE3jYXNI0CFIGY98ma
	BE+sCzOITKbv9QenjKzkRh7DCL6J/zPZslVnQWwjAtGHYc3rpSq9SH48AvqxXMpQ
	11mXmMjawdsuVu4PE7lJzN2JYIki1KAO0an3JADdVS5TB/MU36ZqVoOWwYOk5y54
	ZrNM/ot3apCY95JUAlycMwaiewe/G+pCr/cXYzHQbkYjGhRr4Gfs3Yp2Ehl0+yiZ
	UH36qmmFdk85RlykTMGZ5qE6e6eC9sXBK4cwK4jktuQJDqoI5zeWiUgFzTzk60/c
	HdYBTg==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fax5dj2d0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 10 Jul 2026 18:57:07 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-c889d1eedcdso1899098a12.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 10 Jul 2026 11:57:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783709822; x=1784314622; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=NUwraeVAIbOxkgowZVXW9RaxpXRVvqBvyF4xRm9fCHw=;
        b=iT/UDvS/yZRU/R9L66Yi5VzIpSsxqqjQK5ItJ0uLEp5FLrfPSAEw3KuHfBscwvzqwv
         vDl41sZKsuXuNQ4WiBjfqRkqqS0Ef30WmUvgUP7Us357v4hDuAOHV4eMPqG3xP+ooZts
         /7/REL3edaRiXnEZzP+MlxpLCG4cqmxudQyYO4Cy93mvdQG4snmY01Ud/m8/mrms4L0b
         +F+kF/3pI9wsCsIwaqyrIxaAqcLmdZKW5nuDkfXDkBi0EQzdSQhZMHsb4iQnrBfPxkrX
         gngg/B14hQCLLA2pRQ3lmJ+WDZ/EzKXOPHozIGOByOzL9LL2Vu8H0XMGVC74y96o4xUC
         AmuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783709822; x=1784314622;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NUwraeVAIbOxkgowZVXW9RaxpXRVvqBvyF4xRm9fCHw=;
        b=FCzCOHqK16RbxiXADxDNRPRgY2vTOKMmB/GrAdOk7WZCE3CA/Lmc5wVm0xkaAz5wJw
         BM2x1FXeNEksywixxPjKUt+IQ+aUuI7A9FP2otDpItVAPBi4nduNCuaKJf47JTYxqqQt
         ICzBM9hXf53ZHHOTiwLgdBq2erFrO4YsG2bm9QqWI8ubge/hSl3/Gky70H/6VJ+d/h5q
         t1MaxTKf+dygXFiApulU+Fbmxp9L+LgJKsXv3JITQAB0oqm2JKfrjn9rJ7HQhQk2mnch
         qKh96qB6DnThtI5kNhsUU4shuEWapULx9NFVJeCgobLA3nnLBMSbgZs++jGr3cVu94zG
         +sZA==
X-Forwarded-Encrypted: i=1; AHgh+RqMgChSqoUs459L5+SQXHFUNHlXGTCPwOgiNKbhpBw3ZncobkhoEDO4ayJZunraBFFWFdiPnMXb2KFRcRxKW3lP@lists.infradead.org
X-Gm-Message-State: AOJu0YxvwBVfq7wgkwrSybhwwm6f3UpF981MZrcOuEbW50iz9/GADQKt
	mpC7EKm7qyw5l0HWkQzxWVcZpOqOcfuHcF1Lv1DhvXUbpocI8g3lAtpVcUnnHGGjXey6bddDrb3
	5PSTxzhqML9rQPjtT3fKLkNP2EMaqsPUHDBQulMP3tvAkb3PeOeDU+Jw776ebwInS5jpgg5kAVh
	isbA==
X-Gm-Gg: AfdE7cnFZpuN5MkixMPjLMTqYB/MqNujxUzsgQmPP2/6eHwrbsyMnLV+0pjTGLIzybV
	HsQdZf2yLqNooOwL2n1IBrYvWMEMl66hFphOWv3Ew4ZylFKVUgcOZk42OQ1U09JKzfeOLmOrGk7
	RtWbq5ELwdr1HKPyWq8M3tixk0Nra1ojrec8a1mXGmEzqNdjkv61+nslfcOyqiLbw0Hnf9+MIjE
	lQEd1dTZrAjmlSgCgCoUI1WP1hnZ1EBLihxQ5TFn1/vbK3gg/V/9hQhXSnH6/XdFeVWzgnckFkR
	t7YLLQB14tcDyhjNWLH9Y+V64K6yXIV4hEXNTILpUXje1vYBNKDEhDeOEQWb37xSNFfla0bZyhW
	hOkFiHM41Y765e68v1zCBYgH/oTprzae6MVNn
X-Received: by 2002:a05:6a20:c998:b0:3c0:9c1a:893f with SMTP id adf61e73a8af0-3c110f7f555mr201819637.71.1783709821999;
        Fri, 10 Jul 2026 11:57:01 -0700 (PDT)
X-Received: by 2002:a05:6a20:c998:b0:3c0:9c1a:893f with SMTP id adf61e73a8af0-3c110f7f555mr201789637.71.1783709821554;
        Fri, 10 Jul 2026 11:57:01 -0700 (PDT)
Received: from localhost ([50.35.46.84])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-311747f5975sm40499805eec.4.2026.07.10.11.56.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jul 2026 11:57:00 -0700 (PDT)
Date: Fri, 10 Jul 2026 11:56:56 -0700
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
Subject: Re: [PATCH v3 07/16] arm_mpam: __ris_msmon_read(): get rid of nrdy
 special handling
Message-ID: <20260710115656.00001345@oss.qualcomm.com>
In-Reply-To: <20260710144520.917375-8-andre.przywara@arm.com>
References: <20260710144520.917375-1-andre.przywara@arm.com>
	<20260710144520.917375-8-andre.przywara@arm.com>
Organization: Qualcomm
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.51; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEwMDE4OSBTYWx0ZWRfX8PM9jQ8o3mYn
 6K7T6UmqHJmLhkixE43sKWNxp1dCREEo8bm7uODLQKliJ2vU6aCDvO6/OQhLE+/9D144vP0G0bb
 tr/NKrJw8fCjwdc2cuOT43k7lBolDgw=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEwMDE4OSBTYWx0ZWRfX/ug0tfKOjVaU
 tkjjVhMWdhrygeNdPNeeRpolMC3dA7zoNldYd8/9wFyM+hHakuuo1zoGIXjwAzNBgQoIS0ifscP
 FRMEpEP+WfbvvimXCjMTjrZqUULXx/SFKXHo3Vc+on2TKbLeFQ2VVt3jHx9+johs63WhO5iyaA6
 4iJstajq5qUrsghyuahEPeVo5loiipwFjpQv6AcXSBR4AsaV8+8h4bFdCf80UD2rC9YOBwQ0Kt0
 G6kdws0NftJ19EN060H0F24rPKyV0zT8wGA5154AVUT4FI84d0/isjb4F+f1VLPLlVqQ4k5GG1u
 5blJQ0mjV5mFpSWxbz1732oVaw+BnoEjFOA1YwSU57Sq8EQkByhCZtcO8acp0Gx/GQ6BaQVWZE3
 29a4hGoJWjwXPWv1K5Kf3Dt4MsQE8lXDEn9RGvzePKXBbDTSJr84Z9xOuqeuVQLT0A9fSqh4zvP
 2SagV5QHuNNBOz4mkyw==
X-Proofpoint-GUID: y5iihj_SqT1FhqzE_-R0ZAjMA-7ZG0l8
X-Proofpoint-ORIG-GUID: y5iihj_SqT1FhqzE_-R0ZAjMA-7ZG0l8
X-Authority-Analysis: v=2.4 cv=M/x97Sws c=1 sm=1 tr=0 ts=6a514083 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=qC1CW/w66vtJz1P9yTJxNA==:17
 a=kj9zAlcOel0A:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=7CQSdrXTAAAA:8 a=TeALGT1HamTeR9oYe0QA:9 a=CjuIK1q_8ugA:10
 a=x9snwWr2DeNwDh03kgHS:22 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-10_05,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 bulkscore=0 malwarescore=0 suspectscore=0
 phishscore=0 spamscore=0 clxscore=1015 priorityscore=1501 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607100189
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260710_115710_847017_675A8627 
X-CRM114-Status: GOOD (  30.63  )
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

On Fri, 10 Jul 2026 16:45:11 +0200
Andre Przywara <andre.przywara@arm.com> wrote:

> Although so far MSC accesses couldn't fail, there is one special
> condition that would create an error: when the MBWU counter wouldn't be
> able to read a stable value, we were setting bit 63 to mark this value
> as unstable, and return this as an error later.
> Now since the functions can return a proper error value, we can get rid of
> this kludge and use the return value directly.
> 
> Remove the "nrdy" error flag variable, and assign -EBUSY to "ret" to handle
> this case.
> 
> Signed-off-by: Andre Przywara <andre.przywara@arm.com>
Hi Andre

I'm still fussing about code flow and style :(

Obviously none of this is that important, but it does help make
the code more maintainable in the long run.

Jonathan

> ---
>  drivers/resctrl/mpam_devices.c | 38 +++++++++++++++-------------------
>  1 file changed, 17 insertions(+), 21 deletions(-)
> 
> diff --git a/drivers/resctrl/mpam_devices.c b/drivers/resctrl/mpam_devices.c
> index 84a8715464be..530ac0fe97b5 100644
> --- a/drivers/resctrl/mpam_devices.c
> +++ b/drivers/resctrl/mpam_devices.c
> @@ -1306,7 +1306,6 @@ static void __ris_msmon_read(void *arg)
>  	u64 now;
>  	int ret;
>  	u32 now32;
> -	bool nrdy = false;
>  	bool config_mismatch;
>  	bool overflow = false;
>  	struct mon_read *m = arg;
> @@ -1371,14 +1370,18 @@ static void __ris_msmon_read(void *arg)
>  	switch (m->type) {
>  	case mpam_feat_msmon_csu:
>  		ret = mpam_read_monsel_reg(msc, CSU, &now32);
> +		if (!ret) {
> +			if ((now32 & MSMON___NRDY))
> +				ret = -EBUSY;
> +
> +			if (mpam_has_quirk(IGNORE_CSU_NRDY, msc) &&
> +			    m->waited_timeout)
> +				ret = 0;
Whilst it is from existing code, this pattern of set and error then clear it
is less than ideal.  Maybe

			if ((now32 & MSMON___NRDY) &&
			    !(mpam_has_quirk(IGNORE_CS_NRDY, MSC && m->waited_timeout))
				ret = -EBUSY;

is clearer as that odd intermediate state of ret never happens.

> +		}
>  		if (ret)
>  			goto out_unlock;
> -		nrdy = now32 & MSMON___NRDY;
> -		now = FIELD_GET(MSMON___VALUE, now32);
> -
> -		if (mpam_has_quirk(IGNORE_CSU_NRDY, msc) && m->waited_timeout)
> -			nrdy = false;
>  
> +		now = FIELD_GET(MSMON___VALUE, now32);
>  		break;
>  	case mpam_feat_msmon_mbwu_31counter:
>  	case mpam_feat_msmon_mbwu_44counter:
> @@ -1394,9 +1397,11 @@ static void __ris_msmon_read(void *arg)
>  				now = FIELD_GET(MSMON___L_VALUE, now);
>  		} else {
>  			ret = mpam_read_monsel_reg(msc, MBWU, &now32);
> +			if (!ret && (now32 & MSMON___NRDY))
> +				ret = -EBUSY;
>  			if (ret)
>  				goto out_unlock;
> -			nrdy = now32 & MSMON___NRDY;
> +
>  			now = FIELD_GET(MSMON___VALUE, now32);
>  		}
>  
> @@ -1404,9 +1409,6 @@ static void __ris_msmon_read(void *arg)
>  		    m->type != mpam_feat_msmon_mbwu_63counter)
>  			now *= 64;
>  
> -		if (nrdy)
> -			break;
> -
>  		mbwu_state = &ris->mbwu_state[ctx->mon];
>  
>  		if (overflow)
> @@ -1419,22 +1421,16 @@ static void __ris_msmon_read(void *arg)
>  		now += mbwu_state->correction;
>  		break;
>  	default:
> -		m->err = -EINVAL;
> +		ret = -EINVAL;
>  	}
> -	mpam_mon_sel_unlock(msc);
> -
> -	if (nrdy)
> -		m->err = -EBUSY;
> -
> -	if (!m->err)
> -		*m->val += now;
> -
> -	return;
>  
>  out_unlock:
>  	mpam_mon_sel_unlock(msc);
>  
> -	m->err = ret;
> +	if (ret)
> +		m->err = ret;
> +	else
> +		*m->val += now;

If you do the earlier suggestion of ACQUIRE() this all get simpler, but if you do keep
this, then burn a line or two of code to make it obvious what is error and what isn't.

	if (ret) {
		m->err = ret;
		return;
	}

	*m->val += now;
>  }


