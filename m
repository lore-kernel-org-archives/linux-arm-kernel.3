Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B34E0C28B23
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Mar 2025 14:41:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+//d8YaKM1HPYqDbAwn6xqi0NfBlNp/hPbdkEog/gtk=; b=kZgmhy2y1f86pFb7S9pIkHi2Ox
	099OQPc6FmR1HkfEM7mJxwaiiHXt8RmzG7EXON7x4bvELbuj8I+tpx1qFiTjekSR+IWviiQakDyo9
	RIZ0T6soAqKTDShkYROb/+VSiZkxfARvAYCFza9LK5i/6IcObs21YiwR4Nk/jtECLki9Vj9ZLRf/A
	uAHVch4rKJybfQ6efrtbi4tbHInigsl+sWfT7FIyM3mTyiBn9qvyfJhjopXrEtIN1K1JgR8UDpwpO
	bsNzFZIq44ghyvk4gGSGOFsA0gxWSmIf8YP+CetBSOThQh9Q2OT+guB73Qwgf/XxOp93tza9jCs6V
	l+YHIYqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tqCPY-0000000BECo-1ynr;
	Thu, 06 Mar 2025 14:41:20 +0000
Received: from sender4-pp-f112.zoho.com ([136.143.188.112])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tqCNc-0000000BDym-35KY;
	Thu, 06 Mar 2025 14:39:21 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1741271947; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=f189TiqKaVtBiJW/aJ8g/VLuBqrAnVJqp8Mg2EopEtKZc26oVpxnjy3yehtmCDoo7D4qpSuK2NmEzpCweb7fR1vqnggfZN0noKIBt+yfDGOcC1uhUZIAGA8yZYx74hhwrwaZEpjp2bGyadbSpMw4YHKVmfZ+Gi9AdEMXyu/pQIY=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1741271947; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=+//d8YaKM1HPYqDbAwn6xqi0NfBlNp/hPbdkEog/gtk=; 
	b=e8b6+txvoTW3oZGE3zpaG4sgldvr/Ox9KnpAFU2TXac4jwwo/mjAZbNI+bNsUgjOd3YcBTHybdb6vyfZmkaJ1/kuSSRfTTPwO5nMKIh+iLpycP8XGJudZZ2S17xn37AE4HiodVgkij8pYRIYdnAmsIkaNN9RdO9HA63T1icpEqA=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=nicolas.frattaroli@collabora.com;
	dmarc=pass header.from=<nicolas.frattaroli@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1741271947;
	s=zohomail; d=collabora.com; i=nicolas.frattaroli@collabora.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Content-Type:Message-Id:Reply-To;
	bh=+//d8YaKM1HPYqDbAwn6xqi0NfBlNp/hPbdkEog/gtk=;
	b=DlU/j4AlaxuLJoq2T4Afnf+/npcH5yCOio/5SydONGIIzFiTihflwKdetE1L4f5i
	oU8XkhJfbAcv9FsopV7l8iiEoRqCD7Peurlo8e+86FEExWdz10aAS5tim1rjOfWdJul
	Sln4vqPfohijJjafwzjQkBltx8lP5D19+krFhHA0=
Received: by mx.zohomail.com with SMTPS id 174127194550959.191258083911634;
	Thu, 6 Mar 2025 06:39:05 -0800 (PST)
From: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
To: Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Heiko Stuebner <heiko@sntech.de>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, Philipp Zabel <p.zabel@pengutronix.de>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Sugar Zhang <sugar.zhang@rock-chips.com>,
 Krzysztof Kozlowski <krzk@kernel.org>
Cc: Luca Ceresoli <luca.ceresoli@bootlin.com>,
 Sebastian Reichel <sebastian.reichel@collabora.com>, kernel@collabora.com,
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org
Subject: Re: [PATCH 3/7] ASoC: dt-bindings: add schema for rockchip SAI controllers
Date: Thu, 06 Mar 2025 15:38:58 +0100
Message-ID: <8514337.T7Z3S40VBb@workhorse>
In-Reply-To: <81d60550-4929-48c1-b4d3-1473b902bf12@kernel.org>
References: <20250305-rk3576-sai-v1-0-64e6cf863e9a@collabora.com>
 <2376575.ElGaqSPkdT@workhorse>
 <81d60550-4929-48c1-b4d3-1473b902bf12@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250306_063920_847457_0318DBD9 
X-CRM114-Status: GOOD (  23.93  )
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

On Thursday, 6 March 2025 14:43:21 Central European Standard Time Krzysztof 
Kozlowski wrote:
> On 06/03/2025 14:13, Nicolas Frattaroli wrote:
> > On Thursday, 6 March 2025 08:42:54 Central European Standard Time
> > Krzysztof
> > 
> > Kozlowski wrote:
> >> On 05/03/2025 22:24, Nicolas Frattaroli wrote:
> >>> Rockchip introduced a new audio controller called the "Serial Audio
> >>> Interface", or "SAI" for short, on some of their newer SoCs. In
> >>> particular, this controller is used several times on the RK3576 SoC.
> >>> 
> >>> Add a schema for it, with only an RK3576 compatible for now. Other SoCs
> >>> may follow as mainline support for them lands.
> >>> 
> >>> Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
> >>> ---
> >>> 
> >>>  .../devicetree/bindings/sound/rockchip,sai.yaml    | 151
> >>>  +++++++++++++++++++++
> >> 
> >> Filename based on compatible.
> > 
> > Sure, but more compatibles will follow. Are you certain you want a file
> > named rockchip,rk3576-sai.yaml to then contain rockchip,rk3528-sai? If so
> > then I do
> Yes (or the other way around if 3528 is older)

They were released at about the same time from what I know. I'll pick the 
RK3576 though since it was the first to get upstream support.

> 
> > not understand the reason behind this policy.
> 
> So the name will match hardware, instead of sai.yaml, sai2.yaml,
> sai3.yaml and sai-green-frog.yaml.

Downstream called the compatible "sai-v1" so you're onto something here I'm 
afraid. :)

> 
> >>>  MAINTAINERS                                        |   6 +
> >>>  2 files changed, 157 insertions(+)
> >> 
> >> ...
> >> 
> >>> +
> >>> +  dma-names:
> >>> +    minItems: 1
> >>> +    maxItems: 2
> >>> +    oneOf:
> >>> +      - const: tx
> >>> +      - const: rx
> >>> +      - items:
> >>> +          - const: tx
> >>> +          - const: rx
> >> 
> >> Why all combinations are possible?
> > 
> > Because they are. sai5 in rk3576 is rx only. sai7 is tx only. Others are
> > both
> What is sai5 and sai7? Instances on the same chip? Does it mean some of
> instances can only receive and some only transmit?

sai5 and sai7 are instances on the same chip, yes, see rk3576.dtsi changes in 
this series. Some instances can only receive, some can only transmit. Some can 
do both. I think the way I wrote the binding already allows for just "tx", 
just "rx", and "tx, rx" but not "rx, tx", which is I think what we want here.

> 
> > tx and rx. Do you want me to enforce that those with both are always tx
> > followed by rx?
> 
> Best regards,
> Krzysztof

Cheers,
Nicolas Frattaroli




