Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83343FCE08C
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Feb 2026 14:37:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MGCOVaY17Ad9+UUgzh8TP9K1EA7s2p63TnHnE17GZUs=; b=dlbSOob3FxLCtmDmb3Lo0Ch4qQ
	6ANiznFRPShUur/j95AQ2js9Bph32Myu8lgevOnK269JptXnWqmsff+tb0esWx4CKS/v0FcblTl8z
	xjjTmK8RBXSXgaicVnIyVPN82R78IszwIUDGSlAcMPX61Y19YeEVIHKKXGQcPU3Fjgvb4TmbBP6l0
	Ijx6MtB/SM3KUu2hjJLi2kIrTGEAXDMridVJDSyNgbBXKX1R9nvLUV2YfvGD24tOFIpAHyYglokMt
	fT5M2pVrTIq0usxiPBJQ9zMKPktZmNhgEcyfebscGfO6D7RAxssEJPckE4H5CjjdoUOayXIPykDjr
	jFVzDFTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvcUv-00000006MBJ-1Com;
	Thu, 26 Feb 2026 14:37:49 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvcUr-00000006MAp-490y
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Feb 2026 14:37:47 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61QAL2XT369028
	for <linux-arm-kernel@lists.infradead.org>; Thu, 26 Feb 2026 14:37:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	MGCOVaY17Ad9+UUgzh8TP9K1EA7s2p63TnHnE17GZUs=; b=OIP+FHMLn2yvrtF5
	+ewAYmby+R+lSHLNMgAEeYyOIx6mq3zMIWdCGDRCizVhuYpt2OFMdF2+GCpJGEaQ
	SobRXaCUckNuM1dV0/iQiFYyk2eW8UCiR2/gDLMCue1nebLg16XEANd9AGwgM/Vb
	awvyIYJ9wF34IEdPWpw4T5kAqw+yM7f5Gso7SPf7jluXGuCBvm1t9Pk4Ll9WDDZa
	zRVGmkDkIgu1aAso5i6Kwbkg7AmZH7nSJ7b1BxbZ6GlSWXlzE8FieqpO/zTEq1Af
	qRTsWU2dvT9Ce/4E8QTRrbD4dIZVMnKXKQutcMjzDkZvTq/zBvN7Gv5vtNA7H1O7
	PtWdqw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cj8bdatc5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 26 Feb 2026 14:37:44 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8cb456d53a5so76085085a.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 26 Feb 2026 06:37:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772116663; x=1772721463; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=MGCOVaY17Ad9+UUgzh8TP9K1EA7s2p63TnHnE17GZUs=;
        b=YjGNoCe89rzXPLx497JLGmDeLY7FSvLIJ/uqrh+ERKwdQ6pic/l9R2PnldfMjRVa61
         IGXbndBXGZWuHxPDuA1YD2mYZtW1B4slkmCB6tg2WJ74USAer5p9+ue3Ixy+dOh91XLP
         NQTmDBpgoL5YKrsjVE51Paqhf7ljnV+2FO6p99BtIcErmkfPoJm468DjeHGVzCZQc1E/
         rNWETmDgRhSGqEIcBacMcAJUdQU+ZNlC4+y4CyZqEjQBj0NgJyuJDJdaUf+lIx7KqeQf
         JnzuuCjv0/YbZnUprFBSZrgFIFSuubR0b4sX1FmiVkWOCxxSMANaxCTSzTVbkPV5nhK6
         aMsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772116663; x=1772721463;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MGCOVaY17Ad9+UUgzh8TP9K1EA7s2p63TnHnE17GZUs=;
        b=RnECtUgCSuwJvMGn9u+Tn5PLKABKkVtYTcvB73mYUpSy5t6US0nmcvnvKMlXP3awTR
         GuLNi5CmOY8xWPPOY16nF7T3wfrLzkDOVTb07COw2UMNPIgH+aWzE0sLfPxxL2oElW6U
         GWfGFV61yoorcO0pda3Ftbddq1FJVEY3WT4ubcicYcv7uwTt48g+B63AlXNiwT1OR2dr
         IacDG/ijudJkYbO+xc0vzb4ovXzYn2DQ+DREdN/zGFL57faDbSOBmPm3TwUHgYdcWazr
         xhKqf6s1lZpsvgtJoGzNAHZ5yY7lPKBb1keU6KjvMHqMcMtc3OivJl4FfJxmKvkpkLj8
         zvGA==
X-Forwarded-Encrypted: i=1; AJvYcCVj51ycNSsb7KHk2CPY1OBZ59/OkX7dfEz/27LZe645ZyWBGQmna3m6VaEOUBJIyAOr0M+uRXf57lXBdTdO6eoV@lists.infradead.org
X-Gm-Message-State: AOJu0YzNwUOO8twFQ3/RHiAZiBd9EwXgkzgyMJCx/sFKq1CIew2VvXh1
	GHLAQjK8Rie6DbpmYPALUlRNUvN3KQVZJwb2tAdnKq8KBkTQe2e+hRGRdWq39c0hJ+gajGjQsgf
	vkreieMHUcvYzvSfLVTCnB5gbcJ0YYtWAnIp6b4R572Q4oLvQ2XXnlyGrQAQpjPKl+ahaSLWe5G
	nn1Q==
X-Gm-Gg: ATEYQzxENGjmz32qqEZjh+EYrPobrxnrdsqTeIXfKR5yR7j/DbQbJHYbUrhbsSt8NU7
	FsV3WfxG7gjhY0OS0D9gyiXMYv8l7uV3VoZ2m2KNkLBCsezdmcs8Kzu80ggTFK17oW3mhQjWfhr
	vEZTXMC/yZytJQoIb6gUIJGtZmQqiiBqUdsZGvjGWGfRcJUNsTulXV+wCrkh6xv4CMCvk1YxjPs
	u3w60PqNuxux0EQMwrfT0+GsNcVUOk0TL1RZbtuHOUF0J6aFIBOAINBP7gEkI/7srdJuiVNc8C0
	tRfP9fxsk7V0ctyPmNWT18uxTYRmx+zR1ZFoCaeywUBdZ51uGmqbCZxJ21u1gs7CTQAWIsQMHbw
	5gOpw8FmXTj6ffUBUloV8Wvhvspig2SnX4ls4/XD6HsTDKCMrhtmSP+DgXWFrqal8OcyAmG8RNz
	2G+q0=
X-Received: by 2002:a05:620a:6910:b0:8b2:ea2d:a5 with SMTP id af79cd13be357-8cb8cabef31mr1935602985a.7.1772116663427;
        Thu, 26 Feb 2026 06:37:43 -0800 (PST)
X-Received: by 2002:a05:620a:6910:b0:8b2:ea2d:a5 with SMTP id af79cd13be357-8cb8cabef31mr1935598685a.7.1772116662812;
        Thu, 26 Feb 2026 06:37:42 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-65fabf6d1c6sm509000a12.17.2026.02.26.06.37.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Feb 2026 06:37:42 -0800 (PST)
Message-ID: <77f52ff4-4b6c-4f50-bcb0-51b89e67d0ab@oss.qualcomm.com>
Date: Thu, 26 Feb 2026 15:37:38 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/2] arm64: dts: qcom: lemans-ride: Enable mdss1
 display Port
To: Mani Chandana Ballary Kuntumalla <quic_mkuntuma@quicinc.com>,
        dmitry.baryshkov@oss.qualcomm.com, marijn.suijten@somainline.org,
        swboyd@chromium.org, mripard@kernel.org, abel.vesa@linaro.org,
        andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, robin.clark@oss.qualcomm.com,
        jessica.zhang@oss.qualcomm.com, abhinav.kumar@linux.dev,
        sean@poorly.run, airlied@gmail.com, simona@ffwll.ch,
        alex.vinarskis@gmail.com
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        freedreno@lists.freedesktop.org, quic_rajeevny@quicinc.com,
        quic_vproddut@quicinc.com, dri-devel@lists.freedesktop.org,
        quic_riteshk@quicinc.com
References: <20260226111322.250176-1-quic_mkuntuma@quicinc.com>
 <20260226111322.250176-3-quic_mkuntuma@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260226111322.250176-3-quic_mkuntuma@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=FKQWBuos c=1 sm=1 tr=0 ts=69a05ab8 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=XQLX8yjaJUNYVVxXu1AA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: lAVAbLo76KezN7JRHvEA3L00HDWoDjbi
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI2MDEzMSBTYWx0ZWRfX3c/skawFxPXS
 xOiyBXFGol4yJxLviN1BH4C3P1gmPw2AhtrevWABzXiMG4ZBEvLMl58C4izuSZ0DDLd4ANw/1EK
 8nKXu8Inu4L3z/r0GQ4R4hnoOTbxJYDHclG3NziP6pJFSd2YsYVmr11M/F8YMLN28dlgoNQL3Ss
 iI1pKiR4dhfQ5S/bX9xSDDdl6kzj1gLn6FMDhF3712zWK53sTRb/7fSZJZV6t16q3v2liX/Yi7J
 9UMHI5/HHjNM67Oy5NpLM8vqErOuS+cjNm+vBXllt4Cbf6yZmmDTNaiieQNd4QXUwOcmV6+GQMw
 LYyTouD3tqu7DfOkvDMD5TZha5XKAeN9aJs3KWZMOhio4S5qvOushSsdRR3GuJQqKtU2OT4dIoP
 WM5gNdQ4gaomWyMyw1UmSBj3OCfliHUbd67Ak8wdN1y0705onjw71Kux8IBe2BsBT0BMN4J+7yV
 UvOJ/5RGHyqKP8y10nQ==
X-Proofpoint-ORIG-GUID: lAVAbLo76KezN7JRHvEA3L00HDWoDjbi
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-26_01,2026-02-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 malwarescore=0 bulkscore=0 phishscore=0
 lowpriorityscore=0 spamscore=0 suspectscore=0 priorityscore=1501
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2602130000
 definitions=main-2602260131
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260226_063746_033280_B53C851B 
X-CRM114-Status: GOOD (  10.18  )
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

On 2/26/26 12:13 PM, Mani Chandana Ballary Kuntumalla wrote:
> This change enables DP controllers, DPTX0 and DPTX1 alongside
> their corresponding PHYs of mdss1 which corresponds to edp2
> and edp3.
> 
> Signed-off-by: Mani Chandana Ballary Kuntumalla <quic_mkuntuma@quicinc.com>
> ---

Please switch to using b4, you omitted including a tag you received

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

