Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB354C369CB
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Apr 2025 08:05:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jTpwhyeLZw/LiUa5cFTAKz2Ck0hhu95u8EopfQy0nVA=; b=fZCNXn83P78MCbYqMrCwNucXyw
	9i4OKwtu1NbggE6LPU5GaWTsMuXzA52NXkoszArcUhrFSlclS3/92wKwdaxc3EvKqjwd0XSNaXeYp
	8hJAl+4Sr5bTkzqlYLYuyNZJTti40hxjAZc7gt8KZKWEl1MXuwwkr91Stxj5VwKR9Ri05eoZobJkC
	S+5/19mB/EcwJSia93zw9YXURdA/sN3m9goByt5+YvDJ6mHnZJTtR2N2sQ4BGBgZLkMQRGRk/t7+j
	g457IUAIrHd37h0mUyvNuVdJ9qeNrgT2PjqqkYmag7JS76t035G4e7jX+/RHXWV1wdZsJ912a7drs
	8Cau7eQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9fxz-00000008rAV-0FCD;
	Tue, 29 Apr 2025 08:05:23 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9fuG-00000008qdi-0VIF
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Apr 2025 08:01:33 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id B0A4B4381A;
	Tue, 29 Apr 2025 08:01:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0F4A2C4CEE3;
	Tue, 29 Apr 2025 08:01:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745913691;
	bh=49svtWM+2GeOt+mimbaMb6SDg+mNR+ZgQRqnV3/67CE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=FvUVuPtxmt/mfErMJF541vpOKveOI7HD+7wWkMP+fH1HS9XJX/eugU1TXt9zxbE5g
	 D90PH3yLExF91XqvbvpKqLWqQVY4QcMzGi5C9pKvdzkjcE/8CaUkaI4Xlvq2jGTp7O
	 zyi7og9KJ30uEeL2Zyua1egy75nVGl7ZqlCC7x6+09gK8Tjo1y/6cBDTHbFdpYkUA4
	 QdH8rotxb6aXpotf0PKObw6CXIaqcyIVmhBev5Oj1AfYxz5RZk0zj2C9ZihOlXbYjF
	 4gii7N0uda7o0M5lPeOnP/Wtr6AeuApalcy6jBiTdci5WDDEGGam6w5UJiD4U4C0MF
	 A1dy3m0ZmB0Aw==
Date: Tue, 29 Apr 2025 10:01:27 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: Carlos Song <carlos.song@nxp.com>
Cc: Aisheng Dong <aisheng.dong@nxp.com>, Frank Li <frank.li@nxp.com>, 
	"shawnguo@kernel.org" <shawnguo@kernel.org>, "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>, 
	"kernel@pengutronix.de" <kernel@pengutronix.de>, "festevam@gmail.com" <festevam@gmail.com>, 
	"linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>, "imx@lists.linux.dev" <imx@lists.linux.dev>, 
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] i2c: imx-lpi2c: Fix clock count when probe defers
Message-ID: <yk4jxzsraqacrzinn34bvpalmnqxfyxrxch7buz62olt6allcx@rqda6tysnbhh>
References: <20250421062341.2471922-1-carlos.song@nxp.com>
 <34ally74jbpae6etevqskr4zmcv5xyac46n4hl2j5ybihwtezn@jd2gvr762gs7>
 <VI2PR04MB111474EAC1B4DB8EB6DD32628E8862@VI2PR04MB11147.eurprd04.prod.outlook.com>
 <l7meopd4ny4lbux64w5jgyugza3idt4sabwzojmvrafw67fhsw@uf4xbbajzfrj>
 <VI2PR04MB11147FAC0E3941F672ACCA47CE8802@VI2PR04MB11147.eurprd04.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <VI2PR04MB11147FAC0E3941F672ACCA47CE8802@VI2PR04MB11147.eurprd04.prod.outlook.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250429_010132_176536_9C516905 
X-CRM114-Status: GOOD (  20.06  )
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

Hi Carlos,

...

> > > > > Signed-off-by: Carlos Song <carlos.song@nxp.com>
> > > > > Signed-off-by: Clark Wang <xiaoning.wang@nxp.com>
> > > > > Signed-off-by: Jun Li <jun.li@nxp.com>
> > > > > Signed-off-by: Haibo Chen <haibo.chen@nxp.com>
> > > >
> > > > Carlo's SoB should be at the end of the chain. Should be nice to
> > > > know what these are, though, are they co-developed-by? tested-by?
> > > > Why so many SoB's?
> > > >
> > >
> > > This patch author is not me and they meet similar issue at some
> > > boards(Vague history), now I meet this issue at new SOC again. I think this local
> > patch is helpful and looks reasonable.
> > > So I send the patch to community adding my SoB.
> > 
> > So Clark has authored the patch and you have sent it. And your SoB makes sense
> > (even though, your SoB shoud be placed at the end, because you sent the
> > patch).
> > 
> > Juan and Haibo have tested it? Reported it?
> > 
> 
> They are local reviewer. So I change their Reviewed-by: to Signed-off-by:.
> Simply you can remove Jun and Haibo tags only keep two tags:

I see. Jun and Haibo are welcome to review in this list, if they
want.

> Signed-off-by: Carlos Song <carlos.song@nxp.com>
> Signed-off-by: Clark Wang <xiaoning.wang@nxp.com>

Following the chronological order concept, it would be:

Signed-off-by: Clark Wang <xiaoning.wang@nxp.com>
Signed-off-by: Carlos Song <carlos.song@nxp.com>

:-)

I'll take care of it.

Thanks,
Andi

