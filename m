Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E935BCD343F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 15 May 2026 22:09:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YaMH5hmIAD00xqSHsQUa0nL0jAccvNpv5cFUjemkwiQ=; b=n0z5ViVJKHoRtxet0n8hv8rrEK
	khf4RepQ3KbXWRF+mX7U9PBBbqEfK2XBbR+TC4yCEpswIr7El4nZj4oqKoMEgvDT/JT1/+xo6ZSTx
	8iyORMnq/QAyEMOSa471hd22tvp2VKKaRvBkEsFpb4ep3WptqxTZfyro7uqXj0Ybl9g9yI2jGzVAL
	PsMB3fcdaQFJyxSdTWS0WssJqTEetPGbBfCHBLqeHLxYjYCJTklavdzR7bPKSMXGmD3b1HkCwdH3p
	/qvQZYfaNaKUUEX9jLmqDeuzfMqLPTFuoXfsk/3NxlUC2ci6JkllNvDJTAiRkRPUxNek979nQAJm0
	Qkpn456A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wO0iU-00000009bDs-0crl;
	Fri, 15 May 2026 22:09:10 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wO0iQ-00000009bDG-2w0u
	for linux-arm-kernel@lists.infradead.org;
	Fri, 15 May 2026 22:09:08 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64FLJRUT2457149
	for <linux-arm-kernel@lists.infradead.org>; Fri, 15 May 2026 22:09:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	YaMH5hmIAD00xqSHsQUa0nL0jAccvNpv5cFUjemkwiQ=; b=Io9+h9rwNtHe309S
	OVH+h6e78ujukoFG+67vJwR+0WA8GGWvkfs+CED7kM3wyT4k1v9lowfjIPwi1Zk+
	+6HG0ljCnzxDh37PtulhGakMBC3hAWzzqfiitC7kHCE0v8DGQuUOaLNBsjzd+0Uy
	tYfqFXE0S9X27qzlkI+MDCeT+hPOdA6OOb4QT4aQV4l03YH5e79XLqGMN/4p1pAB
	sRgAncfHAIY03FZYu7dmHCywYpzd1GvogS7gldtYuJEwrzQMNw31J+Np9vja47pj
	jyosMCP8W72ChGMJzytJE4aK0CiMbUcGRbLGSOjoEupsbn08EAUyxNsaOnW7tihV
	XD5tWw==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e6ba6g3jk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 15 May 2026 22:09:05 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-83544d05c5aso119536b3a.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 15 May 2026 15:09:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778882945; x=1779487745; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=YaMH5hmIAD00xqSHsQUa0nL0jAccvNpv5cFUjemkwiQ=;
        b=XgrNTzms2zIE41hPfwFU/ZnHatJgfyT7LfFRHEgsun2TvkwDO45WKFFUuShmK2uc48
         xr0URiln+0hsnrrafy6lOLdSQ8iVe537n/fwD/byTky7jLbzpI9jwvTbGLrJTLmRczln
         bl6RHL20wMjgmGCrn8PAlP8FXjWUx2D1fnPFCpnXgH1YjI4aNrsAcZl22dxc1AYQwjCi
         irwPn0iar1DWcOWRFnMcOFjEFKpjlOG2c0b1pU3l5YhGlEEbYLtC6qzHLHgeB5GbDuJU
         6h2HZOJCeW4NlXPDszJmbKF6KYvbx5yBHoaGH9i8pOy8zAU1jh9HzHEayY3gZwyaGyFU
         dQlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778882945; x=1779487745;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YaMH5hmIAD00xqSHsQUa0nL0jAccvNpv5cFUjemkwiQ=;
        b=CG7SUZnFZCGB9K3+LQuQL+7Xgzuzds35t8uAPXyttgTx0SPQ2ZisWjHOx8RCAfEl17
         wCb9W18ecjcr5LE5SaRO8suNwa6EunzVMXGD6GiSh9omgCC086bOWUak7NNIV4wjIhZN
         0IvooVPjfwzGFX+Aq7pJg4lZS5OM2HKtcs1YGtiLCN4VSKkOwUmGOqopnJIFYqohtZdJ
         yqMYhDEcGWs9D8yzbQ+hzD6sn7ImHrXDJQFx4Za/6VQsOEtVu+BRZcWFuR+VsnFIyfku
         J6TXNVcW5ZTw+qSQY8eZj9KoaEZwPh+ygnvWJXjsausK2yfgTLP4VxuzOxJP2NDeyGZV
         jIZw==
X-Forwarded-Encrypted: i=1; AFNElJ9n3IfZjaM1OxTPKCFfyC4nU5Z3ixiZnws/SrlF3YqzwLGbqMOsmO2lBpYSbGIar0ayePZxZH4oKNJfMiboCYVt@lists.infradead.org
X-Gm-Message-State: AOJu0Yz16EEXNK9Zyial8ki2Bk/IqvpOm/YjuRXgJ7/8z2Cv/i24qx8B
	Dz3ezaLgUV9WGYB+JW6+FL3G/TDmX7v5wdvHADr8/jKwZY1r52bSfBcBumBIeJnN5mA7Tf2pRGS
	HNJtBTOLaZd0OPPt3mCe4gjAlDPVYx7SWDsXsi6StZLIbl0hbg0T7Vf4XP9upjQOMDrvFm3za2w
	IQmQ==
X-Gm-Gg: Acq92OGxILbYOPVEig963/ccWfVk3C2Qt5d4/XjTTIzv0GpKzu77pYbs4ZVFnw0wGKZ
	UMNZhhsjWbjTl3YrKL6WQURLtO6kvZ7Wb4XDnRd5YlY6zTsw197lvwtKu8I9F9N1nIW0vPl7SGg
	ZifJHQXJ5O4SwtDYqkTNGjMb4VGHjFAjTwotWJ/+OxVMho/XPHXwWeKNWFK3bpHasxQ8cyfrobc
	q6n41+k6izXxiPdcoJUyu86JO75HOsSfwp+SKhNzE1yOVfgc1OVuM6KldTbE0dRcdntKE52naIn
	tyl0jB/V+tfq1wIz9UWwPLxAJ/X950AnzPm36Q8OX6PBuK57t6wjM1yzt7XMPWQH+GKVhlwfbre
	sxRCQvsmuavpqQzGzFjRMJ99OwL78pPqlZF+n22P6wxI=
X-Received: by 2002:a05:6a20:4305:b0:3a8:2339:24c4 with SMTP id adf61e73a8af0-3b22ebed4a2mr6668400637.26.1778882944655;
        Fri, 15 May 2026 15:09:04 -0700 (PDT)
X-Received: by 2002:a05:6a20:4305:b0:3a8:2339:24c4 with SMTP id adf61e73a8af0-3b22ebed4a2mr6668373637.26.1778882944158;
        Fri, 15 May 2026 15:09:04 -0700 (PDT)
Received: from [192.168.1.3] ([182.60.13.113])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c82bb1156absm6447536a12.27.2026.05.15.15.08.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 15 May 2026 15:09:03 -0700 (PDT)
Message-ID: <7d3dd8b9-8411-476d-a1ef-fdac476a1515@oss.qualcomm.com>
Date: Sat, 16 May 2026 03:38:52 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/8] arm64: dts: qcom: Add GPU support for Kaanapali
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Sean Paul <sean@poorly.run>, linux-arm-kernel@lists.infradead.org,
        iommu@lists.linux.dev, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
        Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        Joerg Roedel <joro@8bytes.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov
 <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
References: <20260512-kaana-gpu-dt-v1-0-13e1c07c2050@oss.qualcomm.com>
 <20260512-kaana-gpu-dt-v1-5-13e1c07c2050@oss.qualcomm.com>
 <14a2fbfd-97c1-4ba7-aa51-a07134102d3b@oss.qualcomm.com>
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <14a2fbfd-97c1-4ba7-aa51-a07134102d3b@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 9mNWuuqf1mX9Kztni1Dau8g4ix7_wZKx
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE1MDIyMSBTYWx0ZWRfX/9VT4owfv+we
 996owhovPxPsDVCDfgFfWgz/4YqKB003wJ/bpqAqg6hRDKIwtMSmE2lkKjp5+qxLaZmutx4pp+T
 EIMzojCyoUEJqbZyTuFWDiccMbxuLM357s8cv6fucnOi+hOqqsZC2RjXeQWVM6aI/Wkm8IxRmHM
 tRKABpDnWuOdpz89DvmJlOWuO44rqhtw7pFsyrTTy784OQeS2nwcus/OYSPcU4WTbf4SVP43kTf
 uQs4XXSgst1xk5hxVx6bTVjknWSMZKXbn2diBojjFOBN0EjDp7fVPAsQ1TfL1xdpCNOtd7JNNnY
 m2ZcpgvKxNM3xJInyCJmbdlqLg7Vl+3ZjZEiVvxtDiG6uKDXJMIE3wITuQbf1XTF68BR43aR2v1
 /aYXbNpLq4aBG0eT3/bshqDh9TmOs/bHhXlkZOY/K6lktx/Mpo4n/FV5c7tEKqGntm0FiNna2Ga
 FUO2qo4oPAzAYRrZ32w==
X-Authority-Analysis: v=2.4 cv=caDiaHDM c=1 sm=1 tr=0 ts=6a079981 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=ba8plz+5YpscmDk5DVa2Cg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=mzNi1YEEKYKHT8R6ei4A:9 a=QEXdDO2ut3YA:10
 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-ORIG-GUID: 9mNWuuqf1mX9Kztni1Dau8g4ix7_wZKx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-15_05,2026-05-15_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 lowpriorityscore=0 priorityscore=1501
 suspectscore=0 adultscore=0 phishscore=0 spamscore=0 malwarescore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605150221
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260515_150906_863672_19FCB928 
X-CRM114-Status: GOOD (  20.48  )
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

On 5/14/2026 6:13 PM, Konrad Dybcio wrote:
> On 5/12/26 12:23 AM, Akhil P Oommen wrote:
>> Adreno 840 present in Kaanapali SoC is the second generation GPU in
>> A8x family. It is based on the new slice architecture with 3 slices,
>> higher GMEM/caches etc.
>>
>> There is some re-arrangement in the reglist to properly cover maximum
>> register region. Other than this, the DT description is mostly similar
>> to the existing chipsets except the OPP tables.
>>
>> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
>> ---
> 
> [...]
> 
>> +			gpu_opp_table: opp-table {
>> +				compatible = "operating-points-v2-adreno",
>> +					     "operating-points-v2";
>> +
>> +				opp-222000000 {
>> +					opp-hz = /bits/ 64 <222000000>;
>> +					opp-level = <RPMH_REGULATOR_LEVEL_LOW_SVS_D2>;
>> +					opp-peak-kBps = <2136718>;
>> +					opp-supported-hw = <0x0f>;
>> +					/* ACD is disabled */
>> +				};
> 
> The clock plan also has a 160 MHz OPP @ LOWSVS_D3 and there's a couple of
> interim OPPs that you have that aren't part of it (but maybe you have
> better docs)

I somehow assumed that the 160Mhz was a thermal-only corner. Seems it is
not. Let me revisit the OPP table again. Yeah, the doc is outdated.
Looks like there was some last minute updates to the OPP table.

Also, we should update a6xx_hfi.h to accommodate more than 16 GX levels.

-Akhil.

> 
> Otherwise lgtm but the size of the GPU region and the GMU base look
> slightly confusing when I'm comparing them against the reg map
> 
> Konrad


