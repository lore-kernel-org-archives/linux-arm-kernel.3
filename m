Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 840ABE94615
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Feb 2026 22:51:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=g+TvrkNSZE9ym2PFZpW4r5uQoR0rtxBqbUzuUkdsCDo=; b=1hI6gz8hLM+93WrAKSnDgEmVNe
	835Gxjrh5j3oligWf1UklvR3n48cDeh5XnW7whWmuNXhl6siO52b/mzS3NikHsYh3zWvfe7ajhEXN
	JhrMh8cI6kZ4M89P02RZIuNQJkSiUUZggQSwmxyAaFMvrr5Dowgn5fxTjQadbuThcybq7MwIxNeYH
	Rwozb8hrzQztRZ1t0WIMKRvqV0jvOWtcE/2Y88WIw7eJDeDQmSZgW2dgboPJKHQE+ZDKqdlt2GP5A
	rQI6OnB5mzRk9Zl9UM8Fz+fvj20fic52HJFxUpUfjAzsO38kQqlmlHZHjyXqW2jq30UWIshCjiQI0
	QWr3Q+Mw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vpa65-0000000G9dX-3ONk;
	Mon, 09 Feb 2026 22:51:13 +0000
Received: from mail-qt1-x832.google.com ([2607:f8b0:4864:20::832])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vpa63-0000000G9d8-0BLE
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Feb 2026 22:51:12 +0000
Received: by mail-qt1-x832.google.com with SMTP id d75a77b69052e-50145d27b4cso57908791cf.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 09 Feb 2026 14:51:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770677469; x=1771282269; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=g+TvrkNSZE9ym2PFZpW4r5uQoR0rtxBqbUzuUkdsCDo=;
        b=aHegG7AD1MmrHIg0NVsGegeJTD3bTNPXRgJHr5dv2JAOP9Hm9hnXhgErgEFRMk1Mpw
         1RdHIxnJD/wq3aUDYbSIG7OuIZ6BZkRhY3Ph2KFWWAzDj4qaV9YlvpOmQSycwQcuv6ws
         zd6F6v87eO8OJ2FnqEc5iaUidISi0xTwPB5CHSjrUQVQuNK1Ysye/A16FlK9B1PnFJJl
         H2n/naA1LoXCkWWZfFIugJPrqGibDtP27uAZgtqiw+SN7sope4Nb84TB3lGsk7IN2b3H
         oJ7SLTUpiDvCR+wQvYoq133YeTaZ93wLkNYYBYRH8iuxZL7yvCQhwDqR1ES2fd7QhGKy
         9VcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770677469; x=1771282269;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=g+TvrkNSZE9ym2PFZpW4r5uQoR0rtxBqbUzuUkdsCDo=;
        b=MCQpdr/6HRCRtdPyp494eaMCNwouGznbYaKiV6RH73FmYKLjwWzJ9sCUDvPenOe7Yu
         kvg+17kgHjEK7+uBeb00XXbWiai8Xoei9CwpG9OamKMcTQXe333h+a0iTjWjzNq/BKoI
         b3/V7xnUeTeMu6EQye6qNiqJ+HLy+QKptnykVhkOx1MvcQbNzg/YSxctPhf8+4iopn+1
         OH8hNzqDAB8dE2pKu6/qc6NsMIyVamQicuPrFY9nlfT1F4al4I8rIA7/D168dLQ+1Iuv
         P5jFWi7qMkEgZREmhpkVeXgNkDgALlg+T89gaWST2CJT5VSJ5X4vIdz1efbjvi75nok8
         g56Q==
X-Forwarded-Encrypted: i=1; AJvYcCUf+s6IKaXxKmp7MjrWbQYgMlTyjA+GKNKShQe5BHAVNc7z7UZPW4UKf/NOZoE+OH+/umHyzQu0gvCE70TP1uoP@lists.infradead.org
X-Gm-Message-State: AOJu0YzYyMCCnd+/ZnQLnv0hQmF62zxWmVD3SszIA/FLin0rxvUbol9a
	IGtOJEpYtv9LURtk71HAQ1POQG4TQtuSAMr8WqfhsUIS4O17J0nePulW
X-Gm-Gg: AZuq6aLMs/qgwYsArIDAhbbjsue4tDNt1IJmg6YDgJ/INWHpjFcSyWCuyQzh07XveC5
	e7sr1gxLTP1ROlDGQD3buPzTDuZtpJuBV5Jabao4y/nsGs9ZMINGkxIJnXxvNTtBX07DXJzZ8/3
	fLHA5Uj8qwc7WLeAWztfaVDbGn0bdK+DOJLJ1WKxPVdsBh/4qhdk+5HDY4K0s+XLwwdJo7i+9HI
	aARCyFsyHAxJnHnPn0m0nJ7UjncCn6FmG6jI3k7KPDhmKHlJGLrrK0RZnIpER6u8V31mJy+mFZo
	6czCdA8Lbbk45CBKqbGEeNSV7SER978UW3iuDhr5F7tl43REvFMzNoJva0+litjkFUuc5GonQqh
	Mzw3lB9YhT8glL6ZdgFtns9atWQvuh9eTLqEJX7Y07H46qXNhVcpGrbQi9dPsxI8e1jBQK6sRqd
	dHrrUN5aE8f/X379nZtCfaUkoAJfOt/ebsF7ShNyQA41LNdsQVtq7MGMNhn2GEBf1p8LMtRz+fu
	6k=
X-Received: by 2002:a05:622a:314:b0:4ee:4a8b:d9f6 with SMTP id d75a77b69052e-50639999b38mr165019831cf.59.1770677469375;
        Mon, 09 Feb 2026 14:51:09 -0800 (PST)
Received: from localhost.localdomain (h69-131-24-92.cntcnh.broadband.dynamic.tds.net. [69.131.24.92])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-50640c60b3csm87021861cf.8.2026.02.09.14.51.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Feb 2026 14:51:08 -0800 (PST)
From: Jie Zhang <jzhang918@gmail.com>
X-Google-Original-From: Jie Zhang <jie.zhang@analog.com>
To: netdev@vger.kernel.org
Cc: jzhang918@gmail.com,
	jie.zhang@analog.com,
	horms@kernel.org,
	Jacob Keller <jacob.e.keller@intel.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	"Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>,
	Maxime Chevallier <maxime.chevallier@bootlin.com>,
	Vladimir Oltean <vladimir.oltean@nxp.com>,
	Jose Abreu <Jose.Abreu@synopsys.com>,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH net v3] net: stmmac: fix oops when split header is enabled
Date: Mon,  9 Feb 2026 17:50:32 -0500
Message-ID: <20260209225037.589130-1-jie.zhang@analog.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260209_145111_112848_CC99CAF2 
X-CRM114-Status: GOOD (  17.83  )
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

For GMAC4, when split header is enabled, in some rare cases, the
hardware does not fill buf2 of the first descriptor with payload.
Thus we cannot assume buf2 is always fully filled if it is not
the last descriptor. Otherwise, the length of buf2 of the second
descriptor will be calculated wrong and cause an oops:

Unable to handle kernel paging request at virtual address ffff00019246bfc0
...
x2 : 0000000000000040 x1 : ffff00019246bfc0 x0 : ffff00009246c000
Call trace:
 dcache_inval_poc+0x28/0x58 (P)
 dma_direct_sync_single_for_cpu+0x38/0x6c
 __dma_sync_single_for_cpu+0x34/0x6c
 stmmac_napi_poll_rx+0x8f0/0xb60
 __napi_poll.constprop.0+0x30/0x144
 net_rx_action+0x160/0x274
 handle_softirqs+0x1b8/0x1fc
...

To fix this, the PL bit-field in RDES3 register is used for all
descriptors, whether it is the last descriptor or not.

Fixes: ec222003bd94 ("net: stmmac: Prepare to add Split Header support")
Reviewed-by: Jacob Keller <jacob.e.keller@intel.com>
Signed-off-by: Jie Zhang <jie.zhang@analog.com>
---
v3:
1. Fix build error
v2:
1. Update for the latest net HEAD
2. Reduce crash dump message in commit message
3. Add Fixes tag
v1 link: https://lore.kernel.org/all/20251202025421.4560-1-jie.zhang@analog.com/
---
 .../net/ethernet/stmicro/stmmac/stmmac_main.c | 20 ++++++++++++++++---
 1 file changed, 17 insertions(+), 3 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index a379221b96a3..f98fd254315f 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -5023,13 +5023,27 @@ static unsigned int stmmac_rx_buf2_len(struct stmmac_priv *priv,
 	if (!priv->sph_active)
 		return 0;
 
-	/* Not last descriptor */
-	if (status & rx_not_ls)
+	/* For GMAC4, when split header is enabled, in some rare cases, the
+	 * hardware does not fill buf2 of the first descriptor with payload.
+	 * Thus we cannot assume buf2 is always fully filled if it is not
+	 * the last descriptor. Otherwise, the length of buf2 of the second
+	 * descriptor will be calculated wrong and cause an oops.
+	 *
+	 * If this is the last descriptor, 'plen' is the length of the
+	 * received packet that was transferred to system memory.
+	 * Otherwise, it is the accumulated number of bytes that have been
+	 * transferred for the current packet.
+	 *
+	 * Thus 'plen - len' always gives the correct length of buf2.
+	 */
+
+	/* Not GMAC4 and not last descriptor */
+	if (priv->plat->core_type != DWMAC_CORE_GMAC4 && (status & rx_not_ls))
 		return priv->dma_conf.dma_buf_sz;
 
+	/* GMAC4 or last descriptor */
 	plen = stmmac_get_rx_frame_len(priv, p, coe);
 
-	/* Last descriptor */
 	return plen - len;
 }
 
-- 
2.47.3


