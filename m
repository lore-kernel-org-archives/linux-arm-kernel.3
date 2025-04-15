Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93387C369AB
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Apr 2025 10:02:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rW9FWPSdQt2D+614W81JrfXlNn32mGwhXPgp/tUuSmk=; b=WLFuOPQ23440NB2lSO4Rxr6WHw
	A6H7ysRlP8Gb9f7VdZircqmoKs/tkAN+TeZHJxYNqBD3S5ZZShMXzwnKcOtbCWhQqctMBpm0tVrAF
	7ESKo3I7ZCdOyjIS8zfvNJcFkEGdmyzJ9VmG1PwEQEEY+SWuXZtPSiO4Li+ED2GakeoDABo4SXI8c
	rkSA6HPp6UIk0e3AhfCFMjA+lT6g694vS7wCJQ5m5nqsWZLMEjjxw4jD8Id0wH+tFsmTcG5OuXm49
	c4oH5w/oE3TTe7iu96Z4zxXQm7JuV+IiRtb5JXMAnGDXn4iusZT9LYqHzszwOqQGfpX74R6JRqQFV
	NTGaP9yg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4d77-00000005Ffr-3HM2;
	Tue, 15 Apr 2025 10:01:57 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4cqD-00000005C12-00Vd
	for linux-arm-kernel@lists.infradead.org;
	Tue, 15 Apr 2025 09:44:30 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53F8tJTk018995
	for <linux-arm-kernel@lists.infradead.org>; Tue, 15 Apr 2025 09:44:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	rW9FWPSdQt2D+614W81JrfXlNn32mGwhXPgp/tUuSmk=; b=OMlBxtQqJGmWEZFV
	EBm4SupL8+T0JUt9IMgpIMdoOcxKuu4vkazTH74g/ms5JkQFxD6BGlgW/GiNrktZ
	8pdiBvJ09qTbFOGWs3llxl+r9dIstAw4eqWC/kHp5Y1WpS6awHLao4zz/wDnehl8
	mg8OSuY3VOTHHHpLSkylrJ3GlYr9xm3gxzO0vPRZhJrGQHm3HpHA4enuKJ8+T2lU
	bmU0SmpBA9sma7PTDW8+pjUDf+JQlw2JCX/ZCDXQKhJFpxjlmh/YYEvNKzcMTyok
	U2Te52FfUql3eX3kJTjdQUs1j7T8POnCNoMwBHUNu6NUVSJj6CzfWGdEBpGiMnfe
	np79ng==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45yfgjfgv7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 15 Apr 2025 09:44:26 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-6e8fb83e15fso10848856d6.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 15 Apr 2025 02:44:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744710266; x=1745315066;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rW9FWPSdQt2D+614W81JrfXlNn32mGwhXPgp/tUuSmk=;
        b=XtoJj7QUMfVMZpJ+0vnYZrTU3qxL0iQ95ba80E7AEtlhqEYVQ3a17pHmgGV6yZw2bT
         RwH6HLlr/E1SnENf58Wp4oxcy6W5MICXR8dbCKY77MNoznqAhviHoD5EV9wK54MRVZle
         a26bsOsJBbdysTfBzHkLxhYpMDIxh7F9N0D+y4n9HeIb1BGD3IbrLgdZyiVptzVeQwm0
         lwLuCHEr7/5Mo90pgxY2Op8fSxAXriVkX1a5/L5VQJjwu56+v+DFThHUZNHN/Meu8Ea2
         UgSkutrI3FknCJX2uOqH0dsqTVi/wojZFMcGNk8sI1X3mk2aXbjE6Vw+q79IR/ssR4tM
         c1xA==
X-Forwarded-Encrypted: i=1; AJvYcCUFN/OxyoSXP0vtb2DY+5eRyfa0/Aan4RlDzlcf0I0qVm8lBv4X/q8pp/miHakTt/hbtpf4LjkVz3Zjslu3+WmB@lists.infradead.org
X-Gm-Message-State: AOJu0Ywe8NgLX3mVUZ098K1paX4vLrQMCUVRSCe7BmQSWGGB0t0Fcnzc
	phH3x2tH66V55NWK/a55UOATeOaSxGsLkkeK7v18DbpdigQK/2lr+EcWzvivnWK7Vqfjasyp7XN
	L27VxUI5o+1BbQ+QfUDGNUithTbYT4ZB9OCvhAaSfX2DwQPTcKNP1nMNn+NtAJ1qjyM+x/TDGuw
	==
X-Gm-Gg: ASbGnct0vc6CV3Gbce60Q7MemNVhf8JvxwA9xOXK5c7eZJbkZsO9Deu4LBvpv+BNn0Q
	jRn4pvSx2sr2Fsy5NJjg20xaPJBaRj4lrhJfKwyzahvbk/Xx5OOQ3T3TyY0/OZg/ppqc9nyuOWt
	ZpEfMJV609x4NSiIjWJ65duPXExeCQEtOksz6wUcffL39mse0JTKLzv+T8fd+KAs1MCbDixJRcU
	TTS7H/LpuKfcNavzYfxauhMZd6+HHlZwztHnecNihnXIZ6nWEP7Dv0hS2h+Nrr5Cpcqsv6eGGvx
	rX9CRZ/EKNIdCX8hqlE2x+4EHQuAZgjHoFqwHfIlp8yR03cG8J6QXwRBAaYCITo4S+M=
X-Received: by 2002:ac8:7e96:0:b0:472:6bd:f620 with SMTP id d75a77b69052e-4797753cf0bmr78171561cf.5.1744710265949;
        Tue, 15 Apr 2025 02:44:25 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEJjjs62RJ3mQbU5ZqHBwBsMfWuvAGXOnlnbzwKsb07Asi8nZzrMPgemoIu+Bz/6N9J+heGTQ==
X-Received: by 2002:ac8:7e96:0:b0:472:6bd:f620 with SMTP id d75a77b69052e-4797753cf0bmr78171241cf.5.1744710265610;
        Tue, 15 Apr 2025 02:44:25 -0700 (PDT)
Received: from [192.168.65.246] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5f36f06c5desm6431552a12.48.2025.04.15.02.44.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 15 Apr 2025 02:44:24 -0700 (PDT)
Message-ID: <96e38ebb-5847-485a-8bf6-50e7b10ce572@oss.qualcomm.com>
Date: Tue, 15 Apr 2025 11:44:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 10/10] arm64: dts: qcom: sar2130p: add display nodes
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <lumag@kernel.org>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Kuogee Hsieh <quic_khsieh@quicinc.com>,
        Krishna Manikandan <quic_mkrishn@quicinc.com>,
        Jonathan Marek <jonathan@marek.ca>,
        Bjorn Andersson <andersson@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        Joerg Roedel <joro@8bytes.org>, Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, iommu@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org
References: <20250415-sar2130p-display-v3-0-62314b1c9023@oss.qualcomm.com>
 <20250415-sar2130p-display-v3-10-62314b1c9023@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250415-sar2130p-display-v3-10-62314b1c9023@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: hI3XyvCZLaGZwMx1f5nzKKRgOqtFqNyX
X-Proofpoint-ORIG-GUID: hI3XyvCZLaGZwMx1f5nzKKRgOqtFqNyX
X-Authority-Analysis: v=2.4 cv=Cve/cm4D c=1 sm=1 tr=0 ts=67fe2a7a cx=c_pps a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=RooFfVGkvEW2JHd4kGkA:9
 a=QEXdDO2ut3YA:10 a=pJ04lnu7RYOZP9TFuWaZ:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-15_04,2025-04-10_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 clxscore=1015
 malwarescore=0 lowpriorityscore=0 bulkscore=0 spamscore=0 phishscore=0
 suspectscore=0 impostorscore=0 mlxlogscore=999 mlxscore=0
 priorityscore=1501 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504150067
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250415_024429_165254_41FC88BB 
X-CRM114-Status: GOOD (  12.56  )
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

On 4/15/25 11:39 AM, Dmitry Baryshkov wrote:
> From: Dmitry Baryshkov <lumag@kernel.org>
> 
> Add display controller, two DSI hosts, two DSI PHYs and a single DP
> controller. Link DP to the QMP Combo PHY.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---

[...]

> +			interconnects = <&mmss_noc MASTER_MDP QCOM_ICC_TAG_ACTIVE_ONLY
> +					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ACTIVE_ONLY>,
> +					<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
> +					 &config_noc SLAVE_DISPLAY_CFG QCOM_ICC_TAG_ACTIVE_ONLY>;
> +			interconnect-names = "mdp0-mem", "cpu-cfg";

The first path should be always on, so that if CPUSS collapses,
the display may stay on

other than that

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

