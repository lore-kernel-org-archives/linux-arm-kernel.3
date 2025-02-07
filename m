Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 729FAC02199
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Feb 2025 13:56:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nTIUisbXh4QjJS+LI8f+3ax5wyozSgfahYNeRHOmjd8=; b=Xi/jnJNYUYd0mpiZJdrm1Bx9Qi
	bNeqLl9ytD5mgD342Tdg3F1Lz2wku5N2jzkge2OAl8f6qegkqFKsDPIf6ZM8uAsjqLjA8mxSHLhbS
	6l6N9T0F+KjnW0T5+lcpovK75ipCkIlvHxDweuhd/85+hk84juDylA1mMoytRCfTpnxjF/UDNdZor
	BGZTy5xkyj+pfGLTWc7lj9YYEnRWatX+VvTjK+rNND4wJMmETnGZPGpJbzLNkYviWHPmlyr3p6wdl
	3jKu1bn/hcYODtcLtHJL0saS9Ou703z1c+q0yqSsPd+61OjyPkxQ61r+J5dyIxn0OJ71UJZkSyqOh
	cO3B4/QA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tgOpn-00000009jcO-27zQ;
	Fri, 07 Feb 2025 13:55:55 +0000
Received: from mx1.tq-group.com ([93.104.207.81])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tgOoO-00000009jKn-0lSj
	for linux-arm-kernel@lists.infradead.org;
	Fri, 07 Feb 2025 13:54:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1738936468; x=1770472468;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=nTIUisbXh4QjJS+LI8f+3ax5wyozSgfahYNeRHOmjd8=;
  b=McjOa39aQadaQ7JHLisnurl9xlRky8rK31PuIYU1dNe+bkJBuOoQEKiC
   dW6n0aGPT2gW/a9a7of0X5zY/O3r/W1d+IqiHXc4s+39IUg+4ivbojW2N
   hZOH3HVQhHLt5BNMJMDanKQfcQ8SDqXOEum4GqP3RSJn11P76gXF5aZrg
   Z9a9SYc3HR6uxHvj7AmRmyUDxDyu0rI7a2lcGLfDWu3gYhLO2PTHB0wYB
   Tb4mLV0GjNjAFa0cxC6mPpYFFPg/k7uyDZKifuHZKSHEwrlTkg8c/WEBF
   25p1/NZrQ+Ow2b1gAxQd8DvbNA9JRiPX0C0NDZzmg+fLuH5HA6R7T4fXD
   w==;
X-CSE-ConnectionGUID: SkqYzeS5Rt+3j4CFbpj6KA==
X-CSE-MsgGUID: MgMByEkoQciFcPo1UoKVkg==
X-IronPort-AV: E=Sophos;i="6.13,267,1732575600"; 
   d="scan'208";a="41645049"
Received: from vmailcow01.tq-net.de ([10.150.86.48])
  by mx1.tq-group.com with ESMTP; 07 Feb 2025 14:54:03 +0100
X-CheckPoint: {67A6107B-3-8F72533B-EF5B5974}
X-MAIL-CPID: 3037226F90E1CD7D000B19975831E324_1
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id E727E166061;
	Fri,  7 Feb 2025 14:53:56 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ew.tq-group.com;
	s=dkim; t=1738936438;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=nTIUisbXh4QjJS+LI8f+3ax5wyozSgfahYNeRHOmjd8=;
	b=cexhNhoejlZHe3odS8rdMig4FKDNX8jkHE+AAJeDbCmBDLy8YuQUlbzP6fWBZiP1rC0QLT
	yWXEmulgysfbhX1aRVaZBJ6BwTCj6qIjGrR9UudolHbudaVgdUeNc0Io0215+DKf9tfVGG
	vNwvY/VrGhBJkn1DLwIbnRJZcWZCQGC6a60dPEeMRnMy66gwEKJnLEUUThGGgKvNzdw3+f
	I6OS76LGXJaMrOq83RL6pGv+iA0fJE6DcjitJujqnj6saXLOuA59dtnBIiXUCdn85yCMrn
	DPRFLnpKm7FBwq2E3x0fg47691IDkpNncOOJKTr6cUiG/r+63vrBrTRZcSQhsg==
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>
Cc: linux@ew.tq-group.com, devicetree@vger.kernel.org, imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/3] TQMa93xx fixes
Date: Fri, 07 Feb 2025 14:53:56 +0100
Message-ID: <3882355.iIbC2pHGDl@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <20250107141117.984652-1-alexander.stein@ew.tq-group.com>
References: <20250107141117.984652-1-alexander.stein@ew.tq-group.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250207_055428_705066_D4F16E5A 
X-CRM114-Status: UNSURE (   8.91  )
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

Hello,

Am Dienstag, 7. Januar 2025, 15:11:14 CET schrieb Alexander Stein:
> Hi,
>=20
> this series includes small fixes to TQMa93xx DT:
> * Sorting DT nodes alphabetically
> * Invert default for Powerdown/Disables on Mini-PCIe slot
> * Swap order of ethernet devices
>=20
> Alexander Stein (3):
>   arm64: dts: freescale: imx93-tqma9352-mba93xxca: sort pinctrl nodes
>   arm64: dts: mba93xxca: Do not assert power-down pins
>   arm64: dts: tqma9352-mba93xx[cl]a: swap ethernet aliases
>=20
>  .../freescale/imx93-tqma9352-mba93xxca.dts    | 54 +++++++++----------
>  .../freescale/imx93-tqma9352-mba93xxla.dts    |  6 +--
>  2 files changed, 30 insertions(+), 30 deletions(-)

Any comment on this series? Thanks

Best regards,
Alexander
=2D-=20
TQ-Systems GmbH | M=FChlstra=DFe 2, Gut Delling | 82229 Seefeld, Germany
Amtsgericht M=FCnchen, HRB 105018
Gesch=E4ftsf=FChrer: Detlef Schneider, R=FCdiger Stahl, Stefan Schneider
http://www.tq-group.com/



