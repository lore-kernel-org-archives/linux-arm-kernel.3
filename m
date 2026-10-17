Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06294CCF2C1
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 17 Oct 2026 11:18:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wxuk6IDriLl7MXn594d/LjgaXzjR4puXOU8/hIVUu9c=; b=pu9w5uaYDzdVwHY9RGcVaKBKof
	XyecOvf+4L5Ae7MtvwSPOKlogwm3mW+D4T2qF5OGwzZTTbgynZVpyYY6DoX2FhH/ns9nlIyR9P5pc
	rWWF9SKvnckOdoo7lte/25PeWRrWlwUolYi3W6IFEOaU+rm0rJYINHHdgwAsfUrZZvNb8uYkXdWF3
	fldRBrhI51D+waow4SsVde6iGLm/2LCLEqjjVxO/TaBuzKlhZVxuyC970p3fIwzaIiKI4b/X8OeOe
	iPE16xB+cHAynUKsunPJPUWpAa2ONUHy93f+QnBfUT3hp8s9bYdmExOAqhVVWRiyaJEcH4/WJP5Mr
	bdqihmmA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xI2QF-00000004iKz-2Wcm;
	Sat, 17 Oct 2026 11:17:55 +0000
Received: from zeus03.de ([194.117.254.33] helo=mail.zeus03.de)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xI2QB-00000004iKL-1tWg
	for linux-arm-kernel@lists.infradead.org;
	Sat, 17 Oct 2026 11:17:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=wxuk
	6IDriLl7MXn594d/LjgaXzjR4puXOU8/hIVUu9c=; b=c/d1+QMqtQyDgaUoeZH6
	ERLHM6l26dA0mOpWZEIpoRWkLzN0XWkgma+AeD36oEsGg5o3EfdzYX5Cp5/eNCqE
	ZGY2axdqXfL48EsScQ63GecPZRcY7sZ6nUlB2Ylr+CW2IR6OMwsXSXGgTNRJT6i6
	v52jeP409R6LS0ERvQhF/AyWBv3jip8SDH3HXI7EHBbo73+SA7EPdLrAnkKd/4OI
	2tk5DWbM+4MdAIO2pKaKElHilapT8folp/DDiZ+nSbrNrg9um27iF3PT18TrOrkd
	Goa+tyLk8oU1lkUEPPKeBlEYpwLrTxeJn8LfXnneWZvqJuroxZ71FbAstfVgUiPd
	ZA==
Received: (qmail 984 invoked from network); 17 Oct 2026 13:17:42 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 17 Oct 2026 13:17:42 +0200
X-UD-Smtp-Session: l3s3148p1@5eDrbQdeOsMujnuO
Date: Sat, 17 Oct 2026 13:17:41 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Ulf Hansson <ulfh@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Marek Vasut <marek.vasut+renesas@mailbox.org>,
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	Kevin Hilman <khilman@baylibre.com>, Vinod Koul <vkoul@kernel.org>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
	=?utf-8?Q?Cl=C3=A9ment?= Le Goffic <clegoffic@baylibre.com>,
	Sudeep Holla <sudeep.holla@kernel.org>,
	Cristian Marussi <cristian.marussi@arm.com>,
	arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
	linux-pm@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v4 0/8] R-Car X5H Ironhide CPG/MDLC SCMI remapping support
Message-ID: <atNZVWSjJV8GiK9n@shikoro>
References: <cover.1792163045.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1792163045.git.geert+renesas@glider.be>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261017_041752_420507_16322E72 
X-CRM114-Status: UNSURE (   9.68  )
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

Hi Geert,

thank you very much for this update!

> During last OSSJ/LPC, Marek Vasut pondered if we could keep our own ID

Well, it is not the last LPC anymore ;) Time flies...

> This series consists of four parts:
>   A. Patches 1-2 prepare and add SCMI remapping support to the R-Car X5H
>      CPG clock driver,
>   B. Patches 3-6 fix and add new interfaces needed for remapping in the
>      R-Car X5H MDLC pmdomain driver,
>   C. Patch 7 adds SCMI remapping support to the R-Car X5H MDLC pmdomain
>      driver,
>   D. Patch 8 enables more SCMI protocols on R-Car X5H Ironhide.

I rebased my I2C branch to it, enabled the debug output and can confirm
that the clocks and resets are now mapped and I2C still works fine. So,
for the whole series:

Tested-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

The branch is here:

git://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git renesas/x5h/i2c-experimental

All the best,

   Wolfram


