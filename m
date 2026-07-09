Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71EF3C43458
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Jul 2026 19:39:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lXtkLmMeqA5Txfu3sYVMsQEq969mvFVnJZMw0O2S5F4=; b=BYTB0Iiszca6GMecDh2tUafF2Y
	pIWHh6fAfGEHsm9vMFd5WcmIbKSQSY5oii76pToHIK8K+wVydcmsdofHoPXW4VBNkAWmbTl4SxKYM
	6bRidPwFgX794wOUICwScWx8GuRQcR2GKWf1OMd+p9muaXOR5HPo00LGa8RE/SwEMgbcwIr3oBOTR
	232Ry+2c5bB+KuAKrN83C6COqo12LzMvFKS3kKKt3kYk3d5seNv1iPVw4YL62RbrOR126cv2czQ3Z
	Qohtie8m/kuZ1aBipZy0ePlMrJiG5yKxNfMW0TocpoIv3roy1dfrdQJvNjJyT1N/CqmLPN4YjQzwI
	SdliO4MA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whuaU-00000003Ua1-37Z1;
	Thu, 09 Jul 2026 19:39:10 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whuaS-00000003UZY-0Riy
	for linux-arm-kernel@lists.infradead.org;
	Thu, 09 Jul 2026 19:39:09 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 669HX44b2374349
	for <linux-arm-kernel@lists.infradead.org>; Thu, 9 Jul 2026 19:39:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=lXtkLmMeqA5Txfu3sYVMsQEq
	969mvFVnJZMw0O2S5F4=; b=f51JX49FycsxSY94vb3shNav9rc4rU9buD/v8EbY
	gVT3Lzsu85teQtDP4CIdy4rdzXRUPg42PS7hEJP4b0FsK6YCzMl1q46AneSH5TZh
	KiTZVG/rQcrE/J44s0nXXL/PfqyCp9d9o8YRwns0vDcsmgnm0IaLH+DDznbFgCyr
	iU3M7WhK1e4+S6M6odp6pB0/bZCh0rGdAAEyA+rajwDiFSXUBTR/F8zsUQ4fyqgN
	Xd57d61SwMw2Xn/A3UrfTytP5EsFkWf1198r7R2i86Y97z6boIBCgQdzRf1jWfwY
	h3EwAl+O3tTATUnjedMXV0VdoK2YMibTyYBQkNrldiFmFQ==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com [209.85.217.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4faeg5h4rx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 09 Jul 2026 19:39:07 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id ada2fe7eead31-744e7c40512so41359137.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 09 Jul 2026 12:39:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783625946; x=1784230746; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=lXtkLmMeqA5Txfu3sYVMsQEq969mvFVnJZMw0O2S5F4=;
        b=WZwG8tZUkHmhETNZLMGgXNRAWvAWUUugvt3o2+VcDQdOg0lHgqf01ZayQMg496WuY4
         sPZFMd1oXiSdxzBUe0TugUSY97GXC1UAcjeYPgaayRD6RiErM7J7wvNrxfO3fOGfVdJX
         Cxw63nFGpAM4ENPgaTzolkFIo/mEU3V9ZZDY6kjojYryv35k2UT0Q0S/pC/mQfJQRctc
         0TZ/5JRzW+EmxaBAcwDdBvleq0YG6Z8QVqR55RRWRu3tWbABAzLh8t0X0twQ/ILjC6xS
         4BOl4DGHHLnSu0aEaYXY1fePLpCL/ZYRbFxu8KEl4KpsXkEJlqkaEmTDpQIw90T9h6o6
         s4Mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783625946; x=1784230746;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lXtkLmMeqA5Txfu3sYVMsQEq969mvFVnJZMw0O2S5F4=;
        b=K5uAqn/xIWV2PAqgE4J0LCeBsqc1ipBRk08qCy4wnp75U4YpJTyMZTFdWYodRNqi0D
         g4ca8ahdqdhW1HwTqvd6/wWDmUsYQpT5jTEWDpE469YDZDLMcWqbgki/SNxHV8AF5IA5
         dJVs1AhCNeLtwr5vZJgegHjfABZtlM+ktjDBgSoGd4zjLy2YW7ZFP2H9MSlImQBxsDyK
         Y5DQ4IRGKnV5xZEPyr6g1mogfWIlEAVQQeGskCOZ/V+/ZjR4iRbU8qlxqeaQHp1x/rUT
         VbR8RgySsIieTW1x82z3LaLKmRyYElyCh9jiAJ7LQEXgV7qX+wQE8sGrGSPXae7z4rI+
         935w==
X-Forwarded-Encrypted: i=1; AHgh+RrZcIS5x3j9WnjwJHF5YLIKHAUP6z12+A1LNDdOgUak6zS+wr0S9Tm8BekDkzNw2xw415VXBJ5IFuPTGdA8q+zc@lists.infradead.org
X-Gm-Message-State: AOJu0Yzu9WqQ5R+7FaBMZduKE8h/iRPmcTOGZPR851ji+lvEvhAAR93Y
	Jy/W6GCLYewhgb0FfbsxctRHqxJbUSgmvdA3GDriRgxk2fNhcJOwqCs+M54CotcRbLCC+iejh7f
	RkjrnnMzTvfUAfeuNakY4g8zlpMqV6esW2VeXDVKeKUpEQdrDsr2/YdRXDWSK/PjwkuwsJcH8z0
	TCDA==
X-Gm-Gg: AfdE7cmQq7VvjkAemxzRzJmFWeVCe/LA019Z7sBZL69fuphCIfytilP8NtNzBkywYAJ
	Sh1k0EL42yiNHHffJsI7fR+3dB/aVQ+/7U9aCysr8pFwcBkiigxZqjjOs7Nc4bkGgaRkizVdV7n
	zypbLBfnOAM4dFRDi9NG3SVBVdTuDkGbBpUkHNI9gLDrf0vjtvGlB1+aNN1SE6Xg/E1DoE5Bo2P
	df2V5nD8RaG0W5cS0Z9lhDLxBLeHas/9adOg/yDObJi7T1WufgpablngQcvJyQuiiBDMBxec/nE
	iVxFDLN6ZaXm3mms4LXD/UHZdsgAZGkIwHr6IMad9k7UFLBo32W1VKb1cNS9yqc6pAQ2oQNJpty
	DVn9rwbBWIS0fW6FxSvhrG+v4s7/LZyZeK+gDCEEL3d5Q1HXyuRo1Lv0YbOHSs/3tf9tO7/1ZHo
	D2ks5vtvd8GVUgq+G/epOju2F/
X-Received: by 2002:a05:6102:1490:b0:631:af51:7d8e with SMTP id ada2fe7eead31-744e00d15demr5013504137.17.1783625946397;
        Thu, 09 Jul 2026 12:39:06 -0700 (PDT)
X-Received: by 2002:a05:6102:1490:b0:631:af51:7d8e with SMTP id ada2fe7eead31-744e00d15demr5013479137.17.1783625945914;
        Thu, 09 Jul 2026 12:39:05 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-39c84b13407sm5148981fa.12.2026.07.09.12.39.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jul 2026 12:39:03 -0700 (PDT)
Date: Thu, 9 Jul 2026 22:39:01 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Cc: Anna Maniscalco <anna.maniscalco2000@gmail.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        Joerg Roedel <joro@8bytes.org>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, iommu@lists.linux.dev,
        linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org
Subject: Re: [PATCH RFC 03/13] drm/msm: look for lpac from dts
Message-ID: <wtun2cfukyzxlsfiz2izsejd33k4jpapwqa3uqih5drcsrkff5@e6llkke5dayw>
References: <20260705-descriptive-name-lpac-upstream-v1-0-01d50c3e0c99@gmail.com>
 <20260705-descriptive-name-lpac-upstream-v1-3-01d50c3e0c99@gmail.com>
 <rwohvfbsw2brpxrfg26egu5arwe6g7n2etelo33eegmu5cz65k@3syofuxzsjrc>
 <dc5aef2e-600e-4e97-b76b-dcc8bd72c709@gmail.com>
 <m4vwrqt6yyaawpvkyrqfzs3kbipbhygmtrhphuthl2gmjvkgyt@u2d3dnvl2phy>
 <54cb37bb-aaa5-4c5d-a563-acca4822dd35@oss.qualcomm.com>
 <t5gu6ciwmxdb2jghc44gtixdsbedkgy4yzke5sgawjrr2h362u@ahvhh3yfe6lx>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <t5gu6ciwmxdb2jghc44gtixdsbedkgy4yzke5sgawjrr2h362u@ahvhh3yfe6lx>
X-Authority-Analysis: v=2.4 cv=FN8rAeos c=1 sm=1 tr=0 ts=6a4ff8db cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=VwQbUJbxAAAA:8
 a=9jRdOu3wAAAA:8 a=KUW68C9JwZgBSL_lDhwA:9 a=CjuIK1q_8ugA:10
 a=gYDTvv6II1OnSo0itH1n:22 a=ZE6KLimJVUuLrTuGpvhn:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA5MDE5NSBTYWx0ZWRfX+4Qjj3Qu5mxD
 rBDCiZ2nhuszSUAgPXo/sV9QsZRm0ljVGu9TKbILt89ZAgzbqXmwW2NxPvgvEvsJuf6hEd7YsLQ
 hgj16mtpuCCPcijtzKoLc/Yq/iMLm8s=
X-Proofpoint-ORIG-GUID: 9hLAmYbMVmtpLs_gVD8VMlfWWRdLnNzr
X-Proofpoint-GUID: 9hLAmYbMVmtpLs_gVD8VMlfWWRdLnNzr
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA5MDE5NSBTYWx0ZWRfX/iZu5+iXtZZ3
 CogcsZ2KZ1GohNgXr6fKFvKGDYD7Z3J1JoiW3WEXT4l1F2h1/wwqQEqsnwJswHWFek/ShQVx476
 qajfCvMgdXeDF/TP+4T1GXu9OMIdHykyAmD5/akragGAWy6imcXHFNUqjNNXAIZ2FZNFLGeq6oa
 JOTq4ARg6XWMdtmYl8/Ha19/zHH2lxanR3doYj5j6h306ss/RIuRXdb/6OBdpbm6VuKFnvYs0MU
 QufaawOfe2gJiXFStOgIc7mG55uKl1rgstxUfGov+nljOpypnNrR8IIGI+CDVZ5xARwsHwCI4Pa
 TiiFxX9Vvdm9C08vyhKoPuxV8z5V4qoSdWGbgj8fAgVykQqolbw8Pbus2Dmmhwz53wMm0lHBpSr
 WTZ0cpyCVzTx256EJRxgKE8UnlS5WDC7azUd4eiVFPige4PsvXyI1RosKtIykBSmssIKtUImWaN
 +neEpQdDQJrO9pQ9EFQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-09_04,2026-07-09_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 suspectscore=0 phishscore=0 clxscore=1015 impostorscore=0
 spamscore=0 priorityscore=1501 lowpriorityscore=0 adultscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607090195
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260709_123908_147760_5AA0C5AE 
X-CRM114-Status: GOOD (  36.01  )
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

On Thu, Jul 09, 2026 at 05:54:23PM +0300, Dmitry Baryshkov wrote:
> On Thu, Jul 09, 2026 at 07:12:39PM +0530, Akhil P Oommen wrote:
> > On 7/7/2026 10:09 PM, Dmitry Baryshkov wrote:
> > > On Tue, Jul 07, 2026 at 05:02:43PM +0200, Anna Maniscalco wrote:
> > >> On 7/6/26 5:04 PM, Dmitry Baryshkov wrote:
> > >>> On Sun, Jul 05, 2026 at 09:13:37PM +0200, Anna Maniscalco wrote:
> > >>>> In order to associate the SID used by LPAC to it's own domain and
> > >>>> context bank we need a separate node on the DTS.
> > >>> Can we use iommu-map instead of adding a new device using the same
> > >>> addresses? You provide zero explanations, but it seems like you are
> > >>> trying to separate a part of the GPU into a separate device, but it's
> > >>> unnecessary.
> > >>
> > >> What I was trying to say is that we need to map sid0 and sid1 to different
> > >> context banks.
> > >>
> > >> From what I recall, so long as we use the same dt node, the iommu drivert
> > >> provides no way of doing this.
> > >>
> > >> What kgsl does is having a node for the iommu and then subnodes for gfx lpac
> > >> and secure.
> > >>
> > >> The address on the lpac device doesn't really matter. I have very limted
> > >> knowledge of DTSs but I think we could just leave it out altogether?
> > > 
> > > I think, you were poined to the Glymur Iris patches. Another option is
> > > the QDA driver being submitted too. Both ot them use iommu-map to
> > > describe the same usecase - a set of SIDs which are used by the device
> > > but which should not be a part of the defaut set. With it in place you
> > > don't need to have separate qcom,lpac devices, no additional properties,
> > > etc. 
> > > 
> > > I'd recommend following the same approach.
> > 
> > iiuc, the conclusion in this recent thread is to use child nodes for a
> > similar case:
> > https://lore.kernel.org/all/20260618151745.GD231643@ziepe.ca/
> 
> Let me check internally.

After a brief discussion: it can be either, depending on what suites
better (and if you can persuade DMA / IOMMU maintainers to let one extra
bus or not).

-- 
With best wishes
Dmitry

