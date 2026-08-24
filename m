Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49A4FC5DF9B
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 24 Aug 2026 13:42:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4nn3T1t/sB7+ffZyruvK0mZmx5y7OMfO+jTRwc/O4fA=; b=FP86w7DrarFdY6olU9R3a/N9aS
	BCvYlbAS2t4Z6RmRi3JAWrsHPBPuuaE0cFAX+rOJNp6MX04XvT/Q/5mIZz7LY6gjjqtw95O5zduch
	dNr8j5xOXm9hrLhA5A2bpAKXjwAycRi3dSt8OoPW4V5vkcrf7KY8t1pF3eI8gDPyL8ABlaYHyRjhZ
	7zX85QuJvSyVcTn4pbLj9UBjah5xfJZHokPNetynpcrjxFiLRQ8NxugDwwgRK2RRA47dilXTsM4t3
	aqJXOhThfQSz8XiuxQrinbC0vhReAR90kpm+r3IA6763Bjq7J19GBTR/TOSfzvL3ha/IbAZsemv+u
	k0OPPN4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyUw9-0000000GiaK-0P6l;
	Mon, 24 Aug 2026 13:42:05 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyUw6-0000000GiZR-47ys
	for linux-arm-kernel@lists.infradead.org;
	Mon, 24 Aug 2026 13:42:04 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67OCv8Ul1881185
	for <linux-arm-kernel@lists.infradead.org>; Mon, 24 Aug 2026 13:42:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4nn3T1t/sB7+ffZyruvK0mZmx5y7OMfO+jTRwc/O4fA=; b=WeLnskcVZok8Wavb
	M2odJvv5d8hV/LD5NQp27uGONnXiEafmZkgE5sg4Sjf62xEqH6D74PlYl0xvO93k
	04Nf71ranEH5xPy5z0e3iywNAYhUMUYubaMk4JJuiaB96nxzuCr2V1j4tDc6E532
	QIvjOdRcqyjgE8N3Q8xqz+MfZ8Kji5dpI9gtXa3WF7BB0cDciV6AQbmcYwLgomM0
	ncmZVxqqqEhympv/jZRilWh5VIj+SUsAw6kEqxFmF9kaMZCtIjahq06Oli8t5Ztv
	dSrGJp+Q9Z56fnRzHeENNT5x3XMjMHLskW9MSF3lk3vyLfyR+sGuaN01L8jXNyxJ
	GVv6+Q==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g8huf1fw6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 24 Aug 2026 13:42:01 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2ce8a76df2dso64805385ad.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 24 Aug 2026 06:42:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787578920; x=1788183720; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4nn3T1t/sB7+ffZyruvK0mZmx5y7OMfO+jTRwc/O4fA=;
        b=Pu01vOkM7ptq0B6GWyC+MwBAwizCE+diRlq+IIYiWc2BN/x+P5688FptLZGFpGUbeP
         9RjtIswNHontqJwkWzGyK9KVBPyJZYuIgV2L6QfkhE57kAG3FIky65Q8AIO5FmYgNTf5
         yBIx6Dnnv4Kl4GpaQImo8b91/JR1cP3Yy9cxIGBynbbhIfYz3XDXhD1aY7QGCK6Snra7
         MwtEw2IL9HN18XdAtN4K0LGglA6c5TevNFyJamhuF96fszk+3lSlAlWU7gTnq0kWe44J
         ZZSA7YKgTPneppGENrLlESOUsa5/C6jOoadDhy07zrguUBJfq+rWd/QClCJHwSWJsCR3
         2omQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787578920; x=1788183720;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4nn3T1t/sB7+ffZyruvK0mZmx5y7OMfO+jTRwc/O4fA=;
        b=qZxcbTrfhjHiPhUFNTl4bF1OGJhs1sABZEeeVmmpW2bEkbdzXbkgwYqbOe3K79XKFz
         subiNfxQdsVkHzM/qe7JjkClDNoQDuQQExqKo0D00hWlMa2U5yYWQNpyOFfIwzNZ0GiV
         aQyT2Ymq+CMFLfe7Zh07Rzrn/cFBYR7zWGY1TQNib2TjMURPlhCmNQ1QPeVdKXJFkxCh
         dk/7dgCmi3iDDvyx48V7PgTUO0JhudZvKcEPcV4BFI6oLyJ7cXnArJZuvELdCyJNUdny
         ys8sSjiUGB5UOWGgSTU37KCnW2/W3WCMiW5b/YqplS9QIhBifpBOcuLh1Vr9GxpE0zS9
         IQfA==
X-Forwarded-Encrypted: i=1; AHgh+RqTyyy59ZTCYFgKJpchRFQhzAIYkM7XypSidHCdegWnffDE+ry8QI5AhLca7uzbwl8TnfFHjgssyVj/KPGBvOUP@lists.infradead.org
X-Gm-Message-State: AFuF++kMTcQ0Dt6pVJzV21gVDegFCZm0a7oh8gykb1kt80G/ImsERfMJ
	qRqUtu2SGi99BTde0cuSun/LsX77HD69jsXAAIebtl1LjJ6jKHLBSgyJQ2BcE5BYWvxYSIRmEwO
	tqxsPUBWegpB30s/IdsAao8WWov+bYKO/QwpxMZZHAK42gXOgY25fj96vEF4y28Aksidt0QbECd
	2dhA==
X-Gm-Gg: AR+sD11pP4RKHIwiO7ITWi64RZ375mUpyd37aAA52RF0j7XWvThV3c53meFjKVOpwW9
	o/ZW4wMD20igpla2ouNss6UMEhytdf8E+ffbs5N4Mp6NQuJuz2VaS7VWdnrpix0D1souNx/ApaE
	6l7Dt6InnSZv8ekISQYmDJ6UtbPnkZyXoreXoyI5j5lWozAi/ldbp09r/Wh1+IHiKRAuRDY32Xn
	XwbHUgpOPv5m9diJALx+1YVL3ZyWuqmlBet2sfCT1OkC/qXfRtcOX5HZUAdHObwTvXYIT2yZRR+
	GVoT1UByPA6cuOX4w4W6AZ/1c5BvqKP51ojD1w+PEQcrRLvvOBU1Z4FVa5a8/4Ygi0A58SAJjGv
	NTXrq7LWL4nbwjPWyDdLJTPhjH8rv3/T+VNk=
X-Received: by 2002:a17:90b:1b41:b0:383:5a16:bd70 with SMTP id 98e67ed59e1d1-395c39f97e8mr42709363a91.16.1787578920173;
        Mon, 24 Aug 2026 06:42:00 -0700 (PDT)
X-Received: by 2002:a17:90b:1b41:b0:383:5a16:bd70 with SMTP id 98e67ed59e1d1-395c39f97e8mr42709251a91.16.1787578919646;
        Mon, 24 Aug 2026 06:41:59 -0700 (PDT)
Received: from [10.217.218.158] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-395e42d6139sm10107597a91.0.2026.08.24.06.41.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 24 Aug 2026 06:41:58 -0700 (PDT)
Message-ID: <8af7a34a-da4f-492f-a51c-cc420edc5e6e@oss.qualcomm.com>
Date: Mon, 24 Aug 2026 19:11:51 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 7/7] i2c: qcom-geni: Use geni_se_set_rate() for setting
 source clock frequency
To: Praveen Talari <praveen.talari@oss.qualcomm.com>,
        konrad.dybcio@oss.qualcomm.com, Sudeep Holla <sudeep.holla@kernel.org>,
        Cristian Marussi <cristian.marussi@arm.com>,
        Ulf Hansson <ulfh@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jiri Slaby <jirislaby@kernel.org>, Mark Brown <broonie@kernel.org>,
        Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>,
        Andi Shyti <andi.shyti@kernel.org>
Cc: chandana.chiluveru@oss.qualcomm.com, arm-scmi@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-pm@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-serial@vger.kernel.org, linux-spi@vger.kernel.org,
        linux-i2c@vger.kernel.org
References: <20260805-derive_clk_perf_tbl_from_perf_domain_opp_table-v1-0-61171ab1cdce@oss.qualcomm.com>
 <20260805-derive_clk_perf_tbl_from_perf_domain_opp_table-v1-7-61171ab1cdce@oss.qualcomm.com>
Content-Language: en-US
From: Mukesh Savaliya <mukesh.savaliya@oss.qualcomm.com>
In-Reply-To: <20260805-derive_clk_perf_tbl_from_perf_domain_opp_table-v1-7-61171ab1cdce@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI0MDExNSBTYWx0ZWRfX4lcutszGHdmx
 qcrN5eEaOtt13+oLf1qqvoggt7ZCV7+nMqWD++EovDH7a/Vnb3CpPtPOtAmZ7QuRcuReU7UduPg
 D1q35sTV+xa8uLjXVjQ4KNJH4NHRBUU=
X-Authority-Analysis: v=2.4 cv=Wac8rUhX c=1 sm=1 tr=0 ts=6a8c4a29 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=bL_AZauQwEGehf-WiMEA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-ORIG-GUID: hx2erLb5qXi85PgrQ6Y3R6jpgGnOD5JU
X-Proofpoint-GUID: hx2erLb5qXi85PgrQ6Y3R6jpgGnOD5JU
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI0MDExNSBTYWx0ZWRfXx9R0XpqJXNno
 lOg8jQfzJ1zFz+HPBo9Zm9rciMjovFCLJeuGtVox2glIiO9zoUTZ7Reyj1Wm9niqxMIyTaAmNf4
 MA6W7syViL0Kokv8hHgpt0IIKdy2kw1jNYzGJvN9hMoW7h3XismXCYvmWGzDLr9APDycK5530HA
 OxzvzQuwmTX3xoHaTdQaPGJPOK+eeHohGexZfACrHuZaZhvpYOh4CbaLzIqN4Sbv0g/i2k7thTU
 GD1XgYr72JS7B9Pyu5mj2j3b9eaFY0+B6VCAJCk2lZGyAuOwFrdAuko2aOJXJiUFvTf9utTrLdb
 NLit86DcZSc9sRmUVFzu4bBzsh+l4xxkS6ky27nbxgeOms4UVEBXRrfcNgk3Pi+nWpUiVaysAh8
 ckkWW1w00SeInFTQudcXfIkHGBEkboWxwV5aDyAIEGgh+zTX+CiDYvt6Nanl/q7tF2/YmQgmCi7
 whD8SUy7S5CyJpCQjSg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-24_04,2026-08-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 impostorscore=0 adultscore=0 priorityscore=1501
 bulkscore=0 lowpriorityscore=0 phishscore=0 malwarescore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608240115
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260824_064203_143018_58B845F8 
X-CRM114-Status: GOOD (  23.80  )
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



On 8/5/2026 1:27 AM, Praveen Talari wrote:
> On the SA8255P platform there is no Linux clock handler for the SE source
> clock; resources are instead managed by firmware via a genpd performance
> domain. The I2C driver therefore relies on geni_se_set_rate() to apply the
> fixed 19.2 MHz source clock frequency expected by the SCL divider and

somewhere it's 32 MHz also and this may change too ?

> counter values programmed by qcom_geni_i2c_conf().
> 
> Call geni_se_set_rate() directly from qcom_geni_i2c_conf() so the
> configured frequency is applied to the correct device (the perf domain
> device on the firmware-managed path, or se->dev otherwise) without the I2C
> driver needing to know which resources_init() variant is in use.
> 
> Drop the now-unused set_rate field from struct geni_i2c_desc, the
> geni_se_set_perf_opp() usage on the SA8255P variant, and the unused freq
> parameter from qcom_geni_i2c_conf().
> 
> Signed-off-by: Praveen Talari <praveen.talari@oss.qualcomm.com>
> ---
>   drivers/i2c/busses/i2c-qcom-geni.c | 13 +++++++------
>   1 file changed, 7 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/i2c/busses/i2c-qcom-geni.c b/drivers/i2c/busses/i2c-qcom-geni.c
> index a23554d101fd..4561e2d235d5 100644
> --- a/drivers/i2c/busses/i2c-qcom-geni.c
> +++ b/drivers/i2c/busses/i2c-qcom-geni.c
> @@ -213,11 +213,11 @@ static int geni_i2c_clk_map_idx(struct geni_i2c_dev *gi2c)
>   	return -EINVAL;
>   }
>   
> -static int qcom_geni_i2c_conf(struct geni_se *se, unsigned long freq)
> +static int qcom_geni_i2c_conf(struct geni_se *se)
>   {
>   	struct geni_i2c_dev *gi2c = dev_get_drvdata(se->dev);
>   	const struct geni_i2c_clk_fld *itr = gi2c->clk_fld;
> -	u32 val;
> +	u32 val, ret;
>   
>   	writel_relaxed(0, gi2c->se.base + SE_GENI_CLK_SEL);
>   
> @@ -233,6 +233,10 @@ static int qcom_geni_i2c_conf(struct geni_se *se, unsigned long freq)
>   				 itr->clk_div, itr->t_high_cnt,
>   				 itr->t_low_cnt, itr->t_cycle_cnt);
>   
> +	ret = geni_se_set_rate(&gi2c->se, 19200000);

hard code ?
May work currently, but if higher frequency support added, source may 
change.

Also you have added in commit message, but add a comment also here.

> +	if (ret)
> +		return ret;
> +
>   	return geni_icc_set_bw_ab(&gi2c->se, GENI_DEFAULT_BW, GENI_DEFAULT_BW,
>   				  Bps_to_icc(gi2c->clk_freq_out));
>   }

[...]


