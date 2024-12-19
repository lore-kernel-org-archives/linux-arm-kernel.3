Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6BC90E77184
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Dec 2024 19:09:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Xme2slGOLEbJocB9IGjx7rTsSbBQsnZE7uGnFV/HUcU=; b=gQ8XSYzHGuexW34x5IC9/J99Hl
	D7grlLWfR3e01bnz66ubmQ6SYmE7iLIebZqdejT6RNhFIOlcarjhuMvm5niHxTbG/GQqfYiHb2Ro0
	8j5F/tKXIY2GEFaSxzJUsJAC99TjX13q3kRdfl1MQA2fzXCbbHsRpUTX1gYfaP3OU7O1ktcMN4QSQ
	MOdikwfvpXhNqTGFp5bprb2ZkminV/W/wDeBiDJI6m1Tmopd0zmYRbvPneF5T/atVvrz+6MKxAWSt
	a7unEjDR/RS1wB60egahzuyqrf06CDQfo+7My3f4DE3R8pvjy5AjtgQ/2W+rBfHFmTFROfqnYXYH/
	ROy+cnpA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tOLtI-00000002nnJ-2iyG;
	Thu, 19 Dec 2024 19:08:56 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tOLro-00000002neS-1GNk
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Dec 2024 19:07:25 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BJIl1xj000470
	for <linux-arm-kernel@lists.infradead.org>; Thu, 19 Dec 2024 19:07:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Xme2slGOLEbJocB9IGjx7rTsSbBQsnZE7uGnFV/HUcU=; b=lOpUjl63XbC7NSLu
	CZQNKN6Qvy+74280qGjzpjH5O++8tY1BbypdaBhJgO7BviWzx41v80LhQm7izMib
	kdA4vzVFHbpq37PNAldmNNPARLfdn2ndwDav/kPTYE/kdAX8UEbPRxzvdmmJSyBO
	KmOEkIWZBGyaGm0zMgESXrVQQ8YxzxTGKKRxk1X+m3jbfRZZF46yGU3vOWE8v1s6
	1Sm/HV9eEEargOUzgMTq6cPgK8tJddtVZbglK+yEe+Cvzap1nKLCV7/ruhhTMEoV
	ygo4NIGB+UdJxUkd1GQpL+Xnm3HTCEjJysGy0LiU1VE3BIuWtBTRi1PSOlpZprEs
	fc54Uw==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43mg98smcs-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 19 Dec 2024 19:07:23 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-467922cf961so2724001cf.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 19 Dec 2024 11:07:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734635242; x=1735240042;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Xme2slGOLEbJocB9IGjx7rTsSbBQsnZE7uGnFV/HUcU=;
        b=MLAUGgDTUtQbhbVCatQgaTxv7yhQRhfnJdg0Nd8Ee+P2in6T7t31j+OTxgSyYLPR2p
         dMWvT/E5XqjL/WVgZoQ/lOIKx4l+rAcggW3Hx5IHvYKysjgyObfuyFD2nsFQs+GmwFIS
         j5N0r8Vbj4suMEuTvVjmlEuheMthuzN1ATdnv1PxNa9mtjVejxgfSDas35rfz6hFDsJ8
         yLrBv3dDQz+YKPXvtWNhYbbfVBMewi4Cjz/t59+T0kB8Ny2Mxal7UGhPPtuGDeYTEqHo
         5nW5gJY+lkKkVYJZfFrioKAgU0d7zXXYybq5EbwlVojPas++a7P4u5e/sBQuDs/VO+1T
         xJgw==
X-Gm-Message-State: AOJu0YzEJsVI4YeRovjl3yPFwbzyzu/LfNOW7UBcN5MyMjSFs8m+XshH
	HxvaenmrTkOFV6QhoaRWI1t6JogQloO7Y0cq/5mIoAs6Ybc1AGGXpygtLVkqGZkNWQ6BGSeyuLm
	AYVm+KoXlc1LneqsQmtoqvKl7BD9Sj8x/d5ZwPpa99M7Pxa1fU89gTju4gSE7KClCpPLNvHZbvA
	==
X-Gm-Gg: ASbGncv+/GIzWXmyZUznhw+8TUsx8y1w6kcgpLAS7zoCu7rr9k5/lVYFsL58paKrbKp
	Rza5FFJ5DO3GFg6VncRyE5bXE95+YWEB2Xdeghaj4yKp8gI/Ttqvloqizo18Dk3zUo2rXvdozVH
	CFLS8vA5lR7lmw9U5e588pk6Fa9qo7xT1elUVYLq2aF0teVjGNacuZEkDbBuZTLKmjaxGSZ9Wdm
	jWm8EXz2reGsPHfoMBjgZaMpvsOHBquaPEIkJsQ1nK+7ca0UG46MgbdXNYIQjHrhYnYrfGTV82c
	JLegzOnZLorWFYpMpCPEnmjWbVlSq3nhIsk=
X-Received: by 2002:a05:622a:1794:b0:467:5715:25c8 with SMTP id d75a77b69052e-46a4a8b81a9mr959181cf.1.1734635242137;
        Thu, 19 Dec 2024 11:07:22 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFiLwg4qpvhyo6XSbciUnY8+6IEVaUWF1WSYXCTk5jZqKx2WFc24CxCnir5+qhYN0wAyYx1/g==
X-Received: by 2002:a05:622a:1794:b0:467:5715:25c8 with SMTP id d75a77b69052e-46a4a8b81a9mr958821cf.1.1734635241755;
        Thu, 19 Dec 2024 11:07:21 -0800 (PST)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aac0efe4917sm94313566b.121.2024.12.19.11.07.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Dec 2024 11:07:21 -0800 (PST)
Message-ID: <5c4c4ee0-9e2f-4ed4-9fe4-ca41d18321bf@oss.qualcomm.com>
Date: Thu, 19 Dec 2024 20:07:19 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 3/4] arm64: dts: qcom: sc7280: Add support for camss
To: Vikram Sharma <quic_vikramsa@quicinc.com>, rfoss@kernel.org,
        todor.too@gmail.com, bryan.odonoghue@linaro.org, mchehab@kernel.org,
        robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        akapatra@quicinc.com, hariramp@quicinc.com, andersson@kernel.org,
        konradybcio@kernel.org, hverkuil-cisco@xs4all.nl,
        cros-qcom-dts-watchers@chromium.org, catalin.marinas@arm.com,
        will@kernel.org
Cc: linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, kernel@quicinc.com
References: <20241217140656.965235-1-quic_vikramsa@quicinc.com>
 <20241217140656.965235-4-quic_vikramsa@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20241217140656.965235-4-quic_vikramsa@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 17A_WBWOmfya4UYcW_qJVYZ5Qkaech4s
X-Proofpoint-GUID: 17A_WBWOmfya4UYcW_qJVYZ5Qkaech4s
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 lowpriorityscore=0 bulkscore=0 suspectscore=0 mlxlogscore=969
 clxscore=1015 adultscore=0 spamscore=0 phishscore=0 priorityscore=1501
 mlxscore=0 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412190152
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241219_110724_346551_1F75DEBA 
X-CRM114-Status: GOOD (  11.06  )
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

On 17.12.2024 3:06 PM, Vikram Sharma wrote:
> Add changes to support the camera subsystem on the SC7280.
> 
> Signed-off-by: Suresh Vankadara <quic_svankada@quicinc.com>
> Signed-off-by: Trishansh Bhardwaj <quic_tbhardwa@quicinc.com>
> Signed-off-by: Vikram Sharma <quic_vikramsa@quicinc.com>
> Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

