Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C46F6CA5FD2
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  1 Oct 2026 13:13:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yb9TIGDgeZFCPu4ArY1ZqKK0e4HMHQgLsozLDps0YOQ=; b=Q1xI0bSLMHbU62Ecwh/ak+XRB+
	f+ulm826klAZ5UfwyPKU9h2sT38FXE1JjYzItkCZPXuhcxAKks7AiHWXS/Xx6lfBka7QAifOwedvN
	bllm0gnnfVsnaEatgP9IwXINeW1ddFT5mUN4IT1E9vQ91uSyNNCqEBzyr9Hx9HjobUrvNqF0L4ZEe
	E6nzcDZHQG7eoWDCzpolaSHODoAb9RInwlDIhHKhT3Wc58Ula5A40naYX9WrUGYBHhH6qm/d4O55Y
	AMPBn6406XeySjZqpZOjcuazlUeW3H/5PuKVq3piFEJG/705coV/oDW9ej7pBOJjiYlGNsqvXzI82
	oEbolEAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCGbK-00000009CG0-2lWX;
	Thu, 01 Oct 2026 13:13:30 +0000
Received: from sender5-pp-g120.zoho.com ([165.173.182.120])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCGbH-00000009CBz-1dix;
	Thu, 01 Oct 2026 13:13:29 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1790860388; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=bawph5s96Kai3wqlDMEC60ATyaNTKtJTHa0WO+6hfiOMm6Z4LC5gBkaYQsJ8vUb4OcuQY0q66/qYABrRwZItYGkYKf0FYu8ZssmmWs7qx6c2FWGZq4nBArYevF3fnU9HGoIOERlEkbWKh2AO4kgeIjAl0Qd6C6nNUbzofz8F6AQ=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1790860388; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=yb9TIGDgeZFCPu4ArY1ZqKK0e4HMHQgLsozLDps0YOQ=; 
	b=MXWI2QAx4o+nUgmIxyzuFOZLecMWCyIYAGgZnidZ1toI4t793Hk0clikWrmVf5dYsZJlbK3eFZVWXUeAelbSY/ffvfBDKdlf9ilmuv8lhd4kVuVl6x3mzg+NzyNzH0FIisF4ak+gWy5sgqcw124Ogu/CnctCZnTFhkH8SA9rehE=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=louisalexis.eyraud@collabora.com;
	dmarc=pass header.from=<louisalexis.eyraud@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1790860388;
	s=zohomail; d=collabora.com; i=louisalexis.eyraud@collabora.com;
	h=Message-ID:Subject:Subject:From:From:To:To:Cc:Cc:Date:Date:In-Reply-To:Content-Type:Content-Transfer-Encoding:MIME-Version:Message-Id:Reply-To;
	bh=yb9TIGDgeZFCPu4ArY1ZqKK0e4HMHQgLsozLDps0YOQ=;
	b=a85NZ1qLDVPYiYMxWxaLgRqOmu87ciHLp0gysp+DDKvlqXXaRlL5iXwzDPMV1yci
	MNKcJvfJxCQhsqVM5wDwlg1IxICuhW9pXL8//s4w/SrlE4b+8TvkPS88pH49mtFpDoV
	O/YqR9Ez+PnW+S7mhSRNqmTZ5Qki9d/+sIgMGdDE=
Received: by smtp.zohomail.com with SMTPS id 1790860388058520.321937422743;
	Thu, 1 Oct 2026 06:13:08 -0700 (PDT)
Message-ID: <edfe9ef6680fd5de35de0c021302381e63d9e3de.camel@collabora.com>
Subject: Re: [PATCH net-next v2 1/7] dt-bindings: net: mediatek-dwmac: add
 support for MT8189 SoC
From: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>,  Eric Dumazet <edumazet@google.com>, Jakub Kicinski
 <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley	
 <conor+dt@kernel.org>, Richard Cochran <richardcochran@gmail.com>, Matthias
 Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno	
 <angelogioacchino.delregno@collabora.com>, Biao Huang
 <biao.huang@mediatek.com>,  Maxime Chevallier
 <maxime.chevallier@bootlin.com>, Maxime Coquelin
 <mcoquelin.stm32@gmail.com>, Alexandre Torgue	
 <alexandre.torgue@foss.st.com>, kernel@collabora.com,
 netdev@vger.kernel.org, 	devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, 	linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, 
	linux-stm32@st-md-mailman.stormreply.com
Date: Thu, 01 Oct 2026 15:13:01 +0200
In-Reply-To: <20260929-shrewd-rampant-shark-98e87e@quoll>
References: <20260924-dwmac-mediatek-mt8189-v2-0-430bd74d5ef9@collabora.com>
	 <20260924-dwmac-mediatek-mt8189-v2-1-430bd74d5ef9@collabora.com>
	 <20260929-shrewd-rampant-shark-98e87e@quoll>
Organization: Collabora Ltd
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.60.2 (3.60.2-2.fc44) 
MIME-Version: 1.0
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261001_061327_509869_563D2F0E 
X-CRM114-Status: GOOD (  17.44  )
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

Hi Krzysztof,

On Tue, 2026-09-29 at 09:36 +0200, Krzysztof Kozlowski wrote:
> On Thu, Sep 24, 2026 at 09:23:24AM +0200, Louis-Alexis Eyraud wrote:
> > +=C2=A0 - if:
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 properties:
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 compatible:
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 contains:
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 enu=
m:
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 - mediatek,mt8189-gmac
> > +=C2=A0=C2=A0=C2=A0 then:
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 properties:
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 clocks:
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 items:
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - d=
escription: MAC Main clock
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - d=
escription: PTP clock
>=20
> snps,dwmac schema expects the second clock to be the pclk. Why is it
> missing? This should be explained in the commit msg.
>=20
> Best regards,
> Krzysztof
>=20
Indeed, there is something incorrect.

I looked again at the MT8189 datasheets and there does not seem to have
specific peripheral clock for Ethernet MAC in the SoC clock list. The
paragraph related to clocks also lists the mac main and ptp reference
clocks as the ones to turn on. There is also another RMII reference
clock, only needed for RMII case, but I removed from mt8189 clock list
in the bindings after v1 review ([1]).

But at the same time, the Ethernet MAC block diagram, present in the
datasheets, shows this IP is interconnected to the rest of SoC with AXI
and APB interfaces (and in MT8188 datasheet too).
There is no APB related clock that is specific to the IP in MT8189,
contrary to MT8188 or MT819. But since it is on an APB bus (likely
shared between multiple IPs), then there is a bus clock for peripheral
access. Describing the IP having it makes sense (and for AXI too).

So, in order to resolve this issue, would it be OK that I rework the
MT8189 clock list to add "axi" and "apb" clocks and reword the commit
message with additional details on clocks?

[1]:
https://lore.kernel.org/all/b810b9cd-8f5e-4c9d-8496-908aae55dac1@lunn.ch/

Best regards,
Louis-Alexis

