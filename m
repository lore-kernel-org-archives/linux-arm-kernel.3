Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF5E9CCD192
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Oct 2025 12:55:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NyCDOZrVB//07BPd6+GXYHFSqEEcVLNlH+OBjCmleEs=; b=COwONabFNMkuvg55e1jVTrr4yH
	vDXt51otd89fRl8W2fTwz7csT3MwmOPGffZKaoJ340Qs95kRMI62r8JgzprLNS1833o9D2fVr5lIW
	ECFQHUqGpr4hgQzhN9Z+9M7t//N6xmATVSZ2dzMQX9HKN5+xCdI7+LgREdLXodKkZbUCCZOmMZvCW
	fmtBD+nlp/LzWv7nAFz5+bgcdscXhVOPOwfvlolwx5hdrYK50kt2H+nqli8QAG2I+7t6J1xNSWStA
	5w5xKycu/erOwey39yqmX4baFa40AgHKbGiKP5U0aLppFlRVYjiGrnUdp/iOXBylIzaUwc66kwoUA
	G5MMB61g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v912T-00000001baC-1Ssw;
	Wed, 15 Oct 2025 12:55:33 +0000
Received: from smtpout-04.galae.net ([185.171.202.116])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v912P-00000001bZT-41ku
	for linux-arm-kernel@lists.infradead.org;
	Wed, 15 Oct 2025 12:55:31 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 113BDC09FBF;
	Wed, 15 Oct 2025 12:55:08 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 1DD15606F9;
	Wed, 15 Oct 2025 12:55:27 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 8B304102F22CE;
	Wed, 15 Oct 2025 14:55:20 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1760532926; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=NyCDOZrVB//07BPd6+GXYHFSqEEcVLNlH+OBjCmleEs=;
	b=CsKF6TcAWd5LfvC7ftYlRfzRDPv4j5akgSTQ45lu65C1SVhGdY9r2HNWLqTrnEUvIMvL9u
	8lPLP7bQzTuztsBusuz4954KALlHGlmex6RSYSLvK36KQrJcNmzQDqeRcVct/NL1F5RKvs
	nBrBEQbvpQ44bMOixhIiGNdsRh1QhAjfK7YiYTfPIkIrJUERSKaOvc/PBP8zsnEJRVnpdK
	psbdGr56bEveRnQsfaU3yXP2mMxcKpBL8wkQSSt6RTheJ3mo789W89lSSZjJ7mNxRRcvOu
	Oqf34+rAbXBUUpaLEH7OjF7VG1Azeq2I8FLFeYZ5wryPje6OYDJL0L01S+0UYg==
Date: Wed, 15 Oct 2025 14:55:19 +0200
From: Kory Maincent <kory.maincent@bootlin.com>
To: Maxime Chevallier <maxime.chevallier@bootlin.com>
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>, Jose Abreu
 <joabreu@synopsys.com>, Andrew Lunn <andrew+netdev@lunn.ch>,
 davem@davemloft.net, Eric Dumazet <edumazet@google.com>, Jakub Kicinski
 <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Maxime Coquelin
 <mcoquelin.stm32@gmail.com>, Richard Cochran <richardcochran@gmail.com>,
 Russell King <linux@armlinux.org.uk>, Alexis =?UTF-8?B?TG90aG9yw6k=?=
 <alexis.lothore@bootlin.com>, Thomas Petazzoni
 <thomas.petazzoni@bootlin.com>, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH net-next 0/3] net: stmmac: Add support for coarse
 timestamping
Message-ID: <20251015145519.280b6263@kmaincent-XPS-13-7390>
In-Reply-To: <20251015102725.1297985-1-maxime.chevallier@bootlin.com>
References: <20251015102725.1297985-1-maxime.chevallier@bootlin.com>
Organization: bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.41; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251015_055530_199536_24D1F7CF 
X-CRM114-Status: GOOD (  12.12  )
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

On Wed, 15 Oct 2025 12:27:20 +0200
Maxime Chevallier <maxime.chevallier@bootlin.com> wrote:

> Hello everyone,
>=20
> This is another attempt to support the fine vs coarse timestamping modes
> in stmmac.
>=20
> This mode allows trading off PTP clock frequency adjustment precision
> versus timestamping precision.
>=20
> In coarse mode, we lose the ability to fine-tune the PTP clock
> frequency, but get better timestamping precision instead. This is
> especially useful when acting as a PTP Grand Master, where the PTP clock
> in sync'd to a high-precision GPS clock through PPS inputs.
>=20
> This has been submitted before as a dedicated ioctl() back in 2020 [1].
> Since then, we now have a better representation of timestamp providers
> with a dedicated qualifier (approx vs precise).
>=20
> This series attempts to map these new qualifiers to stmmac's
> timestamping modes, see patch 2 for details.
>=20
> The main drawback IMO is that the qualifiers don't map very well to our
> timestamping modes, as the "approx" qualifier actually maps to stmmac's
> "coars" mode, but we actually gain in timestamping precision (while
> losing frequency precision).

https://elixir.bootlin.com/linux/v6.17.1/source/include/uapi/linux/net_tsta=
mp.h#L16
"approx" was initially added for DMA timestamp point.
Maybe we should add a new enum value here with a more suitable name.

Regards,
--=20
K=C3=B6ry Maincent, Bootlin
Embedded Linux and kernel engineering
https://bootlin.com

