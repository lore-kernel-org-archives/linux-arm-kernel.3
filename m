Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07630C44508
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Jul 2026 16:38:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Zlbztg6yiHPnkiE4IG2I/j2f7aZ060OxX5TItitbtV0=; b=Hbr5MRmX0uocMaYKcpWboqZVHX
	Y8znHOArMSSBNTnpaEzMsPin7l9NHOVcoNEXIaXLhL9iSnfr4vn+RQSe1+q8taFMJtbmRJ5hsLAwt
	gBrV3P1Hw+QnNqPk0rnc1EGnzueL2A/w0uOSw7kUvsdjtgkWSXW2ajG8KGkRsM4ppLuspEblnitOk
	9VaznbzE349KnYGkHo4FGvz5bllARve1oDAE9HaceNXDtuveFhoM2TrFlEdTmMxHv2016pbsrjGGM
	dgWVgaIjxqTHrQzFG+virJmVqNdB26N1vOQZOUsL4BN2oiLZOQvXneBxYDnT1knr0RR1xw6sZk/5F
	ffyv8s3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjfKL-0000000CZrO-1xu3;
	Tue, 14 Jul 2026 15:45:45 +0000
Received: from zeus03.de ([194.117.254.33] helo=mail.zeus03.de)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjfKI-0000000CZq2-1ZAn
	for linux-arm-kernel@lists.infradead.org;
	Tue, 14 Jul 2026 15:45:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=Zlbz
	tg6yiHPnkiE4IG2I/j2f7aZ060OxX5TItitbtV0=; b=GRPBhngk5B7vXiKudUsU
	dSmlpTkEFwT9K5LvAcpwF+FcoE3Oa03IIyu9rGjZZVOY4LpetxduTNW64buNDxPV
	jtASd5YPg6BF0WfuxBUGn5WisjrF2e5rESA67Xm8kqp3Kfdc8Jy0qtjSdBW7Mbdm
	CBm+UD1fq9Vb+mothDffuyFmbHkfa0+sX1tv9PcWcBFnzyfDjS3QsxXXFUfuyJO3
	1bijkbclwNqLEo9hHBTj8++NiFmg2R4nUA3JEAGycF8lEeNs7Yj6dCKWnLKQ28vM
	h4lZAFpa1kJApspP3PgTg6zj9U0TXv+i8LhXwPWQdYRNH9FKputuIYtiqPcP/25/
	Wg==
Received: (qmail 330099 invoked from network); 14 Jul 2026 17:45:35 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 14 Jul 2026 17:45:35 +0200
X-UD-Smtp-Session: l3s3148p1@e5ADGZRWdoAujnsO
Date: Tue, 14 Jul 2026 17:45:31 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Vincent Jardin <vjardin@free.fr>
Cc: Oleksij Rempel <o.rempel@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Andi Shyti <andi.shyti@kernel.org>, Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Wolfram Sang <wsa@kernel.org>,
	Kaushal Butala <kaushalkernelmailinglist@gmail.com>,
	Shawn Guo <shawn.guo@freescale.com>,
	Stefan Eichenberger <stefan.eichenberger@toradex.com>,
	linux-i2c@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	stable@vger.kernel.org, Carlos Song <carlos.song@nxp.com>,
	Stefan Eichenberger <eichest@gmail.com>
Subject: Re: [PATCH v3 0/2] i2c: imx: fix SMBus block-read of 0 locking the
 bus
Message-ID: <alZZmzQrnBptGEMQ@shikoro>
References: <20260713-for-upstream-i2c-lx2160-fix-v1-v3-0-073ac9e103a5@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260713-for-upstream-i2c-lx2160-fix-v1-v3-0-073ac9e103a5@free.fr>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260714_084543_299990_B1A6AF4C 
X-CRM114-Status: UNSURE (   8.77  )
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

On Mon, Jul 13, 2026 at 08:11:58PM +0200, Vincent Jardin wrote:
> i2c-imx rejects an SMBus Block Read byte count of 0 (valid per SMBus 3.1
> 6.5.7) as -EPROTO and returns without emitting a NACK + STOP, leaving the
> target holding SDA so the bus stays stuck until a power cycle.

Bigger picture: Linux does not support SMBus3 which also allows byte
counts of up to 255. I started sketching support for all that but could
never implement it.

That being said, despite no SMBus3 support, it should not hang the bus
like here.


