Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0EEC0D29C32
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 19 Jan 2026 17:20:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5dCKnQqgcn4FwURv24c36V1b4GyaBk0u3IWkPTU4lJY=; b=wqleDh/HlYk1f8RfxJDU0w1Gq0
	x53EYk7IBM2TgtkUCDYXeWGuHaVtCgfop7s6B4KytbwPER8NYBSewy3geHCfHsFjZLDG37O5nbigQ
	7oGLRgUVVxmJneA2QzKAvWaGRerJu5R2Hxup265rNxDJltv2oWh2OnSjL0jnFAnqAXvjWsdo1a2zO
	qfNSecE0y3BJUDmbdSCVzT6GEk2YQ2zkK3/4W56wnqBwqPFSEX9ZOK67UjVkJJBvjwZir/GgIgAvf
	IjmLwU9PvJ9DdmCIU3itvb7UgYTMgyMu1HNgCxuX9WC+xP3QcARq02CL5ibi7ILqhGMBLbPghieLm
	wK7j2jlg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhsvK-00000002c9G-0fBJ;
	Mon, 19 Jan 2026 17:20:18 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhsvG-00000002c8f-3Pw7
	for linux-arm-kernel@lists.infradead.org;
	Mon, 19 Jan 2026 17:20:16 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60JBDKnK1440810
	for <linux-arm-kernel@lists.infradead.org>; Mon, 19 Jan 2026 17:20:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=5dCKnQqgcn4FwURv24c36V1b
	4GyaBk0u3IWkPTU4lJY=; b=LbMW0k8UwfxPriKgy8ReMoO7YrURp4bkQP38ghT7
	P6oe2A0+AVOmmezfIk8mDsXVl5bDwGhoS4lSciJ12Blzj2muRsmaUP2Q/7seAUro
	gwMM9OWcj6KaJo9oc4gw0b4IHph2cRNvfIAjMZwMwmg/mAIt8i3Q07M2goJaWVkx
	MsHpMRhxdNFP4Y4BVzhSZSYBt7QyWau4qBW2psGJvUGoE7dxfoSB6Ic+4AfCubfO
	OtH3bgm67dkpaJJlgQ2kYj5a6B8I7ZDiX7si/8jjEJ6k4oo7FrsWCyAeNRplcCFa
	vhpwEktHNpfrhAumczF/SnoKFOoww0GT+FqoR12hMMfYjA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bskj3h272-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 19 Jan 2026 17:20:13 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8c2a3a614b5so1095939285a.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 19 Jan 2026 09:20:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768843212; x=1769448012; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=5dCKnQqgcn4FwURv24c36V1b4GyaBk0u3IWkPTU4lJY=;
        b=iz02teGbWmTbY/Y/GiMQwDiRo0nqaqK++YK1+QrZRO9vfIc4VjHchR6eRZZc5WyZmB
         lUS+Kq+79GVi69E1liNINSJ4lgmHkUlgJrghmjY+BoC+T0y9TPJ9QJ6aytt44GjO5Aw/
         avLn0JLaTrHUrrqhj0ORJcnmuQD1H471Yn2XoYqHY0NJRrhtiBmtajagRH7L93UTsVbU
         j9I0tnDyLZ62cQyulC4MlNMffWyxpebMjQRHsggY0NAz8VcubjBMg6Rej3Z6SsrYpaDQ
         hmsTmFU6eTOuv9VN5nWLAvqeOGX7K5KJANaTEvtLQfUxr8cSdD+CRI9o4gofRa+viu/C
         32vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768843212; x=1769448012;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5dCKnQqgcn4FwURv24c36V1b4GyaBk0u3IWkPTU4lJY=;
        b=DAvEx1DYt9Km83opc2TOxkoUQIXnD80BJ/+ItmCxEyujPhZ5KSgkG4k5+eJbItBr7L
         6JVTKFyu9PEGeabPDCGnCH4w2GTDjYBtTmhR/94GOdWUXtv8C4zF8e7Fl4FlOfAf4nHX
         LIwmMNL4QxCCPcAfoF4tg2Uk42lKlIqN4wgQPd7W6uTnvzhoh2oCZ4IBR9ghXNLx6GEa
         CiJMKZIFAlr6YdRJsUAxQdIXJRqsaKsj7Csf9/w0l2cLrrChZ45pu5T0OUsuFaAqsMhs
         O9MD4goxW3KlKY3WaDCJxnNoqqq/BP40o4a9TMvlKuD1nGW9poL3e6sh18LQCRfI6lw1
         GQBA==
X-Forwarded-Encrypted: i=1; AJvYcCUa2WC2pqsbvHyFeEnNfH4a7E+S2tRBmJAweLWbE2kTvPTBE0ZnykYQnkdeIN4OlWOE2mRRMMLg3JYmg9xuceko@lists.infradead.org
X-Gm-Message-State: AOJu0YwmNFl5pAX8qrDq13g9EWNDATaDM5BBTPpX2V+EcZ1ODlzNve5O
	p1/SBZI2ROkiO98Nv52PThAymZaMP+V9AkJesA2Pcj062B4Dstt7gbc6MKiFvXWXhe96KrJ8jfH
	g/DjvIGZoAT/6PDpv9pBgGpf0r0vNJiZxYP0ZNg3GYu9DSQcGZCJZJADrnh7B/i8pfhPa5Kl0QM
	6TLmXQ0/1AT0Ll
X-Gm-Gg: AY/fxX6b1sP6wDjiUbmQt9JegsnfvbNvXrtt+cUdrpWav10btWU+XyLV4dSUsdAgrk5
	Jk+9A/FNLlN/MAISmxVcgZEfgTvU9DCidBk2reov8T30pzESf8bNOdT0mtnqNLsgeSDnZnXFZrT
	BbzTXKeAyIRwQLVzEz7FrMULNCVcD4tGh6Uc5IBtGLrKQ7x+XqAPkUI+g8igM+ty1MNnc8rPz4B
	IxqjL2pWadDuJfqqdY0fqCW7NrTCFKk8Jf7GQ9gX9DylO4In6UUJ6xUcFt8cuAKFOZ81+0Hst9L
	buwziLC3fVMtt6zTrDnwgAKdLWvfeoYaP4CbEjUGxndrml/eT1SpoxW03To6bgZoevIoFYB0yvN
	YsKXmmpTKfP5B/+w1Z9ieHBcwuDkiGnT/5qoZuidBzvq+MmKNMPHQWvaWNfbUt3JhjILgnmPxh3
	mv0WYVUyJqDHuWPd3Pwny4ZWI=
X-Received: by 2002:a05:620a:4446:b0:89d:b480:309f with SMTP id af79cd13be357-8c589b85a2amr1894324585a.7.1768843212291;
        Mon, 19 Jan 2026 09:20:12 -0800 (PST)
X-Received: by 2002:a05:620a:4446:b0:89d:b480:309f with SMTP id af79cd13be357-8c589b85a2amr1894320885a.7.1768843211804;
        Mon, 19 Jan 2026 09:20:11 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59baf33ecc7sm3436162e87.3.2026.01.19.09.20.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Jan 2026 09:20:11 -0800 (PST)
Date: Mon, 19 Jan 2026 19:20:09 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Sudeep Holla <sudeep.holla@arm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Trilok Soni <trilokkumar.soni@oss.qualcomm.com>,
        Satya Durga Srinivasu Prabhala <satya.prabhala@oss.qualcomm.com>,
        Mark Rutland <mark.rutland@arm.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, trilok.soni@oss.qualcomm.com
Subject: Re: [PATCH] firmware: smccc: default ARM_SMCCC_SOC_ID to disabled
Message-ID: <3ldzdsyspd3s6on3cwyanjeheegoeba6kn6qaybojtqeca7335@cyemyxk6kck4>
References: <aWgEDAlglnGrzdR4@bogus>
 <4fab824f-8067-49d7-8e6c-dedd67a8454d@oss.qualcomm.com>
 <aWoVR4oNdIHnksJQ@bogus>
 <92d90a1e-e993-4044-b152-83a8700f7b63@oss.qualcomm.com>
 <cb7326b9-91d9-44a3-b9f0-9d2e6ab5fa42@oss.qualcomm.com>
 <aWzuuwQi_nsHoj_5@bogus>
 <mzs5vq2jsrmb6kdriuxawbamyim6dhgy34ne6tucnhlalt5y3w@ghckxur3cn6m>
 <aW5Fdjag_w7i0zWN@bogus>
 <vvvq5rnbzs7ngtahqrar4iqinizthyrv3ipqnjp6ln34di365j@bbwdyda6gw3u>
 <aW5iQABCRukZXpZH@bogus>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aW5iQABCRukZXpZH@bogus>
X-Authority-Analysis: v=2.4 cv=ds7Wylg4 c=1 sm=1 tr=0 ts=696e67cd cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=654gc9IM5QJH5ztBADMA:9 a=CjuIK1q_8ugA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE5MDE0MyBTYWx0ZWRfX2DTDI1qnKA8P
 fdfz2oYQNX6FCzuZXpfwDqI7UAw9ilOPQ3YfIHxnLsgh1+WgayW7rrg3fr0bvIGTCih0LRqglda
 TYTkPbSP2zkgY8G+MVJXL/du8KvDbiRLae7+SYfSNGBIbIoLwFEuVuh89IZPHFi63Wmd+0b9lPy
 WxMiXaEp3LoUrhau88avLdFERZBohTzUXSBDi9emki+jNNek0VfqQlEWUdooyK2JJGMzftssQ0/
 ZAvlNdAQhvKW/RBcOKhUaxfHAGaebVtJYmbpl+3q0cIsxyLZNy87wwQmi3s90ti5NPe/yauP5pF
 ERs+1sPG1eZ2070DLhSD2+ENGUBNyXckLzimJGAJfbwKZiFVBz7NOTRQj5wTbUuw6N+epa1CnI0
 mutK8fdJx3VSQQJ0vs/9qsVpnAjLoDBQjs4MVzqeiqjVvghZnuEZXiXqGh0LbfDbVvVPbritdbt
 pYKhx0V3L+ex6IpY58A==
X-Proofpoint-ORIG-GUID: ymDK5WBGpaS7DQjh07FmEkVwHLWqsrnM
X-Proofpoint-GUID: ymDK5WBGpaS7DQjh07FmEkVwHLWqsrnM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-19_04,2026-01-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 impostorscore=0 phishscore=0 priorityscore=1501 spamscore=0
 clxscore=1015 adultscore=0 malwarescore=0 lowpriorityscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601190143
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260119_092014_882762_B0820B54 
X-CRM114-Status: GOOD (  28.81  )
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

On Mon, Jan 19, 2026 at 04:56:32PM +0000, Sudeep Holla wrote:
> On Mon, Jan 19, 2026 at 06:44:23PM +0200, Dmitry Baryshkov wrote:
> > On Mon, Jan 19, 2026 at 02:53:42PM +0000, Sudeep Holla wrote:
> > > On Sun, Jan 18, 2026 at 03:16:50PM -0600, Bjorn Andersson wrote:
> > > > On Sun, Jan 18, 2026 at 02:31:23PM +0000, Sudeep Holla wrote:
> > > > 
> > > > To me, when you decided to add a second caller to soc_device_register()
> > > > you created a regression in the userspace interface. If nothing else
> > > > it's a leaky abstraction.
> > > > 
> > > 
> > > In that case, shouldn't soc_device_register() made to give error when an
> > > attempt to call it more that one time then ? Also should be change the
> > > ABI documents to refer it as soc0 and not socX ?
> > 
> > Then the whole SoC bus is an overkill. But I have a strange question
> > here. Consider the device having the "BT / WiFi SoC" next to the main
> > SoC. Is that SoC a legit target to export informaiton through sysfs /
> > soc bus?
> > 
> 
> Just for clarity, I agree with you and there could be duplication of
> information if there are multiple source for that information. E.g.,
> the setup in this discussion where the EL3 firmware provides SOC_ID
> information via SMCCC SOC_ID and DT providing vendor specific information
> about the platform. Both are getting exported via sysfs but the problem
> here is SOC_ID has displaced vendor specific DT info from soc0 to soc1.

I understand the context and I understand that we ended up having two
soc devices for the main SoC. And that's exactly why I'm asking about
the WCN SoC exporting the information through the same interface. If it
is a legit user, then it is a possible outcome that WCN binds to soc0
while the main core gets bound to soc1 (even without SMCCC_ID in place).

Likewise if WCN if a legit user of soc_device_register(), then we can't
make it fail after registering the first entry.

> 
> We are exploring ways to see how user space can survive this.

-- 
With best wishes
Dmitry

