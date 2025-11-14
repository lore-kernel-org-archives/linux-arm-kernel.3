Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 924CCCE8D4A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Nov 2025 15:50:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UrtSpeLfGeL8/0PD+elYzXPQsf4xprvf9+EEzaI03aA=; b=Bsh3Fhofrx9xNPxLL6+QQXsB1+
	Lm149XOcBKsoGZ7suZC4YyLjwhXmUF0iW+pJPTRKDgFtirXt9QPfl81iIlPho82HyDuuv5nD8NWCD
	uV6QQveZQC8tY9U0qpy7hK3Ak8JixW8CrRRiHWOr9fYwjKd44flEZ7fTWzQrHbzSP31rFO9cjsLFt
	i2l1iaFpm4IDj8FqnZ9+N49KWeS+gv+Agpw2md/ScNpQ2rVa5oeh5kjrlazmja0i0+rlzUDPhptDZ
	PtALQNv2XTs8tiMBAIs1jl/PXwyZexPZKbyHYnSBwvb+SVmnsqPOhEuy5YpPLF81oQE13O/ux4Yh9
	TOKz/d5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJw3x-0000000CcJH-2mye;
	Fri, 14 Nov 2025 15:50:13 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJw3w-0000000CcIY-2FB4
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 14 Nov 2025 15:50:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=MIME-Version:Content-Transfer-Encoding
	:Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=UrtSpeLfGeL8/0PD+elYzXPQsf4xprvf9+EEzaI03aA=; b=PTK1/cBf37QO9nAbevL4O5jRuW
	lLoeCvjjIBSBfrWLRP7bUn85MIDhpO8Rtxvz8p3ELfR9+2kKSQXnhnyBTgkLaGGOyLa6ua+U1qcpd
	QlVWFRs2pZyiveEe725uZdy6Ny0KThMkvJpCZO1zJNadTpAAekU35D7ckR6meiFYe5f7cKzGpfuBz
	ad+C22aWAmwX9piUGZCTuMWERqxQpq3x5CuvY5S0KmTwqn+GpHs9n11vOo9Orgdui3B3BMoB0SYnw
	TCmk8eWD/YXlMg1Jvp2rGE14Ho127+ReODUcgBKB4ogx2PHsFmkfcRGL+Qvusqj8ajBqD3urPPJtg
	OnasWetA==;
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJvCD-00000002sV9-36sS
	for linux-arm-kernel@lists.infradead.org;
	Fri, 14 Nov 2025 14:54:44 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1vJw3i-0008R0-5h; Fri, 14 Nov 2025 16:49:58 +0100
Received: from lupine.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::4e] helo=lupine)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1vJw3h-000Ri4-2r;
	Fri, 14 Nov 2025 16:49:57 +0100
Received: from pza by lupine with local (Exim 4.98.2)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1vJw3h-00000000AUm-3NSj;
	Fri, 14 Nov 2025 16:49:57 +0100
Message-ID: <3e26ce37e9b1ee5c5f231b3a60b3eb08d36bf0f4.camel@pengutronix.de>
Subject: Re: [PATCH v5 3/6] reset: imx8mp-audiomix: Switch to using regmap
 API
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>, Krzysztof Kozlowski
	 <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Shawn Guo
	 <shawnguo@kernel.org>, Fabio Estevam <festevam@gmail.com>, Daniel Baluta
	 <daniel.baluta@nxp.com>, Shengjiu Wang <shengjiu.wang@nxp.com>, Frank Li
	 <Frank.Li@nxp.com>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Pengutronix Kernel Team
	 <kernel@pengutronix.de>
Date: Fri, 14 Nov 2025 16:49:57 +0100
In-Reply-To: <20251114133738.1762-4-laurentiumihalcea111@gmail.com>
References: <20251114133738.1762-1-laurentiumihalcea111@gmail.com>
	 <20251114133738.1762-4-laurentiumihalcea111@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.1-1+deb13u1 
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-arm-kernel@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251114_145441_832776_3EEA4976 
X-CRM114-Status: UNSURE (   6.85  )
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

On Fr, 2025-11-14 at 05:37 -0800, Laurentiu Mihalcea wrote:
> From: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
>=20
> Switch to using the regmap API to allow performing register operations
> under the same lock. This is needed for cases such as i.MX8ULP's SIM LPAV
> where clock gating, reset control and MUX-ing is performed via the same
> register (i.e. SYSCTRL0) and different subsystem APIs.
>=20
> Signed-off-by: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>

Reviewed-by: Philipp Zabel <p.zabel@pengutronix.de>

regards
Philipp

