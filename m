Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 762FBC5AD4E
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  9 Aug 2026 12:12:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1F/+cfZIAkAn2MH5HWhnU43a68MUjIzWX0xwmyWQRGo=; b=G0STDOGrwCOXON4jYyo8sldxWG
	hW+s6h9wpsTbNMW+qjWqMnJOOT197ElzhbpsfLKeSPYalKdGtycx/G4gxOUI/M208dSJ1PQhH1fb9
	yDlYvdqynPl+Vh4TdeSNi1txztb/9VXMcjE15YdlRVoDWv/Iy4/5uQgZnUU3XzCNCg1wk97/4DhHb
	uR7wat6SaJnU0/bwBCZVhhWlxTp5HPmK/4yjHp5C7phcLZki6GSTNN5YolHPdhCdWkylEKkolfC8q
	Z+nTf7sn1whDLVlIqRAQjQGFyhmPQfATMVJ3D04Jp0RrrgmmiuSSf0Ya3O28ojX+QfPLQ3ucG4EHU
	BqNGyDxg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wt2OE-0000000AGzQ-2p7K;
	Sun, 09 Aug 2026 12:12:30 +0000
Received: from mail-qv1-xf2f.google.com ([2607:f8b0:4864:20::f2f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wt2OC-0000000AGyb-42Cu
	for linux-arm-kernel@lists.infradead.org;
	Sun, 09 Aug 2026 12:12:30 +0000
Received: by mail-qv1-xf2f.google.com with SMTP id 6a1803df08f44-8f0e5e36912so5234936d6.2
        for <linux-arm-kernel@lists.infradead.org>; Sun, 09 Aug 2026 05:12:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786277547; cv=none;
        d=google.com; s=arc-20260327;
        b=aQtz1DI++2x9bg4pgnE+WNrL31Yk5VOhb2hk83wO3OADi2DaZdW0NeZsbh4kx4wi1+
         OLs7y7hOTnOJ5TRZiC8CmQ8vBnSEhisJOIjlfF84vFkOLMcZa7jCY8hGwU+/RfScZE9q
         1C1jQWzoCrcT8g/T4mBUhoHR85zmPZ7ZfJTv9ap3/GgbJKbYOjdBHejfac4HpabszFJe
         bfWec67/zlcb1G8F0j0S5PWRlygN+wuWl+0eD7UBrLj3wUWqdlVyH1dzL/K2KN+DWRjv
         Phna/5hIXX/AgVeY5gIwe66cg9kCsQEIDhzVCfSIDlXT1dSr+5IrXs2Y2x0VhN72n20/
         RbRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=1F/+cfZIAkAn2MH5HWhnU43a68MUjIzWX0xwmyWQRGo=;
        fh=7tpVTIakn6CHqBWo9gaNkv33mgCTTAH8Yfdox4y85wc=;
        b=emMDGtJLUoJrHOzLI4uZTzZX+De4l63e6NezC3xW/CQcE6mcnlK7ZZCyLA6uy5nn6p
         UnQ2mPnUiTmKnWX/upYjWldrJ6lxU7/SQt1LfxRRCGLBDhc5ay+wn/C6usvR2dDaFlQs
         pBlQBtl2UM6BUYExS8XvsnROTtHNVhebRwGYuJawDxg1cYWiLkESVxdYDUdR5N9iL9k1
         hf6Exbg/LceaZW8yiqORWnlhsvSwruz+ut6VR1zV71FLXWnHwu6k5RJRfdbDR0pz1HkY
         00emhbcuDEEJOPXUQoOxNUWhETkLtwzVy0DtulEwxaVEAwGZFew4dYPE3pQxohppyFzN
         EtSQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786277547; x=1786882347; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=1F/+cfZIAkAn2MH5HWhnU43a68MUjIzWX0xwmyWQRGo=;
        b=kZ6dL5byDCyupt+QwW+dmtNoTrZNHj9ABpVX/x7M7aTsSuo6ryDMknKpFiqzOFr9A9
         3Y1wCoRIwMN04BpYO+SS56KCcty2SE07AWPq+wiEKOeSf3udRuayt5fIUSIvUOGOILXn
         WbE7C/Bli6p1mvLBlUSa7OSMsjyWzpelyGYO53HnLD9nHyh3xSgbavKZFFn+aQYnqTbR
         xEv7bGuAMfYp/HI1LyzCmW0QjN2g5dmV1FObb0e7nRVzXJsRQjBKQLaKYNSUZZrthL7T
         Y0LVYu8szMBaD+7ibA+KBV4wm6UdYS5nLVVFsUBHmk5L9hNi0fdmQ1WQBXQ5s/lFyXuH
         gjdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786277547; x=1786882347;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1F/+cfZIAkAn2MH5HWhnU43a68MUjIzWX0xwmyWQRGo=;
        b=RCiDmARdrw3CGBZU8AB8FgY1E10YD0klDuiEtHzXo502EWYLu8d6/nOLE2mZmuD+hc
         sK6uNR+Yj76DaeLn2ptdDBaN06osMsjOs6KK641zey/2096AUA+fMrEchRX3t3oaRoSo
         szKVCrRZ6ShrmZAnpIhXFz8GMLvJSSLei9rjiv76ZnZfNyc6QC4re1XE4VE+F4/RMID+
         dyKI+MleWAO5hNI4l42pI9VanYahrY/oK7Kuth97TktbR/ldDHedqtrYE09ek8H9PoMw
         DNhZOho2f84ENOh9bOgR9jWDgWeK+gaIJ/r1ASg9Vvul/UpYKfJA4VCTaYg1wT4z50Uu
         pzkQ==
X-Forwarded-Encrypted: i=1; AHgh+RoadfF+z9R6GesdlhIQ0kBnfklfN6myTVKXM5x7Zb07e2r7H1zmN5gsm3cI7mkAUeX+Dm5uKbupRo3HDSMmRd2s@lists.infradead.org
X-Gm-Message-State: AOJu0Yy3UW4r5GjLXizTBX21MWOEJkFB+UKZoeMEqsSG9aD1IqonRA8R
	VjKAuTXGrO7CRxXkfZqIXu3p0MjXmxPe2Jsn8kAfgQI6WdCucQU760evupSozb6iXTMbKt56PSp
	34lYUjhvNnwUSFeYWJIh/qXGOSivKT+Y=
X-Gm-Gg: AR+sD12wgt46VDGwaci21UNFM6QczmgH5ltFPCOqPLbubKQf5krpgofAxHfHCDAblIu
	qpSNCfnCb6KYYTK6PzWF6ZLL1FNLk2I9PVs28WxGpMsrK8Q/xwPhawQ4y2SIJZiA+4QuU8eyW+s
	KzndEvg4QJ96Apo223RTLpAWp6ongU5w4nhBuS5rA+pCfL1B0SJan6pdeqrYS9uQoLM2YHoePCC
	QriHIQzZTEzivwoNEioLLU5Zlz4i3hslA77k6KylL3AEWWl0KLbsDNZJs0FwfCvSH4ilHYLPHnA
	y9vZMqpTDumB0wINGjoeSbylgcd3Wz2xxNDPDplYww==
X-Received: by 2002:a05:6214:5346:b0:8ed:1887:426e with SMTP id
 6a1803df08f44-9088126d7cemr445146386d6.24.1786277547104; Sun, 09 Aug 2026
 05:12:27 -0700 (PDT)
MIME-Version: 1.0
References: <CAGXv+5HrDw8GWb9zp1AaQU9UW+0FGcr7jOV2jt_zi_2KgfgBqA@mail.gmail.com>
 <20260807152059.GA39821@bhelgaas>
In-Reply-To: <20260807152059.GA39821@bhelgaas>
From: "Christian Marangi (Ansuel)" <ansuelsmth@gmail.com>
Date: Sun, 9 Aug 2026 14:12:12 +0200
X-Gm-Features: AUfX_myzAmsvVlb0T_3tOngECWxC2UoI-Iw4nvKe7r1djj_0kecpEPp7cncj8nM
Message-ID: <CA+_ehUxQfWRRec4q2ZvC12nYAeV2VGm1xCFrTWeN6sEL+qkXBw@mail.gmail.com>
Subject: Re: [PATCH v5 0/2] PCI: mediatek-gen3: Add 2-lanes mode support + clock
To: Bjorn Helgaas <helgaas@kernel.org>
Cc: Chen-Yu Tsai <wenst@chromium.org>, Lorenzo Pieralisi <lpieralisi@kernel.org>, 
	=?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
	Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Ryder Lee <ryder.lee@mediatek.com>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Jianjun Wang <jianjun.wang@mediatek.com>, linux-pci@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260809_051229_014065_AC5E8710 
X-CRM114-Status: GOOD (  31.68  )
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

Il giorno ven 7 ago 2026 alle ore 17:21 Bjorn Helgaas
<helgaas@kernel.org> ha scritto:
>
> On Fri, Aug 07, 2026 at 11:24:09AM +0800, Chen-Yu Tsai wrote:
> > On Fri, Aug 7, 2026 at 12:53=E2=80=AFAM Christian Marangi <ansuelsmth@g=
mail.com> wrote:
> > > This small series introduce support for 2-lanes mode for Airoha AN758=
1
> >
> > Just a nitpick, but I would probably name this something else, like
> > "cross-controller lane-bonding mode" or "lane stealing"? PCIe already
> > has 2x lanes as a standard feature, so this naming is a bit confusing.
> > It's not like dual-LVDS display in which LVDS is only a single lane.
>
> I suggested the "2-lane" and "x2" terminology because I assumed the
> result is what the PCIe spec would describe as a "x2 Link" consisting
> of two Lanes.
>
> If that's not the case, maybe "cross-controller lane-bonding mode" or
> "lane stealing" would be more accurate, but I don't know what those
> mean, so if we use them I would also like to know what the result
> looks like in standard PCIe terms.
>

Mhhh I don't really like the term lane stealing. Also cross-controller
lane-bonding
might be a first. Even if correct it would complicate identification
of the feature
that at the end of the day configures the HW to provide a 2 lanes PCIe.

Consider that in such mode, the other PCIe controller gets disabled (this i=
s
handled in DT) so it's effectively enabling the standard PCIe 2x lanes
and apply the HW configuration for it.

> > > SoC. This is needed for correctly functionality of Eagle WiFi Card
> > > normally attached to this SoC that require a 2-line PCIe card to
> > > correctly work (and give the proper performance)
> > >
> > > The first 2 patch address a limitation of the PCIe implementation
> > > where the PERSTOUT reset were indirectly asserted and deasserted
> > > all at the same time (for all the 3 PCIe card) with PCIe
> > > enable and disable.
> > > The 2 patch address this and introduce correct reset to control
> > > reset line for the relevant PCIe line.
> > >
> > > The last 2 patch add additional logic and support to assert
> > > and deassert the PERSTOUT and also apply the required configuration
> > > for 2-lanes mode.
> > >
> > > 2-lanes mode is implemented in DT by adding the required property
> > > and by defining the "num-lanes" to 2.

