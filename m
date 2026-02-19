Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D928E9A051
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Feb 2026 16:51:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:From:
	To:Cc:Subject:Message-Id:Date:Content-Type:Content-Transfer-Encoding:
	Mime-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KtWJUFwr2nejLGtWeMnXg73B+n8sSCwVl1nqee/L/AE=; b=zlRB2+GPjpICmpodP0hPmnNvzU
	BgQhYFgv1Hc4xiTdKZ+p6Yde8EssjmNPS30hHoARkxN+1Aq+sskALYppKbX8lqRQLeXarN3a0UMAE
	AuWA/ADskLCz81HZJ7vys6puASvcmg2swla8h+nOeVNd1zP8MW5kl2YC3gegvXtik2L15rfRmgQcS
	a2dNK7WzfJvhjZxWUdfNZXASQF8ZuQ62oGI1c9urhmzlWNms2oGK7CBRiM6B8biX2rTZ1xWdSQEGl
	+61wH63yqlzPrVXJQQ/SoIpOeBicrFQjl/lkq0kt73MClDkUi3owJnhN4QTDcUqvWdYFhccstAlJo
	RGWksIfQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vt7FR-0000000Bed7-2Esv;
	Thu, 19 Feb 2026 16:51:29 +0000
Received: from smtpout-04.galae.net ([185.171.202.116])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vt7FN-0000000BecU-3pOx;
	Thu, 19 Feb 2026 16:51:29 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 66CE6C2F4F6;
	Thu, 19 Feb 2026 16:51:33 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id DD6DD5FA72;
	Thu, 19 Feb 2026 16:51:20 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 02A3810368C89;
	Thu, 19 Feb 2026 17:51:14 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1771519880; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=KtWJUFwr2nejLGtWeMnXg73B+n8sSCwVl1nqee/L/AE=;
	b=emtHyDpfSn0flo7E/zC9a7V+yot9ZrKtLFqruZ5xew9UH6/ln5wq1OuzAPYQwdOIxuGiHe
	D2nzLEMxgwWQNLHvzGw9ixeEtY5HqSEc+O+MWR8eKEV5HTgGWBJ36X2oqHlo4ZTN+QPNzw
	HxAFPmnv7P/U2jkK25lI1LBfajwlm5POrE3OcJSASiWAPgS2McXGoJHa3GKfRp05Ek+b44
	6/NhetLuCM8D7Usm6fjGtvZXDqprcw3FTXaKphcjkubAdOofDlDW5ON+4TtVMbEZJXeofT
	3RTx/ElcBrj5Hw4kjVdt2eg2F8lXoGlYsq3bB5SRj/nrp3aRlp17exxC3kopPw==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 19 Feb 2026 17:51:13 +0100
Message-Id: <DGJ3DV155EFE.143J88CZKWBN4@bootlin.com>
Subject: Re: [PATCH] ASoC: rockchip: i2s-tdm: Use param rate if not provided
 by set_sysclk
Cc: "Nicolas Frattaroli" <frattaroli.nicolas@gmail.com>, "Liam Girdwood"
 <lgirdwood@gmail.com>, "Mark Brown" <broonie@kernel.org>, "Jaroslav Kysela"
 <perex@perex.cz>, "Takashi Iwai" <tiwai@suse.com>, "Heiko Stuebner"
 <heiko@sntech.de>, <linux-rockchip@lists.infradead.org>,
 <linux-sound@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <kernel@collabora.com>, "Alexandre Belloni"
 <alexandre.belloni@bootlin.com>, "Thomas Petazzoni"
 <thomas.petazzoni@bootlin.com>
To: "Detlev Casanova" <detlev.casanova@collabora.com>,
 <linux-kernel@vger.kernel.org>
From: "Luca Ceresoli" <luca.ceresoli@bootlin.com>
X-Mailer: aerc 0.20.1
References: <20260218201834.924358-1-detlev.casanova@collabora.com>
 <a024ba9c-f2d3-4bba-93d3-33c0d0bd868b@collabora.com>
In-Reply-To: <a024ba9c-f2d3-4bba-93d3-33c0d0bd868b@collabora.com>
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260219_085126_386505_F5935A3C 
X-CRM114-Status: UNSURE (   9.32  )
X-CRM114-Notice: Please train this message.
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

Hello Detlev, all,

On Wed Feb 18, 2026 at 10:02 PM CET, Detlev Casanova wrote:
> Hi,
>
> This could also use a
>
> Reported-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
>
> Luca, feel free to add your Tested-by as well :)

Ouch, too late, patch applied already.

Anyway, it looks correct, but I'm going to triple check in a couple days
and get back in the remote case there is any issue.

Thanks for the responsiveness in sending the fix!

Luca

--
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

