Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52939CAC5BB
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  8 Oct 2025 19:51:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GbQD2xoyny656Xp8A+uK/BNwLmiPop5rGNXGtX1WIt8=; b=xnBkCWhzYPY5YjOPpfiNQfSG2i
	p92KCJ3NTKYF62YnEgFjsehllGw81LP9sPqret6EW1ED8SVfSZMsN2QdGtI2dGX6KhEnTsKJAsALf
	DfwS2NYbrcbu093F9Pq8sgRFk6sAa8tCd6du7aQQ8xFMP5k/heBUuxjwxZnKzKQN7xVSjRfQNdwac
	h64DZJKnOel1RAfdbfdsAt1ERmc+SKXwN7wcUcngZhqq3PWH5xPjW+ev6WeSxAxWCVpbnDQ0DGKvj
	yj1APtnUFNvHsSRfxp7sszf4QZJ3yXpbVtHHf0PsSgmZyNMUiDkAJyS/wR4VjYx53Znyi6UY6AcL6
	6yxWPsAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6aC5-00000004Zy1-1Rg2;
	Wed, 08 Oct 2025 19:51:25 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6aC2-00000004Zxc-2kJA
	for linux-arm-kernel@lists.infradead.org;
	Wed, 08 Oct 2025 19:51:23 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 598I5IUS027653
	for <linux-arm-kernel@lists.infradead.org>; Wed, 8 Oct 2025 19:51:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=GbQD2xoyny656Xp8A+uK/BNw
	LmiPop5rGNXGtX1WIt8=; b=DAl3M+Wv9sybFMG/fXKte7jvMLe0vRDP3hJS3rcX
	OGBQ4HO0B71DBRYs8Hx5768uJkjvsLZYSVuIRGodfpGM/ZRNU5XhghZ1CUyo1PIC
	166UHoX0b5pypW/OeUGqwlV4yryjSdznsqcIyBDVjnkhnipZQaui/GkDBOTaoYd2
	OI+Kyzs+mOsE3DIKE72l4AxGUGQQWNVRp8ahuHlmbP0cdog2DAcAd8PDkRJXzlFi
	2JA0kHfwuX8V0qItQxScAFp902cMEdsYHUtvPfQmewZ4lgGdizdD7SfELVngF1TT
	yyzckLnOR8Abj32pa7+y+/v/PlBs7nfS6gP7gn8t6p37cw==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49nv4nre4c-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 08 Oct 2025 19:51:21 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4d91b91b6f8so2767201cf.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 08 Oct 2025 12:51:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759953080; x=1760557880;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GbQD2xoyny656Xp8A+uK/BNwLmiPop5rGNXGtX1WIt8=;
        b=Llv7t7b3Mtk9JYWKuT/o+PUSvQAIc5BtGmhzG0iPGghZPiVgib+OktaHNZDc65jgl5
         cWLFu96d+XPkUsTmsWG8QrYPhmcAR8Wfcb8JOUmEehSmu+nCPtHAuZiZthqyS9gkykdA
         D/HAMmh7uXgH+ilfLLzbheH66vp0b9gkqvnFCLSxQRYEnevRsCX6IXKveqO8+MjwkcSd
         /N18VLxYZczJKgBdlYo6tnEjXAoNCEaOxG9ioL+duIl8n75wS3QGmrc0ibs61KXJtYKT
         P3mCAG69rzvkYKnjW744I5cNcItb3GPRelgjKHgm1ygFwk+vSUTvrZYt5i+edQPaxW+P
         78Rg==
X-Forwarded-Encrypted: i=1; AJvYcCUKHruzt1rViltGIssH/ngQRNJtPEYl9w0XllmNPoyjhNEIJ9/56JcRKSvFd02KJtJFbHilwmDlNefnfs/W7XA+@lists.infradead.org
X-Gm-Message-State: AOJu0Yz+17h7sxu/SaekJsPOBVvjk0wwvqqqiLBa/SQ4mqDECG+Da6aA
	BjrHUOdyvmVYVKDN0eyAQyQMjen8hIFJ7KpzmOXO61DBJ7LFXuJVK3aUt8MxkYRYXPIwT1oFCzN
	KepCtfeFGDlLE+k96L6jPAzT7bHe7MpC17zsIvEAlz+J3tEitgRdKkRK/u8MQEZdeCTYyCxxoYv
	RwEtPSkNsSdg==
X-Gm-Gg: ASbGnctEfDrZvdqOHFaUDBVyKmJAQS0R9QAh5hlCzdV6FqmBL9BCAFZ+VNvatimOjiv
	huQ3EUmzAN1zVefrE7uaURhKRkm0M8LfXPx2sqiReT9O1Pojw5E110SLnXzg1MWq0e2qQ5itTPW
	wB2AFYFRhvN76HLBR2ExPGdOSGMJTkdsM1ktPT7lr0BmXqe5cchKyDF5HWb6Vuyk60DYoZlMM2T
	bAzSR3pbDayXfvli+tbmO1KmsdTfXeUqBe566XlYcsTG3yMivmxbgVUkWFqwmMLFKfi34pqg1uJ
	rqLEgi4E1BMyWLZXHhFjrCDwZHj8VXFemTen+3N9BlQneXn1gFAsF7tCwpp9IFxJwNxuzbz0AXP
	o2KE+UV1LGKXd7ZAdcaK03yKl8u6+2T/qc04bXkA2Fr51wqH+wdrmy+Ge2Q==
X-Received: by 2002:a05:622a:1190:b0:4da:256c:3d42 with SMTP id d75a77b69052e-4e6ead66d3bmr74774831cf.59.1759953080043;
        Wed, 08 Oct 2025 12:51:20 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFpHn/H4dhV4XbQHYMbUSjn4irkOysXPJz8YXz9MbAxepygkEk7N9h9yieHpzim7GqYVkeTaA==
X-Received: by 2002:a05:622a:1190:b0:4da:256c:3d42 with SMTP id d75a77b69052e-4e6ead66d3bmr74774511cf.59.1759953079206;
        Wed, 08 Oct 2025 12:51:19 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5907ac2349fsm296878e87.56.2025.10.08.12.51.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Oct 2025 12:51:18 -0700 (PDT)
Date: Wed, 8 Oct 2025 22:51:16 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Ard Biesheuvel <ardb@kernel.org>
Cc: Will Deacon <will@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        David Heidelberg <david@ixit.cz>, linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, mark.rutland@arm.com
Subject: Re: [PATCH] arm64: head: set TEXT_OFFSET to the historical value
Message-ID: <obcgfnmgdemf5gtc7gdaj6nzoa2rwxsc6njt4fd2ouwzqj4y7y@ztxwyyoepuud>
References: <20251006-arm64-text-offset-v1-1-bf0e8a27383b@oss.qualcomm.com>
 <aOPLv_-f5sNGtG4e@willie-the-truck>
 <CAMj1kXHhetfN_bY5AAqqfC4=N9yQCO5R_n7H0BMXZ2VXudv5pQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMj1kXHhetfN_bY5AAqqfC4=N9yQCO5R_n7H0BMXZ2VXudv5pQ@mail.gmail.com>
X-Proofpoint-ORIG-GUID: GC3XP2DYVG1_Na6OhTHen0Gi0buB_VU8
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDA4MDEyMSBTYWx0ZWRfX4CS6Mrg5PGNt
 0tl6WYD+BCfIPx66PEXK1W5ecSAR60HJqlSWkGHfqYvro+/rK+WsN86pxNA2V6apxGUKoOqJIpI
 JgZI+GIBtfD5vou+9BRSagfBooWImk1GVX/cKeno0qnZc2hXdRKA3pYojS4yPXJQ07eSZZcKd/0
 V7GRN20vleZMF+uHc2MQlKeBcadqR568HJnu3Uy7MH7i9XlWyMZf85cOLLizkUcX0yLHx0oD+/8
 hBr1DIuwnKmdIEctqW00zr89g4qcIcFlSZynS61wG15+mC1/xg3z1HCdO1rozd7gCH3mxkNqipU
 pk2xeAKSz+SSZyWRE5RcTJXvx9mvqZt7+PVFAqzIXR56TZYee3MoZlXhkMIIYRgnfe4c3lJQ2VP
 i3kqH4muaUMIuocsnthmUfd7lU3RjA==
X-Proofpoint-GUID: GC3XP2DYVG1_Na6OhTHen0Gi0buB_VU8
X-Authority-Analysis: v=2.4 cv=b6a/I9Gx c=1 sm=1 tr=0 ts=68e6c0b9 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=x6icFKpwvdMA:10 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8 a=EArQ5nPrA_zcfZOwlBcA:9
 a=CjuIK1q_8ugA:10 a=kacYvNCVWA4VmyqE58fU:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-08_05,2025-10-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 suspectscore=0 lowpriorityscore=0 adultscore=0 phishscore=0
 clxscore=1015 spamscore=0 impostorscore=0 malwarescore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510080121
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251008_125122_810679_3273FC94 
X-CRM114-Status: GOOD (  38.97  )
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

On Tue, Oct 07, 2025 at 01:46:08AM +0200, Ard Biesheuvel wrote:
> On Mon, 6 Oct 2025 at 16:01, Will Deacon <will@kernel.org> wrote:
> >
> > [+Ard and Mark]
> >
> > On Mon, Oct 06, 2025 at 01:21:04AM +0300, Dmitry Baryshkov wrote:
> > > From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > >
> > > Historically arm64 kernel contained (almost fixed) value of 0x8000 at
> >
> > 0x8000 or 0x80000?
> >
> > > the TEXT_OFFSET. The commit cfa7ede20f13 ("arm64: set TEXT_OFFSET to 0x0
> > > in preparation for removing it entirely") and then commit 120dc60d0bdb
> > > ("arm64: get rid of TEXT_OFFSET") replaced this field with 0.
> >
> > Given that we made the initial change over five years ago, I'm struggling
> > to see why we should start caring about old broken bootloaders _now_.

Well... because support for these devices wasn't upstreamed and so a
similar patch was being kept in the down-upstream kernel.

> >
> > In fact, I'm far more concerned about changing this to a non-zero value
> > and having more recent bootloaders misbehave.

I see.

> >
> > > This caused no problems so far, because nobody seemed to be playing with
> > > the extremely picky Qualcomm bootloader as used on some of Google Pixel
> > > phones. Current attempting to boot the Linux kernel on those devices
> > > will fail to load on those phones with the following message:
> > >
> > > KernelDecompress failed: Invalid Parameter Kernel TextOffset does not match
> > > Error calling BootPrepareAsync Invalid Parameter
> > >
> > > Since the kernel ignores the field, set it to the expected value of
> > > 0x8000, unbreaking boot of upstream kernels on Qualcomm devices.
> >
> > (same typo)
> >
> 
> Just setting the header field and not updating the base address also
> means that the boot breaks without CONFIG_RELOCATABLE, and you will
> get a warning in the kernel log about the load address not being
> aligned to 2 MiB.
> 
> So I don't think this is the right solution.

Since most of the people build the kernel with CONFIG_RELOCATABLE, would
it be better to set it to 0x80000 for relocatable kernels and to 0
otherwise?

> 
> If this is really something that needs to be fixed upstream, we should
> just bring back TEXT_OFFSET in its entirety, but I'm not convinced
> that this is really justified here. As a workaround, you could just
> add 2 MiB - 0x80000 bytes of padding at the start of the image, and
> add your own header (as Will alludes to as well)

Does it mean building a device specific kernel? Or just packing
everything while building the Android boot image?

-- 
With best wishes
Dmitry

