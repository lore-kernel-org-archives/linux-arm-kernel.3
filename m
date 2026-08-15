Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21326C5CFC1
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 15 Aug 2026 01:45:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RwpxIv3nPzVp7IdhrXTbkAlkt9OeIpd/r2hKdRXlQds=; b=UxEbn+jiBwXWgWshQCLXWaBy+L
	rhNFvoRKib2GWfYosgyuzvAXA2MnBgvnjC9jTU+DD8oRufdqgN1joHiDoHZzHdircdo1CDATBWHNw
	Icx2GMz+pUvZme5j3X0EtVFukYxMdBDtCN3aMzjKui+H5N0kdJpLP9tyzw4b4JJznK5edrts1AoO5
	fPUh6PEH+/Gsp4ZM5jC9xLCuz0jS+VJQd4AeshhVsn1601a58OQ+NoTkTBQbFQ+aL0KgWzE6ghMYW
	T116VeoOgfbPX1SlgxOjuHyDmotke3cjV8bubo+L7+K4a1B+iG4UI0xCsVQQEeJV1jr7E3RHIRQWk
	d4VE9JYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wv3SV-00000003NTf-36zu;
	Sat, 15 Aug 2026 01:45:15 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wv3SU-00000003NTM-1HRg
	for linux-arm-kernel@lists.infradead.org;
	Sat, 15 Aug 2026 01:45:14 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 5D98760008;
	Sat, 15 Aug 2026 01:45:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D57231F000E9;
	Sat, 15 Aug 2026 01:45:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786758313;
	bh=RwpxIv3nPzVp7IdhrXTbkAlkt9OeIpd/r2hKdRXlQds=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=Eyiii193R1Y3nDPGd5lAubhDZwisGRqllhijW8eNf4IBR9s+HRa6LlyNCNwFHBX5x
	 FsiTN5oY0v22DZ9OCDB/hbHmUqHL36GMRXOH+YJpkwk/CM3f4KO01hPAWIpoFEldWm
	 uWrtfHX/RfBNLN2LTtfgMlvUT92BCERuQlRfCOrcz7vcmPSiV8Enc/uEAqMMKzDTiL
	 g27p6Cv46RjZx7GnmLm+sxhuVJs3sRYvoI2g0lqpNfeyYc9jarpw4IKvS30gtp573G
	 YFB8lDRH3OrIBw+yClAa9ZCpbJqRHlruraxf8tkPVebVcM2c5rKHnhSxvRF5DPv8dJ
	 OLu7Yn0i+mLZQ==
Date: Sat, 15 Aug 2026 02:44:57 +0100
From: Jonathan Cameron <jic23@kernel.org>
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: Uwe =?UTF-8?B?S2xlaW5lLUvDtm5pZw==?= <u.kleine-koenig@baylibre.com>,
 Dileep Kumar Nagavarapu <DileepKumar.Nagavarapu@amd.com>, David Lechner
 <dlechner@baylibre.com>, Nuno =?UTF-8?B?U8Oh?= <nuno.sa@analog.com>, Andy
 Shevchenko <andy@kernel.org>, Michal Simek <michal.simek@amd.com>, Conall
 O'Griofa <conall.ogriofa@amd.com>, linux-iio@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 git@amd.com, Sai Krishna Potthuri <sai.krishna.potthuri@amd.com>
Subject: Re: [PATCH v3 3/6] iio: adc: xilinx-xadc: Split driver into core
 and platform files
Message-ID: <20260815024457.39f531d1@jic23-huawei>
In-Reply-To: <ann-96_VVW6mGzJX@ashevche-desk.local>
References: <20260729125455.95893-1-DileepKumar.Nagavarapu@amd.com>
	<20260729125455.95893-4-DileepKumar.Nagavarapu@amd.com>
	<amuqm5qdzXqKutPS@monoceros>
	<ann-96_VVW6mGzJX@ashevche-desk.local>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.52; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
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

On Mon, 10 Aug 2026 19:40:23 +0300
Andy Shevchenko <andriy.shevchenko@intel.com> wrote:

> On Thu, Jul 30, 2026 at 09:52:24PM +0200, Uwe Kleine-K=C3=B6nig wrote:
> > On Wed, Jul 29, 2026 at 06:24:52PM +0530, Dileep Kumar Nagavarapu wrote=
: =20
>=20
> ...
>=20
> > > +#include <linux/mod_devicetable.h> =20
> >=20
> > I wonder why so many people recently add <linux/mod_devicetable.h> in
> > their patches. Is there some tool that suggests that? =20
>=20
> My bet that this is AI agent suggestion based on the previous numerous
> recommendations to include it.

Given the number of years I asked for rather than of.h / acpi.h there
is probably plenty of training data - which was nice until Uwe tidied
this all up.

Jonathan

>=20


