Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65CA610F9302
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 31 Mar 2026 21:04:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:References:
	In-Reply-To:Cc:Subject:Date:To:From:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vxQdo+GsTGHOPhfZ6KDq0AqryyH8iiUIo3Vw21bj1s8=; b=lCPq8k+4D0w39gJ37wUjzmBrE4
	s1AxUyJv4FH3U4OIL8VQaQPGldTIrc8MErk2nBDY8A6qqRWjmRxxQu9NSCyTF6EqGnJmBpsHsMG87
	6PHpJpkAN8l4Z6bO4FJr6jsyYXrXZjg5LgLdNo1Z0xcbUKQu5PEQDCj97I93g3io/iXIjjhys4i8G
	Dc56u5peha2Bu077fAGNr11rOnJUgewO9fPFR9DATCrXqXtrT63GCCmvG4+AMbJZX/xoqFU+8mBS8
	kA0pO+u8mGUy6ZkNXPjE9HjmNJd5ErlBM6YkcmzCgNp2ZhhsPFFafhsFir3V49YLfct24ccqhfV2q
	5CcJ5/Tg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7gFu-0000000DYat-0k4J;
	Tue, 31 Mar 2026 21:04:10 +0000
Received: from fout-a7-smtp.messagingengine.com ([103.168.172.150])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7gFr-0000000DYaD-1VDM;
	Tue, 31 Mar 2026 21:04:08 +0000
Received: from phl-compute-02.internal (phl-compute-02.internal [10.202.2.42])
	by mailfout.phl.internal (Postfix) with ESMTP id 83AC1EC010A;
	Tue, 31 Mar 2026 17:04:03 -0400 (EDT)
Received: from phl-imap-07 ([10.202.2.97])
  by phl-compute-02.internal (MEProxy); Tue, 31 Mar 2026 17:04:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jetm.me; h=cc:cc
	:content-transfer-encoding:content-type:content-type:date:date
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1774991043;
	 x=1775077443; bh=vxQdo+GsTGHOPhfZ6KDq0AqryyH8iiUIo3Vw21bj1s8=; b=
	WbHnLidoIW2uJNemwQMLAKmulHP7ovrIKEeCf/LVykpvojSwY737G+MhZWwv+rVK
	bC0fzvudtk/i83wzwcgmKhXDQX0DfKTkkUeD6Ht+iOWOVniyAtmgSdL40wr16J8i
	1fp2mtQgn/n0lgl/mAevyCPcZ0t1dlbP1QdEiFfeM0o6OWm02yVkN1bubnd2sVxK
	DxktENQz9opbwzTzQO6X9u+Fs1Y53EEFSTahss+8eXdukzlYe6E86OQXRSmO7ybf
	9M/ybFoTdswaNhzlNBszo0TCXSNWEwqOvO9NjRrRRVGcmxPQCtPo9bb5rKlmb3u9
	NWX7+PkywVu3IktFyKgBPA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1774991043; x=
	1775077443; bh=vxQdo+GsTGHOPhfZ6KDq0AqryyH8iiUIo3Vw21bj1s8=; b=N
	1rpNS0NIljt6lBHkass/SqUQKRptAEZDWmcEFRkrBKknBQU0eehYAnoD7Np7Edge
	3mjEvEH/gDJIEHzpdZnOBscXXuOC0m+QK7C0sQrwAO7DS6gEMUKSMvM1ft7ZwZJQ
	TrNYoFIZoScyWvgwrZWe9EV0AnbuSU3EtAbHYl7M0LAUaN/VqsEwxBImEuSwzpX3
	ElhcQr7B075b4kcuCmDGz0yZp72bycQHfUkJkSnLFlP9MF81m13hqKLX4IGDWA5B
	R8W9N39y12FwlZ1lYvMwtaqCM1nqeCCozxCSIeOzzshaq6gxfqGzCitaWGNYRqCB
	iTlGHV7x1cJ7Fn+xwytLw==
X-ME-Sender: <xms:wjbMaawEEtpRe7-HS-H1k4HgXYOa8XEupNgiH5i7bvvt8pIZIdO1KQ>
    <xme:wjbMaRFZ_VsKThOkMj-VzSblzkhxZZXqXh46DX3qsHHRm5D0vRyxjFlHMmLnxLWZ3
    HVNKajvhkLfjtHfSX8Mrn_Ph1DVBDvPwghrpAxA52ZZURwP0oJ0a-c>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefhedrtddtgdduvdefucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceurghi
    lhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnegopfhokf
    ffucdluddtmdenucfjughrpefotggggffhvfffufevjghfsehtkedttdertdejnecuhfhr
    ohhmpeflrghvihgvrhcuvfhirgcuoehflhhoshhssehjvghtmhdrmhgvqeenucggtffrrg
    htthgvrhhnpedtudejffejkeekteelueefvdejvdeuhfefteehkeevtddvleduteekleet
    vdelhfenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
    hflhhoshhssehjvghtmhdrmhgvpdhnsggprhgtphhtthhopeduuddpmhhouggvpehsmhht
    phhouhhtpdhrtghpthhtoheprghnghgvlhhoghhiohgrtggthhhinhhordguvghlrhgvgh
    hnohestgholhhlrggsohhrrgdrtghomhdprhgtphhtthhopehluhgsnhhinhdrihhvrghn
    sehgmhgrihhlrdgtohhmpdhrtghpthhtoheplhhuihiirdguvghnthiisehgmhgrihhlrd
    gtohhmpdhrtghpthhtohepmhgrthhthhhirghsrdgsghhgsehgmhgrihhlrdgtohhmpdhr
    tghpthhtohepmhgrrhgtvghlsehhohhlthhmrghnnhdrohhrghdprhgtphhtthhopehlih
    hnuhigqdgrrhhmqdhkvghrnhgvlheslhhishhtshdrihhnfhhrrgguvggrugdrohhrghdp
    rhgtphhtthhopehlihhnuhigqdhmvgguihgrthgvkheslhhishhtshdrihhnfhhrrgguvg
    grugdrohhrghdprhgtphhtthhopehjnhgvthhtohesmhhinhgvihhrohdrihhopdhrtghp
    thhtohepphhmvghniigvlhesmhholhhgvghnrdhmphhgrdguvg
X-ME-Proxy: <xmx:wjbMaaosQq4Hksquv81s7VGSNdW4bTZ8xFCZH-eBkp6CI-zCuqxB1w>
    <xmx:wzbMaQySBGrkHaBIKT-227T9WR5RuzWhcc1IVk3ZdivdsWoeSJioag>
    <xmx:wzbMaesE0hMsTfirkDkLlQTCGRxT0CZ7P_iI3aTxw404KrFvn8Uy8g>
    <xmx:wzbMaZ245cWpETaqnvIXTd-wD2zx1aRU5CsSAaCSodkc_7UIFzsf2w>
    <xmx:wzbMaX5gXIfDYnYJBNWm2F7U5cHU6zflptQYTRcz5_xWX51S638s9YCG>
Feedback-ID: i9dde48b3:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id DCE821EA006B; Tue, 31 Mar 2026 17:04:02 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
From: Javier Tia <floss@jetm.me>
To: Paul Menzel <pmenzel@molgen.mpg.de>
Date: Tue, 31 Mar 2026 14:58:59 -0600
Subject: Re: [PATCH v5 8/8] Bluetooth: btusb: Add MT7927 ID for ASUS X870E / ProArt X870E-Creator
Cc: Marcel Holtmann <marcel@holtmann.org>, Luiz Augusto von Dentz <luiz.dentz@gmail.com>, Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, linux-bluetooth@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, Jose Tiburcio Ribeiro Netto <jnetto@mineiro.io>, Ivan Lubnin <lubnin.ivan@gmail.com>
In-Reply-To: 11effdbc-4eff-4430-a22f-3320f84859fb@molgen.mpg.de
References: 11effdbc-4eff-4430-a22f-3320f84859fb@molgen.mpg.de
Message-Id: <20260331210402.DCE821EA006B@mailuser.phl.internal>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260331_140407_644430_F120B117 
X-CRM114-Status: GOOD (  10.00  )
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

Hi Paul,

Thank you for the review.

On Mon, 31 Mar 2026 Paul Menzel wrote:
> > +	{ USB_DEVICE(0x13d3, 0x3588), .driver_info = BTUSB_MEDIATEK |
> > +						     BTUSB_WIDEBAND_SPEECH },
>
> This is not sorted. Is there a reason to place it here?

The placement is a consequence of the series structure - each USB ID
patch inserts after the previous one to keep patches independent and
conflict-free. The existing 0x13d3 MediaTek entries in the table are
also not strictly sorted (e.g. 3560, 3620, 3621, 3622, 3563, 3564),
as they are grouped by chip generation rather than numerical order.

That said, Luiz has already applied v4 of this series to
bluetooth-next with this ordering, so any resorting would need a
separate follow-up patch.

Best,
Javier

