Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94D71C43602
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  6 Jul 2026 15:00:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bn9/G/DyutefUg00Snqy1zzU39NkJvMT4AS5q8icaWo=; b=2Z1ODXg62E8O1So0PRgFy2tHLi
	Fo7BRc+1wlVy1Y7KpQzM4xkjosX9tVPrZQve3A4Xc2gLTl57o2VxdLgf8JlYchH8b8KzFj9uNOamH
	G9EwjnqWpwidXi9VRIiTSgzT+PtAUJUMlY7btPdZQy3wJoSWxpl2EWlRDT27pH6Rwtt7CZjsNXIM9
	HsRpaJcnWUYOQk8iqqaYT/PUBKvBZqgl750s6LY0Ncn2pmHp/z9ROsq7GkimcLPOx9FVrL7GbcH/N
	/dZQgOVYKRi44bk7T6nmCfypaE3sKO73JoNmO5jYvc80O+NO76wfeltwy4ekV9tj/p5WM/pT9qLEt
	4z8dZfFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgkoO-0000000CpC9-06B1;
	Mon, 06 Jul 2026 15:00:44 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgkoM-0000000CpBm-2THS
	for linux-arm-kernel@lists.infradead.org;
	Mon, 06 Jul 2026 15:00:43 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 666EEKJE680950
	for <linux-arm-kernel@lists.infradead.org>; Mon, 6 Jul 2026 15:00:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=bn9/G/DyutefUg00Snqy1zzU
	39NkJvMT4AS5q8icaWo=; b=IF/ut3ahI8X40Wfyw7vMydD/20TuCbIZ19Z/0afh
	KTEahq8IFTkDK9tb76zcwC0Q9wNWvlKTH43UBxpNFSa/Q4XjVBXMEK7dcrVQhle3
	4FHEE50mrQk5Vo3uszoyFv9/vb0qHu75pm+FycOu6SSkqLMmDq2PGd4AyrBxHklE
	GVS30PqdnWrDeuyMbWZ7a9c8/QrIa6G8QZRy7CMcZ1jeG5X/3LTGoIcwZhlrbFB0
	7kEjJ3pdpmlUl/sXrkEQ4XshqJ3P0iBcJCnGnNRJr0d/qAnLzJatdHXrNBgoo3J2
	pt8CzE8jBlwn08YYTIQWXp9vHfE+KP7tp9sgX5A4gAX8ow==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com [209.85.217.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f88t89nsx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 06 Jul 2026 15:00:41 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-738d9935e23so395475137.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 06 Jul 2026 08:00:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783350041; x=1783954841; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=bn9/G/DyutefUg00Snqy1zzU39NkJvMT4AS5q8icaWo=;
        b=Tf/iO/eehK5lBJS/IJc2HiOS0icj0z06482Er6780Dw2FGF9RaoxlW+G1eIJixk+uQ
         p7RHz5SzLC++XZKbTJCiQ3lmbicLzQK2XIe5KTl9Ub9eQXXrwJOyodbDPG3ifMdwl0ho
         v5a9f71U0bXbU9+WDVsWI8hpWFqXg8rWDLuQl6EOxgsp7dGkswhaCBPY1bSPtByj3CD3
         /tC9YRRj12Ngfgx4SAUqCWLx/xVt1OGUglQh+9eP01ro5QPlcKTkjWUZ73iWbPfve4K7
         bvkQVJRuSESLN47e8uDLf/UF83pMP3CW0K3FfQVyBsIcC2Y6BIWaEAD4awSih+NGZkbn
         bXrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783350041; x=1783954841;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bn9/G/DyutefUg00Snqy1zzU39NkJvMT4AS5q8icaWo=;
        b=F+WHV+mPWoh3691iYx6hYClANAmatcIDpClVzREPyKcvD7lBPEGN1IuOsGZhlip7Nh
         3UUKen1t/1oIFiyH2k8IEYBxYsx8f1VXdn39x3XufvlGKfPH1UPwMqi6j/v0C48qdAAN
         KjSqqCejy/WRcE3zTABxPMfsr296M4Mk1Lm11idqVL8tiVJ6ZkxkP8G3qA6FzvzuKPV9
         laVdYnmSS0XEsF8h9gxAf9WiA2IEW+3LRAkIw9BsGy3/D/QvHwqoGdmHROqy/p1LVmOC
         Hr2YhhbR5475vg1LJdR6wSgGOvngEWQzM71+hTdxrXF7XM6hi/XBEG8u69oy55O4gn9j
         ETCg==
X-Forwarded-Encrypted: i=1; AHgh+RqWW5igt5pUVHV0Ey2t3Cm2pLSFPYdhqil73fd1MBEs3kg908ntSQcCdYOR04Rju2o4VQYej3MQXz5qYYLoziN9@lists.infradead.org
X-Gm-Message-State: AOJu0YxhIdlX3Way6/QqyVraSOzUO0I4xa1v3P9/QcE0pm7metpkYf3h
	cEPWbGr4RIymkCwQ+A/TDTCU4B0CCLCMihU8MRfY8E3/NlCkQh5kCpEPANaMO50RZJq2rw45m+g
	8BF9kju2btHUVXF2isKDsdlVBZtPmhqcUo3MWygOeHJFVLaTDQpOMgAfdj8L2KUO8yjC52/y6O4
	wi/dlraEwM6g==
X-Gm-Gg: AfdE7cn7CWph+oG62CDYOGOLn5ewSlLR1x9PN7nz0kraA2bTje8yeJp9s8sNf+979rC
	yQ0N7vuVPNl4SBmWB5us0DUkCSjuzIgSOvRdPgcfd5tPN9kqHwW/V6VIpXyeG9/Q2DgilE6itK+
	wm9iv8tK6ZsX+gszWZOCLlDEJCtQJV8DCsEiHSfXet6VlMiXrSU+fQ0o+aWKYeiINdmD+17GUto
	f6kI3VaWLqkgL94wcNb6YjzOIe86W7zJhPuiLPdss+dgacnIlgmOq8Tte1r6+SWh5avFYrxnd0y
	QwK66+0kUiFr6bo6icXpzavC8Zx+vt24F5JKGV4TbIazfacViDUM2M3KUUxHmeQKyv8c3agOGAp
	4MS/yfUyjGq9pcsXxW5JIAygS3/IvrxZBMIpng2HHcLqtUhuPU3xlAB6/unGfcCZKU4svTUHraH
	qIdy6NRVAblw7MhMeSY4Xnsgqd
X-Received: by 2002:a05:6102:5ccc:b0:631:4cd8:b6aa with SMTP id ada2fe7eead31-744b7bb690amr470648137.13.1783350039001;
        Mon, 06 Jul 2026 08:00:39 -0700 (PDT)
X-Received: by 2002:a05:6102:5ccc:b0:631:4cd8:b6aa with SMTP id ada2fe7eead31-744b7bb690amr470598137.13.1783350038304;
        Mon, 06 Jul 2026 08:00:38 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aed13c5c11sm2964033e87.77.2026.07.06.08.00.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 08:00:36 -0700 (PDT)
Date: Mon, 6 Jul 2026 18:00:34 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Anna Maniscalco <anna.maniscalco2000@gmail.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>, Joerg Roedel <joro@8bytes.org>,
        Sean Paul <sean@poorly.run>, Konrad Dybcio <konradybcio@kernel.org>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
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
Subject: Re: [PATCH RFC 01/13] iommu: arm-smmu-qcom: Configure lpac device
 with split address space
Message-ID: <5vfdbrk4bu77e7wgutp4h3ilbpjhcxxnwemqiufmtiwoffp4sl@oaonwwouw4qm>
References: <20260705-descriptive-name-lpac-upstream-v1-0-01d50c3e0c99@gmail.com>
 <20260705-descriptive-name-lpac-upstream-v1-1-01d50c3e0c99@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260705-descriptive-name-lpac-upstream-v1-1-01d50c3e0c99@gmail.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA2MDE1MiBTYWx0ZWRfX8MbU5evWAclX
 VxWSmiVv7J47fAwjr9+ZfnRh19RJTUcdkZlEjNGiqazECLIuU41F3xeVX1RKVYMN0sANQ7SGin6
 iVSxQXFCNnqzuV+vhiG0tv9RWfOqZBs=
X-Proofpoint-GUID: UZsfWJdO7Zg8OHXMwRjKGkV4laFdFvIc
X-Authority-Analysis: v=2.4 cv=C6zZDwP+ c=1 sm=1 tr=0 ts=6a4bc319 cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=pGLkceISAAAA:8
 a=lhguFYgXd42DN747EnMA:9 a=CjuIK1q_8ugA:10 a=ODZdjJIeia2B_SHc_B0f:22
X-Proofpoint-ORIG-GUID: UZsfWJdO7Zg8OHXMwRjKGkV4laFdFvIc
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA2MDE1MiBTYWx0ZWRfXwClN4HPB4hPm
 RDsoC2TDpkFHevC9w8pVCYc9UWu9D530ZWzEmSmqgsOMWXPkQ/tn2jrAE/6L1N2UDhJZb3dnKMI
 5MvxJOpFYjxNwoTHRV1ox935bi7RlPQJXdeDL+MrrXi+dXqPjq35uLqHNvNRXjSbxMgT4ps5FpR
 0+71FO8SbWImehDc7RLoQKxtAHxqan7aTGHANbPFGa25/TwB/V7xd/onw0vftqqCYuloudgbxk8
 jf4g2awLqd7CQCufX0jdNWvYIMa5VOfOVUVyXSdzIEkZWdH8oQKB4n52vEqqbB+Q2BUOvcyZBQ1
 Bf0vdLHUm/SpRm7XobeMbMbK8VNg70PFeuc4zR+m+UZQpF5TRB7JlX4Jeab5j00c9mAtsGOEHJc
 YHyGlnfqmttadzcc4GgfpCtP+KXmaUOmjQlsBAuPakpjnzp9yexOdyCZpq6B1ES1IBBo6wH9Nlo
 QCWBmVI1+JToPsfAF+g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-06_01,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 clxscore=1015 spamscore=0 adultscore=0
 bulkscore=0 priorityscore=1501 lowpriorityscore=0 suspectscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607060152
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260706_080042_656399_F8DCF28C 
X-CRM114-Status: GOOD (  14.07  )
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

On Sun, Jul 05, 2026 at 09:13:35PM +0200, Anna Maniscalco wrote:
> We want the context bank used by LPAC to use split address space just
> like GFX.

Why?

> 
> Signed-off-by: Anna Maniscalco <anna.maniscalco2000@gmail.com>
> ---
>  drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c | 11 ++++++++---
>  1 file changed, 8 insertions(+), 3 deletions(-)
> 

-- 
With best wishes
Dmitry

