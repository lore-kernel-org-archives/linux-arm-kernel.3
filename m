Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03E2DC43458
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 10 Jul 2026 18:40:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sIpvr9LYvApRcbIP0ivQOlJFsKZAMdUrM1YtqwpVgaE=; b=qDkYHcY6jnXo33K89Ilkc8aq6z
	X1kcUO1Oax9TfsGY6+el1zbOqSEL6qFmTGIYqIvJTyRcnZ+Hyk6fSFmWCNreQDUkddInsw6MYkW1g
	1o/YmTD8TL8AM83cF8CX+5kVgs4qf6De90XLnwAKofrub6CWYpq4BXbOTrZaXdx2/NyPN5/ma3ext
	8NMbvm0aJTWmneHw9M7ga3MbZI0Ke8Tly9nrwCqxPLxk5MM1XS5whHZtkH9HJ61dLptLSuBxcs+6N
	fUhIDms1Y+04JgoQkSXcm6F86qil2g+z4bRHQ/LEfu6B+IeJKHIossm7qVNZbELET854ZAre1N1g/
	eh4H6zGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wiG9U-00000005Wuo-1gmz;
	Fri, 10 Jul 2026 18:40:44 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wiG9S-00000005Wtr-07w0
	for linux-arm-kernel@lists.infradead.org;
	Fri, 10 Jul 2026 18:40:43 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66AH41m91400555
	for <linux-arm-kernel@lists.infradead.org>; Fri, 10 Jul 2026 18:40:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	sIpvr9LYvApRcbIP0ivQOlJFsKZAMdUrM1YtqwpVgaE=; b=A74IRlRJnNjrcxXb
	UQ7z646iDwLE/mBnMm4EPorid6bO0fVIm2OHjSDMNKETLXoKYCe38K/ZK6pUj0nz
	Dfg+oBJbeeBd1oeJsg7ziEgISMfJelHuAqL0W0Yd3sJYH9BUv6cQjJANgmlOFR2D
	fh9FjNAi/cCk7VbwZXmFOxpCd+njt3Tj5RgMTKxGKh6bGHLlOLHoj8pg6GayFQ3S
	VlDht69mJxsOJLtbhIuDMyeVMCSqoEoobnLNHmhLg9RKCpyY1De8j0WNkKW0y3Gc
	4OZfvDsrs2e9pLibkybRhVtyPwrWcBcYiw4ZLSgvu5mktlxYQucI+TFWx93zrNAD
	NMvoTw==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4faxyg9tdj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 10 Jul 2026 18:40:40 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-c892143db7fso1185496a12.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 10 Jul 2026 11:40:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783708840; x=1784313640; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=sIpvr9LYvApRcbIP0ivQOlJFsKZAMdUrM1YtqwpVgaE=;
        b=SE3OrhpDRFiViAPcWg7AjSz1jHO47gNz2cqFqDEnBpPDN2oddd/0FxSYGdLWduR8Ce
         qqT0T9qnpNLDj8y2o5cft7A3+fU2Su5nwmOCu3mWpdeN5omBmTCoNjw3+pB6FncTa5YV
         5KE7+pj8aUtR7LPChM4l/YKliaKZfEG0LbMuSEINZ8Cze7iG4dcQjst+uIPEsZrCPsRW
         ftIfc1X/lWKxItpzuki7cMw9ntdeSQRCY6OZq+4S3sGbCrH93LriI4tZQc0Ka928ja1E
         BXutyg4Z5H8i5ZszUDmmXY0rneEC37edNmzpa9yAYbMbQ+5MXQx1fopLwyOMw9Y0jn/2
         63Yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783708840; x=1784313640;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sIpvr9LYvApRcbIP0ivQOlJFsKZAMdUrM1YtqwpVgaE=;
        b=Qs/ad7sHJ18ziEqbzlSvYSHX8Dvoc/uF8mOoA2LHKvU0lBCOTbGgmGja9HVqEpHKC0
         OzYU0cEnyyFn8/mzUi0P42FVqKPj2Y5ul++CMG4585cTcm/P+7XdHgacBP2sxBTs62Bo
         oR1JsyW0jbMYbIuKY91HMLnJ1NBxGBOo2TQVmsZSKLmBZQZREPlO5+C0d34TtA2ia767
         PUGJ54BjZ5DVBDarTLVDklDamFk/1SxC6XG7FFspYq7k2xGdovfjlVMt0we+K0+ay6Rs
         EaZDu7ZzAnpzyooRenoRwLcj5ZlQ9p3Ts+0+STAoWIjsHvC0JTK7hQopu0//BHDTN02A
         YQkA==
X-Forwarded-Encrypted: i=1; AHgh+Rr64tjYABsJz1MGjADxkUhwgPdGgSBT6Lbvdo8/qUPJ6UpoexMWJUv1FooYdJcKEF4qkOOz2gjwbHiBsIKyiow4@lists.infradead.org
X-Gm-Message-State: AOJu0Yzpbs8VSYPEQvgmWqRCDctTQwGlU/pVTwTG86Idy9wFLq5/HALD
	sGpBzeUqW/P2udXZ6h6AM43K2QiYnJtAuHjo+YgNBfnERyXxYUDHAI2B2gRc5gqWRWWeuvix7yw
	ATbwJ+okF3TJefpGwtfMz4QXydXGKZ0vdkqdNnEjwOiVl3fTDK6o624IJSqza99OsI2exaJ3mki
	3qmQ==
X-Gm-Gg: AfdE7ck3T306cLfQCk3p/AGl+WXo1G7pIQ761xwRq5fUrg43Q7W4tp6yGrOhgpFEiIJ
	IMW+VkxnMIiNMsLNmAJDj+Af+w+cmcFssMniY1LFMOiaK3vfPyQIZXCBB8X8GzgGEnh+UBRxKm2
	1uqaPcptQ9MNOm8D/rgxqA5A6V5OdKao+DIToWSqZwH/VXGAQJhDoekX7YAU9dNpzSfEYLrPKou
	nzTblK1mveYEjM/0YjTGfXxJWw+oyNEPho08gqJLPVH/sg9FcM6cz3s0RKg7fAz/Le3dWn1h1dm
	YK6FNlnOQrwiMaAS/y55eX2eSZ2kmoKYAqfTrUrxRHFBGKLc0Dxnll6FT0LGtjx2KeapmxPro8f
	Qs+d6yAzUBngvXiiJtzFw5qmswOUxbIJQINEM
X-Received: by 2002:a05:6a20:3d02:b0:3bf:e761:626a with SMTP id adf61e73a8af0-3c110a74637mr214290637.38.1783708839860;
        Fri, 10 Jul 2026 11:40:39 -0700 (PDT)
X-Received: by 2002:a05:6a20:3d02:b0:3bf:e761:626a with SMTP id adf61e73a8af0-3c110a74637mr214261637.38.1783708839424;
        Fri, 10 Jul 2026 11:40:39 -0700 (PDT)
Received: from localhost ([50.35.46.84])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31174ac14f2sm45594006eec.27.2026.07.10.11.40.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jul 2026 11:40:39 -0700 (PDT)
Date: Fri, 10 Jul 2026 11:40:35 -0700
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
Subject: Re: [PATCH v3 04/16] arm_mpam: propagate MSC read errors for
 mpam_msc_read_mbwu_l()
Message-ID: <20260710114035.00006b0b@oss.qualcomm.com>
In-Reply-To: <20260710144520.917375-5-andre.przywara@arm.com>
References: <20260710144520.917375-1-andre.przywara@arm.com>
	<20260710144520.917375-5-andre.przywara@arm.com>
Organization: Qualcomm
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.51; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: hpXhBx-bbyGkPbHRTqhkcPeEQMFdwZww
X-Authority-Analysis: v=2.4 cv=PLg/P/qC c=1 sm=1 tr=0 ts=6a513ca8 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=qC1CW/w66vtJz1P9yTJxNA==:17
 a=kj9zAlcOel0A:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=7CQSdrXTAAAA:8 a=fCQIp7EH0RKNOWKKMFAA:9 a=CjuIK1q_8ugA:10
 a=bFCP_H2QrGi7Okbo017w:22 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEwMDE4NyBTYWx0ZWRfX2vfs6V0s/mZD
 j+rxQA7MKLUGMGkinowEZGJsgfHprnObhPRf5ZbDAq9aKdYXfAMd6ovlnMgtOR3eSHJqtyh5aB7
 ozZN0bZEJD9JFnzVb8IViCw9t3N3Siw=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEwMDE4NyBTYWx0ZWRfXyqjDV4e63OMO
 7TSvkZfSckhXIMHObFk83c/E7+FPWPZi4KaIGnxuFc1/ZboQjXmcZM9BoVegTe1YqvlIcrhIIAq
 yjAiRI1atef5MaBi/ribBjOHAXmcxJNUEqwxTdqRNlspMqvQykT1S5li4B9bhzS00fMC2ftMnJ0
 M8IN88e2Hd/b8oBPWq5F46OlHndLOPWSizgYvdIFPkeB4dUO+0Jmi2+XZhRc973lAhnOP26bAjQ
 wYzSVWDtt2kN6eN1AzzT0l6/joYetrdcZEmZLvgPhHgjRfk/Hb4zpulB3rtM5cPQfAwXpVZMVUe
 1QFcavY6nTw+XRfSMG1CJcEC9fWX77cixG6NruFfW36I4R/44L8Kv2J6VWEXp8z9l/+9DZ0na4C
 FGoxWl3fkF50j/oQIEEg9VOJskN1sCR5G93DMHEzQrqj2JSB0a3co7w6fEAZFMrlTX6g/uWXvP7
 SRRFN1k7nqaHa2/cJPw==
X-Proofpoint-GUID: hpXhBx-bbyGkPbHRTqhkcPeEQMFdwZww
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-10_05,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 phishscore=0 suspectscore=0 clxscore=1015
 priorityscore=1501 impostorscore=0 malwarescore=0 adultscore=0 bulkscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607100187
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260710_114042_197548_142AD5D7 
X-CRM114-Status: GOOD (  33.06  )
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

On Fri, 10 Jul 2026 16:45:08 +0200
Andre Przywara <andre.przywara@arm.com> wrote:

> Allow the mpam_msc_read_mbwu_l() function to return an error, and
> propagate read errors from the lower level up.
> So far we were using a special value to indicate the "unstable read"
> condition, replace that with the actual Linux error code, since it's now
> easy to do.
> 
> Signed-off-by: Andre Przywara <andre.przywara@arm.com>
> ---
>  drivers/resctrl/mpam_devices.c | 54 +++++++++++++++++++++++++---------
>  1 file changed, 40 insertions(+), 14 deletions(-)
> 
> diff --git a/drivers/resctrl/mpam_devices.c b/drivers/resctrl/mpam_devices.c
> index b1bd047da203..3b6f9e552a9f 100644
> --- a/drivers/resctrl/mpam_devices.c
> +++ b/drivers/resctrl/mpam_devices.c
> @@ -1112,8 +1112,9 @@ static bool mpam_ris_has_mbwu_long_counter(struct mpam_msc_ris *ris)
>  		mpam_has_feature(mpam_feat_msmon_mbwu_44counter, &ris->props));
>  }
>  
> -static u64 mpam_msc_read_mbwu_l(struct mpam_msc *msc)
> +static int mpam_msc_read_mbwu_l(struct mpam_msc *msc, u64 *res)
>  {
> +	int ret;
>  	int retry = 3;
>  	u32 mbwu_l_low;
>  	u32 mbwu_l_high1, mbwu_l_high2;
> @@ -1123,20 +1124,30 @@ static u64 mpam_msc_read_mbwu_l(struct mpam_msc *msc)
>  	WARN_ON_ONCE((MSMON_MBWU_L + sizeof(u64)) > msc->mapped_hwpage_sz);
>  	WARN_ON_ONCE(!cpumask_test_cpu(smp_processor_id(), &msc->accessibility));
>  
> -	__mpam_read_reg(msc, MSMON_MBWU_L + 4, &mbwu_l_high2);
> +	ret = __mpam_read_reg(msc, MSMON_MBWU_L + 4, &mbwu_l_high2);
> +	if (ret)
> +		return ret;
> +
>  	do {
>  		mbwu_l_high1 = mbwu_l_high2;
> -		__mpam_read_reg(msc, MSMON_MBWU_L, &mbwu_l_low);
> -		__mpam_read_reg(msc, MSMON_MBWU_L + 4, &mbwu_l_high2);
> +		ret = __mpam_read_reg(msc, MSMON_MBWU_L, &mbwu_l_low);
> +		if (ret)
> +			return ret;
> +		ret = __mpam_read_reg(msc, MSMON_MBWU_L + 4, &mbwu_l_high2);
> +		if (ret)
> +			return ret;
>  
>  		retry--;
>  	} while (mbwu_l_high1 != mbwu_l_high2 && retry > 0);
>  
> -	if (mbwu_l_high1 == mbwu_l_high2)
> -		return ((u64)mbwu_l_high1 << 32) | mbwu_l_low;
> +	if (mbwu_l_high1 == mbwu_l_high2) {
> +		*res = ((u64)mbwu_l_high1 << 32) | mbwu_l_low;
> +	} else {
> +		pr_warn("Failed to read a stable value\n");
> +		ret = -EBUSY;

I guess this may get more complex in later patches, but for now why not just 
		return -EBUSY.

> +	}
>  
> -	pr_warn("Failed to read a stable value\n");
> -	return MSMON___L_NRDY;
> +	return ret;
>  }
>  
>  static void mpam_msc_zero_mbwu_l(struct mpam_msc *msc)
> @@ -1283,6 +1294,7 @@ static u64 mpam_msmon_overflow_val(enum mpam_device_features type,
>  static void __ris_msmon_read(void *arg)
>  {
>  	u64 now;
> +	int ret;
>  	u32 now32;
>  	bool nrdy = false;
>  	bool config_mismatch;
> @@ -1358,8 +1370,9 @@ static void __ris_msmon_read(void *arg)

Relevant bit of context isn't show, but as before looks like
ACQUIRE() and ACQUIRE_ERR() will make this simpler by just
letting you do direct returns on all error paths though
you will need to set m->err = ret in each one.  To me that
is simpler, but feel free to disagree.

>  	case mpam_feat_msmon_mbwu_44counter:
>  	case mpam_feat_msmon_mbwu_63counter:
>  		if (m->type != mpam_feat_msmon_mbwu_31counter) {
> -			now = mpam_msc_read_mbwu_l(msc);
> -			nrdy = now & MSMON___L_NRDY;
> +			ret = mpam_msc_read_mbwu_l(msc, &now);
> +			if (ret)
> +				goto out_unlock;
>  
>  			if (m->type == mpam_feat_msmon_mbwu_63counter)
>  				now = FIELD_GET(MSMON___LWD_VALUE, now);
> @@ -1397,10 +1410,15 @@ static void __ris_msmon_read(void *arg)
>  	if (nrdy)
>  		m->err = -EBUSY;
>  
> -	if (m->err)
> -		return;
> +	if (!m->err)
Above ACQUIRE() suggestion relies on it not being a problem to hold
the lock a little longer and incorporate these sets in m. I haven't
checked closely but I think that's fine.

> +		*m->val += now;
> +
> +	return;
> +
> +out_unlock:
> +	mpam_mon_sel_unlock(msc);
>  
> -	*m->val += now;
> +	m->err = ret;
>  }
>  
>  static int _msmon_read(struct mpam_component *comp, struct mon_read *arg)
> @@ -1747,6 +1765,7 @@ static int mpam_save_mbwu_state(void *arg)
>  {
>  	int i;
>  	u64 val;
> +	int ret = 0;
>  	struct mon_cfg *cfg;
>  	u32 cur_flt, cur_ctl, mon_sel;
>  	struct mpam_msc_ris *ris = arg;
> @@ -1768,7 +1787,9 @@ static int mpam_save_mbwu_state(void *arg)
>  		mpam_write_monsel_reg(msc, CFG_MBWU_CTL, 0);
>  
>  		if (mpam_ris_has_mbwu_long_counter(ris)) {
> -			val = mpam_msc_read_mbwu_l(msc);
> +			ret = mpam_msc_read_mbwu_l(msc, &val);
> +			if (ret)
> +				goto out_unlock;
>  			mpam_msc_zero_mbwu_l(msc);
>  		} else {
>  			u32 val32;
> @@ -1788,6 +1809,11 @@ static int mpam_save_mbwu_state(void *arg)
>  	}
>  
>  	return 0;
> +
> +out_unlock:
> +	mpam_mon_sel_unlock(msc);
ACQUIRE() would avoid need for this handling so I think this is another
good place to look at using it.

> +
> +	return ret;
>  }
>  
>  /*


