Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34653606A31F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 27 Oct 2026 10:56:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=uNm8Qy4S;
	dkim=pass (2048-bit key, unprotected) header.d=sntech.de header.i=@sntech.de header.a=rsa-sha256 header.s=gloria202408 header.b=Jze5PRda
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=iRDyXe44Y1voxIFFug2VYkvVa9+PxgdNI7cbcINaWFg=; b=uNm8Qy4SHvxR4P2RgUVPMcAHmM
	dU36nY+zzietMwgJrIJJG8ElJBQ33tuTcotFQZQY1N5ChC5Yfy/RQVEclUpPgTjMqpehV9Ghb3RVt
	kmdztdfU5awuN2xtNZ6W82ZmBpl9/JnvoTleHo+FF0FRnDWWl3MAMoWeWITr/vbjqz06LnqHbSdJY
	43klIG24xstqQ+EdKYuoA9A8BZHFAHez62noBe57d9Z3LSU8nbP6zJyiGxJioMVt/CGQo3h12YMnk
	riY4LHu4whLC79p6KcikDQva07Yy4DajAEhT73c9eCFvkSDXBnrjMJSJB+d13IJDmNBHMZtmdQjZl
	s5Ys28fg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLeql-00000004MfX-0yPH;
	Tue, 27 Oct 2026 10:56:15 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLeqi-00000004Mf7-31Pg;
	Tue, 27 Oct 2026 10:56:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=iRDyXe44Y1voxIFFug2VYkvVa9+PxgdNI7cbcINaWFg=; b=Jze5PRdaRk9WLOOmvuXfp6Fv5c
	z/BRwx79xy+Bac7g8xaYFbMgRA4ELz86k5d/AfFqTIsCADA3A2n7jTE1rVlWdtA8LyfiPMNtRztjW
	G89mdyzGt4ka6hPAT9OfTAgv9SQ5F7GVD+6fzH8mVyZ5mmdTU0WnW7hR6nal9n+n4nN6yiCA72bd0
	vB2K+U8dlcvPuTdD6n2V1vTmP0vNMlxw2E30WIlvyFeDb2Ag5vL9n8zR3tsN0RKSSgMfswC5cV25n
	bHbArBhy9RoRocsNbMs4ITAUdGjm3CCNtkGdNgqPa9wiqau3Sasx4Yhx9+OzdVVAhYb9ncqx4nkX0
	OH8DZpKQ==;
From: Heiko =?UTF-8?B?U3TDvGJuZXI=?= <heiko@sntech.de>
To: Shawn Lin <shawn.lin@rock-chips.com>, Stephen Boyd <sboyd@kernel.org>,
 Brian Masney <bmasney+clk@redhat.com>,
 Jerome Brunet <jbrunet+clk@baylibre.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Elaine Zhang <zhangqing@rock-chips.com>,
 Richard Cochran <richardcochran@gmail.com>, Cunhao Lu <1579567540@qq.com>
Cc: "shawn.lin" <shawn.lin@rock-chips.com>,
 linux-clk <linux-clk@vger.kernel.org>,
 devicetree <devicetree@vger.kernel.org>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
 linux-rockchip <linux-rockchip@lists.infradead.org>,
 linux-kernel <linux-kernel@vger.kernel.org>, netdev <netdev@vger.kernel.org>
Subject: Re: [PATCH v4 2/4] clk: rockchip: Add internal support for 24-bit fractional
 dividers
Date: Tue, 27 Oct 2026 11:56:01 +0100
Message-ID: <6321950.31tnzDBltd@diego>
In-Reply-To: <tencent_AE0E51DA2FACC999E65D6631016044234005@qq.com>
References: <20261027-add-board-ok3572-c-clk-v4-0-d4152b4fedaa@qq.com>
 <f9068153-0d6c-471f-a08b-41cff51ff748@rock-chips.com>
 <tencent_AE0E51DA2FACC999E65D6631016044234005@qq.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261027_035612_765552_B9CE2AE5 
X-CRM114-Status: GOOD (  13.13  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-11.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Am Dienstag, 27. Oktober 2026, 11:41:25 Mitteleurop=C3=A4ische Normalzeit s=
chrieb Cunhao Lu:
> > I guess you are describing what you changed against the
> > original patch from Elaine. But this is not how it works.
>=20
> I'm very sorry for the mistake. After carefully reviewing the guidelines,
> I understand that my notes about changes to Elaine's original patch should
> have been enclosed in square brackets []. I will keep only the significant
> changes in those notes and place them within square brackets.
>=20
> Thank you again for pointing out my mistake. This reminds me that I still
> have much to learn.

and as I wrote in my reply to Krzysztof slightly, less verbosity is
usually better. I.e. a short description what you did, not a detailed
list is usually nicer, i.e. something like

+++++++++++++
Signed-off-by: Elaine Zhang <zhangqing@rock-chips.com>
[adapted to mainline rockchip clock and reset handling (xin24m input,
  don't introduce CLK_NR_CLKS, etc) ]
Signed-off-by: Cunhao Lu <1579567540@qq.com>
+++++++++++++

And as for speed, maybe give it a bit more time between iterations.
A version per day is a bit fast, as it doesn't give people time to actually
respond.



