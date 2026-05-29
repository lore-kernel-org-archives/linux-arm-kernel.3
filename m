Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78F2FCD6E50
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 29 May 2026 15:01:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0DBIjTIgaaXjiGvnFuMwPeT2jOYan/1jCVFnVrf0W20=; b=LKuD0zaoS7JtlMPC4ruRIRW2Ih
	Srx2I8xTv50+OfRRYS6zmw3Ch0Da64ls1dzCjM/tZdVUe6pDAFRQSSMeTxQmcAx6uwd8+kTDrjxH6
	n+qe/b/pGkJ40UcMKIh0PAUUqzQfyA17caxwI1VBUveTlkQCPoIZb51XOadIPZbbaJwsY0adp3tHy
	nLuvoKmfxVcAYDTrKhXyM4r4W9VuEj0O7K+XLIqswEy3wQd+24NroCbUdO1QcWBnDm6PuDyUXVdsk
	jJsAttVI68ehGEnzbudqUhYqIawXer4QxpARRo3EBgKbfYCgXLHnd/Vamv///jPyS8SLDO0dYE6tJ
	lSFhvcJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSyhz-00000007bPd-1pyt;
	Fri, 29 May 2026 15:01:11 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSyhx-00000007bPF-1ffw
	for linux-arm-kernel@lists.infradead.org;
	Fri, 29 May 2026 15:01:10 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64TDL2sw3249547
	for <linux-arm-kernel@lists.infradead.org>; Fri, 29 May 2026 15:01:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0DBIjTIgaaXjiGvnFuMwPeT2jOYan/1jCVFnVrf0W20=; b=Xvtg33A3ig+6aYFG
	oL8rJMr/IQKZvLMoyLnn0zZXciu8R5PCNt+FJ4h8h7q+e19LGgNKQfYe289MgRmy
	DFggJITACwYZqw/KacpmhoJ1jy15LK/X3G/BXim6nF8FddZA/9eJP/N/oINCoVyM
	oeWxrLL9qpCKke5Od+xGjJDKap2oeqZ4vFCteFxZA8XayB5vCSA9LMVGUL1G+seo
	4g3+3faCQM44ek8O7ZxNGGKSEgdz7TQRflOJpbfZD2zSGBd8c63tbps7IlwGQwNk
	w6V5S4timf1fGU7BMDTIyA5BVwsbIX/Kuv0vREq2sT4fas/QvGdopxIBX/CnBYVF
	FN1dIA==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ef015b7ry-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 29 May 2026 15:01:08 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-83ef22f8e8bso9490427b3a.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 29 May 2026 08:01:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780066868; x=1780671668; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=0DBIjTIgaaXjiGvnFuMwPeT2jOYan/1jCVFnVrf0W20=;
        b=L30tLZDDKS94z6lMNn1CGAH68O1hSOZgRtoZI15UMg3fz5/BuHa37Urg7716YhLiQJ
         6nQvx4ZmpIRRmOf7RdLlnUE6iaiFYqOncHKi9EFuS0IJoowfLNK5MIjbFFvV2DVM0Nrx
         nvSJ7wTaUB649A6PYcqMVIhIQgur2IupVE0T8FqNcejwcFjiUjUdQH/izaATVGZjrDwq
         I23PAc6dPrnpKlKyVZPgSvBbMnrTK7M5r24f/qF0kllSFUw/7PG7Bt4IWcWP4C8sKqUY
         h2rYJZjrX4pkrbeipCCC3OW3ZB5vK5/Dt2X3a7t/kUO0cjZJt2LoyD+p0cdoi/BqNfrd
         hbPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780066868; x=1780671668;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0DBIjTIgaaXjiGvnFuMwPeT2jOYan/1jCVFnVrf0W20=;
        b=DXBAbZOJqgaXvL4r/14Ij6E4f5tvGypOO2xGpwkhWszRjTqfELSmMaVTFSkDqKoBfL
         RSP7f3PJY9GxHP4+jUm6yEQBlUCPYAyqITPuqp2L9N+ee9YlFCY/TbEyYHVfnTNfv2Q+
         eXQkDaH4fM8Gduxn3CrRpHy9eM8c/cjR2xpuICDYuAaGgFOlZquYCk0My70Ip8/X7jr7
         7o56JWj7V3MX2MjBegQo73WRSWncXF6fqj9geeAWD70i15jRYw10EJHVJFxRyL28T5wu
         XUT8QEaML2NI6Qg0d6UIlA/iBpvSmeq9TfE6PfXQLGWQXh2k8ax56iVgP5NE4c8B/isR
         08rQ==
X-Forwarded-Encrypted: i=1; AFNElJ8xxmOeidgUM56vmjsISuW8irVbitKVvNXFv0s7OgsIRhiDYChGxUeKBoXrUOorVRhzq3xpmMY7PWJqtvQWhxoy@lists.infradead.org
X-Gm-Message-State: AOJu0YwVNBw99R0gC2kGHoX6GzPGOssN9cSeevGB6KUmbbdMLI9a3BLT
	7do1jR0fo3e5n8DwqojUmWnIol+j4yUnuTpPiRD8F1tGB2a8k7RVKslvV4dBMVYhUAPrw8Ag9W7
	NVMovrZK+/k9hPxSCkBLZr00GcCjS9Nzn+wVVPGehJzFZhSW79xRf0AA6Yp00RlxScavN+/uiG9
	bZMQ==
X-Gm-Gg: Acq92OGg2eztKQ1ETzat3qMbhIhYbXQM8GB2KSGMBppZyArU1gH6GxqZzmFBLPuPzjV
	uU7FzK8pQRHjITwjK+2I3EEy+DsscKlM7dOlKXX1l8Rvej6NkLYu3hOVw4U0hgczoIdKE4b8OAG
	vvrBqlOu3lH9D9KnCPBsHrjWbno9c2F4Lw5CM8r+iritBl3Jv1kyvOIB8RrZmwwhM9OqVGL6CqZ
	gttlRvZNK1H7nnlVN/vXeC5U4vuvRSPQP0vSt6aJh66iaT27Pv6gUN7lglMeriQBjudpfikDrtD
	i/iWzy/AUJKAGOiaualfoW2hINnaD1LfHzjLDdGDcz5nj6QQv14y2aX+PpC8IT68Tl5iDZ+qdAm
	RD3Lw0TAvsSgXa45G5XpAz6HStAIAiPKpj0WhYD//ZgmY0PodDQdYBNT1iYDmF5s=
X-Received: by 2002:a05:6a00:440e:b0:82c:daa4:ce29 with SMTP id d2e1a72fcca58-84212c2fd94mr3681690b3a.47.1780066867474;
        Fri, 29 May 2026 08:01:07 -0700 (PDT)
X-Received: by 2002:a05:6a00:440e:b0:82c:daa4:ce29 with SMTP id d2e1a72fcca58-84212c2fd94mr3681595b3a.47.1780066866769;
        Fri, 29 May 2026 08:01:06 -0700 (PDT)
Received: from [10.204.67.150] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84214b6797esm2739983b3a.26.2026.05.29.08.00.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 29 May 2026 08:01:06 -0700 (PDT)
Message-ID: <21c17cac-2a1e-4b19-ab6d-ddca9132d725@oss.qualcomm.com>
Date: Fri, 29 May 2026 20:30:57 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/8] media: qcom: camss: add support for QCM2390 camss
To: Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
Cc: Bryan O'Donoghue <bod@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Robert Foss <rfoss@kernel.org>,
        Andi Shyti <andi.shyti@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Frank Li <Frank.Li@nxp.com>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>, linux-arm-msm@vger.kernel.org,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
        imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
        Suresh Vankadara <quic_svankada@quicinc.com>,
        Prashant Shrotriya <pshrotri@qti.qualcomm.com>
References: <20260526-shikra-camss-review-v1-0-645d2c8c75a7@qti.qualcomm.com>
 <20260526-shikra-camss-review-v1-3-645d2c8c75a7@qti.qualcomm.com>
 <CAFEp6-1VAW-S2d3q3uN2n1weMOoSPXtX_k_6msQ-K_5A5mZVLQ@mail.gmail.com>
Content-Language: en-US
From: Vikram Sharma <vikram.sharma@oss.qualcomm.com>
In-Reply-To: <CAFEp6-1VAW-S2d3q3uN2n1weMOoSPXtX_k_6msQ-K_5A5mZVLQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: bLHvFAV9bVUAW3SIUF-ozFFyRzRpHQGv
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI5MDE0OSBTYWx0ZWRfX8jmuIRavLwDq
 5WPylozvZG7wNNY4vv4b858OcNszoGPXnSrwoneYy9OO/WFhstNwcK0i/fsIqQWpWTTtjy9LY6d
 YGUjsNOkwYwRrXVaV6Ea2SPMSQVUC7w+BZJ+XCWdJk4hT9vdAmgVw/R+H7BH6VOrZxE3aLah70K
 srh9LeYefaAQ2Ug2ED5JJChmDSUbHE/A8yDNLRk4fF2EW6UCygZ2yBwVa0YfPUjhH1J3nFs7D4z
 MeOpkHClSRdvymsTfJuU9CNRo9eyX9DWVOdaOQqokWDMHJUFEPMc8gIUNloU+hstFJrplZRyJJQ
 wSY/OdTNWqy0zQ090sdMWSgIjm+GnoP+l8gsPgqGwInfQL4ySENm1HfYxZ9/9PFxh+GFCABpdEf
 MgaHrSl5MRZEtJiub1ykkNDTyH8eTCbE16tqAhqCEBt3lioddFgLcf0dxat+78oPd11dObhKO4H
 98vsN44JteUqPAEeNjA==
X-Authority-Analysis: v=2.4 cv=DIG/JSNb c=1 sm=1 tr=0 ts=6a19aa34 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=iLf03rxdIeEfhWbO6WcA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-GUID: bLHvFAV9bVUAW3SIUF-ozFFyRzRpHQGv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-29_04,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 lowpriorityscore=0 bulkscore=0 priorityscore=1501
 spamscore=0 impostorscore=0 adultscore=0 clxscore=1015 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2605290149
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260529_080109_441533_09DA375B 
X-CRM114-Status: GOOD (  19.78  )
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


On 5/28/2026 5:55 PM, Loic Poulain wrote:
> On Tue, May 26, 2026 at 7:13 PM Nihal Kumar Gupta
> <nihal.gupta@oss.qualcomm.com> wrote:
>> From: Prashant Shrotriya <pshrotri@qti.qualcomm.com>
>>
>> Add CAMSS driver support for Shikra SoC. Add high level
>> resource definitions for 2 CSIPHY, 2 CSID and 2 VFE instances along
>> with the interconnect bandwidth votes for AHB, HF and SF MNOC paths.
>>
>> Signed-off-by: Prashant Shrotriya <pshrotri@qti.qualcomm.com>
>> Signed-off-by: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
>> ---
>>  drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c |  2 ++
>>  drivers/media/platform/qcom/camss/camss-vfe.c            |  1 +
>>  drivers/media/platform/qcom/camss/camss.c                | 13 +++++++++++++
>>  drivers/media/platform/qcom/camss/camss.h                |  1 +
>>  4 files changed, 17 insertions(+)
>>
>> diff --git a/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c b/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c
>> index dac8d2ecf79957dc05c5524dc439791ce097c785..62208f5c4f17bd6c9a8fe5613649920e6ee1a1f2 100644
>> --- a/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c
>> +++ b/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c
>> @@ -1130,6 +1130,7 @@ static bool csiphy_is_gen2(u32 version)
>>
>>         switch (version) {
>>         case CAMSS_2290:
>> +       case CAMSS_2390:
>>         case CAMSS_6150:
>>         case CAMSS_6350:
>>         case CAMSS_7280:
>> @@ -1222,6 +1223,7 @@ static int csiphy_init(struct csiphy_device *csiphy)
>>                 regs->lane_array_size = ARRAY_SIZE(lane_regs_sdm845);
>>                 break;
>>         case CAMSS_2290:
>> +       case CAMSS_2390:
>>         case CAMSS_6150:
>>                 regs->lane_regs = &lane_regs_qcm2290[0];
>>                 regs->lane_array_size = ARRAY_SIZE(lane_regs_qcm2290);
>> diff --git a/drivers/media/platform/qcom/camss/camss-vfe.c b/drivers/media/platform/qcom/camss/camss-vfe.c
>> index 319d191589884777bced456867e5a2a4211a2770..b152f8d48e003d8eeb0cf19ad57419b25cdec087 100644
>> --- a/drivers/media/platform/qcom/camss/camss-vfe.c
>> +++ b/drivers/media/platform/qcom/camss/camss-vfe.c
>> @@ -342,6 +342,7 @@ static u32 vfe_src_pad_code(struct vfe_line *line, u32 sink_code,
>>                 break;
>>         case CAMSS_660:
>>         case CAMSS_2290:
>> +       case CAMSS_2390:
>>         case CAMSS_6150:
>>         case CAMSS_6350:
>>         case CAMSS_7280:
>> diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
>> index 2123f6388e3d7eafe669efd6b033e22d8eb5cf79..f67ecff53f15bd213dc7736d4e5fe880007d1ee7 100644
>> --- a/drivers/media/platform/qcom/camss/camss.c
>> +++ b/drivers/media/platform/qcom/camss/camss.c
>> @@ -5565,6 +5565,18 @@ static const struct camss_resources qcm2290_resources = {
>>         .vfe_num = ARRAY_SIZE(vfe_res_2290),
>>  };
>>
>> +static const struct camss_resources qcm2390_resources = {
>> +       .version = CAMSS_2390,
>> +       .csiphy_res = csiphy_res_2290,
>> +       .csid_res = csid_res_2290,
>> +       .vfe_res = vfe_res_2290,
>> +       .icc_res = icc_res_2290,
>> +       .icc_path_num = ARRAY_SIZE(icc_res_2290),
>> +       .csiphy_num = ARRAY_SIZE(csiphy_res_2290),
>> +       .csid_num = ARRAY_SIZE(csid_res_2290),
>> +       .vfe_num = ARRAY_SIZE(vfe_res_2290),
> So isn't it exactly the same as 2290? wouldn't it be easier to have
> the shikra simply fallback to qcm220 (via compatible string)?

ACK, We will simply add fallback to 2290 in dts.

>> +};
>> +
>>  static const struct camss_resources qcs8300_resources = {
>>         .version = CAMSS_8300,
>>         .pd_name = "top",
>> @@ -5752,6 +5764,7 @@ static const struct of_device_id camss_dt_match[] = {
>>         { .compatible = "qcom,sdm660-camss", .data = &sdm660_resources },
>>         { .compatible = "qcom,sdm670-camss", .data = &sdm670_resources },
>>         { .compatible = "qcom,sdm845-camss", .data = &sdm845_resources },
>> +       { .compatible = "qcom,shikra-camss", .data = &qcm2390_resources },
>>         { .compatible = "qcom,sm6150-camss", .data = &sm6150_resources },
>>         { .compatible = "qcom,sm6350-camss", .data = &sm6350_resources },
>>         { .compatible = "qcom,sm8250-camss", .data = &sm8250_resources },
>> diff --git a/drivers/media/platform/qcom/camss/camss.h b/drivers/media/platform/qcom/camss/camss.h
>> index 93d691c8ac63b2a47dbb234856b627d8911a1851..8ba8a38113dfc15849fa333d05b2c3853f3a7714 100644
>> --- a/drivers/media/platform/qcom/camss/camss.h
>> +++ b/drivers/media/platform/qcom/camss/camss.h
>> @@ -82,6 +82,7 @@ enum pm_domain {
>>  enum camss_version {
>>         CAMSS_660,
>>         CAMSS_2290,
>> +       CAMSS_2390,
>>         CAMSS_6150,
>>         CAMSS_6350,
>>         CAMSS_7280,
>>
>> --
>> 2.34.1
>>

