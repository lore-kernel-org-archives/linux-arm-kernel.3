Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C19F9109E530
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Mar 2026 00:22:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:References:
	In-Reply-To:Cc:Subject:Date:To:From:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KoGksBrhgEtRDSfM/YDFfZUq76xOqjELkeavOboi/IU=; b=Ugd7sYagNJULqunkS9O948DEDj
	JgZ02KSKeMjJpirpQlhyMkhZgdTtlE5VM3zgm9oGFcRAbdOXAIyrvshXQZ8HBLozHV2h9TAgVYCqR
	9HfyZOHStZPqiI0BdVVVw+Ug8ATqZdscGwdm6+EOiN1VhHmj6C/FlHhS7MHXgHkyFdRgNvkxdOImB
	YhrVSr/t/TO8uGF+TwEf7Fi4CjicFOxpNL2cWECKbRC5KGzKFNgw9Yu5mMtS/BvEVynArT7Ahp+P+
	TFg3/d7OdCkscvuBijXuDXqUgGXcmQtQKCjcC+hcJZP9YZMj3dKx+aItzXfdCgiIkkBpMcsfRPHIU
	rAwCf3qQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5YUp-00000004Tgh-1YS7;
	Thu, 26 Mar 2026 00:22:47 +0000
Received: from flow-a6-smtp.messagingengine.com ([103.168.172.141])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5YUm-00000004TgJ-3TWq;
	Thu, 26 Mar 2026 00:22:46 +0000
Received: from phl-compute-02.internal (phl-compute-02.internal [10.202.2.42])
	by mailflow.phl.internal (Postfix) with ESMTP id 1EE311380743;
	Wed, 25 Mar 2026 20:22:43 -0400 (EDT)
Received: from phl-imap-07 ([10.202.2.97])
  by phl-compute-02.internal (MEProxy); Wed, 25 Mar 2026 20:22:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jetm.me; h=cc:cc
	:content-transfer-encoding:content-type:content-type:date:date
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1774484563;
	 x=1774491763; bh=KoGksBrhgEtRDSfM/YDFfZUq76xOqjELkeavOboi/IU=; b=
	FfGJaiGR8wwkUXmw0OxoZpapCVyITNP9jQy8V6NXs0B+Ph/EboZ2CHMbTVSeupkj
	JBD0zhKFeLS3L8CW8USOd442u1gW4WT1y9mQbnYGuun3qhtkeSv0HTFgcexsIOgZ
	DKM26Re1KjHSTDGIlM+h0WJlhs+6rzihgMk0Vmx/h6GyzimOsPkL2rmPlw2agXHH
	R3M7xQBFAIHcDdxKbyLWVKOM10V7AR6FC1cS2z3WipPG7/8omenaCkD8IyqJVC8i
	uieLb8upy0xI0GAU8XQBD2js3xklu2zPADpLfKLaFndXrs0M5tD+Xt51R/k+YLuy
	8CHf8wsChVIfAwZPnRHNdQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1774484563; x=
	1774491763; bh=KoGksBrhgEtRDSfM/YDFfZUq76xOqjELkeavOboi/IU=; b=A
	MCjAfotSWOW3C9NV4AeCNzy4JHkSliVuTt0hUDrEPtKEGOshqyW4BvD6IQTIXirQ
	LTEe5edkZKe2JTOuo4MyQNiKv6ux/nahS3w0TKY6ATJzzq1eW3uNq50fUwdnEfuP
	eKXfHbE6JAWIHVz6C1pi/yHEHfkGPbX/GhrmRaiB95nmMkf0R/DQubxxJRzXiFxS
	66IPRzG+AX6DvMqqueeu7MbAi3repjTeColUxTWnJThzbOs4HSh1DmGPX+6FquSO
	uIQ2mf+QD15/nqo5uKEbU4z/oBdGdJh+hXMYIwq8BYcbVJ9RcXYopdGqXymK6raM
	OlbV4/XUk5khh1MSZc7CQ==
X-ME-Sender: <xms:UnzEac2LXinKBmeR3d0Q11WE2DDpQWKzJXO4ycyPck9LqLIS4IyPcA>
    <xme:UnzEaR6IZhGtIDeTOb3SAV7MGqaAp0Mo6JVoZm1d5LvTrvWBoY-60PvQzlbQWMjUa
    nocXa8ZOJGFtWGeDcbQNICZHxVD39rHIOe6tWbSJgvBuS5gSC9nxw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgdefvdehledtucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnegopf
    hokfffucdluddtmdenucfjughrpefotggggffhvfffufevjghfsehtkedttdertdejnecu
    hfhrohhmpeflrghvihgvrhcuvfhirgcuoehflhhoshhssehjvghtmhdrmhgvqeenucggtf
    frrghtthgvrhhnpedtudejffejkeekteelueefvdejvdeuhfefteehkeevtddvleduteek
    leetvdelhfenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhroh
    hmpehflhhoshhssehjvghtmhdrmhgvpdhnsggprhgtphhtthhopedvfedpmhhouggvpehs
    mhhtphhouhhtpdhrtghpthhtoheprghnghgvlhhoghhiohgrtggthhhinhhordguvghlrh
    gvghhnohestgholhhlrggsohhrrgdrtghomhdprhgtphhtthhopeefudelfeeifedusehg
    mhgrihhlrdgtohhmpdhrtghpthhtoheplhhoohhnghdrtdigtddtsehgmhgrihhlrdgtoh
    hmpdhrtghpthhtoheprghrihgvlhdrrhhoshgvnhhfvghlugdrjeehtdesghhmrghilhdr
    tghomhdprhgtphhtthhopegthhgrphhuihhsuggrrhhiohegsehgmhgrihhlrdgtohhmpd
    hrtghpthhtohepghhiohhsrghlledtsehgmhgrihhlrdgtohhmpdhrtghpthhtohepmhgr
    thhthhhirghsrdgsghhgsehgmhgrihhlrdgtohhmpdhrtghpthhtoheprhgrughoihdrtg
    hhrhhishesghhmrghilhdrtghomhdprhgtphhtthhopehsrghmuhdrthholhhjrghmohes
    ghhmrghilhdrtghomh
X-ME-Proxy: <xmx:UnzEab2oOstJnxD3dqX5RYKr-ESaHoxoRnNsZYzSCAV-UwH8WCVi5w>
    <xmx:UnzEae-ZILLAGzzaLn06h_7AIjh4xtDuvtUWod50hjVv7GIuwi3ktQ>
    <xmx:UnzEaZdVrqQuIE9xnoEK3CriglFgOK3tpmn3r3l-SFnbAstLTuVrKA>
    <xmx:UnzEaS7r9qT97VdUBsaCuJhRdNTDekAHd0IKPihETnVnXsem2QDGag>
    <xmx:U3zEaZShFSVc8IhrR0Le_l4CFEQpZQVkY_JEG6y5wJovFb4_lMPWUdbE>
Feedback-ID: i9dde48b3:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 50D8B1EA006B; Wed, 25 Mar 2026 20:22:42 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
From: Javier Tia <floss@jetm.me>
To: Sean Wang <sean.wang@kernel.org>
Date: Wed, 25 Mar 2026 18:18:45 -0600
Subject: Re: [PATCH v2 05/13] wifi: mt76: mt7925: advertise EHT 320MHz capabilities for 6GHz band
Cc: Felix Fietkau <nbd@nbd.name>, Lorenzo Bianconi <lorenzo@kernel.org>, Ryder Lee <ryder.lee@mediatek.com>, Shayne Chen <shayne.chen@mediatek.com>, Sean Wang <sean.wang@mediatek.com>, Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Deren Wu <deren.wu@mediatek.com>, Ming Yen Hsieh <mingyen.hsieh@mediatek.com>, linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, Marcin FM <marcin@lgic.pl>, Cristian-Florin Radoi <radoi.chris@gmail.com>, George Salukvadze <giosal90@gmail.com>, Evgeny Kapusta <3193631@gmail.com>, Samu Toljamo <samu.toljamo@gmail.com>, Ariel Rosenfeld <ariel.rosenfeld.750@gmail.com>, Chapuis Dario <chapuisdario4@gmail.com>, =?utf-8?q?Thibaut_Fran=C3=A7ois?= <tibo@humeurlibre.fr>, =?utf-8?b?5byg5pet5ra1?= <Loong.0x00@gmail.com>
In-Reply-To: CAGp9LzoYcJEmFKTKGsF3WchxLedyo7HvGCn8Vi=WaEXS1N-VTg@mail.gmail.com
References: 20260319-mt7927-wifi-support-v2-v2-0-d627a7fad70d@jetm.me 20260319-mt7927-wifi-support-v2-v2-5-d627a7fad70d@jetm.me CAGp9LzoYcJEmFKTKGsF3WchxLedyo7HvGCn8Vi=WaEXS1N-VTg@mail.gmail.com
Message-Id: <20260326002242.50D8B1EA006B@mailuser.phl.internal>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260325_172244_943266_31D4B388 
X-CRM114-Status: UNSURE (   9.53  )
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

Hi Sean,

On Mon, Mar 24, 2026 Sean Wang wrote:
> I don't think this is correct for mt7925, and it will cause a
> regression there. Was this tested on actual mt7925 hardware?

You are right. I do not have mt7925 hardware to verify against.
In v3, is_320mhz_supported() now checks is_mt7927() only, so
mt7925 behavior is unchanged.

> I don't think this should be copied from mt7996 as-is for mt7927. I'd
> suggest dropping the eht_cap_elem->phy_cap_info[7] change and keeping
> it conservative for now.

Agreed. The phy_cap_info[7] additions (NON_OFDMA_UL_MU_MIMO_320MHZ
and MU_BEAMFORMER_320MHZ) are dropped in v3. Only the MCS/NSS maps
and per-BW beamformee SS/sounding dimensions for 320MHz remain.

Both changes are in v3, sent today.

Best,
Javier

