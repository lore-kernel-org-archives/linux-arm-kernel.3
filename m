Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1508BC5DF94
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 24 Aug 2026 13:12:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AP8FPC79TXKJzXH5HK0VofQkMOzeJIwaszQhzrpV2s8=; b=DFeEx5s23Rir6y0oo/mvAgBhDz
	g/+sjeX5adsoM4LMCQxO/4+magkpjUt7xMdZigWayNNUccopI+PAsn8s3NMPsqyGljLn+k38GG8s1
	b9+1ZFuMhxwoenvXeIBURwbJ0vihFOgd5cBwLL09rK+TULkdq828wmA/jRbWqVkBM/jbl88a97y/5
	mOuyQuQXGWmtnCL6qVr7h5Eo0xN6XtRDYKHTr5Msr1xDtL3kbuT14wpX6KpYrMt7LIkgvtaWu8Vf0
	9fblBxSuaosXy3B63FaY1oXW6sfkg/0VHjAii66kv5CNSrovDtTIs24hw5LTFt6uO/Zg4yj1BoVxc
	/3urjkUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyUTp-0000000Gfn5-2vVw;
	Mon, 24 Aug 2026 13:12:49 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyUTn-0000000Gflp-1LRC
	for linux-arm-kernel@lists.infradead.org;
	Mon, 24 Aug 2026 13:12:48 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67OCurqa3613372
	for <linux-arm-kernel@lists.infradead.org>; Mon, 24 Aug 2026 13:12:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	AP8FPC79TXKJzXH5HK0VofQkMOzeJIwaszQhzrpV2s8=; b=YSATzLFnnZ+16q3D
	VP+z8TjUTxnbRnz24+6Ir1k401gnJmtxWw58juPIrAsYpFc0bbdcTslnnzzcsCSQ
	6vvgKAKL35YVkIywBiDM4eai4pRnuVpESxcfxZdVs5qkH/mv4TevM7IiXw5GaPKj
	TuOmmICeRG4DlFZcmu1jS48G1lAGTG6M8zRvpQ12eF41pNYUfwbL8P2TQltPmwpL
	yyReKJMbu48DgFNyQdyKVSmVCNFPXL33ep1ubIxU/HjiSAMTK+L88m+ecOIRQbcL
	kIBGQJ9AWbtVPtr77+hAoTZzEUq6r84B3n373onzvC/jROWzHuzP47aXn7elfbXE
	cCSHdA==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g8jgk18p6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 24 Aug 2026 13:12:46 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-52ce64c41efso70372141cf.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 24 Aug 2026 06:12:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787577165; x=1788181965; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AP8FPC79TXKJzXH5HK0VofQkMOzeJIwaszQhzrpV2s8=;
        b=hjWncV+LivHGr8ZiOq4698KBqao2fXtQwg/Sgmq3en1/FhHm8GEyevRyw15GCQfS7Z
         nPGf2ierEBJ7WUVq7QpH0ePrnFVBLHKf3VljeAa4wAcrG9DWyCm+SyIWvkx/tQliCjNT
         KccKnPGn8KN+lrOROMh3WpIl+QH8n/cy/XR8W0nNuCylQUA+rNnY6EB8E58MW2jWXoxG
         PPI/5ZgYqftt9KxGe1rQZ30hIp2zg+Em68gQGJgTL/Ffxt7S6rCateaMRjjHm6VaFFGn
         2KdBn0/WPYkT/il5uDvWpvNwSSGmLj27nF5aFKshxsjFPU4Owko49vFZF8yumPD/ztCt
         rVAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787577165; x=1788181965;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AP8FPC79TXKJzXH5HK0VofQkMOzeJIwaszQhzrpV2s8=;
        b=nr8BAa+UCJ1tPmaCJMxzwwdEDCubFNA4qPdP1+dGmFugmW4+HQjmbSJVVAcQ/p3t+m
         KGd4hwwdU2MXUHx75uwRwXaJj9bckFDkGwoVjaoskSgx9+rbf1JdfVEvs7brhPCdIQn8
         M/a0PqXXV2x4mz1VW27HlikpP9Er/3hNszdyK7FOx9M5//iEmR42aA92FBVk75qVvLhD
         AAo+Lti+eUtj6OD0hvphWiCUjSs4mm8YksHLgJpC/S+CANveqDzFT/8RZqzVOmsAp5Hh
         F4OmjpFfQPnFSQsPAm0Z1tMS6GRzmba40yg+b80DwvBIDvMzDqJEYHN3NXr37ySlQuZj
         Yy6w==
X-Forwarded-Encrypted: i=1; AHgh+RqxG/6yKWXUBSIx8X1I3MDwbyco2eXOZTfB2SK2L3YB6x951yRQyx22TEHBMD3lF5knbImEFt6I58vt/P15MSF+@lists.infradead.org
X-Gm-Message-State: AFuF++mdmR3b/qFYSaTVmdd1o0Cb0TzQGzSS4LR9TrNwkF1a1kmkEvPY
	h9YV5dK6R4ZHkPEmCRZPEW//VPYd17ahJ0ZMLrIpfY+fBJCHi1qzh5IeK+/uyBoDeKRokRjrbct
	1ZktzDnK5A8wPYOR0fYFcuy2/rC1ZehppN0vNDnXCpqayw/zY5bhXHNqFEjEcsLLyWJW9ZBvKGF
	on2g==
X-Gm-Gg: AR+sD12wlEpIozVAETFMUUM8QkL1+motPByXlZf/4IbujKP0+8xV7GA0SHIJo/5cQcz
	lI1BL6bh8h/rZAU9kkJ0DkvCGNp2UlIoScWOSusGwxb4mNI+1DEwEwM7BHcEn68NoHWnQZXZHA8
	grpL2e9fSAURDiAIeel1zKzjEpWG0b5VRR7OZHjwGraAwrJfjkanBQB7i9QT8neY+NcCs/+VnQ9
	gTlaY7rTI19Zvjh762jxZBovJeAJODFUnh1v+OW7z2JiSJUwZ9t1Xcmz8Ij7id4YudyDj6AdL1w
	te2xdVXGPkpo8WT7qQsG+52sUqrIcjiuM/tmzAy1zlKjEZSjj2inUgK0nH2M5i9B08si3ySHNK+
	HDIMFV2SRiQ5K2mpzswG9YVspkF6MTHcYND4=
X-Received: by 2002:a05:622a:1646:b0:51b:e92f:ec5 with SMTP id d75a77b69052e-52e09bb3048mr171483241cf.3.1787577165532;
        Mon, 24 Aug 2026 06:12:45 -0700 (PDT)
X-Received: by 2002:a05:622a:1646:b0:51b:e92f:ec5 with SMTP id d75a77b69052e-52e09bb3048mr171482641cf.3.1787577165102;
        Mon, 24 Aug 2026 06:12:45 -0700 (PDT)
Received: from [10.217.218.158] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-499d560f66csm527895e9.1.2026.08.24.06.12.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 24 Aug 2026 06:12:43 -0700 (PDT)
Message-ID: <2329d1dc-9907-4338-8bb6-2a32e3e261ee@oss.qualcomm.com>
Date: Mon, 24 Aug 2026 18:42:31 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6/7] i2c: qcom-geni: Use common GENI resource
 initialization helper
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
 <20260805-derive_clk_perf_tbl_from_perf_domain_opp_table-v1-6-61171ab1cdce@oss.qualcomm.com>
Content-Language: en-US
From: Mukesh Savaliya <mukesh.savaliya@oss.qualcomm.com>
In-Reply-To: <20260805-derive_clk_perf_tbl_from_perf_domain_opp_table-v1-6-61171ab1cdce@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: L7Ia9E0cV_LpPChENv2_WFON82XPDdNe
X-Proofpoint-GUID: L7Ia9E0cV_LpPChENv2_WFON82XPDdNe
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI0MDExMSBTYWx0ZWRfXzO0/ou8Rakuo
 O4nXEnlTQcUeICi/+sCC9kfPzT3wwUFfxC8EIs3a09ovl7FFqj/PJOogT7aXqdjwvOihrrvQlxK
 JzW/1lbKh4eZtA0ShEWpeQZITvLE4pA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI0MDExMSBTYWx0ZWRfX2Z8zHUiUzaml
 5pE3MdqBauRmLqnley35i26ODL1bpQ/ktSlRuN53vnLSWkKccY0kThOExMGJjxOBdCPNcz8Po9N
 1pLbDl8qKYDZCvnS1Jv5gzO4AwsmsCB7q7ubBuQ58Z7yU/uhgim0WJst0l8Dnzg/VMp74Js3ia8
 0kglA7TfaaUk1m+jGLxbyjeSakw7xLTyo5opq0y3ptL4Q/HLLqMGMCLJ09YCVxlbYUfzZfqcrB2
 k/ziROxU3uGnnMaA68Zrf/7BCMB1DCdYBpJGtXB1SQlEfFkZkdmWSrQE2M5fiy0w4ZKXF43O/G2
 LlbtENUSDc4pa05OKGnUs+HSmLAPz9yue5R1kYI8NI+TGZhFEsFgLky0oFpxC+GXStWNyQr4SRR
 j/W3KlNke8HpBOZ4fYVJUxQLk2H2bgWBbJA6bU8aCb532lTmhV2AaaAi2lKDIk7JBGwnEh6ED17
 maOjQMFU6gGrZlQrb8w==
X-Authority-Analysis: v=2.4 cv=KcvidwYD c=1 sm=1 tr=0 ts=6a8c434e cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=M9ZTtoZWvZtrIhbvBKUA:9 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-24_04,2026-08-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 adultscore=0 spamscore=0 priorityscore=1501
 lowpriorityscore=0 bulkscore=0 clxscore=1015 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608240111
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260824_061247_365483_5AACE31A 
X-CRM114-Status: GOOD (  18.44  )
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

[...]

> @@ -228,10 +228,13 @@ static int qcom_geni_i2c_conf(struct geni_se *se, unsigned long freq)
>   	val |= itr->t_low_cnt << LOW_COUNTER_SHFT;
>   	val |= itr->t_cycle_cnt;
>   	writel_relaxed(val, gi2c->se.base + SE_I2C_SCL_COUNTERS);
> +
>   	trace_geni_i2c_bus_setup(gi2c->se.dev, gi2c->clk_freq_out,
>   				 itr->clk_div, itr->t_high_cnt,
>   				 itr->t_low_cnt, itr->t_cycle_cnt);
> -	return 0;
> +

This looks wrong to me.
First accessed registers and then we are setting ICC vote ? we should 
enable resources first.

> +	return geni_icc_set_bw_ab(&gi2c->se, GENI_DEFAULT_BW, GENI_DEFAULT_BW,
> +				  Bps_to_icc(gi2c->clk_freq_out));
>   }
>   
>   static void geni_i2c_err_misc(struct geni_i2c_dev *gi2c)
> @@ -1100,24 +1103,6 @@ static int geni_i2c_init(struct geni_i2c_dev *gi2c)
>   	return ret;
>   }
>   
> -static int geni_i2c_resources_init(struct geni_se *se)
> -{
> -	struct geni_i2c_dev *gi2c = dev_get_drvdata(se->dev);
> -	int ret;
> -
> -	ret = geni_se_resources_init(&gi2c->se);
> -	if (ret)
> -		return ret;
> -
> -	ret = geni_i2c_clk_map_idx(gi2c);
> -	if (ret)
> -		return dev_err_probe(gi2c->se.dev, ret, "Invalid clk frequency %d Hz\n",
> -				     gi2c->clk_freq_out);
> -
> -	return geni_icc_set_bw_ab(&gi2c->se, GENI_DEFAULT_BW, GENI_DEFAULT_BW,
> -				  Bps_to_icc(gi2c->clk_freq_out));
> -}
> -
>   static int geni_i2c_probe(struct platform_device *pdev)
>   {
>   	struct geni_i2c_dev *gi2c;
> @@ -1188,6 +1173,11 @@ static int geni_i2c_probe(struct platform_device *pdev)
>   	if (ret < 0)
>   		return ret;
>   
> +	ret = geni_i2c_clk_map_idx(gi2c);
> +	if (ret)
> +		return dev_err_probe(gi2c->se.dev, ret, "Invalid clk frequency %d Hz\n",
> +				     gi2c->clk_freq_out);
> +

why not move to geni_i2c_init() ?

Check recent patch @ i2c: qcom-geni: add I2C frequency table for 32 MHz 
firmware-based SEs.

Let's agree to move there, to avoid issue.

>   	ret = i2c_add_adapter(&gi2c->adap);
>   	if (ret)
>   		return dev_err_probe(dev, ret, "Error adding i2c adapter\n");
> @@ -1281,7 +1271,7 @@ static const struct dev_pm_ops geni_i2c_pm_ops = {
>   };
>   
>   static const struct geni_i2c_desc geni_i2c = {
> -	.resources_init = geni_i2c_resources_init,
> +	.resources_init = geni_se_resources_init,

why to add common driver function to i2c ? and also spi, uart ?
Can we not call that function from within i2c specific hookup function ? 
i think design wise should keep i2c as local function.

Also driver specific anything can be managed in local function.

>   	.set_rate = qcom_geni_i2c_conf,
>   	.power_on = geni_se_resources_activate,
>   	.power_off = geni_se_resources_deactivate,
> @@ -1290,7 +1280,7 @@ static const struct geni_i2c_desc geni_i2c = {
>   static const struct geni_i2c_desc i2c_master_hub = {
>   	.no_dma_support = true,
>   	.tx_fifo_depth = 16,
> -	.resources_init = geni_i2c_resources_init,
> +	.resources_init = geni_se_resources_init,
>   	.set_rate = qcom_geni_i2c_conf,
>   	.power_on = geni_se_resources_activate,
>   	.power_off = geni_se_resources_deactivate,
> 


