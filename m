Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46312D1037B
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 26 Nov 2025 10:46:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Ujz+iQZ3aq/Eu2hONyHsL8Ecg6vhJZ81zHq90HSGIsI=; b=TtNRVcBrA8uMHi1b3cWmpiJanF
	45WU4Jt4Kj0mnS09+0jd4CL29cAViju444Zp+vTo0YvtDs2ApKUTroFMiarHpHjXd6Wbj+CaDehhW
	33P2jF/tKxPEQ6MiVlDKw+2yOREhQ5s8KtbY3UvEubzkrY/cZ36sGmGWs5+SRXsokoKXdqeV3J0Zq
	lmif3xtxTFgPlk4LPPsbQbt3fkJxE5dUZpx0R5YjAOUXXWXjzZZBwKkXJXK+bNW4cYuBkTzisOOFA
	Jpe812Zy4+HmtunELtQzKE/jyyymKDywucC4lcwb71ezNdnYL+SKICLVgEbUkcefVqE/lcAXS8/mu
	Lwu0cNcg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOD2P-0000000EpSe-1b1S;
	Wed, 26 Nov 2025 10:46:17 +0000
Received: from mail-lj1-x22b.google.com ([2a00:1450:4864:20::22b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOD2N-0000000EpRn-0URB
	for linux-arm-kernel@lists.infradead.org;
	Wed, 26 Nov 2025 10:46:16 +0000
Received: by mail-lj1-x22b.google.com with SMTP id 38308e7fff4ca-37cd7f9de7cso39531611fa.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 26 Nov 2025 02:46:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bell-sw-com.20230601.gappssmtp.com; s=20230601; t=1764153972; x=1764758772; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Ujz+iQZ3aq/Eu2hONyHsL8Ecg6vhJZ81zHq90HSGIsI=;
        b=EsKpzL/R1N9q+YuoRQxy+OqYpyKZWVZCr2FaA5zEsWm//BL8FbADjbO3EZSdf4IBF3
         +WdN8vDAx0GZuHjjAWEnisnUpCjsn3G7cW/92t7n8Ercx3tWjZIn8J7gaQKLomk2Xbef
         8dIiL01trRktEVezByfxKBC5/syrganNzXwc3tI3N1qpmbJYUK3wACSlNk+XMUpT/DgU
         TU/17ECbdbAB27T4LvhuE5wR7Nkdp8Brfq3YxH6cREyCL2xQ6fpAz2JX6ecLN+e8CMU3
         g06KUK6nQvwUkH+nD6EWQTO7YuS1OEefd9Qfykif9oX4HxlL53dKcRlNJNGJhcSC7UXQ
         ym/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764153972; x=1764758772;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ujz+iQZ3aq/Eu2hONyHsL8Ecg6vhJZ81zHq90HSGIsI=;
        b=jQqWUrEa99Q6G+rtlnxg9dlk+sPQ58oUMn/pEgDN3tTaoTNvPbTkE1giri6VfZMjZx
         3VEUaAoxNDy9i/3nqeb7llqRlu+07YPrn6je7RNrMl7II7J46gvKyVC2X9yL16evuxy3
         hOJYXndCfXHmakiyTDyq7cl76eKZ3iAP0/62H/4A9lI/a017xEQjNRSKlygR+7yZJpw9
         ArvU737LInmpqR280+oRHPA6hdD7fGnta1ir2xJYp4uvayN7P5Cp/3GOOjHZWR9V31W7
         kpAcvO4il6x1HL0gGgNelOCXgGUBlYHKuaIKbnu6egbzxY5f6BCrbPWdIvNAlz0e6si6
         kMaA==
X-Forwarded-Encrypted: i=1; AJvYcCWZJHFnT2fTzR2g/7wYfai8oSlpto5V+tE49ED5lKvZfsRZBXOMDR1ciXJj6k3st0IClzserv+IBXk7ZnYQr5M6@lists.infradead.org
X-Gm-Message-State: AOJu0YxEV/+cADXoc2A/IN/jHM0+/VcZOF4GFiZbhk28RwIZZPnC+jDz
	7GDCmNuZx2PHsGtXYoykOZ/ZfR5+n/HcRxkxF0M4xFxr9iXB9QbOF1kDiKVaIgxR8g==
X-Gm-Gg: ASbGncthLOji6v8Z2QOZ2ERBzaOK6JrbL0uzxoKAF8DYkeyemWyrZ4NR+f/JwmBwZex
	yRyB8SK48q8t1EAS63UUN4tdQmBMApps2ZETM8K0O5NU/0n4WeSce6GldjA/S/QCPW+n7qAfVeM
	30ozssZExXnS383s6Ga1XlRlzLpTBfjvle/ChA+Rqg8shqU//W8veS9vOECjtaPQrgdRlThXaeR
	dePyUOVcrrv+EFaiBZlxJAf9iHW4SRQqHWQ8PUDUW00unjc1LN/PCl0R3HNgO3xU2g2Ml6PDQrM
	0b0bQs54n6H9JlwVDPwj7+2w5REiZ6T4GUQqluohAi95MnCeZCVDTIYBmVn34HL/tg5RIzWtnTi
	GVxz5XrLdHUKZMgCFD/DkazEjFhZRJq6VRSEe2YQnwq0KiPVatLWxmJ7isbI1vcHxYVjffKyj0N
	ft0X7AdKnr0Ff3st8TvuIJGcLKHYuuJRUyiLJ8vQ==
X-Google-Smtp-Source: AGHT+IHV4NJoDgpYQn/p/OIs9fXgEtrHCXvixk5XgByH3mJPfB4RceqYh5UKXpB1J5NvcM+BGdDNkA==
X-Received: by 2002:a2e:9215:0:b0:37b:9a1d:dee3 with SMTP id 38308e7fff4ca-37cd91a992fmr45052241fa.16.1764153972348;
        Wed, 26 Nov 2025 02:46:12 -0800 (PST)
Received: from localhost.localdomain ([5.8.36.109])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-37cc6b59f01sm37275861fa.17.2025.11.26.02.46.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Nov 2025 02:46:11 -0800 (PST)
From: Alexey Kodanev <aleksei.kodanev@bell-sw.com>
To: netdev@vger.kernel.org
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Jesper Dangaard Brouer <hawk@kernel.org>,
	John Fastabend <john.fastabend@gmail.com>,
	Stanislav Fomichev <sdf@fomichev.me>,
	Russell King <rmk+kernel@armlinux.org.uk>,
	Furong Xu <0x1207@gmail.com>,
	Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
	Vladimir Oltean <vladimir.oltean@nxp.com>,
	Ong Boon Leong <boon.leong.ong@intel.com>,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	Jochen Henneberg <jh@henneberg-systemdesign.com>,
	Piotr Raczynski <piotr.raczynski@intel.com>,
	Alexey Kodanev <aleksei.kodanev@bell-sw.com>
Subject: [PATCH net-next] net: stmmac: fix rx limit check in stmmac_rx_zc()
Date: Wed, 26 Nov 2025 10:43:27 +0000
Message-Id: <20251126104327.175590-1-aleksei.kodanev@bell-sw.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251126_024615_281238_91172796 
X-CRM114-Status: GOOD (  16.64  )
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

The extra "count >= limit" check in stmmac_rx_zc() is redundant and
has no effect because the value of "count" doesn't change after the
while condition at this point.

However, it can change after "read_again:" label:

        while (count < limit) {
            ...

            if (count >= limit)
                break;
    read_again:
            ...
            /* XSK pool expects RX frame 1:1 mapped to XSK buffer */
            if (likely(status & rx_not_ls)) {
                xsk_buff_free(buf->xdp);
                buf->xdp = NULL;
                dirty++;
                count++;
                goto read_again;
            }
            ...

This patch addresses the same issue previously resolved in stmmac_rx()
by commit fa02de9e7588 ("net: stmmac: fix rx budget limit check").
The fix is the same: move the check after the label to ensure that it
bounds the goto loop.

Detected using the static analysis tool - Svace.
Fixes: bba2556efad6 ("net: stmmac: Enable RX via AF_XDP zero-copy")
Signed-off-by: Alexey Kodanev <aleksei.kodanev@bell-sw.com>
---

After creating the patch, I also found the previous attempt to fix this issue
from 2023, but I'm not sure what went wrong or why it wasn't applied:
https://lore.kernel.org/netdev/ZBRd2HyZdz52eXyz@nimitz/

 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index 7b90ecd3a55e..86e912471dea 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -5258,10 +5258,10 @@ static int stmmac_rx_zc(struct stmmac_priv *priv, int limit, u32 queue)
 			len = 0;
 		}
 
+read_again:
 		if (count >= limit)
 			break;
 
-read_again:
 		buf1_len = 0;
 		entry = next_entry;
 		buf = &rx_q->buf_pool[entry];
-- 
2.25.1


