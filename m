Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46075C43602
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  6 Jul 2026 21:31:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fzDGxXLJjspm8ID6JkaqhKtTkAtG0hD6KCQrkPkv4FQ=; b=Ly+MX9jabwRxBIddpQOO9H1B7f
	wL1lD3Lh3ZyyUXWbB66j7SPPZbus975AoREtbasoL+Tip2r3+lT3f01JF1chHxhOugy035JVAzum5
	Fx8/BD/jshMyjA4PPHsEo94lMtgBwRzY1+i1VueSurGaGXezgDIXY6QX4Z7L7vKi7inSKShwsekXq
	F7oDYubV79z/sIt3cKdHY7mPtemvZyDfzpYOKsIrIxz8THrW4R0TK39/rd/htdz6ypr5dGp+n7sMV
	hz33t622Y14L6FjHutm9WvvDqiiFp3C+b4J0rNXfTHbH2iCAag7yVR5Ykpf6hkPyv/MunMLxdQ8ib
	lrIU4GAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgqug-0000000Ddg4-3PyV;
	Mon, 06 Jul 2026 21:31:38 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgque-0000000DdfR-4BYv
	for linux-arm-kernel@lists.infradead.org;
	Mon, 06 Jul 2026 21:31:38 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 666KEV911429267
	for <linux-arm-kernel@lists.infradead.org>; Mon, 6 Jul 2026 21:31:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=fzDGxXLJjspm8ID6JkaqhKtT
	kAtG0hD6KCQrkPkv4FQ=; b=g9xRteVhP5gefYbx3ff3+GVHkD5/NtiD8aFuBMmo
	LEvcsBjk7gLxGiEeBkNwuOxiiOUkedrQgK/jNGCTT8Qx/jKdOvE7Xb3acU3YafMq
	bJWF4WqKDd9ZtgDi9VlLEp/JtlO0xxZskJUD61UsCA/LzCawqqyrJbadehamQfhO
	ACULbQGHjRHrqnuIUhZjcPAn6C3bZZwwXQCINsSe7FIGkS92zjGhusCelovk8Yxm
	fGKCjq7+om8sGd39x9soMcEnV8RwKpjCysdN/UAlBLVv99omvKFvpQ6DkdoW8d43
	+nMvnk6KMg++WBqdAd0X+NpH4jWzhYoHiEJoJEmv/z0B4w==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com [209.85.217.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f87rxum5x-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 06 Jul 2026 21:31:36 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id ada2fe7eead31-73883529f3eso3252173137.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 06 Jul 2026 14:31:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783373495; x=1783978295; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=fzDGxXLJjspm8ID6JkaqhKtTkAtG0hD6KCQrkPkv4FQ=;
        b=IKP47V7/TD/EHmdUevBNhN/VQsrtCRaFjfNU49G73yfBIEEqulCfiVJxQpVMQX8rhI
         rU3XYuNMXxJs1jm5APD0eKC6YJ1+rEivuabmoQEBnUWA1vZwfdUyXUr+tGsZIcyKIqiO
         Ku9vIQqPDHDNcOsAgAZWYDHxj/UqFq3Hkt13lqlMTgSoxp9P0FuYJZOAIF/7Kk2sjoJf
         R3QZxTW/uZBNwGGrJZoUNhrcnyYC4+o27rqBfCM3m1BWFYQyRsxBhF+v1WyPRzD6RDK7
         IPK1J4v90wkl55caM1XS8cKnzgAxbQVi45BicNyz1ffx1pegqJ+QetaUWNrqv/pcRD89
         bzDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783373495; x=1783978295;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fzDGxXLJjspm8ID6JkaqhKtTkAtG0hD6KCQrkPkv4FQ=;
        b=QJAkYcvDvVveV26U56hxTKDpmJj0BL+spOuLqLMaoKWAsYtgdiY1WK+yoVm6gwkYbu
         CMgPzAIKU526X5eJiQDFCcl9Jeq553S7sP/huNU+pYjmN1jKIltM2nQ4l4DlspJEt/jN
         wNeJI0tcHIDBWaBHjkXwb4LzHdyj6CIpepu+e/xCvqkEwJ1tCL4+U23+EbIkH67vMovn
         o5SAUMkKHaM8BSuB3F+SQCudwONbCozMS64ZQROzCmhMqPCvF55cy4mVTtmZca6papE2
         xT3As8A8n+Kt2W7+6uOcrSljK4ml+2ICqpXEEnE+cv9wfouu8JsIIyDtnzP7KBbUM65l
         lGlw==
X-Forwarded-Encrypted: i=1; AHgh+Rp2ligpb6x/bX0Q7HnijeFWbQpyZKTZre0Qgpqd8P6VtgZ/b7Hme5Obgcp1H0zPsyMnHHLMNV05alK9LmCClrRR@lists.infradead.org
X-Gm-Message-State: AOJu0Yw1DuxQtwjmAm+uIa0O7X71xfDcn42vNToTyopdCQ9Kst/7IV2H
	4dzW2Bh8VFE9nF5zL6KLrtjQTiY8fQzp5uoQXCFNu1YFjoD1u1PGcElhyslDjL/G5LuI9C2cwbA
	Di9TGO+WEw/mLUQarqQIa5k2EsJok8nabEMams3VrpaBRKMZCJygK1sjv3C8v39AGNho21lGrSM
	BXfA==
X-Gm-Gg: AfdE7clDNoB2zSQ3I2Q+LtZhqPuEMAuBdzMCHSwLhLgyiXZPovX1M0N3IFYb+JdJDE0
	LoAqRXhlfnbpB9eab73IzOj7ra8xRwf/9ABVHnM0HiWtucZ/RkmUi65FWXK6LeGRyUdRZpiWnXO
	XUl+/7okbpYganeRDZKbcuMYIX4qbK+Zsg5XbLfzMiOMxijl3+W/4pg+Cy4h9LEmB3a4NyYr+1f
	B85daqYGMb5eP7h+/+BxZAqeeBrNzDagtuqLSFfvH1ELL/VWqWKwvGX+CB1BGTOGsok2ggiF9Jg
	onVCEfRYBZ1wB84FDmV1cCVUgOfVrbCaXYcPlJLw2NvH1cNkLMOh3zr17wdkQSpXZWJGk6yq+tX
	pIrpIsRUHiYzXnmsMqDcyIPdxxCJgK46XuxS6n7lwjRqPsAqgUqGgy5l0+nQU8l3nS1DAYV2v6q
	xplnQ2dX6NcWJTEJgboZSQFWQ0
X-Received: by 2002:a05:6102:598c:b0:744:a3fd:410a with SMTP id ada2fe7eead31-744b7d6e301mr1166755137.14.1783373495243;
        Mon, 06 Jul 2026 14:31:35 -0700 (PDT)
X-Received: by 2002:a05:6102:598c:b0:744:a3fd:410a with SMTP id ada2fe7eead31-744b7d6e301mr1166733137.14.1783373494851;
        Mon, 06 Jul 2026 14:31:34 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aed13bb868sm3149884e87.47.2026.07.06.14.31.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 14:31:32 -0700 (PDT)
Date: Tue, 7 Jul 2026 00:31:29 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Cc: Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        Joerg Roedel <joro@8bytes.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Sean Paul <sean@poorly.run>, linux-arm-kernel@lists.infradead.org,
        iommu@lists.linux.dev, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Subject: Re: [PATCH v2 4/8] arm64: dts: qcom: kaanapali: Add QFPROM node
Message-ID: <w3cid5vezrofchq7nagu5pzasicagrzj432j3l4rt3ebc3slqw@gvtvxbkkplet>
References: <20260705-kaana-gpu-dt-v2-0-6ac53de56314@oss.qualcomm.com>
 <20260705-kaana-gpu-dt-v2-4-6ac53de56314@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260705-kaana-gpu-dt-v2-4-6ac53de56314@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: H0VB4l9NlhpmmHSsVz_9_GCvesLRL1mn
X-Authority-Analysis: v=2.4 cv=Hv1G3UTS c=1 sm=1 tr=0 ts=6a4c1eb8 cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=UQAiW8fk4jwks4S4FoYA:9 a=CjuIK1q_8ugA:10 a=gYDTvv6II1OnSo0itH1n:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA2MDIxNyBTYWx0ZWRfX2Iz3B11Hdf6F
 khefNms/2Cunzv5Uow3WXXRS/lMgZ3JDdD/4UDsU52kyPBHLwoSCm3H54s+OZu2EkQxODK1sOuu
 eGi0b0EzsC2v3hvoSf02FB2AFSrftQU=
X-Proofpoint-GUID: H0VB4l9NlhpmmHSsVz_9_GCvesLRL1mn
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA2MDIxNyBTYWx0ZWRfXyiTb/hMTED4T
 H2f2ntJIuWWspteVziRlIhrdEkt0stoiN/nIzxmjgTplcAbwCIh05Pq9zWoPjzEZj6WH78rBX2p
 WtMBPxC+rvugR2//KmGwc+c1YjOVy3tzKDO4j6R8RlkbY9iE809d6LtSMwumyAd14a4WhYoow5Y
 bx1HhXHBsxKNmjRCXomk7JhWeOtydRXZG5PbR9v7jpLsGwln4sbL9ycLWjSNHtoC4mFR6omk3vL
 /KAoka5ra8dXdp8gdtDWrxbeTX7tPA926YCFx91Jm5u/KreKHd4CfPhlPXkowuYoSYJ/Pi8dgiW
 Ma5VU2FYYTYUeBfE5vzgwrWv14+oamGxS+jLMkZWYtIT8vDukSpq0XTLmK11liB94uK+ZULt5HH
 HwUET0PPGxtPVi1ufJkZNY2Qem6DtGneWTsvQjT9Wzzq6yP/mdYDifJ1ywT2sDp/Zc0ePLRfvZu
 aa1dS4W2CTTWG1wulaw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-06_03,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 malwarescore=0 adultscore=0 priorityscore=1501
 spamscore=0 bulkscore=0 clxscore=1015 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607060217
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260706_143137_042820_80E71C3A 
X-CRM114-Status: GOOD (  14.70  )
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

On Sun, Jul 05, 2026 at 01:30:08PM +0530, Akhil P Oommen wrote:
> From: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
> 
> Add the QFPROM node and GPU related subnodes on Kaanapali SoC.
> 
> Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/kaanapali.dtsi | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

