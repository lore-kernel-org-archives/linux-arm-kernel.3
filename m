Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A58ECA0EED
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 19 Aug 2025 08:05:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZX4WHq0FHGuUzi7xR9JeLuPrT8yDI2/1ljZuVcjfQm8=; b=04eFmpAOGP9K+7JzijYmuHyI30
	qZ0p17mxK3Qkn3tvOCUbEL6Qm8CBP8chyHYk8yiJnSgXhmCJPk+ueQsk+NZS/oXHcO0yLNxJqV0E6
	lYlmLYRh2JFq3nG2G6hJicg97a+TZORHsi50pWghGKIVbWqRnk4nAART6J0pGNfyCcHcVvN1zB5IO
	xnY0QW1pm+bRIqBilgUaTC0rf2jLegfg3P3yt6SH1j2J4HxR6jjEtXKqJD8O64XS4m7tnyDXOPCjk
	0/9S5HKFBRbvJ9VFiNq9UvCqMtcrIK9HLamOmr4KxH1wFLGgbhokDs82YVXavI2goIXmdmfOpvCGS
	I6Oj6oJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoHLj-00000009lD3-2x5x;
	Tue, 19 Aug 2025 08:05:43 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoGq5-00000009gad-2wQY
	for linux-arm-kernel@lists.infradead.org;
	Tue, 19 Aug 2025 07:33:03 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57J1iUkJ009007
	for <linux-arm-kernel@lists.infradead.org>; Tue, 19 Aug 2025 07:33:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ZX4WHq0FHGuUzi7xR9JeLuPrT8yDI2/1ljZuVcjfQm8=; b=NSTtg6xnzXxYa0kH
	8N/Jl0r+Xq75clwMHnd5LFr21nLPlHJ4FJT+hTd3glAdegUGxZ2O2MJX33ZxZFWG
	fmn/JNLUW6Ef/jQ92sM0OIQoDVXYl53KDrGSRt90gKHKpNgapHOkSIvyFxJaGggt
	xbwVrs+h0ChA1wNj3feLRbsagfoIZKabNqFm4OD8yIuiTVcCOLh1Xz3UtRLLEssW
	KKcWbq2iJd/59RYhpz9qsZZOzR+s9cTgAuzmOFcfwnmFpKPOybM9Uci6eMRPK5sF
	BxUqa2RdOrQx/iBa4tY73Xyz9OpuFrqplXhwFMGCD51sl+8iY979EfvNmuvFPBZU
	0buA5A==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48jh077nsa-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 19 Aug 2025 07:33:00 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-32326e72dfbso9728536a91.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 19 Aug 2025 00:33:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755588779; x=1756193579;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZX4WHq0FHGuUzi7xR9JeLuPrT8yDI2/1ljZuVcjfQm8=;
        b=cV4Rxyd6KX/bZYsx0xoen6cnsRdJocBadyWs3i4zJb5WY0of8t3waeEe5nmeN8qZ+F
         yVdYQLgA3v3+2BNhRSJB6ioTC8qoYnIx+y8guM3bHo2S/4pQxNiX+e8olFRbthCHvH0V
         P0i2jV1qSHx6rY+EsRkK2lJ+KGm0O0AAQOXQqbTx9S7iDyNSsWyrHx7r+A4wOPBKQ+qv
         GlDeSp46wPGbuISfs9Zj770xjs8FTdZJ7qmbk+7ecKCd/Wn2NtsZo0iKKQOt21IHCyae
         yP579tpFliAgbmeNICabXFi1nSpvb74tI1j3DI30E5OeH/x+larKI/AruuJVoZo4yxqR
         N8ig==
X-Forwarded-Encrypted: i=1; AJvYcCWN9Wwf2gpSA6VJUSFzjXecP0XocriM4eCdZ8KLZmrPof/v2ajs4lyNJ27lCV9YeoEoQ86O8Fs9ElEjJD+dH+wW@lists.infradead.org
X-Gm-Message-State: AOJu0Yxy+nSsgRXYTNmmxXHHJmBt0WzfTPro5LkPvuzhBRVsTnYILj+3
	0gQm9ZQrJc7Ov+DioDMCKyWgXDNzAu+r5p62H0cJmGHDfsaw6YTamyyu4cr5Z5xEBK344Z3AVJS
	pNGp/GDjFB7mbFBtmo4RhBDXANDmeURvyd/JyVHsbWvgYWhKIobZxwPeuMdfUI3CjDfcKu0QfM9
	nntw==
X-Gm-Gg: ASbGncthWD2oYsu9QZ2Uuj1KG9IFFBLVnCfinAafDDSn1ol9utwLoYcqSrj0V3VrQJz
	Csd0CnF9QB/8IMVWQOIyJDsPyr0wrWtkBMHzR+e7YrbxXu94pVIjiE3PHX418pG+bv59iN7HF5G
	Xm3h4KmoQzK9hZ0S/Vdg33pIcI45DWx75Yq7QWmaaRVPJnel32hLx8qUfbdAEbDwAC6T9lP6W3D
	GHeDmsnQ8f/UgsPWqc0iFZsHa1n8bMYdo6TfDqctHUOszGB/KsYUxFmgUVHsLcNSA+KuECz9I3D
	pgVPRB/mj/WV6O/V8EnXT0sJCvKnfU3XcA6xbkZbeixBiz9BhddzXEKOKgjbjNbXopaW1DBFqP3
	GDvQvTNsRzyKTblEOekY9W5inRZ/5vRE1
X-Received: by 2002:a17:90b:560b:b0:321:a2cf:9da9 with SMTP id 98e67ed59e1d1-32476a4fd20mr2605848a91.15.1755588779160;
        Tue, 19 Aug 2025 00:32:59 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGhfH3UlxhiOYhnFv9vS+sUYiu5emcuumytoT8Wd2+lqdseeUtaxzogf3ZBo6T/gdJDJ/I08Q==
X-Received: by 2002:a17:90b:560b:b0:321:a2cf:9da9 with SMTP id 98e67ed59e1d1-32476a4fd20mr2605819a91.15.1755588778666;
        Tue, 19 Aug 2025 00:32:58 -0700 (PDT)
Received: from [10.133.33.73] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3237e3c3063sm1988856a91.1.2025.08.19.00.32.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 19 Aug 2025 00:32:58 -0700 (PDT)
Message-ID: <754f2025-11da-4747-a98a-74c992006946@oss.qualcomm.com>
Date: Tue, 19 Aug 2025 15:32:53 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] coresight-tnoc: Add runtime PM support for
 Interconnect TNOC
To: Leo Yan <leo.yan@arm.com>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach <mike.leach@linaro.org>,
        James Clark <james.clark@linaro.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        kernel@oss.qualcomm.com, coresight@lists.linaro.org,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250815-itnoc-v1-0-62c8e4f7ad32@oss.qualcomm.com>
 <20250815-itnoc-v1-3-62c8e4f7ad32@oss.qualcomm.com>
 <20250818143011.GB8071@e132581.arm.com>
Content-Language: en-US
From: yuanfang zhang <yuanfang.zhang@oss.qualcomm.com>
In-Reply-To: <20250818143011.GB8071@e132581.arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: y15xw3Cz_AEStoHtwktaHv0OW6oNMI4B
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODE2MDAyMCBTYWx0ZWRfX36wygi4RmL+N
 LM79nCA+mZ/vTBeUXJvVbamKP1IhXJdyULaXLARAki3xjcYWfDer+56usJvQhj6LuPF3FSRtuaX
 3hEKjnL/PhOEbg5hayZiEMCrbVjw7T45/POOF9MLXUZ2IH2FaAEFOpp9o5skKR2NnyGtMK2rizY
 U5ObFNGYlhz7f+g70tUoq6Vj3mdDe2lqt0KYgrrzj0JgdEpwJXSWREl/aTghgLrlhJllcfCv8hM
 45gH/6KnPkUO+7GGKouqQVI/8qkRZFRuvjd2WcmxVDGnzCIrV7pvqqITqMrgFMEBDvJpMjSYsYO
 0vRziOnF8VH/q9nXRFLdxqVSYZd9MfBcCo8xk0MBYdj8zAhgQ1mQ0WT3MbU+cRvjSA1z0KojqVx
 JKPNRz9h
X-Authority-Analysis: v=2.4 cv=a+Mw9VSF c=1 sm=1 tr=0 ts=68a428ac cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8
 a=Zm1HM0GOZpLsNU_EOA4A:9 a=QEXdDO2ut3YA:10 a=uKXjsCUrEbL0IQVhDsJ9:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: y15xw3Cz_AEStoHtwktaHv0OW6oNMI4B
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-19_01,2025-08-14_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 malwarescore=0 suspectscore=0 impostorscore=0 phishscore=0
 adultscore=0 priorityscore=1501 clxscore=1015 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508160020
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250819_003302_098368_3A91E5F6 
X-CRM114-Status: GOOD (  23.34  )
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



On 8/18/2025 10:30 PM, Leo Yan wrote:
> On Fri, Aug 15, 2025 at 06:18:14AM -0700, Yuanfang Zhang wrote:
>> This patch adds runtime power management support for platform-based
>> CoreSight Interconnect TNOC (ITNOC) devices. It introduces suspend and
>> resume callbacks to manage the APB clock (`pclk`) during device runtime
>> transitions.
>>
>> Signed-off-by: Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>
>> ---
>>  drivers/hwtracing/coresight/coresight-tnoc.c | 26 ++++++++++++++++++++++++++
>>  1 file changed, 26 insertions(+)
>>
>> diff --git a/drivers/hwtracing/coresight/coresight-tnoc.c b/drivers/hwtracing/coresight/coresight-tnoc.c
>> index aa6f48d838c00d71eff22c18e34e00b93755fd82..f12a1698824bc678545319a3f482fd27e67a7352 100644
>> --- a/drivers/hwtracing/coresight/coresight-tnoc.c
>> +++ b/drivers/hwtracing/coresight/coresight-tnoc.c
>> @@ -270,6 +270,31 @@ static void itnoc_remove(struct platform_device *pdev)
>>  	pm_runtime_disable(&pdev->dev);
>>  }
>>  
>> +#ifdef CONFIG_PM
>> +static int itnoc_runtime_suspend(struct device *dev)
>> +{
>> +	struct trace_noc_drvdata *drvdata = dev_get_drvdata(dev);
>> +
>> +	clk_disable_unprepare(drvdata->pclk);
>> +
>> +	return 0;
>> +}
>> +
>> +static int itnoc_runtime_resume(struct device *dev)
>> +{
>> +	struct trace_noc_drvdata *drvdata = dev_get_drvdata(dev);
>> +	int ret;
>> +
>> +	ret = clk_prepare_enable(drvdata->pclk);
>> +
>> +	return ret;
> 
> Here can be simplified:
> 
>     return clk_prepare_enable(drvdata->pclk);
> 
sure, will update.
>> +}
>> +#endif
>> +
>> +static const struct dev_pm_ops itnoc_dev_pm_ops = {
>> +	SET_RUNTIME_PM_OPS(itnoc_runtime_suspend, itnoc_runtime_resume, NULL)
>> +};
>> +
>>  static const struct of_device_id itnoc_of_match[] = {
>>  	{ .compatible = "qcom,coresight-itnoc" },
>>  	{}
>> @@ -282,6 +307,7 @@ static struct platform_driver itnoc_driver = {
>>  	.driver = {
>>  		.name = "coresight-itnoc",
>>  		.of_match_table = itnoc_of_match,
>> +		.pm = &itnoc_dev_pm_ops,
>>  	},
>>  };
>>  
>>
>> -- 
>> 2.34.1
>>
>> _______________________________________________
>> CoreSight mailing list -- coresight@lists.linaro.org
>> To unsubscribe send an email to coresight-leave@lists.linaro.org


