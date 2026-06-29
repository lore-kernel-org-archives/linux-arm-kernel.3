Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9FC09C43327
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 29 Jun 2026 18:40:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CffFp0WhGRj+vqvsuwqU3TnnmViodZOWqRxtTaxYu+Y=; b=12FxqiqQtqvWcLJR93pivzFNMh
	ZRWV0pZH5dopCMmE91n+DXdrYtq9hvBjuOdKaAY+BQywSv/zb6+kg4WsOrDqnF/XruiqzCFbcIKye
	4n/eZLXDUseK7AXNnLID9kMpUJvoO7ZKeiGkxBsDi7S2J4dQ+7Sd50RHbEDiBh+dwrI6rpUmKmqCS
	+VOMQNpSLhKfi6h5ylyyUNEajTgr09rU39x616YVeIbgfz4t0J6emlg/PqBHR83De9E0k/WhupFH0
	w1KRoX2afoVylLyz9Y3FJr3Mgqu7uTCGCXDn3gTl2TtIBsKhn4v34oKNKihyH4Rgm0jdPxmFlpDJX
	W+o/dkiQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weGu9-0000000FMT9-3ZJu;
	Mon, 29 Jun 2026 18:40:25 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weGu5-0000000FMSi-3JlX
	for linux-arm-kernel@lists.infradead.org;
	Mon, 29 Jun 2026 18:40:23 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65TGKATG3432847
	for <linux-arm-kernel@lists.infradead.org>; Mon, 29 Jun 2026 18:40:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	CffFp0WhGRj+vqvsuwqU3TnnmViodZOWqRxtTaxYu+Y=; b=LPCtJUpylBlNWhDv
	0fxXRaARpZMPwhKF2iYU4JQJPrVJ4CHxfUSHbsGlRYH7GA8iUEc/OPHgQYnHK1fh
	6RLWWHzuDVzHZ7KFJNM8LqB6jiZm89AdLX85iQTgaCdin098Q4mfyUcJPxUuFPl3
	aSajWkgso+hCNB2cZvPakgLxy+VsKmVM1Zz0X7de3gAyD/H3UiQ+sJi4BY/5Fznb
	VcIHb6dtwr3PAdWbWjraUV704k1U5tGziQrbzycM7GloVacTvb2KplJAB9EiHT+O
	ij+6fqEX8nmmDpiFssuBthRdCrTZDcq6wGCozkeIBPl4NLFanW/DczUgf/oAfqdf
	DGm80A==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f3nbgtk1j-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 29 Jun 2026 18:40:20 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-30c1f6c5559so4000672eec.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 29 Jun 2026 11:40:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782758419; x=1783363219; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=CffFp0WhGRj+vqvsuwqU3TnnmViodZOWqRxtTaxYu+Y=;
        b=VCVbfBZAGOsfuiItysDUWrwnD0izhgUDRHkzcUwVlPj/8hM8/Gh/v+QVT7ndqLNUdj
         KbaiLix6JCJSVkNzpm/CuaCZXuufd3Q3+IVdNZpJgU9y2kLvouMxxd0g9wSP0PVg6TWM
         2T0F/JbqdUt1fFmXtXQuLJcDNgQU5ENxEkhrA5gxghXM8DsZjy6l1OpgNywPYcLMh+AI
         YfJbGLAJTf5c1W5UVfSFS+qSAl40nofNy+Ik5e1TOHSovOH744bdNcgwWOrnCu/jNdjP
         5DoJAsUbKcQYNuA39WgNcp20DW19ty4mD72BsNBWrPcAGCRHY760EbCT/STrhTpxWnyL
         zqjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782758419; x=1783363219;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CffFp0WhGRj+vqvsuwqU3TnnmViodZOWqRxtTaxYu+Y=;
        b=bF5PImYqiYCxVvAWz8tG3xNeDqrIougQSXvOiImerR76JXSyQ/hgkDq7eMCV+eWrio
         nfOyMuuOoD+fCdSs3xyC8hLPMv7vQcpTX1qlFAHKy6EegJY1XZwnKq6DOtL3Ra6smP3i
         PIMOY7QXN9kMJWFQq/iKDydSELlTr3ZFr1xyAsuW46yf/xnu9ZaXUh7G51rgN2mIXpOk
         f2C98zTJ6s13B3F3hqujxYQb5eh5zJMEOiNujgLD92kZ7/0AyHbC9gYsCGs/LXaZLhbM
         88DSdXeqwjD35aDuQpP+WuZyqhAcnMvyyIujTval3Pvwdw6B+vr37EzOvsiNWpvoYyJE
         1N1A==
X-Forwarded-Encrypted: i=1; AHgh+RrX/x2hzhAE04G66PS7iciyCNO97pS3W0cftFZlVhjm+DtzP6R8Q2afjr/wYz2yH7RxIWz/i/tumJilCxpD20ia@lists.infradead.org
X-Gm-Message-State: AOJu0YwvEfe07jumuDn+csSqpAQYQC0Gwx4iMpM6yBIhFQjKyxAXDckD
	LdgS3iPvm5a5hRUwNJcj5u3xefULt/q8YViUmeEGqb9LJsrgVGnLi4hsSYoxUtSBzAAtCIhos6J
	+CiwkF64eYsPzKKlyzzRLgt6TjT597wIBn/t+CCgawLZmUrTb46xAOrNdh/GB328YnqpCZuB6Hg
	37MA==
X-Gm-Gg: AfdE7cn+XWhr3b1trvfvLSk9oc7rUEs9UiwW7tVBiZROuiSTr7dK/zxq1djvmirebh4
	lGKECzwesJwfFGnS8NWkQKPC2Yc3XLItMBMRDn3ZWYGv4CXAkZUlRZ1mCHCuhPXDhNrYwFDdoPm
	KL52lb9nM57BkI9y/nlSpqEzso4f5bvQx4rPioV3OrFYHpP558NYhnQJ85vxeBRalj81D1bBaYh
	Z5K3dAUYQv1+9ncyRIQ17gqeDtTH6/oH8nmMRXgQP/cmrlqGGghUR8qWpm1G9WBFnxZBgHR7ItZ
	N6tTzX8Yb8mjIxyhiTAKN01Krjefb6gqHE/GnbdrR5h78cB52MVFpetzVbWndqSpu9pCLnup/tC
	c03CQicIvv9eQjv59AWsKHgmHb9LyGyyTNg==
X-Received: by 2002:a05:7301:6190:20b0:30c:116b:42a9 with SMTP id 5a478bee46e88-30ee1489a13mr269162eec.26.1782758419294;
        Mon, 29 Jun 2026 11:40:19 -0700 (PDT)
X-Received: by 2002:a05:7301:6190:20b0:30c:116b:42a9 with SMTP id 5a478bee46e88-30ee1489a13mr269143eec.26.1782758418783;
        Mon, 29 Jun 2026 11:40:18 -0700 (PDT)
Received: from [10.91.118.212] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30ee316bf4dsm128143eec.17.2026.06.29.11.40.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 29 Jun 2026 11:40:18 -0700 (PDT)
Message-ID: <4e438b43-33d2-4cde-a5a6-67e7f8c53787@oss.qualcomm.com>
Date: Tue, 30 Jun 2026 00:10:07 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 4/8] arm64: dts: qcom: shikra: Add Adreno SMMU node
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        iommu@lists.linux.dev, Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Komal Bajaj <komal.bajaj@oss.qualcomm.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>,
        Bjorn Andersson <andersson@kernel.org>
References: <20260628-shikra-gpu-v3-0-9b28a3b167e1@oss.qualcomm.com>
 <20260628-shikra-gpu-v3-4-9b28a3b167e1@oss.qualcomm.com>
 <3ac0279b-105c-403a-90e8-822c28a6dcfc@oss.qualcomm.com>
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <3ac0279b-105c-403a-90e8-822c28a6dcfc@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: lpFupdlUiLkv4MEVGITeYN1pStWIBbX1
X-Authority-Analysis: v=2.4 cv=Z4Hc2nRA c=1 sm=1 tr=0 ts=6a42bc14 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=l0uZIx2wMuzZ-h4bkHoA:9 a=QEXdDO2ut3YA:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI5MDE1NiBTYWx0ZWRfX4XnHA6BwcoW2
 7GbSTBl7rytDyu5PMe4Cn2keSgKQFyhvxK3dGag5veuNoxhfwFb6EeNDOJzQRn83Uc2IniO15tR
 Xi+bzmN4TbXfmJxsTC/5s4f+XUxy10s=
X-Proofpoint-GUID: lpFupdlUiLkv4MEVGITeYN1pStWIBbX1
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI5MDE1NiBTYWx0ZWRfXyGZFzyQ0z6/l
 w1KdJv/u6kA9nsostetNGwW4OdrkiqRBdCKfBzHhpXRus4xWyK8bPbp9iSi0WsxEWh9wPQJgluk
 UnPBrfGFLmk4fZhUhMJPit+aAPECcHCQgeGAS23YHSCE1o8TTVsG6sjoMCDh4+CCV7gw7iv+Jn3
 mO0MVvAerYfLd2fWwdkeoMVqnWmKb3l5O+wXYi41+smRRFE7N/1MudHWSlTY6P/QSjZf2QrlXPs
 /pbeg2zIkdmnpG3SpsUU+wT9/k94kD8uhEUNS5e1i6zl/5ZdJ5fnpYTbL77DnU07cMXe3OEM+u1
 bpKvhZTAAN6edMVEgrkK0kignaXwVdfOQt5wmrX8J8Yi9UQp/ho6PEolHyllrXGBCiENQTQYpOQ
 QWsqd2lbvzFpmY9YMO+BIduVuh7ZXnrfUFAVREXSo/bqLNmvPG3SnSltW4PloJ21NfeF6eqw/vI
 jouoiHujmuENux+opfg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-29_04,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 lowpriorityscore=0 priorityscore=1501
 bulkscore=0 spamscore=0 impostorscore=0 phishscore=0 clxscore=1015
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606290156
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260629_114021_995333_9C6FB6AF 
X-CRM114-Status: GOOD (  13.65  )
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

On 6/29/2026 2:16 PM, Konrad Dybcio wrote:
> On 6/28/26 8:23 PM, Akhil P Oommen wrote:
>> From: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
>>
>> Add the Adreno GPU IOMMU (adreno_smmu) node for the Shikra SoC.
>>
>> Signed-off-by: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
>> Signed-off-by: Imran Shaik <imran.shaik@oss.qualcomm.com>
>> Signed-off-by: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
> 
> Drop the sign-offs that don't apply (presumably applied as part
> of shuffling around the handlers of the patch in the in-flight
> tree OR missing c-d-b)

Ack. Thanks.

-Akhil.

> 
>> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
>> ---
> 
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> Konrad


