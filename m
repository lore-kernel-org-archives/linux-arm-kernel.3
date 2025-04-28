Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E265C369D5
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Apr 2025 19:19:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ouAMR0mGNfIQVg2S9MotdJShNkUBuJY/DR185B5BNZ4=; b=OtIj3dRvOQfgCEP7gW8I3Vcz56
	m85sqLEqme+F4zUxBkjyfgtTS02Vo8HLAVg4TGTlHsTvXgLVAUGk5NTdaSEEigRSQFN4QPajZ0fLe
	9/B9FhmAzOXI8yYMXSEzaqYH6+xfymO7lDuhB5xEwixu1+mAP1SSqBPnOKtiMAx9vncUq6uY/EOKv
	vu6+JtxSCfw868QseQcKydBmk/LIujPYUZsuMaaHt2lF2ov7zq4+dYHHxfysPPr+u8jbT5U0ceL0P
	udDvKVK4KqS9wECO7p4b7p97mCF+k7rfTiX4y51txL/4sd7qRQKybdP8AkT6iPyj0dD5SGc1YwfkI
	XNgKXK6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9U0s-00000007K0J-2NcM;
	Mon, 28 Apr 2025 19:19:34 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9Tyc-00000007JjY-0VEy
	for linux-arm-kernel@lists.infradead.org;
	Mon, 28 Apr 2025 19:17:15 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id A345243600;
	Mon, 28 Apr 2025 19:17:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1554BC4CEE4;
	Mon, 28 Apr 2025 19:17:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745867833;
	bh=+Pt11UMRuRnTvhbLia21GdJOsV7PGpiNDBc9vcqLQvI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=aSRI3GkUAhCCiZj0WUU80xHJQT+SghGms4KZcVH/xrqsDa1/Gu/BIzMPU1MfKWyTd
	 IjheCLi4QmgirILEewftqYgZDqgwKZnSvLDLfog3cgvYiXvKQXWVE36+MQ8AgLpvlA
	 HI4AQ0AYcXl3ZCWySwGV6Nxi2T/+6nSlzjimx29GiWwtyEW2xaE5zEphUfBzaz0/jD
	 vhTPFJemxn5ql1wx52r3vsuMEG1klAv2Trw5xbcw7+GCBw0SGebkN+tytD5MzibpTx
	 DnqstA4gBIlT+tu7lMOvgb9z7nWMMWEq6eM3P1yW4UHf8NbF1FYAud3qF0d8hA3tf/
	 NdwEuMBJS4kTw==
Date: Mon, 28 Apr 2025 21:17:09 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: Carlos Song <carlos.song@nxp.com>
Cc: Aisheng Dong <aisheng.dong@nxp.com>, Frank Li <frank.li@nxp.com>, 
	"shawnguo@kernel.org" <shawnguo@kernel.org>, "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>, 
	"kernel@pengutronix.de" <kernel@pengutronix.de>, "festevam@gmail.com" <festevam@gmail.com>, 
	"linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>, "imx@lists.linux.dev" <imx@lists.linux.dev>, 
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] i2c: imx-lpi2c: Fix clock count when probe defers
Message-ID: <l7meopd4ny4lbux64w5jgyugza3idt4sabwzojmvrafw67fhsw@uf4xbbajzfrj>
References: <20250421062341.2471922-1-carlos.song@nxp.com>
 <34ally74jbpae6etevqskr4zmcv5xyac46n4hl2j5ybihwtezn@jd2gvr762gs7>
 <VI2PR04MB111474EAC1B4DB8EB6DD32628E8862@VI2PR04MB11147.eurprd04.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <VI2PR04MB111474EAC1B4DB8EB6DD32628E8862@VI2PR04MB11147.eurprd04.prod.outlook.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250428_121714_201410_4DB07C27 
X-CRM114-Status: GOOD (  17.00  )
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

> rpm_disable:
> 	pm_runtime_put(&pdev->dev);
> 	pm_runtime_disable(&pdev->dev);
> 	pm_runtime_dont_use_autosuspend(&pdev->dev);
> 
> pm_runtime_put() may not work really sometimes.
> 
> [    3.203715] imx-lpi2c 42530000.i2c: defer probe
> [    3.208324] imx-lpi2c 42530000.i2c: lpi2c_runtime_suspend
> [    3.214801] imx-lpi2c 42540000.i2c: defer probe
> ---> (No lpi2c_runtime_suspend callback(pm_runtime_put() is not really wrok))
> [    3.220672] imx-lpi2c 426c0000.i2c: defer probe
> [    3.225248] imx-lpi2c 426c0000.i2c: lpi2c_runtime_suspend
> 
> After apply this change:
> rpm_disable:
> 	pm_runtime_dont_use_autosuspend(&pdev->dev);
> 	pm_runtime_put_sync(&pdev->dev);
> 	pm_runtime_disable(&pdev->dev);
> 
> all issues gone.
> [    3.093025] imx-lpi2c 42530000.i2c: defer probe
> [    3.097592] imx-lpi2c 42530000.i2c: lpi2c_runtime_suspend
> [    3.104281] imx-lpi2c 42540000.i2c: defer probe
> [    3.108858] imx-lpi2c 42540000.i2c: lpi2c_runtime_suspend
> [    3.115278] imx-lpi2c 426c0000.i2c: defer probe
> [    3.119818] imx-lpi2c 426c0000.i2c: lpi2c_runtime_suspend

Thanks for the explanation. If we lose the count here, I think we
also need for the Fixes tag, do you agree? Should we add:

Fixes: 13d6eb20fc79 ("i2c: imx-lpi2c: add runtime pm support")
Cc: <stable@vger.kernel.org> # v4.16+

as well?

...

> > > Signed-off-by: Carlos Song <carlos.song@nxp.com>
> > > Signed-off-by: Clark Wang <xiaoning.wang@nxp.com>
> > > Signed-off-by: Jun Li <jun.li@nxp.com>
> > > Signed-off-by: Haibo Chen <haibo.chen@nxp.com>
> > 
> > Carlo's SoB should be at the end of the chain. Should be nice to know what these
> > are, though, are they co-developed-by? tested-by?
> > Why so many SoB's?
> > 
> 
> This patch author is not me and they meet similar issue at some boards(Vague history), now
> I meet this issue at new SOC again. I think this local patch is helpful and looks reasonable.
> So I send the patch to community adding my SoB.

So Clark has authored the patch and you have sent it. And your
SoB makes sense (even though, your SoB shoud be placed at the
end, because you sent the patch).

Juan and Haibo have tested it? Reported it?

A practical rule of thumb for tags is that they are placed in
chronological order, e.g.:

 Reported-by: <reporter of the bug>
 Fixes: <commit that introduced the bug>
 Closes: <link where the bug has been reported>
 Co-developed-by: <co-developer>
 Signed-off-by: <co-developer>
 Signed-off-by: <developer>
 Cc: <people who should be aware of the patch>
 Tested-by: <tester>
 Reviewed-by: <reviewer>
 Acked-by: <someone who agrees>
 Signed-off-by: <patch sender>
 Link: <lore link>
 Signed-off-by: <maintainer who applies the patch>

If you notice, more or less things are in chronological order. I
hope this makes it a bit clearer.

Andi

