Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01BF1C55182
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Aug 2026 22:14:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ig95ApWFX9FrE4bSEK82oovW8IQGcBZFRFG4rkok8Cw=; b=vpgPlrd+vZV6oIxXlUBwacWyZn
	TLMP6vjEJ2bSel1G5Mj6BKqIU69USfsGsdBmgw+m+vOy4eSLgM6aUUc1GgxASfDn/Jn37U4XUbFR+
	jH9mPr0A0xlp21xaOk0AKCITezmUBvKNE3jZ6u8qPSNV6ioAedLLz8nvKiO4qxfVciMz2bKDiV8NL
	5cAzheb71vsD5swE3jr3/L7b69fjjXMAIR8mP4cJM8CS4uLffa40rT09iXHYznoANzP5fOs/c5qlo
	OyrmZyfmLyeQ2mg3wECmcKDjwAB3i7e3ffBw5O+2nrq7o8dJH7L1tiEjDG/GUrXmKVIrg+VYsy+1C
	0R8qn1mQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wr0uw-00000000a2q-2tv4;
	Mon, 03 Aug 2026 22:13:54 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wr0uu-00000000a2T-01Mb
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Aug 2026 22:13:53 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 673JkhoX1905506
	for <linux-arm-kernel@lists.infradead.org>; Mon, 3 Aug 2026 22:13:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ig95ApWFX9FrE4bSEK82oovW8IQGcBZFRFG4rkok8Cw=; b=iYeitjnDFCqO5O64
	qaNqhGDOeOq4NMgkqbc+n2F4iepZtrMVWI1u6u+AwN05fK0ZZxZ2xRd4ZQ0L58l8
	3dit4SFNnFjLMZugpvta/2QbNMHUfWK/QcdwEyOLpHtIa+nFWZdHmHWDfwIFubvH
	YptyBgPgf1fbyhtqpP24t8cJKMqD/edrB82H7weraYhyzqr2Za8n+XzS39tLrANC
	Z81Ttza/7zwsXfrxgCKjJsKS7rww2mL9hXyKAXimjo6Gya7PR1wRb8I/bvFROZiU
	lYeGMtQnKHTiDZuy6NiFuq0CK+agHpPssTUIa1VdfKDeDV47GxJ9JumL6XeyxZdH
	jLvDmw==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ftnrbc01c-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 03 Aug 2026 22:13:48 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-cb4cdf95b5aso7952023a12.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 03 Aug 2026 15:13:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785795228; x=1786400028; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=ig95ApWFX9FrE4bSEK82oovW8IQGcBZFRFG4rkok8Cw=;
        b=XkYPlYFONHYKK1UV5kgaycuSakViQuI5VLmQnNlQIJbSFZxfJjecbflN8HqQ976TH7
         BYURaN/DQsPGGWzYntBQ8JL/M3ez/tqUsqY9tlJpzQkCkJ+bNQ2TuUgGsaFkhcIoe/7D
         bNBnerifbzSA9MH86/AU1oLmzHUfUgd+Jk9Tz+J987GJFgPWcEvLS2hvtR+qZp82bUta
         +eaZLHGdj0JDKsuGr+glLEoi7IkqOIp/SXx+asKPNXCWeczeHL01R5gGgExK/CpwNud8
         0Vd4EB1LcLh1RR/2KaBZyx7sj4/aa3w8D7QMDXQGL8KlgPDmTI/la7lrr99hVUjQtJl1
         SetA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785795228; x=1786400028;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ig95ApWFX9FrE4bSEK82oovW8IQGcBZFRFG4rkok8Cw=;
        b=KFO0cqVclmH7WzPRLtHEa/2brKpaYzjnrNMhfS/u356woNtWPgknMx3DHtlYi05sYG
         PGPOxMHDll4D78uOMKj2RCG3r//GkvTjxMYdNMLA/C+IlOqK+RdkOWoWzIDKm75PkGQD
         T6h77lRadM8DkWq3bGZx+NKpgITPDfIYDvvPSyJXb3vATKocMdSQrHvNYdUp+dH668lU
         MtaFuxptiw1wRn6I9hqslp3sKihc/qtB8bAYCYLjL9o1H+0zYlC/YhMivs9vByV0gag6
         Sn5iUZt3/QzLPYKxislI4lQ+gJvOSflmDRAgj+qiPT2x5EbaPuD/+Zrlz1NA9aM29eZE
         i6PQ==
X-Forwarded-Encrypted: i=1; AHgh+RpckeW2QSHxVjB3BHQIpnny2sGVVyGviQr0JteZFXYdssL/hwav1OAcFw757ATfL2IyzYY/uGvMKlM3sxs2fp2D@lists.infradead.org
X-Gm-Message-State: AOJu0YyKnET7tvKo82WoqP9gi6+Wl218h4cjtCDF9WOqj8r6wP0SRhYs
	3O8vdmI01LnHmzNszc7hbP8L5YNvLDC5T4hVrcDlNwuhvDgO1wkBVh663/d9oUJRDexTRrit210
	1dQiAcH+1/RP5pdSDBzurVXZFcf9ihAdSLGfUsl1e6xy+lrQ6aai1aErqO+tm6h/c9Fen6WqWWr
	fb1Q==
X-Gm-Gg: AR+sD10nbmh9TdUOwgbudv3MxymKWw2U+0FleXSRqKINcn0hf8S+Tb7lk6GQjW2JWMi
	lH29pucUw58kQ0VwvVqNWOShOuZF4o3RA0hsJc08XjGEFYIx+06RjkNPptdLR33uJonMroS7/wx
	J8eqbbLM6z0JKxdDcu/bh6I8cLowphuNgPmLzkQNDePNySq3ujeRmgXMNZu/1WJSpFema3rWoDH
	h2zH4Mw8wok5nZCVfvuBH8oiOBO2aBt/xz80aEKACR4hVGoVK8QHniw+bm5ez3FmaXU5YzumIuS
	VzJOStZzvlzr40Js5/XlexdD0c3TjYhH8jRkNAkZeRSvMbwwpe4q01K2dy2OJZiZM1DX9CmiEnm
	IV96JL5zmmJlH83M7EKkjHNRbWg==
X-Received: by 2002:a05:6a21:1fc8:b0:3c8:e10b:7a9b with SMTP id adf61e73a8af0-3c92a58e56dmr11875997637.16.1785795227528;
        Mon, 03 Aug 2026 15:13:47 -0700 (PDT)
X-Received: by 2002:a05:6a21:1fc8:b0:3c8:e10b:7a9b with SMTP id adf61e73a8af0-3c92a58e56dmr11875951637.16.1785795226835;
        Mon, 03 Aug 2026 15:13:46 -0700 (PDT)
Received: from localhost ([50.35.46.84])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3153e06f88fsm40649703eec.20.2026.08.03.15.13.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Aug 2026 15:13:46 -0700 (PDT)
Date: Mon, 3 Aug 2026 15:13:42 -0700
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
 <niyas.sait@arm.com>, Lee Trager <lee@trager.us>,
        Ritwick Sharma
 <ritwick.sharma@arm.com>, linux-acpi@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v7 05/11] arm_mpam: propagate MSC access errors for
 __ris_msmon_read()
Message-ID: <20260803151342.00000c3d@oss.qualcomm.com>
In-Reply-To: <20260731170324.2927758-6-andre.przywara@arm.com>
References: <20260731170324.2927758-1-andre.przywara@arm.com>
	<20260731170324.2927758-6-andre.przywara@arm.com>
Organization: Qualcomm
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.51; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwODAzMDE5NSBTYWx0ZWRfXyjHBTR6NLt6J
 2/oV0I17VIeeBHHi1qm6YtP40HQcFsJeb60CZEND4CByVk/42QdXNQCHJHlU6K2aaYivyhBQRJG
 +eFTyi9sqv68JWDLp+OgAPbUZUCMNpc=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODAzMDE5NSBTYWx0ZWRfX5hcR8NwA6O75
 EeZjVyv7mkzvX+AsAEhQZV88yf906nr8+IzE9fhCAOW+ADKPEXm7VGL4LShBj0tlsh3gbpKU85P
 7h2LFUgiRMWBDPI/IhwXkGquuXWWUFpoYeNyAA2AK9XN4XZfiq4AZuGa2PhfQzTPYokK82kmY3X
 5dA6Gh0xB7s874wyGZqI3m2u8axSomboFBbnvo75z/EFwzVowhhvyJSIGb7AYlq8peZClOwAyuY
 wOCITpYj5kcKQjSSeQ92ehB3XyTQyH5/AcNlrsCEP0PlAN+uFeaNLTcEk+0yylMolHTHdpNV2HH
 2hQeqBlCD2WBpAksSrB4Ie3etq+6xbHJ+6BHd/7TutQWaWNl57XfjTPik6WpoP4vvb52To6P77P
 IFXVLTDY9kvnsK+OYpJXXLx+hGcqX5mDCpoG5hqnHGoxkRP800HFt8aezx9U8CBBCu17+JaMX5y
 5w/UYbJxRp4dkcADe6Q==
X-Authority-Analysis: v=2.4 cv=RNSD2Yi+ c=1 sm=1 tr=0 ts=6a71129c cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=qC1CW/w66vtJz1P9yTJxNA==:17
 a=kj9zAlcOel0A:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=7CQSdrXTAAAA:8 a=EUspDBNiAAAA:8 a=gj-DCe7_c4ZTHBUR5qIA:9 a=CjuIK1q_8ugA:10
 a=bFCP_H2QrGi7Okbo017w:22 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-GUID: TAZdATT6iOeNNw8znSAexPoR_GAmRwQ5
X-Proofpoint-ORIG-GUID: TAZdATT6iOeNNw8znSAexPoR_GAmRwQ5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-03_05,2026-08-03_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0 clxscore=1015 adultscore=0 lowpriorityscore=0
 malwarescore=0 phishscore=0 impostorscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608030195
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260803_151352_207250_0412DFE5 
X-CRM114-Status: GOOD (  24.42  )
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

On Fri, 31 Jul 2026 19:03:18 +0200
Andre Przywara <andre.przywara@arm.com> wrote:

> Allow the function for RIS accesses to return an error, and propagate
> read and write errors from the lower level up.
> This function is a bit special, since it can be called via an SMP
> helper, so the prototype must stay as void. So propagate any errors
> using the "err" field in the struct passed in as the sole argument to
> that function.
> 
> Signed-off-by: Andre Przywara <andre.przywara@arm.com>
> Reviewed-by: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>

Just taking a fresh look and one really trivial formatting thing
popped out.

> ---
>  drivers/resctrl/mpam_devices.c | 36 +++++++++++++++++++++++++---------
>  1 file changed, 27 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/resctrl/mpam_devices.c b/drivers/resctrl/mpam_devices.c
> index 9d9f0c635527..fa8ed20a6740 100644
> --- a/drivers/resctrl/mpam_devices.c
> +++ b/drivers/resctrl/mpam_devices.c

> @@ -1390,18 +1398,24 @@ static void __ris_msmon_read(void *arg)
>  			  cur_ctl != (ctl_val | MSMON_CFG_x_CTL_EN);
>  
>  	if (config_mismatch || reset_on_next_read) {
> -		write_msmon_ctl_flt_vals(m, ctl_val, flt_val);
> +		m->err = write_msmon_ctl_flt_vals(m, ctl_val, flt_val);
> +		if (m->err)
> +			return;
>  		overflow = false;
>  	} else if (overflow) {
> -		mpam_write_monsel_reg(msc, CFG_MBWU_CTL,
> -				      cur_ctl &
> -				      ~(MSMON_CFG_x_CTL_OFLOW_STATUS |
> -					MSMON_CFG_MBWU_CTL_OFLOW_STATUS_L));
> +		m->err = mpam_write_monsel_reg(msc, CFG_MBWU_CTL,
> +					    cur_ctl &
> +					    ~(MSMON_CFG_x_CTL_OFLOW_STATUS |
> +					    MSMON_CFG_MBWU_CTL_OFLOW_STATUS_L))

Indent seems to be wrong here.

		m->err = mpam_write_monsel_reg(msc, CFG_MBWU_CTL,
					       cur_ctl &
					       ~(MSMON_CFG_x_CTL_OFLOW_STATUS |
					         MSMON_CFG_MBWU_CTL_OFLOW_STATUS_L));

> +		if (m->err)
> +			return;
>  	}

