Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B2F6D2F320
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 13 Jan 2026 15:10:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mnRht3IuRpXB/t6mxr+8aeJFsEXCRTBrHR1LlDQvTzs=; b=za+LafHVj8ZKPgypCNI6kqBPk+
	Xo3zq1IVnGYq45HBT1pYRaf3ngq2wOiJQCTBIk44+/nhIiaHbx0wMjSls5P1KJLiT0lXLi1S7Pn78
	k24rtgvgcLIfplOUVVjWEr1NF4RawR/gbY9hZYCkTA7MGyuXPV0n4+w5HBDmunR9NDTNUL5fp21Cl
	P7xEM4DAjFHkneI5314cT7bkUIpUUPxe+xqOeeZg5nXV6DST89IxOwxKfKsxh2oCqOg1Y6qGVLeXR
	NtCHSlpVfGt7IVSspnJ09BkwOt2M7hH6JIoDw1Xp2zz98jniSABCAYngkKuDxNGtP0XXvnfgGg1jN
	NvjfQqCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfg2F-00000007Kdq-1IGL;
	Tue, 13 Jan 2026 15:10:19 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfg2C-00000007Kb8-2fhJ;
	Tue, 13 Jan 2026 15:10:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=mnRht3IuRpXB/t6mxr+8aeJFsEXCRTBrHR1LlDQvTzs=; b=stjm2QZEah/44e/BsqdHnjJALy
	eo6LraZtdL7QxuywzI8928LeN8eUfJBViod7nDBus3Es9IFwydIZC1WOBEPriPXdliyR0TVyo+1bZ
	LhV1ZCzLT1IHLpkPnBVBtFj7ZnwcJOOyGLqg6n25Y6KFPtWbU4WGS7Unsx/22dBfxYZwn5FVVgoCY
	9GTVYmjAOrXM579C2B87z+0U4OIRiZPy9mypyCzrrJN7hIfHkrTrhN9qjZFw0F0l/v9wtTH6PgBLI
	scQkPYp9rgPKaQ1HG+8D0IZNQCdB4NpZVazl3cyd2b+1UhPbF7Nxiu3Oe2PRBoR8vJgs6o5aT1vY9
	LYylkIMA==;
Received: from i53875b63.versanet.de ([83.135.91.99] helo=diego.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1vfg1y-0027pj-EN; Tue, 13 Jan 2026 16:10:03 +0100
From: Heiko =?UTF-8?B?U3TDvGJuZXI=?= <heiko@sntech.de>
To: Andi Shyti <andi@smida.it>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Wolfram Sang <wsa+renesas@sang-engineering.com>,
 Qianfeng Rong <rongqianfeng@vivo.com>, linux-i2c@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-rockchip@lists.infradead.org,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Khalil Blaiech <kblaiech@nvidia.com>, Asmaa Mnebhi <asmaa@nvidia.com>,
 Andi Shyti <andi.shyti@kernel.org>, Qii Wang <qii.wang@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Linus Walleij <linusw@kernel.org>,
 Patrice Chotard <patrice.chotard@foss.st.com>,
 Ard Biesheuvel <ardb@kernel.org>
Subject: Re: [PATCH v1 5/7] i2c: rk3x: Use HZ_PER_GHZ constant instead of plain number
Date: Tue, 13 Jan 2026 16:10:01 +0100
Message-ID: <2063916.2IRrRt1zHL@diego>
In-Reply-To: <20260112134900.4142954-6-andriy.shevchenko@linux.intel.com>
References: <20260112134900.4142954-1-andriy.shevchenko@linux.intel.com>
 <20260112134900.4142954-6-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260113_071016_706437_18129899 
X-CRM114-Status: UNSURE (   7.37  )
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

Am Montag, 12. Januar 2026, 14:46:13 Mitteleurop=C3=A4ische Normalzeit schr=
ieb Andy Shevchenko:
> Use defined constant to avoid the possible mistakes and to provide
> an additional information on the units.
>=20
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Reviewed-by: Heiko Stuebner <heiko@sntech.de>



