Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C33EDC43458
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 28 Jun 2026 23:51:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qaaIg3gvt+W7J5Dpnsp8EdV5SRcVyaxwovZUztMqYmM=; b=4o3VykILb7qzmeaz45fe7jDKTP
	/W2J+Edc/fLfK/8S/W6uO4xGg2kEeczXOS9qMvNLHMW7uyrIsfOVbaYhKV/Y2ro55qx2SbmIaDIqX
	qz0qOcrHdd5ZNTl8yZt/AxengBKvmCc2Y5SNuly5XuaBMz1yGkb9NqQMm2xst3FCnvdCMuxqFOB7C
	pqoSBET94uj2xv1M9NVzphKHQNGwtdsYJfM5BpxzZbQzG5rDq2gKUuNIRsrDiRIgIsxyLXqFyd2Qk
	n/Ji0W5VZfQR325/0VWrRyiTRAwd7tUMjbxAm174+yC/egez/noMyMQCThxPsr8881x4o5M2t1N42
	WvRNJRZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wdyO7-0000000DT0M-43x4;
	Sun, 28 Jun 2026 22:54:07 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wdyO6-0000000DSzS-0hJx
	for linux-arm-kernel@lists.infradead.org;
	Sun, 28 Jun 2026 22:54:07 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65SM906W982647
	for <linux-arm-kernel@lists.infradead.org>; Sun, 28 Jun 2026 22:54:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=qaaIg3gvt+W7J5Dpnsp8EdV5
	SRcVyaxwovZUztMqYmM=; b=IVTj4Z6w48vDnABsrjEnb363TqfizJ+SNkX0KG6E
	XLKlk2hyKGozaj8SZ3OT0/Nenbli2kQMw7PIRzIyG2Wybv3CEC3TpRtig0023lvM
	wvTCfKvokAjF8rIxyx1ULFNUmunw2mDYeZuYqP/hNDXkoEV/LvkpJddGPGzWn5wS
	U+LAqFEgwMks/TqoY/12WvTSGaXSJGUiN8HMyMzqllue4V37eDb4BeHCdasWgyyi
	zxdvWOuW/HN1RbGkOm2maJ83M38RCA+66D7NTZ3NUPrQymz70Ue6BVw/4b3TnYuv
	9qPGRYUNyXM5WfZT/I0R50loFRbaf6sk6PGWZxxDyGYnTQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f26tukpjc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Sun, 28 Jun 2026 22:54:05 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-92d1cae5740so104430285a.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 28 Jun 2026 15:54:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782687244; x=1783292044; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=qaaIg3gvt+W7J5Dpnsp8EdV5SRcVyaxwovZUztMqYmM=;
        b=YMFk0yz7MM9aJ/Hywq5LQ35ymkLB6/j3+vryjdCtXWQwv+RKoeODC5L4whUKkx1AXi
         XYlZHMk85f/PsHPlMI1zIfOcocE93FPm7PnpAlXZEu5buBz/rHM0aZu9oM7I7ZAWPU+M
         eGbrc3qsw7yAvuS1vdLOQtw0K9Z2jccZewG5k5yUXDzMuPYsCeq8QLoOMTSQxv47Tv4v
         A2zc8Na8bLi6tayfQ9pzKWtPNpIJZ1wbJxcWdhX/kSFZD5Jow4vwddJTVAi1VQotyNEl
         1kVdqtosGaDY+F8DZihqkxOWgtKZaj5JZS/s1c15wWUvQU/0eb5ah8eHzyPb3gwZCkme
         SBRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782687244; x=1783292044;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qaaIg3gvt+W7J5Dpnsp8EdV5SRcVyaxwovZUztMqYmM=;
        b=j5PZuqy2jCCkKRUbyUW1sip7d1dLlTGAWbBAR1qiq37PqgYW101sFlnLxWRufx09h7
         s7AB2LL/8mS3yNf9TRyvzkIF0l6KEMjfO7YerAPnCjUbrWBd8L/dg4xVMO6r+t5wSy7E
         TsVIVQsE/zZ8VOOFMoTHr4PXw4Qzsx/IhbEL5hoLskHOrkmNQNiq4W5Abwl5RA2DwI5n
         AqTwrA0op05TC6RW/qgwwmmxt6Kt/lg1lnWArQh572f4pUwBlx2idBmeKIVe4e5HIwAj
         cS+6CDQeYBwJtMSz292D9jhR+UJE3KTwgSdjFE5Qr6FWH5C3VJPU/SsLEvBFJL9Jvnmi
         vEhQ==
X-Forwarded-Encrypted: i=1; AFNElJ9F12LGuhg3jcdhOk8dzDcqTfWX/j4kw7UcLyNgpEE7rZtSDdXArcCuwo3FfazQf44MB83m6RZnzImR0NV45lSs@lists.infradead.org
X-Gm-Message-State: AOJu0YxHeQXVmJ9m5MN62u3km3hnH6Luyfn3TCPKZD48UIv3Vt0KixzL
	qJiia5TUtPZTSikWjJquZaM5T5ZtEIXxIhfZ/4x3v21Be7Yd3NGk7yIiVGsCL+krGy9pdBrSRuw
	haEWXvZnJNJxHt1VBB10l5AwcW2v3UD4i3MTTWsYOBxKhvW6eM60zAepW875D7espeB53Ve3x4q
	/jsWJIpgnnIA==
X-Gm-Gg: AfdE7clc273QYClqpm5qNVtCf4fNs1VZRrjOB8uCtEdYqUMPO/NJTSDxcd3Gz0TB1Cn
	cqG+NGolxOpx51khNOU2hPwLNMBEVe3OHNi2L0LDCiUw0WLFfd0kkMpzp0W5Z89rFxE2PCHRCEY
	vDitJdH09qhtg5PYln6zRpMJe9fuMWI1WrPMiJmWGbv3WHNmd9Z326BtrStoKSnelMj7JdaUmGR
	CKkJ23RM4XBuUU57vLsRNlQpyYk2Kh/+/lZwNhWwh6i0vgfOPt2VhOz3qAw9tBOW5PpJlSgcpFO
	qoekZcgO0e4gGelxN7MXaTfSblTV80qXVbzH8CnxFTKbguxv4QyTSSJn/0WLPdi5/DrOdwQWP9x
	hpuVd0Z9HbDwFlu3iVD7gsbUV5Tr+h6P4UYb1b2RgTl1CUM01opYks9Y2SbzEiZr1ALPgyGNa70
	HohLUTWw4k/VETewwRxmegZV9/
X-Received: by 2002:a05:620a:414c:b0:92e:51ee:7945 with SMTP id af79cd13be357-92e51ee8ae6mr177014285a.30.1782687244492;
        Sun, 28 Jun 2026 15:54:04 -0700 (PDT)
X-Received: by 2002:a05:620a:414c:b0:92e:51ee:7945 with SMTP id af79cd13be357-92e51ee8ae6mr177010785a.30.1782687243961;
        Sun, 28 Jun 2026 15:54:03 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5ad69585b6bsm5327111e87.80.2026.06.28.15.54.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Jun 2026 15:54:01 -0700 (PDT)
Date: Mon, 29 Jun 2026 01:53:58 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
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
        Bjorn Andersson <andersson@kernel.org>,
        Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        iommu@lists.linux.dev, Aditya Sherawat <asherawa@qti.qualcomm.com>
Subject: Re: [PATCH v3 8/8] arm64: dts: qcom: shikra-iqs-evk: Enable A704 GPU
Message-ID: <kz5fw4hqblmumabhooyupyxqmfwadkas57brxs2qxvnbn37v6r@jjrmk5ckqbc7>
References: <20260628-shikra-gpu-v3-0-9b28a3b167e1@oss.qualcomm.com>
 <20260628-shikra-gpu-v3-8-9b28a3b167e1@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260628-shikra-gpu-v3-8-9b28a3b167e1@oss.qualcomm.com>
X-Proofpoint-GUID: ioR1xkPJLtoo1aS7Zicy5fGxjH5TFZgT
X-Authority-Analysis: v=2.4 cv=A8Rc+aWG c=1 sm=1 tr=0 ts=6a41a60d cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=UQAiW8fk4jwks4S4FoYA:9 a=CjuIK1q_8ugA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-ORIG-GUID: ioR1xkPJLtoo1aS7Zicy5fGxjH5TFZgT
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI4MDIwNyBTYWx0ZWRfXwB9q449L8CEa
 F5f6ey72WnThIMAYM6+AG3O7xU0Q+HUT2e7o5OGQHxeYtHu/Fm6jYIZqb+cW0FO0SaBKRJxH1zo
 +p13tSZvofddctc2nZKmv5rCKX55lU3fG+v8i3LI5jgI2hd0Qwo6lWcxoaW53wPV6fJ+ZgM02G1
 0IDjDApBNCucoWs5EKUtBPmlV88abPQ2cI6DRj4dDtFFssv9+JRczJREm81TVPsWoVngsKb9kWe
 pHl+ZsB+18oJr1NO1IQyu/t/rhK1Qwww0LJf60ZzLSJ2TepakCZKJoDVQhnL2T3oDpz0Ue0gnhX
 Z1OVgMqi07IGvAvmc569jQTSzCs2kGVERVA0y+QlHv5Kj4/cCTda+61bfG0pebG072Px9OR5lnT
 DR5/7V0EVW9YhuvvFJ0Z8QgMKGbfo3S/LYxm/ys5ZTbpXQSFNT87d5RWe9gk/J/FaLzw7SrtXyP
 8np2Yexee8IPI0u0MSw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI4MDIwNyBTYWx0ZWRfX6cMF6ysJJ42u
 qtfdwz5/bWYIWm+QoC8UverE0bhBXQGI7YZCCWUe9yoKRlgcQo0d2TqaQK3W/xQepOarc/sGpbn
 imAcDuaPELmZAIJA/XDVtjb4crhzndQ=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-28_06,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 clxscore=1015 impostorscore=0 priorityscore=1501
 suspectscore=0 malwarescore=0 phishscore=0 spamscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606280207
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260628_155406_210585_A343C1B0 
X-CRM114-Status: GOOD (  14.25  )
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

On Sun, Jun 28, 2026 at 11:54:01PM +0530, Akhil P Oommen wrote:
> From: Aditya Sherawat <asherawa@qti.qualcomm.com>
> 
> Enable the A704 GPU and configure its zap-shader firmware on the
> Shikra IQS EVK board.
> 
> Signed-off-by: Aditya Sherawat <asherawa@qti.qualcomm.com>
> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/shikra-iqs-evk.dts | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

