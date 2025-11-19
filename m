Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE206CF31B7
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Nov 2025 12:31:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gAYEP2r0WzK6nN8V/KKyYF/p300y06zU2QmA3CuygYs=; b=0qg/UTkWcikYYEGlUHk50D4CWc
	CqrkVh/Ijeg0k5kD854tdCXfpZ1leXdHMpBGW2S8ZREzsZ+s+9PkHUB+cWD5hiplfr/fA2Z6uuvO+
	l1Pu3amxeYnyOU70jpdg6tH4lFlNhguqOEE9mvJnoxSsuYIqX4rmkmOc9FZCM5xaTmq64WKbKaOeF
	hrhBptO/KhonpBzLMiFG/wu4AlUObmEjR06aqNZHndeLeyhBOzmjJDizqjOiqAWdZmorBmj1woXoA
	Yboku740hgcDg1tJ18PnBylgO1LlsBryt5Txo+sWeYbjPMvlSdevg9aEbwyfR+3Zez/klccocuoXl
	Rdtlqj1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLhKr-00000003A9v-0qSG;
	Wed, 19 Nov 2025 12:30:57 +0000
Received: from sender3-pp-f112.zoho.com ([136.143.184.112])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLhKn-00000003A6E-1AyX;
	Wed, 19 Nov 2025 12:30:54 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1763555436; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=FC4abtollYWOgCHR45tp6BsnT0GYBa95NDLQTbL3rTPaBYcF7ElHnPq0/Vo7d6ZbhbfZvPN/NPCjtgTS8dp8tuil9CzT2Mh0qMtDZzNs+Tg6XmqOoMLk4d1phdEEVgmyMiPeanLMuGG72yWmxXCK8n5vM2XgaEGtCZDtOPbOOOg=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1763555436; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=gAYEP2r0WzK6nN8V/KKyYF/p300y06zU2QmA3CuygYs=; 
	b=GmuCVkRZplgBfn2RXT9Zuk3sJ1unPMzdYglgeBL4jeZ1fARwB8eJ7U+BWpuaGm3CkXQnOzYE4B/hg14r1DYsLJKDw+0ixPUQrineuzBLl4FGwMYd6qgdIkPGExNgxn6IreVDSCVyUoPM1M+5zfdwyYE8DsjdPI2SpNAptZEs1N8=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=nicolas.frattaroli@collabora.com;
	dmarc=pass header.from=<nicolas.frattaroli@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1763555436;
	s=zohomail; d=collabora.com; i=nicolas.frattaroli@collabora.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Content-Type:Message-Id:Reply-To;
	bh=gAYEP2r0WzK6nN8V/KKyYF/p300y06zU2QmA3CuygYs=;
	b=f/UovCGvoeUVLBCFJ4LULHK017R9K0yHbePE4VHXb+nafPB6OGYBiG2GtyMkYelz
	hm0rBqrAoXPAgj/cRbgjWbOlAopc43TUl9+Lu5c2DMGtKODY5BdGbCxndaLzL+Y20iu
	IFH/KnxHkHJ1sia5DrDMdyngSTrNJ1qXpAzyNUlE=
Received: by mx.zohomail.com with SMTPS id 1763555434772176.03240313540152;
	Wed, 19 Nov 2025 04:30:34 -0800 (PST)
From: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
To: Krzysztof Kozlowski <krzk@kernel.org>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Henry Chen <henryc.chen@mediatek.com>, Georgi Djakov <djakov@kernel.org>,
 kernel@collabora.com, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-pm@vger.kernel.org
Subject: Re: [PATCH 01/13] dt-bindings: soc: mediatek: dvfsrc: Add support for MT8196
Date: Wed, 19 Nov 2025 13:29:12 +0100
Message-ID: <3772660.mvXUDI8C0e@workhorse>
In-Reply-To: <39fba430-3841-4bf2-9fe7-44f372ff4a16@collabora.com>
References: <20251114-mt8196-dvfsrc-v1-0-b956d4631468@collabora.com>
 <20251119-alluring-jellyfish-of-chaos-4f5bd8@kuoka>
 <39fba430-3841-4bf2-9fe7-44f372ff4a16@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251119_043053_375938_237E5805 
X-CRM114-Status: GOOD (  13.34  )
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

On Wednesday, 19 November 2025 09:32:46 Central European Standard Time AngeloGioacchino Del Regno wrote:
> Il 19/11/25 08:41, Krzysztof Kozlowski ha scritto:
> > On Fri, Nov 14, 2025 at 05:53:55PM +0100, Nicolas Frattaroli wrote:
> >> From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> >>
> >> Add a compatible for the MediaTek MT8196 Chromebook SoC's
> >> DVFSRC hardware, introducing capability to communicate with it.
> >>
> >> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> > 
> > Incomplete DCO chain.
> > 
> > Best regards,
> > Krzysztof
> > 
> 
> Eh yes, Nicolas forgot to add his SoC on all of my commits, whoops :-)
> 
> Cheers,
> Angelo
> 

And here I hoped b4 would do that when sending these out, oh well.




