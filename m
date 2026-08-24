Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF3C0C5DF94
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 24 Aug 2026 11:52:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LzxqMflwKO5Na/m08OoIrLLFXSwEw43l+/aNS8d0JqY=; b=YBG30cr643UWm8lGEmJbM7gv9P
	zuu694C5ysPJsuaqmwNc2EmBAbUsxVIz9lOPFAxTJSB+V2VZHiKOqaz2OmqEVsfgeA7juGrML3Gy9
	TSNczw4DXhlLsaq7hQBjWCgoWrmDGoD9edMI73R54FTwft65CLzElJtddCi/5y+iPr4yQwzXgGeUZ
	p2PbIOjgXiHHavottlLtL6FxFKWOl1EAjN+5DjlyoQznWkqGFmpCDn1t6CjScBXdQi7sdTGUCEIlp
	hgNmi5L68q4mTObiCwMvLYFjOtKWOnKeBjQZBlzVagDOf+MMvYGeE8TPjH5LG+GHXDxvVZl+1VSV7
	gsXAdOEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyTE4-0000000GYFC-1eHh;
	Mon, 24 Aug 2026 11:52:28 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyTE2-0000000GYEd-1bKl
	for linux-arm-kernel@lists.infradead.org;
	Mon, 24 Aug 2026 11:52:27 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67OBMKMe2274632
	for <linux-arm-kernel@lists.infradead.org>; Mon, 24 Aug 2026 11:52:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	LzxqMflwKO5Na/m08OoIrLLFXSwEw43l+/aNS8d0JqY=; b=F/BgdSS8clS99KgE
	ln/Y7Q00FCX+nGtbe/+Yft7sGhFr7OTYFucFgL66UgGRIcAAfrAleITNFt3cUDHU
	PfjVrGutPfdPBFxvd+SO06Eh0yg6RokbEaFtEbEJQ6Gipe2t931xLgpwV5ezY4iK
	Wo11KVugOMXaNmP53Mqt6gY57ygEWZsdpOW3Hxw2t8Y5Q2GUboNUCgLOzkw9Dqbj
	iuzfQa1BYPIhXwxaG1ZcW6Oi25netVd3e0obdIafEGQHou25mW6aob4XuCOKDINq
	4bg/DjyYUJ66k2hR7QS5W9SHvWYfJjKA+vVn1Ravono2PYDMOWR42Fm573gF2xV5
	eJTXEA==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g8kdsgf7u-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 24 Aug 2026 11:52:25 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-84e3d575d6eso2154363b3a.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 24 Aug 2026 04:52:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787572345; x=1788177145; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LzxqMflwKO5Na/m08OoIrLLFXSwEw43l+/aNS8d0JqY=;
        b=C6HVB7frORoCk9nsJeZTlZhvuvWXz7AhiiG2XxNdJX2xIIyp1bDnlKOWKyU7yL22gP
         w3xdK8pEuegq3MuPBLsU2eylRHwC8RazRxgMRLpVFs7ah1W/bVEiP023BSkX15RZsPvo
         uvW9XU5CLuVhqccKlHNEX6ahYk51cTDoLpuTBK2UD5+HLBRKvPcCch2XYTInAq3qgcC3
         P5Mmw3giqXTtKwKjvOufIG9zQXp8hrEM2Fmm/xULg3PBqIapGHv0H6STQlLS6WDFW9lL
         hITaVlTIUR9mNKUXe92yHZkLppu2/J9htpE1MBQz+kCguFrOV/5eK6KOE2bNbn2C+I6F
         PB0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787572345; x=1788177145;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LzxqMflwKO5Na/m08OoIrLLFXSwEw43l+/aNS8d0JqY=;
        b=FdkrxAMAEoslvQbFTn3C5Pdvc2TWRaa5pMDAKNXVYegvbCMpaQB9lR+qf/GEBUbSon
         bzRoUbJXy/82TZLK3sA2r/WGJrgw9FvSTBvMB3d/1fiQhSNpV5vAP0bbSlU8JWMVzqcl
         TPJ1+1F2sps98tum0fFTEfp7qRqo10V24mbwVATS+NkthiCi/YzqBWfhTiseeqOssaxY
         cvjicDxgA3txH94eJQZeebumxFYYJpXl78aqhGJc90xFsb225FfWy4UGn8cxdOuBXnDv
         5tM0iXWi9Hk4YdYM66lOMsR9lh7HMiU5SbZSnw6U7GGOsrGsEqxx/eQhUt1fySC+dF3U
         blow==
X-Forwarded-Encrypted: i=1; AHgh+RpWtN45VhTvEZG/z8+81s9IH5AVAsLh2cUzzT9WNkxg4gOQxBd4s2ZxoYJS39oNzPs91VPja40krU3j37l/y2QJ@lists.infradead.org
X-Gm-Message-State: AFuF++nDhXZ1hCrXiljb7X2kyB5SZMj+D1uHXfHlDxNPeBHHBHvD3Hji
	orwOcWsZpZW8w4VFO63CYgB6QIqafs+Lut5nzCCD4IHuE2kJ0uRP85WqdMi4pqeSIjgwI2mL9IA
	0k+miqYRaoK+oz+AUJ5cUZxiIjAq42kthNrWe9eqnH7WAAPe//T2xvPWZIs4f60dF9c4rRrym5d
	cRHg==
X-Gm-Gg: AR+sD13sT0ULi+mZB140KUTvNIpIXvoDO7TBWc3eihNzF5yU5oHkIvdIMjqORq0N/2p
	zbNW118NZaoCwItjGHOfwIz3nx+fjl5aAPm6CwRciTvKpG/2hSh+zBB447lfi4WzJAOy0pn6RVz
	HWj3cTM0jUNEPv/y+KIrUb6VBBWpRzuc/pi8IpagUd5KT/3HxBEMGAtaCiaByC3VJotLWzbhqR5
	+fr4No8sOvfYCMYNnfgsUOGEXjWRiWa1+DL2hsQgsnn5GqYD2JKUIhvICaXKiWtOetcaAe/AiZg
	MX0Qw4HpQsHb8zjHB3U4vvQkknQ2ZIY1TcfmNF4FNHV64jAYX8T84uFSJsT9/4SLzby5Mo5ur9s
	xGHasXVthFmh1WVQq4Rh3R3T/qkFFBXbMkZU=
X-Received: by 2002:a05:6a21:888a:b0:3cd:3e77:1dcd with SMTP id adf61e73a8af0-3cd3e771df5mr36827807637.1.1787572345245;
        Mon, 24 Aug 2026 04:52:25 -0700 (PDT)
X-Received: by 2002:a05:6a21:888a:b0:3cd:3e77:1dcd with SMTP id adf61e73a8af0-3cd3e771df5mr36827697637.1.1787572344804;
        Mon, 24 Aug 2026 04:52:24 -0700 (PDT)
Received: from [10.217.218.158] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cc199e4b1d6sm885985a12.15.2026.08.24.04.52.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 24 Aug 2026 04:52:24 -0700 (PDT)
Message-ID: <3eb3b7ed-88d1-4185-accf-c81c14b1d408@oss.qualcomm.com>
Date: Mon, 24 Aug 2026 17:22:17 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/7] spi: qcom-geni: Use geni_se_set_rate() for setting
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
 <20260805-derive_clk_perf_tbl_from_perf_domain_opp_table-v1-5-61171ab1cdce@oss.qualcomm.com>
Content-Language: en-US
From: Mukesh Savaliya <mukesh.savaliya@oss.qualcomm.com>
In-Reply-To: <20260805-derive_clk_perf_tbl_from_perf_domain_opp_table-v1-5-61171ab1cdce@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI0MDA5OSBTYWx0ZWRfXyCKuWxOWL/9P
 O2hkDiCSpp58Sre7u6Ccg0IwImKDsz85iw5xm6XS5Cvi7uLcZF371qqBewhY1EMLmk9OWP+9PzM
 nFnFpJGstHLwIpPVfZfMKZHD24/aQcY=
X-Proofpoint-ORIG-GUID: Y2371wfVNtFm2ZsZCBcJstAIPC_WgoOv
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI0MDA5OSBTYWx0ZWRfXzThNhx21G00d
 HBtUVv0Y8fli7eC+SWD+4R6jTK6bTI8f93X0eKSplgP1ades5yMRFRssdJCXYGF9EIk2nUK8dCk
 Dw7Ys8r8xqYTDq7njQexCgzt5yok3WCuuq0viSPyuinAouurEaTzPtfSzvXKtNU3z3XUifmSDmG
 RnHMVpnqvF1/jv3ZpREyTMX/TtN8EGY+nOmcwgvaA1ANSqEZf8lV4NoTnxp93Bo8HjslkMeWK50
 MAWNYMh6zzI5/xIdaDuDjZuQWfWQiQJMG12/HcsRHAb9MwgLSijbWlPzQ5Hdc3EDT4XBsafMY93
 Dr0IIzXGgCVS3O16b6Hm41rn8/5b1BbEeCiCv59ViliAiQ+czu6KU0wS3dWgTTaiSpDMNFx7Lcm
 Di/3of+H0PRFsyLPVXhA5i5iJtkN2nMRcRFl9wn7GneMgp7WwSxFT25MTTrzQiIVaSusrZKB3Ca
 9+dzXLz5MflZFZWDGVg==
X-Proofpoint-GUID: Y2371wfVNtFm2ZsZCBcJstAIPC_WgoOv
X-Authority-Analysis: v=2.4 cv=d8DFDxjE c=1 sm=1 tr=0 ts=6a8c3079 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=dtH3bwBEVQU6Jqvc-V0A:9 a=QEXdDO2ut3YA:10
 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-24_03,2026-08-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 bulkscore=0 adultscore=0 priorityscore=1501
 malwarescore=0 spamscore=0 phishscore=0 clxscore=1015 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608240099
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260824_045226_436759_12BA871A 
X-CRM114-Status: GOOD (  21.39  )
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
> On the SA8255P platform there is no Linux clock handler for the SE
> source clock, so the driver has no way to look up the source clock
> index and divider needed to fill the GSI CONFIG0 TRE for a requested
> transfer frequency. To work around this, firmware instead exposes the
> SE HW supported source clock frequencies as OPPs on the perf domain
> device.
> 
> geni_se_domain_attach() now populates se->clk_perf_tbl from this OPP
> table at attach time, mirroring clk_perf_tbl on the Linux-clock-managed
> path. This lets get_spi_clk_cfg() call geni_se_clk_freq_match() to pick
> the closest supported source clock frequency and divider on SA8255P
> exactly as it already does when a Linux clock is present, and fill in
> the GSI CONFIG0 TRE accordingly.
> 
> Switch get_spi_clk_cfg() and spi_geni_runtime_resume() from calling
> dev_pm_opp_set_rate() directly to the new geni_se_set_rate() helper, so
> the matched frequency is applied to the correct device (the perf
> domain device on the firmware managed path, or se->dev otherwise)
> without the SPI driver needing to know which resources_init variant is
> in use.
> 

let me suggest little compressed commit message removing some duplication.

geni_se_domain_attach() now populates clk_perf_tbl from
the performance-domain OPP table, allowing firmware-managed
platforms to use geni_se_clk_freq_match().

Use geni_se_set_rate() instead of dev_pm_opp_set_rate()
so clock programming is handled centrally by the GENI core,
independent of the underlying clock-control mechanism.

> Signed-off-by: Praveen Talari <praveen.talari@oss.qualcomm.com>
> ---
>   drivers/spi/spi-geni-qcom.c | 17 ++++++-----------
>   1 file changed, 6 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/spi/spi-geni-qcom.c b/drivers/spi/spi-geni-qcom.c

[...]

> @@ -150,9 +148,9 @@ static int get_spi_clk_cfg(unsigned int speed_hz,
>   
>   	dev_dbg(mas->dev, "req %u=>%u sclk %lu, idx %d, div %d\n", speed_hz,
>   				actual_hz, sclk_freq, *clk_idx, *clk_div);
> -	ret = dev_pm_opp_set_rate(mas->dev, sclk_freq);
> +	ret = geni_se_set_rate(&mas->se, sclk_freq);
>   	if (ret)
> -		dev_err(mas->dev, "dev_pm_opp_set_rate failed %d\n", ret);
> +		dev_err(mas->dev, "geni_se_set_rate failed %d\n", ret);
little verbose - "Failed to set source clock rate %d">   	else
>   		mas->cur_sclk_hz = sclk_freq;
>   
> @@ -847,7 +845,7 @@ static int setup_se_xfer(struct spi_transfer *xfer,
>   	}

[...]


