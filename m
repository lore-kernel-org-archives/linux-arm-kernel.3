Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A74CCD12D55
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  3 Dec 2025 12:19:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:To:
	Subject:Cc:Message-Id:Date:Content-Type:Content-Transfer-Encoding:
	Mime-Version:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=U1cAxsmEpFJXSScw6H8R77cdefHfZunUBKjjqkWhIJ4=; b=2ZqigFasNWur5dElE3b8y9+QJ2
	HYRMkr1gGF2XPhanfwQyWy2bmzN8lU6jcQzvxlkSfTbHGIuJ63Iqrw4UDRq9TYQarRUUCyNM2S7Gg
	CV/3oLB8DmD1w4tB8iZMDRIW9l5RpRHbKpF52+piRZorTGo6MgllYSkJ9MNkXW8rubNmffIUBBPus
	Eg/kQSK7c/EVqMSSRoXxKYNAGXulXnB29/sHfm7LByuVohYOoAq6L+CCY1Tpe31bppe0MAA3J6w3+
	kOjOkdPpbTsQjkCBKJ0XPyrqEqBU7aH0NRy4HCuRvKLMF4spR0/4x4sS3RcWfWi9gpQ+JYIonEQv3
	J0eBjk6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQlp9-00000006Y99-1d78;
	Wed, 03 Dec 2025 12:19:11 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQlp6-00000006Y8k-2PmU
	for linux-arm-kernel@lists.infradead.org;
	Wed, 03 Dec 2025 12:19:09 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-47755de027eso46526725e9.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 03 Dec 2025 04:19:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1764764346; x=1765369146; darn=lists.infradead.org;
        h=in-reply-to:references:to:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=U1cAxsmEpFJXSScw6H8R77cdefHfZunUBKjjqkWhIJ4=;
        b=pb+C4G9W/zB3RgykA3nzFXNyDBp/ly275I8k3HKirGdImMbA4BQKuSeeu+/F0ZarDp
         3CcBKL/gcp2oFAgt0mM46NwPtJTpCGPlAVyNhrT4LYtdGthPlpC5E3hDFP19be59Kbkf
         5Sujazn58lGR5L1IrvttJBwmgeAecrsPP4weCUaP1VUJ5rBVcZyGEScpMVmm/UFF1RLo
         7D9IO3rlZn0pCWzu7Dy6LEY2tEaOBwNem8DpV7q9tuFe8goRNBxWWiARQYCEawsbNSJ3
         HUJZZX7xxc94H0yrvabqQPvGg1YQiGLxHxgRHgWe7z3JqmmjK58YIb0xf4N0mnEtTIWC
         6nJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764764346; x=1765369146;
        h=in-reply-to:references:to:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=U1cAxsmEpFJXSScw6H8R77cdefHfZunUBKjjqkWhIJ4=;
        b=qldnK6Ioy01oSqJqAXwzOITFv4WWXVVQFHPLsoXyq/XRiGZYTXaNsZuW5Mrdj8lmnz
         K4/S3YU6jfLEey6HKQ1PImcSrWGCSWy14DBxXXx+t+aW2A2NEsxkDvXHXm+a9t6mHlKa
         ucTL5uyg/NuAzaG4+HImHkaGpgyqxIdnIizXiRciZnF2NtwmH71GQO9CXtQ2IBwIKkC+
         FtEcHCVbIJN74vKAKu8dfFk1MWu5X6Nqv+ASFcHpD/ZU+vYineTDKx0YbEZiNmfsXlBL
         4lIMLX6515umonERZhq6ZInh23xiCWU2eGIT4vYXl9ps/6Zwz2h9Zt7VQFU0ehXBhrDi
         oCAA==
X-Forwarded-Encrypted: i=1; AJvYcCWdaEgbo5qTp0nS5zup+J14xQvquGurj4F4SKxn/bktlRS7lSaQIwnZ46Mf/WHBk6QPhcPMt5IUQVU13UG5e20C@lists.infradead.org
X-Gm-Message-State: AOJu0Yz14hs6HMxQwQwucyyUS1z/hTYyZ2XnxYoMor6E0Q5oH5kqaZ32
	RNxn6lcrFC7AfTRz4uMm1xAgqz4CKkAmRClcex+QOqS2yIC6dB7xKUsPWER0CCeuk7Y=
X-Gm-Gg: ASbGncvmUysuTdwalpmwkbL6HV9+tItFmXSo3f/aE9cbEraSOKFrwTM+bD0gxWYi9TM
	mdp5Yw1ovMYzeHa2wq1aKB/HR1nCgoDaoVSnSiGeAJlpVRW+wjnUwNcKBXHAy92X7eMxa+UKVGD
	gS0VqNjNL+HR4c3z87+2k27RpRf2BxBFBfk5e90hI/ZqyQR3M0w3O8juQN9jWjCPGVEi2zdDZdU
	xOO0Jux5uxzHLjJs/OVLtDntLQxAjBI+XSQqQ6KkhOuJ3w1MtcOtn3105BhJjrreHHucwrBA+yh
	+LVeNuQpRoLYjhT5R3aspdcwyko1Msb03uZ357hjw8vzG82Ai7Hj7PKuqtoDkuSgGy1NRsRmz0O
	YV/nrV/dujtgDCFAaNNkKZbGnIgL3hXcm0+9BPolLPinp+3b/TOlPNE7OBChFgoJektc23FrnoH
	a55Nqu5LPlTCcAZ3RM2HqpR8v8/l0pXOxa83DE6jQiydpnLnofexAf
X-Google-Smtp-Source: AGHT+IHHTbJIcnGQCc0utWINMQd+ZLj+OqfQUAbKCEsDG7jK0rWei2cfpyaMVepvuB3KAsYLzf4COg==
X-Received: by 2002:a05:600c:45ca:b0:46e:4a30:2b0f with SMTP id 5b1f17b1804b1-4792af486d7mr23114625e9.29.1764764345668;
        Wed, 03 Dec 2025 04:19:05 -0800 (PST)
Received: from localhost (a109-48-201-233.cpe.netcabo.pt. [109.48.201.233])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4792a8ccdfbsm47268455e9.14.2025.12.03.04.19.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Dec 2025 04:19:05 -0800 (PST)
From: Rui Miguel Silva <rui.silva@linaro.org>
X-Google-Original-From: "Rui Miguel Silva" <rui.silva@linaro.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 03 Dec 2025 12:19:04 +0000
Message-Id: <DEOKQZMPDTLY.3H4NBUEC3LNHE@linaro.com>
Cc: "Laurent Pinchart" <laurent.pinchart@ideasonboard.com>, "Mauro Carvalho
 Chehab" <mchehab@kernel.org>, "Hans Verkuil" <hverkuil+cisco@kernel.org>,
 "Shawn Guo" <shawnguo@kernel.org>, "Sascha Hauer" <s.hauer@pengutronix.de>,
 "Pengutronix Kernel Team" <kernel@pengutronix.de>, "Fabio Estevam"
 <festevam@gmail.com>, "Martin Kepplinger" <martink@posteo.de>, "Purism
 Kernel Team" <kernel@puri.sm>, "Rob Herring" <robh@kernel.org>, "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>, "Conor Dooley" <conor+dt@kernel.org>,
 "Philipp Zabel" <p.zabel@pengutronix.de>, <linux-media@vger.kernel.org>,
 <imx@lists.linux.dev>, <linux-arm-kernel@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>, "Alice Yuan"
 <alice.yuan@nxp.com>, "Krzysztof Kozlowski"
 <krzysztof.kozlowski@linaro.org>, "Robert Chiras" <robert.chiras@nxp.com>,
 "Zhipeng Wang" <zhipeng.wang_1@nxp.com>, "Hans Verkuil"
 <hans@jjverkuil.nl>, "Sakari Ailus" <sakari.ailus@iki.fi>, "Kieran Bingham"
 <kieran.bingham@ideasonboard.com>
Subject: Re: [PATCH v4 0/5] media: imx8qxp: add parallel camera support
To: "Frank Li" <Frank.li@nxp.com>, "Rui Miguel Silva" <rmfrfs@gmail.com>
References: <20250729-imx8qxp_pcam-v4-0-4dfca4ed2f87@nxp.com>
 <20250805010822.GC24627@pendragon.ideasonboard.com>
 <aLbcpEZXm5G1Onq7@lizhi-Precision-Tower-5810>
 <20250902123920.GM13448@pendragon.ideasonboard.com>
 <aLhJDXnz9HPGrWcp@lizhi-Precision-Tower-5810>
 <aQuDSROHLGHIhtlh@lizhi-Precision-Tower-5810>
 <20251105171928.GB6046@pendragon.ideasonboard.com>
 <aQul/VGG8e3MJxhx@lizhi-Precision-Tower-5810>
 <DE1JMG95RZME.2YSV10RI9AME4@gmail.com>
 <aQzFiEOQvtZjHIsr@lizhi-Precision-Tower-5810>
 <aS9NvkAWTa42j7KW@lizhi-Precision-Tower-5810>
In-Reply-To: <aS9NvkAWTa42j7KW@lizhi-Precision-Tower-5810>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251203_041908_687224_A36ED4AB 
X-CRM114-Status: GOOD (  42.22  )
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

Hey Frank,
On Tue Dec 2, 2025 at 8:36 PM WET, Frank Li wrote:

> On Thu, Nov 06, 2025 at 10:58:00AM -0500, Frank Li wrote:
>> On Thu, Nov 06, 2025 at 10:34:48AM +0000, Rui Miguel Silva wrote:
>> > On Wed Nov 5, 2025 at 7:31 PM WET, Frank Li wrote:
>> >
>> > > On Wed, Nov 05, 2025 at 07:19:28PM +0200, Laurent Pinchart wrote:
>> > >> Hi Frank,
>> > >>
>> > >> On Wed, Nov 05, 2025 at 12:03:05PM -0500, Frank Li wrote:
>> > >> > On Wed, Sep 03, 2025 at 09:56:29AM -0400, Frank Li wrote:
>> > >> > > On Tue, Sep 02, 2025 at 02:39:20PM +0200, Laurent Pinchart wrot=
e:
>> > >> > > > On Tue, Sep 02, 2025 at 08:01:40AM -0400, Frank Li wrote:
>> > >> > > > > On Tue, Aug 05, 2025 at 04:08:22AM +0300, Laurent Pinchart =
wrote:
>> > >> > > > > > Hi Frank,
>> > >> > > > > >
>> > >> > > > > > Thank you for the patches.
>> > >> > > > > >
>> > >> > > > > > I've quite busy these days, and I don't believe I will ha=
ve time to
>> > >> > > > > > review this series before coming back from OSS Europe at =
the beginning
>> > >> > > > > > of September. Let's see if anyone on CC could volunteer.
>> > >> > > > >
>> > >> > > > > Laurent Pincha
>> > >> > > > > 	I hope you have good time at OSS.
>> > >> > > > >
>> > >> > > > > 	Do you have chance to review this patch?
>> > >> > > >
>> > >> > > > I'm going through my mail backlog, which is really big at the=
 moment.
>> > >> > >
>> > >> > > Understand.
>> > >> > >
>> > >> > > > I'd like someone else to volunteer to review this series. It =
won't scale
>> > >> > > > if I have to review all NXP media patches in my spare time :-=
/
>> > >> > >
>> > >> > > Yes, but none volunteer review this in passed months. Expeciall=
y key
>> > >> > > reviewer. I am reviewing i3c patches. but Not familiar v4l syst=
em yet. It
>> > >> > > need scalable solution. I can help filter some common and simpl=
e problem
>> > >> > > from beginning.
>> > >> >
>> > >> > Laurent Pinchart:
>> > >> >
>> > >> > 	Do you have chance to check this serise? this one should be rela=
ted simple.
>> > >> > 	This one sent at 7/29. Still not any volunteer to review it.
>> > >>
>> > >> I'm afraid I won't have time to review this for the time being. My =
spare
>> > >> time is already exhausted by all the other drivers I maintain upstr=
eam.
>> > >>
>> > >> > 	How do we move forward?
>> > >>
>> > >> I think this is a question for the subsystem maintainers. Hans, Mau=
ro ?
>> > >
>> > > Mauro Carvalho Chehab and Hans Verkuil:
>> > >
>> > > 	Laurent provided great help about review and land i.MX related
>> > > patches in past, who are quite famillar with i.MX chips. But he is q=
uite
>> > > busy. So the whole reviews cycles takes quite long time and offten c=
ross
>> > > some merge windows.
>> > >
>> > > 	In pull requests for 6.19:
>> > > https://lore.kernel.org/all/4989c563-47f4-478c-80c4-41f7e98597e4@ker=
nel.org/
>> > > only 10 patches, and 4 patches is trivial clean up.
>> > >
>> > > 	In reviewing patch queue, there are
>> > > 	1: media: nxp: imx8-isi: Add ISI support for i.MX95
>> > > 	   https://lore.kernel.org/imx/20251105-isi_imx95-v3-0-3987533cca1c=
@nxp.com/T/#t
>> > > 	   This one already review, but I am not sure if it capture 6.19 cy=
cle because
>> > > PULL-request already sent.
>> > >
>> > > 	2: Add MIPI CSI-2 support for i.MX8ULP
>> > > 	   https://lore.kernel.org/imx/20251023-csi2_imx8ulp-v7-0-5ecb081ce=
79b@nxp.com/
>> > >
>> > > 	3: media: add imx93 mipi/controller csi support
>> > > 	   https://lore.kernel.org/imx/20250821-95_cam-v3-0-c9286fbb34b9@nx=
p.com/
>> > > 	   This one is quite big, but first 10 patches is simple trivial cl=
eanup patches.
>> > > 	   I post at 8/27, but get first feedback around 10/27, I am not
>> > > 	   sure if missing somethings.
>> > >
>> > > 	4: This series, laurent already said no time review it.
>> > >
>> > > 	5: ap1302 sensor patches
>> > >            https://lore.kernel.org/imx/20250811-ap1302-v4-0-80cc41b9=
1662@nxp.com/
>> > >            binding already ACK, most maintainer want to pick binding=
 with
>> > > 	   driver together, but not an feedback since 8/11.
>> > >
>> > > 	I jump into and help do some review.
>> > >
>> > > 	The questions is how to move forward pending patches, like [3], [4]=
,
>> > > [5]. How to keep good community channel to avoid long time pending?
>> >
>> > Sorry, but like Laurent I am really without spare cycles to go over th=
e
>> > patch series that have arrived in media (also I do not have any hw any=
more).
>> > So, Frank or maybe Laurent knows someone that would like to be add als=
o as
>> > maintainer of this drivers for me would be great, that would also help=
 to
>> > avoid such bottlenecks.
>>
>> If there are not other candidate, I can help maintain it although I am m=
ore
>> familar with dt binding, i3c and dmaengine. I can start from simple patc=
hes
>> and we have test team to help cover testing on the real hardware.
>
> Rui:
> 	Any update? How to move forward? It was already passed more than 3
> month!

Sorry, I did not realise something was blocked because of me, specially imx=
8
related. I thought you have sent the update to MAINTAINERS.

For me it is fine, it makes perfect sense since you have access to hardware
and documentation, for you to be the maintainer and steer the features and=
=20
improvements in the imx media. you can move me to Reviewer, since there are
already other 2 persons (and Laurent already handle the pulls, thanks for t=
hat)
much more active in the IMX media subsystem.

Thanks again and Cheers,
    Rui

