Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC764C0219D
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Feb 2025 13:50:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=R50a18/XceTIu+K0e6cu++nzkdHqZi6rYS9zj+7bDAI=; b=Sv6UAqeRUfiAKmEA68Xl8aJaqh
	H4PT3n7BXJ9npADhybaVGd4g60d8a9ALrzu42H1lx41DsEHJgNzlR0EU8EKDuxgpQWijgiEiaEJE4
	H1LxOlWU9ydcdgTN+rW/8nfZdekchu3qtOcwdSIYQG9O2qIFhOOQt42W+fcGrTKYfAZ9hxA2k5zMS
	8/SAggfPGQIrHGKVX2oqUtmny7mG0aATfPYsVHmnOGFH0ZFkNBw+sGlc6pW5HcIZoqJ6PHxdtyJqW
	fPm04kHe+PYBTifRlCUgx1w07sOf8qLcc+g894WNsoZCUFXhxz9n7oZPsna68eEOu3KYUjgcvOhwo
	SRYv98pg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tiZbc-0000000BCgW-2wmF;
	Thu, 13 Feb 2025 13:50:16 +0000
Received: from pidgin.makrotopia.org ([2a07:2ec0:3002::65])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tiZVe-0000000BBTW-3zJT;
	Thu, 13 Feb 2025 13:44:08 +0000
Received: from local
	by pidgin.makrotopia.org with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256)
	 (Exim 4.98)
	(envelope-from <daniel@makrotopia.org>)
	id 1tiZVU-000000006S5-2pBC;
	Thu, 13 Feb 2025 13:43:56 +0000
Date: Thu, 13 Feb 2025 13:43:53 +0000
From: Daniel Golle <daniel@makrotopia.org>
To: Andrew Lunn <andrew@lunn.ch>
Cc: SkyLake Huang =?utf-8?B?KOm7g+WVn+a+pCk=?= <SkyLake.Huang@mediatek.com>,
	"dqfext@gmail.com" <dqfext@gmail.com>,
	Steven Liu =?utf-8?B?KOWKieS6uuixqik=?= <steven.liu@mediatek.com>,
	"davem@davemloft.net" <davem@davemloft.net>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	"linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"edumazet@google.com" <edumazet@google.com>,
	"linux@armlinux.org.uk" <linux@armlinux.org.uk>,
	"hkallweit1@gmail.com" <hkallweit1@gmail.com>,
	"horms@kernel.org" <horms@kernel.org>,
	"pabeni@redhat.com" <pabeni@redhat.com>,
	"kuba@kernel.org" <kuba@kernel.org>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"netdev@vger.kernel.org" <netdev@vger.kernel.org>,
	"matthias.bgg@gmail.com" <matthias.bgg@gmail.com>
Subject: Re: [PATCH net-next 1/3] net: phy: mediatek: Add token ring access
 helper functions in mtk-phy-lib
Message-ID: <Z633GUUhyxinwWiP@makrotopia.org>
References: <20250116012159.3816135-1-SkyLake.Huang@mediatek.com>
 <20250116012159.3816135-2-SkyLake.Huang@mediatek.com>
 <5546788b-606e-489b-bb1a-2a965e8b2874@lunn.ch>
 <385ba7224bbcc5ad9549b1dfb60ace63e80f2691.camel@mediatek.com>
 <64b70b2d-b9b6-4925-b3f6-f570ddb70e95@lunn.ch>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <64b70b2d-b9b6-4925-b3f6-f570ddb70e95@lunn.ch>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250213_054406_994590_42ABA1AF 
X-CRM114-Status: GOOD (  16.24  )
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

On Thu, Feb 13, 2025 at 02:29:35PM +0100, Andrew Lunn wrote:
> On Thu, Feb 13, 2025 at 07:39:39AM +0000, SkyLake Huang (黃啟澤) wrote:
> > On Sun, 2025-01-19 at 18:12 +0100, Andrew Lunn wrote:
> > > 
> > > External email : Please do not click links or open attachments until
> > > you have verified the sender or the content.
> > > 
> > > 
> > > > +/* ch_addr = 0x1, node_addr = 0xf, data_addr = 0x1 */
> > > > +/* MrvlTrFix100Kp */
> > > > +#define MRVL_TR_FIX_100KP_MASK                       GENMASK(22,
> > > > 20)
> > > > +/* MrvlTrFix100Kf */
> > > > +#define MRVL_TR_FIX_100KF_MASK                       GENMASK(19,
> > > > 17)
> > > > +/* MrvlTrFix1000Kp */
> > > > +#define MRVL_TR_FIX_1000KP_MASK                      GENMASK(16,
> > > > 14)
> > > > +/* MrvlTrFix1000Kf */
> > > > +#define MRVL_TR_FIX_1000KF_MASK                      GENMASK(13,
> > > > 11)
> > > 
> > > What does the Mrvl prefix stand for?
> > > 
> > > This patch is pretty much impossible to review because it makes so
> > > many changes. Please split it up into lots of small simple changes.
> > > 
> > >     Andrew
> > > 
> > > ---
> > > pw-bot: cr
> > Those registers with Mrvl* prefix were originally designed for
> > connection with certain Marvell devices. It's our DSP parameters.
> 
> Will this code work with real Marvell devices? Is this PHY actually
> licensed from Marvell?

From what I understood the tuning of those parameters is required
to connect to a Marvell PHY link partner on the other end.

