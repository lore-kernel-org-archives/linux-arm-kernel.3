Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF4C3C3600B
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 28 Mar 2025 02:08:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:Content-Type:
	In-Reply-To:MIME-Version:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=D8IpMw/PyIwlTASHtAtNiOFtZWIT38Af/vEjjwwVgSo=; b=EFqYpk5IcaoPvZHVHpB1KQwr3/
	sBSgNgWK48P5IlF6Gmc6Vvj+vsBlxwk6nOnQ0AA/8lWKQdIr+Ay/K02STeFjWwv7zEb2/HNR/UNYN
	rPYtZdr47odqiIktQcMTuddeRvb2PnC4Eywj+K6Xm3klKN01am/XCmhPcLzA3Os6oF8zRuzJo9blv
	CBwXf9L6A+xuKQDzGEVtyHEt8NM1AReQHiS5nKySnlNpPDix+beBPmautCGTlAhQUKkdFmokMs7jn
	Q25mCaAwp8k3fVehN2q4KZp4RLocP2v9TK4PkdpHkOFdTnQm5Qi6eIBfskKNes/TFvdXK7lLhFd+b
	YNbBddoA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txz8r-0000000COPQ-2KMU;
	Fri, 28 Mar 2025 02:08:17 +0000
Received: from mailout2.samsung.com ([203.254.224.25])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txz76-0000000COEp-3mE1
	for linux-arm-kernel@lists.infradead.org;
	Fri, 28 Mar 2025 02:06:31 +0000
Received: from epcas2p2.samsung.com (unknown [182.195.41.54])
	by mailout2.samsung.com (KnoxPortal) with ESMTP id 20250328020621epoutp02c3ae101a97b7ca13bafe6732b3821d42~w1UzZLdCJ0549005490epoutp02W
	for <linux-arm-kernel@lists.infradead.org>; Fri, 28 Mar 2025 02:06:21 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.samsung.com 20250328020621epoutp02c3ae101a97b7ca13bafe6732b3821d42~w1UzZLdCJ0549005490epoutp02W
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1743127581;
	bh=D8IpMw/PyIwlTASHtAtNiOFtZWIT38Af/vEjjwwVgSo=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=JFouIk4rZU/NFwW5KTmkK2UXWnA8GlO1sKgkUstgRK3ZLTKvgH9BpqzQwvwjNuBr6
	 hExgcTtkfU3efJC4bWcmPJ4vSuUa6yVUKXHVElqtpwLR4gCaIjq2yL/HEIBwF3cwVR
	 yTt491e05xBFIY2CM1VCWIMM4N9RXeA0NLYoKc4A=
Received: from epsnrtp02.localdomain (unknown [182.195.42.154]) by
	epcas2p2.samsung.com (KnoxPortal) with ESMTPS id
	20250328020621epcas2p223d58a4b9a9d85182af94a710f902642~w1UyyTDGQ3118231182epcas2p2Y;
	Fri, 28 Mar 2025 02:06:21 +0000 (GMT)
Received: from epsmgec2p1-new.samsung.com (unknown [182.195.36.97]) by
	epsnrtp02.localdomain (Postfix) with ESMTP id 4ZP3mD3BjFz2SSKr; Fri, 28 Mar
	2025 02:06:20 +0000 (GMT)
Received: from epcas2p3.samsung.com ( [182.195.41.55]) by
	epsmgec2p1-new.samsung.com (Symantec Messaging Gateway) with SMTP id
	27.A9.37303.C1406E76; Fri, 28 Mar 2025 11:06:20 +0900 (KST)
Received: from epsmtrp1.samsung.com (unknown [182.195.40.13]) by
	epcas2p1.samsung.com (KnoxPortal) with ESMTPA id
	20250328020619epcas2p1c707663a67650439381b03b6b4924408~w1Uxnh5kJ3055030550epcas2p1Z;
	Fri, 28 Mar 2025 02:06:19 +0000 (GMT)
Received: from epsmgmcp1.samsung.com (unknown [182.195.42.82]) by
	epsmtrp1.samsung.com (KnoxPortal) with ESMTP id
	20250328020619epsmtrp126fa2492984a4728a3a12af699f26119~w1UxmsGqh0662506625epsmtrp1Y;
	Fri, 28 Mar 2025 02:06:19 +0000 (GMT)
X-AuditID: b6c32a4d-54ffe700000091b7-52-67e6041ccfbd
Received: from epsmtip1.samsung.com ( [182.195.34.30]) by
	epsmgmcp1.samsung.com (Symantec Messaging Gateway) with SMTP id
	A7.4D.19478.B1406E76; Fri, 28 Mar 2025 11:06:19 +0900 (KST)
Received: from perf (unknown [10.229.95.91]) by epsmtip1.samsung.com
	(KnoxPortal) with ESMTPA id
	20250328020619epsmtip1c07d1737776bf524099b48b17a1cbb37~w1UxY0UMf1455014550epsmtip1S;
	Fri, 28 Mar 2025 02:06:19 +0000 (GMT)
Date: Fri, 28 Mar 2025 11:10:33 +0900
From: Youngmin Nam <youngmin.nam@samsung.com>
To: Marc Zyngier <maz@kernel.org>
Cc: Thomas Gleixner <tglx@linutronix.de>, Saravana Kannan
	<saravanak@google.com>, Ulf Hansson <ulf.hansson@linaro.org>, Vincent
	Guittot <vincent.guittot@linaro.org>, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, kernel-team@android.com,
	hajun.sung@samsung.com, d7271.choe@samsung.com, joonki.min@samsung.com,
	Youngmin Nam <youngmin.nam@samsung.com>
Subject: Re: [GICv3 ITS]S2IDLE framework does not invoke syscore_ops in
 GICv3 ITS driver
Message-ID: <Z+YFGd/wbJ4kuxhB@perf>
MIME-Version: 1.0
In-Reply-To: <86v7rulw2d.wl-maz@kernel.org>
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrLJsWRmVeSWpSXmKPExsWy7bCmua4My7N0gxf7xCyu7Z3IbtG0/xKz
	xdXd75gtdmwXsdj0+BqrxeVdc9gsds45yWrRdegvm8XmTVOZLY6vDbfoOPKN2WLxgU/sDjwe
	23ZvY/VYsKnUY9OqTjaPO9f2sHm8O3eO3WPzknqPvi2rGD0+b5IL4IjKtslITUxJLVJIzUvO
	T8nMS7dV8g6Od443NTMw1DW0tDBXUshLzE21VXLxCdB1y8wBOlVJoSwxpxQoFJBYXKykb2dT
	lF9akqqQkV9cYquUWpCSU2BeoFecmFtcmpeul5daYmVoYGBkClSYkJ2x/uVT9oJH0hVzNy9l
	b2B8LNrFyMkhIWAi0byulQXEFhLYwyjxb589hP2JUeLWYZ8uRi4I+9zrH6wwDT1vLzNDJHYy
	Sqz7+4MNwnnIKPHgyyawKhYBVYmbJ9vBxrIJ6EpsO/GPEcQWEVCU+HThJCNIA7PAHyaJd2c3
	sncxcnAIC0RJPG6PA6nhFVCWuPvvFhOELShxcuYTsDmcAtoSV74+YQLplRBYyyHxsWk/E0iv
	hICLxMlpWhDXCUu8Or6FHcKWknjZ3wZlF0s03L/FDNHbwihx6voLZoiEscSsZ+1gxzELZEhc
	O/CZDWKmssSRWywQYT6JjsN/2SHCvBIdbUIQnWoSv6ZsYISwZSR2L14BNdFDovVrCxMkTM4z
	SuztP840gVFuFpJ3ZiHZNgtoLLOApsT6XfoQYXmJ5q2zmSHC0hLL/3EgqVjAyLaKUSq1oDg3
	PTXZqMBQNy+1HB7dyfm5mxjB6VjLdwfj6/V/9Q4xMnEwHmKU4GBWEuGVvPIkXYg3JbGyKrUo
	P76oNCe1+BCjKTCqJjJLiSbnAzNCXkm8oYmlgYmZmaG5kamBuZI476GPT9OFBNITS1KzU1ML
	Uotg+pg4OKUamCZnBpnr/m2cpXaoISE8Jmme12E1w5raee8jrkX90b6uyrpBI7FdLeZu4cwT
	x6coVM46cOlW7Zu3G/3NhN2PFmxvUXdcfsm9tfdiS/3joOjzExLu/38hl6h1VcjcvWnyVjbX
	bb3vu//L64VKqjyu6WL1ObBVweyVfX1jWs03gV3lWRuVffd8tnpp6RhfHrd5i6utzOsDJdtC
	QovSD322E4z+eu1lS3Oue/N51ymq8o+TyyvfTepzncDzSsGy6tyNVQ/blgeV8RyK3hKpxCbT
	EB31Q1Haq9655WzK1gNlU+4n3Ux7cPvNirLk01udIrUmSb6SuS1+wqHLbU3g0aDtXBE9S2Yl
	6Z44Xnv35JIYJZbijERDLeai4kQAO6vv5FAEAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFupkkeLIzCtJLcpLzFFi42LZdlhJTlea5Vm6wcIpBhbX9k5kt2jaf4nZ
	4urud8wWO7aLWGx6fI3V4vKuOWwWO+ecZLXoOvSXzWLzpqnMFsfXhlt0HPnGbLH4wCd2Bx6P
	bbu3sXos2FTqsWlVJ5vHnWt72DzenTvH7rF5Sb1H35ZVjB6fN8kFcERx2aSk5mSWpRbp2yVw
	Zax738Ze0CJZcarNqYFxoXAXIyeHhICJRM/by8xdjFwcQgLbGSV+7PvPDJGQkbi98jIrhC0s
	cb/lCJgtJHCfUeLM5CwQm0VAVeLmyXYWEJtNQFdi24l/jCC2iICixKcLJxlBhjILNDBLTPs9
	FaxIWCBKYs/baUwgNq+AssTdf7eYIDZfZpSY+GwXVEJQ4uTMJ2ANzALqEn/mXQK6iAPIlpZY
	/o8DIiwv0bx1NtihnALaEle+PmGawCg4C0n3LCTdsxC6ZyHpXsDIsopRNLWgODc9N7nAUK84
	Mbe4NC9dLzk/dxMjOLa0gnYwLlv/V+8QIxMH4yFGCQ5mJRFeyStP0oV4UxIrq1KL8uOLSnNS
	iw8xSnOwKInzKud0pggJpCeWpGanphakFsFkmTg4pRqYxBqiktX2+azr1Fy082Wrw7rPeUnT
	1785qt0vbLLzvPDp337WNVZr7/0M3yhU7bCr5eDP6qtGr+rWWmY/j2Ferv3h4Dd2C3VpJbGX
	YfWPmne0n1vAdNGzXCzrq8WRusXXJsl8/zw/hNXqBafkV6VLnnMfXvnL3HnmxKubByZskt3w
	4pLoJYuiEwFeeUq77pZxadkbVcVsko54uFNYo9YmRVJAOsqa/bXsg2fMZdIKBZ+uKF3pSVaa
	J+/wrJ3v6r6LSvVmjAXXHDfJd3FveByWtYk5von9l+LfHVNt2gKCWa9qTmEwNI34/0Y+eG6C
	vUXlCacthhflHjW4zAmYHnQyRj3kZcramblbhFeFMssosRRnJBpqMRcVJwIA63VLIhwDAAA=
X-CMS-MailID: 20250328020619epcas2p1c707663a67650439381b03b6b4924408
X-Msg-Generator: CA
Content-Type: multipart/mixed;
	boundary="-----xErIy8MFyp5znNcbVfGOYxfVuB8z5fzEV-ls754GuccR_q1=_4071c_"
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250326030527epcas2p33aa30e62cc8a00c9e151c35bee71dac5
References: <CGME20250326030527epcas2p33aa30e62cc8a00c9e151c35bee71dac5@epcas2p3.samsung.com>
	<Z+Nv8U/4P3taDpUq@perf> <8634f0mall.wl-maz@kernel.org>
	<Z+TEa8CVAYnbD/Tu@perf> <86v7rulw2d.wl-maz@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250327_190629_576470_9D62472F 
X-CRM114-Status: GOOD (  42.69  )
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

-------xErIy8MFyp5znNcbVfGOYxfVuB8z5fzEV-ls754GuccR_q1=_4071c_
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Content-Disposition: inline

On Thu, Mar 27, 2025 at 08:25:14AM +0000, Marc Zyngier wrote:
> On Thu, 27 Mar 2025 03:22:19 +0000,
> Youngmin Nam <youngmin.nam@samsung.com> wrote:
> > 
> > [1  <text/plain; utf-8 (8bit)>]
> > On Wed, Mar 26, 2025 at 08:59:02AM +0000, Marc Zyngier wrote:
> > > On Wed, 26 Mar 2025 03:09:37 +0000,
> > > Youngmin Nam <youngmin.nam@samsung.com> wrote:
> > > > 
> > > > Hi.
> > > > 
> > > > On our SoC, we are using S2IDLE instead of S2R as a system suspend mode.
> > > > However, when I try to enable ARM GICv3 ITS driver (drivers/irqchip/irq-gic-v3-its.c),
> > > > I noticed that there is no proper way to invoke suspend/resume callback,
> > > > because it only uses syscore_ops, which is not called in an s2idle scenario.
> > > 
> > > This is *by design*.
> 
> [...]
> 
> > > > How should we handle this situation ?
> > > 
> > > By implementing anything related to GIC power-management in your EL3
> > > firmware. Only your firmware knows whether you are going into a state
> > > where the GIC (and the ITS) is going to lose its state (because power
> > > is going to be removed) or if the sleep period is short enough that
> > > you can come back from idle without loss of context.
> > > 
> > > Furthermore, there is a lot of things that non-secure cannot do when
> > > it comes to GIC power management (most the controls are secure only),
> > > so it is pretty clear that the kernel is the wrong place for this.
> > > 
> > > I'd suggest you look at what TF-A provides, because this is not
> > > exactly a new problem (it has been solved several years ago).
> > > 
> > > 	M.
> > > 
> > > -- 
> > > Without deviation from the norm, progress is not possible.
> > > 
> > 
> > Hi Marc,
> > 
> > First of all, I’d like to distinguish between the GICv3 driver (irq-gic-v3.c)
> > and the ITS driver (irq-gic-v3-its.c).
> > 
> > I now understand why the GICv3 driver doesn’t implement suspend and resume functions.
> > However, unlike the GICv3 driver, the ITS driver currently provides
> > suspend and resume functions via syscore_ops in the kernel.
> 
> For *suspend*. The real suspend. Not a glorified WFI. And that's only
> for situations where we know for sure that we are going to suspend.
> 
> > And AFAIK, LPIs are always treated as non-secure. (Please correct me If I'm wrong).
> > 
> > The problem is that syscore_ops is not invoked during the S2IDLE scenario,
> > so we cannot rely on it in that context.
> > We would like to use these suspend/resume functions during S2IDLE as well.
> 
> Again, this is *by design*. There is no semantic difference between
> s2idle and normal idle. They are the same thing. Do you really want to
> save/restore the whole ITS state on each and every call into idle?
> Absolutely not.
> 
> Only your firmware knows how deep you will be suspended, and how long
> you will be suspended for, and this is the right place for to perform
> save/restore of the ITS state. Not in generic code that runs on every
> arm64 platform on the planet.
> 
> 	M.

Thank you for the clear explanation. I completely understand now.

> 
> -- 
> Without deviation from the norm, progress is not possible.
> 

-------xErIy8MFyp5znNcbVfGOYxfVuB8z5fzEV-ls754GuccR_q1=_4071c_
Content-Type: text/plain; charset="utf-8"


-------xErIy8MFyp5znNcbVfGOYxfVuB8z5fzEV-ls754GuccR_q1=_4071c_--

