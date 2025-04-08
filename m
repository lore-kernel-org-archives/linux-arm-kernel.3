Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EEA95C369A2
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Apr 2025 14:52:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=W6zXisO6cvr6kicsWwvDso6VKfDBHFtaX4qs8BKIN18=; b=fWQkFBxXAiST7LDD2cgLQJg0rJ
	ig041x/hOFQAMVn1TgV3Fv+cWkJjHkNatVwp12WiagZ3lYY8cfQx9rzgewCLu4FJspS0YYrZnruJF
	QKArZZ+2E71WIfZuAF4CpPta3fmzs1YOeUXARKgnKeub43g0kReMpuY9XhAU6rQBuB8N68mFPlb8C
	RrP9omsDcvQ9Zv1fKOVj6fObS83Zyu6yc4fXe/RY7KBf82dRcp0GabAs62blF4WGcGlutNZRu5liq
	lEGRLyKyC21kRerQ0X+R5DMkC510SKepMUtteCfjafwtRoQWj0xc5CgfpQSTdZZgh6w9lmcBeoed2
	+Dljuamg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u2AJd-00000004T2n-3pHj;
	Tue, 08 Apr 2025 14:52:41 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u2AHr-00000004Sj0-0e79
	for linux-arm-kernel@lists.infradead.org;
	Tue, 08 Apr 2025 14:50:52 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 1D1C65C591A;
	Tue,  8 Apr 2025 14:48:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2297AC4CEE5;
	Tue,  8 Apr 2025 14:50:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744123849;
	bh=iippsYe8qLb/2X9/I9NX6d/fzC9lDY7Hh/+44sczz4g=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=NSMi+sI6BfxNdjGVuI7k1YPEEB3cI1ZteuMz/i77RX6ZKVVtc7G5wTT1aSxozuebA
	 XMflo8Dg43jH0NMQTNts8wq5qxJk/KX2JwIt/jhxJDVCZ4nfBlEdutImR4Y8TcCGYr
	 a/LZp8xVwK5rZ8s5TpytyreXMUjrkSIDT3dfjZA+mKTMjzNxb00w63F9LCi2sDaXhM
	 TIDpgJYw9Skn+WXlBrEQ6c6lH13pqYKgkqZjUgH+ju6TbeV8JhlZv2pzeLBH9H8w9a
	 hApED5WPIbOVRA8ssP34+b8l6uizHChdo0YvbYvAoSbbprKSYOk6daNln8naVIVuOY
	 ngrqmh3HwUXXQ==
Date: Tue, 8 Apr 2025 07:50:47 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Sean Anderson <sean.anderson@linux.dev>
Cc: netdev@vger.kernel.org, Andrew Lunn <andrew+netdev@lunn.ch>, "David S .
 Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Paolo
 Abeni <pabeni@redhat.com>, Russell King <linux@armlinux.org.uk>,
 linux-kernel@vger.kernel.org, upstream@airoha.com, Christian Marangi
 <ansuelsmth@gmail.com>, Heiner Kallweit <hkallweit1@gmail.com>, Kory
 Maincent <kory.maincent@bootlin.com>, Alexandre Belloni
 <alexandre.belloni@bootlin.com>, Alexandre Torgue
 <alexandre.torgue@foss.st.com>, Clark Wang <xiaoning.wang@nxp.com>, Claudiu
 Beznea <claudiu.beznea@microchip.com>, Claudiu Manoil
 <claudiu.manoil@nxp.com>, Conor Dooley <conor+dt@kernel.org>, Ioana Ciornei
 <ioana.ciornei@nxp.com>, Jonathan Corbet <corbet@lwn.net>, Joyce Ooi
 <joyce.ooi@intel.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Madalin
 Bucur <madalin.bucur@nxp.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Michal Simek <michal.simek@amd.com>, Nicolas Ferre
 <nicolas.ferre@microchip.com>, Radhey Shyam Pandey
 <radhey.shyam.pandey@amd.com>, Rob Herring <robh+dt@kernel.org>, Rob
 Herring <robh@kernel.org>, Robert Hancock <robert.hancock@calian.com>,
 Saravana Kannan <saravanak@google.com>, UNGLinuxDriver@microchip.com,
 Vladimir Oltean <vladimir.oltean@nxp.com>, Wei Fang <wei.fang@nxp.com>,
 devicetree@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [net-next PATCH v2 00/14] Add PCS core support
Message-ID: <20250408075047.69d031a9@kernel.org>
In-Reply-To: <20250407231746.2316518-1-sean.anderson@linux.dev>
References: <20250407231746.2316518-1-sean.anderson@linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250408_075051_246355_257BE00A 
X-CRM114-Status: GOOD (  10.21  )
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

On Mon,  7 Apr 2025 19:17:31 -0400 Sean Anderson wrote:
> This series depends on [1,2], and they have been included at the
> beginning so CI will run. However, I expect them to be reviewed/applied
> outside the net-next tree.

These appear to break the build:

drivers/acpi/property.c:1669:39: error: initialization of =E2=80=98int (*)(=
const struct fwnode_handle *, const char *, const char *, int,  unsigned in=
t,  struct fwnode_reference_args *)=E2=80=99 from incompatible pointer type=
 =E2=80=98int (*)(const struct fwnode_handle *, const char *, const char *,=
 unsigned int,  unsigned int,  struct fwnode_reference_args *)=E2=80=99 [-W=
incompatible-pointer-types]
 1669 |                 .get_reference_args =3D acpi_fwnode_get_reference_a=
rgs,   \

Could you post as RFC until we can actually merge this? I'm worried=20
some sleep deprived maintainer may miss the note in the cover letter
and just apply it all to net-next..
--=20
pw-bot: cr

