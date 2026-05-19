Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 152BCCD4851
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 19 May 2026 09:39:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:References:In-Reply-To:Message-Id:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4ZaV7vAKmKkBxuUNmfjFmb5dle+6CQk6X/i0TW2Mc8g=; b=YsmR8Bueobqzh7OS/KI4AaON7N
	Uoszq7uYo053nR/kXQXq+JYx7bsJWrVWobnK/yW7PeKs0sO5QsLRVd7ogG0FOsR09JeZaFhY9HFiU
	LDl6U9l4Q+oWCDKmu3Uiys5ovO25zjSYK/4eZrZ4MUmx4Fvp7yHdaXlZBIVN4tIBuvbntJxK5qMjG
	j/Q6xLc1MOClC+s1Nc7vkehZDK60QoOjC6gZw0UPhOpp3K3qD6epgzOLZ/M54c1THhlS8dE1RQyIl
	5yHvH6lY8fSJjYopQbdxI7iM9fVH6WGi+2JIRldWz6LBFur5KwHk/ksxgkraTUXEIEoSNSds9lDpq
	TZwm9nEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPGvK-00000000xfp-2HaN;
	Tue, 19 May 2026 09:39:38 +0000
Received: from fhigh-b2-smtp.messagingengine.com ([202.12.124.153])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPGvH-00000000xeB-2EhY
	for linux-arm-kernel@lists.infradead.org;
	Tue, 19 May 2026 09:39:37 +0000
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfhigh.stl.internal (Postfix) with ESMTP id EFFDC7A0115;
	Tue, 19 May 2026 05:39:31 -0400 (EDT)
Received: from phl-imap-05 ([10.202.2.95])
  by phl-compute-04.internal (MEProxy); Tue, 19 May 2026 05:39:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1779183571;
	 x=1779269971; bh=4ZaV7vAKmKkBxuUNmfjFmb5dle+6CQk6X/i0TW2Mc8g=; b=
	Bq4jhxvY+mGa6dUdOF/JPP3YMOtzjWamKGMAJ2JGGyWkxJizfbJFP78FCEFXsZ7S
	fBKbTQOe8g0+5FOLjVmhzCmMirsp04xqLFTCcyw/WKxus24S3bep7u5DReu5gSVr
	ZX7SeVULV4znLu3tgej7qUw6PpU6wQMbb2F0baIbdq7eoF4ZFPJEP+SkzR3XfqmD
	zXENispwzGZmNWhQ1KAXmgRfPO3vsYiRYlDKyfCNWRaLbnOQ6uwQxGMX7XoaryZo
	kpqQbpwMaO9bdLOyJtgAP3aGX7W2bkM/KJ2eER1SIF10KNEoF97ZkGN0r4hC+38e
	VYxh2+nPHInafvIpP5ZC3g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1779183571; x=
	1779269971; bh=4ZaV7vAKmKkBxuUNmfjFmb5dle+6CQk6X/i0TW2Mc8g=; b=X
	zbKYsWMEYfVaBZJ88RUQhLmGj0A3gFtavphYY5//GuQyh1zME3eTKM+iNI2wJ3Fv
	+oSYC/wpca9zLa9KG2Hq+jXjTfKAqVw/fgcnx4G8K7riII9Fb7lmOEPC4Agvgpfv
	j7n0nP00tDrtlr7b0if6h1PFafbbl3fwZJmDLpB+LtQ81CgnIu5Mvr1aqrVlVSmp
	7Vs0YjT1ABY9LR/XEfj0T0Ui3jSMtZm0ZzukEovFyJO0RBFqdL9/9SauvFfn4ZTZ
	VvEFEHv0+Kwb0TwArBCtv41t95s0x+gCi+CZjcp0Bl+2YUOFTKsfaLzKWmvtW5Lg
	4wHpucM8AlCn5D/5YZsJQ==
X-ME-Sender: <xms:0y8Matt5SWE2PU2U61UXFruDi1eykIcki_JyujFVnuh0eLhv6TlO9w>
    <xme:0y8MahR4NosB200FRqEMT2EZP9prh0JmLIBnOmzID_0T2c08y4KAiQlOmK58v_Wnx
    U-_TT7bxvLSmmGBQrFC_4gCX2GKO7Rn3pLL2F7_psjaPR53MWYB9vE>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefhedrtddtgddugedugeduucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepofggfffhvfevkfgjfhfutgfgsehtjeertdertddtnecuhfhrohhmpedftehrnhgu
    uceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnuggsrdguvgeqnecuggftrfgrthhtvg
    hrnhephfdthfdvtdefhedukeetgefggffhjeeggeetfefggfevudegudevledvkefhvdei
    necuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomheprghrnh
    gusegrrhhnuggsrdguvgdpnhgspghrtghpthhtohepudefpdhmohguvgepshhmthhpohhu
    thdprhgtphhtthhopehrohgsvghrthdrjhgrrhiimhhikhesfhhrvggvrdhfrhdprhgtph
    htthhopehhrghojhhirghnrdiihhhurghnghesghhmrghilhdrtghomhdprhgtphhtthho
    pehlghhirhgufihoohgusehgmhgrihhlrdgtohhmpdhrtghpthhtohepsghrohhonhhivg
    eskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhugidqrghrmhdqkhgvrhhnvghl
    sehlihhsthhsrdhinhhfrhgruggvrggurdhorhhgpdhrtghpthhtohepphgvrhgvgiesph
    gvrhgvgidrtgiipdhrtghpthhtoheplhgsuhhlfigrhhhnsehrvgguhhgrthdrtghomhdp
    rhgtphhtthhopehluhhkrghsrdgsuhhlfigrhhhnsehrvgguhhgrthdrtghomhdprhgtph
    htthhopehtihifrghisehsuhhsvgdrtghomh
X-ME-Proxy: <xmx:0y8MamraOtaVkKG1s7palY71qJXmkBDiFIov6LYmeiAOAvqufxwUoQ>
    <xmx:0y8Map2Cgo2phVRuq2tClFmU_CWuz0suwuTl8cKTGnh7DmT6U_969Q>
    <xmx:0y8MaukyETDLy_KbjwbkUMDDh8xxmHhDeOIQMg9PpTwt_wekhQp3lw>
    <xmx:0y8MalZC-oVN81Az-hCMSdDpDANt52XgGkOxM8MgOdfIHUM0ur6wFw>
    <xmx:0y8MauWSGZeKilyNML3fKNmN9tpShLKeq92_zMRJbAVMa7-m6-BRjfYQ>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 21FA6182007A; Tue, 19 May 2026 05:39:31 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
X-ThreadId: A9I7lXiA-o73
Date: Tue, 19 May 2026 11:39:10 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Lukas Bulwahn" <lbulwahn@redhat.com>, "Mark Brown" <broonie@kernel.org>,
 linux-arm-kernel@lists.infradead.org, linux-sound@vger.kernel.org
Cc: "Daniel Mack" <daniel@zonque.org>,
 "Haojian Zhuang" <haojian.zhuang@gmail.com>,
 "Robert Jarzmik" <robert.jarzmik@free.fr>,
 "Liam Girdwood" <lgirdwood@gmail.com>, "Jaroslav Kysela" <perex@perex.cz>,
 "Takashi Iwai" <tiwai@suse.com>, kernel-janitors@vger.kernel.org,
 linux-kernel@vger.kernel.org, "Lukas Bulwahn" <lukas.bulwahn@redhat.com>
Message-Id: <ae162faa-d42a-4075-829b-8d554b1c3064@app.fastmail.com>
In-Reply-To: <20260519090720.301782-1-lukas.bulwahn@redhat.com>
References: <20260519090720.301782-1-lukas.bulwahn@redhat.com>
Subject: Re: [PATCH] MAINTAINERS: drop obsolete file entry in PXA2xx/PXA3xx SUPPORT
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260519_023935_834656_0B9D503F 
X-CRM114-Status: UNSURE (   9.94  )
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

On Tue, May 19, 2026, at 11:07, Lukas Bulwahn wrote:
> From: Lukas Bulwahn <lukas.bulwahn@redhat.com>
>
> Commit 42f67e1d1cba ("ASoC: pxa: integrate sound/arm/pxa2xx into
> sound/soc/pxa2xx") moves all files matching sound/arm/pxa* into
> sound/soc/pxa/. Hence, the file entry in referring to sound/arm/pxa* does
> not match any file in the repository anymore. As the PXA2xx/PXA3xx SUPPORT
> section already contains a file entry referring to sound/soc/pxa/, the
> moved files are already matched by the existing file entries.
>
> Simply drop the obsolete file entry in PXA2xx/PXA3xx SUPPORT.
>
> Signed-off-by: Lukas Bulwahn <lukas.bulwahn@redhat.com>

Thanks!

Acked-by: Arnd Bergmann <arnd@arndb.de>

