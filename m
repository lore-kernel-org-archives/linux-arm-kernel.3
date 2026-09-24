Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61905C9830E
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Sep 2026 17:45:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+nf39wGs2BpcRYOj5iRc1ngLTSaY62SScC50mxJXgkk=; b=QfHFwag4LsWV+WZ5ewiqLox5KB
	PWe5axl5/O7a2mZ2DFdqEwAKOaEu/x9G6RBfctLAHRL1nP90A5tKCFy5k4Eb5f1n3fkSNc4Lfqgry
	jbgu0n6eyIXp4+dr26S+E/I2EIatI5fOkgGTSUMrYY7rzWtWT0OK9WauJnCSR/X4Aeu+wCiQc5D+s
	THko3uAs+gorS+ojuzFyvKm7BMdUcwRwdnjyUkOovTTlPeEfLUi99eL1Q2LckxBrbgoJkP9Bp/IhI
	Q+v6hpkw29B/v6OVFEsuEjlh+OBlttQ1HBf7WehCFQfNToosV8bUIp86eSCxq4B/cEzLJnPq2Fo6g
	t4nJtJbg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9nV4-0000000BoOA-2y1F;
	Thu, 24 Sep 2026 17:44:50 +0000
Received: from mail-oa2-x10.google.com ([2607:f8b0:4864:30::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9nUx-0000000BoJz-2cbR
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Sep 2026 17:44:45 +0000
Received: by mail-oa2-x10.google.com with SMTP id 586e51a60fabf-46dae65dc5cso143470fac.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 24 Sep 2026 10:44:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790271882; x=1790876682; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+nf39wGs2BpcRYOj5iRc1ngLTSaY62SScC50mxJXgkk=;
        b=JHnoISJ+Y6rDAv/+qCFHiMi2MKSSbuEUnjtu1wYTacwWj80Fi0/TFndxfEM+/HEYbN
         VuZfHQJVK0Wn32rwno61Z/SFsazNIsicgmGv4kgmGKErwmd2UywtbUL4fhvSnD1o3VKr
         iT09sZF/VCnI38n19BHSyfbYNcFHG45cv3pNlN51Tg14LbaFWl0DsAWVdakwva56W+FN
         SDHGqYdaRZIeb3SrHiuzgyFuCnT8ItoW6Y65fcHL+NWhOS1pBjmd/xvDDhJsnRqzhmKU
         Yoc23o50l+Hlg0BVFDpBd7usDhDXn0d+ZGLa48ljfAv5OMnnPZj7oIQcoC45gJ5qcYq4
         TWag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790271882; x=1790876682;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+nf39wGs2BpcRYOj5iRc1ngLTSaY62SScC50mxJXgkk=;
        b=B3Lky1xLY5QZPa2EVG7KGM+2taYoEyWAzTSh+NviRL8/7MgCUClYTcBX4tO9bn/zw3
         bNjuOHfQOYc+WvdI9eVbQpl3nkt5KUD7RKUUyh146zj2jWpP0b+AnsPjGDNhiDMqb8CS
         bQdmaRfZMYHyg3bpnEGw7DihQpotcKq0ldCXfjtUCHMF9ZG00ujKtAMnOth4TZWrrEIK
         fjonmYXay2HHm7orW53Ulhu7hviBfnyPTEcd3oRsxkePWl/8utHjMBZTlGK8NF3VPhjL
         ZFUr7zagWFPBAKGpQXdazXvqAH5OIf2bPVH4LWWw/ueO0kILdY9LkYHrKcC8sDTrnktD
         yY7g==
X-Forwarded-Encrypted: i=1; AKwUvBzhrsml0be4kYm0lMh6xgNBkmk7mY5Q5BXm0GKEzzvMsrza7ug1hlJnwPG0TGVWvq2aq3wMg9KOucmFmUa0HHWw@lists.infradead.org
X-Gm-Message-State: AFuF++nHdiQt5p80OkST5j0TZT0LhVUvl4/JjHchCVX7zw5NXmHJvDxL
	Ye2M2DsLi5M4biqPizR1QzTGYg5soks67Q+vFGFZ+24ZUCEXFb7YN+VZ
X-Gm-Gg: AYBFou1seBYlAMs264nCH6uCWBNrz8JF+MxJhFFvaleBpMyDgsP96KOa9Z3WWCNkqf5
	9XdZpkkh8lRfLwycdxLd0B/EQToasOvkl9RPAUVA1uv9KprFZt4Pge0vUE3I4p4D4zHKhxX46zq
	0gl9orW1/nREhh3R1JYYtAohODLuX2AznwuxtUUrMvtWDmi6PGiqtXNKke3nCBBAhW0CqPDeRND
	KKmDhQjvJJgXCzYvZq7IDio84xhFi62kQYFrQOUu6F2fhMKy4p6e9HT76jYQiPMtQDDhPHmHXmp
	lLoAWuZzp2/BJk9HjlHo+aBxI6Jfi82MKJFrI7FN8g6XvIixfU9X8GAxrjFstytnT0x8KCdxaK6
	n4+X4i6U63ZDAnKi8L2bVX/AxfXmMmeWjBI+Zt3t1UhRnJjMOm+NddBwCSSiVeyMYQNTuHWbald
	6uiul3lQwai1/0dDt5cipnqcHHkK9C95CJn+jBOkrzDVpQr917j8dbXrHswbltgLjd/AF8A+zA0
	NRRQ3Hm6QCMCpQLeyqY8kv40O5sZswMdMQ86Jv1TqkfY2LtPu9arW45ovbKW5XDx9l8kHfPrqov
	9hExIEvxWT5N81DR3beuXtyy03t00OdNGjDcbAAC7fK5C3bHuitWRUcZeK80ZV8q1AGEbsz2eve
	C73qYNsbGNoVwBiq8zxmDXQ==
X-Received: by 2002:a05:6871:3a27:b0:479:a30d:60e5 with SMTP id 586e51a60fabf-491e91f05e0mr3134003fac.37.1790271882396;
        Thu, 24 Sep 2026 10:44:42 -0700 (PDT)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-491e8f8d14asm3027802fac.0.2026.09.24.10.44.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 10:44:41 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Thu, 24 Sep 2026 11:44:34 -0600
Subject: [PATCH net v3 04/10] net: stmmac: leave the datapath running for
 normal-size MTU changes
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260924-submit-stmmac-reset-fixes-v1-v3-4-c031e3f3a282@gmail.com>
References: <20260924-submit-stmmac-reset-fixes-v1-v3-0-c031e3f3a282@gmail.com>
In-Reply-To: <20260924-submit-stmmac-reset-fixes-v1-v3-0-c031e3f3a282@gmail.com>
To: Russell King <linux@armlinux.org.uk>, Andrew Lunn <andrew@lunn.ch>, 
 Heiner Kallweit <hkallweit1@gmail.com>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Joakim Zhang <qiangqing.zhang@nxp.com>, 
 "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>, 
 Maxime Chevallier <maxime.chevallier@bootlin.com>, 
 Andrew Lunn <andrew+netdev@lunn.ch>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Christian Marangi <ansuelsmth@gmail.com>, 
 Tiezhu Yang <yangtiezhu@loongson.cn>, Huacai Chen <chenhuacai@kernel.org>, 
 Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
 Jesper Dangaard Brouer <hawk@kernel.org>, 
 John Fastabend <john.fastabend@gmail.com>, 
 Stanislav Fomichev <sdf@fomichev.me>, Serge Semin <fancer.lancer@gmail.com>, 
 Suraj Jaiswal <quic_jsuraj@quicinc.com>, 
 Richard Cochran <richardcochran@gmail.com>, 
 Joao Pinto <Joao.Pinto@synopsys.com>, 
 Vladimir Oltean <vladimir.oltean@nxp.com>, 
 Ong Boon Leong <boon.leong.ong@intel.com>, 
 Voon Weifeng <weifeng.voon@intel.com>, 
 "Song, Yoong Siang" <yoong.siang.song@intel.com>
Cc: Richard Genoud <richard.genoud@bootlin.com>, 
 Alastair D'Silva <alastair@d-silva.org>, Maxime Ripard <mripard@kernel.org>, 
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-stm32@st-md-mailman.stormreply.com, 
 linux-arm-kernel@lists.infradead.org, bpf@vger.kernel.org, 
 ZhaoJinming <zhaojinming@uniontech.com>, 
 Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>, 
 Ding Hui <dinghui1111@163.com>, James Hilliard <james.hilliard1@gmail.com>
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260924_104443_744945_28700FB1 
X-CRM114-Status: GOOD (  15.41  )
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

Changing an MTU at or below ETH_DATA_LEN does not change the receive
buffer size or the MAC receive limit when the previous MTU was also in
that range. Do not release and reopen the datapath for those changes.

Besides avoiding unnecessary hardware resets and their failure paths,
this keeps live AF_XDP pool bindings intact. Preparing replacement rings
before stopping the old rings otherwise binds the pool to a temporary
RXQ and consumes fill-ring entries while its current RXQ is still active.
XDP already rejects jumbo MTUs, so all supported live XDP MTU changes can
use this path without preparing replacement rings.

Keep jumbo transitions on the existing reinitialization path for now.
The later ownership and rollback changes address that path separately.

Fixes: 3470079687448 ("net: ethernet: stmicro: stmmac: permit MTU change with interface up")
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index 43a6154fcf6d..f7e91ae21448 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -6223,7 +6223,12 @@ static int stmmac_change_mtu(struct net_device *dev, int new_mtu)
 	if ((txfifosz < new_mtu) || (new_mtu > BUF_SIZE_16KiB))
 		return -EINVAL;
 
-	if (netif_running(dev)) {
+	/* Normal-size frames use the same buffers and MAC receive limits.
+	 * In particular, do not disturb a live AF_XDP pool: XDP does not
+	 * support jumbo frames, so it never needs the ring replacement below.
+	 */
+	if (netif_running(dev) &&
+	    (dev->mtu > ETH_DATA_LEN || mtu > ETH_DATA_LEN)) {
 		netdev_dbg(priv->dev, "restarting interface to change its MTU\n");
 		/* Try to allocate the new DMA conf with the new mtu */
 		dma_conf = stmmac_setup_dma_desc(priv, mtu);

-- 
2.53.0


