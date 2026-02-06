Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31F95EE20A2
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Feb 2026 13:22:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tyNERdnhwcJsB4+IZJTjocTy/p1a2PIJI9XlyIeVAK0=; b=TEHrjxmIQm1igPQhDdIgDbPFGI
	Q857bgZNkt2Zd+7s/KEUyoKTMm9sCuP2bA2X1PsVSzRnqPR9mDbI2h997QhwXG0XQBYH0rATSe466
	RJhjOoDsRUA1yq3cG8S92qHrs2NUaeUB/Ukic1Gct65WLdhghUCJ1iXpYUzdXkCkfcteEtf0Qq6P0
	K80tzyG62DOb7bUa+gHg9yTeUqfdRbmW+Lyo2Vi1CqA8KUjIIw4N5TwS0vNywd6bVJCURgp8DwF/E
	wL4fe9CaW334XK04yh4ZE/Vy/Xkz2HLguHN0ByzNWD8CbNS+uyyogy4GmI3/nJGJD1wBBaRCUnnAi
	cfoWeo/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1voLnI-0000000BM8B-3G27;
	Fri, 06 Feb 2026 13:22:44 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1voLnH-0000000BM83-2FWv
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 06 Feb 2026 13:22:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=MIME-Version:Content-Transfer-Encoding
	:Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=tyNERdnhwcJsB4+IZJTjocTy/p1a2PIJI9XlyIeVAK0=; b=UpMD4gmBYD/lCGosYoVbRlc/eP
	F3otGEX0B4dvevVSdgKQFB+icpqa61Du1b2h7NaTJQHBHfrozX+LBhTpvxDMEhr6y7UQLcf7AQPWX
	9VwRLG5TwrTz9AEn3lFuYtSkpKTM/GNa8bJyr5c3VG00K5xLnmskc3Ob12Pale+KggApHRe07alya
	zuqDywnmEoJnNdcx7gidzu23qVK8TDULKUmxaz8QSr/HlNEieEPAo8jC64AyU7kdvWxElZdn88T8a
	lh6OsIkES9NGmnHfxwq7IatoVw8L6sykXEVrrtBRLR3T1as0P0XjNdzzn0D/rEwoOdkiJPfLzDMie
	L17Pzc8w==;
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1voLnE-00000003qI4-0pKq
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Feb 2026 13:22:41 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1voLn9-0001ty-3f; Fri, 06 Feb 2026 14:22:35 +0100
Received: from lupine.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::4e] helo=lupine)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1voLn8-004Pax-2n;
	Fri, 06 Feb 2026 14:22:34 +0100
Received: from pza by lupine with local (Exim 4.98.2)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1voLn8-000000006G1-0Vpa;
	Fri, 06 Feb 2026 14:22:34 +0100
Message-ID: <f88fc05d521800c95d281111fa7cf54219089258.camel@pengutronix.de>
Subject: Re: [PATCH v2] reset: imx7: Check return value of
 regmap_attach_dev() in imx7_reset_probe()
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Chen Ni <nichen@iscas.ac.cn>, Frank.Li@nxp.com, s.hauer@pengutronix.de, 
	kernel@pengutronix.de, festevam@gmail.com
Cc: imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Date: Fri, 06 Feb 2026 14:22:33 +0100
In-Reply-To: <20260206050109.119348-1-nichen@iscas.ac.cn>
References: <20260206050109.119348-1-nichen@iscas.ac.cn>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-0+deb13u1 
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-arm-kernel@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260206_132240_430361_8FB4BAEC 
X-CRM114-Status: UNSURE (   7.58  )
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

On Fr, 2026-02-06 at 13:01 +0800, Chen Ni wrote:
> Add error checking for regmap_attach_dev() call in imx7_reset_probe()
> function to ensure proper error propagation.
>=20
> Return the value of regmap_attach_dev() if it fails to prevent
> proceeding with an incomplete regmap setup.
>=20
> Signed-off-by: Chen Ni <nichen@iscas.ac.cn>

Thank you,

Reviewed-by: Philipp Zabel <p.zabel@pengutronix.de>

regards
Philipp

