Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 540F5C43602
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Jul 2026 10:12:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ByMXdijkHl9hu7GM8jt2AMzJWtpO0+9CnetiEbvOVzc=; b=jdjarYpPx2CX0r9iQ2ncSNm/MU
	+YnHdmiDbFvKGbl32MaouP727teZ8Ja6REQ4upf/9i6ZtqSeBnpzclwCc26TIgEJj5zHKgJRiKM6s
	MvRXkFGqCkpiRw1aLA6IJ8POgLZVC+BNA4f3b3EkZ/pMc/BW1nHFlBHCmLsaTWpV7Ot7jm6QA8ILv
	UezD4ZvSaZkkOFjQpiOK/nc1PvnthA9DwwaYIRjxDkDDPjOgOyPjNjsszlg78bD7yTO6M58z2qrPo
	Bfsz9gVAWVYby0SuLNNDRHVJL8RNnjXNqKFWTG19XgTv5FxUUcE4is/Tqov55iKrds/pKvTXATPej
	sErrjHNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wh2nN-0000000Ei2C-06zu;
	Tue, 07 Jul 2026 10:12:53 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wh2nK-0000000Ei1K-1d6f
	for linux-arm-kernel@lists.infradead.org;
	Tue, 07 Jul 2026 10:12:51 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6678DcdG3076592
	for <linux-arm-kernel@lists.infradead.org>; Tue, 7 Jul 2026 10:12:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ByMXdijkHl9hu7GM8jt2AMzJWtpO0+9CnetiEbvOVzc=; b=VpA58R8JiSlVbUdY
	S6MHesUXfkwIBo3HzMez6adaN2gWzDQNMFVx+ZUl6tnES3W6Tj7pt6rjlanvjnT2
	o/GnGIDyN1LLdP8ZAQjUn5H9g+jqKQbT/8WiEiA5LlB8OHGlELSDOY7sXwVeBuxM
	4EIFlwi4NOfosfmkcncRQYCNxqXSP+S3tGmodsagdfWod+a+tOVUPuh34/QB30AE
	Svx22pQiSPcvtll2QpJgf6rGYIdQGtYXyJ1ve+H4FGtlD5ZTHp/zXAGmt8JO4v3a
	sa++8xf7Ka1c5Cwq8TOl+nzZsUl2njze64TKgSiVxSwg5mWPewNTIrc0pgltRBFb
	Q3pCtw==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f8vun0qe7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 07 Jul 2026 10:12:49 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-51c069f73e4so12899001cf.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 07 Jul 2026 03:12:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783419169; x=1784023969; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ByMXdijkHl9hu7GM8jt2AMzJWtpO0+9CnetiEbvOVzc=;
        b=Rj+BSGgg4wJZNL7fKgfTkbSA6ZTusjd1eqJEIiuKKBEASeypAwZbbncetWmdfXsmaf
         qtt8Vbz/+WPcbMFfejokY9HTBbWYZEqrbEmAeScXlOyxS7NURqRQDq7aUD01qtbTv3BH
         usoRC6lk2F6Yh8rY4eJ5zAV3qEUD9fxHosmceV7BJmBl6BxU6VSOyID3cU8CKP9pH92m
         wgIEwOkXQ+LZ0o+o4dkJACsiRRO9UzOOaQIb0u64Aj6nHdbsJqavVrtBG/q4rg3WAOCb
         tIDwZ9Fs7zv8byI09JZjThFDMlJn9gc/bhzhhSHPsLwq6v83wv4Mim50G1l9OGKlueqb
         1BXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783419169; x=1784023969;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ByMXdijkHl9hu7GM8jt2AMzJWtpO0+9CnetiEbvOVzc=;
        b=GPU9XBjHiTlDrqYALZISchg+xciKsS5+qermsp+MubuGjBIb2erfQmJxAevyJFLY0V
         55lIaXhScRO6WPL0P1ohsx4gyvsK0C/6q+mNnJJ1SCMQbvtYM1hHk3ePybkvVJDJ7JJk
         jMqkLqUP0ayz3ZeO5gCe2UeYwPXxLCh1kOmJVm7CEv7XrOgZxkaI6k/kne93GziwkupD
         1Uy7xGNhFA7pWmgJaldGvJOreXxhKScvdJdVuCloet9ErsCwGpMEwAlBbtckZShe+N9P
         fymwIw5OOSQI9ct5epTkOnjwqvm3IlMKVRmgW05k6iWyVtYbA8TnHW561tmORxBjGbyu
         Vhrg==
X-Forwarded-Encrypted: i=1; AHgh+RrQspVtYfte68e134AlhI0LQhagn3Jz3EahkQFbVzyaztvR1tVraGa7SGgVzcULRG9i0wWXhTAzlWc8EWv9uVpB@lists.infradead.org
X-Gm-Message-State: AOJu0YyMIG/be0pCcpKK3P1zc1w7KkfLWTx/GG3bPePob4pwu01X6HJ8
	AtBbmTZuKTZh5d/P9YzEqfiC3kO0XoBbweoxumGuz1SmZycL/ISnXjMP6uZnU+qJj8Re6Mzzw+j
	9Mc2pBLrobUrVjOkQNlGHuhb8t/MPtau8BIFWshRRc95yNoUlT66ozOT2sbW6pqrrwkrmUMuJZo
	18bQ==
X-Gm-Gg: AfdE7cm0zfoJNmLW4MilFi/9tjrCgQIIeAlPgxdePWgVVj1t3FjGoj2dxy2Lyx0tPN7
	JyoJJ+Cw9TEqdcMZm0hOk7MAFMA22/qJvlvr2pWNs81n6Zw6jwUFUQ2r3sVfWq1LxnjbS7vLlNT
	ehwx/gRStjWbPNk6bKO9oRDAEyIhiPScvtOrlKxLK4mv7fE+K0ELKdQLOHVgOUGC8ZftVU7goak
	LVkamKlJpWjGboFOlvx1Qz4/iGlnrC+MCmQrCtLA+Sh370zihLwtcghI28hN8JE63NoCHRb086D
	9+dEsF4Q+Xsp5bcjnBj2Mn2dREYMfy1yOef0moPY6424aG3J/BxWdoLouq+9x9PR6iQcN5McLvn
	LJjIuLcOgeCtFBaFUAOc+PfG/hRkeTnvtkBA=
X-Received: by 2002:ac8:5a0f:0:b0:517:57c1:bbdc with SMTP id d75a77b69052e-51c79ed34b8mr20269531cf.6.1783419168915;
        Tue, 07 Jul 2026 03:12:48 -0700 (PDT)
X-Received: by 2002:ac8:5a0f:0:b0:517:57c1:bbdc with SMTP id d75a77b69052e-51c79ed34b8mr20269231cf.6.1783419168432;
        Tue, 07 Jul 2026 03:12:48 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c15ada057bfsm98437966b.43.2026.07.07.03.12.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Jul 2026 03:12:47 -0700 (PDT)
Message-ID: <36f4507c-2524-4a9a-b38a-7d061d13cd4d@oss.qualcomm.com>
Date: Tue, 7 Jul 2026 12:12:43 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 4/7] arm64: dts: qcom: Add GPU support for Kaanapali
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
        freedreno@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
References: <20260707-kaana-gpu-dt-v3-0-8dac9a60dd5c@oss.qualcomm.com>
 <20260707-kaana-gpu-dt-v3-4-8dac9a60dd5c@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260707-kaana-gpu-dt-v3-4-8dac9a60dd5c@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA3MDA5OCBTYWx0ZWRfX6JVr5ZUoOF9u
 oUiSo7QYaXYvyEzghuMNOoWR3AE6M+5AEfVWkplE+xKRJra8JTnYgcWdr/zvws6QYh3V8rUeEP2
 uRMkOF4rZkCxCZi7ALPaX2n/j5Z6CHY=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA3MDA5OCBTYWx0ZWRfX3VZm4pTNfcOz
 57PxlwV0BOMyBDk/yc/VKdTpzLfFm4bw9ADdVaMKvIcS5l03MXjTCntfExuRHOevF9dAHKtvqxK
 fkYbvWtMzJpIKzyNRZpxA/xltQzF5eHPSq/5g/h2i2jbl/g9KKDDvBhtIOX9QbULFu4enJEQroI
 JWIUMpQ7pcYSd1Q3Z9Fbh0ar0J9oGiA8HuvgHHXYWFlF+gHgBj8q2OSTYF5p5uZgzMkovkQsooU
 3XPdXF74KDE2PaSFn/VZ/l8BbKfIhi0YnO5VynVbmUfEhETy0i84KLSTRtriZ3BSJ3Njt8ROPcR
 vAwjNMIdiquG9CNW4GRJ0xwvxDgzOXwwDwN8JPYcF9Dn7eKOYRvW/Op/LKoV0B1RsA8gI/UvgC8
 ZjarqSd+mi/Wa/iPLp1/dE4YaEIvx5IcAvZkPpZQZosFD0am4eDlLtnkb3TdfuQ+KKRbWaEMiuV
 Q5/Hd1molI2RhjoDpWw==
X-Proofpoint-GUID: g5J3TJQefFK2V9SFC9Wl1sC0ogWp3-m_
X-Authority-Analysis: v=2.4 cv=N+IZ0W9B c=1 sm=1 tr=0 ts=6a4cd121 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=z65YV3W3F_EkYOo9s_QA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-ORIG-GUID: g5J3TJQefFK2V9SFC9Wl1sC0ogWp3-m_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-07_02,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 priorityscore=1501 clxscore=1015 adultscore=0
 bulkscore=0 suspectscore=0 impostorscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607070098
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260707_031250_524879_9BD6210A 
X-CRM114-Status: GOOD (  14.22  )
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

On 7/6/26 11:40 PM, Akhil P Oommen wrote:
> Adreno 840 present in Kaanapali SoC is the second generation GPU in
> A8x family. It is based on the new slice architecture with 3 slices,
> higher GMEM/caches etc.
> 
> There is some re-arrangement in the reglist to properly cover maximum
> register region. Other than this, the DT description is mostly similar
> to the existing chipsets except the OPP tables.
> 
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

