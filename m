Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BED67C02180
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Jan 2025 03:34:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vrnZOWuzbTsFJQSfUdSJAVwNu1OpPEJIPOluJRIjDnY=; b=GlH2h1y3aBcDQM8hF5N1REAJUx
	RFoCY0toV8w64p/Xd+EBIl8mytEsi5whZOEci+eyAAECiFQmSdEW7suOtDWf82tR7AAKMjzLLbnfH
	ofG1JD2BiX+UJmoyY6YecfeYA8KZjxpk/aaTCi++7WS1F/TH3otOKXC53d3oFZiPnsMq/NjmpYRZo
	e02DJ8u82sgtANkxRFnxS0l6kpjuVkbm+9j0LFmL5w8kzYiRUshI7jy8EiS1/VRMB6vMxqGiPzG4B
	DEtKEC7d9VAJF0v9gYOSOe/mSHzb/dQTRdCPuIhGyTYMuxzLaxq19kgc6I63inxUPJhYBTmwoPwEj
	t/qWPzSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tXuAK-0000000AW9r-0NNM;
	Wed, 15 Jan 2025 03:34:00 +0000
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tXu4K-0000000AVJD-058x
	for linux-arm-kernel@lists.infradead.org;
	Wed, 15 Jan 2025 03:27:49 +0000
Received: by mail-pl1-x62b.google.com with SMTP id d9443c01a7336-21669fd5c7cso113757055ad.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 14 Jan 2025 19:27:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736911667; x=1737516467; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vrnZOWuzbTsFJQSfUdSJAVwNu1OpPEJIPOluJRIjDnY=;
        b=jm+qjlKIgBGAU8sztcqN3EEnN3n9K+qS2aYCEaT4rSdg6pQR/xW6k3dtTKiccMdHUX
         EJfRlCI9JbLMGeP+J54W9vFPGDaof1sKSVgBkSuoqvw8fgZ6YUfgY8fn/rG+vQ2F+Cxc
         4Lsa0JQSYkIWbGI8cvdvehFCHSsC8YKmrI8irN7zuRCAI1alrEjWhstsdTNZPXUscPkx
         ovOJALcoGyMMSbye+cgPhHNfmwGLB019lRKQn6iel7QzIhvfR5AyD20ZldpFcTkK438k
         HkWwvvOAmWy5bVNE0og88idSDvMzK759/cSExBuQHe4j71or2Ek9J3yWhcF4MJGy0JP5
         yqVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736911667; x=1737516467;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vrnZOWuzbTsFJQSfUdSJAVwNu1OpPEJIPOluJRIjDnY=;
        b=hw9iXqaJXqNpSUtxwuRBAWoqtsKdvmeBDqu/i/Ab84l+YjOib6AQXgTM+ukijUDY3V
         rakDvraF//HgFPCVhtxcfewSyfmSHstAZ960Je1kBmIqRiCuZTumkMunBrNvaLu+kM0i
         hEyDruR5g98Qo9ABMS5EJ1HuO68/VQvdZi4sNSN3yypnTg7GQD1fYsjiUVjKk9c9ffN/
         erVsn1szwp+9JOapQ5koLx2udT+7Yz/FQ51MJOdZ6XJjOkChw+uqm12to+M2CTFSI7+o
         NYoW3v9DOCMGqek10mzK34MqRarzM2E+CWrUupHS///ZifAf9AgTbKfAFXpxQvnCiB0Z
         zBvw==
X-Forwarded-Encrypted: i=1; AJvYcCVe5lxXIHrikD0igkITLUcK+u43MhVPZ1WpOqIUWtltPP4TAxVVv4H4jBbqkWKYyPI1NiFqT1EKNbHFdYaqx2Un@lists.infradead.org
X-Gm-Message-State: AOJu0YyzebWGaqeZnL7Qg3YiTeVyd8xkWq1suMnKCl76izBKOaE5qxgX
	PIgfRvBZ5+DUyiGWJTA+npwAGI7Ri/ZWa6mEvkvfsk48foAb60bb
X-Gm-Gg: ASbGncs+FQ70o80UuOUALCWaB9iTu5FpeWcU+jb5VmcUjceVr3fpFrUDtlN83GyoNW7
	UlLSlpNdA6TwKPZ3DQlgSzYN62uajHgtMxsbx2yd87ZNm+8c5d0RrZyTpZEnOuBQtK1j+/PQNDv
	noSGxS7VYjhQWweoHIfud6j3KE8zbbAIGfDnypKAxfYCeTymu1cE342aMjEeGR7ItO6APQBM3dx
	sYlsrCtqFVnLpgoReQ3IbB3F349LN4Yu6qzS/qX6DQzDohTQBfpcmDAjcPyFtcBRdRsiQ==
X-Google-Smtp-Source: AGHT+IEgvbbedPhMmlQrROuWhBJEvCl3rJhkcO1ll2KbOYDFwCkOh7dbSjQ3/MMG4kA76MxUXWGidA==
X-Received: by 2002:a05:6a00:39a7:b0:728:e382:5f14 with SMTP id d2e1a72fcca58-72d21f314e9mr32614582b3a.9.1736911665971;
        Tue, 14 Jan 2025 19:27:45 -0800 (PST)
Received: from localhost.localdomain ([129.146.253.192])
        by smtp.googlemail.com with ESMTPSA id d2e1a72fcca58-72d405493basm8166452b3a.27.2025.01.14.19.27.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jan 2025 19:27:45 -0800 (PST)
From: Furong Xu <0x1207@gmail.com>
To: netdev@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Alexander Lobakin <aleksander.lobakin@intel.com>,
	Joe Damato <jdamato@fastly.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	xfr@outlook.com,
	Furong Xu <0x1207@gmail.com>
Subject: [PATCH net-next v3 4/4] net: stmmac: Convert prefetch() to net_prefetch() for received frames
Date: Wed, 15 Jan 2025 11:27:05 +0800
Message-Id: <909631f38edfac07244ea62d94dc76953d52035e.1736910454.git.0x1207@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1736910454.git.0x1207@gmail.com>
References: <cover.1736910454.git.0x1207@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250114_192748_062110_47B3EA41 
X-CRM114-Status: GOOD (  11.60  )
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

The size of DMA descriptors is 32 bytes at most.
net_prefetch() for received frames, and keep prefetch() for descriptors.

This patch brings ~4.8% driver performance improvement in a TCP RX
throughput test with iPerf tool on a single isolated Cortex-A65 CPU
core, 2.92 Gbits/sec increased to 3.06 Gbits/sec.

Suggested-by: Joe Damato <jdamato@fastly.com>
Signed-off-by: Furong Xu <0x1207@gmail.com>
---
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index ad928e8e21a9..49b41148d594 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -5529,7 +5529,8 @@ static int stmmac_rx(struct stmmac_priv *priv, int limit, u32 queue)
 
 			dma_sync_single_for_cpu(priv->device, buf->addr,
 						buf1_len, dma_dir);
-			prefetch(page_address(buf->page) + buf->page_offset);
+			net_prefetch(page_address(buf->page) +
+				     buf->page_offset);
 
 			xdp_init_buff(&ctx.xdp, buf_sz, &rx_q->xdp_rxq);
 			xdp_prepare_buff(&ctx.xdp, page_address(buf->page),
-- 
2.34.1


