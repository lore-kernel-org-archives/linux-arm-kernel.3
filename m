Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4CF6D29C46
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 19 Jan 2026 16:44:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wmVSL0yeT+KvD+vmMkTMN5P2TsIbV9a8ttJOjy1cS/U=; b=tDnK6KFnWjD4GrOkgAfKv35+jW
	XU8ztXx4qrT2ruQkH3lDYoM8vVm3eyQKqvY/MViS0O4nGmSUpcUseXggb3ZkKykbS5iSQMYZeY8Ff
	1LbhZupWISdD3B8I4FM5eWsCppkHgAxfGXcNJjrIvqY1jMnqQIHMOEHWE17P/ikmHzcseFeNLShUk
	l7SzZlbWRtULxH3XpPgaM3US3iA3BYGesnLHY+esw5xn+oSdZEZvIK8444WdgqP2hYPa4WHeuTf+p
	AJ+fANvXrZ/odZMPvGqoi7K6YDzkgzTuRM2wmyeaRd+1nZ5QNb3hcPBbof57G9NhvRKZ3gf7iZeLb
	5I4KrjXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhsMh-00000002XOt-0x72;
	Mon, 19 Jan 2026 16:44:31 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhsMe-00000002XMu-1cxN
	for linux-arm-kernel@lists.infradead.org;
	Mon, 19 Jan 2026 16:44:29 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60J90gve227781
	for <linux-arm-kernel@lists.infradead.org>; Mon, 19 Jan 2026 16:44:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=wmVSL0yeT+KvD+vmMkTMN5P2
	TsIbV9a8ttJOjy1cS/U=; b=coEDHFhkNOmgoVBlhWI3pnsdLh8wyuzTLnTYtood
	rR+jvY5OYGHvzyTW1/Jl47yUZ9hp5T7gaYWyZ0jRxbEkQLE2A0bzU3ZdGq7N111C
	UQzN9QL9kcHCGbn3MWpQLTyp0qlRi3aP3kOB4zQ8vNT39RK6SjIBWxegDNwHdYLT
	fOvDocDhhqM/XaY4Ulcze8PjInn/JsbYvhVa1iudRzLbehIgXpCSV4E5tkjxlGCp
	yGdRUmpTYSchsH7F5sgeHBS3RNOpsz3vasKD9aw3iUZC8YvqDai+TtF1D6rQoGc6
	lOBUpbacnABqsVuTCFYts8CV2/EntsDhO9EWpH3NMMJNEw==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bsgfr9n3m-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 19 Jan 2026 16:44:27 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-8887c0d3074so116104596d6.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 19 Jan 2026 08:44:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768841067; x=1769445867; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=wmVSL0yeT+KvD+vmMkTMN5P2TsIbV9a8ttJOjy1cS/U=;
        b=JTfNC1zoQmojA4u6f9mEYhHcXSTAvDgHn1JcyEAyJtzz4yfMKYv786e95H2Hss8gkT
         c1ZFMe48vXnpOcDag3TGqvKnsZ8ZYrP0dqi5xbHfunBVHx9puvBv5fwtZM3zgZopVPF3
         /RTr9lRHPB3qwxcIMzhFA7TP4QmkzLz5l+2E00h55xL+E+M+5E3Z8OuDsj9pYampskR4
         kREmAZ8MtwaPeoXRDMBYjrqRkhfpZRq3yaQ+NZCNW4AepDWic0r7oP4yDyU08ZwrHVnt
         trLPMAR6vJE4TW4gckWNV6zXQQj8bkJ9hiA4PlR/gbShlXLXFLd6LjIbCm+j4BeK9+w/
         QtXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768841067; x=1769445867;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wmVSL0yeT+KvD+vmMkTMN5P2TsIbV9a8ttJOjy1cS/U=;
        b=T1huYu9n2R/+zzcKwRlr63EYagJLCSV/D8dP45KlEiuPYL4ntJZaDpzn2Vyp39hQAC
         yvOCic2en7ICbFB84yDLwVIFe6XHRx4w+7AvnU5uuedtMma35H9n/aAiBWU4DM3FTLlq
         oYx6buB2CepAHR8erctnpmBUxu4da2mkPz35iTk5cRWNcB8GM4yS/PpefiAEv6Npf6Av
         +aLKvTxgbjS5cppc6ezSfOBF45IQAh5QkNIIyRM5N6qfpYLkxguyNMsS8zN1Nx+1Y+Yg
         qLndJa/JaKQU9eNJ0qvwUpK+FTpBo48c3VLIPvLYNHp8YEu4jHYNYGdxz3ON/7I9k3Pw
         btLA==
X-Forwarded-Encrypted: i=1; AJvYcCUm9gL9ri6ECtmhyvBeqL99ZAURc4sFX7ILSbNmp4L+a8v1OvNXS95Sy5B5T141v00Laq9YzBszvYgWFL5dAlgV@lists.infradead.org
X-Gm-Message-State: AOJu0Yx1AFwEG0AQ1B4wNzU95XObHBbQpL1YnclyIA0zcq8zIjvKUHnP
	dxXnQDd7KQaL5ROxtFPxh8x0WpFAcUTiNQvorOSWqYXvuDkiqe82uuuKq7z4gnOWhHlvuScBaIz
	SAw82I2y4xZGM0P6nAwImimvXEXBoSw+qPRSHKDAI3d2+d1mRlWXJfNb93csPZ7YD0SSXEvsS+z
	w8OA==
X-Gm-Gg: AZuq6aI5PXZRJSaesDRg6mSzLNHVgZ2rzz8YcoNuWVI24YjV9qijCMLyEVLeye0r4ve
	wsM5SkJ5v4YkEi120lhus9wETJyzWBXlkMDjo/63ogyeAGmLGszkD60trSgwGq3y3TfSRn3Nayw
	0k7ylPhiaPJHU6qcceL75yfWHIpeb9RRL/Ztj6lMHgUsVZFS5q8V7rppK2sLhYhPSuBUR+EoKRy
	CBER9ARHx3W2+6EgfpCibrU3Bvb4g4qY2wgKb+UiYERzAcN84lF3lPwjh6giux4mrp6xpCJRF94
	tnfzTlH6pQI3md1Ac1R0i88evTS4lecgPP3UPv+RC9QhKjhoP66DMnCCdEidk7b/l6Hd1Cuixdl
	W4xkf8E905jgA0Yedk0jGETurBbBSDqqiO4BoIefjv69Zyk1Vl5zMrgWxD0Kdx9MzW6oqOP1ZGf
	rcWRggzSBp4cDl6aYEvbDy5Zk=
X-Received: by 2002:ad4:4d11:0:b0:894:3cb5:2ed9 with SMTP id 6a1803df08f44-8943cb532bemr93075176d6.14.1768841066695;
        Mon, 19 Jan 2026 08:44:26 -0800 (PST)
X-Received: by 2002:ad4:4d11:0:b0:894:3cb5:2ed9 with SMTP id 6a1803df08f44-8943cb532bemr93074836d6.14.1768841066124;
        Mon, 19 Jan 2026 08:44:26 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59baf39c03bsm3444442e87.77.2026.01.19.08.44.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Jan 2026 08:44:25 -0800 (PST)
Date: Mon, 19 Jan 2026 18:44:23 +0200
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
Message-ID: <vvvq5rnbzs7ngtahqrar4iqinizthyrv3ipqnjp6ln34di365j@bbwdyda6gw3u>
References: <aWY6kx8Bwa_2azIl@bogus>
 <86331062-301b-40b1-9df1-78f7751508b4@oss.qualcomm.com>
 <aWgEDAlglnGrzdR4@bogus>
 <4fab824f-8067-49d7-8e6c-dedd67a8454d@oss.qualcomm.com>
 <aWoVR4oNdIHnksJQ@bogus>
 <92d90a1e-e993-4044-b152-83a8700f7b63@oss.qualcomm.com>
 <cb7326b9-91d9-44a3-b9f0-9d2e6ab5fa42@oss.qualcomm.com>
 <aWzuuwQi_nsHoj_5@bogus>
 <mzs5vq2jsrmb6kdriuxawbamyim6dhgy34ne6tucnhlalt5y3w@ghckxur3cn6m>
 <aW5Fdjag_w7i0zWN@bogus>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aW5Fdjag_w7i0zWN@bogus>
X-Proofpoint-ORIG-GUID: 9OacmXjYYWbgRyM9m2bI5921gkdhhQ2C
X-Proofpoint-GUID: 9OacmXjYYWbgRyM9m2bI5921gkdhhQ2C
X-Authority-Analysis: v=2.4 cv=c4OmgB9l c=1 sm=1 tr=0 ts=696e5f6b cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=M4nwLoQtCJemt5GeOY8A:9 a=CjuIK1q_8ugA:10 a=ZXulRonScM0A:10
 a=zZCYzV9kfG8A:10 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE5MDEzOSBTYWx0ZWRfXzvgGhCya6n4l
 L6c4ugtaZKcIXUI2HjQtriY/GYnOgEaYG+sBlJjqL8GIY7ngOhGX5cI2xndGmPJrdlp8O4EMsq+
 tkMsyA5pTK2UmMIoFtKrJcAd1h6w+TuOr1AX0c4OZnUQ9c+kCWKCtHzX+W1nGQ2uxZ8jc722s4V
 pAa/YYzjXy1OAAE3qu+QWXEhMp7uVcgyhGEwM0cpyvJJODkdHOTv6B89qElNT7EDffmQ5vKlybD
 TNEDLiv4NnHvvHEXZup/LeMpxKZ1KqC/GNpudx3aVDDw6X11trTboU8xjxM9Ijlbgf/eDF8yP/9
 i8IHm/vhWSbLNmLTzae7/dWOM1lYh0iOrFQn/j51MILW0C7OtreYpdjz1dHmUdB3BfoYeh/3kQr
 EWrMqQI/3usE3WH6Exz9pnHiMNt+qpS72Rm4vKbXHtgu+GQ47oYXXgqXlwkD1Rm4HLHZnGzNsd3
 6lgPiLx9jLTucbDutlw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-19_04,2026-01-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 impostorscore=0 clxscore=1015 priorityscore=1501
 suspectscore=0 spamscore=0 bulkscore=0 phishscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601190139
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260119_084428_594946_03306268 
X-CRM114-Status: GOOD (  17.99  )
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

On Mon, Jan 19, 2026 at 02:53:42PM +0000, Sudeep Holla wrote:
> On Sun, Jan 18, 2026 at 03:16:50PM -0600, Bjorn Andersson wrote:
> > On Sun, Jan 18, 2026 at 02:31:23PM +0000, Sudeep Holla wrote:
> > 
> > To me, when you decided to add a second caller to soc_device_register()
> > you created a regression in the userspace interface. If nothing else
> > it's a leaky abstraction.
> > 
> 
> In that case, shouldn't soc_device_register() made to give error when an
> attempt to call it more that one time then ? Also should be change the
> ABI documents to refer it as soc0 and not socX ?

Then the whole SoC bus is an overkill. But I have a strange question
here. Consider the device having the "BT / WiFi SoC" next to the main
SoC. Is that SoC a legit target to export informaiton through sysfs /
soc bus?

-- 
With best wishes
Dmitry

