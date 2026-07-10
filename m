Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 125F9C43458
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 10 Jul 2026 18:31:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wghtXrmA4tuz0gT7trc8nR/4s0EnIKsAEKP7KeyovOI=; b=Bgt/gCzMK6fLqb43ni3as7rt22
	ITGUT99Tw/x+tqaW+mkxF2DI3E6uqDHwF5w1lFOQjLQr/s3Rn1E2Ck5vYktH+IRndLzTD3R6eOURb
	I/w37SMcKvhhRAuLVzDas9kJivGzbel7uG61c+1cdQ56/qz3wPqfuv1CzC8C6Jxe0v4UOjL2iY/cZ
	MQJ2ExW1f8UPsLIhyeoIrm5Nbn0yxp1VXP9pqWcf/yExU+p1gLfveXYsxpkEY9TWu1nPr0QJ1t3+4
	1ABfeSkvPowLg4iPVd2BQktOCkFbTwzvehUob6Ga+RfzFHH+Wan0xZyhQoo7pYPxOTjs9gM78Zu2K
	nRQkZIzQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wiG0e-00000005Vy8-110A;
	Fri, 10 Jul 2026 18:31:36 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wiG0b-00000005VxG-1Sfe
	for linux-arm-kernel@lists.infradead.org;
	Fri, 10 Jul 2026 18:31:34 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66AH3gEr1307174
	for <linux-arm-kernel@lists.infradead.org>; Fri, 10 Jul 2026 18:31:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	wghtXrmA4tuz0gT7trc8nR/4s0EnIKsAEKP7KeyovOI=; b=HqqklVdD+5EcfmZD
	2b5Ipg0WJdkrZejWB+KijN8C1tb1DdbsoeFLxEUajqWw0yX8zryzGHUqXuHsL9Yf
	J7KmO1EfCNCFOwCeSB0NKDEGFBNRBl4p/n6KWQqTZj7zyjeUGwrUTOw953WmfrMc
	C8DPnTvjWJ9RHzX9sHdd9+7NritgVVnls6/EctOIFEV3fwWSrcskllX+obV8UvE5
	pTiWTSukYzem/mFz6uRSVfNiC65deXWzdzOo7ffsSZKdCuGRmgDir+GU1cpCHr5d
	YkpfByxd6uPQT81vJcvqSV4QMEp+PoYYZ7qSmokfPMQJjyDs2kBdBUjLvw7iD3wH
	gVsbKg==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fax5dhyn6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 10 Jul 2026 18:31:32 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-c9c26587e67so1259702a12.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 10 Jul 2026 11:31:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783708292; x=1784313092; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=wghtXrmA4tuz0gT7trc8nR/4s0EnIKsAEKP7KeyovOI=;
        b=c5wYweKZoxgZoQ+uqatYP3j8HgECkno50mlDb6xdddmw5X2TkrfF4VPyeTfFttZs9N
         y3O/MKjC9+9moWj1qFzCRnASodgX18X2FyzNJmtMlxz31PewRimIoR1MpkTeAdsnuDcw
         mTBp5eiOLwxluj2Y/7NH1cdiDMG/cJRzjR++LZhaaDLMzDs1/YlAg+/Hvwiika71hCIo
         miK5Xl9tp2DqLB4C8FCrvt+fyE4MlwpnDWu7xU6M08osBjj92wmwZepVlYK/PlmIQ0QC
         46z6qhpDAtpI1tdubN+GbEqG9IfN/y2iMTkXi4vZAGLcM/VISb0R90HudJJKkcotkCae
         WPzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783708292; x=1784313092;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wghtXrmA4tuz0gT7trc8nR/4s0EnIKsAEKP7KeyovOI=;
        b=iKodoeqQGRTGljQYpfCkHL3f9qriGCVIBu2qZmEqvo7ADe/nb2kKDsYeSHB3wmA9oi
         5PE5M5QJlIbsmuoDFGgEiLb6BCfLNK/KyKwE8nmKxL+Cvzk3vTdRtphYhgmAYV25ILcv
         Q96Mz1daEmLEencaC6+yOPA8+ckgKIArqBhee3+8RvYUS/6RJz/WmQiolXNSKdLnq7cP
         OcdhXrpSDnijC0GU3nGNKCAyB6PkWTJUQ/UniGsybAqVLJ/Hlgz8qKiyBt/sByTJAG54
         FNG1JFj6x3amsBJx2lg+cpLqQSms6d2BJMATiOLdQTeb3Xba1enOuWTHc1zYj36u1d/f
         3oaw==
X-Forwarded-Encrypted: i=1; AHgh+Rq+ZLqBHBLFR6W4skD458LaXtznRfZ/EjR+0toufc2Ue1dsSQmb04KBitkRl3REHfs+yuMNb8rfEIyVz18GYYa1@lists.infradead.org
X-Gm-Message-State: AOJu0YygRnfBHdId9BFvn0ErJj33BiElX2u0f1sBIHdhhqVQpuBABUg9
	l5UCZI0bPGFD+pN3RxuqT9D6wGr4KIz9++s29e1eNXoSEjwwHAhUPBnlNKdcj92yk3Dpea7f4b6
	pC/Uymrk4X9J7GhYkv+MbC/ejM06pFxUBveCEdCU21CxJh/YstCkq2dBfKrKAPuXzHNZ7i9suTf
	WHog==
X-Gm-Gg: AfdE7ckvlEppenIdYP7G1wsG+xWJjlhv9TR5k1xY3PiFXulsszTYYgh5COlyIiKzGgP
	yiBClh2VzoSkcruxpKacY3RH8O8ln7VfHwN8ZwfX6E6bdmn/xTw5jHtbyRij6XFt1ba244PuCiO
	cT3Vu+cNqbrV9Wmsh88hn5j4pQHcP4Jz/9CavHuEgqKRlKbZU380w9ULxcOkhnqCSaatzm7BscS
	8JoWXS4qpKO2FrGO/+kEfQ8NChBwrlbb4X3iNck2rIeOMCQ87mGEC6LDtBu5K+iz0uw2sHPrLEY
	APaZ/qCeNnugbZ6r65LdxYkAiR6yEgfHms3H9dz71yTcWB6zD8+PfbsLWC7Am6LJOcwLxCl2RoQ
	qqKF6rYGgWHuI07Vp1MsCYU07PCUGyxeTRo23
X-Received: by 2002:a05:6a20:3ca5:b0:3bf:a517:cdcd with SMTP id adf61e73a8af0-3c0f091831emr6662567637.12.1783708291931;
        Fri, 10 Jul 2026 11:31:31 -0700 (PDT)
X-Received: by 2002:a05:6a20:3ca5:b0:3bf:a517:cdcd with SMTP id adf61e73a8af0-3c0f091831emr6662533637.12.1783708291336;
        Fri, 10 Jul 2026 11:31:31 -0700 (PDT)
Received: from localhost ([50.35.46.84])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3118ee6080dsm27861010eec.17.2026.07.10.11.31.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jul 2026 11:31:30 -0700 (PDT)
Date: Fri, 10 Jul 2026 11:31:25 -0700
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
Subject: Re: [PATCH v3 03/16] arm_mpam: propagate MSC read errors for
 hw_probe functions
Message-ID: <20260710113125.00005752@oss.qualcomm.com>
In-Reply-To: <20260710144520.917375-4-andre.przywara@arm.com>
References: <20260710144520.917375-1-andre.przywara@arm.com>
	<20260710144520.917375-4-andre.przywara@arm.com>
Organization: Qualcomm
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.51; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEwMDE4NSBTYWx0ZWRfX6lEN+oKuqF2h
 GaLrwEnvYY7SXTiNwpTcoWlknegOjZbu0lVMdez/JvcAv+qVS86ZdrAIDoH9t6+wowLtJS1GUTU
 RrKAKv1OfW5OZjFFYJuTPOp6vJe32Ks=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEwMDE4NSBTYWx0ZWRfX5PiVsGetvAjO
 RXVlHRKf35CAz6oUq2ClZDbVX/PHGz8CZ7MnVqJj3/blquuDWW98NUv7vziQ8sM91kwfQaN7Iyv
 AoJ1kNuQV7ccxEzVsL2guuNon2zt+dffPDX+qJgR8UQDdzZHEt1NzaIBaKHXnCWrNcvuW5+TuQC
 V2+qbAShGVxhaJ7W8mXfePire8yRgakABtmLK+KoWgQPze3v0GltztdNWOS94O0C2Hnuu/v0joD
 DRFB8vxlHGHzsL19d2N50/P67BajapJMcD+AtLaJoiLe1Ypqt+x3NJQbJrvP/DjXId8Rlozw2Ut
 rwezvf2N6yH6k4xcNda+qdbyGQIQM5pVRvWjBC1vqlO4ImdbJMf9RIiU/OxigSQbIZduX4bU0vs
 efYH4upiqdc0s7FKF0FpWRhZm1UrShxoRHpayvUvrPNlXhGkV+JirumTVdSLU9pgilWlPFp8nXo
 pbPJ3Joi5lRCM8WIu3g==
X-Proofpoint-GUID: oFXnhtsRxsFcPPHbku-ObMs12uWk-qUY
X-Proofpoint-ORIG-GUID: oFXnhtsRxsFcPPHbku-ObMs12uWk-qUY
X-Authority-Analysis: v=2.4 cv=M/x97Sws c=1 sm=1 tr=0 ts=6a513a84 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=qC1CW/w66vtJz1P9yTJxNA==:17
 a=kj9zAlcOel0A:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=7CQSdrXTAAAA:8 a=sM7ngZJOnra7i-ukzE4A:9 a=CjuIK1q_8ugA:10
 a=3WC7DwWrALyhR5TkjVHa:22 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-10_05,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 bulkscore=0 malwarescore=0 suspectscore=0
 phishscore=0 spamscore=0 clxscore=1015 priorityscore=1501 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607100185
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260710_113133_398549_A4CA5088 
X-CRM114-Status: GOOD (  28.23  )
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

On Fri, 10 Jul 2026 16:45:07 +0200
Andre Przywara <andre.przywara@arm.com> wrote:

> Allow the functions probing for MSC hardware and features to return an
> error, and propagate read errors from the lower level up.
> 
> Signed-off-by: Andre Przywara <andre.przywara@arm.com>
Hi Andre,

A few suggestions to use some newer kernel 'toys' to simplify this
code.

Thanks,

Jonathan

> ---
>  drivers/resctrl/mpam_devices.c | 70 ++++++++++++++++++++++++----------
>  1 file changed, 50 insertions(+), 20 deletions(-)
> 
> diff --git a/drivers/resctrl/mpam_devices.c b/drivers/resctrl/mpam_devices.c
> index 8fd2c38c821c..b1bd047da203 100644
> --- a/drivers/resctrl/mpam_devices.c
> +++ b/drivers/resctrl/mpam_devices.c
> @@ -785,7 +785,7 @@ static void mpam_enable_quirks(struct mpam_msc *msc)
>  static bool mpam_ris_hw_probe_csu_nrdy(struct mpam_msc_ris *ris)
>  {
>  	u32 now, mon_sel, ctl_val;
> -	bool can_set, can_clear;
> +	bool can_set, can_clear, ret = false;

I know the surrounding code does this, but it is helpful to general readability to
not mix declarations with assignments from those that don't. I'd just
use an extra line for ret.

>  	struct mpam_msc *msc = ris->vmsc->msc;
>  
>  	if (WARN_ON_ONCE(!mpam_mon_sel_lock(msc)))
> @@ -804,20 +804,26 @@ static bool mpam_ris_hw_probe_csu_nrdy(struct mpam_msc_ris *ris)
>  	mpam_write_monsel_reg(msc, CFG_CSU_CTL, ctl_val);
>  
>  	_mpam_write_monsel_reg(msc, MSMON_CSU, MSMON___NRDY);
> -	_mpam_read_monsel_reg(msc, MSMON_CSU, &now);
> +	if (_mpam_read_monsel_reg(msc, MSMON_CSU, &now))
> +		goto out_unlock;
>  	can_set = now & MSMON___NRDY;
>  
>  	_mpam_write_monsel_reg(msc, MSMON_CSU, 0);
>  	/* Configuration change to try and coax hardware into setting nrdy */
>  	mpam_write_monsel_reg(msc, CFG_CSU_FLT, 0x1);
> -	_mpam_read_monsel_reg(msc, MSMON_CSU, &now);
> +	if (_mpam_read_monsel_reg(msc, MSMON_CSU, &now))
> +		goto out_unlock;
>  	can_clear = !(now & MSMON___NRDY);
> +
> +	ret = !can_set || !can_clear;

This is less readable than it could be. I'd be tempted to split good and bad paths.

Or better yet, now we have ACQUIRE() and ACQUIRE_ERR() can we use the cleanup.h
magic to do auto cleanup of mpam_mon_sel_unlock()?  Then the error paths can
become direct returns. I haven't read the rest of the mpam code for a few months, but
it might be much more generally useful given we now have a bunch more reasons
to return early.

> +
> +out_unlock:
>  	mpam_mon_sel_unlock(msc);
>  
> -	return (!can_set || !can_clear);
> +	return ret;
>  }
>  
>  
>  static int mpam_msc_hw_probe(struct mpam_msc *msc)
>  {
> +	int ret;
>  	u64 idr;
>  	u16 partid_max;
>  	u8 ris_idx, pmg_max;
> @@ -1016,10 +1040,12 @@ static int mpam_msc_hw_probe(struct mpam_msc *msc)
>  
>  	/* Grab an IDR value to find out how many RIS there are */
>  	mutex_lock(&msc->part_sel_lock);
> -	mpam_msc_read_idr(msc, &idr);
> -	mpam_read_partsel_reg(msc, IIDR, &msc->iidr);
> -
> +	ret = mpam_msc_read_idr(msc, &idr);
> +	if (!ret)
> +		ret = mpam_read_partsel_reg(msc, IIDR, &msc->iidr);
>  	mutex_unlock(&msc->part_sel_lock);

This is a classic pattern where cleanup.h magic can give a more readable
result with all error conditions easy to spot as each can be fully
handled on its own.

	scoped_guard(mutex, &msc->part_sel_lock) {
		ret = mapm_msc_read_idr(msc, &idr);
		if (ret)
			return ret;

		ret = mpam_read_partsel_reg(msc, IIDR, &msc->iidr);
		if (ret)
			return ret;
	}

	mpam_enable_quirks(msc);
> +	if (ret)
> +		return ret;
>  
>  	mpam_enable_quirks(msc);
>  

