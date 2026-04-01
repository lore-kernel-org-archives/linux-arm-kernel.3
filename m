Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C57FD35177
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  1 Apr 2026 12:40:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CJwMURgcqVdYm+JPirWJSROYcBO43Vz4rw2j1eWJIqs=; b=WbYMej89ITuekY5nr603IyodSC
	uHg5xIKjQanbKCH6noUtjCr2SgVZ87j3tQoZ763oOFAGdlW9IxNLsgyUfR3+tXRi2V3tBLmObTWR2
	ZnM6OX34hRZ3hlzNXgmI2SEOL2rdEuXDJW4dNUANS7a3JNygkGI1pBrJ3Vajdd5dVHed10taEPbPx
	xYwb0/BxD2iQy26up2PrLdcZDp4gwr8DIqINTLOsw3YmmtlN45sLyEHTbJZHXQfzOrQWJ7HmRKjN2
	SH0rZ/dnCHO5CHI52rvXRz1xMnw7sY/+8SEV3IIdINNP2mtb+rdIh0j0E66Ep/2NDlYaWRKZj6bwp
	bJMYUORQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7urk-0000000FEhG-1kAH;
	Wed, 01 Apr 2026 12:40:12 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7uq0-0000000FCvk-0c3Q
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 01 Apr 2026 12:38:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Content-Transfer-Encoding
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=CJwMURgcqVdYm+JPirWJSROYcBO43Vz4rw2j1eWJIqs=; b=E1l2RXXAjST88RV6flnhqEHLmo
	7u9uIp9cTMoVD6mByBRZqz7t4uM0c2s/4ZtKeWUpnFMNH39DvHLVYK8XiYJla6KbawXu9r3LTu71J
	zg1sDftX9LPaDSQr0r+/dBePaPDe5zypEudMyaqA8rSEDCtfImE6oGBNDnl5qtlFwqrAjlP1CWpQN
	YkStmjqJ+9vQfqxaB6u8LEUN01NvWKFQl/JYtaFykZvAoh/FREAbC78B+br8AzRV50+HcHKW8JZCw
	3MWX0h+t7yjiUKGdQWhfUVlteumuW7x28ha7bVDsIFbGsfQVXp+CCXOex+Xxtslzs7R7tUeZ/VjQc
	CSnCK4/g==;
Received: from smtpout-02.galae.net ([185.246.84.56])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7upw-00000000MNc-1Hyc
	for linux-arm-kernel@lists.infradead.org;
	Wed, 01 Apr 2026 12:38:23 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 62BD31A3126;
	Wed,  1 Apr 2026 12:30:12 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 2D5AE602BF;
	Wed,  1 Apr 2026 12:30:12 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 313FB1045027B;
	Wed,  1 Apr 2026 14:30:07 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1775046610; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=CJwMURgcqVdYm+JPirWJSROYcBO43Vz4rw2j1eWJIqs=;
	b=sAugnzV238mBDnlm0LxyxZZnieo/toWjI/pnbuCHoWEx9x2/2q3yF1lq/LzXCo+1Q0d83w
	EsxxM0+OWVxFkbviKuDM9z8c6DQ+J7dhWIN/PGdPiqLBwTm0tXHoe5yuwNpPgEomgstLvY
	UHI7qjmaXUTWD8ED2ZkoBiexGyhPZ+Kh4u0XFvnGk9aU2ysegdB/lLMEq8zi5Xj4YBo0QM
	tXSoyhKwU9cPZ/oH3bzPFvqAwGpBtUvk1aRAFK3VQ+UYW6A5HCQcxmEIh5Mqo6e3sURI8n
	cpO9tNGiM0SuzV5dUiP8NInZ1XXBw8tqHI5osoNgCUWPPPhS5lLtvkTWYeTDnA==
From: =?UTF-8?B?QmVub8OudA==?= Monin <benoit.monin@bootlin.com>
To: Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>,
 Nobuhiro Iwamatsu <nobuhiro.iwamatsu.x90@mail.toshiba>,
 Rosen Penev <rosenp@gmail.com>, Brian Masney <bmasney@redhat.com>
Cc: linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] clk: visconti: pll: initialize clk_init_data to zero
Date: Wed, 01 Apr 2026 14:30:06 +0200
Message-ID: <2787121.vuYhMxLoTh@benoit.monin>
In-Reply-To: <20260330-clk-visconti-init-v1-1-ac3e825e54b5@redhat.com>
References: <20260330-clk-visconti-init-v1-1-ac3e825e54b5@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260401_133820_373567_FB808498 
X-CRM114-Status: GOOD (  10.80  )
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

On Monday, 30 March 2026 at 16:32:37 CEST, Brian Masney wrote:
> Sashiko reported the following:
>=20
> > The struct clk_init_data init is declared on the stack without being
> > fully zero-initialized. While fields like name, flags, parent_names,
> > num_parents, and ops are explicitly assigned, the parent_data and
> > parent_hws fields are left containing stack garbage.
>=20
> clk_core_populate_parent_map() currently prefers the parent names over
> the parent data and hws, so this isn't a problem at the moment. If that
> ordering ever changed in the future, then this could lead to some
> unexpected crashes. Let's just go ahead and make sure that the struct
> clk_init_data is initialized to zero as a good practice.
>=20
> Fixes: b4cbe606dc367 ("clk: visconti: Add support common clock driver and=
 reset driver")
> Link: https://sashiko.dev/#/patchset/20260326042317.122536-1-rosenp%40gma=
il.com
> Signed-off-by: Brian Masney <bmasney@redhat.com>

Reviewed-by: Beno=C3=AEt Monin <benoit.monin@bootlin.com>

Best regards,
=2D-=20
Beno=C3=AEt Monin, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com




