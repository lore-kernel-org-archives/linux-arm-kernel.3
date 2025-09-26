Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E29D5CAC5B8
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 26 Sep 2025 07:09:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FiMzZ4vz22Rl097tXf+wFhXKFt60cY1ODkrhVnPMDCE=; b=rV/3LCx4yR4gmEldN33CEv4F+Y
	ZP5ObPHQ26hvavYQuvIAmEHa3bGl6gc6iUeWsotU89eMZHI+J2yirQX5nCfKXkNEdw9EVmnXqXwnW
	UVPBV7iOj2YsdU6pxNhxrFMNQ57Rdhxdo52Q0JZffkhjkGJeFSTkzK6wNj7JddV9vNML3xSo/VSw3
	aSq8FwnxOk1f4Tj5IuzZ1H9IGG3X1TdGiKUxPsLS2SX+UUdkaZMr7Rq93+QZIiLPA2SbPgS4lX25p
	xz1jfxd9DqAq/RT6gkB0ee+XS7+zq+jdOZeUn7hOrywNx3rgCTag0kZAhDCeKKpLZWjjAHYPcjJkp
	scf681fA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v22aF-0000000Gdm0-3Tbi;
	Fri, 26 Sep 2025 07:09:35 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v22aC-0000000GdkP-2yWg
	for linux-arm-kernel@lists.infradead.org;
	Fri, 26 Sep 2025 07:09:33 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58Q6x4lk015888
	for <linux-arm-kernel@lists.infradead.org>; Fri, 26 Sep 2025 07:09:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	FiMzZ4vz22Rl097tXf+wFhXKFt60cY1ODkrhVnPMDCE=; b=J3qVcvXYlUuoRVqy
	lRjFU5FuKBu0X9L67bFI4kTqDbMAJtUQFL5w7b0crDrJwycWq4V0hzLQ3S3W9wFH
	UF+MnnXfmDNDWtt1o235ygNStK1U5hD42Y6fBUvampYbuMB+WtKMHWnhVhIcEzLH
	yyV3FK5FfJNfT9zGf/+7dwaaRZCHmwrF40yLxKZ1/Xppj3lCe5c5/5FtzD7mc8gr
	cW9Mex9W/kS1uvPV6aMZz/HHBqrjDBMj4qw7VRGvOvpy9FvppBLFoc9DMSkgnizo
	Ho65NtBMoHW6X8Ie8sprgpmS5ImuV9Gt9PDpYv6ccm0UNajT+6Ofmc6ALRfjQ4s7
	sOTCfw==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49db0t9trq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 26 Sep 2025 07:09:31 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-24458345f5dso28064825ad.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 26 Sep 2025 00:09:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758870570; x=1759475370;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=FiMzZ4vz22Rl097tXf+wFhXKFt60cY1ODkrhVnPMDCE=;
        b=MKcVAYaybKKGynNxtcwzhbLEtLGZ8E16BToLfpvkL87P3ki+aUpFYId/ZeiC0BEdS5
         gpUGFaOYebkq6Ou7HVwf6TIVeB9EiblN7iNpuk4ZDXPgHxizNDU5NFSNy4fMr32Tk+o2
         T9OGHZG9aqzHejW7kTyTt0a1cchkQnCJsmFsO+FQI37iej24eIzo3lph2uK1X49aAM4Z
         paCjLePYqbxUKexue2e9TsUllCbnJfwzgc2hTCbGBUi9bZTrqyBaht853zVE2lI22VIj
         2tIWTulwX84I63bkmFbLCbDY+Sz4UJf1ka2KYksmzcLuRHK4eTfd7Rve+gceg9TR4B9J
         62gw==
X-Forwarded-Encrypted: i=1; AJvYcCW+hnuHlcse5QW3a2wJo8o8u4e7cLRAKVUjz8ynUvDHXaeefAYZqfnS0RptYN3/ZPT68caQ01eOuKoIsJM+HabD@lists.infradead.org
X-Gm-Message-State: AOJu0YyXgY4uDJ3/oypv7BuApAMmS6poGagjMWEBI+7N48mEuWAUGJQB
	nuIHooYiRSn+puDb1SLJI+hlN29ElhLzOJDEBL/SRmjnxDR7zUF89FsNjQBownvmgVIJWNHPktD
	IqB6iAlEEIaNWu3X5bpQRM5Z9YnW7QgS3RnBo+0Nslhw94I3ituE4iqQqe7z6A8taq/aJ2gnYHZ
	oTnA==
X-Gm-Gg: ASbGncvBkEoAbMC7lH8TR/SxtrBhnEt97LpxMIT8XZV2nW8ZJ6qDIZWrDXiVteAuvM/
	F5RpZF5M4hgosxgEXpo0dv2x7Wgthx10cTEp7bhaJbPTPyEkO3BvFzVnae9hOBoWUhue8WK4HVW
	XZLx2LoDNjXZkAcNx88iXPQAwXIe1WmJwHtQsAgltM7T8VDnUY3psMw0MnZ6Hn1G2nsEMQnPHRy
	LF9ad48EjSgGFlobni0Ihf4kHx6PWfVDCof7wPEa3uT86gGweX8vjxgnJm1UHEyRxgjHJfEIs8W
	Zk0dhAi6+hqGAUhqkcdWEpjiFBbeX+c+Tyi4n5S/PPm2Amw+eyyH9QOu7CG5xCPj+Rmu
X-Received: by 2002:a17:903:32ce:b0:267:c984:8d9f with SMTP id d9443c01a7336-27ed4a0dba3mr75468995ad.24.1758870570338;
        Fri, 26 Sep 2025 00:09:30 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEqHGrxe8xhPkP6vuNLzQiWx+Rm84GN1CL+4+QaWX56Yg2h/x7LJeftQZFHKJ2KkwePgdl9Uw==
X-Received: by 2002:a17:903:32ce:b0:267:c984:8d9f with SMTP id d9443c01a7336-27ed4a0dba3mr75468445ad.24.1758870569854;
        Fri, 26 Sep 2025 00:09:29 -0700 (PDT)
Received: from [10.217.216.188] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-27ed6ac94ffsm44250615ad.136.2025.09.26.00.09.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 26 Sep 2025 00:09:29 -0700 (PDT)
Message-ID: <b0541564-3ff2-4cfb-84ff-1d3d59449f86@oss.qualcomm.com>
Date: Fri, 26 Sep 2025 12:39:21 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/9] dt-bindings: clock: qcom: Add support for CAMCC for
 Kaanapali
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Taniya Das <quic_tdas@quicinc.com>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Jagadeesh Kona <quic_jkona@quicinc.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org, aiqun.yu@oss.qualcomm.com,
        tingwei.zhang@oss.qualcomm.com, trilok.soni@oss.qualcomm.com,
        yijie.yang@oss.qualcomm.com
References: <20250924-knp-mmclk-v1-0-d7ea96b4784a@oss.qualcomm.com>
 <20250924-knp-mmclk-v1-3-d7ea96b4784a@oss.qualcomm.com>
 <4315205b-5320-4a8f-a707-45f5eb35ae51@linaro.org>
 <8c558ac3-541b-47c4-be4b-c9101997de7c@quicinc.com>
 <14df3870-6cb1-4e5d-9c4d-bb8acef8c594@linaro.org>
Content-Language: en-US
From: Taniya Das <taniya.das@oss.qualcomm.com>
In-Reply-To: <14df3870-6cb1-4e5d-9c4d-bb8acef8c594@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 5jI_-z_UZwj7rURkymn7BJtmXOlkAca-
X-Proofpoint-GUID: 5jI_-z_UZwj7rURkymn7BJtmXOlkAca-
X-Authority-Analysis: v=2.4 cv=Jvz8bc4C c=1 sm=1 tr=0 ts=68d63c2b cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=hVoh_Pt7g2FPdimnm9wA:9
 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI1MDE3MSBTYWx0ZWRfX4HcPMrFV4CQS
 8i/ghBMvZCQcGziNkaWXyb468IXKhqP5To2UJw/zwn14gANr6xS5TfgyLspRQL9Awnzus1u1vjI
 3c77zcatIVoKyX10tbQzBtO2g4aaIZhYwNf8P55uQkuEoHzv+d/Y/6hny8PNxBsRb25eK3tvU71
 34NErffP5WwDsRcQXEN/4geUjZeyJ6r1eW7D/opN0O/b3pmc3xcHoMLAWTIP5+CzhvhuZkvaOzs
 ULa2woNqywcRJy8nnYBfpwlDHjmVepTHrGuN1a8lZpUjqAxQi6knWlJrcJyc/ICN5SDbYVSZX65
 aIPdGjah1k0UX7AhICW5FFX+8ApEgcyAHnhO6OMxaNck4bN3F0upgOgaMbhqx+60hJR81tOj3Nx
 6bfTnGJAo/UGnb6lWsnTGDXWDZpsDg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-26_02,2025-09-26_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 bulkscore=0 impostorscore=0 lowpriorityscore=0
 suspectscore=0 spamscore=0 priorityscore=1501 adultscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2509250171
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250926_000932_866203_88A8D2E3 
X-CRM114-Status: GOOD (  14.54  )
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



On 9/25/2025 2:31 PM, Bryan O'Donoghue wrote:
> On 25/09/2025 09:46, Taniya Das wrote:
>>> BIST == Built In Self Test ?
>>>
>>> Can this not just be put into one camcc header ?
>> These are two different clock controllers CAMCC and CAM_BIST_MCLK they
>> should not be in the same header.
> 
> BIST means Built In Self Test ?

Yes Bryan, this refers to the self test. However, the hardware does
support functional clocks for the camera MCLK.

> 
> Is this really something to be upstreamed ?
> 

As this block supports the functional mclks we need them to be upstreamed.

-- 
Thanks,
Taniya Das


