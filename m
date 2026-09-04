Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0ABB2C79F82
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  4 Sep 2026 15:59:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6NudO1dW9MF1nqPfAxBcypFxGmNxHi7wam0yQ7G6bdI=; b=WV0ludPcOwjk534ArZGygxi/kj
	sej+YdZFr3OeoG5KPO7fqleRdSQwuyV9OksMj34V3g3Sp9FFCQT5B4t09nHSZLALDExeazgu9ereg
	L7X/EopfpsOF0HIwrFgisnTImKM3lFvy5pa/nLeDE+xN21C+DrXB5U3aaMQNAcHqJL5YJP/1XQg2t
	UhAeVqDxEH9NyiRDK3mvN6Cvm9pS9Y5MulKZ1xGz7GEcghCic0Y4rnzSbWJDsjsKZ4M3q4pGJMQ+I
	tx8cnIqIzN9lR0Oio9/k1/2DDsQlW/FnJZ0xcsOrT4h/Wu8IwqiypGU2RZD3AJLBsJEkmLQg5KhgO
	5DE6c0IA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2WK3-00000002cHE-3sKp;
	Fri, 04 Sep 2026 15:59:23 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2WJq-00000002bjS-0kIm;
	Fri, 04 Sep 2026 15:59:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1788537548;
	bh=AjWZadrtSiC8GDg0pLJcG+NWHWGZanfk+LgDY0etyOM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=b8Qj4MD+vJc4xmAk6oqtWw7bZTjA3i4sL/2giMjIXKqQtm8fjwIM+oCg9CORD8dIx
	 XjRE/5zZXFiiPDXxU63RjYPlVBEyfPjncn8vSvqBICyuc5vNwMEJ/LYxfApsD6rq3T
	 F7hZ38TZ+bTDcS7Bq0GFyeuedcysVpNOjXENJesbt2V/3RhvDeQ8KDK5MkTSduaqul
	 G1FyxpwtitPthOE0OeM8GSICGUDRszEOpnyef0aOAdAxRYgFVZMQmdFiNbrFbzFlGP
	 kMe0mfKDEzK48NW//VwAXOfHoL868LhDwUw2C0sMJ2M2Xl9FTVf5JSeq6C3NZl1AAq
	 5QXqPmP1TkQqA==
Received: from yukiji.home (unknown [100.64.0.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: laeyraud)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 2B2B517E075D;
	Fri, 04 Sep 2026 17:59:07 +0200 (CEST)
From: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
Date: Fri, 04 Sep 2026 17:58:28 +0200
Subject: [PATCH v6 17/27] clk: mediatek: pllfh: clear state data in
 mtk_clk_cleanup_pllfhs
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260904-mt8189-clocks-system-base-v6-17-5df247f56938@collabora.com>
References: <20260904-mt8189-clocks-system-base-v6-0-5df247f56938@collabora.com>
In-Reply-To: <20260904-mt8189-clocks-system-base-v6-0-5df247f56938@collabora.com>
To: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Chun-Jie Chen <chun-jie.chen@mediatek.com>, 
 Chen-Yu Tsai <wenst@chromium.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
 Edward-JW Yang <edward-jw.yang@mediatek.com>
Cc: kernel@collabora.com, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788537522; l=1162;
 i=louisalexis.eyraud@collabora.com; s=20250113; h=from:subject:message-id;
 bh=AjWZadrtSiC8GDg0pLJcG+NWHWGZanfk+LgDY0etyOM=;
 b=w4ppgXFeiUJ/ZE3L7QLNPm/6CukSJEtWcDH58QkUDxCepyfL1dLJumsqpG34qMYMXVrl3jPc9
 h98KyNf6ZFNAIwcOKpVzZg/mxqiS35y1nv2x/Fw7tr+0dUdb9Jjeqeu
X-Developer-Key: i=louisalexis.eyraud@collabora.com; a=ed25519;
 pk=CHFBDB2Kqh4EHc6JIqFn69GhxJJAzc0Zr4e8QxtumuM=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260904_085910_658767_DDFDB7DD 
X-CRM114-Status: GOOD (  11.63  )
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

Currently, fhctl_parse_dt function sets some state variables that are
never cleared in the unregister nominal path or register error one.
As they are stored in a static array variable, given as parameter from
the caller function, they retain their values until they are initialized
again by another fhctl_parse_dt call.

So, add a loop to clear these state variables in mtk_clk_cleanup_pllfhs
function.

Signed-off-by: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
---
 drivers/clk/mediatek/clk-pllfh.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/clk/mediatek/clk-pllfh.c b/drivers/clk/mediatek/clk-pllfh.c
index 398edad2a69e..ae56d4ad66dc 100644
--- a/drivers/clk/mediatek/clk-pllfh.c
+++ b/drivers/clk/mediatek/clk-pllfh.c
@@ -244,6 +244,14 @@ static void mtk_clk_cleanup_pllfhs(void __iomem *iomem_base,
 		clk_data->hws[pll->id] = ERR_PTR(-ENOENT);
 	}
 
+	for (i = 0; i < num_fhs; i++) {
+		struct mtk_pllfh_data *pllfh = &pllfhs[i];
+
+		pllfh->state.fh_enable = 0;
+		pllfh->state.ssc_rate = 0;
+		pllfh->state.base = NULL;
+	}
+
 	if (fhctl_base)
 		iounmap(fhctl_base);
 

-- 
2.55.0


