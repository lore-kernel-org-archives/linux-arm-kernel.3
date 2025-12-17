Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3874D66B85
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 17 Dec 2025 19:17:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=81Abl9aSXqO6VCJZziQzRy2Nkmg+USJz57ws9VtOYYM=; b=0Mhl2G3pdYFgNdvwaaqvBDYJzR
	YDg/DbZQHbl/7y8dNWd6IIulVZ3A6qaccM5pOvSye6mu0w+TQn5JZxkmSsI/v20xXWK/kZuCRJxq2
	Y1ubPX4YKNSGJPBEoZqq7yCMGWyce2cjySevu7rx2+i1B+oKCf3m4oicXBqo8goV8KwaT+auDBPzK
	DIVXgzFN5qYa30FJgkKFyLHBNYj9+tbHKzkYaJ/l2YnLnzY0bhmyEwP4fTnFUf8vIX/pZWSWhnKlx
	E+rqFcsOCtjinbI58pSoB/jD/mmh+s1G8IDoblwpYtiTTRHoY0VS7uyUZR9cnPSv9nXTsWVrMsgw2
	XjVG52sA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVx1e-00000007Jbl-3oFX;
	Wed, 17 Dec 2025 19:17:30 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVx1a-00000007JbQ-1YQZ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 17 Dec 2025 19:17:29 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id E139E4E41C66
	for <linux-arm-kernel@lists.infradead.org>; Wed, 17 Dec 2025 19:17:21 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 9B4046072F;
	Wed, 17 Dec 2025 19:17:21 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id E0B35102F0AF3;
	Wed, 17 Dec 2025 20:17:15 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1765999037; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 in-reply-to:references; bh=81Abl9aSXqO6VCJZziQzRy2Nkmg+USJz57ws9VtOYYM=;
	b=D0zzTwtH8rkpA3QHSZ9WyVjL9H4YQPxC1eQuACw7FknGFABBOdidh/uDc2GIjb10s1/+4Q
	8ZPJ4dYi61SHm1RHj9hRAXzoRXdFpziIk6EKJdLP3U3gEo8zrHQ9Ia7SYR+iaWBDSFLnMs
	SDasUUQZNP+zfBT1/Dy4zQEckye2TNGlcK15V3U+34nhpF2qaWWO2kIgZtHwaLXagyMRUt
	BeuizFmum9QkckiwVAUvnuF5xdVnVxlUKnftNw9kvsiT2NGO8VVL3QDp/o5yGtOQwiwobe
	drgIRJaqBinjyVUlOx+CSy5kkMmzdrNoWndS9ykDEROKpyJ4jYSJTuiOV4FgEA==
Date: Wed, 17 Dec 2025 20:17:15 +0100
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: "T, Harini" <Harini.T@amd.com>
Cc: Tomas Melin <tomas.melin@vaisala.com>,
	"Simek, Michal" <michal.simek@amd.com>,
	"linux-rtc@vger.kernel.org" <linux-rtc@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 2/4] rtc: zynqmp: rework read_offset
Message-ID: <202512171917155dba6723@mail.local>
References: <20251201-zynqmp-rtc-updates-v1-0-33875c1e385b@vaisala.com>
 <20251201-zynqmp-rtc-updates-v1-2-33875c1e385b@vaisala.com>
 <LV5PR12MB98047B0A754AFFFB01163E0992A3A@LV5PR12MB9804.namprd12.prod.outlook.com>
 <353422a2-ba6e-4600-9326-e0cee2098062@vaisala.com>
 <LV5PR12MB980448D3F4109DC0775A56AA92ABA@LV5PR12MB9804.namprd12.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <LV5PR12MB980448D3F4109DC0775A56AA92ABA@LV5PR12MB9804.namprd12.prod.outlook.com>
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251217_111726_923629_AD07A3C4 
X-CRM114-Status: GOOD (  25.66  )
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

On 17/12/2025 18:14:30+0000, T, Harini wrote:
> [Public]
> 
> Hi,
> 
> > -----Original Message-----
> > From: Tomas Melin <tomas.melin@vaisala.com>
> > Sent: Wednesday, December 10, 2025 5:35 PM
> > To: T, Harini <Harini.T@amd.com>; Alexandre Belloni
> > <alexandre.belloni@bootlin.com>; Simek, Michal <michal.simek@amd.com>
> > Cc: linux-rtc@vger.kernel.org; linux-arm-kernel@lists.infradead.org; linux-
> > kernel@vger.kernel.org
> > Subject: Re: [PATCH 2/4] rtc: zynqmp: rework read_offset
> >
> > Caution: This message originated from an External Source. Use proper caution
> > when opening attachments, clicking links, or responding.
> >
> >
> > Hi,
> >
> > On 09/12/2025 19:28, T, Harini wrote:
> > > [Public]
> > >
> > > Hi,
> > >
> > >> -----Original Message-----
> > >> From: Tomas Melin <tomas.melin@vaisala.com>
> > >> Sent: Monday, December 1, 2025 6:20 PM
> > >> To: Alexandre Belloni <alexandre.belloni@bootlin.com>; Simek, Michal
> > >> <michal.simek@amd.com>
> > >> Cc: linux-rtc@vger.kernel.org; linux-arm-kernel@lists.infradead.org;
> > >> linux- kernel@vger.kernel.org; Tomas Melin <tomas.melin@vaisala.com>
> > >> Subject: [PATCH 2/4] rtc: zynqmp: rework read_offset
> > >>
> > >> Caution: This message originated from an External Source. Use proper
> > >> caution when opening attachments, clicking links, or responding.
> > >>
> > >>
> > >> read_offset() was using static frequency for determining the tick
> > >> offset. It was also using remainder from do_div() operation as
> > >> tick_mult value which caused the offset to be incorrect.
> > >>
> > >> At the same time, rework function to improve readability.
> > >>
> > >> Signed-off-by: Tomas Melin <tomas.melin@vaisala.com>
> > >> ---
> > >>  drivers/rtc/rtc-zynqmp.c | 25 ++++++++++++++++---------
> > >>  1 file changed, 16 insertions(+), 9 deletions(-)
> > >>
> > >> diff --git a/drivers/rtc/rtc-zynqmp.c b/drivers/rtc/rtc-zynqmp.c
> > >> index
> > >>
> > 856bc1678e7d31144f320ae9f75fc58c742a2a64..7af5f6f99538f961a53ff56
> > bfc6
> > >> 56c907611b900 100644
> > >> --- a/drivers/rtc/rtc-zynqmp.c
> > >> +++ b/drivers/rtc/rtc-zynqmp.c
> > >> @@ -178,21 +178,28 @@ static void xlnx_init_rtc(struct xlnx_rtc_dev
> > >> *xrtcdev)  static int xlnx_rtc_read_offset(struct device *dev, long *offset)  {
> > >>         struct xlnx_rtc_dev *xrtcdev = dev_get_drvdata(dev);
> > >> -       unsigned long long rtc_ppb = RTC_PPB;
> > >> -       unsigned int tick_mult = do_div(rtc_ppb, xrtcdev->freq);
> > >> -       unsigned int calibval;
> > >> +       unsigned int calibval, fract_data, fract_part;
> > > Prefer one variable assignment per line for readability.
> > This is after all quite common practice, and in a function like this where several
> > variables are needed, I would argue that this is more readable than the
> > alternative. Is there some convention I'm not aware of?
> There is no such mandatory convention. It's up to the RTC maintainer.

I don't mind having multiple variable declarations on a single line.



-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

