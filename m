Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5911C369AB
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Apr 2025 10:05:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dh7xlUxtOWfIN7SBnmAvxpsTUhx8yFt35Gg5z7br5FU=; b=i9Z5p8imd+5xI0OxhX4Tv4IvGx
	tUUwTa8ygC1/8JMEf27bKVvqNLQrL1CgzA3czGAtvzWh5J60auQQwj6HQbSktogMW9m8aMlhXO2Is
	RtF+X/WSCN20ObOTv1EYsqf7xON3EACaZQ8TLpffL3ZZH6eToWlDXx2qs1DX4KJ0PjO/yAFU0gWaz
	R33rRvldV9qPTbXSxtBuZwNGwbAn46+ZBHHMfHvo1cLwYOAJigJgr37diqLDfGvmHFQqLWa5I2pdw
	AIUdgu+8/eWc+QBzvoNHs2NiaGnb8AKsI30VV5v/acSzQog3jVmlcSzeQZt8UhyQ0xAlPTMYlRarz
	OCOgNPtg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4dAj-00000005GKz-1xV0;
	Tue, 15 Apr 2025 10:05:41 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4cqT-00000005C5z-3pGD
	for linux-arm-kernel@lists.infradead.org;
	Tue, 15 Apr 2025 09:44:47 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53F8tJAV031809
	for <linux-arm-kernel@lists.infradead.org>; Tue, 15 Apr 2025 09:44:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	dh7xlUxtOWfIN7SBnmAvxpsTUhx8yFt35Gg5z7br5FU=; b=V2dK16yQl6pylqWS
	R1E95Tw4nkew+6moyHTARiLlnzpU7er5QnXJOU6ovmVvOv7CvgFE+WH6F3WS/uWH
	2037Xy7QYlyzwmIzWlRgwVJcYpGY2vKoGDzFnX/B6t3f/dekJxM3g1v0Ue8tvzdI
	4K/8BvTKNaPDcQit495aEP72xKPw0DGcQFntRIgUrXwTaOve0qWcJupVBbl+e2V3
	wjkvTYEiU8UELOL/r7isTbpTdiFRkxhqYQmwyzGgOzd0NIf7KLgmuIwZo9L/Xhdw
	TQ5MQ25y14hj0RqNACX/BCiGgErdDIPNv7/02OUrxS3t4YT8kK4g3GK9hCiJhhEs
	g5FIQQ==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45yfs17jjd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 15 Apr 2025 09:44:44 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-476783cbdb8so13629301cf.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 15 Apr 2025 02:44:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744710284; x=1745315084;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=dh7xlUxtOWfIN7SBnmAvxpsTUhx8yFt35Gg5z7br5FU=;
        b=aOWlpljnG/XrJa+jYp1TfC9qF0WDATzUEGutJODXzkwwnlaZ1qsktVV1uBlwDA2chJ
         dnJI6VZmk46i+Wb/yIyendiyLtCj18pt4UYfZteGE3HX4hCNkCtcoGiiwAhMKC+OG/j4
         hDZIStGKsd27mWkDhhOoKYenpK+Hj6AFJGbqxo2xND4w5NLIp/0uDxuo1wxqvZjDDtwy
         msTAEHU7HAG0mY5zy7OgsinEFUstPdq4hJbaa9BgEZPLx4lrn0CVtsSUTWvSJeUspe5o
         GXryqt1UtsPsJBoHXFTgBU9cgIKHgoMmH6o6luabC6RLmrpsszjh36oz8wDwYR0M3QFM
         7ZTw==
X-Forwarded-Encrypted: i=1; AJvYcCWcaL6g/+o2jO3MWtZzDfN3edyKut29WvO8m9gNdv35zK43dZaSm6qoUX1yNoPLMC7QA1NtoTlB5K8EJTmAUrCk@lists.infradead.org
X-Gm-Message-State: AOJu0YzkM19puZRtuB7BkK2pPtHgtQr3KBxIxk10DSlrhY6w1pMT85D7
	U7wNVxx32gvRBERKhE3VKi0baE0+vmEty2wFEXF4mwgmH8EZc2z1P+Pj77wmbem278fr3liGpZB
	VfGVcH9RT22BSiXbzVJaBCBqhj5kOsNDfNgAsL3fUsVjr63y9Aro8Wj7Ovt8HH1/kT9OrnZMg+g
	==
X-Gm-Gg: ASbGncvfjww/JI5jcX/H+cF5cAxlYgF/wxjl41jbsM3r7gHYmUu6tjisHD4ssuT6mnx
	6QU70kuyZ8dMhIToTz7ylsJ7BydNIgXcx0VnXcraMlZcpvpdzEDqvvOI+80s+4Mb8CQVPHNhH8L
	ipj74XcJZp4BJwG49HN/izZAqB31vuM88Vo6H0Fam8yDnlUIbV4XNhCuAn8DCHRlDOE7ikIl6st
	gZyjg4cteU8Qy+iIAD/kk8sfucTW3AC55lf7K8jzaJAsV7KP3Ka+WgCF5ZjVg1DjP0kT9QX+cEV
	aKSwoNO4pkAVvnVlYDzcDCR6FpLFXHdFUUCdDS1auapNemIXG7Wou5D4Sr1huFV+kf4=
X-Received: by 2002:a05:622a:190b:b0:476:66fb:4df4 with SMTP id d75a77b69052e-479773fae77mr86594331cf.0.1744710283884;
        Tue, 15 Apr 2025 02:44:43 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEtDVLNzgvpQI0Lhz9q3H+Gl7nwNw80XyxluXGruUxEXUTIGiDUoi+aDVsGLS4X9fWsR8kNoQ==
X-Received: by 2002:a05:622a:190b:b0:476:66fb:4df4 with SMTP id d75a77b69052e-479773fae77mr86594041cf.0.1744710283561;
        Tue, 15 Apr 2025 02:44:43 -0700 (PDT)
Received: from [192.168.65.246] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5f36ef61911sm6334674a12.32.2025.04.15.02.44.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 15 Apr 2025 02:44:43 -0700 (PDT)
Message-ID: <aa67f077-98dd-4561-b431-9db276ea29ba@oss.qualcomm.com>
Date: Tue, 15 Apr 2025 11:44:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 09/10] iommu/arm-smmu-qcom: Add SAR2130P MDSS
 compatible
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
 <20250415-sar2130p-display-v3-9-62314b1c9023@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250415-sar2130p-display-v3-9-62314b1c9023@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=P9I6hjAu c=1 sm=1 tr=0 ts=67fe2a8c cx=c_pps a=JbAStetqSzwMeJznSMzCyw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=TMI2DeuJ6cRHfy_QMqYA:9
 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: 4vXCWTDZa-4LThwBBXv6v58BHKo-uTFZ
X-Proofpoint-ORIG-GUID: 4vXCWTDZa-4LThwBBXv6v58BHKo-uTFZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-15_04,2025-04-10_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 clxscore=1015 bulkscore=0 impostorscore=0 phishscore=0 suspectscore=0
 mlxscore=0 spamscore=0 malwarescore=0 adultscore=0 priorityscore=1501
 mlxlogscore=672 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504150067
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250415_024446_081252_75E45477 
X-CRM114-Status: GOOD (  11.43  )
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
> Add the SAR2130P compatible to clients compatible list, the device
> require identity domain.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

