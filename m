Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76B91C5516D
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 30 Jul 2026 19:17:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8fla+BUQURBo/7c21A3WNrfVtrC0xwyiRMNM1yGIXLQ=; b=LoH+SseCgX3wz6IkBRAgBnLL/r
	7T0eaNJZjz1BVSHiFstncg/RrjjirafFIy2dHCrvXpwoNtvcu0MEoUrDKvf0WBkr2K7KIsEYYd0gm
	2yF+oR8XiX1RmnWrOJ4/vxGiZEWOPk2hLT8SHIQvCGw9P0o6sS5nZNyiwv7FNyEtm3P1bS6NIfOOU
	PxUuMGjN724CHsrCqbiEiHyGooFDqsymzlI5y5Cjk1soiGDQHCRLBzfv1y+SeQoFuGIOgNnS12LlC
	PkIb/PSjhggiqboqkoyS/MV6djz1MyKHt6cu+tdlzUigveQ44d3yVsIc94Qen5zv5Sqgv8Qnr+l36
	o/C/xC9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpWG1-0000000BDSM-2crw;
	Thu, 30 Jul 2026 19:17:29 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpWFy-0000000BDRq-39Bt
	for linux-arm-kernel@lists.infradead.org;
	Thu, 30 Jul 2026 19:17:28 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66UGWjKS1377712
	for <linux-arm-kernel@lists.infradead.org>; Thu, 30 Jul 2026 19:17:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	8fla+BUQURBo/7c21A3WNrfVtrC0xwyiRMNM1yGIXLQ=; b=bTV+cDnXEBaExVDh
	LrLd5GEvBQhwYn7tO6tLCTVkdxreycTniZ7QeXiWuT4F6Jp9pPCgNdK1HVE7jKaY
	quhXchMzeEC+gDGM58r2P+esS9ysFT/hAl4dCO6R2z6GbJOhTDLx3NUFWSbi6sgx
	VSPfpu7frI+RV2CI5L9aJHGiuQT4z6/DSn3C+cyAQWcYZJVFmNbr4bLofemp6o5L
	B89Bu/+NOgr+u9kTQwTV+wx1KMiV4x4nNLvXdA1TOkEmPaDpsQtBj7cEMIQk/r4l
	oTwT94NeQ2IaqnhV9rqIDJSyGzK7LqyiquEH4aJ0QUSbRY8gfuSfUBTSvindjgH1
	P6pCAA==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fr8jmse9s-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 30 Jul 2026 19:17:25 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-cb74d5db64eso151479a12.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 30 Jul 2026 12:17:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785439045; x=1786043845; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=8fla+BUQURBo/7c21A3WNrfVtrC0xwyiRMNM1yGIXLQ=;
        b=iVhfpSC7HT29GkTAn2SVikfEME+NRYtIyhAlDFEXtit9mAYk5+eVEzaz8qQkVKZfT6
         To1zdXnumQ2sb+gd/kwZLJV/DqGmDClsF3ABgkpqUdE6CYAhnqnSoKBM1/E5kfmc9Qvg
         kcV1ufCdxNX0dkUMqmBA/PUle5gn2SPmsb5hKXB8i2F49Ap1qTYrCBuyN2VvNLnlxc+S
         7PxBPqtuuYS8/37MEabHR6pAP8hvSB4OpVOWEHzT5MvKOYfqp5Db0AftovyWhpue+gP9
         HwP+Ofnx5NRNnPgZjvOK6RLLUe1pRYiQmI79wcDZVCMUQbbFqHIr+zzMyY6mpG6KxXfq
         lmSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785439045; x=1786043845;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8fla+BUQURBo/7c21A3WNrfVtrC0xwyiRMNM1yGIXLQ=;
        b=cTGfedJ25rtUoY/AY0FfpErlknl+0f45/z6GWdapSFtUjJn1oXyb52QnqaEFsGo0uc
         Fw83Rbj4jC3RtzA6xVBjsu/Aum1f/dt3aXRIoa8CgoHa8ZT6V4ckApEBjC1jfx59+7LN
         HJGQhI3cFQ0RIp+txqQqKrc8Ee9KgmzHJUVJ5hlaUWRqsNBpPvdHUv+P9mDk9f9ibm+m
         CwieXhT5fOwkKUBUhvRNftFM4lUBK7OBjjUkGeWa07XMl+vEOzFmN1W+ALfieVnR15kq
         amkW9lE0yz3lKw1pMowrusMb4hZiKsAnRE9HRajZbdv820hRmxflUFpFYDwOMA/7v1LN
         4kJQ==
X-Forwarded-Encrypted: i=1; AHgh+Rqt4//RLXoRY1k6qelIZv5esHdafIFqh8dp4y9Rgxfkla6vqdetrdx3I6d5fS/xYZtpwkdiVLsYrtBBKr1bGXo9@lists.infradead.org
X-Gm-Message-State: AOJu0YxrCIGfnQr4odxEZVkUoBxY/ohxUgK25bKK/BdUIvK4s4yMQtgF
	O1B71yAejqmUQTNgZuunDBMOUzDfQge1+RL83PJhl7CfQaJFQ3GmkRz2DDu4Ur/VkP+Q4ZAWGiA
	Pm7It3UZ8HG2/qe8d08257BCoZTBl65lvgaPh/j+VYn+m4ZLPMLCbgDWwkqe5eVhsa63TH62AbL
	5sIQ==
X-Gm-Gg: AR+sD13iZwr6jvtorkpUz2SBp/SAiKzkhxL71CYpKFZ+yBT0SbkjU60t/VeX36MIrwj
	chVgkuTKZ+qkj0qevmYfcz1Fv1R1QE+cPoiPmcr4cudVp+ZxtX6XsNmKu2tamFaRBAcTIJwHF7B
	9YDTOhYFCeUp/LtU7AJT2mmC2V/i18o2xw0V5IfMsmyrs0Adfr/31yVkpCuTtHA9gZD3MLilO+U
	I2DGnfhRDHTYjQZ143PCHXsKZRUPdA0IO2Ht8XuDPq96h2pGlLmAnk2QZvEM50Dl6ZHvl6FMxcA
	dHBvPB18ZHqkF8se4hpPbDImsSEIt8nkHRd3xKcD+le1NLPEKuXnol1QtJqGrOghV4VZIddbisN
	Rj7H2uy70/2wdlePHYp2tAe94GA==
X-Received: by 2002:a05:6a21:3a87:b0:3b4:6cae:4a50 with SMTP id adf61e73a8af0-3c90075907fmr3944510637.20.1785439044551;
        Thu, 30 Jul 2026 12:17:24 -0700 (PDT)
X-Received: by 2002:a05:6a21:3a87:b0:3b4:6cae:4a50 with SMTP id adf61e73a8af0-3c90075907fmr3944484637.20.1785439044150;
        Thu, 30 Jul 2026 12:17:24 -0700 (PDT)
Received: from localhost ([50.35.46.84])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13e72745b1bsm22343420c88.14.2026.07.30.12.17.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jul 2026 12:17:23 -0700 (PDT)
Date: Thu, 30 Jul 2026 12:17:20 -0700
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
Subject: Re: [PATCH v6 10/10] arm_mpam: detect and enable MPAM-Fb PCC
 support
Message-ID: <20260730121720.00002b55@oss.qualcomm.com>
In-Reply-To: <20260730152539.2712312-11-andre.przywara@arm.com>
References: <20260730152539.2712312-1-andre.przywara@arm.com>
	<20260730152539.2712312-11-andre.przywara@arm.com>
Organization: Qualcomm
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.51; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=V4tNF+ni c=1 sm=1 tr=0 ts=6a6ba345 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=qC1CW/w66vtJz1P9yTJxNA==:17
 a=kj9zAlcOel0A:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=7CQSdrXTAAAA:8 a=EUspDBNiAAAA:8 a=RV8cvHK6CGr8J9zzExgA:9 a=CjuIK1q_8ugA:10
 a=x9snwWr2DeNwDh03kgHS:22 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-GUID: wv0raU4iNgbTMfvC0nYIe70u03wPDcOf
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzMwMDE0MSBTYWx0ZWRfXxShh4c7TgqGP
 KSHXIek0Hz0qBvPk6MgbTvDoNw1C+/7eZSgd2z0GYMlV9MBQEPxJkaoGl841MBqt2WzdvuYqeOM
 +0RE9tIJ/hMFlKuLSPjsFvBdmcAdnPce7CJXSF9tvYnvsXKcFci2DJWNxitnqCWCoZ4xcnVeCok
 Q+GVWIJn6W22g5GFlP/14fZqu0WdsU34dXTS5nVq5NTCGMUWetxm5tgbl5X9x4V1qBSzuffPGDR
 u/lCK8AJcLnf6NhrteP9J9MGWXXrNW/CtFtAF1mED3C49xP9czphciUmNhI7xQS4tIu97aDFzbC
 LJeLWh6W5bIFXuqXP1sVsfWl6EmfTwF9oxA/0n+hjvdHsEXUIsrONdnlRlk7X+qjnrNpmFG/vA2
 LSxw5aMf2LJJ3o7bGnaMP9rafkQ9sxmM75dbnjUFaDxnjFywqO/83rfwGjFtNS1mnZuFKg1uM7Z
 RYXWKyHnP1gpcn14LBQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzMwMDE0MSBTYWx0ZWRfX5429xHW85QhX
 Vp+LPS2wy5harBzc9VTUF9m77SAQyM8l1qO9PpnLXvvaXoIR9MSlw+lYQzIaSLEDcp4+JtGetT1
 3mfKFBoP2indnAdsdc4paJJzmvHkwGQ=
X-Proofpoint-ORIG-GUID: wv0raU4iNgbTMfvC0nYIe70u03wPDcOf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-30_05,2026-07-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 impostorscore=0 suspectscore=0 phishscore=0
 adultscore=0 spamscore=0 priorityscore=1501 lowpriorityscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607300141
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260730_121726_916087_865764D7 
X-CRM114-Status: GOOD (  29.78  )
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

On Thu, 30 Jul 2026 17:25:39 +0200
Andre Przywara <andre.przywara@arm.com> wrote:

> The Arm MPAM-Fb specification [1] describes a protocol to access MSC
> registers through a firmware interface. This requires a shared memory
> region to hold the message, and a mailbox to trigger the access.
> For ACPI this is wrapped as a PCC channel, described using existing
> ACPI abstractions.
> 
> Add code to parse those PCC table descriptions associated with an MSC,
> and store the parsed information in the MSC struct.
> There can be multiple PCC channels, and each channel can serve multiple
> MSCs, so we need to keep track of the channel usage, using a list and
> a refcount.
> 
> This will be used by the MPAM-Fb access wrapper code.
> 
> [1] https://developer.arm.com/documentation/den0144/latest
> 
> Signed-off-by: Andre Przywara <andre.przywara@arm.com>
> Tested-by: Ritwick Sharma <ritwick.sharma@arm.com>

One trivial thing inline.  With that resolved
Reviewed-by: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>

> ---
>  drivers/resctrl/mpam_devices.c  | 111 +++++++++++++++++++++++++++++++-
>  drivers/resctrl/mpam_fb.c       |  41 ++++++++++++
>  drivers/resctrl/mpam_internal.h |   2 +
>  3 files changed, 152 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/resctrl/mpam_devices.c b/drivers/resctrl/mpam_devices.c
> index 606ae4af2be9..8490034c7db9 100644
> --- a/drivers/resctrl/mpam_devices.c
> +++ b/drivers/resctrl/mpam_devices.c
..
> @@ -2232,7 +2317,7 @@ static void mpam_msc_drv_remove(struct platform_device *pdev)
>  static struct mpam_msc *do_mpam_msc_drv_probe(struct platform_device *pdev)
>  {
>  	int err;
> -	u32 tmp;
> +	u32 pcc_subspace_id;
>  	struct mpam_msc *msc;
>  	struct resource *msc_res;
>  	struct device *dev = &pdev->dev;
> @@ -2280,7 +2365,7 @@ static struct mpam_msc *do_mpam_msc_drv_probe(struct platform_device *pdev)
>  	if (err)
>  		return ERR_PTR(err);
>  
> -	if (device_property_read_u32(&pdev->dev, "pcc-channel", &tmp))
> +	if (device_property_read_u32(dev, "pcc-channel", &pcc_subspace_id))
>  		msc->iface = MPAM_IFACE_MMIO;
>  	else
>  		msc->iface = MPAM_IFACE_PCC;
> @@ -2296,6 +2381,28 @@ static struct mpam_msc *do_mpam_msc_drv_probe(struct platform_device *pdev)
>  		}
>  		msc->mapped_hwpage_sz = msc_res->end - msc_res->start;
>  		msc->mapped_hwpage = io;
> +	} else if (msc->iface == MPAM_IFACE_PCC) {
> +		int ret;

Trivial but why not use already defined err?  


> +
> +		msc->pcc_chan = mpam_pcc_chan_get(dev, pcc_subspace_id);
> +		if (IS_ERR(msc->pcc_chan)) {
> +			pr_err("Failed to request MSC PCC channel\n");
> +			return ERR_CAST(msc->pcc_chan);
> +		}
> +
> +		ret = mpam_fb_check_shared_buffer_size(msc);
> +		if (ret) {
> +			mpam_pcc_chan_put(msc->pcc_chan);
> +
> +			return ERR_PTR(ret);
> +		}
> +
> +		ret = mpam_fb_check_protocol_version(msc);
> +		if (ret) {
> +			mpam_pcc_chan_put(msc->pcc_chan);
> +
> +			return ERR_PTR(ret);
> +		}
>  	} else {
>  		return ERR_PTR(-EINVAL);
>  	}


