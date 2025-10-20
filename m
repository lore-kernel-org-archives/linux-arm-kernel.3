Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A5CACCD193
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Oct 2025 13:57:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nqHvMgb0znCwfqJeA+RPXM5wvAfiMBWwT5rw7djWXRU=; b=y+je9EMNFhZeq9yxaH9lxXLcmJ
	1sJYnoeqEbri4ih04g5IkSouG4/Vc1sPJxwfv8DNPGD9nuRn4CB6VnSpN2lUdUnk6igChjKb9EBA7
	ceYOhNRKxIOIm9YcVyYkLxO6Kg7Lw99OLqn+v26hxMcB/yMFmJadiVV1Kh7cswq2ymw9psj1p5HEy
	agHT70uSZ2eoPOYwq/jYRBbseueNbLede3KJNW+41gs/+BnUw/6wCYx/JUEsTD4OmNskj2UeQvO9d
	0OnblUYmovSkon2nupB1uQYfntJSP9A6vyvs5RIyMO98yI4yn5Q7zxbcN6ZzoRCiemj0l3W3EDQey
	uRw3HBQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAqNj-0000000Ds56-1SEo;
	Mon, 20 Oct 2025 13:57:03 +0000
Received: from sender4-pp-f112.zoho.com ([136.143.188.112])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAqNg-0000000Ds3h-2bSs;
	Mon, 20 Oct 2025 13:57:02 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1760968609; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=B76x+v2U612DJuvjGJrxH9KxhqLNSHabXgPOtil2Al6AvzEPDXhdQ3pM0+2MjuypEfl4BC/0qiZWFdw1rDob742eajmqBEAz5nQX2NrnkMxAFKnha77sbTdE8DFzzaETh0Wfvm6+m8dqsdqdMP08A60N9Ar/Q4CO1Roam4dJo9U=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1760968609; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=nqHvMgb0znCwfqJeA+RPXM5wvAfiMBWwT5rw7djWXRU=; 
	b=k6t1B/lOVxI/5dz0U9zfC9L/tgdqerNFT21Wg03c7tDDtGurzi96OguldTDhfy+cfM82/lHAe+o36L8qf+Duq/rvmXediBJOvu+jHQCmtTZmhqB6fGIQ8bENxzlZ75mmh7AQQ+URPt9AVoF6nsSU448UsvhNQEvRm8gy6aChDBw=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=nicolas.frattaroli@collabora.com;
	dmarc=pass header.from=<nicolas.frattaroli@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1760968609;
	s=zohomail; d=collabora.com; i=nicolas.frattaroli@collabora.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Content-Type:Message-Id:Reply-To;
	bh=nqHvMgb0znCwfqJeA+RPXM5wvAfiMBWwT5rw7djWXRU=;
	b=VzqvIjc8muGtBxUkI/DjmYeRjYa+BG6VmeXEj3KCpeo8JWlPAhe3u7uiEawigmU6
	/HNlExiXNYWxIr8mXk6VdNNpGp8QCASEc7PbXlSyaVxgZlfvhPkKEPXHm+FZmiawe2C
	hXw+pe9pxGgm1FZLAJLVOP/TiZMToqLI3H8Ny93E=
Received: by mx.zohomail.com with SMTPS id 1760968606551857.8630135881692;
	Mon, 20 Oct 2025 06:56:46 -0700 (PDT)
From: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
To: Conor Dooley <conor@kernel.org>
Cc: Alim Akhtar <alim.akhtar@samsung.com>, Avri Altman <avri.altman@wdc.com>,
 Bart Van Assche <bvanassche@acm.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Chunfeng Yun <chunfeng.yun@mediatek.com>, Vinod Koul <vkoul@kernel.org>,
 Kishon Vijay Abraham I <kishon@kernel.org>,
 Peter Wang <peter.wang@mediatek.com>, Stanley Jhu <chu.stanley@gmail.com>,
 "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
 "Martin K. Petersen" <martin.petersen@oracle.com>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>, kernel@collabora.com,
 linux-scsi@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-phy@lists.infradead.org
Subject: Re: [PATCH v2 1/5] dt-bindings: ufs: mediatek,ufs: Add mt8196-ufshci variant
Date: Mon, 20 Oct 2025 15:56:39 +0200
Message-ID: <2018479.PYKUYFuaPT@workhorse>
In-Reply-To: <10741243.nUPlyArG6x@workhorse>
References: <20251016-mt8196-ufs-v2-0-c373834c4e7a@collabora.com>
 <20251018-appliance-plus-361abdd09e75@spud> <10741243.nUPlyArG6x@workhorse>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251020_065700_718012_1910C38B 
X-CRM114-Status: GOOD (  25.06  )
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

On Monday, 20 October 2025 15:27:40 Central European Summer Time Nicolas Frattaroli wrote:
> On Saturday, 18 October 2025 23:30:17 Central European Summer Time Conor Dooley wrote:
> > On Fri, Oct 17, 2025 at 09:02:07PM +0200, Nicolas Frattaroli wrote:
> > > On Friday, 17 October 2025 17:42:10 Central European Summer Time Conor Dooley wrote:
> > > > On Thu, Oct 16, 2025 at 02:06:43PM +0200, Nicolas Frattaroli wrote:
> > > 
> > > > > +
> > > > > +  freq-table-hz: true
> > > > 
> > > > Then you add this deprecated property, which isn't mentioned in the
> > > > commit message and I don't see why a deprecated property is needed.
> > > 
> > > I'll rework it to use operating-points-v2 instead. It needs one of
> > > the two, or else on mt8196 at least, the hardware locks up.
> > > 
> > > I'll still add operating-points-v2 for all SoCs though, if that's
> > > okay with you.
> > 
> > Right. I'd accept freq-table-hz if the other devices here have been
> > using it all along, but if this is something new - then please use the
> > operating-points-v2 property. Looking at the binding example, it looks
> > like it does indeed use freq-table-hz, so that's probably justification
> > enough to keep doing so.
> 
> Turns out the only usage of freq-table-hz is in the examples I've added.
> Mainline does not at all have any nodes in the DT right now that would
> use this property.
> 
> Ergo, I think I will go for operating-points-v2. We might as well clean
> this up now instead of ossifying a deprecated property in a new binding
> for the sake of downstream compatibility (which should never be a concern)
> that I am already breaking. The added benefit is that if we ever do get
> better OPP definitions than just two clock states, then we can actually
> add the OPP bandwidth properties so implementations can make informed
> decisions.
> 

Nevermind, I see the existing binding had it in the example for 8183,
just not in the binding itself. So freq-table-hz it is.



