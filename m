Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2EF9C43458
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  2 Jul 2026 16:37:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dUpLWUSZeHCbnarM9STL88HVq9YMEGabh6ksEsFN9PE=; b=lK6Zaj9nUfUWYaS7mL8YxrPW5+
	mPgzhthaLYrMtWJMLhaVM43NswTV0BGkdUJuIDJdYVTuODzgaOgjwgg0MGew1UtvTHgE3sz1MPPXC
	GCZqhaxjq5Wb+7WiowIEEqUCq9AHUTehKhhuU83umns7PVY2y+B5yhe14j0bDmc4yFi5wfOy2ny79
	rrCzLZy2jdA432whpBLJQfFTPM9WPfDcOCyq9sHPwCuZjLEpEcMuJ1uiiRK1J+gN9sZnQW2faQOri
	SH7LTquHzpNcUfnjg6uv0+kpDpzyxntlWVhhtitDQPg2bjtvvgTfl1yXvtbVN8AD1oZBicqJFeqPt
	sulj+rUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfKPH-000000051vj-2EWb;
	Thu, 02 Jul 2026 16:36:55 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfKPE-000000051v2-2c0D;
	Thu, 02 Jul 2026 16:36:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=dUpLWUSZeHCbnarM9STL88HVq9YMEGabh6ksEsFN9PE=; b=Num2A+5+4Fd1ZIrorLsEytnkVt
	9jN67/IIhlYNOJDwVyAVNKx5NjRVrouv4JpQ43ezzCpdzqHbJimO1FbKa9rDe5UJr7IorYmoo2jDo
	nUu4F/0XaZVYH8CoKWyMI1Z+GYpvY3rIWAeYPlH1hL8uHLZlN3S5gmWR8cLQwtPUTX294vlC4pFRM
	g89ajIdO2CgdqBy3kfm8zurgzeGZ893srcJ9SRbrsUI/coucNboYla5laznUD/GrmDRRcjcXylSNB
	Vhfo+wNqbk1WsOue/TX4vEah44zz3m6kv2Evow1EeCucsxhOJs1MJLQcxi5KivPCmHu/DalMxTq93
	A1IVo5ug==;
From: Heiko =?UTF-8?B?U3TDvGJuZXI=?= <heiko@sntech.de>
To: Marc Kleine-Budde <mkl@pengutronix.de>,
 linux-can <linux-can@vger.kernel.org>, Cunhao Lu <1579567540@qq.com>
Cc: Vincent Mailhol <mailhol@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, kernel <kernel@pengutronix.de>,
 Conor Dooley <conor+dt@kernel.org>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 Shengjiu Wang <shengjiu.wang@nxp.com>, Pengpeng Hou <pengpeng@iscas.ac.cn>,
 Russell King <rmk+kernel@armlinux.org.uk>,
 Eric Biggers <ebiggers@kernel.org>,
 Mario Limonciello <mario.limonciello@amd.com>,
 Karl Mehltretter <kmehltretter@gmail.com>, Yixun Lan <dlan@kernel.org>,
 Stephen Boyd <sboyd@kernel.org>, devicetree <devicetree@vger.kernel.org>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
 linux-rockchip <linux-rockchip@lists.infradead.org>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 Heiko Stuebner <heiko.stuebner@cherry.de>
Subject: Re: [PATCH v2 2/4] can: rockchip: add RK3588 CAN support
Date: Thu, 02 Jul 2026 18:36:41 +0200
Message-ID: <6281926.UjTJXf6HLC@diego>
In-Reply-To: <tencent_8BE421601F31C26FB9E99FA6440629016D05@qq.com>
References: <20260702140654.2961561-1-1579567540@qq.com> <3527453.usfYGdeWWP@diego>
 <tencent_8BE421601F31C26FB9E99FA6440629016D05@qq.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260702_093652_659249_7726F0EE 
X-CRM114-Status: GOOD (  14.25  )
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

Am Donnerstag, 2. Juli 2026, 18:34:04 Mitteleurop=C3=A4ische Sommerzeit sch=
rieb Cunhao Lu:
> > I think you might want to drop that above. If anything a Co-developed-by
> > would be applicable, but from the (small) size of the change, that also
> > isn't really necessary for me :-)
> >
> >
> > > Signed-off-by: Cunhao Lu <1579567540@qq.com>
> >
> > Tested-by: Heiko Stuebner <heiko@sntech.de>
> > Reviewed-by: Heiko Stuebner <heiko@sntech.de>
>=20
> Sorry about that. This is my first contribution to the Linux kernel, and
> I have not fully understood yet which tags are appropriate in which
> situations. Please bear with me.

no worries, I think you're doing really great for your first contribution


Heiko

> I will add your Co-developed-by tag in v3, together with your
> Signed-off-by as required for Co-developed-by.
>=20
> Best regards,
> Cunhao
>=20
>=20
>=20
>=20
>=20





