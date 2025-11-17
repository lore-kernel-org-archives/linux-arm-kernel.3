Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E95CACEACEF
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 Nov 2025 14:06:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kDq+mw+HRp2398SoTeGOlaLqDC78hVLUFcq/9QZ+fWM=; b=XN7svfUYWR75wBUOD9ZWyBuTZl
	UJpwXXDGDtfS1pB5pLMDXTSj7S0KB9tmae2eKWHWlPrcdvLsXGFWZ2H+7EagqbCBOqXzdVHGL9aEU
	897qHXE8U85IHivFQXlWhDNeXl4ZpAKINvrJ54KCjueJGex9JMD0sjVBSe68uxyqndN+jP9CcjNbg
	wmNUTc1vqe0Q+UXmKopFyxXpr2gKJBE+N12ef+i5WsiVNSedTmkDC5EB/tgF60eNFaA0Oru7yTzpm
	bzmeXrqxQzETH3lFcWlfA6Qg4OTLcdivRVDDpQizsvsQpcpatDzkCi3hZRJLNGpMX2lqI7nCRZO+g
	f7MMm4yQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vKzsS-0000000GEVI-0F9P;
	Mon, 17 Nov 2025 14:06:44 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vKzsP-0000000GEUv-1djv
	for linux-arm-kernel@lists.infradead.org;
	Mon, 17 Nov 2025 14:06:42 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AHB2kv83670818
	for <linux-arm-kernel@lists.infradead.org>; Mon, 17 Nov 2025 14:06:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	kDq+mw+HRp2398SoTeGOlaLqDC78hVLUFcq/9QZ+fWM=; b=MS1vdrOy+Oy8cfz+
	4ZwEhGqMOTwdrAe5cxWzUtNCsTNKX1riWifIs6ssyofVIuMJo4Jt1EnM6NynNi0P
	ZPgH10fRFhFnzTVvml57WpBIOix/bYcQLPTqPjBt5AU+LsrabkfDORwaEtARWzEe
	kpA6rNV8Uyp7aNewdnthP/Yi659y5buh7LTpdSZJ20j7XkHtNcw2J2528/3QVLfx
	RnyeSXp4pu/weMDF9CpkXpelZqyXR/Cu2c5cqFOLGggAgqtshtWZXo9IcJPXANFE
	2nYLuhPHak5VbJ3KWxcKtaRuchxf+4KX0AZwXJbkuO4A2cMXuZ3Ly/up/cvxpGcl
	cRvowQ==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com [209.85.217.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ag2g58fwt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 17 Nov 2025 14:06:40 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id ada2fe7eead31-5dbd1b84432so637393137.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 17 Nov 2025 06:06:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763388400; x=1763993200; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=kDq+mw+HRp2398SoTeGOlaLqDC78hVLUFcq/9QZ+fWM=;
        b=jX2/Hwjl3QZ1eee2MtA/fpWPJaGpIRVSEQrTwqS7E8/mo6FxXxT+Y6YKrMCyiwVD13
         lOwv928wgoB3Jqz1TgSRX19RXv6lBaWTJhxewDYiK2KVyQgPex1FPF0N7UPFGTaRMlm1
         SoEF+OI/1BkI+3mYCM4mHYIFRcbbX0k0CafRc/5NXiKXT4sYT/1+aly7a+H4d32IvbbJ
         Ks5/6FsK/vo1SEykUMz/pPxqIuGLr9ogYtQ3juYItZbnTmTmw3HpO536Aso8eodHQeXm
         3tuAA0RN+gp5Hrm06NqNOry53S4nnCbbvFrHEyQGDX6cO8xFhfY+9JuvCdABfWCB/o/2
         /cDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763388400; x=1763993200;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kDq+mw+HRp2398SoTeGOlaLqDC78hVLUFcq/9QZ+fWM=;
        b=MTFpbmKAX5u+mFZ3WMf491hOUsHrNLRbWj13hNJBeDmmAzsNWLUAsgwLuLLALET4Ad
         Qs/on5+E61Lg9IBDh6S9MJ8CBoRpEhEon8GHjKaSITLb1J0rePSslU1MB7Xd2ZMnEO1+
         eIvec5J2JmN55al6s2GTumv7PA7LkFfmBrjVRhgsEo+U61CavALaXPCeeM+RBDrpF8Yc
         sUmZWYchg0Ho43EO0faEssniukLY74/J5nMkzKpqfssNxFBfAZkCWD7nCVRqmrsQDZrT
         C+ySwLKIFuEpEeAvA0I5jeksYSby9ycT77xIuyt4SArmjkXUXrcujpoaS2HouiRwwvIa
         y8jw==
X-Forwarded-Encrypted: i=1; AJvYcCUvZKjcjxDWJo18fi2zdRWcAOeQRGpwpB9CpU7QJHUl5UimNhDunj9a5BKKh/Z1KpV5cy+DspdPUNAq+Yb5UBqp@lists.infradead.org
X-Gm-Message-State: AOJu0YycYzXcQxzZPEgHiconeRJvU32yO9IJLkK39R26xOpBanc8OCUU
	dvMx2trFhLx0icI6Szf7ogGptFFpWDz9A0Qsr+zG6u/GZHjOyXocWtH9WzpC1ismRgNH/10fxqG
	Jh1jeGEdKxxpSrYR3lYnQKVekY6z2UOHW7SETNpZMjE3/AgHfPrsSRYjaxp45qTWEeGH1JrAMUl
	7vN2aSroOmcw==
X-Gm-Gg: ASbGncvY7T7/erzvXFFSjOgf4G1vgDS3tC/ypPj618gOMZJC2PPE1W4+NiF3q0V1JgW
	WuaamXNqJMM7p8kGmZbo9VWpFJzxWorRFnUtRizRCunR+YAQF08JkXhNwZ8g0wALC2UB3HOvPqE
	1/LY0ygGksZSaNEbkCMSERo+UJ27juoScX3nss4fvDvLsSs787I1wW2H5lMyiXIYiiudj0FLFv3
	iZkpQmSnFry44fAaiIDfoBz/YNVpNoHClNiLZI0MQ5GTl38g/Jq04LngEn3LbekA5QddN2zrylc
	IQfhVwfNvHg6OMlvFtUISlJjwc+8NoSggelfRT/nCUB4nlNhKH7A+xLnJpb5dqhrcUbfvbY1erT
	7NUQFiiI1lr5sL3oM6elcqnHrv1QmsimbNa0CLF6cltXkCJr65z+frrJJ
X-Received: by 2002:a05:6102:5107:b0:5df:b081:4a2c with SMTP id ada2fe7eead31-5dfc85e072emr1619598137.7.1763388399363;
        Mon, 17 Nov 2025 06:06:39 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGKNiYRBfXeh/2aXn0HQPLKudUqGsF5V2HxhMggV6/QVJT/a/O/XTnuPbHT42rAwrh0e9Rc+w==
X-Received: by 2002:a05:6102:5107:b0:5df:b081:4a2c with SMTP id ada2fe7eead31-5dfc85e072emr1619547137.7.1763388398836;
        Mon, 17 Nov 2025 06:06:38 -0800 (PST)
Received: from [192.168.119.202] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b734fa81172sm1079373866b.15.2025.11.17.06.06.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 17 Nov 2025 06:06:38 -0800 (PST)
Message-ID: <60fb9b8c-86ac-4c4d-aebc-2c9c2f558fcb@oss.qualcomm.com>
Date: Mon, 17 Nov 2025 15:06:35 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 17/20] drm/msm/a8xx: Add support for Adreno X2-85 GPU
To: Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Sean Paul <sean@poorly.run>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar
 <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Jonathan Marek <jonathan@marek.ca>,
        Jordan Crouse
 <jordan@cosmicpenguin.net>,
        Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        Joerg Roedel <joro@8bytes.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Connor Abbott <cwabbott0@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
        devicetree@vger.kernel.org
References: <20251114-kaana-gpu-support-v3-0-92300c7ec8ff@oss.qualcomm.com>
 <20251114-kaana-gpu-support-v3-17-92300c7ec8ff@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251114-kaana-gpu-support-v3-17-92300c7ec8ff@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=F7Vat6hN c=1 sm=1 tr=0 ts=691b2bf0 cx=c_pps
 a=DUEm7b3gzWu7BqY5nP7+9g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=KNdfcIBsQoTh3yukQZwA:9
 a=QEXdDO2ut3YA:10 a=-aSRE8QhW-JAV6biHavz:22
X-Proofpoint-GUID: c3Xy1a1ibnCK6Y2fXMk0Wv-Q1jCIyYVf
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE3MDEyMCBTYWx0ZWRfX4e2Si0pNYsJc
 F/Xn9hC7ZmnFqSMmH00BaO1c7c5DDpA2xAZMkRJghhPOp4qq3OvTpm/+KVBWQ//ifLGHqBqCbp/
 Daox3aRPfApTmOP4eU09VEr+4I1Cxapzpemk59dbrVsvdDFiINP8BeQ33OpTmPiEHOC/P/oAtoy
 UCO/vdpr6sH2hmhIvb+9YewW2A6zb8b3K+4lNdTwFnWRLGomIe/xIgLJFblSegHmoXB9Rc/DnO2
 AXVq59G6L6xmZO0p/ZParFSfE26xU0V1eHzAtdlijnlCYWkNlshCPObiKgUPtAFlFHEO7uupLiw
 DuN3CtI/kGNWOI+jQ01gdDAKANlSISDr/JErZqDSbFe7G9srEXoobmg6ztyjtKtJ1jXrM37iYEw
 S/RbYriO+hBhhHCVmuFWs2AbZY2uwg==
X-Proofpoint-ORIG-GUID: c3Xy1a1ibnCK6Y2fXMk0Wv-Q1jCIyYVf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-17_03,2025-11-13_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 spamscore=0 bulkscore=0 adultscore=0
 lowpriorityscore=0 phishscore=0 suspectscore=0 malwarescore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511170120
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251117_060641_438938_84F3AAC2 
X-CRM114-Status: GOOD (  14.29  )
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

On 11/14/25 12:29 AM, Akhil P Oommen wrote:
> Adreno X2-85 GPU is found in the next generation of Qualcomm's compute
> series chipset called Snapdragon X2 Elite (a.k.a Glymur). It is based
> on the new A8x slice architecture and features up to 4 slices. Due to
> the wider 12 channel DDR support, there is higher DDR bandwidth available
> than previous generation to improve performance.
> 
> Add a new entry in the catalog along with the necessary register
> configurations to enable support for it.
> 
> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

