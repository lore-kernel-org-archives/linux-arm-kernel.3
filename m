Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA15EC43458
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  6 Jul 2026 08:19:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eKAddAQnV4Mof49a5ZigeyhJcCiP49LYRA419jtb8sc=; b=c8FESQ7t9k++S0LZdFULVv2iPF
	Clw+Ny/EyCYCBHvkDMo7RlXBP8LIKAQlRQ7EC2X4rMoTxCbWlyLSxbhv/QQS+5sSwSoxDPziZ66sR
	7fHzcVfbUeUEyOtjAZ0jmYDpJa6p5R+NWGdRTmXcE+ZFrmXmL6hynTfuDQjeyjDUrX1RRvhBO8lkS
	Wk08j1VaBcL5QMaf2/sO+mgpOQ0oD6aXI4N20pD8zsSCvkrRMKgzRdY/ZPQ2IMT9h4jFEfz1Y/Br7
	fb3VE4p1r9Pbp0+UOBJkMrQYRz5SSNuynx9zJsHneuojODOkaXOdgfCdifkFL3EHfkLw1tk/arHHG
	82jA6+eQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgeYB-0000000BoFY-4BuV;
	Mon, 06 Jul 2026 08:19:36 +0000
Received: from mail.schwarzvogel.de ([2a01:4f8:252:1806::25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgeY8-0000000BoF6-19mK;
	Mon, 06 Jul 2026 08:19:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=schwarzvogel.de; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date;
	bh=eKAddAQnV4Mof49a5ZigeyhJcCiP49LYRA419jtb8sc=; b=JXBskQTw5CCzHgaZB+4VudI7mV
	68KcNcOXo9HHXyeRzple9XTDPxezjcRRiMisayRHEwz61yknMfqcDDHGxeQFR6L5tYp1QhihKgG3y
	4A0YzbYnkja529pgVOL2Wofr/hjV7S1dSQX9hU0MSBPvoElTgWWG+qZmte46uNwFDidJuaHUt9csb
	MKpWvzpSeHhUT02Mel+DgnQMWFbdfeEJnL6iUrfT5reNqLGof9H+6Vc5gAziPgX7fS5OdZGGYecw+
	hbwfhKr8FbJi4AWk7t6NND1ezyZG7mMFK5ww3sQmP5EdbsdDV5b5xMC9uWbwBJ7izR3If94qeSC3e
	LHJOewDw==;
Received: from klausman by mail.schwarzvogel.de with local (Exim 4.99.4)
	(envelope-from <klausman@schwarzvogel.de>)
	id 1wgeXu-00000000l0g-3HM8;
	Mon, 06 Jul 2026 10:19:18 +0200
Date: Mon, 6 Jul 2026 10:19:18 +0200
From: Tobias Klausmann <klausman@schwarzvogel.de>
To: Thorsten Leemhuis <regressions@leemhuis.info>
Cc: Rosen Penev <rosenp@gmail.com>, linux-wireless@vger.kernel.org,
	Felix Fietkau <nbd@nbd.name>, Lorenzo Bianconi <lorenzo@kernel.org>,
	Ryder Lee <ryder.lee@mediatek.com>,
	Shayne Chen <shayne.chen@mediatek.com>,
	Sean Wang <sean.wang@mediatek.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	"open list:ARM/Mediatek SoC support" <linux-kernel@vger.kernel.org>,
	"moderated list:ARM/Mediatek SoC support" <linux-arm-kernel@lists.infradead.org>,
	"moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
	Linux kernel regressions list <regressions@lists.linux.dev>,
	Klara Modin <klarasmodin@gmail.com>
Subject: Re: [PATCH wireless-next] wifi: mt76: fix MAC address for non OF
 pcie cards
Message-ID: <58c4dee3-5b13-4faf-8803-3d52f59eba51@skade.local>
Mail-Followup-To: Thorsten Leemhuis <regressions@leemhuis.info>,
	Rosen Penev <rosenp@gmail.com>, linux-wireless@vger.kernel.org,
	Felix Fietkau <nbd@nbd.name>, Lorenzo Bianconi <lorenzo@kernel.org>,
	Ryder Lee <ryder.lee@mediatek.com>,
	Shayne Chen <shayne.chen@mediatek.com>,
	Sean Wang <sean.wang@mediatek.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	"open list:ARM/Mediatek SoC support" <linux-kernel@vger.kernel.org>,
	"moderated list:ARM/Mediatek SoC support" <linux-arm-kernel@lists.infradead.org>,
	"moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
	Linux kernel regressions list <regressions@lists.linux.dev>,
	Klara Modin <klarasmodin@gmail.com>
References: <20260630210215.400379-1-rosenp@gmail.com>
 <036cc81d-115a-4c0e-9542-71ed2ee04e9b@leemhuis.info>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <036cc81d-115a-4c0e-9542-71ed2ee04e9b@leemhuis.info>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260706_011932_638782_07EFD0F3 
X-CRM114-Status: GOOD (  11.40  )
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

Hi! 

On Mon, 06 Jul 2026, Thorsten Leemhuis wrote:
> On 6/30/26 23:02, Rosen Penev wrote:
> > If seems the check for err is wrong as the proper macaddr gets written
> > to from the EEPROM itself. Meaning checking err from of_get_mac_address is
> > wrong as the proper macaddr has been written by this point.
> 
> By our submission guidelines and requests from Linus this afaics should
> also contain:
> 
> Reported-by: Klara Modin <klarasmodin@gmail.com>
> Closes: https://lore.kernel.org/all/ajRmlyx_AEGybykL@soda.int.kasm.eu/
> Reported-by: Tobias Klausmann <klausman@schwarzvogel.de>
> Closes:
> https://lore.kernel.org/linux-wireless/30a90714-02d8-45f2-a7f1-4cfe0627d50b@skade.local/
> 
> Both of them now CCed, too, to give them a chance to provide a "Tested-by:".
> 
> > Fixes: 31ee1582717e ("wifi: mt76: fix of_get_mac_address error handling")

Indeed:

Tested-by: Tobias Klausmann <klausman@schwarzvogel.de>

I've been running 7.2.0-rc1+the revert for a few days now with zero
issues (not that I expected any).

Best,
Tobias

