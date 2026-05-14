Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 518D1CD4F39
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 14 May 2026 12:43:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EU8VqILiVkLUPw58TAFmECDvG2KNHo2DCKZDUVw7+FI=; b=HNQw0UH7P5RH6khigRdopFQs3b
	JQ9/Cpi6oNe6s8wt/KBI0dlbPz6PiNt6qxHUDbcSIvtDqgzxcwl2DrX34k1LaA5rXMm0nNnRFgTkE
	YXJu3WnhbFt3bRwVhI8O+alma/HGD7m6+8R3sPcg3WmIQ+otQm///n5eQXOW++qbS7sr67vWCs7bp
	3HZLtFfG6bmEwB3j+AhBZLoDZBlYkl7++r7txh3gR80mXmYUBhGcZF7f7k140SBtkOXKqLG9vxtmJ
	iayci+QwxqVAKX1eP3cWhtrb870GS2gC6cgRcZLXe6+EjBcbPD9hN5/NbH8rrDJck4Qd+ixyCfLsg
	lanJTeGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNVPd-00000005UZb-3Uay;
	Thu, 14 May 2026 12:43:37 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNVPc-00000005UZG-3nJr
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 14 May 2026 12:43:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=EU8VqILiVkLUPw58TAFmECDvG2KNHo2DCKZDUVw7+FI=; b=CFiGzZPSEEKfw3QtjPiIYm+/Dw
	QUrs2IStqocLpD+y98Trl8sP6LfLXoYSn7PwAgDlYO2p6JNuIWNiczlHL14bzJj+NDO+KdLL/ERER
	pDyyp3w4PfKmmlnHyhUpWcaZRbhqIGKiVc7mILVFqkBpC98KrY5Am5MUGTXQUbCaNVxdwU/kgdYz2
	hAvSUUVL/U/6rPQaf9eHYGxDVLq4pkw1M9cyVkLVnPWjL7wc1+IwWv10w09m5utxMTdfLolwTqceV
	yJBd7RhKxjjE0p3tudTFQ/SqvdCR6xIhRjWbpF5T/1Q8pRwEsYV1c6V0sbp7EaH3jX3zOxkxzZul+
	RzZeUcwQ==;
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by desiato.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNVPZ-00000002tjd-1taO
	for linux-arm-kernel@lists.infradead.org;
	Thu, 14 May 2026 12:43:35 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64EBeSWs3891179
	for <linux-arm-kernel@lists.infradead.org>; Thu, 14 May 2026 12:43:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	EU8VqILiVkLUPw58TAFmECDvG2KNHo2DCKZDUVw7+FI=; b=WTnpVJrSxdmUwNhd
	6OnwELisSHFfwHwNb57jJAIMiM4R/w+Zisp/JAhJgSHJbksSZTLcRgXos6ymekCV
	La1pdg7stJ8GSN+wKtWR+ONa1eqf41tiNg9suNWeI3Uiio0ugBKLoNWtKrsbKd0m
	2Jo0wJIcXcF0gyr84Kgag3qloKqLV21+lJX1aRSXCAAL1MrD+tPYG1o6FgIfkwP5
	qyQxQ0zEp0oyN4Spc2hI+41KgIfKOhWcueMKjNDbHDIZGx/APouCxSZNz0sRmAgM
	y//yKVb5qRZYteVpEg0upBvCbObqpcYr3X/8QZqzFatGZSKgHBix5fgHzCNJ/vQ5
	hRJvYw==
Received: from mail-vk1-f197.google.com (mail-vk1-f197.google.com [209.85.221.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e4v4tv02e-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 14 May 2026 12:43:29 +0000 (GMT)
Received: by mail-vk1-f197.google.com with SMTP id 71dfb90a1353d-5752affb36bso720858e0c.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 14 May 2026 05:43:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778762608; x=1779367408; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=EU8VqILiVkLUPw58TAFmECDvG2KNHo2DCKZDUVw7+FI=;
        b=HFoRbapnboQ6VqUXzyWmI3UvyRByHXIeZaaR/e7DTZjPXba5wNa+pqo+rRA8rYjXYL
         f+s6HjF1ctJA2qaDUEWrKki/kXPeYE08YNKGVcsO+3nRh3jgC871JgdGqt4KqXm3+o6A
         HyTPzILD6nSQsIlTauporoy3Je3+vmfPnruoathnJ5TwryRNODHmwjsOk9KuvB5Ha5Dg
         RCVd+5TYYVNsODpmONJd/szCtqFSbG2vKrKr3ZiFnCmVGeqLBLPLei1fzl/Hx/ww9oBf
         M+T8k+3koOlnHTUBSnDMZi2e6uVJWEwtOcHXg7Im73hNgY9JZwW6ElUSEHOh2+fyvED2
         vRsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778762608; x=1779367408;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EU8VqILiVkLUPw58TAFmECDvG2KNHo2DCKZDUVw7+FI=;
        b=r2Z4q8mks3W5xYFpQoTE7pKcH9OqjojzVjpGHHBWJ/KniFijWz3yWvSdUJIl4WNysw
         FsR/w46EGb+CE9OH6SIqyBv9agZxhB3XHyVUUmX3RGHOACA/pf7sCjLvY+WRK9LBmFyl
         BpRNOxHKBHGzvrfdNb1mL0MOKGZcpeigN/fp3EqTOdH2vMUFwS1+no3dI65BgxxG+f04
         WMsTALENlGZ1qHT5efGqG82+w46I3ZkEmxGFPxATGKyFcgNvY03cwMmN0k3W4APtO6O8
         N9VWxO3gYpqEteq2DywU5X7QPlcfUbH0M2fVvvBqtXeOjYiNKGmsUoGfAQbDjrx+hCRw
         tNQA==
X-Forwarded-Encrypted: i=1; AFNElJ/ZXJ38HRIl17gYtDnFXE99QYK4+Bw8g4fDF0+4I06trkuS7qtho867X9ZHxnc1SCPagj3b7JZynPRoaOdVVpHH@lists.infradead.org
X-Gm-Message-State: AOJu0YzeOCEUHrsW1U8fZQUiOZGa62QB0IWpTUlH/zI5z6HTtACN/kVx
	nw63dsB7JHqjCb7YKhPfArkUNLaxzrGoyBZ9WdFg8Bz6dyW63DthIIIo6UPxt66WED0Rmbu54YD
	Ut/kbPbpdNIL8Ey9tGV1TxpZqf6njONzVOnTEu5c98HMWUgSDTH5fJ/IWhSr+QrKjdiLk6lVRYq
	vmHQ==
X-Gm-Gg: Acq92OFK5w4qD2eH6U6w5cnTsCwBlWCbLj472XO1Bud48qyi0MAWJNH0yIdWHjhUHzC
	5nipcYG5WlD9TVgo5XJ6oUXwPE+SwgHbpG6Zo4n78GQIIgNauN8JWTEuyDNjmWrlOQTV82n2x/p
	fDzgWF0KCjVU3LlY55amNK43Lq0ZcnToK1oR5uLdxt+kTyjBcYIwa/wCUU5CvV1jolAHVMu80LP
	C6Ac6jskT6sFtEnGllMKyVm6AVrz4JHtKL3hFLYK4dTrYdJ2xDhAwYysqf7w43kNHjBYVgo75FE
	Y/zVLWp5u3oBjfvufp4Y8qIUH/uESrqlK6RTNfWS8YHNPSBgV3B7Hp96f5nfNJrHzuuiQ3XBAM9
	rTAJaexDTa+yLArHUzG+pCVp7GheFlWGsaEsUvsLCpUZoIu3lCgrFsOrCI2W5lEOuePzDWJuGlv
	JWrTo=
X-Received: by 2002:a05:6102:2255:b0:632:509b:e399 with SMTP id ada2fe7eead31-6377454e62emr1205260137.3.1778762608394;
        Thu, 14 May 2026 05:43:28 -0700 (PDT)
X-Received: by 2002:a05:6102:2255:b0:632:509b:e399 with SMTP id ada2fe7eead31-6377454e62emr1205248137.3.1778762607958;
        Thu, 14 May 2026 05:43:27 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bd4f4de6f1dsm86629066b.31.2026.05.14.05.43.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 14 May 2026 05:43:26 -0700 (PDT)
Message-ID: <14a2fbfd-97c1-4ba7-aa51-a07134102d3b@oss.qualcomm.com>
Date: Thu, 14 May 2026 14:43:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/8] arm64: dts: qcom: Add GPU support for Kaanapali
To: Akhil P Oommen <akhilpo@oss.qualcomm.com>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>, Joerg Roedel <joro@8bytes.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
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
Cc: Sean Paul <sean@poorly.run>, linux-arm-kernel@lists.infradead.org,
        iommu@lists.linux.dev, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org, dri-devel@lists.freedesktop.org
References: <20260512-kaana-gpu-dt-v1-0-13e1c07c2050@oss.qualcomm.com>
 <20260512-kaana-gpu-dt-v1-5-13e1c07c2050@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260512-kaana-gpu-dt-v1-5-13e1c07c2050@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=XIIAjwhE c=1 sm=1 tr=0 ts=6a05c371 cx=c_pps
 a=JIY1xp/sjQ9K5JH4t62bdg==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=pN7wo_Rnn8_v9tKSZuAA:9 a=QEXdDO2ut3YA:10
 a=tNoRWFLymzeba-QzToBc:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE0MDEyNyBTYWx0ZWRfX51j1E4uMWZ43
 i6CeLIlLTuwJikRQNwSBUSKJze1IuISQZ/fpIX4T7G74GOFRsUkAYJ73Nxt7nWvQLR72gSoezqO
 dnMf8cbpkAjxP0K9jV/WcZKxX3/O1+Eu/uoHE85JdB+D5zbFB3uBTUFeQC5jbL9plfOSQ+NEpms
 Srnj/BN6vQOwjp26xSAJaaUiva2GtfilydftOlTq/0QmruET/hpx8YweAGpM4jLXYW/FcbrqVXT
 faN/JW8RYjrlMVRvIdHv2aQ1EAg801V+xRTjF8j+JuNlfeVJ61+G/8ccoQFEmAQwegMbf9RXxUN
 ZeObvgghlKlYbcGV83k5iNlnBwHuAA1sXO8gU5Qno7aBGLk1olZK0UTjnn55mSfxmMQYngjqbqw
 CST3JIvF6bu0BfDEFtlqirYKAPEFZG4MWjilB35y2x9qV5vB18WW2jO5KdqjBjbPs27miNBKBRR
 wWwGf3I62OITwcyu1wA==
X-Proofpoint-ORIG-GUID: S1L9hTaXTd5lp6Tlrha-w2zkttidDY3_
X-Proofpoint-GUID: S1L9hTaXTd5lp6Tlrha-w2zkttidDY3_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-14_03,2026-05-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 priorityscore=1501 impostorscore=0 malwarescore=0
 bulkscore=0 clxscore=1015 spamscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605050000 definitions=main-2605140127
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260514_134334_171537_0336125A 
X-CRM114-Status: GOOD (  16.85  )
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

On 5/12/26 12:23 AM, Akhil P Oommen wrote:
> Adreno 840 present in Kaanapali SoC is the second generation GPU in
> A8x family. It is based on the new slice architecture with 3 slices,
> higher GMEM/caches etc.
> 
> There is some re-arrangement in the reglist to properly cover maximum
> register region. Other than this, the DT description is mostly similar
> to the existing chipsets except the OPP tables.
> 
> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
> ---

[...]

> +			gpu_opp_table: opp-table {
> +				compatible = "operating-points-v2-adreno",
> +					     "operating-points-v2";
> +
> +				opp-222000000 {
> +					opp-hz = /bits/ 64 <222000000>;
> +					opp-level = <RPMH_REGULATOR_LEVEL_LOW_SVS_D2>;
> +					opp-peak-kBps = <2136718>;
> +					opp-supported-hw = <0x0f>;
> +					/* ACD is disabled */
> +				};

The clock plan also has a 160 MHz OPP @ LOWSVS_D3 and there's a couple of
interim OPPs that you have that aren't part of it (but maybe you have
better docs)

Otherwise lgtm but the size of the GPU region and the GMU base look
slightly confusing when I'm comparing them against the reg map

Konrad

