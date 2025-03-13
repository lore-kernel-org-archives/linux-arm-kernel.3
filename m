Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A63CC28B2E
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Mar 2025 09:01:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FdXXR1xQ4bVnuZPsFcJ26VAmRweYc/ljX9b9eYfnA4g=; b=06AjAFZDJGSOz7KaCNtqCuMKlO
	jFS4G9DUj6ynU376aJKunepw7tT9ZXGB6O5kiSrz3DkAz5jP1nBPCPNJOmYHckVKk8bk58mh4Y/ga
	1CdoMPZR3CKsyqq/P9JBwKrRRtFMA1xglr1Ftysmh/uwqQdbmOtmHCNKUCplwWD37e7aR4BzOaEpk
	E/b04HBM+Ij9VAQhmAVhvXfT7YeghVjEiFCDvyZWyNKGiHH7e5a9PkSa1LPne64JNQy5INimvhInN
	Y4AGheRbzwqd68mYX1yc65/zGW609JRvL4y4deoHI+9+bODtwaPXLjLJRLxkLAwVxCFKCoJKAaEul
	5N/kQxaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tseRE-0000000Adc2-0eXl;
	Thu, 13 Mar 2025 09:01:12 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tseGY-0000000Abb0-33IM
	for linux-arm-kernel@lists.infradead.org;
	Thu, 13 Mar 2025 08:50:11 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1tseGP-0001HU-D8; Thu, 13 Mar 2025 09:50:01 +0100
Received: from lupine.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::4e] helo=lupine)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1tseGP-005VRX-0Z;
	Thu, 13 Mar 2025 09:50:01 +0100
Received: from pza by lupine with local (Exim 4.96)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1tseGP-0003wz-0J;
	Thu, 13 Mar 2025 09:50:01 +0100
Message-ID: <fa934fa74bf78cccf6a51cef20c294576e425810.camel@pengutronix.de>
Subject: Re: [PATCH v5 5/8] reset: imx8mp-audiomix: Prepare the code for
 more reset bits
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Daniel Baluta <daniel.baluta@nxp.com>, robh@kernel.org,
 krzk+dt@kernel.org,  shawnguo@kernel.org, mathieu.poirier@linaro.org,
 devicetree@vger.kernel.org,  linux-remoteproc@vger.kernel.org
Cc: conor+dt@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de, 
 festevam@gmail.com, linux-kernel@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, andersson@kernel.org,
 Frank.Li@nxp.com,  peng.fan@nxp.com, laurentiu.mihalcea@nxp.com,
 iuliana.prodan@nxp.com,  shengjiu.wang@nxp.com
Date: Thu, 13 Mar 2025 09:50:01 +0100
In-Reply-To: <20250311085812.1296243-6-daniel.baluta@nxp.com>
References: <20250311085812.1296243-1-daniel.baluta@nxp.com>
	 <20250311085812.1296243-6-daniel.baluta@nxp.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4-2 
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-arm-kernel@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250313_015010_764577_DD10050D 
X-CRM114-Status: UNSURE (   7.07  )
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

On Di, 2025-03-11 at 10:58 +0200, Daniel Baluta wrote:
> Current code supports EARC PHY Software Reset and EARC Software Reset
> but it is not easily extensible to more reset bits.
>=20
> So, refactor the code in order to easily allow more reset bits in the
> future.
>=20
> Reviewed-by: Peng Fan <peng.fan@nxp.com>
> Reviewed-by: Frank Li <Frank.Li@nxp.com>
> Signed-off-by: Daniel Baluta <daniel.baluta@nxp.com>

Reviewed-by: Philipp Zabel <p.zabel@pengutronix.de>

regards
Philipp

