Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04F721091930
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Mar 2026 23:09:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NKUVlIfc0qkwHuqbrR8sv7WbUFqet8dqF98h+KSc2Ws=; b=D1KAAJMzHUHjWdG1HW08/zWup1
	hkz103HG7D2uIR78rRglccgdi6RgBXlR+JaSGgIrb0R03BkvIFvn2RUxv1mzoFhgTNUIzCRyNL/kV
	A7teQQGp8jMn9qnYw0VG8iS6vQnVGfu7fV0WuPn5KVC1XU0kpfSTjhZZAWSU+tnhpw9og3uEA0hY9
	xZTvjO/iWSOUZDsMxZPUpfrrueYBeF25AU796jvBot39CkEGvEkzkYwZkaDxYiAMKT/q4HBXouqPg
	ZmwyyYQpp5m61xTmv7ieNdUYaGIEPYv3Bxu+ID5C3d4N3L06yuujYR+4SDg62tcEIVFIC3NLSiaZP
	/BjvsKrA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3MUn-0000000BmGE-1ajY;
	Thu, 19 Mar 2026 23:09:41 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3MUk-0000000BmFt-1Ivv
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Mar 2026 23:09:39 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id AD8DD40838;
	Thu, 19 Mar 2026 23:09:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C6710C19424;
	Thu, 19 Mar 2026 23:09:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773961777;
	bh=+j3zMyv1kxkRvoPAXUMnrI8opptFe1VkIiWcvT9/Kjc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=P0gfAE1ZAXC9c867TKb2BGxFt6eYxeBZFxR7WyaQMtcGfpnCBy2eEUsk7tHP6eKPI
	 MW1Rp1+HWE2KgX8Gtq4v6m060MSF0dsjTNhUUtER0TVRRA8qei7+2tRgjF1ITUka92
	 gTrd7abcd1KJUlHy329Diby5edoHkIQCLndZy3av6UVndoqbsZC8YBOWwJHfuAgI6l
	 Ood2kUt+XCZDWeE19mSGJyxP/Xt10LcUlpB9iegiCOKlcdlPy6FQmEs7hBh1Wqf3Hg
	 Hd6gHrqL0KI6DR+y5V6fzksmSD8om5LR33MJc4//Z2C8WAZlrQK7RqtSPbYmgUuXL+
	 urWI6B4cKLGGw==
Date: Fri, 20 Mar 2026 00:09:32 +0100
From: Andi Shyti <andi.shyti@kernel.org>
To: Carlos Song <carlos.song@nxp.com>
Cc: Frank Li <frank.li@nxp.com>, Stefan Eichenberger <eichest@gmail.com>, 
	"o.rempel@pengutronix.de" <o.rempel@pengutronix.de>, "kernel@pengutronix.de" <kernel@pengutronix.de>, 
	"s.hauer@pengutronix.de" <s.hauer@pengutronix.de>, "festevam@gmail.com" <festevam@gmail.com>, 
	"stefan.eichenberger@toradex.com" <stefan.eichenberger@toradex.com>, Francesco Dolcini <francesco.dolcini@toradex.com>, 
	"linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>, "imx@lists.linux.dev" <imx@lists.linux.dev>, 
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"stable@vger.kernel.org" <stable@vger.kernel.org>
Subject: Re: [PATCH v1 2/2] i2c: imx: ensure no clock is generated after last
 read
Message-ID: <abyBxAvJcMshvB7G@zenone.zhora.eu>
References: <20260218150940.131354-1-eichest@gmail.com>
 <20260218150940.131354-3-eichest@gmail.com>
 <aZXoTGK_v3L4pc-E@lizhi-Precision-Tower-5810>
 <aZXq4gn4xhInQQlq@eichest-laptop>
 <aaamYByn9dZEIBWb@eichest-laptop>
 <aacECsJ6O8QjHsUa@lizhi-Precision-Tower-5810>
 <PAWPR04MB9960F0118ACC092BCAAB0142E87CA@PAWPR04MB9960.eurprd04.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <PAWPR04MB9960F0118ACC092BCAAB0142E87CA@PAWPR04MB9960.eurprd04.prod.outlook.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260319_160938_398706_922EF8BA 
X-CRM114-Status: GOOD (  23.09  )
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

> > > > > > When reading from the I2DR register, right after releasing the
> > > > > > bus by clearing MSTA and MTX, the I2C controller might still
> > > > > > generate an additional clock cycle which can cause devices to
> > > > > > misbehave. Ensure to
> > > > >
> > > > > Do you means SCL have additional toggle? You capture waveform?
> > > > >
> > > >
> > > > Yes exactly. We were able to capture the waveform when the issue
> > > > happens. It doesn't always happen though, it depends on how much
> > > > time passes between clearing MSTA and MTX and reading from I2DR.
> > > >
> > > > If you want to see the waveform, I uploaded it to our server:
> > > > https://share.toradex.com/dwnhcrl6b9toib6
> > > > You can see the additional clock at the right end, after "0x17 + NAK".
> > >
> > > Have you had a chance to look at the waveform? Do you have any
> > > concerns about the proposed solution?
> > 
> > I am fine. Add carlos, who did many work about I2C.
> > 
> > Frank
> 
> Hi, 
> 
> Just review this series, looks this series patch make this fix for the limitation[1] safer:
> "It must generate STOP before read I2DR to prevent controller from generating another clock cycle".
> 
> Previous patch[2] has done this to avoid the limitation. However according to the waveform, I2C controller still generated an additional clock cycle sometime.
> 
> The key of patch is ensure to read the last bytes after the bus is not busy anymore to avoid this another clock cycle.So these patches are fine to me also.
> 
> [1] 054b62d9f25c ("i2c: imx: fix the i2c bus hang issue when do repeat restart")
> [2] 5f5c2d4579ca ("i2c: imx: prevent rescheduling in non dma mode")

Sorry, I'm not understanding your point here. Are you suggesting
to change the Fixes tag to [1]?

Thanks,
Andi

