Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0870BCDE019
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Nov 2025 06:59:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=92FogTHwtaPTR9UkVfm0maabDk4+USKALxafha/r7LI=; b=OMGXIhRUAdCbSuGgWLHMbJL6xW
	LwneK2WIM+hGHAsTst3t6TvEIUD2jH/aT8DQxz+MrnV+/IyQ7xXqtYGTbzF3NJQRFlz+ZGAdelbLG
	Lsth44OsPlFIW75X803H17ejvJ6NZMRKws/2pVv8hJH71Te1Xwyv23IIp803rCMCmsaQRnZAGaTEk
	+c71gUdfAYVxyZPpKCjm4aGtwi4WUSSY8DTPgOKIeBDZOHzSZ2ErGGz+gf/vJb1VD64Yl89gQfCo6
	TmLqNDzS1XFmmBjIBUs4rD4uKkkywQLIF/rvgFmubuU3Qj+u/n73Pp30he3/nEQQh2NwDUeGKQj0b
	XQT0KprA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJnmP-0000000BhXp-27rV;
	Fri, 14 Nov 2025 06:59:33 +0000
Received: from mo-csw1800.securemx.jp ([210.130.202.134] helo=mo-csw.securemx.jp)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJnmM-0000000BhWO-2IWf
	for linux-arm-kernel@lists.infradead.org;
	Fri, 14 Nov 2025 06:59:32 +0000
DKIM-Signature: v=1;a=rsa-sha256;c=relaxed/simple;d=toshiba.co.jp;h=From:To:Cc
	:Subject:Date:Message-Id:MIME-Version:Content-Transfer-Encoding;i=
	yuji2.ishikawa@toshiba.co.jp;s=key1.smx;t=1763103550;x=1764313150;bh=FBwrMGwx
	Ht0KLvPopuPdLsUhZ8WTHzQEQbfykQ+O80I=;b=LaVQ1hKjenagJyFXdN8pLN8BJj7cVTvr9riuWV
	L3VfUHoNtBMMtUno3Fo9trqO35n5dlmJ9N83lK0YrdchqDIvaLepmTvz3S2uTvhrHrnEuJmUKlsa7
	2/TBtJP4v6QSTgJbXKRw6iIA4CZhJ2KTrygurbfF0TIRw5+gznQPaZaaVhj2mPuEjL2WCgVb35Ifc
	AVztaxdFeCvrmB4J++qSKO7b4T+XEm7IEAlsUhPpVae2z2mOAORAFq6AEjfwOGlFBTa8Rwddx5MFj
	IisHmj8lJSpfcy0+D3zeYy1XFZBJD8iKJLwQfov3dZ8qM/7yLFuDrqWj9UwYe7qx8zwFcKWvw==;
Received: by mo-csw.securemx.jp (mx-mo-csw1800) id 5AE6x9nB2557328; Fri, 14 Nov 2025 15:59:09 +0900
X-Iguazu-Qid: 2yAafBYzAZJ31BNeos
X-Iguazu-QSIG: v=2; s=0; t=1763103548; q=2yAafBYzAZJ31BNeos; m=/V0bFjDZ9x29Fry2XACe/Vf73K+aaDIbQJnbzCRuRtI=
Received: from imx2-a.toshiba.co.jp (imx2-a.toshiba.co.jp [106.186.93.35])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	 id 4d77KR4Rx1z1xnZ; Fri, 14 Nov 2025 15:59:07 +0900 (JST)
X-SA-MID: 54822485
From: Yuji Ishikawa <yuji2.ishikawa@toshiba.co.jp>
To: Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Nobuhiro Iwamatsu <nobuhiro.iwamatsu.x90@mail.toshiba>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Yuji Ishikawa <yuji2.ishikawa@toshiba.co.jp>
Subject: [PATCH 0/2] clk: visconti: Remove definition of number of clocks from bindings
Date: Fri, 14 Nov 2025 15:53:56 +0900
X-TSB-HOP2: ON
Message-Id: <20251114065358.854817-1-yuji2.ishikawa@toshiba.co.jp>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251113_225931_160134_D4D72F41 
X-CRM114-Status: UNSURE (   9.23  )
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

Remove the definitions of number of clocks from bindings because they
prevent adding new clocks. The first patch removes the use of the
definitions in the driver, then the second patch removes the definitions.

Yuji Ishikawa (2):
  clk: visconti: Do not define number of clocks in bindings
  dt-bindings: clock: tmpv770x: Remove definition of number of clocks

 drivers/clk/visconti/clkc-tmpv770x.c         | 8 ++++++--
 drivers/clk/visconti/pll-tmpv770x.c          | 5 ++++-
 include/dt-bindings/clock/toshiba,tmpv770x.h | 3 ---
 include/dt-bindings/reset/toshiba,tmpv770x.h | 1 -
 4 files changed, 10 insertions(+), 7 deletions(-)

-- 
2.34.1



