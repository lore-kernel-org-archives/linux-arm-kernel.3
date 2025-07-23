Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7FF04C83F17
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Jul 2025 06:59:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=s022kua0cUEAxtsoBnjljjHlntUp4fU9k6QUycSxTlk=; b=R7n/qj9grviCGZYDF/H6O6QjhM
	JSTtxoNBcDL5i+AHRg8gxp9VZnvzpXq9kUGcjPz7FJKq7GscGvTFw1fIyfLJPI4aJdBf82sNAzPE0
	XmY14sYtp7R/V68C+XvG41a9SAq+k6/nG0pA8UgUjcNJ/cPWm3lcVjRd0KI1mlAJmb7q7NSPmkpu9
	SDTFafvhrkwd+HMg+YBHisFlEdhbbkzG9rGwlLz/KZJbzxXr8NzKh53UiiC7jT5+zFNTcMnvsXB5S
	lhrQn5tu22ZtHzb9COpIYcFKBJyrGEfuyZuPnq4+NYezJyXjk/GL7yAbFHj7niBrC0tch6Sl1BzU6
	rKcgE8mA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ueTS8-00000004BQ3-2Ayc;
	Wed, 23 Jul 2025 06:59:48 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ueTPf-00000004Asq-19J7
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Jul 2025 06:57:15 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 3DA5C66911;
	Wed, 23 Jul 2025 06:57:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4E611C4CEF4;
	Wed, 23 Jul 2025 06:57:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753253833;
	bh=JIfE9XgM6zvzb89Yq0cMzIJaAN+lyRfDNIOGeiBWxII=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=s0iXpUXSq5lTOFR2KZjz0yWzsRJGefnwMpQCGHqr2UHa+TIw2Dh6DzOZXkf8/imon
	 0bGr7Kgp/lD+i2mZIEJHxxOrDZmTrjQijh2UL2b84WaquG04VZ9Ut5MFYvOnr049Z9
	 LuUu7yzOLeUrjOixMjKJ+PacUYHUpY3rvXeDFGyFjVRco6nszYyy1P+4Y8UFZ2ZySJ
	 sfOXhwU16i3QFTgGWkkM9J+on6wmCtANTQAqUNKz8E/sT7me5gRRseuJpGvOTgIysJ
	 jdEOoygpFDk7HA1ZMpBca197nzb3zukm8DY8FJySkg1wd+/LExayXRMrnNsEsWI7oe
	 MKCdWHMbjk7GQ==
Date: Wed, 23 Jul 2025 08:57:11 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: =?utf-8?Q?Cl=C3=A9ment?= Le Goffic <clement.legoffic@foss.st.com>
Cc: Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Jonathan Corbet <corbet@lwn.net>, Gatien Chevallier <gatien.chevallier@foss.st.com>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Gabriel Fernandez <gabriel.fernandez@foss.st.com>, Le Goffic <legoffic.clement@gmail.com>, 
	Julius Werner <jwerner@chromium.org>, linux-arm-kernel@lists.infradead.org, 
	linux-perf-users@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-stm32@st-md-mailman.stormreply.com, linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-clk@vger.kernel.org
Subject: Re: [PATCH v3 07/19] dt-bindings: memory: factorise LPDDR channel
 binding into memory channel
Message-ID: <20250723-zealous-turtle-of-perfection-e67aee@kuoka>
References: <20250722-ddrperfm-upstream-v3-0-7b7a4f3dc8a0@foss.st.com>
 <20250722-ddrperfm-upstream-v3-7-7b7a4f3dc8a0@foss.st.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20250722-ddrperfm-upstream-v3-7-7b7a4f3dc8a0@foss.st.com>
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

On Tue, Jul 22, 2025 at 04:03:24PM +0200, Cl=C3=A9ment Le Goffic wrote:
> LPDDR and DDR channels exist and share the same properties, they have a
> compatible, ranks, and an io-width.

Maybe it is true for all types of SDRAM, like RDRAM and eDRAM, but I
don't think all memory types do.

I think this should be renamed to sdram-channel.

>=20
> Signed-off-by: Cl=C3=A9ment Le Goffic <clement.legoffic@foss.st.com>
> ---
>  ...pddr-channel.yaml =3D> jedec,memory-channel.yaml} | 26 +++++++++++---=
--------
>  1 file changed, 13 insertions(+), 13 deletions(-)
>=20
> diff --git a/Documentation/devicetree/bindings/memory-controllers/ddr/jed=
ec,lpddr-channel.yaml b/Documentation/devicetree/bindings/memory-controller=
s/ddr/jedec,memory-channel.yaml
> similarity index 82%
> rename from Documentation/devicetree/bindings/memory-controllers/ddr/jede=
c,lpddr-channel.yaml
> rename to Documentation/devicetree/bindings/memory-controllers/ddr/jedec,=
memory-channel.yaml
> index 34b5bd153f63..3bf3a63466eb 100644
> --- a/Documentation/devicetree/bindings/memory-controllers/ddr/jedec,lpdd=
r-channel.yaml
> +++ b/Documentation/devicetree/bindings/memory-controllers/ddr/jedec,memo=
ry-channel.yaml
> @@ -1,16 +1,16 @@
>  # SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>  %YAML 1.2
>  ---
> -$id: http://devicetree.org/schemas/memory-controllers/ddr/jedec,lpddr-ch=
annel.yaml#
> +$id: http://devicetree.org/schemas/memory-controllers/ddr/jedec,memory-c=
hannel.yaml#
>  $schema: http://devicetree.org/meta-schemas/core.yaml#
> =20
> -title: LPDDR channel with chip/rank topology description
> +title: Memory channel with chip/rank topology description
> =20
>  description:
> -  An LPDDR channel is a completely independent set of LPDDR pins (DQ, CA=
, CS,
> -  CK, etc.) that connect one or more LPDDR chips to a host system. The m=
ain
> -  purpose of this node is to overall LPDDR topology of the system, inclu=
ding the
> -  amount of individual LPDDR chips and the ranks per chip.
> +  A memory channel is a completely independent set of pins (DQ, CA, CS,

A memory channel of SDRAM memory like DDR SDRAM or LPDDR SDRAM is ...

> +  CK, etc.) that connect one or more memory chips to a host system. The =
main
> +  purpose of this node is to overall memory topology of the system, incl=
uding the
> +  amount of individual memory chips and the ranks per chip.
> =20
>  maintainers:
>    - Julius Werner <jwerner@chromium.org>
> @@ -26,14 +26,14 @@ properties:
>    io-width:
>      description:
>        The number of DQ pins in the channel. If this number is different
> -      from (a multiple of) the io-width of the LPDDR chip, that means th=
at
> +      from (a multiple of) the io-width of the memory chip, that means t=
hat
>        multiple instances of that type of chip are wired in parallel on t=
his
>        channel (with the channel's DQ pins split up between the different
>        chips, and the CA, CS, etc. pins of the different chips all shorted
>        together).  This means that the total physical memory controlled b=
y a
>        channel is equal to the sum of the densities of each rank on the
> -      connected LPDDR chip, times the io-width of the channel divided by
> -      the io-width of the LPDDR chip.
> +      connected memory chip, times the io-width of the channel divided by
> +      the io-width of the memory chip.
>      enum:
>        - 8
>        - 16
> @@ -51,8 +51,8 @@ patternProperties:
>    "^rank@[0-9]+$":
>      type: object
>      description:
> -      Each physical LPDDR chip may have one or more ranks. Ranks are
> -      internal but fully independent sub-units of the chip. Each LPDDR b=
us
> +      Each physical memory chip may have one or more ranks. Ranks are
> +      internal but fully independent sub-units of the chip. Each memory =
bus
>        transaction on the channel targets exactly one rank, based on the
>        state of the CS pins. Different ranks may have different densities=
 and
>        timing requirements.
> @@ -107,7 +107,7 @@ additionalProperties: false
> =20
>  examples:
>    - |
> -    lpddr-channel0 {
> +    memory-channel0 {

If doing this, then separate commit based on generic node name
convention. But then we need to come with generic node name first,
sdram-channel?

And also '-0', not '0' suffix.

Best regards,
Krzysztof


