Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15DF2C43458
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 10 Jul 2026 19:10:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+DHqMEOdVsuBepGS7JMZXAEJfhCwLxJixrbwAJYSTc0=; b=gnh67c5t+D5LYRoOrbd0bsHBrZ
	E7OAQJzN77gN7zHODzAdwKaEd7ngrh61uslhyZP05heeEuBmoxM1JJGMuPp50+aursEXXmV0cuNrD
	z7y1obTwCziySofkPK5WuBpgJK6FLrGTiEBemqHNqd6PPMKr7HZxxAcA5GWj24UJuIPQIOPRWS5Iz
	XHPL5KcJ4KDngjesCErmlvtI+13zUHcRZcG61KuOxkdBK7VATszDzTssQFouXSTJmK0W+SXZcrXvW
	qFd0Ny2smlV4T7DQBUh7hE0Q4xzp0hDgmTEtXdyBLDmdzj8gDxioWTqIosTjq5rgBkyxM9XlNB7V8
	IrX/dweA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wiGc6-00000005a3S-308f;
	Fri, 10 Jul 2026 19:10:18 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wiGc5-00000005a2u-0jjj
	for linux-arm-kernel@lists.infradead.org;
	Fri, 10 Jul 2026 19:10:18 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66AH3wxo1453428
	for <linux-arm-kernel@lists.infradead.org>; Fri, 10 Jul 2026 19:10:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+DHqMEOdVsuBepGS7JMZXAEJfhCwLxJixrbwAJYSTc0=; b=TDCoOXLA7YmhBjjM
	LYocPeisAfFi7KH40QdIBy0911Ah3S6Cwc18ZclmLnQOY8liL9xZbCn2MhCrL0T2
	G3Eoyv9vz58f7keRLDZY1BLDBaM0dqZIQWXK7LdlG2/KSif4drABUj026e2ORqhn
	hG0YG2pZXObSY0ppgrFRZ0+cmwwKhMeRssi7UHw9NsXUt2S5xRKhw4t6lyO1Mhcd
	+2USH5YD9BOYxG0DWOOt8FvVHHg7hbCfHsVRFTRiCNjDnpM8lvnBNgHLIw6xB9kC
	HXFmIdKkWChnGYOCwjKvzwLZNuzuFJFIGozPjvKSqi+n6vzynHzuYtP7yYGj0KFJ
	AGGsmw==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fb3xn0ng3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 10 Jul 2026 19:10:16 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-38c7e26ecabso1182062a91.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 10 Jul 2026 12:10:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783710616; x=1784315416; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=+DHqMEOdVsuBepGS7JMZXAEJfhCwLxJixrbwAJYSTc0=;
        b=AAxrPdjHK/hkJIHe/G99f7Pm97AygN4zRs034oef7aF5M6dsjByH5RcdfA/b2aJyPx
         0Vt27bMkxqHLv11hO2bYusp+woccypkaGTT9rZL7ZYuDtPWwMYLtqgiQpzjLnh91qeFo
         QoJXagCzhVST9jZnP8EMGaJ1wfnyZ4UDHSMfSbWY+7HyU2LerPvcEcpEEJ9M6kzbYEm4
         2xl1Sb0Fvu2VanRE1DCwCLeBkCS/seZ5ZEWVbaO/7WZX2HxgGc9vo+MBh61Bawb/Fj9C
         NJf2syQk4LxZRLreyGNvuQRO8dso2GKFCK59mfeu8WZBrJKysR40d+8KvSI2NtBa8lBQ
         1c6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783710616; x=1784315416;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+DHqMEOdVsuBepGS7JMZXAEJfhCwLxJixrbwAJYSTc0=;
        b=nLLPMBXZvKgin3CnEETzmmnfH2Hju55OsbD0ojbRVzdPV895ySf8JsjMinBRwkBVGs
         YCtexPGMvo77ZkCF+BsIlt3HUPjdejbuyxeltxoGJux8GvpIDOWdekfs3263QzO3bBMK
         oLH7szCOrxSYIgghpROoZ+PEwWEsvAn664gDa4kqNfoAemyt3I2IRk2lacbNxcgZvhN8
         9b3IlW69u0v5U5QbafcdO9LJgkApjaceBoMA3TtJM+F7V890qW257s2ycDfFLJF3pY3R
         XtbWgRYUjG+rvH1znoUgdPI1uLEIyTMcNxeDTKMo0fTTbuJU8ZCdkKVvLw+blUmEoEJY
         fdTg==
X-Forwarded-Encrypted: i=1; AHgh+RrWiKMEHyXaTiVUOHsdqnnEYVvka6C9Io/9pIT3ZbQVoQPoaSxwX/ahhz957vzFIqwQhBeRCVMiWnTuWPANXExO@lists.infradead.org
X-Gm-Message-State: AOJu0YwUNFSg4kIHKDxresHZTNhrrhtQnk9uQ8cH4DwFMrDfIlhoi+/t
	acrOuGbajt8V8OHbYsJ/II24GYWdt4J6mcsvzwPoaGPR2oqQ6RK6mcI6UPpKSreuN4C7883bcLQ
	XcMFEJmg+FbWcSn6SAHE3sWTKTOEBUym0yeUl0VbCjiDA7IuJDfvxvgkTaN50N809iWP0I5XYQT
	v61A==
X-Gm-Gg: AfdE7cnMzggXhkYQy1xAsd9pAl6MUeLbsyTtlBq0PAHEL7njo6Sxb5QXSElBLXdjqQD
	9Fr5IH/uWT1vHeLW3A4UVbumS65msvUcVZP6419h51vFk9RgPAHLl2/Ww8+kbslibKY8QLSWWJh
	/7HqStzvT31kEIl97+S2T5ADJfev3lyCWBtrarPX/jF5ujLLPa435MsonT0qu3yung/Fs5dnBlj
	TcNNNnqa5AHuKgXWlvksJ4/i9a47bylTLDEQiaLogkNKcCjzpqkHrt5bfJMgs3Wn+stdPQq25MN
	aI9M70Mn1Ko8f+OjKpMIvkJfzhlmXqITTMcHivtUbUjaCsKK9Tkk0KjyFOBkPf5NJyc3B+Y9xCP
	1u72Bz/BEIJx9ffYVA3v8bPeVWqrMLdUrOpOT
X-Received: by 2002:a17:90b:1a8e:b0:37f:ca19:36c6 with SMTP id 98e67ed59e1d1-38dc7847d0cmr241669a91.11.1783710615773;
        Fri, 10 Jul 2026 12:10:15 -0700 (PDT)
X-Received: by 2002:a17:90b:1a8e:b0:37f:ca19:36c6 with SMTP id 98e67ed59e1d1-38dc7847d0cmr241626a91.11.1783710615214;
        Fri, 10 Jul 2026 12:10:15 -0700 (PDT)
Received: from localhost ([50.35.46.84])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-311a6115e61sm22568961eec.22.2026.07.10.12.10.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jul 2026 12:10:14 -0700 (PDT)
Date: Fri, 10 Jul 2026 12:10:10 -0700
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
Subject: Re: [PATCH v3 12/16] arm_mpam: propagate MSC write errors for
 remaining MSC write users
Message-ID: <20260710121010.00005a45@oss.qualcomm.com>
In-Reply-To: <20260710144520.917375-13-andre.przywara@arm.com>
References: <20260710144520.917375-1-andre.przywara@arm.com>
	<20260710144520.917375-13-andre.przywara@arm.com>
Organization: Qualcomm
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.51; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=JJYLdcKb c=1 sm=1 tr=0 ts=6a514398 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=qC1CW/w66vtJz1P9yTJxNA==:17
 a=kj9zAlcOel0A:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=7CQSdrXTAAAA:8 a=QUh50r0uCS2WbTzk5IMA:9 a=CjuIK1q_8ugA:10
 a=rl5im9kqc5Lf4LNbBjHf:22 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-ORIG-GUID: wayhZxAA1nhdDvqhD0RBqDniXfar5mbE
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEwMDE5MiBTYWx0ZWRfXwqRq6Je7Wn4z
 7hOx/ViZHIOezVl2tXz8wMEkVh6UZh6cTI69o+ovBo4H/KqrbiU6yZ7Yhc0mEjkkOfUHBCMSlNM
 V093t4heG5BJDulHjZyaDroPWndC0H0=
X-Proofpoint-GUID: wayhZxAA1nhdDvqhD0RBqDniXfar5mbE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEwMDE5MiBTYWx0ZWRfX9Lht2NuKpKCk
 IQHN5dz465ey6bQAAroTuo3uwKyUFNl5LldhTaqF6zpIZ61L2rentBuKf4XGfTYVrG33/lqF6cS
 erkiYk27IJ13qJSJhE8pkq8zJmHBJmHpR+p9xgOX9cKojxtCP09xS/mdSB6eLpN3xMxSQ9pdQfV
 R42R+B9bDRWZiz3PDvvUjk4qNw0WfHToHPUJGfhaEk8Dtx1gppoNPJyoTORTHmhNl8Hfi7+Kddo
 g+Xr/HKKkH+GIkt+P00mqd6QSkxCI/xe6h9rSuUetU99R+GRe3HogPsVVpJYoMUbxdCtaD98gVe
 /Kk9k2ZEbfF4c1bSE5lW8oShZMRDEWqGzajbdThDznzSocaEtlDF8/4G8P+WctfWudR20MnFIFV
 VgnTdhhDTk1wIrnjfCxvWFlF4Y4uC2h26pAtvZd3y3uw7zFf/BPGZQWPfkqtxSFi3RjOoRtvjSJ
 I4DXLxmyVam5yVho4BA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-10_05,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 clxscore=1015 adultscore=0 lowpriorityscore=0
 bulkscore=0 priorityscore=1501 impostorscore=0 spamscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607100192
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260710_121017_225575_4C24FFC1 
X-CRM114-Status: GOOD (  22.93  )
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

On Fri, 10 Jul 2026 16:45:16 +0200
Andre Przywara <andre.przywara@arm.com> wrote:

> Allow the remaining MSC device functions to return an error, and
> propagate write errors from the lower level up.
> 
> Signed-off-by: Andre Przywara <andre.przywara@arm.com>
> 
> propagate write errors up for mpam_save_mbwu_state()
below the sign off?

> ---
>  drivers/resctrl/mpam_devices.c | 82 +++++++++++++++++++++++-----------
>  1 file changed, 56 insertions(+), 26 deletions(-)
> 
> diff --git a/drivers/resctrl/mpam_devices.c b/drivers/resctrl/mpam_devices.c
> index 222515a01b35..ca73029654b6 100644
> --- a/drivers/resctrl/mpam_devices.c
> +++ b/drivers/resctrl/mpam_devices.c
> @@ -1162,15 +1162,20 @@ static int mpam_msc_read_mbwu_l(struct mpam_msc *msc, u64 *res)
>  	return ret;
>  }
>  
> -static void mpam_msc_zero_mbwu_l(struct mpam_msc *msc)
> +static int mpam_msc_zero_mbwu_l(struct mpam_msc *msc)
>  {
> +	int ret;
> +
>  	mpam_mon_sel_lock_held(msc);
>  
>  	WARN_ON_ONCE((MSMON_MBWU_L + sizeof(u64)) > msc->mapped_hwpage_sz);
>  	WARN_ON_ONCE(!cpumask_test_cpu(smp_processor_id(), &msc->accessibility));
>  
> -	__mpam_write_reg(msc, MSMON_MBWU_L, 0);
> -	__mpam_write_reg(msc, MSMON_MBWU_L + 4, 0);
> +	ret = __mpam_write_reg(msc, MSMON_MBWU_L, 0);
> +	if (!ret)
> +		ret = __mpam_write_reg(msc, MSMON_MBWU_L + 4, 0);

Code lines are cheap.  Burn them for simple flow.

	ret = __mpam_write_reg(msc, MSMON_MBWU_L, 0);
	if (ret)
		return ret;

	return __mpam_write_reg(msc, MSMON_MBWU_L + 4, 0);


> +
> +	return ret;
>  }
>  
>  static void gen_msmon_ctl_flt_vals(struct mon_read *m, u32 *ctl_val,
> +static int write_msmon_ctl_flt_vals(struct mon_read *m, u32 ctl_val,
> +				    u32 flt_val)
>  {
>  	struct mpam_msc *msc = m->ris->vmsc->msc;
> +	int ret;
>  
>  	/*
>  	 * Write the ctl_val with the enable bit cleared, reset the counter,
> @@ -1260,26 +1266,37 @@ static void write_msmon_ctl_flt_vals(struct mon_read *m, u32 ctl_val,
>  	 */
>  	switch (m->type) {
>  	case mpam_feat_msmon_csu:
> -		mpam_write_monsel_reg(msc, CFG_CSU_FLT, flt_val);
> -		mpam_write_monsel_reg(msc, CFG_CSU_CTL, ctl_val);
> -		mpam_write_monsel_reg(msc, CSU, 0);
> -		mpam_write_monsel_reg(msc, CFG_CSU_CTL, ctl_val | MSMON_CFG_x_CTL_EN);
> +		ret = mpam_write_monsel_reg(msc, CFG_CSU_FLT, flt_val);
> +		if (!ret)
> +			ret = mpam_write_monsel_reg(msc, CFG_CSU_CTL, ctl_val);
> +		if (!ret)
> +			ret = mpam_write_monsel_reg(msc, CSU, 0);
> +		if (!ret)
> +			ret = mpam_write_monsel_reg(msc, CFG_CSU_CTL, ctl_val | MSMON_CFG_x_CTL_EN);

By now you can probably guess my comments on this.

If you ever find yourself with a case where you can't do guard/ acquire()/early returns
etc, use a helper function that can just return on each err.

It is more code, but I'd much rather see that on error we 'stop' and return
than try and follow the path to see if anything else happens.

		ret = a();
		if (ret)
			return ret;

		ret = b();
		if (ret)
			return ret;

etc.

