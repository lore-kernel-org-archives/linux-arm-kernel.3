Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2783CD3424
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  3 May 2026 19:12:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=m7XKCC7wug1pLQcd2TXaUp0A00zqa9MN2HJS7LUAVAQ=; b=nl/d4RZ9ALUxNdCovY1/ElHOzq
	CXcrt4veu+3eKk1PAG6bngidHfvKudWTDAbfLGP5Bqli1PQLLbu/tKoCl27OCL5671xj2lGuM7jn+
	qw3yjZawhH7JkySW5wN8WRD+kTmYkczA1q88TmticbjZGkeAOTAOTHO4UTleeTJxIqHwIsex57RW/
	YyYi6N5Iv2fwEMOB+t+cz1rg1iGbFnnkZEQPj+piZLILaesH5Ao4DZjr3QG7AFwRUm5InVuItkbXk
	lgVnhQtbzfbxhQVr05aTBlG+OY1dhGYO2NxOacIMQ+fxR7LnTmXE5Fv+zmmbB5nBIf3HxCkO4H0WD
	tgAqiHgw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wJcFB-0000000BYzM-3HWS;
	Sun, 03 May 2026 19:12:45 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wJcF9-0000000BYyS-1n9F;
	Sun, 03 May 2026 19:12:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=m7XKCC7wug1pLQcd2TXaUp0A00zqa9MN2HJS7LUAVAQ=; b=1Ov63H+17UQdOzimU/qw/ypJLo
	GrHdu2501S1ECDfJf0YtMh4cylYS8qL98v2cozq8QLw+mHT2BqRXsHFVZibaqGdNeV3xcT7TsB3VR
	797Ya0ofOY4X7zyP6dNw0ihs7DqfBqHibaNdG8Qb4qD6UIS+qCSf/rbinetsn/bjz5FLIPvQmcxWa
	cHhOrPjsSgbhpttiRMsVU1pusZUzhOBG8d0faboKYfZuaZ3n54AYy96sCSFw67YYXVDaPgMCqZNRN
	gVx3b4P8NlthIn7Q9US2pE1CQKIGJN6lGS0YKyzX/sWopwVY+qrE1YbA2hzCy5RIVGZ4IgBRqi5h3
	MFGSJrAQ==;
From: Heiko Stuebner <heiko@sntech.de>
To: Sebastian Reichel <sebastian.reichel@collabora.com>,
 Vinod Koul <vkoul@kernel.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Frank Wang <frank.wang@rock-chips.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Andy Yan <andy.yan@rock-chips.com>, Dmitry Baryshkov <lumag@kernel.org>,
 Yubing Zhang <yubing.zhang@rock-chips.com>,
 Alexey Charkov <alchark@gmail.com>, linux-phy@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org, kernel@collabora.com,
 devicetree@vger.kernel.org, William Wu <william.wu@rock-chips.com>
Subject: Re: [PATCH v4 00/16] phy: rockchip: usbdp: Fixes,
 DP 1-lane support and cleanups
Date: Sun, 03 May 2026 21:12:33 +0200
Message-ID: <6960660.0VBMTVartN@phil>
In-Reply-To: <afd8xMS2hz208Lcl@vaman>
References: <20260428-rockchip-usbdp-cleanup-v4-0-7775671ece22@collabora.com>
 <afd8xMS2hz208Lcl@vaman>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260503_121243_548124_FF042DA4 
X-CRM114-Status: GOOD (  19.22  )
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

Hi Vinod,

Am Sonntag, 3. Mai 2026, 18:50:12 Mitteleurop=C3=A4ische Sommerzeit schrieb=
 Vinod Koul:
> Hi Sebastian,
>=20
> On 28-04-26, 18:13, Sebastian Reichel wrote:
> > This series overhauls the Rockchip USBDP driver; apart from a
> > a bunch of cleanups and small improvements the main goal is to
> > get the driver ready for proper USB-C DP AltMode support.
> >=20
> > Once this series has landed, it unblocks enabling proper USB-C
> > DP AltMode on the RK3588 and RK3576 platforms incl. runtime PM
> > for the Synopsys DesignWare DisplayPort controller.
> >=20
> > Apart from this series, further changes are required on the
> > DRM side. There are no compile-time dependencies between the
> > DRM side and the PHY side, but the PHY side must be applied
> > to avoid SErrors once runtime PM is added to the DisplayPort
> > controller driver. Thus it would be really good to land this
> > series in the next merge window.
>=20
> Looks like sasiko has flagged 8 high warning, can you please check them

(1) as mentioned in a different patch thread, review should be happening
on the lists. Tools regularly dump old results, so anyone looking at the
mailinglist thread might now be able to follow along with what happened
in 2 months or so.

Also other robot tools can reply on the lists just fine.


(2) if 1. is so hugely impossible, please at least provide some reference
to what you mean. Not everybody knows all the hype-tools-of-the-week and
simply searching for that mysterious "sasiko" [0] did not provide any
meaningful results for me, despite some amazon or youtube links for some
non-kernel uses of that term ;-)

So a link should be present at least please.


Thanks
Heiko


[0] https://duckduckgo.com/?q=3D%22sasiko%22




