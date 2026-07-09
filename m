Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9483C44501
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Jul 2026 13:43:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=g8bbQ0UFrJNgIEmJIIRtCAu5z0XVNIydSzCgLYqggsw=; b=ROVZCmg5qa5gare5dYWj2Fblh3
	s52X4Gedu0XP2lp7InFvWNYA/0uZN5ozf87aPlDOAR6mQvdhQdH6hzgqRfZC5Q2HyXqkqBFiYs4+x
	YC9BvlaWmvvy/kCR9Eeu3Wuqa+rM+brsQKjwg/nVY/uxgPuSR0UN8vzCKKfoym/+NGJ+NySdaoBTz
	w+zNj8mh09jtmtXrG5sUBfVYDTQrGwliw0JFK8CcssBoPJSb4M+6NF3kNvCwSsMAbeHYYpcGk/FtO
	DKeGHw6AxAstcl2piaGBUzSQ9EUDc7iURHMNnCoHYLu0SusJEN9erBBI6xS56la00JGxVS2W4szzO
	68HhYhww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whp1h-00000002al5-0HVZ;
	Thu, 09 Jul 2026 13:42:53 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whp1f-00000002akf-0lKA
	for linux-arm-kernel@lists.infradead.org;
	Thu, 09 Jul 2026 13:42:52 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 669BN7tL1537225
	for <linux-arm-kernel@lists.infradead.org>; Thu, 9 Jul 2026 13:42:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	g8bbQ0UFrJNgIEmJIIRtCAu5z0XVNIydSzCgLYqggsw=; b=F9Hch3o4T7NJsf1P
	wYr85a/DCvN6Lk4nLUGhMp6PTQ8FGNyRBL4yiBFkchly0uHRxjitwucI7vHbO41Q
	tJnar2UtGCxsFj+B9TnV3UlOd8lNnGyad1xFdI9HqkhQGq1dnAAE75yCjkndoECa
	R4gcK36CkRDIXEBDX1V7M1Han+SiynAuFBVvkiZwvIWLJuLueTQRYwWZH1yDT+z2
	4fLwJINlvXvRhk4t6gZnB0o7DCb9bUdfxln07nk7QowDBzRE+SHAg+wyvCC9DSbz
	Mmq2P3Ufltc2M6WYNQiyUmUJ/CIbHY6mcohhCoLsG2pqULDA3YRb2fhaUH9vjLSW
	DbQShQ==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fa1ydtycw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 09 Jul 2026 13:42:50 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3810e5c5871so3475960a91.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 09 Jul 2026 06:42:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783604570; x=1784209370; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=g8bbQ0UFrJNgIEmJIIRtCAu5z0XVNIydSzCgLYqggsw=;
        b=S+VRDJ9o6TfxvXkt/C0iTlc1S+dDFBIU6yL7HVoWI5Y1Y8PrifpFM7toXHgDDJyq/g
         PujXMFAFBzloBkmjg0343llhiFnAxHvL3Gi/rhi3Ky/ECJcMTPbzv8oHtEOdSkOBJix1
         U2bgogqaRhn4laz+grTA7H0DEgQpHg1U5WbcGPPpCV6gqZdfU+h5kZ03ZO4sWIBGw7Sm
         AOl+Hk2h57JkRozPtC45ngQztVzfKb0gT8lms42GQREfab3obtOiaVb1qPzea1fXHPyy
         +1ebm0+nHYC0XZoLy/Z5Ix5gAjOw54A6Z178sGNuQMjyyc+kuJnoFs9kBFlF6rdNQmau
         mgsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783604570; x=1784209370;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=g8bbQ0UFrJNgIEmJIIRtCAu5z0XVNIydSzCgLYqggsw=;
        b=MV6pe79TWeWfUuyS7Htrk7SrxIe5u0paJp7mKo45zgtv48JqmQ7aEj3UHxyGPuLWEH
         BDFZk7oPO8XVIvW+cjooFr2gCiPIbwYQKB96zpYEbBclDLQBHXUP5OL8w4BPuv+dws4d
         C5UcxKBmcOlydNnmvfAmGSqqSJWUmdzgBbhb4jj/P1/24Kh0Z/hbeTUlnwSwGzA+mtts
         yhKHNq04lpdcbx/2sTUiEr4aHh7C6yKTNkRVIlguOohVtsrHbeoATiPBlYd0Hr3EbW6J
         Fy6jPXRGBHWdQYIpbxxH3lvFyG0PLb+7oCyJOzvmsoPTuBIzKj2STebNY6Uq6Ko073Ln
         enRA==
X-Forwarded-Encrypted: i=1; AHgh+RpMqLoEUOoLHNP5CUIXs3MbSjn4+zeozg/1Qpi+t4Rq3xgjlC+4GxqIb0AM/WV0guyjrEt1mrX6OSBal/3U863t@lists.infradead.org
X-Gm-Message-State: AOJu0YxyJewowry7Yev+sxwktVCp6qbYbPIV717fDAO1pAD8VSoDupg1
	0h0OXv9s+78Vbks43hg0cTH+5JE8aXf9Bhz+wFKZXkX8yUEu0sE6Q9PFpdFab+XNoXe8wzitKQt
	7+Mqmp7FFlSD0QamWLRAsqe35VnNIKcLDpUYdJZ2RJUDuJUhpFIcGNvfyIZsNf5CcvqY8P6ZU0p
	R+1w==
X-Gm-Gg: AfdE7cnfd4zJqDNQLlhtjohfqn/DJU7Csl8o6Vcv/nFMwIEEdKtR/+xMVB4JCm70L/P
	AQHRhOtOOXor92hKan5it8ppJbVobXI27pxAc8CUzp+KKMgwEBV9SRLRQG2EYE3JsRuO/GVUbBO
	UMnNe4O3uxxUIFoFnEwJpAUvp3zAmvmIZ50lN7HknI8b3xYcGr07JbSLDEMoPJP26CLObHvJB5A
	cZY51pj6KgZLsN4YSeI7A7cPCcZfxnk2zp+T7t38RkuY8Xz/emZVBtFIOEjs8guhsaIUK3UPzaQ
	wM2DKVFrQPr5S2ExfidmNAIyxn71BgRgi3rF/Q0kQzVihm30na5uE1PvGeUVEcXF5D5x95oXE06
	K/cyO8ye3BQ+/48Tc64nwjz/cQBdfSS3BR1Y=
X-Received: by 2002:a17:90b:2d91:b0:381:1c96:829b with SMTP id 98e67ed59e1d1-38941102108mr6904992a91.3.1783604569736;
        Thu, 09 Jul 2026 06:42:49 -0700 (PDT)
X-Received: by 2002:a17:90b:2d91:b0:381:1c96:829b with SMTP id 98e67ed59e1d1-38941102108mr6904955a91.3.1783604569291;
        Thu, 09 Jul 2026 06:42:49 -0700 (PDT)
Received: from [10.204.104.211] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31174892711sm32820196eec.13.2026.07.09.06.42.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Jul 2026 06:42:48 -0700 (PDT)
Message-ID: <54cb37bb-aaa5-4c5d-a563-acca4822dd35@oss.qualcomm.com>
Date: Thu, 9 Jul 2026 19:12:39 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 03/13] drm/msm: look for lpac from dts
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Anna Maniscalco <anna.maniscalco2000@gmail.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>, Joerg Roedel <joro@8bytes.org>,
        Sean Paul <sean@poorly.run>, Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar
 <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, iommu@lists.linux.dev,
        linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org
References: <20260705-descriptive-name-lpac-upstream-v1-0-01d50c3e0c99@gmail.com>
 <20260705-descriptive-name-lpac-upstream-v1-3-01d50c3e0c99@gmail.com>
 <rwohvfbsw2brpxrfg26egu5arwe6g7n2etelo33eegmu5cz65k@3syofuxzsjrc>
 <dc5aef2e-600e-4e97-b76b-dcc8bd72c709@gmail.com>
 <m4vwrqt6yyaawpvkyrqfzs3kbipbhygmtrhphuthl2gmjvkgyt@u2d3dnvl2phy>
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <m4vwrqt6yyaawpvkyrqfzs3kbipbhygmtrhphuthl2gmjvkgyt@u2d3dnvl2phy>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA5MDEzNSBTYWx0ZWRfXx0kFAqFEvXXb
 a7Q5sd4Pt436pSCVWw1/+qczEfm/YyigoOkEnpKioDDGYIK5x5eA5j+Ym/mH2N6d14XZdo922O7
 mA15yVSRJ7yKNBkONiXhgMPcRuaLmPo=
X-Proofpoint-ORIG-GUID: H386puLLmCqtz5bP52xbXjz9ZT47Jpyk
X-Authority-Analysis: v=2.4 cv=cOLQdFeN c=1 sm=1 tr=0 ts=6a4fa55a cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=VwQbUJbxAAAA:8 a=9jRdOu3wAAAA:8 a=pGLkceISAAAA:8 a=mritAz9d6wIG9kTKuDcA:9
 a=QEXdDO2ut3YA:10 a=mQ_c8vxmzFEMiUWkPHU9:22 a=ZE6KLimJVUuLrTuGpvhn:22
X-Proofpoint-GUID: H386puLLmCqtz5bP52xbXjz9ZT47Jpyk
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA5MDEzNSBTYWx0ZWRfX09VHtDbj1cIO
 AGKPkzgnRxdu9to2Idp9ZSN0zfIoD1ndzoiJXuOUvbcxO1rUxnm7kP85vwJLvIiC4WJFbbuZBwl
 idlQNmRKnpQew2fv6g+9CfqLTC/msLNvwpKAtpK9PG/fnqX70l3ZlnOEgpY7hTw6agtjdDK4AaG
 IrAKh+QhUjoG04QNFDpegeoJZuDFcC8p3W0vRC47v5A0ao02DNqwbg87WPB8SOtiiigPcCnxPPv
 qs5nE1DoqoTqR5307bHtr2asSIqlWwaNyatg9eizx/z0kqI3XAlDwJP7UzBiGC0ap2dkh4QulcG
 XDJcXX6tYKcWel2OrvsGXuE3tWytLLCkThu9fsjSu3WYk681m+EG7mm02Oq/ac2XqEoER9A057K
 g1uKBZIVcHBRcbwTrDtbziW5vl++1mK+BbONxZ3fwTTjBY1C5aXaqopqHJXodqF8naznFGIxO9D
 tYgnA+ALVV0lzGecgFg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-09_02,2026-07-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 priorityscore=1501 bulkscore=0 spamscore=0
 lowpriorityscore=0 phishscore=0 suspectscore=0 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607090135
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260709_064251_229744_EF873D18 
X-CRM114-Status: GOOD (  27.86  )
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

On 7/7/2026 10:09 PM, Dmitry Baryshkov wrote:
> On Tue, Jul 07, 2026 at 05:02:43PM +0200, Anna Maniscalco wrote:
>> On 7/6/26 5:04 PM, Dmitry Baryshkov wrote:
>>> On Sun, Jul 05, 2026 at 09:13:37PM +0200, Anna Maniscalco wrote:
>>>> In order to associate the SID used by LPAC to it's own domain and
>>>> context bank we need a separate node on the DTS.
>>> Can we use iommu-map instead of adding a new device using the same
>>> addresses? You provide zero explanations, but it seems like you are
>>> trying to separate a part of the GPU into a separate device, but it's
>>> unnecessary.
>>
>> What I was trying to say is that we need to map sid0 and sid1 to different
>> context banks.
>>
>> From what I recall, so long as we use the same dt node, the iommu drivert
>> provides no way of doing this.
>>
>> What kgsl does is having a node for the iommu and then subnodes for gfx lpac
>> and secure.
>>
>> The address on the lpac device doesn't really matter. I have very limted
>> knowledge of DTSs but I think we could just leave it out altogether?
> 
> I think, you were poined to the Glymur Iris patches. Another option is
> the QDA driver being submitted too. Both ot them use iommu-map to
> describe the same usecase - a set of SIDs which are used by the device
> but which should not be a part of the defaut set. With it in place you
> don't need to have separate qcom,lpac devices, no additional properties,
> etc. 
> 
> I'd recommend following the same approach.

iiuc, the conclusion in this recent thread is to use child nodes for a
similar case:
https://lore.kernel.org/all/20260618151745.GD231643@ziepe.ca/

-Akhil

> 
>>
>>>
>>>> Add the code to look up that node on initialization.
>>>>
>>>> Signed-off-by: Anna Maniscalco <anna.maniscalco2000@gmail.com>
>>>> ---
>>>>   drivers/gpu/drm/msm/adreno/adreno_gpu.c | 21 ++++++++++++++++++++-
>>>>   drivers/gpu/drm/msm/msm_gpu.h           |  1 +
>>>>   2 files changed, 21 insertions(+), 1 deletion(-)
>>>>
>>
>> Best regards,
>> -- 
>> Anna Maniscalco <anna.maniscalco2000@gmail.com>
>>
> 


