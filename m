Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E94A9C71141
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 14 Jun 2025 11:11:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=e8lIQX1RhoFgT10N8YKrRLRbZf5gcBZWZ3yjEM3FJv8=; b=rmhgcIGNQGMkFapJF3bcAQ7yK7
	dRMHDoC1aP6wu4nBYlysYbO0BoSmXESEu0FsIENb6b+adMrwz3I5mGhW2XxwjMU3Z1jPMZjOjF1Fq
	k4/fg6TbKoJ6XU/MuOO0IDsFxCg9fw1e6dN0OFW/6ikQQGmxNfu/JTKN/WJjM2zCtbTNSaH5jrPEB
	F7claVAkT6AT4+msG+uQSMwzFRComuhq02q1jHw75Bn9q2hpbl6HvaaA7ANxUCugwy+e1aBIrQ0AC
	4FzKinl2s4JCjLALksqfP5HmyP52jA4sn1whDu8MMY9JAA/mXTAgbJw3jIDvF2eWQpFAR9lSETI38
	YBjync2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uQOmn-00000001AR3-2XjM;
	Sat, 14 Jun 2025 11:10:57 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uQOkW-00000001ALv-1cQb
	for linux-arm-kernel@lists.infradead.org;
	Sat, 14 Jun 2025 11:08:37 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 119D04A284;
	Sat, 14 Jun 2025 11:08:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3D9A3C4CEEF;
	Sat, 14 Jun 2025 11:08:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749899314;
	bh=e8lIQX1RhoFgT10N8YKrRLRbZf5gcBZWZ3yjEM3FJv8=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=debgul3IwFpyHn2BjIjKMwWjvW1oBXqpauRenlMl4eIJudR51MoBbrO0P1AiRN+lg
	 5VdStoRc+i2HkmEk7y+nyWc2cr10gliBU1V/haXN2va5wtU1XCReinIzNv2PeB/IUS
	 /tDAkVi7TZaMtdti9FYizgOHFQCA6eJMU8cbc9dpSiB0BCwMEWawKGY05lBCKGMzLI
	 bewyVLyapd2SMgZbn/NC+OXd/NWulf7ICfVWYxetNaBTRLWiUr64FAXWK85NvF4p6+
	 bQTQ9LQYPdp38bP2ANyXMOv2VUamYDqBCH+Exuf2n326kFJ6mBty0g0gL+B6ihgWyW
	 jQB/iKEqtuxLA==
Date: Sat, 14 Jun 2025 12:08:27 +0100
From: Jonathan Cameron <jic23@kernel.org>
To: David Lechner <dlechner@baylibre.com>
Cc: "Jiri Slaby (SUSE)" <jirislaby@kernel.org>, tglx@linutronix.de,
 linux-kernel@vger.kernel.org, Nuno =?UTF-8?B?U8Oh?= <nuno.sa@analog.com>,
 Andy Shevchenko <andy@kernel.org>, Maxime Coquelin
 <mcoquelin.stm32@gmail.com>, Alexandre Torgue
 <alexandre.torgue@foss.st.com>, linux-iio@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2] iio: adc: stm32-adc: Use dev_fwnode()
Message-ID: <20250614120827.54b2e77a@jic23-huawei>
In-Reply-To: <46208c8d-8370-4b9e-bca1-7ede7ee9b078@baylibre.com>
References: <0ec0fd5e-8fbe-43c4-8aad-f36d2872f280@baylibre.com>
	<20250612084627.217341-1-jirislaby@kernel.org>
	<46208c8d-8370-4b9e-bca1-7ede7ee9b078@baylibre.com>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.48; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250614_040836_445734_6785CDEC 
X-CRM114-Status: GOOD (  11.73  )
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

On Fri, 13 Jun 2025 12:00:10 -0500
David Lechner <dlechner@baylibre.com> wrote:

> On 6/12/25 3:46 AM, Jiri Slaby (SUSE) wrote:
> > irq_domain_create_simple() takes fwnode as the first argument. It can be
> > extracted from the struct device using dev_fwnode() helper instead of
> > using of_node with of_fwnode_handle().
> >=20
> > So use the dev_fwnode() helper.
> >=20
> > Signed-off-by: Jiri Slaby (SUSE) <jirislaby@kernel.org>
> > Cc: Jonathan Cameron <jic23@kernel.org>
> > Cc: David Lechner <dlechner@baylibre.com>
> > Cc: "Nuno S=C3=A1" <nuno.sa@analog.com>
> > Cc: Andy Shevchenko <andy@kernel.org>
> > Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>
> > Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>
> > Cc: linux-iio@vger.kernel.org
> >=20
> > --- =20
> Reviewed-by: David Lechner <dlechner@baylibre.com>
>=20
>=20
Applied. Thanks

