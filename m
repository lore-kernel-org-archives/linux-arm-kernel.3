Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9335CCF2DD
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 19 Jan 2026 19:46:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KjLqg4NCZW5HVeSGJD2IDu7KY/jOeFMsx7bzNX3Cq+4=; b=l9S3XM+gqV2IAHk52TrExbvTMV
	SDXukl7HwFK4TwzI0jO/hwCz+iHy2oH0UrdttSyIg1ssveYoelUwPVhSjBL62vn+lzgEPhcALMPTf
	q3mmpxOv9FUS3tv3SEbKsU78cuAQYFvu6Gy05nSM3MT/JDdVf2EY3di8DraPNn4Rctzln23z+Adan
	1zEFCWlCTCrqkDDkolQQdX9YjtcGRX+q8jeySf9F9enn8E6nJQfgh6UOx0uO8V10s1oeFd+k8LT38
	Bhk9k/ZFpDveRAy1GmizsbcZ6cC/29cidjRviXK33P5sMkknMUEtFImUUixpurG9SoR3Y7ZqihN/c
	AsE4GWgw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhvCa-00000002n5t-3YAz;
	Mon, 19 Jan 2026 19:46:16 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhvCX-00000002n5Y-3WAq
	for linux-arm-kernel@lists.infradead.org;
	Mon, 19 Jan 2026 19:46:15 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60JIooQL2966239
	for <linux-arm-kernel@lists.infradead.org>; Mon, 19 Jan 2026 19:46:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=KjLqg4NCZW5HVeSGJD2IDu7K
	Y/jOeFMsx7bzNX3Cq+4=; b=mbAt42zCnE2LHYfx94GGHwF/iecPPZ7e0bX59MPE
	8pgi7v7ShqAvBHkJWoUGfeFqGGEuWmU0UI0F81LaY/j5EQEzZH9okL8yJlbkZiKg
	gRBzcrWvPtR9eUqxbERBJzRXBnaqCVWH0QUaLgq9o0aVzW+uIUmbopMsQjyGkoXw
	hfuaX9CHH1lPVXQGPZzgQ3F11Mnjd3a0ZXofTq2Um4tfOZbskgvuayZE7JJU1EsK
	Zx9w0aG5ZbQ4edPwkCQgLb9CifBRoNMYnIOrb0LpJrlGObnmMKj6AHkpXPSGq3L1
	TjQ/Es1XeS6+YPlyBQTESK6iXp1XTDbl9swni0KqapgoJQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bsjaa9muk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 19 Jan 2026 19:46:12 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8c6a291e7faso590868685a.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 19 Jan 2026 11:46:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768851972; x=1769456772; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=KjLqg4NCZW5HVeSGJD2IDu7KY/jOeFMsx7bzNX3Cq+4=;
        b=eMDyBd96Sbqui1RLcQWmCJdx3U1z1ofuP70CiX/7+QzpJQdieX6pJ7M67K61sgBmrX
         jdboS/6g2usO7krHGoqojCx+OTwmXz/ZV0/J8bwZHt0qosWfF3aomLCqvwz2flp3Zj8p
         wVz1tIbfwBWdsh3zjSuS/9CSYol3sYTzdDdSrauKA3mWNfLhs2COhcnBMSJAvAA79pAG
         A4kL3TQ84EIJaRQCAMgQIMbsVb9XHjc+IzMTwbV3f9F67jquTMLuBbRYf36bHfCmdkOo
         ePpA4WCuPbbBYkMTrYvhbrTqgFjwCaJZmnv1ST32AL8A9dpSnZI5WKa3vpGnu3Dicc3F
         KTXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768851972; x=1769456772;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KjLqg4NCZW5HVeSGJD2IDu7KY/jOeFMsx7bzNX3Cq+4=;
        b=I4+rwcZKRqykmbSjwaOMdyv/JFyt8ARZZjGSJLtXDS8BfpKgW82qmrTgHWHwGOmeVx
         Uc/CyHbqDZftEIET+ph1IvmFlO0B5qxtTNaABcbYrStjK8qChh/yIrVGoqiqfy28YzWk
         HNRZct2EKWp+iu7S3zoJbv67vN79ugeFU3BOBqWuJFGsEfRk45TnuRk6Jg8077khUHCY
         2xQzfzuEuI1NyQf15Mp/LaHeMOXJHaPRRtiCzgdFoj0Yn91eL31Btt+gdx3xszmag7nP
         qhhmxR0GO0KuefUlxyD0KSk/mDTBAz8LiPnfD434LHPb6KRtoVvgX4etYXnIvKqMO/qf
         ri/g==
X-Forwarded-Encrypted: i=1; AJvYcCWQlt1Tv/MbydrZsoLqYhlIPWyYpLLBVAiDlj8JN5KYn08naWilCh32gL0YtIaKzHPtDeRR7iRGXvJVCjLO37vk@lists.infradead.org
X-Gm-Message-State: AOJu0YxUWjmDcnHLzOBLkPCRxPmiZrIue5atukvY0AnBJa0aptIxBKvc
	KdYEYRu8wZ3FsQ/+KHBfrFDT9cl7AfKmjP+B4a42SLhJzTlCbMD9DiZJXaVxRrpdZ5ImSw/JNo6
	/V76Ml7O/YE8OjXZbZlMZ68zAFDsuuTK/wlLr+n6mM9p8ASGlVZVxoJYeBROYmllo76I5X4liZI
	ijOQ==
X-Gm-Gg: AY/fxX5aDysdlaN9eSGxwcK0j+wqdo5dhOyZGPuuXvDK26qaLuz5OZmkpKD7YzSkRJS
	eU3a5QOeg80B57C6SryKPOTcOVjJdgP9uyW3NPwKdBD1Xit7I8h+vO3CJP8XVlMrYHIKvN2dCb0
	0WQ3YZP9FkX+V9x0KE/G35zBO22wDdF/kBkxKiqWnXzUW+1s+hxXU+OOkmYGCiian0D/5ExMJJ9
	1JXbE/U8xDXIjt8sG4JPsScBa0CKo0t5Dha8mK2VY+DKmGxTe521xb+ovJJt+/fL+I8uDSO4ogH
	55g5ID0vo/lyZE8kJ1E6Z9uddbnW0gwW9YGkCxfC5Bz5AdKN6LfNLCEx/nZOdGqv7SYT9z4PF9t
	14utICrl+ZecF5tbymzoBaLG3ne1FFMVePpkJLBf/MguWWhusPSz0Cc/hZMJWC+fGab1g6FKyAA
	y+ymhIbrCyiL3ANmXSuL+ETs4=
X-Received: by 2002:a05:620a:2805:b0:8b6:1877:3689 with SMTP id af79cd13be357-8c6a6919d3dmr1637943885a.35.1768851971558;
        Mon, 19 Jan 2026 11:46:11 -0800 (PST)
X-Received: by 2002:a05:620a:2805:b0:8b6:1877:3689 with SMTP id af79cd13be357-8c6a6919d3dmr1637940085a.35.1768851971054;
        Mon, 19 Jan 2026 11:46:11 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59baf39bc5csm3636078e87.67.2026.01.19.11.46.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Jan 2026 11:46:10 -0800 (PST)
Date: Mon, 19 Jan 2026 21:46:08 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Sudeep Holla <sudeep.holla@arm.com>,
        Trilok Soni <trilokkumar.soni@oss.qualcomm.com>,
        Satya Durga Srinivasu Prabhala <satya.prabhala@oss.qualcomm.com>,
        Mark Rutland <mark.rutland@arm.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, trilok.soni@oss.qualcomm.com
Subject: Re: [PATCH] firmware: smccc: default ARM_SMCCC_SOC_ID to disabled
Message-ID: <2fmnaxj2ma2bb5iuuu4yzmenp3tsxjko6rziwuaaqr6rqvegbw@s4x6eiwhlkcm>
References: <aWoVR4oNdIHnksJQ@bogus>
 <92d90a1e-e993-4044-b152-83a8700f7b63@oss.qualcomm.com>
 <cb7326b9-91d9-44a3-b9f0-9d2e6ab5fa42@oss.qualcomm.com>
 <aWzuuwQi_nsHoj_5@bogus>
 <mzs5vq2jsrmb6kdriuxawbamyim6dhgy34ne6tucnhlalt5y3w@ghckxur3cn6m>
 <aW5Fdjag_w7i0zWN@bogus>
 <vvvq5rnbzs7ngtahqrar4iqinizthyrv3ipqnjp6ln34di365j@bbwdyda6gw3u>
 <aW5iQABCRukZXpZH@bogus>
 <3ldzdsyspd3s6on3cwyanjeheegoeba6kn6qaybojtqeca7335@cyemyxk6kck4>
 <i4zd3jesjrbljym7xuhwo5v7gwbsbuesuarnxr462eeuosevij@64hcfdzht6w3>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <i4zd3jesjrbljym7xuhwo5v7gwbsbuesuarnxr462eeuosevij@64hcfdzht6w3>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE5MDE2NSBTYWx0ZWRfX8OIDk9vDywHg
 hNBmmRaFnU7Qmr3FtCNBPAGuNpFMKu3rIX+7Xs84Xxx355arqAMUodvadRBNSi+EBO5bLYRBmuj
 sxBaWtLnIJZZirrLgZ7lssl9mePosf7NG+/mt28XSDlICs+ONA+V/tduhoX+UxOYP6W+d4mVFZX
 zzqY3LVTHfawhWzKBeyRBjW92p/2uTd3ADUd/PWRtgOx/wFbdoW4YMoigkdmgiinK3R8ap/sV1J
 1NBmdGCgl6TJ+YMVluhYmTokqKIeFhP4D6/3PBoiwp6eF+FK5nrSlB3kX3ORJds9yStbN6B65I5
 QVz7JoL16mPbNVF/7YHSmE6sD4gwRo7hCz+EH6me/OurjuNJmjERsm8Rccal6fFGqG+Fv3GtmZU
 KQtvE4iz6jvRk5PGOLNjdTbQ99PyFEXAjptSGdT/C4Nt8oFqEU574UXhZbTd+/yDE3g89pdNEBC
 t+r+/Jnjgj6FFAubzLQ==
X-Proofpoint-ORIG-GUID: wG0opBdxZxeDd5RDpZM5tygNSGh3vtpk
X-Proofpoint-GUID: wG0opBdxZxeDd5RDpZM5tygNSGh3vtpk
X-Authority-Analysis: v=2.4 cv=L8gQguT8 c=1 sm=1 tr=0 ts=696e8a04 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=f3c_A7qAZzxDW3Z421kA:9 a=CjuIK1q_8ugA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-19_05,2026-01-19_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 suspectscore=0 phishscore=0 spamscore=0
 clxscore=1015 priorityscore=1501 lowpriorityscore=0 bulkscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601190165
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260119_114613_886217_E98E6F32 
X-CRM114-Status: GOOD (  36.81  )
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

On Mon, Jan 19, 2026 at 11:25:31AM -0600, Bjorn Andersson wrote:
> On Mon, Jan 19, 2026 at 07:20:09PM +0200, Dmitry Baryshkov wrote:
> > On Mon, Jan 19, 2026 at 04:56:32PM +0000, Sudeep Holla wrote:
> > > On Mon, Jan 19, 2026 at 06:44:23PM +0200, Dmitry Baryshkov wrote:
> > > > On Mon, Jan 19, 2026 at 02:53:42PM +0000, Sudeep Holla wrote:
> > > > > On Sun, Jan 18, 2026 at 03:16:50PM -0600, Bjorn Andersson wrote:
> > > > > > On Sun, Jan 18, 2026 at 02:31:23PM +0000, Sudeep Holla wrote:
> > > > > > 
> > > > > > To me, when you decided to add a second caller to soc_device_register()
> > > > > > you created a regression in the userspace interface. If nothing else
> > > > > > it's a leaky abstraction.
> > > > > > 
> > > > > 
> > > > > In that case, shouldn't soc_device_register() made to give error when an
> > > > > attempt to call it more that one time then ? Also should be change the
> > > > > ABI documents to refer it as soc0 and not socX ?
> > > > 
> > > > Then the whole SoC bus is an overkill. But I have a strange question
> > > > here. Consider the device having the "BT / WiFi SoC" next to the main
> > > > SoC. Is that SoC a legit target to export informaiton through sysfs /
> > > > soc bus?
> > > > 
> > > 
> > > Just for clarity, I agree with you and there could be duplication of
> > > information if there are multiple source for that information. E.g.,
> > > the setup in this discussion where the EL3 firmware provides SOC_ID
> > > information via SMCCC SOC_ID and DT providing vendor specific information
> > > about the platform. Both are getting exported via sysfs but the problem
> > > here is SOC_ID has displaced vendor specific DT info from soc0 to soc1.
> > 
> > I understand the context and I understand that we ended up having two
> > soc devices for the main SoC. And that's exactly why I'm asking about
> > the WCN SoC exporting the information through the same interface. If it
> > is a legit user, then it is a possible outcome that WCN binds to soc0
> > while the main core gets bound to soc1 (even without SMCCC_ID in place).
> > 
> > Likewise if WCN if a legit user of soc_device_register(), then we can't
> > make it fail after registering the first entry.
> > 
> 
> But by this definition, a vast variety of discrete IP should register
> with this interface - instead of providing such information in their
> respective functional interface.

I *suppose* that was the intention. Otherwise there is little point in
having socX defined in the ABI.

> 
> My interpretation is that the soc_device_register() related to the
> entity which is represented as /soc in your DeviceTree.
> 
> For a broader "dumping ground for different IP to register their
> version information", we'd need some way to associate each entity with
> the related component - which I believe there is none, because then you
> could have used the specific driver interface in the first place.

We can be using of_node / fwnode pointers for that (where available).
However, I guess, there would be no fwnode for SMCCC SOC_ID.

> (I.e. there's no representation of the WCN SoC in our system, we have
> representations for the PMU, the WiFi, and the BT core, but not the
> whole).

The mapping is really a separate topic. I can imagine "just an
enumeration" kind of ABI.

-- 
With best wishes
Dmitry

