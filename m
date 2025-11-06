Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9E51CCFA03
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Nov 2025 10:35:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:To:
	From:Subject:Cc:Message-Id:Date:Content-Type:Content-Transfer-Encoding:
	Mime-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=khqybK/xlzWlMQBHPxk0XD3yxDB1oxoxHdP7w8UG3E0=; b=iNbaN7EjtfysYyw2GFtLj3/fPk
	6MTA6nYVuA3CRCPh1jOPAV84QRMYDUJao3Ncp965CCSd2AquZ798LAVEo9LAItGEg06y4jvtsZw7z
	tRo1vEz7BQIcDTJH1NYMcXuwEnAYo4QuCvRA5dWuwwi3OXFPkzH4etutUt+QdagAny4L260IDko8b
	PyDwsLUeOClbCmukQngp51zj7d9BfrxYG0iq8PRv11C2XyWkCXghKgwGRWoSvaYNLJq18MIYeVETE
	Ncpx1pukJdrXPlOPZ4WDqLJhUqeHYN6YosjZ5BKKQFuojOAKlACzdg3K1+Z6VyqrjykP1ewPQtMF2
	DwZqCzgw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGxKS-0000000FKha-04O0;
	Thu, 06 Nov 2025 10:34:56 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGxKP-0000000FKh7-0Die
	for linux-arm-kernel@lists.infradead.org;
	Thu, 06 Nov 2025 10:34:54 +0000
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-4775895d69cso3884665e9.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 06 Nov 2025 02:34:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762425291; x=1763030091; darn=lists.infradead.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=khqybK/xlzWlMQBHPxk0XD3yxDB1oxoxHdP7w8UG3E0=;
        b=GHWBtxsuXV5A57k42AtpAk5aM5LuZRI7peSXebAU00KxT29JtJN3eXIPp0pLT/Rbr8
         8fgDmeFuiYJjA75XWQUq3TWqpDtz8F67+EkEErjoRLrP0TLGmjPZwecNzrJY86bsHGjK
         RVzXGoS+INcY9TZ4Xa/dyepF8Q7XEOvHo23ZyK2KQlQVI35OFqCVJpA4pvJluDL2JEYK
         JWtIeh0ljfdtGNhcr6duJCFFMcH1CrS6il1g9wIM97CWouKy2j/oEu987o4QSk72Uw1w
         Eb1rqvLZuEREyDQLfFXDul9hQ6rW65ZnxNNztKHkqTS6ngPMnyP/2qLZT1+LEjMP83NX
         c/CQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762425291; x=1763030091;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=khqybK/xlzWlMQBHPxk0XD3yxDB1oxoxHdP7w8UG3E0=;
        b=JwUgcKFtVj0G+tlZKfoQjmI2vwMWWho5Kcg4stFFQXlDNhKJGs/fw6N2kp/yEUEoS7
         hM2/PGUDJUQ1jc/NC9WKphn0gaW1H7pUbENUYYoEghB04Wd4mY2IJWzZWzDE/nuMt+LQ
         SXsQjqDW1nHVOMeeLNFwDCdfT3weGsFmeLwYVf9OsMs+eq7qVoCqL1p7lQ7BcHS8WDj3
         8tDryVilVSMWmI2oH9cNWBJh/bkODxMfmbXO8ZRt98GR0m1N/x/lOUoCa28X8pa2+a6g
         8Ql5SP6b3ot1WiOe0xw/5hSFWb357WDzYdZP0gJtQMqMiyN+dvrxcjRrpMKnJJYF4emI
         KN+Q==
X-Forwarded-Encrypted: i=1; AJvYcCVBtpWTOnkYofJud7yG8jKnBw/kHT/wSiHpdpd4jxYJyJgLyKhcjyETcCd67uZnbo5qsvrSa+TWxczUUqcCnXOq@lists.infradead.org
X-Gm-Message-State: AOJu0YybIvvUDJKKcozATDxGdzgrRqaxiOGxH1mugt37zvn9ieQa3IiV
	H2wCi6Lnj82/fiITNfRJeo2noDCrHJ/im4T37WICAiUFjNpPj05WoBY2
X-Gm-Gg: ASbGncubTpclqo/JjU7nCRn9uxwvdkCikq8D2Bmex5vOGdqvsxIoY4I29xzH6SbIAaP
	3BR79ZKAnL/6Y4eTHvAOsgp9YRARYMdPPgVx+mWIFmLvRF1ZGhJuftEIA9urz3JW4kBdzFsN3+f
	DiqPY9I4F6eeG7M3nQFi+qRt3CTTGKIBqXZ+MUh9fo9zzbjMr30ko83J2WNK9+D3eHYa5MiYR0M
	ch+eyPMeAZ1AdBEYP5OMVz2mLZ95iCQ8uG0vVAm9oekPTDu9PX88+xCzDmi4ZWK+2Cseonuw1gi
	KLRnxx/p1uxSrc7cWY8HHTjPwJmhSej9tEZ0MlesiMXxi92sHaxBCi1vFM3dDOb4zOO5NdubHNi
	pBu+3wT5wroJi3MGCYETittJMZ6ePFJLPa+kuFWnXu0zpxVF3+kzGsCoderHi5v6WkD76Cct4QJ
	ktPB4CiHa5qrrNt8BKSJuWki4DtO1w4GWASw==
X-Google-Smtp-Source: AGHT+IHK/oWaeWq7uP78JwTb75evD9pbxUOakU4Fr3bQ3oQuz8S08wrBQPzwEF9doMfvThWNXoaycA==
X-Received: by 2002:a05:600c:6388:b0:458:a7fa:211d with SMTP id 5b1f17b1804b1-4775ce1874bmr49277875e9.29.1762425290379;
        Thu, 06 Nov 2025 02:34:50 -0800 (PST)
Received: from localhost (a95-94-245-170.cpe.netcabo.pt. [95.94.245.170])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4775cdcc552sm107269485e9.6.2025.11.06.02.34.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Nov 2025 02:34:49 -0800 (PST)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 06 Nov 2025 10:34:48 +0000
Message-Id: <DE1JMG95RZME.2YSV10RI9AME4@gmail.com>
Cc: "Shawn Guo" <shawnguo@kernel.org>, "Sascha Hauer"
 <s.hauer@pengutronix.de>, "Pengutronix Kernel Team"
 <kernel@pengutronix.de>, "Fabio Estevam" <festevam@gmail.com>, "Martin
 Kepplinger" <martink@posteo.de>, "Purism Kernel Team" <kernel@puri.sm>,
 "Rob Herring" <robh@kernel.org>, "Krzysztof Kozlowski"
 <krzk+dt@kernel.org>, "Conor Dooley" <conor+dt@kernel.org>, "Philipp Zabel"
 <p.zabel@pengutronix.de>, <linux-media@vger.kernel.org>,
 <imx@lists.linux.dev>, <linux-arm-kernel@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>, "Alice Yuan"
 <alice.yuan@nxp.com>, "Krzysztof Kozlowski"
 <krzysztof.kozlowski@linaro.org>, "Robert Chiras" <robert.chiras@nxp.com>,
 "Zhipeng Wang" <zhipeng.wang_1@nxp.com>, "Hans Verkuil"
 <hans@jjverkuil.nl>, "Sakari Ailus" <sakari.ailus@iki.fi>, "Kieran Bingham"
 <kieran.bingham@ideasonboard.com>
Subject: Re: [PATCH v4 0/5] media: imx8qxp: add parallel camera support
From: "Rui Miguel Silva" <rmfrfs@gmail.com>
To: "Frank Li" <Frank.li@nxp.com>, "Laurent Pinchart"
 <laurent.pinchart@ideasonboard.com>, "Mauro Carvalho Chehab"
 <mchehab@kernel.org>, "Hans Verkuil" <hverkuil+cisco@kernel.org>
References: <20250729-imx8qxp_pcam-v4-0-4dfca4ed2f87@nxp.com>
 <20250805010822.GC24627@pendragon.ideasonboard.com>
 <aLbcpEZXm5G1Onq7@lizhi-Precision-Tower-5810>
 <20250902123920.GM13448@pendragon.ideasonboard.com>
 <aLhJDXnz9HPGrWcp@lizhi-Precision-Tower-5810>
 <aQuDSROHLGHIhtlh@lizhi-Precision-Tower-5810>
 <20251105171928.GB6046@pendragon.ideasonboard.com>
 <aQul/VGG8e3MJxhx@lizhi-Precision-Tower-5810>
In-Reply-To: <aQul/VGG8e3MJxhx@lizhi-Precision-Tower-5810>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251106_023453_117288_6CF7FC78 
X-CRM114-Status: GOOD (  37.55  )
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

On Wed Nov 5, 2025 at 7:31 PM WET, Frank Li wrote:

> On Wed, Nov 05, 2025 at 07:19:28PM +0200, Laurent Pinchart wrote:
>> Hi Frank,
>>
>> On Wed, Nov 05, 2025 at 12:03:05PM -0500, Frank Li wrote:
>> > On Wed, Sep 03, 2025 at 09:56:29AM -0400, Frank Li wrote:
>> > > On Tue, Sep 02, 2025 at 02:39:20PM +0200, Laurent Pinchart wrote:
>> > > > On Tue, Sep 02, 2025 at 08:01:40AM -0400, Frank Li wrote:
>> > > > > On Tue, Aug 05, 2025 at 04:08:22AM +0300, Laurent Pinchart wrote=
:
>> > > > > > Hi Frank,
>> > > > > >
>> > > > > > Thank you for the patches.
>> > > > > >
>> > > > > > I've quite busy these days, and I don't believe I will have ti=
me to
>> > > > > > review this series before coming back from OSS Europe at the b=
eginning
>> > > > > > of September. Let's see if anyone on CC could volunteer.
>> > > > >
>> > > > > Laurent Pincha
>> > > > > 	I hope you have good time at OSS.
>> > > > >
>> > > > > 	Do you have chance to review this patch?
>> > > >
>> > > > I'm going through my mail backlog, which is really big at the mome=
nt.
>> > >
>> > > Understand.
>> > >
>> > > > I'd like someone else to volunteer to review this series. It won't=
 scale
>> > > > if I have to review all NXP media patches in my spare time :-/
>> > >
>> > > Yes, but none volunteer review this in passed months. Expecially key
>> > > reviewer. I am reviewing i3c patches. but Not familiar v4l system ye=
t. It
>> > > need scalable solution. I can help filter some common and simple pro=
blem
>> > > from beginning.
>> >
>> > Laurent Pinchart:
>> >
>> > 	Do you have chance to check this serise? this one should be related s=
imple.
>> > 	This one sent at 7/29. Still not any volunteer to review it.
>>
>> I'm afraid I won't have time to review this for the time being. My spare
>> time is already exhausted by all the other drivers I maintain upstream.
>>
>> > 	How do we move forward?
>>
>> I think this is a question for the subsystem maintainers. Hans, Mauro ?
>
> Mauro Carvalho Chehab and Hans Verkuil:
>
> 	Laurent provided great help about review and land i.MX related
> patches in past, who are quite famillar with i.MX chips. But he is quite
> busy. So the whole reviews cycles takes quite long time and offten cross
> some merge windows.
>
> 	In pull requests for 6.19:
> https://lore.kernel.org/all/4989c563-47f4-478c-80c4-41f7e98597e4@kernel.o=
rg/
> only 10 patches, and 4 patches is trivial clean up.
>
> 	In reviewing patch queue, there are
> 	1: media: nxp: imx8-isi: Add ISI support for i.MX95
> 	   https://lore.kernel.org/imx/20251105-isi_imx95-v3-0-3987533cca1c@nxp.=
com/T/#t
> 	   This one already review, but I am not sure if it capture 6.19 cycle b=
ecause
> PULL-request already sent.
>
> 	2: Add MIPI CSI-2 support for i.MX8ULP
> 	   https://lore.kernel.org/imx/20251023-csi2_imx8ulp-v7-0-5ecb081ce79b@n=
xp.com/
>
> 	3: media: add imx93 mipi/controller csi support
> 	   https://lore.kernel.org/imx/20250821-95_cam-v3-0-c9286fbb34b9@nxp.com=
/
> 	   This one is quite big, but first 10 patches is simple trivial cleanup=
 patches.
> 	   I post at 8/27, but get first feedback around 10/27, I am not
> 	   sure if missing somethings.
>
> 	4: This series, laurent already said no time review it.
>
> 	5: ap1302 sensor patches
>            https://lore.kernel.org/imx/20250811-ap1302-v4-0-80cc41b91662@=
nxp.com/
>            binding already ACK, most maintainer want to pick binding with
> 	   driver together, but not an feedback since 8/11.
>
> 	I jump into and help do some review.
>
> 	The questions is how to move forward pending patches, like [3], [4],
> [5]. How to keep good community channel to avoid long time pending?

Sorry, but like Laurent I am really without spare cycles to go over the
patch series that have arrived in media (also I do not have any hw anymore)=
.
So, Frank or maybe Laurent knows someone that would like to be add also as
maintainer of this drivers for me would be great, that would also help to
avoid such bottlenecks.

Thanks in advance,
Cheers,
    Rui
>
> Best regards
> Frank Li

