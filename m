Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4201FCA6012
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  9 Oct 2026 07:18:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mNde9hgXNQrDxjgqmzc1QflzS3/KQtZKPHcsGvNzPEY=; b=1potU+6fNoJbMCLnQPFRPSP+mO
	XAG0dMiggj35ZIOZhbhFO3zbIhl+jrCJyNu77ljiqljnS3cJoTW62n6eYooEhca1iOMFGiks7WtIC
	9CVcW7ZVizYitvHn3PD1Yh9mpE3MIiyQTQsKmvOfXEjMhJ2WjnUGcPRgEHqOemqB33AdXanbwWMjV
	pntWuKJWMdIT/TcIM6fr2bn0iV4aJlWPICGvo6FRgww3uQvQ1D7VTgd8tVAb0N0pAGstgz3iHk0e1
	GUQxV3O22GM7cxALScG/PSLfjwL0vrNS67R/k0BZXgN318DGCgxUjjKQfdnIHBOWV2z4IyEk7vY0p
	Jz3tv4Sw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xF4s9-00000005huB-2gCK;
	Fri, 09 Oct 2026 07:18:29 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xF4rz-00000005hsT-1MOC
	for linux-arm-kernel@lists.infradead.org;
	Fri, 09 Oct 2026 07:18:28 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6993HSkK966595
	for <linux-arm-kernel@lists.infradead.org>; Fri, 9 Oct 2026 07:18:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	mNde9hgXNQrDxjgqmzc1QflzS3/KQtZKPHcsGvNzPEY=; b=A8j7lPXItWDRlbhr
	o+oL+AXG1K2QL1HZDerROxemTLf23p4YhRJIh9NsaF9tGAWmcbpm91baVgAByifj
	teZ0yy5FN1SWwbLkBl1kzQL1oudTQR+Jzl5FOydTR+clbYRouOHtV86LsZroqsac
	qTlhBL62/nZmfjPRPXCgcsPzPSqipgbIPWrmytfbLYTwBuvJVO+P9oCkCt6y4tlx
	4xsorh+lfFY5NmoRKvSPRFXhxPSxAZI6QgDHVVVBEYGx/mBUdsjNy7w6kR4yNTjy
	1SDVwePtnUmrn9jlgN+w+kfXSW0UYkv5IeXmKTcJZWhisx3o9OEcweVFK2Qa/Kwt
	lUfRhA==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h6fyj2cy4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 09 Oct 2026 07:18:18 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3a8041a532eso5226490a91.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 09 Oct 2026 00:18:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791530297; x=1792135097; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mNde9hgXNQrDxjgqmzc1QflzS3/KQtZKPHcsGvNzPEY=;
        b=YpnBXUvm/pGFrElAlm2gdiUT0/isrYA+cBjI6ocqxY8JGi2PtsExDI7pEtf2Z4n920
         WtFh93xpKy1mNfai95pZV5dzML0YnwXtTaa3qrItBvs8IR1lHXJQil2iHHdYhBZMRvzU
         GO5R5+bUVmJWzG6qPVGZRdpvYZ/adgUe3lyY7rYzq0x7HDpE6N29K1RRo5FKnpH516dt
         r/s6YAT2LSNliD3cwzDWwVgBEF2czA6w9v9j3i0FVS9PcL8kIV/xmx8OLEsVZM9elhS9
         Ahg+UyZf5FR/IsFZ1rdOD+CXsMTgoLfCAfYIV46RqVhwRMmK0puPdYp1+aC2TfuXg+iu
         /scA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791530297; x=1792135097;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mNde9hgXNQrDxjgqmzc1QflzS3/KQtZKPHcsGvNzPEY=;
        b=TFy7qf2sOTC2kQvt2MiWQS0ME+015Jy6KoOozzD11UJ83EvjyoGO2P/lmcCM0c++1M
         AW1D9NwTSrBfu3wjmlYa+J43Fx0RXdLkWBNFu4deUpEw1Vn001oI7iUOr5YXMPnVIv7y
         zez/p16o6erlnOs4HpG9oKxF04VsspTufD4HcytfpFO6o3tkG2CQ00+qR9Cb6voSXZCN
         GIlsCeTK7UPMlvXI/mQW0QRxyFJZQT7YYR1dzf7LAD+Im7f1Ui5GA7Zv2nHiErbYRIG8
         gr6k0QLNp30g9Cr/oJRuyE1M2ZkBp5g3U37fohknUCDr7ZBd0iwwbGVr8c+Kqz+lPNRc
         +SJA==
X-Forwarded-Encrypted: i=1; AKwUvBz/6OgrNFkJBU24l0NhcWp8UqYbBT8PAg+LZ9QhgWSC9vSo7zqm1xGLML4vlsIsttB60+7OGmJbEbrewm/oMKt0@lists.infradead.org
X-Gm-Message-State: AFq9FYL4TdF7RsSt1TS3aMvS7JJwbeCUS4Z+LYhKRa20aCbFwcw7TSi9
	PP5SQFbiECWl2XhXG6v/8z5KRc64HWWuoUSEHJEj6vSFhCho5ectM+s2lcX+I1zNx+Nc2RVHPMy
	L0nB/eYCBeka48JoSkAk3OELVUomwZnIBFFzamdK/WG1Z9P4dtCSTLfDFLAyAbgL2+BzAyjpkU5
	7BPQ==
X-Gm-Gg: AYBFou1jyje2P17PhCbgzTRRSoGAbzMHOeWWDLRgcfeMzAkVQtOb9f1rSeS7XNyyV27
	dVPShNIreu1kS1W9N9fhKlnPNT4uktOeUmBCekXOnc1nsL30400VBNXrShJ/Sf6Ifl6qnIJ7CSW
	el4V1BOjomjHYF/+n6VbV+m8MOM4PD/145mfsQ/mTr2d2e9mG4dF8M8UmwoTu7JX7Y2bycSiAnO
	C8kiyFz/bbCv/+jrWtnhTmbZru40BeRUs1BOiHOM0xAXMQRf/Oh5uH7bHoVlezJS1LdZOTA/yjH
	pgKxjfixz6nz0vYiIU36LIIOYjew+1mg0L8/KHb3Ln4qGuOPIbmBS4kb67cfS6nk47e6w7rpWpx
	OuS/fZvTqNtrHBaUqAi8qw7wioQU5mpm9Qg==
X-Received: by 2002:a17:90b:2784:b0:3ab:9cb:b5a5 with SMTP id 98e67ed59e1d1-3ab3a74739dmr1040715a91.18.1791530297136;
        Fri, 09 Oct 2026 00:18:17 -0700 (PDT)
X-Received: by 2002:a17:90b:2784:b0:3ab:9cb:b5a5 with SMTP id 98e67ed59e1d1-3ab3a74739dmr1040694a91.18.1791530296591;
        Fri, 09 Oct 2026 00:18:16 -0700 (PDT)
Received: from [10.217.219.98] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ab32d58bd0sm1274180a91.0.2026.10.09.00.18.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 09 Oct 2026 00:18:15 -0700 (PDT)
Message-ID: <0a8e4d43-1ba3-49f7-bd50-ca5e240116ae@oss.qualcomm.com>
Date: Fri, 9 Oct 2026 12:48:06 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 7/9] i2c: qcom-geni: Vote for SE clock rate using OPP
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
References: <20260827-derive_clk_perf_tbl_from_perf_domain_opp_table-v2-0-091697dbeb02@oss.qualcomm.com>
 <20260827-derive_clk_perf_tbl_from_perf_domain_opp_table-v2-7-091697dbeb02@oss.qualcomm.com>
Content-Language: en-US
From: Mukesh Savaliya <mukesh.savaliya@oss.qualcomm.com>
In-Reply-To: <20260827-derive_clk_perf_tbl_from_perf_domain_opp_table-v2-7-091697dbeb02@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=BfpNQbt2 c=1 sm=1 tr=0 ts=6ac8953a cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=e2LvkIfHUWP2XQjg4Q8A:9 a=QEXdDO2ut3YA:10 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-ORIG-GUID: XkqVIRJUalOpSfij8f5ynn-M6ibq714h
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA5MDAyOCBTYWx0ZWRfX8XvYxBWP+80d
 oZGJO83iYLwBI3edFLuNApv6hRLezpXjpDkcxAkOfIkR/j24McjJKXgdUz6XNidOOjOLFNl7gAZ
 YImcK9HHmvkJ/Tdfwrv246P9tRKmuTQ1XBY1Xc2L8OgbdIZLAErgDOxDVWJUUF16e4XNvaD8VxD
 pBsiGFUAmuKRTst9mX80Kituciz6ut+vMuliZdzd4CEVImgpk1HY6QPJ4DaTLt5IeJqktIfApzU
 75tZ+PQ49Cs5LAT6XrmtsWNhtDF4N1qABsJHOWqHXsZ0oaQkaXwKQFfiFsauVv8bsPrGyEl0opE
 GB6gWMsX42QIcYiWaSnckxwY67TfxegImJQRXj89l8lkNfQ1p89KfDkPvavSEi98S9RkGYpVfyd
 yiscSSvHhhNdjX21iH5Bj/dgeqglTSZRRuVMJOdRLIyIGbZWy/IT/g+xnVYNXtMwXE0mZIF6obe
 pefTQHC2Da0PLWPn17g==
X-Proofpoint-GUID: XkqVIRJUalOpSfij8f5ynn-M6ibq714h
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA5MDAyOCBTYWx0ZWRfX1nClzNG9T5OF
 E7nimSUblQ0dB8PgVrYg6XDA1UFijnnhLzWzbshCNo+1O6/BEBoKNwQy9Fln9HDcbn53PWqdeqW
 Swi6O5VS0Zv6XiHTZlV0iMapuTwx62c=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-09_02,2026-10-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 impostorscore=0 phishscore=0
 lowpriorityscore=0 spamscore=0 bulkscore=0 adultscore=0 clxscore=1015
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610020000
 definitions=main-2610090028
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261009_001819_549026_40104557 
X-CRM114-Status: GOOD (  14.06  )
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



On 8/27/2026 11:29 PM, Praveen Talari wrote:
[...]

> @@ -218,8 +224,13 @@ static int qcom_geni_i2c_conf(struct geni_se *se, unsigned long freq)
>   	struct geni_i2c_dev *gi2c = dev_get_drvdata(se->dev);
>   	const struct geni_i2c_clk_fld *itr = gi2c->clk_fld;
>   	u32 val;
> +	int ret;
> +
> +	ret = dev_pm_opp_set_rate(se->dev, itr->src_clk_freq);
> +	if (ret)
> +		return ret;
>   
> -	writel_relaxed(0, gi2c->se.base + SE_GENI_CLK_SEL);
> +	writel_relaxed(itr->src_indx, gi2c->se.base + SE_GENI_CLK_SEL);
>   
>   	val = (itr->clk_div << CLK_DIV_SHFT) | SER_CLK_EN;
>   	writel_relaxed(val, gi2c->se.base + GENI_SER_M_CLK_CFG);
> @@ -1228,6 +1239,8 @@ static int __maybe_unused geni_i2c_runtime_suspend(struct device *dev)
>   		}
>   	}
>   
> +	dev_pm_opp_set_rate(dev, 0);
> +

return capture and return it else it's always success here.

>   	return 0;
>   }
>   
> @@ -1236,6 +1249,12 @@ static int __maybe_unused geni_i2c_runtime_resume(struct device *dev)[...]

