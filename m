Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EBFAC109B48D
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 31 Mar 2026 15:26:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LWmSztlHLyVoIo3rLrZszBxgPlEv07wh3WEA+tY2QCg=; b=lkF8w5chLc4vsKhXv1ExnaKLcr
	WT3popAnt6aaX7q0tFUlqWe3iT5wPTjzCUQV3+AYEoTch3ruKtkR3Blj9AQ+SMwEg9MOkDvEW+UER
	x2DvVLIXTkEx+UVTLtz6fpw9c58ki1J++HtPEHdF7hiCyNZPE21sNPhJdKvLMaliTze0KF+Uu8omv
	qW22AJBrlf5pOAE5nBPKMo1ZoRYlzPdGuqicPTSU6alxV1L/n4uOFFDilkOyUXqhc//M8BOaxVy5y
	Wbs2NHlYxVKdS/i2uKq+sTSiNAU1YAlgz1ciUaZK4GbeDXqXetC9JD2Isvns3hp2UIctKttOkfhTj
	gmMSezwg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7ayc-0000000DAsM-2iZt;
	Tue, 31 Mar 2026 15:25:58 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7ayZ-0000000DArc-3mtc
	for linux-arm-kernel@lists.infradead.org;
	Tue, 31 Mar 2026 15:25:58 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1w7ayO-0007xO-KT; Tue, 31 Mar 2026 17:25:44 +0200
Received: from lupine.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::4e] helo=lupine)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1w7ayN-0033vK-36;
	Tue, 31 Mar 2026 17:25:43 +0200
Received: from pza by lupine with local (Exim 4.98.2)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1w7ayN-00000000FEZ-3fQI;
	Tue, 31 Mar 2026 17:25:43 +0200
Message-ID: <f619c0b56d94ac666bb8914d0740e2f905c0e347.camel@pengutronix.de>
Subject: Re: [PATCH 1/2] reset: amlogic: t7: Fix null reset ops
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Ronald Claveau <linux-kernel-dev@aliel.fr>, Neil Armstrong	
 <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, Jerome
 Brunet	 <jbrunet@baylibre.com>, Martin Blumenstingl
 <martin.blumenstingl@googlemail.com>,  Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Date: Tue, 31 Mar 2026 17:25:43 +0200
In-Reply-To: <20260331-fix-aml-t7-null-reset-v1-1-eb95b625234c@aliel.fr>
References: <20260331-fix-aml-t7-null-reset-v1-0-eb95b625234c@aliel.fr>
	 <20260331-fix-aml-t7-null-reset-v1-1-eb95b625234c@aliel.fr>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-0+deb13u1 
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-arm-kernel@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260331_082555_950412_4C8ACF59 
X-CRM114-Status: UNSURE (   5.88  )
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

On Di, 2026-03-31 at 16:24 +0200, Ronald Claveau wrote:
> Fix missing reset ops causing kernel null pointer dereference.
> This SOC's reset is currently not used yet.
>=20
> Signed-off-by: Ronald Claveau <linux-kernel-dev@aliel.fr>

Applied to reset/fixes, thanks!

[1/2] reset: amlogic: t7: Fix null reset ops
      https://git.pengutronix.de/cgit/pza/linux/commit/?id=3D9797524ef2b6

regards
Philipp

