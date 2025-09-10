Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5223ACA101F
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 10 Sep 2025 12:25:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xhCtGHB0DkBobVlK7MICfsktcm5yyzHhvJCYtnxxZbw=; b=msg/U+G97cE99pSFDVY/yPF3p1
	bRLJbhW74e9MN2IXVU93zTRNG0m828lQT2V0HJ3EERjpiJ3sMSaUYDL3pkqbABGlMKsmC97yWMUc5
	QfRrlVjVO+AP8jCnjJpoak2SPNouLzFeXK+Wm44UPmb5EMQbvHOnw6lMtJFq8iq4B2anVvVO6xQ91
	ZmiVX7jxa+qtGDrkkT/xknP0+r59oElgkPNY60p32NHXn4MNtcrci6dTJZW2Tf9Jqn6pZqsCUV9iM
	jPa1S2/j9dKz1a06EWx5YjGrAKTXPSV4qYZWxyurqgD5NTRpoPdfh2d88CQp8xmw+EVc+sJVuLYk4
	XIbnvOjA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwJtM-0000000E6D9-3ppO;
	Wed, 10 Sep 2025 12:25:40 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwJtK-0000000E68f-109x
	for linux-arm-kernel@lists.infradead.org;
	Wed, 10 Sep 2025 12:25:40 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58AAF7nE022078
	for <linux-arm-kernel@lists.infradead.org>; Wed, 10 Sep 2025 12:25:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	xhCtGHB0DkBobVlK7MICfsktcm5yyzHhvJCYtnxxZbw=; b=YGSMO8cs/IX7VOGl
	qYARYWX5lqqlY6xLJWPFYVq6YnEyTXTsbJzzhU8t0lUDFh5WbZb09BEZzKi2NMvw
	pdw9VOhyBIYEZNu2ZuY5Cx2E+REObTSN3O6KUpW8qy/YeUk1LWX7dQhK6IJXuuoR
	N0HLJVkN9lNf5aI1SlZrhL/SPNu0OUeKDPfmEgYkhCarS2eD322RQdHD741xiRWJ
	4ci3fPWRl918MOQuDdI0rGpGUTf3ZWrEXgtTsawcA+gGbZXxrpQezzOLdsvywWDk
	DhFseYpyh9HUOYx2U+GdASX35h4aMfA7F6Wap4VNeS620R3+vh6X0vFO4/QRoIqZ
	JcdkCQ==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 490cj0us7m-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 10 Sep 2025 12:25:35 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-721c6ffab9cso15973976d6.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 10 Sep 2025 05:25:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757507135; x=1758111935;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xhCtGHB0DkBobVlK7MICfsktcm5yyzHhvJCYtnxxZbw=;
        b=lhZ6TVKxcKByfAMmdcwjYV8Sf/Pf5ap8yLrABUod43+nQypm3pHWHHOjO6LzrYGhoP
         97im/O8kV2QNxjX7lo5vV3OGQxgHq09Fw1gmF7whcVgJg6NtKDijtqOlaFZqgBFENXLu
         TcZ3WUOAeSLrlQBVfZUz8gm9x7v5k3I1FpmU+n+yL7jJ+OQga2pjfPHSAh/dLkj6OQsI
         hbK4zTQkNc0DOMO+91W5/afUL19YtMBNp2KzOT21urGLcaqvdM0phpOwnP1ISsVzc7QI
         7Zd4LLnlKFQkoFRAKzJrSS9BoHyTjNoFqlYhb8hPs5DZqIS7hO1VAz2cu3l/5AE2BlNP
         6gLw==
X-Gm-Message-State: AOJu0YwzUSp5MN75xmUNn2qwNs1FqAIYNsaIH29wT8KTwPe48coLPfk0
	tuyUfbvcWLUtwFf0/9+uSTBF0EhkiPWuLK8HPv9EnC1W0j5I3EvK6iOkKxFrJPYTPVJ8NhKdRMU
	jewTs5bM2Tu5Anc7n4V8BdYyWidiaoybYbj2Sy6IqCaCuBdFc349GmEyYhuImtpuRJIm9dAfVfu
	C7AQ==
X-Gm-Gg: ASbGncuJizW+jBNvxlhIorqK2DDYtWHWprArfWa4lW8xOE0I4I96+cFZb9oW3QGQfQW
	L/GMKiBngsk/h3BNJcSFe2I97WgiaReuRj4PWPO0yk7buwGCnm8SfzFrSi1qpi7wcUn8WAaIbfv
	MWIrz0uOrQRfpaGbZZGfyIW77ppCV+rroPE52tq6FTSRkJ6fXRTevXXH1p/z/1hlV1GP1y3aAK7
	Bk1NeusRZc4iWV79o8El3s1hrAPTjJkrmH4PfhmX2ZXS8uVFIhsP3RBFIjNx16LgkEOJORirfl1
	5gy82CNPnIoGvtl45j2m49hE9i+MOI6yYbdRsX1r9p/KRkiK1blExtf9gqnAK/OTec/vcPVoWPo
	CUbZrvCKqXw6AcHxplFBuOw==
X-Received: by 2002:a05:622a:190f:b0:4b5:f4c0:5fd with SMTP id d75a77b69052e-4b5f8531717mr107906191cf.8.1757507134739;
        Wed, 10 Sep 2025 05:25:34 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE27NK31Io4E+jeD+4VIvXuMgeiu+Md8ls94UaGm36iHEowM6oGp7UQf+Mw0cZqlAH0Hlx3cQ==
X-Received: by 2002:a05:622a:190f:b0:4b5:f4c0:5fd with SMTP id d75a77b69052e-4b5f8531717mr107905721cf.8.1757507134155;
        Wed, 10 Sep 2025 05:25:34 -0700 (PDT)
Received: from [192.168.149.223] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b078334b0desm158265166b.66.2025.09.10.05.25.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 10 Sep 2025 05:25:33 -0700 (PDT)
Message-ID: <2a7bd0cd-a6c4-47c3-a6ca-f9d94c9b65ec@oss.qualcomm.com>
Date: Wed, 10 Sep 2025 14:25:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3.1] media: dt-bindings: Add qcom,qcs8300-camss
 compatible
To: Krzysztof Kozlowski <krzk@kernel.org>,
        Vikram Sharma <quic_vikramsa@quicinc.com>, bryan.odonoghue@linaro.org,
        mchehab@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, andersson@kernel.org, konradybcio@kernel.org,
        hverkuil-cisco@xs4all.nl, cros-qcom-dts-watchers@chromium.org,
        catalin.marinas@arm.com, will@kernel.org
Cc: linux-arm-kernel@lists.infradead.org, quic_svankada@quicinc.com,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Nihal Kumar Gupta <quic_nihalkum@quicinc.com>
References: <20250813053724.232494-2-quic_vikramsa@quicinc.com>
 <20250910104915.1444669-1-quic_vikramsa@quicinc.com>
 <5a087d08-273e-4740-b47d-fc25be952ebd@kernel.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <5a087d08-273e-4740-b47d-fc25be952ebd@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: Q2VJsVXgMJvM1OBplXiL0HjsvorE4uKi
X-Proofpoint-GUID: Q2VJsVXgMJvM1OBplXiL0HjsvorE4uKi
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA2MDAyNCBTYWx0ZWRfX9NLjXyL/6uNV
 OYbhMQvctsIJIZ7JnocDUx9Ukuyru5tyPjmczUa8c6gSNTvBQ5DrsvWknfkWE5jBjqTzjJen6Fl
 T7cWfdi0J2tOzjF9QRnp8yxEIecQD2S0HY33QwSt2ZqNlOqK+rEjo/PbsV3tMCn75tag6dW3+4L
 8ktdMI8q+nhUb31+R92KHVgu5Z4Ef7d93L6JY0zEzE8vmmLqrE/P70UWHm0nUfCPdRlO8xkdvSg
 vE4GEFhMi7dclYNdSpY0INiQMmFlemtWs1BIYzCqolyBit0C2BCjs+/b/7/aUfEY/lvR7kjVY5f
 rs/JMYLzx8znjeuG9x4Bk8PgW+KybBAAjDGZQT+rq7KLAYt3Eg0B95vTIMUa9LOXePyDHKUNMQo
 HELOVkax
X-Authority-Analysis: v=2.4 cv=QeFmvtbv c=1 sm=1 tr=0 ts=68c16e3f cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=P-IC7800AAAA:8 a=COk6AnOGAAAA:8
 a=Ttb-WI7uj3phwydCKpUA:9 a=QEXdDO2ut3YA:10 a=iYH6xdkBrDN1Jqds4HTS:22
 a=d3PnA9EDa4IxuAV0gXij:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-10_01,2025-09-10_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 clxscore=1015 spamscore=0 impostorscore=0
 bulkscore=0 suspectscore=0 adultscore=0 malwarescore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2509060024
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250910_052538_426714_BA62483F 
X-CRM114-Status: GOOD (  15.69  )
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

On 9/10/25 1:38 PM, Krzysztof Kozlowski wrote:
> On 10/09/2025 12:49, Vikram Sharma wrote:
>> Add the compatible string "qcom,qcs8300-camss" to support the
>> Camera Subsystem (CAMSS) on the Qualcomm QCS8300 platform.
>>
>> The QCS8300 platform provides:
>> - 2 x VFE (version 690), each with 3 RDI
>> - 5 x VFE Lite (version 690), each with 6 RDI
>> - 2 x CSID (version 690)
>> - 5 x CSID Lite (version 690)
>> - 3 x CSIPHY (version 690)
>> - 3 x TPG
>>
>> Co-developed-by: Nihal Kumar Gupta <quic_nihalkum@quicinc.com>
>> Signed-off-by: Nihal Kumar Gupta <quic_nihalkum@quicinc.com>
>> Signed-off-by: Vikram Sharma <quic_vikramsa@quicinc.com>
> 
> Do not attach (thread) your patchsets to some other threads (unrelated
> or older versions). This buries them deep in the mailbox and might
> interfere with applying entire sets. See also:
> https://elixir.bootlin.com/linux/v6.16-rc2/source/Documentation/process/submitting-patches.rst#L830
> 
> Please version your patches correctly, e.g. use b4 or git format-patch
> -vX, and add changelog in cover letter or under '---' of individual
> patches describing changes from previous version.
> 
> What is v3.1? How to compare it? Try yourself:

This is a weird invention that some media maintainers seem to promote..

As a b4 user, I would also like it to stop, as doing anything other than
v(integer) will open the door for unlimited craziness

Konrad

