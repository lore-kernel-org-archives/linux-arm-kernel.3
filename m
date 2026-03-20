Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44EFB108B8EA
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Mar 2026 10:12:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+2iqAQ67ZjLOQ/PjGB52JUSHpEkc89yS9cwLjIr8mvY=; b=4mbxJPnXuHndzrC6xnrb9i8CsC
	1CzIe+pIzqQdnukUrnX+j426A4QEkykZG7/+XRrFkmr0Zb5L+FAfL3x75hEcCWcHe3N5WAY+dBTcv
	B1ntOmjl01wYXDZIo+QZyYmy5AlE6YQhIzFG6eHpYoM0qTmWO9Bu6OUa3CSYkc8GagzsDwaspBu6t
	ZNG2nPuOETVUWUhipkAOuKwsoQSiJlsTR0r9AEQb0nrVL/X15fvq8jQvmfeHXOKlReOmO+75xw7EC
	6sK6tFYpSONxe+OcodtVxCmLi8adkh6OIZleEKtPoUBlG+PVkz4ISy3zAxUTXbdwv1TeihElW8RMo
	4prCF7Ug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3WqN-0000000CYcP-1mMN;
	Fri, 20 Mar 2026 10:12:39 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3WqK-0000000CYbq-3Efg
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Mar 2026 10:12:38 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1w3WqF-0003tS-Vc; Fri, 20 Mar 2026 11:12:31 +0100
Received: from lupine.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::4e] helo=lupine)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1w3WqF-001DoT-2F;
	Fri, 20 Mar 2026 11:12:31 +0100
Received: from pza by lupine with local (Exim 4.98.2)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1w3WqF-000000004l2-2bcO;
	Fri, 20 Mar 2026 11:12:31 +0100
Message-ID: <1c92a7330972abc4830b736ad494d3df4d819d55.camel@pengutronix.de>
Subject: Re: [PATCH] reset: sti: kzalloc + kcalloc to kzalloc
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Rosen Penev <rosenp@gmail.com>, linux-kernel@vger.kernel.org
Cc: Patrice Chotard <patrice.chotard@foss.st.com>, "moderated list:ARM/STI
 ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>
Date: Fri, 20 Mar 2026 11:12:31 +0100
In-Reply-To: <20260320010517.31917-1-rosenp@gmail.com>
References: <20260320010517.31917-1-rosenp@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-0+deb13u1 
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-arm-kernel@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260320_031236_813675_B9B53B31 
X-CRM114-Status: UNSURE (   4.70  )
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

On Do, 2026-03-19 at 18:05 -0700, Rosen Penev wrote:
> Simplify allocation.
>=20
> Signed-off-by: Rosen Penev <rosenp@gmail.com>

Applied to reset/next, thanks!

[1/1] reset: sti: kzalloc + kcalloc to kzalloc
      https://git.pengutronix.de/cgit/pza/linux/commit/?id=3D223af4a569d1

regards
Philipp

