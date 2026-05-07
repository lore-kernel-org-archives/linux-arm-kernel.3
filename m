Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7DDEECD343B
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  7 May 2026 07:59:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mZ33xPlUL2vXp7mn5fh4LEunhT/STrANGl0lt2s6JO8=; b=2pcyy+RO9vDCr2XepPBDpFxeJ8
	nJBNpLOmU1jokkLsYf1dcx7eizAYdcQ+sP+fihTuMY2JujgIiovpK46jq8aLlaTi4Tux8jOv+KGNw
	kwUXmGNVuADZMGU6rL1GzGC15AOvNEOoOniPb8IuEOpDoCsFixKR3m5yVtOQQX9pOSoh2lLGf+P1Z
	lQ7PliQ97oEwDFMKsD4bJaYkcFOL0NFa1l1MgdclYpxVPk6Tnel/f9FKCUpCcXAJxxDZ1SVTjge62
	LEA3ocHKgmwmDStbrC4zS9K1R6mmiwUdl86YAGJUQv65ejqRYst/xra3tXnHAwJxSveRwHTbGz0bn
	iywFUDZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKtdT-000000035Cz-1ORY;
	Thu, 07 May 2026 07:59:07 +0000
Received: from s106b.cyber-folks.pl ([195.78.66.88])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKtdP-000000035CI-2O6R
	for linux-arm-kernel@lists.infradead.org;
	Thu, 07 May 2026 07:59:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=mmpsystems.pl; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=mZ33xPlUL2vXp7mn5fh4LEunhT/STrANGl0lt2s6JO8=; b=owMTALbNmq/0z0AKTGDegzz/CJ
	t6eyihkojOWIAhUG2+VqzDF+QWwKDov6WQt6gpB8SQ6Ud7LoiK+h5IHHCMv/eYSUsldGd5imS7aae
	exyx5b3HxD8VBF3o12MBcwKgSAz5g+3jyhpcUNTueTJWBe9xRHoqvX5pWLwPnxrVUY+b7xoMQhuKu
	Swvdp4+x2S3JsTdDVidg5TkQ17WVTIbn1a00oFfE6FRUP+XkYMuBlPahkj44Ll3t7ojmAmzBEYdJa
	huTGMTYZbvB1JoukeBp2rXSk1fkYvLKj/dYwEQlRUanUKU1QK+k4KLqcs3kZ6RHP6PhIH9dHAo0bQ
	YlDu7LSw==;
Received: from user-188-33-36-99.play-internet.pl ([188.33.36.99] helo=localhost)
	by s106.cyber-folks.pl with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <michal.piekos@mmpsystems.pl>)
	id 1wKtdK-0000000FO8y-2Dia;
	Thu, 07 May 2026 09:58:58 +0200
Date: Thu, 7 May 2026 09:58:56 +0200
From: Michal Piekos <michal.piekos@mmpsystems.pl>
To: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
Cc: Daniel Lezcano <daniel.lezcano@kernel.org>, 
	Thomas Gleixner <tglx@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Samuel Holland <samuel@sholland.org>, Maxime Ripard <mripard@kernel.org>, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-sunxi@lists.linux.dev, Andre Przywara <andre.przywara@arm.com>, 
	Conor Dooley <conor.dooley@microchip.com>
Subject: Re: [PATCH v3 0/4] Add hstimer support for H616 and T113-S3
Message-ID: <mz3vsc7ukwkmgcqot6uo74h3ibcbqw7kus5abcficg4z5unitq@xzkmeovc4ntj>
References: <20260428-h616-t113s-hstimer-v3-0-7e02178a93ee@mmpsystems.pl>
 <9ca77795-ebd2-4157-9e74-1fa1001e750b@oss.qualcomm.com>
 <z4qz6flhdnwdpmpcr4ufpcbjpor3x5pc6xw3vdjl5efqssayn3@jzz6vt5ux7te>
 <c10e73df-4850-4507-8c8c-5e1b5e24f99b@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c10e73df-4850-4507-8c8c-5e1b5e24f99b@oss.qualcomm.com>
X-Authenticated-Id: michal.piekos@mmpsystems.pl
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260507_005904_087703_F5916640 
X-CRM114-Status: GOOD (  17.17  )
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

On Wed, May 06, 2026 at 05:15:49PM +0200, Daniel Lezcano wrote:
> On 5/6/26 16:41, Michal Piekos wrote:
> > On Wed, May 06, 2026 at 01:28:22PM +0200, Daniel Lezcano wrote:
> > > On 4/28/26 18:26, Michal Piekos wrote:
> > > > Add support for Allwinner D1 high speed timer in sun5i hstimer driver
> > > > and describe corresponding nodes in dts for H616 and T113-S3 SoC's.
> > > > 
> > > > D1 and H616 uses same model as existing driver except register shift
> > > > compared to older variants.
> > > > 
> > > > Added register layout abstraction in the driver, extended the binding
> > > > with new compatibles and wired up dts nodes for T113-S3 and H616 which
> > > > uses D1 as fallback compatible.
> > > > 
> > > > Signed-off-by: Michal Piekos <michal.piekos@mmpsystems.pl>
> > > > ---
> > > 
> > > Applied patches 1 and 2
> > > 
> > > Thanks
> > 
> > Thank you.
> > I will spin shortly next version with suggested correction for patch 3.
> 
> So patch 1 and 2 are unchanged in v4 ? (missing reviewed-by: Chen-Yu BTW)
> 

Yes. Patch 1 and 2 are unchanged in v4.
Sorry for missing reviewed-by. Was to quick.

Michal

