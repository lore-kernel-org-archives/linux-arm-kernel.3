Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AEBF1C83030
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Jul 2025 02:13:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nghdqr1TNgA7GTnWXSxnqQpSMH1Jj0RJB/prk1nIUIw=; b=IrfHCwhI5Eae0S2+1Y19GwRNLz
	8kTUnNm61X0HhlS0CAxlY/bAyKUKXoX0QykSKluiL2cWOkaKVUrgugTR0gy49JGoWrpQ8URRqvVEI
	w+UwKcBUqEyvxQiibH8kqEPfDRaODmCwK6RMV1AUG+jBQxcjrUiuKLdsgev513JrRA8+auKa/jeEC
	A0bp3zNVGIjgKq97LCsIyzAG0GQ+fPy2y1E13qf1K/V05iqxKOuv1eCOoArfmdS44UG5e5URr8r6v
	c9RSsDz1Jkfi6XdI7JHwiA92P1yA+3zUkzQ7+Boj7lZjDRNPMUbxUqRagixt1pBN4I/31D0mLfngO
	50Vcn4xA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYxq4-000000043e6-1p91;
	Tue, 08 Jul 2025 02:13:44 +0000
Received: from pi.codeconstruct.com.au ([203.29.241.158] helo=codeconstruct.com.au)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYxjP-000000042KE-1Vuz
	for linux-arm-kernel@lists.infradead.org;
	Tue, 08 Jul 2025 02:06:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1751940409;
	bh=nghdqr1TNgA7GTnWXSxnqQpSMH1Jj0RJB/prk1nIUIw=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=efnZSxRjJWL650CnneLc0hEdvRZaLwoT/UZWjOeiMpODmJ9Qh7k66Ejf1RFGcD+Si
	 RNbW+BHbe8Wbnxg9j5DjAZiT7uANwG9Kl+ZiHYTslCR8NaxSaCDFvl/BPD6lx70ygU
	 gc6kXs/SoeLzq23e6EOWOCW+SEZlnFRaPsCHJsFy9X65evzc+eKBNfCeXPueyyNrWB
	 g678EnZT064/eewjQKeW6naXKWK1grI0oNvOM+1stcQoXJDMJaevtV/6nzBkPw9bBP
	 ZstormeTgESK2Wz847+nLuUXSEAsBD+pYRWcEcJtLBAIpwPLIkb2a8vuNX3xaa3u23
	 7C+Vhb6Sb3ppA==
Received: from [192.168.68.112] (unknown [180.150.112.153])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 26C476AE34;
	Tue,  8 Jul 2025 10:06:49 +0800 (AWST)
Message-ID: <7e4738d944c611cfb0e4eba4ce2926ed55a0096a.camel@codeconstruct.com.au>
Subject: Re: [PATCH v2 06/10] soc: aspeed: lpc-snoop: Rearrange channel paths
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Jean Delvare <jdelvare@suse.de>
Cc: linux-aspeed@lists.ozlabs.org, Joel Stanley <joel@jms.id.au>, Henry
 Martin <bsdhenrymartin@gmail.com>, Patrick Rudolph
 <patrick.rudolph@9elements.com>,  Andrew Geissler <geissonator@yahoo.com>,
 Ninad Palsule <ninad@linux.ibm.com>, Patrick Venture <venture@google.com>, 
 Robert Lippert <roblip@gmail.com>, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Date: Tue, 08 Jul 2025 11:36:48 +0930
In-Reply-To: <20250704173443.3436f535@endymion>
References: <20250616-aspeed-lpc-snoop-fixes-v2-0-3cdd59c934d3@codeconstruct.com.au>
	 <20250616-aspeed-lpc-snoop-fixes-v2-6-3cdd59c934d3@codeconstruct.com.au>
	 <20250704173443.3436f535@endymion>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4-2 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250707_190651_585284_A2BA1E45 
X-CRM114-Status: GOOD (  14.55  )
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

Hi Jean,

On Fri, 2025-07-04 at 17:34 +0200, Jean Delvare wrote:
> On Mon, 16 Jun 2025 22:43:43 +0930, Andrew Jeffery wrote:
> > Order assignments such that tests for conditions not involving resource
> > acquisition are ordered before those testing acquired resources, and
> > order managed resource acquisition before unmanaged where possible. Thi=
s
> > way we minimise the amount of manual cleanup required.
> >=20
> > In the process, improve readability of the code by introducing a channe=
l
> > pointer that takes the place of the repeated object lookups.
> >=20
> > Acked-by: Jean Delvare <jdelvare@suse.de>
> > Signed-off-by: Andrew Jeffery <andrew@codeconstruct.com.au>
> > ---
> > =C2=A0drivers/soc/aspeed/aspeed-lpc-snoop.c | 51 ++++++++++++++++++++--=
-------------
> > =C2=A01 file changed, 29 insertions(+), 22 deletions(-)
> > (...)
> > @@ -238,6 +240,7 @@ static int aspeed_lpc_enable_snoop(struct aspeed_lp=
c_snoop *lpc_snoop,
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0goto err_misc_deregister;
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0}
> > =C2=A0
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0/* Enable LPC snoop channel =
at requested port */
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0regmap_update_bits(lpc_=
snoop->regmap, HICR5, hicr5_en, hicr5_en);
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0regmap_update_bits(lpc_=
snoop->regmap, SNPWADR, snpwadr_mask,
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 lpc_port << snpwadr_shift);
>=20
> This duplicates a comment which is already present in the driver a few
> lines before.
>=20
> This duplicated comment gets cleaned up later in patch 10/10 (soc:
> aspeed: lpc-snoop: Lift channel config to const structs).
>=20

Thanks, I've dropped the duplicate in the process of applying the
patches.

Andrew


