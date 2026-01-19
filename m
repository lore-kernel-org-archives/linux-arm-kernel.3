Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2A04D29C4B
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 19 Jan 2026 17:03:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=j1Gw507vmcSsdFH9CkXbz2Yd6P8oRVdS73BssjFLkks=; b=NM+LVHtBvbrYv0+8bfz6WnTiP4
	wM9cIaePaoD2MwzZLjTTXkDIlXqAVaZpClqCIvN2PcEH+78nSAWw7gnV9I/Hv5FHmoFJke+RWBMxj
	8lJPgTZ+cDjjRC4+skBMnk4WUMCAVUpxLbwP62WI979i95A79Ba8HVSyVu40/nAOyY5Ykfmgs1BV/
	AiMZH+VMIgjYK4RZe2xI1TDjFzAI3nJe0aR5DqrMyZ9+hiyKfP+A0Ag/f/eSKqc1EFQIAzZkUx1dL
	drZACihOcIzQXzUuxf/+tKestUX9oZFV3CqUClnS7D1CoXdJ6wSaZmfHvLsSEPhjUB29FB2Y7bQ20
	9g945thA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhsej-00000002aHs-2z0h;
	Mon, 19 Jan 2026 17:03:09 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhsei-00000002aHH-31j9
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 19 Jan 2026 17:03:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=j1Gw507vmcSsdFH9CkXbz2Yd6P8oRVdS73BssjFLkks=; b=EX9bYxByuirK/BQdKr7OJQ/v0W
	/6+sH2bLBnoWbwqcvslGJ6+Qdfjf6pjHNxn/3Y4tWkKoyUONvredoiGU+aX3g2NLyxGZzv+0i18MQ
	nV7wSDQyx+QgWEoKgePf0IJQ62QINLEc0V+eRtJy+AJyyEloo4iJX4w4CfpWzb3bRDheAHwo6W4Ob
	3MhF+V2Jtztnb4Mxx2y77JZdaUwBkEsKLPCI1OhfmQExRiVQRVgQyD49F7e4IvFOekrRs588EG8up
	NNBZWoimoWwt9d0ERcqVDyIfD7O/HjicbncqCK374/NFECTK+BpVl/Cb7A2bIhKx2jiUpyaJqs8QV
	0CYgDQag==;
Received: from foss.arm.com ([217.140.110.172])
	by desiato.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhsef-0000000Ccgk-2rsq
	for linux-arm-kernel@lists.infradead.org;
	Mon, 19 Jan 2026 17:03:07 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 29D7E497;
	Mon, 19 Jan 2026 09:02:56 -0800 (PST)
Received: from bogus (e124108.arm.com [10.1.32.49])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D7F0C3F632;
	Mon, 19 Jan 2026 09:03:00 -0800 (PST)
Date: Mon, 19 Jan 2026 17:02:58 +0000
From: Sudeep Holla <sudeep.holla@arm.com>
To: Cristian Marussi <cristian.marussi@arm.com>
Cc: Marek Vasut <marek.vasut+renesas@mailbox.org>, arm-scmi@vger.kernel.org,
	Sudeep Holla <sudeep.holla@arm.com>,
	"Rob Herring (Arm)" <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v4 1/2] dt-bindings: firmware: arm,scmi: Document
 arm,no-completion-irq property
Message-ID: <aW5jwtoYCFs-Pzpk@bogus>
References: <20260117010241.186685-1-marek.vasut+renesas@mailbox.org>
 <aW5hmb9tyw1Gv388@pluto>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aW5hmb9tyw1Gv388@pluto>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260119_170306_104124_2CAD9F1C 
X-CRM114-Status: GOOD (  29.09  )
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

On Mon, Jan 19, 2026 at 04:53:45PM +0000, Cristian Marussi wrote:
> On Sat, Jan 17, 2026 at 02:02:28AM +0100, Marek Vasut wrote:
> > Document new property arm,no-completion-irq . This optional property
> > is intended for hardware that does not generate completion interrupts
> > and can be used to unconditionally enable forced polling mode of
> > operation.
> > 
> > With this property set, such implementations which do not generate
> > interrupts can be interacted with, until they are fixed to generate
> > interrupts properly.
> > 
> > Note that, because the original base protocol exchange also requires
> > some sort of completion mechanism, it is not possible to query SCMI
> > itself for this property and it must be described in DT. While this
> > does look a bit like policy, the SCMI provider is part of the
> > hardware, hence DT.
> > 
> > Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
> > Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
> > ---
> > Cc: Conor Dooley <conor+dt@kernel.org>
> > Cc: Cristian Marussi <cristian.marussi@arm.com>
> > Cc: Florian Fainelli <florian.fainelli@broadcom.com>
> > Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
> > Cc: Rob Herring <robh@kernel.org>
> > Cc: Sudeep Holla <sudeep.holla@arm.com>
> > Cc: arm-scmi@vger.kernel.org
> > Cc: devicetree@vger.kernel.org
> > Cc: linux-arm-kernel@lists.infradead.org
> > Cc: linux-renesas-soc@vger.kernel.org
> > ---
> > V2: s@mean@&t and limit poll transport to mailbox/shmem only
> > V3: - Reformat the commit message, expand property description to
> >       explicitly spell out this is hardware description.
> >     - Rename property from arm,poll-transport to arm,no-completion-irq
> > V4: - Update first paragraph of commit message and property description
> >     - Add RB from Rob
> > ---
> >  .../devicetree/bindings/firmware/arm,scmi.yaml         | 10 ++++++++++
> >  1 file changed, 10 insertions(+)
> > 
> > diff --git a/Documentation/devicetree/bindings/firmware/arm,scmi.yaml b/Documentation/devicetree/bindings/firmware/arm,scmi.yaml
> > index be817fd9cc34b..d06cca9273c48 100644
> > --- a/Documentation/devicetree/bindings/firmware/arm,scmi.yaml
> > +++ b/Documentation/devicetree/bindings/firmware/arm,scmi.yaml
> > @@ -146,6 +146,13 @@ properties:
> >        this platform. If set, the value should be non-zero.
> >      minimum: 1
> >  
> > +  arm,no-completion-irq:
> > +    type: boolean
> > +    description:
> 
> Shouldn't these two points have to be swapped as per Sudeep and Rob
> suggestions ?
> 
>     description:
> 	....
>     type: boolean
> 

I was just referring to the points covered under the `description` and not
the order of `type` and `description`. I am not sure if there is any such
requirement as well. I am happy with this version, but this needs to wait
for the merge window following the next as I have already sent the PR to
SoC teams.

-- 
Regards,
Sudeep

