Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CDD5EC43458
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Jul 2026 19:13:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=93SaqZgRCSZmk9+Ho1xlDlbMr7fxHHhWTs2lCLEiG/0=; b=LtVsiYdSuPkrmNslJ0Z57UmxXD
	odVmKIxeE5LTpq0dg9o1mm6J9qTGljoP3Az41V2XIy3X/UJ/lPRlWyiGxJp4uHdge0nYJL6UdVT3W
	/pHeKjQ+wE9AMGfhHU9MKyBQWNGa+mupzdGJ1LdNrI0uBS183IR0lyvbKaThPpwhoFfwdwOlL47zW
	Fqxt8l0lE2fL/IKfdgsDzEHvZG+l0O9D9Ri38ZjOeCNO7it9Mc669W6Mbg1aZRCiSTnoMsn1vfdgq
	r7C6dOkXUUDX4xN/R191bv+KVkp/4HseNU5QTWK5dpqp1KxtugER/AHVUbnvTkutLxa85vM2QVQxa
	XGPBFaWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whuBh-00000003QeX-0Q75;
	Thu, 09 Jul 2026 19:13:33 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whuBe-00000003Qdj-0bVW
	for linux-arm-kernel@lists.infradead.org;
	Thu, 09 Jul 2026 19:13:31 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 669HYVQ92476995
	for <linux-arm-kernel@lists.infradead.org>; Thu, 9 Jul 2026 19:13:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	93SaqZgRCSZmk9+Ho1xlDlbMr7fxHHhWTs2lCLEiG/0=; b=YVmUgrwNnfs5PiOP
	xVFJ+HLcHPcQzDiBLtL5JLLhOBBI3ef8L/ZUJhvcvpxV1hYIta22f8DSSRBncqzu
	JvAOXIp31N47AmnsygndA5oWLS+WI8EQv8osBcvo6NTlk7E5fqXkWAWyAdbadji0
	ONX/xMAk0wHhMinxZuhejIbE9J4BFODILamS/mwvJjeb+UjwlxIj+EnWOvBMXCjD
	RA/0w2NQ5ZU4At/d724ZsyQZ5RIPlRUpSwuJjMeCtymfqsTf9+IyTTwJwQQ6w6pB
	OmrOHktk4Qgo8jid+3Kifc9wozrVwNBoKdwG9aErCkbrNUcNTBMRfNkEyMm3Vwz2
	yeHwMA==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4faf5mrt6u-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 09 Jul 2026 19:13:28 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-51c27616421so408311cf.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 09 Jul 2026 12:13:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783624408; x=1784229208; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=93SaqZgRCSZmk9+Ho1xlDlbMr7fxHHhWTs2lCLEiG/0=;
        b=MRH6QXgl1oF/FaxEQtGs11Rx4KZneSLWbbq6hZb04E3jKQb6QlGh5A+1k4haegs2Qu
         xvPyligGWT6gDXkIBNm8tww1wp91xPiICiRXnkODT27xgZudmsaqO04MK00Um6W1rszP
         Nybx9QFCh1v5+1ORS8eZMq0wd/5E8PVCnmhTU7W4mIOY8ij9W1x4Nq8u4G1tSnnpd/0A
         kA4h8KNt5pvQrMX83NDzG2qQLcAWvseoth8GelH+nHNQ6GkCULDMji3CdebT2NKDEPbf
         gvGxH/+14mwyTOjnYZK/yRonEEn9TKv9ebPUtQAHWJPGvoYqRHdjj8qyw0UBigNb9fIK
         x9Mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783624408; x=1784229208;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=93SaqZgRCSZmk9+Ho1xlDlbMr7fxHHhWTs2lCLEiG/0=;
        b=KeQRyfzxyh9MSz9SclvGi6J6zZG5fhLyBKlYGYmY7oq+C/bi3FnJvin1PerkXjdLgi
         vaPPbreYH0451IFHMyAGtcy0keyUgu3aU5bRXevuvVUQ5Ua+bxyfOfR0Z2B46KmpSSf4
         tPZnePq14dh4Th4OQuErt3kPNuEkFHtgGIpLTj5QL9fExcj/5KeWPEE4Pse/YJ3BZdvD
         I0f4LIvTQsTSYLJkyMiS+BO7vDGnUwWtOHK/JES6kYIrWQ6yhUU6QGVNU6QXbhBbPp7t
         5pVIATFzhPQfY4Pzs7ep2O2rMDWMC7IIby5J3rIkiMXWAnHfxj4JbBJqcJTVzRC16fEz
         KQyA==
X-Forwarded-Encrypted: i=1; AHgh+Rqd+JiD5pJMrDELx5Yg6YFT38JFvBzp+m4uQVteZm6d8jl7JzaH2bDQOHCw4b4HAucwahvsrqdmmMFD8WsW5vVU@lists.infradead.org
X-Gm-Message-State: AOJu0YyVs/k9pjOkOqyvPlD1uMBKNu06C58AmjtHV+0GeUrz627KnwCR
	i0Ehbjy1puiDbFTb5U92QxoGiLId1XVg91CLBbwkpTHaVT6V5Hf84MAIejikEOu8nWdt0E+QDWE
	bUVdzSPR9VorhYlieZ1wYeLZgS4I0SGFMLMmzpnjD9Q0kw62AbEmea3HiS90lKVeRArjxPEqBKE
	npfQ==
X-Gm-Gg: AfdE7clFzgk6sVErXu04hRLKC9Kg8W4x153A2c3b5Aq8V2C/fVmll2alMLreeEQblqE
	4Uo7wsjv41hmtUyyfXEh8d/dhdcENfgAMdMIWyuIo2wwPp3OwGw3zu/OCOnQ6sXWAyv5vfbQney
	cfZNBZSrl3orr8LGbU3X77A8b0Qjg7KK4cs3f7ateVmMDPr8AdZZygNbkBk0kO8neigIQxd0mDl
	GmX6OCLd32aXANCRiLUPh3UivB9TQJ4X5J3UdbouqQ6dI+d+rw/qOAaenMidsEEEUZFYKqoJgpG
	fwxf8BTA2Okt1GvtCVo1aZgGAuWXyBC/9pi2fLIrvX9cYxI2Sq0niBjlgmlXTRv0MYl/qd6nNRt
	b0dEhLYqFCMDf2aI2MUop2Dx+WiSMWITzyvU=
X-Received: by 2002:ac8:5d41:0:b0:51a:8945:312d with SMTP id d75a77b69052e-51c963e7d09mr47417341cf.0.1783624408392;
        Thu, 09 Jul 2026 12:13:28 -0700 (PDT)
X-Received: by 2002:ac8:5d41:0:b0:51a:8945:312d with SMTP id d75a77b69052e-51c963e7d09mr47416731cf.0.1783624407847;
        Thu, 09 Jul 2026 12:13:27 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c15d5de95e6sm277444666b.39.2026.07.09.12.13.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Jul 2026 12:13:26 -0700 (PDT)
Message-ID: <b9c41d2c-b036-4d58-8cd2-da94ab6b9ca0@oss.qualcomm.com>
Date: Thu, 9 Jul 2026 21:13:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 7/7] arm64: dts: qcom: shikra-evk: Enable A704 GPU
To: Akhil P Oommen <akhilpo@oss.qualcomm.com>,
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
Cc: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        iommu@lists.linux.dev, Aditya Sherawat <asherawa@qti.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
References: <20260710-shikra-gpu-v6-0-b388ec5dce77@oss.qualcomm.com>
 <20260710-shikra-gpu-v6-7-b388ec5dce77@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260710-shikra-gpu-v6-7-b388ec5dce77@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: NRMd6pKbSXSAveZEiL33m7yThnAklw6f
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA5MDE4OSBTYWx0ZWRfX3BuYnxzkMjUp
 BEbwnlW8FqBBftbreK5kSH22DZ/flf4GpvzTP0N8tySP3+aEBoTomLj4dyeau9EA+kCleP0/JMO
 3HkFSzSgjwx2bzKVttsPtSgowx2pdWY=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA5MDE4OSBTYWx0ZWRfX8PaJOburJXEu
 IAZbMV0GpAtiaCXnQRssw9uzW+izcZoFlfNtLz5ABaZeVSULq7YXeZ+8I/Q00yJFxFboKisiZaU
 3jB1Sj/10VMRm98NDGFGQVJ/AdL1JkKbTdscp/kHcZjxAiW9rbJNqluFx8+HZ0RlZLLlgjVt/aa
 rqsZYhf1NWZxjvzmF8xLIhjonBgfB1s+MfIgNkqNVuzMOp+qOWuUDOoP5PdxeqWq4bjes0uRMEA
 TBNSHgRwykrirCMvkp0dUdsQaeqkT6ino09mz3i8FH3CkVqrRoJFRc0vrpYWSBKtnwpCD5kjWg1
 VdT3qSoTWFzJ5zP8Qtf5belpVHM6rvD1acskVpgOoPFq49ZXyKZwR1WGfXpc5mrzczIeaYTQXv0
 DpfYSGIl8Aa4V3V5GptUahEgwfqU/I5ZgaRNN+zaw7dGER/1uu7siC7oN1USddpiyZGSBRI1JPG
 RsOAmRNAPxe2qflV2Tg==
X-Proofpoint-GUID: NRMd6pKbSXSAveZEiL33m7yThnAklw6f
X-Authority-Analysis: v=2.4 cv=N+QZ0W9B c=1 sm=1 tr=0 ts=6a4ff2d8 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=QDjCMyA0A8yHJihhU1wA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-09_04,2026-07-09_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 priorityscore=1501 phishscore=0 adultscore=0
 suspectscore=0 impostorscore=0 spamscore=0 lowpriorityscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607090189
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260709_121330_302984_50AE5DFD 
X-CRM114-Status: GOOD (  10.45  )
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

On 7/9/26 8:42 PM, Akhil P Oommen wrote:
> From: Aditya Sherawat <asherawa@qti.qualcomm.com>
> 
> Enable the A704 GPU and configure its zap-shader firmware on the
> Shikra EVK boards.
> 
> Signed-off-by: Aditya Sherawat <asherawa@qti.qualcomm.com>
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad


