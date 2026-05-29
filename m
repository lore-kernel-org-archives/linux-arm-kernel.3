Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1227CD6E4A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 29 May 2026 14:52:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7fDi3qZvLhAdC7/0jy+gsVwkzd9Lct8DJ2M+A7e3DX0=; b=drSE+6F3O7V4BS7i6LdB4Jexmu
	4WKcHjWx3xGKzcEMX5BRYfIm70ylo5eqs1rN/WEauWXaJUsYAvpyxqGecf7msX2ZglC7hKs/iPP0J
	KGl3agIAobm0Jer/JL8jIoaZi2LrlKIA9k8brQkIUh2OhSCeU70GPgI/mgGbUYCQKaFDxbXMMK0bW
	EAV+sV1OXGZMeWQkursjXQrnIEi2PM+/ktyt2sBL3FdL3tT89ts3VQlMT1TyrVXrVr6gQmERoCVyU
	+NwhGdQURyyBjkhyPe3PdXZX3YnRzt68/u/FazE7B/dLkX0hVt80uFJEKIvO8NL2rPHYFjFSn0M3W
	ZhI3gLjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSyZk-00000007a1y-11sB;
	Fri, 29 May 2026 14:52:40 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSyZh-00000007a1P-2Fj5
	for linux-arm-kernel@lists.infradead.org;
	Fri, 29 May 2026 14:52:38 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64TDL2Wn3249643
	for <linux-arm-kernel@lists.infradead.org>; Fri, 29 May 2026 14:52:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7fDi3qZvLhAdC7/0jy+gsVwkzd9Lct8DJ2M+A7e3DX0=; b=WsnegsD/WRgT7zBp
	KZBLOe3RIyTM21H3gknjzlTo+0dXRAyfiCQQTVtGDsznzUIm6YH5vqc4ByboIQmp
	eMmW18qt9ncuqZ+mPB9WBd0MLqIkVfvWtaQRM8RJciofK8pHhC/ecd6O4NXuEarE
	YCJiL823SF8/MsQIuuzHJGpaERcYn6mDnlZWfQ00wNkyT7IF30sqJemQv2r4j4JA
	WuWWtvHZNOuEh8j5uCSTHmDMMrvF6UxOdtJbYHwPO/eXakd3YZUsU3U4n67m4K8k
	9RCjb6XhNP7JA9zBEKKNBGJ9qQMh+JJGbQVNtkhpnIstTuLfKltjCEsovzMocvtg
	d5yOTA==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ef015b6kn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 29 May 2026 14:52:36 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-365fd467cf6so11606460a91.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 29 May 2026 07:52:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780066355; x=1780671155; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=7fDi3qZvLhAdC7/0jy+gsVwkzd9Lct8DJ2M+A7e3DX0=;
        b=AMQNAmPsHgdRDCfxawbrKD13z5YE1BRCTIhak76LQO+Zxyr2xa9KD0kM/fiGAregBC
         kvdFWny0SJRCqSjbrzbiiBm2v0TBm4KJMgb9hv2Hf1VRhkgj3c+UaMM1eOQrIpDFewUF
         CHIYcXjR5nMcPNuGQarweArg/w8xFNq7Wz7rb5fVFkcsmd5zSb9ny2mDSBz9xQ2+hYqz
         Jc417UX1lsuLwjsyGZNYGVO589qSoyZF4TWpkS5ZpwXzAQjwhb7pmEWo1xZywarPq3pA
         W6Baoe08mpD6DYB7azQloQBmWGoWIWtSp7tSfJXYt3c9I1H0cUxdvp3JlFsWt6IcZVgy
         dbiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780066355; x=1780671155;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7fDi3qZvLhAdC7/0jy+gsVwkzd9Lct8DJ2M+A7e3DX0=;
        b=aO/4hdfTWwp3szL3NsNjsPU/c40keGmciJI0/uPS/yXvuE9LjMJXIuEMY+O2E8RLy1
         CkTafDANKKaTfsbe5vM8s/JNZONiMu46fsy81GTUckjfzmD0MmQFcpEGmDvfUg2R7seY
         Nk8ujpQTTPDoq0oaQsA1z0DMAxRIlQ1wS0JyRE6FOuZc5PxrwSLlqOW19gJu1I2yAgxV
         VXLyG+B1LR8yA01M34GRzlEr4t5L5GLT0SjRz0bzOr+WznvJiX0Jp2QJ95BK1nc+g1MC
         Wnrhscske9DtmnAhxnjKoXaFfL51VkYXhU7/+hoShYqIRE47mYTwyY9BA9ur4ojnfwJv
         iYWg==
X-Forwarded-Encrypted: i=1; AFNElJ+uBYl/OoROEiKV766IubL3DB8bZOY09KEMXMw64R8lbY5sE7NaQWpZzC+TdhedCbDQoBk6YwkoqpWEqaRfWtiO@lists.infradead.org
X-Gm-Message-State: AOJu0Yyq4s9A3QcpMxN5H96NaVlaC+xK4LRLKL5YrZIFMJXHDebr2vPx
	kVvyKUrVNH8nSrqzbH81pcDfPwgKLRHYpyw/7+4Exr0ICd+/VR5mhuq7UdjMx72nY6D8VHqgest
	l2OgY/WQNZ0MjipMyMzXprUMA6IEFmHTm+18uTDBEjrIvYcafVtnZ/3QuRc0BtBxBaUxHkweQ0L
	Jx5A==
X-Gm-Gg: Acq92OEME9hl8gKvC0vzpfzLtUwpWXD920f3Sgze+LO40u8FeJoCNcd/wnUhuxHB0sc
	JICT6w9IJSErz/HTZhAFYEfgnGSesFWIJ60A2JzbOOSVVNzhod8EX2csku3vezgBqNO/UvfEDW1
	0RefIL8qm/1kTym0YXhhORtOxozgNfbs5Nw02tk2EAP6+6LS/cD4JIxoSs4CxKgHTbtJfujLPBA
	I+mxmQSqpGqypnKxJ+A/ZKXx3JWGSAN5gPKMRtKwsTdRb3uh0ForvbmQlTBUMSs1zONZv9zyKMf
	vuvsKpDZubNrmRIzrFEVmDSsO6Gbu9ueV36AHyUPImT0/AuMH7+WZ2qTSQ/jWmp1sTUEfkGLxbt
	xiICmhQ7+zBurQiHkxQWujBCfo9ZRwJ9nv7Ushihz7LRRFPATC0quRgMZCscl/Ec=
X-Received: by 2002:a17:90a:d40d:b0:35f:b572:ece9 with SMTP id 98e67ed59e1d1-36bbcad48acmr3569138a91.5.1780066355532;
        Fri, 29 May 2026 07:52:35 -0700 (PDT)
X-Received: by 2002:a17:90a:d40d:b0:35f:b572:ece9 with SMTP id 98e67ed59e1d1-36bbcad48acmr3569081a91.5.1780066354875;
        Fri, 29 May 2026 07:52:34 -0700 (PDT)
Received: from [10.204.67.150] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36bc9bff159sm845633a91.0.2026.05.29.07.52.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 29 May 2026 07:52:34 -0700 (PDT)
Message-ID: <df00e8d8-21ab-415f-815e-608eb7ab0967@oss.qualcomm.com>
Date: Fri, 29 May 2026 20:22:25 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/8] arm64: dts: qcom: shikra: Add CAMSS node
To: bod@kernel.org, Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
Cc: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
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
        Suresh Vankadara <quic_svankada@quicinc.com>
References: <20260526-shikra-camss-review-v1-0-645d2c8c75a7@qti.qualcomm.com>
 <20260526-shikra-camss-review-v1-4-645d2c8c75a7@qti.qualcomm.com>
 <178000689150.4557.11759359941436928903.b4-reply@b4>
Content-Language: en-US
From: Vikram Sharma <vikram.sharma@oss.qualcomm.com>
In-Reply-To: <178000689150.4557.11759359941436928903.b4-reply@b4>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: Aofcs4_5gwBpYvGJ9vFXmezAJwjkPuHo
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI5MDE0OSBTYWx0ZWRfXxPs5W8oKG4UU
 6yKSSScVth6xxwqXokTBMyh7PXix3GYsUwnF9TWlUTc2FLlGj4qaA/CLf6DNTbphJXvu0VeeiMg
 dVZXsNBHMFG7/mzNwyqNYshsqkh+2JI6FfiUJP/pMFnIwE4WIB8AC44gHn0cIx4/aTOOKio/pg4
 0ZaQipIXQyjh1+9YJCdjYlEvaW8OD1KNGeqD4y7xEOTdJB0zkubJD0GR2lbkpd79nWjHgj1XtG5
 vvCabymomPJmHywUx8ca27HpYwNjv2ZP1Xczj1XNdeD+Nu17QTz6V6iUB/YzpN4MBeCVB7ntxRr
 egjZzJdy/QA6KheTR7kXNDPGSnPuR7MTQ4v6kAy+8gAf7vUs4WwCzHFkLFv5RKlF6J1koSZjU6d
 SlRxYjMkAZX0mObGrAoLO+RyHpfhiTbYZXAFxl3VFtidgq9J4XdNntFO5xbUs2PVeCIimvm5HGD
 LLmmwW0EgzxPjanktow==
X-Authority-Analysis: v=2.4 cv=DIG/JSNb c=1 sm=1 tr=0 ts=6a19a834 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=i0fgkIc6DCDsPB5MfecA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-GUID: Aofcs4_5gwBpYvGJ9vFXmezAJwjkPuHo
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-29_04,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 lowpriorityscore=0 bulkscore=0 priorityscore=1501
 spamscore=0 impostorscore=0 adultscore=0 clxscore=1011 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2605290149
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260529_075237_583300_3481BEC4 
X-CRM114-Status: GOOD (  18.39  )
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


On 5/29/2026 3:51 AM, bod@kernel.org wrote:
>> +			iommus = <&apps_smmu 0x400 0x0>;
> So I'm suspicious of this IOMMU.
>
> We should list the full range of IFE SIDs here not a subset. Since we are
> register compatible with Agatti that implies to me we should also be IOMMU
> compatible.

Shikra and Agatti are not iommu compatible in terms of Stream ID. Only VFE SID is same
for both. Agatti is documenting iommu for VFE, CDM and OPE. OPE is not yet enabled for
Shikra and in my opinion it should be added as a separate yaml similar to Agatti.
"https://lore.kernel.org/all/20260508-camss-isp-ope-v3-9-bb1055274603@oss.qualcomm.com/"

Regarding cdm iommu we have excluded it as we do not use it to program registers as of now.

Loic/Bryan, Please share your thoughts on this?

> Please list in your next submission commit log the IOMMU SIDs - comment in
> the DTS is fine too.

Sure.

> Ideally list the IOMMus for Agatti/2290 and then explain why the singleton
> you have enumerated here is the only required one.
>
> Right now my suspicion radar is high that either the Agatti binding is
> wrong or the Shikra binding is.
>
> Possibly both.

Regards,

Vikram


