Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46FB3C44508
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Jul 2026 12:53:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xEwViipQaJZVXM9xLdF3SH6nxkka6iIr7lgTdrGkvYI=; b=RG07TDlOBESInVkaBWl0nctmDf
	cfM3d4gwJqgZRjF6YdaA5cGg6pbkoQvRBUXB8sPxRUg9g40KuXdfong0c7Bsfb+fB+G/kH3tpg8oI
	J60zowgFhK5eS08zY7MdX0KlXez10ryBAxj4LT8rf9XCtaggBEUCmB8lXT3wZh6MVr+Etw+XE/VNA
	Ca33I1KrqFZCC8gLHdk2zfhgH6QsFJ2Uck4JZ3hzsaccN6f07MOmmJR4OIsdIcIiu+s0aBggBM+6z
	5689OjncbLXPY7BXeXpMPPS2+E6HLmHhVYTS3cGpd9ZKh+aAF6QK9edEARsPNa1gSHPTJ0TFH/4zA
	CCGu6YRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjz7A-0000000ErZz-0sqA;
	Wed, 15 Jul 2026 12:53:28 +0000
Received: from mail-43172.protonmail.ch ([185.70.43.172])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjz77-0000000ErYh-1pQ7;
	Wed, 15 Jul 2026 12:53:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=geanix.com;
	s=protonmail3; t=1784119998; x=1784379198;
	bh=xEwViipQaJZVXM9xLdF3SH6nxkka6iIr7lgTdrGkvYI=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:From:To:
	 Cc:Date:Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=Oxj58E8W3hKQZu0gvkYqCUZNpfUbBQ78VVenN6g9RIw4JHwjrEft/SGwCNV63zM7a
	 2Q7xDkapC/pwRDIyAOJX+qhgp7mkaYQ1WRaknqg0zER/f8uics62usPnCFmLtM++hz
	 chlq7llvfrhyONj4ef/FcqTEwPVbOJEW8CHgUmMXqrRzQU9CN4tVdvulv/1XxFgLSu
	 fY64gkXv2/1oav9kvx/MgaFCP/rf2z7oobqsuuBKCEb5kUSI63K81kkyuM6Wggw/H6
	 /+5ORu5ZuFxMRgJD7ayok7sl81etN/EQmzfVHek4fpQ7OP3pU+uq+23iCpjeLRS4kv
	 CMe7pHG2/1yQA==
X-Pm-Submission-Id: 4h0bgw0Q0rz1DFTS
From: Esben Haabendal <esben@geanix.com>
To: Gary Bisson <bisson.gary@gmail.com>
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>,  Philipp Zabel
 <p.zabel@pengutronix.de>,  David Airlie <airlied@gmail.com>,  Simona
 Vetter <simona@ffwll.ch>,  Matthias Brugger <matthias.bgg@gmail.com>,
  AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
  dri-devel@lists.freedesktop.org,  linux-mediatek@lists.infradead.org,
  linux-kernel@vger.kernel.org,  linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] drm/mediatek: mtk_dsi: enable hs clock during pre-enable
In-Reply-To: <20260120-mtkdsi-v1-1-b0f4094f3ac3@gmail.com> (Gary Bisson's
	message of "Tue, 20 Jan 2026 12:36:59 +0100")
References: <20260120-mtkdsi-v1-1-b0f4094f3ac3@gmail.com>
Date: Wed, 15 Jul 2026 14:53:15 +0200
Message-ID: <8733xko1ms.fsf@geanix.com>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260715_055325_625268_279264F0 
X-CRM114-Status: GOOD (  10.36  )
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

Gary Bisson <bisson.gary@gmail.com> writes:

> Some bridges, such as the TI SN65DSI83, require the HS clock to be
> running in order to lock its PLL during its own pre-enable function.
>
> Without this change, the bridge gives the following error:
> sn65dsi83 14-002c: failed to lock PLL, ret=-110
> sn65dsi83 14-002c: Unexpected link status 0x01
> sn65dsi83 14-002c: reset the pipe
>
> Move the necessary functions from enable to pre-enable.
>
> Signed-off-by: Gary Bisson <bisson.gary@gmail.com>

Hi

I have run into the same problem, but in combination with another
pipeline. I am seeing same problem with an i.MX8 using the nwl-dsi
bridge and the dcss driver.

I have submitted a fix that adresses the problem in the ti-sn65dsi83
driver instead. With a bit of luck, it can replace the fix proposed in
this thread.

See https://lore.kernel.org/all/20260711-ti-sn65dsi83-fixes-v1-2-d85eb5342b98@geanix.com/

/Esben

