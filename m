Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 886FEC55196
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Aug 2026 22:17:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=U/aBEbyITsGpQyxAY6tp7ki8lSr5wOgar9R8n9o6Jkg=; b=BKWSsc28oPF46WlHSvEEuuWMa5
	gswtwsfn1T4RlxA8WSFfFrEPnn7f7WBFIPFVSU5DDUwa2UfRdUYqN6GQjmeILe4s07vM+Hf8b374F
	2kY0zxEI2pSZT2ta1dZu5w+REtaxqbLNf9/gs/XdjntWLelLj/879eykK2fS3fazCKnLSfD19PITS
	/NwSsOmbThMyS1jdVfURIUJrWwlO7r0/AqB/midQ80qXzfy1xhSuCXwyxl4FRHuZj6l4QyY+3RPeG
	KG+egtv8TRvVixWcAWJLMkxfnJZ+64wQG8ScKWnaydF9eKwD7Y3CiOse8n3B7SvdCC6DAX+s40/v0
	cjXuSYxg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wr0yC-00000000aCa-0f3p;
	Mon, 03 Aug 2026 22:17:16 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wr0y9-00000000aCD-0j3G
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Aug 2026 22:17:14 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 673K2orO1708104
	for <linux-arm-kernel@lists.infradead.org>; Mon, 3 Aug 2026 22:17:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	U/aBEbyITsGpQyxAY6tp7ki8lSr5wOgar9R8n9o6Jkg=; b=ARY0490U81Yk+gJM
	EN4Ga8z3S3iHGpqDYUrdQ+OmU16PQ+cvdXOy5pTD7kSVRRfEj0rwdkMpYePBxpgu
	7gMsK9eTTY44CrxYvFXHFmZwjoreckigJWCe381vOWV4cQ/mKW+gMMIh4Rabi9W+
	n+JXSqCbrbOhb0zOrVEpiEK/R8ECuBzW36EDGhqhIO+Tkn38kS/hWZ3T1YBMoP6p
	LpLq0CTeCZHT4+ZC33I2LIE4LjKBLmfTEraT8pVS/B9QXlgH1aHFPRMdRtGthOd4
	L0/tFKVIEnohYlWnvL5Hrtzf97lkAtktxJc+ZmfDXFWeKGvSFvOeOT7O0torGN0G
	v7SEug==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fu1p88gfv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 03 Aug 2026 22:17:11 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-ca6bd8a190cso4924486a12.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 03 Aug 2026 15:17:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785795431; x=1786400231; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=U/aBEbyITsGpQyxAY6tp7ki8lSr5wOgar9R8n9o6Jkg=;
        b=eTayZ1isgtsIMWKYIOj8D3NW95wWNcamHL3MAV0UW6iGltrjDqoT17o4BUSaoj7CJ5
         zZ0GrquiBLhPMC1UEpnRhCJSd2bq3GaldJhD8PIz7EZjy800hI7sMYHUGkwmvCbVGGr4
         ByAwgdnI38QDJ6fC+nnyJQhYMMIbE4VHFvdkeG3eTY/b0ty+4AM+pvtewjDgvUhB5+a1
         K2IPd0oE9yXuNZCrEexgYhblCuMEHhw76+iPH5Av17+8OWHz9OqgQk8PnVWhNa2mj9FR
         vyj6Ep4JufbK1PvyIXy6FCOAF+fJNdbe30Ti40ZfRTxzazIEYL7+6lKGaBG/WabQGCQ6
         6NiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785795431; x=1786400231;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=U/aBEbyITsGpQyxAY6tp7ki8lSr5wOgar9R8n9o6Jkg=;
        b=ZUsxv4yItTalS4GIR1b9DR7qK3iweC8acsFOHn8ErMnuhl8ospQAD/n9LfElBwRxOq
         1ijbCRrfQVfB10JOzn9JxiOW0ViD34kQ80O0Qw0IwqjietyI8Hckvtkjr7mmpWcvioo7
         mNpWSr2MPnlDdEXLXcHS4hqIAQjEeHu8xuDJT/ZtBWkgmEptcka8F3RRhLsrQJxwZyO8
         sDBWjdF41Iq1mq5UD77WXJ/eO65CZHyJG1jNMoTpK4p2IxkjhR/vKZG9YyOSrQN5moXg
         Nog+hPYnGdyfB0q/HOOmWx+LNDGqC/L41u+a+Gyg3B5UkcTOYd14yA5VUOG5TQs4tdPL
         zbjA==
X-Forwarded-Encrypted: i=1; AHgh+RquCF8Wa9BY1tYdFtELrEG+PLftZTWev3hfPLmsse+OKqYUfrbVgpAPwOnwfFINnZWSNkv9RKheqYc4/eoTPtnT@lists.infradead.org
X-Gm-Message-State: AOJu0Yz8NeyjdMv3z19S4rA85hHxRZpvgw28U+Xi1+54PFRKBE/Y8YIn
	5oT0MX6Zbb7cq6S2pu/LH5o3hMfCluKWZ1tnEOAFayQhR9tA5/+85HdrotA7rf6rJCPuebtIiwf
	41ic5ndKnUgPy2nuxVMUu58RVzu1QJgldkbcOm7x1pyPBOQNJVArAieH39h0AAkJdQVzklgkGvd
	pocg==
X-Gm-Gg: AR+sD10YZwttGxhYZXKzvZzN04EZcpdHL1CAFaMQZJKrBPJKeqYrOZV5S6u6B7xt13U
	pk9G3ujF8iTMbyKDO5K2mbmGArCJ7wKz0z7TEhW20qtfJZQn2N9bUCluaFr5RXIRykcGjYJL95N
	HBIRxL3cVUmP+dkXVCBsB4cawLw1UDk8euaq0RZbBo1T50fpUeFSdp8sa7C3o1GAgEukZYi1yTM
	DUV0zd+vpZvE8IQr4Tfusj236P93PYIY+fWzm8LGetZWhqimGpqZ6kWYh4hLGYH9oF0taohZIq/
	JwDgRytmd9JBOSODF/N3azFQK9ppIoDbY0K16yQumM1ftw4X7/Ectkouo0DiRr0o+BXfB5xltl9
	674xaodSp8FurQPCf/6zRCx0/6g==
X-Received: by 2002:a05:6a20:2d09:b0:3b1:cce5:9140 with SMTP id adf61e73a8af0-3c92a75ec8fmr11363103637.33.1785795430850;
        Mon, 03 Aug 2026 15:17:10 -0700 (PDT)
X-Received: by 2002:a05:6a20:2d09:b0:3b1:cce5:9140 with SMTP id adf61e73a8af0-3c92a75ec8fmr11363071637.33.1785795430445;
        Mon, 03 Aug 2026 15:17:10 -0700 (PDT)
Received: from localhost ([50.35.46.84])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3153dd4f197sm43287766eec.6.2026.08.03.15.17.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Aug 2026 15:17:10 -0700 (PDT)
Date: Mon, 3 Aug 2026 15:17:06 -0700
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
Subject: Re: [PATCH v7 06/11] arm_mpam: propagate MSC access errors for
 state saving function
Message-ID: <20260803151706.000027e6@oss.qualcomm.com>
In-Reply-To: <20260731170324.2927758-7-andre.przywara@arm.com>
References: <20260731170324.2927758-1-andre.przywara@arm.com>
	<20260731170324.2927758-7-andre.przywara@arm.com>
Organization: Qualcomm
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.51; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=A5xc+aWG c=1 sm=1 tr=0 ts=6a711367 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=qC1CW/w66vtJz1P9yTJxNA==:17
 a=kj9zAlcOel0A:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=7CQSdrXTAAAA:8 a=EUspDBNiAAAA:8 a=CJK1izrmERu_2sfnVPYA:9 a=CjuIK1q_8ugA:10
 a=3WC7DwWrALyhR5TkjVHa:22 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODAzMDE5NSBTYWx0ZWRfX3RpUXUF3jdyh
 /xK1ZmyztdWrANtKyBUup3gs76gdtUMiCVdVLJee/Dw4BAgaTh+TakQ/OWU++OFXdgS/UGqCAtn
 WDprewxr68kWj37wMQfOU6GmNN5J+PeFCNSw8ohEbW3vCotHc84XssH1uzfn+t3Vx7HWVms4+u6
 E8DJx4usTn7tl0Y7FHShQAsHXbgSS9icQXuYez/T8tjPEv5UO5N7OAnYBFfGbJ7m8j+rvtpTUAk
 ca+dzkP1nGR1KQKlVv66udtOOCG0QHOsKG8AbKLXp52aMB73broTjwJwJR7W0RYz4n+qQ5IW3Ig
 EqMPJ+1AqwxrfRDGbjJy1Pto747EomyQMzl75FZ9f1ir2x0qnBpM7FAI43SBbR+jqJwrgmdQUMk
 s/QWnUBFSOlsHkmOk7IiG8KPTqiT/F0Kol/tTvEc2+N0inMvl08bWqjcu4DZMIDKp6biQW3opUk
 l0ec5NUL2bPO8eJD3jQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODAzMDE5NSBTYWx0ZWRfXxCZNwCj7WKch
 T9QMiIBjaNquQJRpetkPV7qPU/QYOekMhsujBNkWcaR4kBRv5HiEzO9kYIoUwVdUJ2yW8NI5Dgj
 UmFwO/JVuodevkxzKDMvuVVDI2eOu/k=
X-Proofpoint-ORIG-GUID: 1kMUtfNjo56tw_ewSvAJ3ruJhNXZOvmT
X-Proofpoint-GUID: 1kMUtfNjo56tw_ewSvAJ3ruJhNXZOvmT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-03_05,2026-08-03_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 priorityscore=1501 clxscore=1015
 suspectscore=0 adultscore=0 bulkscore=0 spamscore=0 impostorscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608030195
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260803_151713_334690_C103D9AD 
X-CRM114-Status: GOOD (  22.28  )
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

On Fri, 31 Jul 2026 19:03:19 +0200
Andre Przywara <andre.przywara@arm.com> wrote:

> Allow the mpam_save_mbwu_state() function to return an error, and
> propagate read and write errors from the lower level up.
> 
> Signed-off-by: Andre Przywara <andre.przywara@arm.com>
> Reviewed-by: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>
> Reviewed-by: Ben Horgan <ben.horgan@arm.com>

If you happen to be respinning i think the code grouping vs white
space in here could be slightly improved.

> ---
>  drivers/resctrl/mpam_devices.c | 29 ++++++++++++++++++++++-------
>  1 file changed, 22 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/resctrl/mpam_devices.c b/drivers/resctrl/mpam_devices.c
> index fa8ed20a6740..38450c55e45e 100644
> --- a/drivers/resctrl/mpam_devices.c
> +++ b/drivers/resctrl/mpam_devices.c
> @@ -1838,22 +1838,37 @@ static int mpam_save_mbwu_state(void *arg)
>  
>  		mon_sel = FIELD_PREP(MSMON_CFG_MON_SEL_MON_SEL, i) |
>  			  FIELD_PREP(MSMON_CFG_MON_SEL_RIS, ris->ris_idx);
> -		mpam_write_monsel_reg(msc, CFG_MON_SEL, mon_sel);
> -		mpam_read_monsel_reg(msc, CFG_MBWU_FLT, &cur_flt);
> -		mpam_read_monsel_reg(msc, CFG_MBWU_CTL, &cur_ctl);
> -		mpam_write_monsel_reg(msc, CFG_MBWU_CTL, 0);
> +		ret = mpam_write_monsel_reg(msc, CFG_MON_SEL, mon_sel);
> +		if (ret)
> +			return ret;
> +		ret = mpam_read_monsel_reg(msc, CFG_MBWU_FLT, &cur_flt);
> +		if (ret)
> +			return ret;
> +		ret = mpam_read_monsel_reg(msc, CFG_MBWU_CTL, &cur_ctl);
> +		if (ret)
> +			return ret;
> +		ret = mpam_write_monsel_reg(msc, CFG_MBWU_CTL, 0);
> +		if (ret)
> +			return ret;
>  
>  		if (mpam_ris_has_mbwu_long_counter(ris)) {
>  			ret = mpam_msc_read_mbwu_l(msc, &val);
>  			if (ret)
>  				return ret;
> -			mpam_msc_zero_mbwu_l(msc);
> +			ret = mpam_msc_zero_mbwu_l(msc);
> +			if (ret)
> +				return ret;
>  		} else {
>  			u32 val32;
>  
> -			mpam_read_monsel_reg(msc, MBWU, &val32);
> +			ret = mpam_read_monsel_reg(msc, MBWU, &val32);
> +			if (ret)
> +				return ret;
> +
>  			val = val32;
> -			mpam_write_monsel_reg(msc, MBWU, 0);
> +			ret = mpam_write_monsel_reg(msc, MBWU, 0);
> +			if (ret)
> +				return ret;
The grouping via white space usage here seems less than ideal.
You have:
			ret = mpam_read_monsel_reg(msc, MBWU, &val32);
			if (ret)
				return ret;

  			val = val32; // this looks to be part of block below not above.
			ret = mpam_write_monsel_reg(msc, MBWU, 0);
			if (ret)
				return ret;

Probably:
			ret = mpam_read_monsel_reg(msc, MBWU, &val32);
			if (ret)
				return ret;
  			val = val32; // Now it is in groups with related code.

			ret = mpam_write_monsel_reg(msc, MBWU, 0);
			if (ret)
				return ret;

Or don't have a blank line in there at all.

>  		}
>  
>  		cfg->mon = i;


