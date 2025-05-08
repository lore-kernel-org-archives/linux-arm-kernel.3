Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B86B6C3ABC0
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  8 May 2025 15:46:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:References:In-Reply-To:Message-Id:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zKwVwHInyFHttKlOYiiRDPcH0afaTJXoOolAu+XDXbo=; b=wgfu0bTEdq9WcZsVdbbWD63DRD
	BfRpIA0PATtWCUK9oEwdgNXqnmnyA7Ub+/5qspUfBIdj3dn5bbY/2AdsQhoGo/d72OJD9NnAY+5Ga
	RsGbNhryrMybpxHln3sDj4R3I8rAhT/hxglcsgILP8QHfQd47OXAP1QIh6AreTU/E3Hm3Ad2pV01U
	3JW+s2ocpPhnXMK2OhGVgvs+sUXysa0oYgHZyfrLvEGh3UGnwBl36Iy+Ff1Esc2LG99yjFot3zhl7
	VDQ2sICvZJCMtSJdRHxUGDPW6J0jT+W5wdbNidenWpSqAuKl4DYEtlwaO+cjSyZNrh1I3rUkb/lgR
	ogTgG/7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uD3SG-00000001BM9-3Xhb;
	Thu, 08 May 2025 15:46:37 +0000
Received: from fhigh-a2-smtp.messagingengine.com ([103.168.172.153])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uD1hh-00000000pV0-17oq;
	Thu, 08 May 2025 13:54:27 +0000
Received: from phl-compute-05.internal (phl-compute-05.phl.internal [10.202.2.45])
	by mailfhigh.phl.internal (Postfix) with ESMTP id D331A11401B9;
	Thu,  8 May 2025 09:54:21 -0400 (EDT)
Received: from phl-imap-12 ([10.202.2.86])
  by phl-compute-05.internal (MEProxy); Thu, 08 May 2025 09:54:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1746712461;
	 x=1746798861; bh=zKwVwHInyFHttKlOYiiRDPcH0afaTJXoOolAu+XDXbo=; b=
	IVQgLZWlVgLU/lJZLr+iFqaSMheF05AC/yD3uJd0BIhy1D5y/PTmDkTl4T2oiPrJ
	EvFv5pgK+njzB43WRd0mvC8LnivltiQZR3LsCNirUojPOGVlTfIMVK06XI+U4+MN
	mW+/ILx3zEBt1r2/PVY57IDxIog9txi5p2ZkUq3/8NGV/D3oBQq0Q0F1hQ8kydLp
	InbjgOsl8hL3UJhRReFsViKbu9PNnHSEhV5L0FQGophIBOpz15tHy3ChIr3tudi3
	x7UVNkDcdZeBcnbFHnt2mZd9QT5JSjMPoxe4B5TB01yMK68FH7I1F0d5kRgSvhLl
	Ue3hwtao2XwqhHMjlKtY4w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1746712461; x=
	1746798861; bh=zKwVwHInyFHttKlOYiiRDPcH0afaTJXoOolAu+XDXbo=; b=n
	OzlWj2GGOFn0sYTPX97eTu1g9aWel1P8MgeWhkuCPiqBEv6vHM1qdcw0y0kt9MV0
	YDHAV02oS2Ddcs5aHpon/3V2hEj6wPNLOKc8VRUnHj9YP+1O3PcaJC7L4I8pE2hD
	alwUrZLeZ2nUF08mSIHgEhYH6fJVvOx4uPblyLffbS75VLiGTZWkjkMutnwcpT3E
	itd2k55CJYnPAF4e+oPd/6EtSVJnuXNPJrMTj4EfHTLFkB1WrgpxjX91+ESaV0t4
	H26hjVJ0HaFvUKkgqUqLTvqtEg0I2PiMvoXiy7y7Fq2SDF/dkZFbNB1RVYASDnUx
	zVgtnt4O+wuymBPFq1Q5g==
X-ME-Sender: <xms:jbccaFFUfl4J8bkCxYpNg9kU3xJOFCbTXSj23bHtrL4ERVLUWX5cZA>
    <xme:jbccaKXILPyFEbRQlNz_JmbQNnjShXpQraFrRwQwe4T0F7OAYDnrPOkdix8AHM8Is
    _dn7bIKh2eKWFoTatU>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvkeelledvucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggv
    pdfurfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpih
    gvnhhtshculddquddttddmnecujfgurhepofggfffhvfevkfgjfhfutgfgsehtqhertder
    tdejnecuhfhrohhmpedftehrnhguuceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnug
    gsrdguvgeqnecuggftrfgrthhtvghrnhepvdfhvdekueduveffffetgfdvveefvdelhedv
    vdegjedvfeehtdeggeevheefleejnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrg
    hmpehmrghilhhfrhhomheprghrnhgusegrrhhnuggsrdguvgdpnhgspghrtghpthhtohep
    udegpdhmohguvgepshhmthhpohhuthdprhgtphhtthhopegrnhhgvghlohhgihhorggttg
    hhihhnohdruggvlhhrvghgnhhosegtohhllhgrsghorhgrrdgtohhmpdhrtghpthhtohep
    khgvrhhnvghlsegtohhllhgrsghorhgrrdgtohhmpdhrtghpthhtohepnhhfrhgrphhrrg
    guohestgholhhlrggsohhrrgdrtghomhdprhgtphhtthhopehlghhirhgufihoohgusehg
    mhgrihhlrdgtohhmpdhrtghpthhtohepmhgrthhthhhirghsrdgsghhgsehgmhgrihhlrd
    gtohhmpdhrtghpthhtoheprghrnhgusehkvghrnhgvlhdrohhrghdprhgtphhtthhopegs
    rhhoohhnihgvsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehlihhnuhigqdgrrhhmqd
    hkvghrnhgvlheslhhishhtshdrihhnfhhrrgguvggrugdrohhrghdprhgtphhtthhopehl
    ihhnuhigqdhmvgguihgrthgvkheslhhishhtshdrihhnfhhrrgguvggrugdrohhrgh
X-ME-Proxy: <xmx:jbccaHIE0qB-gRcBJPF3mx9qcmmsmF3lPvAhWDPZ1jd6yMJp7qoeRQ>
    <xmx:jbccaLG8ZWNJpxRforzfW626CgfovRMyHHcoyDphFRKPXTf3Mrn--Q>
    <xmx:jbccaLUhSGeC_PLFQCBI5mms4AWAfZ6kN_mRSmaMzIwsPGg8pqhGvA>
    <xmx:jbccaGOUwVH610AoyCT6aAPNy9Fkk3mNFCWA1OTn1VOJQHArOTAicw>
    <xmx:jbccaNKTVBAeYTcqdy_Q7JAsVbVyyZ_U0-T7lgBgM2ZLjsWT0VeCVwAi>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id E83471C20068; Thu,  8 May 2025 09:54:20 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
X-ThreadId: Td2f4dc7f18582246
Date: Thu, 08 May 2025 15:54:00 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: =?UTF-8?Q?N=C3=ADcolas_F=2E_R=2E_A=2E_Prado?= <nfraprado@collabora.com>,
 "Liam Girdwood" <lgirdwood@gmail.com>, "Mark Brown" <broonie@kernel.org>,
 "Jaroslav Kysela" <perex@perex.cz>, "Takashi Iwai" <tiwai@suse.com>,
 "Matthias Brugger" <matthias.bgg@gmail.com>,
 "AngeloGioacchino Del Regno" <angelogioacchino.delregno@collabora.com>,
 "Zoran Zhan" <zoran.zhan@mediatek.com>
Cc: kernel@collabora.com, linux-sound@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, "Arnd Bergmann" <arnd@kernel.org>
Message-Id: <518ffd4c-2ea1-4496-b0fd-399ea1db0f57@app.fastmail.com>
In-Reply-To: <20250507-mt8188-mt6359-accdet-depend-v1-1-aad70ce62964@collabora.com>
References: <20250507-mt8188-mt6359-accdet-depend-v1-1-aad70ce62964@collabora.com>
Subject: Re: [PATCH] ASoC: mediatek: mt8188-mt6359: Depend on MT6359_ACCDET set or
 disabled
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250508_065426_098341_317F7D26 
X-CRM114-Status: UNSURE (   8.71  )
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

On Wed, May 7, 2025, at 22:14, N=C3=ADcolas F. R. A. Prado wrote:
> Commit 0116a7d84b32 ("ASoC: mediatek: mt6359: Add stub for
> mt6359_accdet_enable_jack_detect") added a stub for
> mt6359_accdet_enable_jack_detect() in order to allow the mt8188-mt6359
> driver to be enabled without requiring the mt6359-accdet to also be
> enabled, since it is not always needed.
>
> Fixes: f35d834d67ad ("ASoC: mediatek: mt8188-mt6359: Add accdet headse=
t=20
> jack detect support")
> Fixes: b19fa45715ce ("ASoC: mediatek: mt8188-mt6359: select=20
> CONFIG_SND_SOC_MT6359_ACCDET")
> Suggested-by: Arnd Bergmann <arnd@kernel.org>
> Signed-off-by: N=C3=ADcolas F. R. A. Prado <nfraprado@collabora.com>

Acked-by: Arnd Bergmann <arnd@arndb.de>

