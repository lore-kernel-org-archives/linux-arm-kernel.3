Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37604CD6E74
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  5 Jun 2026 07:57:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ypRXmfNw4AH7NGaRxQ71Nt3S+wAEO8XxXRpJWlgrK/o=; b=sKnbJC0gEw+HGZM9CYplmnCKej
	NXn25d4AvksvUXJnFCT+PsLFJrU/m4f+s49MXguI0vmu1JhIKZcnIn7ncrgoYMOuhRsbvkENtUoiX
	OwWTLNLIdHDv/WF9YaUtukL4Gc8gWjiJLPptAwSghKi11m1oefYfYVTaF5ZUM5tNgKaMu17AEO0At
	RiCUe2D5/SLZTBja6FVMVLVQmIOSi0Pa2efrdj5Kj3TK9aKxEFbrCOjQU70mFhmloH66OeqYi2Jn0
	Gu8Os85Ku4/DpRdIuW0hPxBq02b/5oEMcdUa6OB94ARI8RoOYgc5De+7zPZMqvHlIJIxCZXo0slyx
	ykQDpE8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wVPQk-00000000GfL-0qnc;
	Fri, 05 Jun 2026 07:57:26 +0000
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wVPQh-00000000Gek-45R9
	for linux-arm-kernel@lists.infradead.org;
	Fri, 05 Jun 2026 07:57:25 +0000
Received: by mail-pj1-x102d.google.com with SMTP id 98e67ed59e1d1-36da8439078so1486042a91.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 05 Jun 2026 00:57:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780646243; x=1781251043; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ypRXmfNw4AH7NGaRxQ71Nt3S+wAEO8XxXRpJWlgrK/o=;
        b=qA8kJQss7JFSKy2vBu6GHkzxDi3robAK2neUOGcZ4/4Ra0mgiiDq7g2ioQVvgK9XKQ
         3poBFbcKCs+mQOJClbIg+96V4uCJg8JZRAw5LLpw60bCkvUbV+03labvFPzY6/T1QmEO
         3joh2kEWp8g3IaKPrvNYl5OyCTMA5O+EGUMY1CreOBMv8cQoyrmxcfkJdkH6Wr6xbrrK
         PrSGWAl5d7PWKSLaPxS+F7A5SByo6dZbM1C09aRKHKDWAOoHxQ4ZD7tW/7vVRsa8n3Ds
         TD5Rz0h7BJKzuEnCK158ekZ9kX/mD1A1Qsbkn1r+m4KboiZ4I8GXWSkug4xFRWshF0to
         FyAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780646243; x=1781251043;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ypRXmfNw4AH7NGaRxQ71Nt3S+wAEO8XxXRpJWlgrK/o=;
        b=E+pWjrPPDRgzh2huT2Yv2/Ssy/ZYQYWHY7xwb02faHENya0zOpp20c3QTx76HzesMa
         +rBD22DAaSd3NRp2vYsxA2oTyMT/DzhdM2frc3FhXj+Vr2Axt2eNf+6XN/N6nM4KaBwF
         Dz0XlVeNdW6tBSLoVOf7GE4LBUGTVmI3PJHtgRdf5DbeEu6AbAPaFrbNtJfLxj5SHCB7
         sV1FlWCBXSr6xKgi1kpKtFB2btDod9FQmK34+l6xTgXtf0BCtgs20qMKxeZo7NlQd2zH
         B0z6fRi2vgg4G/GscFHFPsXM4O1ocvpUDRQaBtjQvETFdxX9fwrLb3+hOj9d4tqXXXPA
         95RA==
X-Forwarded-Encrypted: i=1; AFNElJ8FJSiJPYoQxJku6OJGyVqSiDA3rpS3cZhFwQw8tlFYdVc8xJ5gM5ye4BhAb4SdG4bl0/ZuAtJMR1m5SE/HW9Wz@lists.infradead.org
X-Gm-Message-State: AOJu0YxeHdVpmGT3qSm+mgjlHAubFee3M67+L1szMr1Xoz/ZMdD37SXg
	1tKYetOS/AW5exxWeEr2crHvdmwmVsEGJpS5LmhCQNB1Sv6MInbYmNxn
X-Gm-Gg: Acq92OHUyfIXMLTqj7xm4v+xS7vNukd8ycErf6QKLxVRUwbtVQkj+CdETQTD2adcifL
	RsITcCbuQMZaFDIJcaI6shOf7d1z5U0aqJVifwm1KbZjTiwjoM8KmR1Uz9FnAY+OT3ctgT5tDQv
	0P+TDjzKRNVZ+LI8ycHcdV9avQbLwFFHzZZebjAWPRlwTm0/ytJhfqndktBARxvrZP+BOK6x+dN
	arlv5dRK5yRHjXttBtcfWbm4coiomXDo5p/ItAVABt2il0gRTDONa3QziO6ghwKDPcfbYeLeKMA
	vgrHdZQ08TY4gLNalKAmsrZO4j15LnsVIP+i9AbqvmptDhgMiKX2pl/4MTDvFc6+piQXi79XNnR
	GNdmKDc6fd8uGMk5gctb2yzVzcm9wREdXTvN3n9s0v2B/1CxpV6Xb3+kBCIpqIeStHuoZEAU6cG
	6CfgEY+9jmeQzU+gNnUk0iemF13CjDIZa8VG/XmcjFj0fkJhccg2hKFBUlpUMzPZPyHxdy05qjs
	g==
X-Received: by 2002:a17:90b:3512:b0:36d:b424:4f17 with SMTP id 98e67ed59e1d1-370ee82fa3cmr2367318a91.1.1780646242679;
        Fri, 05 Jun 2026 00:57:22 -0700 (PDT)
Received: from u9dbb0cac493f51.ant.amazon.com ([50.35.61.175])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-37133082519sm897559a91.1.2026.06.05.00.57.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Jun 2026 00:57:22 -0700 (PDT)
From: Carlos Fangmeier <carlos.fangmeier@gmail.com>
Date: Fri, 05 Jun 2026 00:56:35 -0700
Subject: [PATCH] net: stmmac: prevent kernel panic during XDP program and
 XSK pool transitions
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260605-main-v1-1-aed15b1cf1af@gmail.com>
X-B4-Tracking: v=1; b=H4sIADKBImoC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDMwMT3dzEzDzdNDPLNEtTM5NEc5MkJaDSgqLUtMwKsDHRsRB+cWlSVmp
 yCUivUm0tAMnGDJdoAAAA
X-Change-ID: 20260604-main-f69f9564a74b
To: Alexei Starovoitov <ast@kernel.org>, 
 Daniel Borkmann <daniel@iogearbox.net>, 
 "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, 
 Jesper Dangaard Brouer <hawk@kernel.org>, 
 John Fastabend <john.fastabend@gmail.com>, 
 Stanislav Fomichev <sdf@fomichev.me>, Andrew Lunn <andrew+netdev@lunn.ch>, 
 Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Ong Boon Leong <boon.leong.ong@intel.com>
Cc: netdev@vger.kernel.org, bpf@vger.kernel.org, 
 linux-stm32@st-md-mailman.stormreply.com, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Carlos Fangmeier <carlos.fangmeier@gmail.com>
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260605_005724_017896_0F753E4B 
X-CRM114-Status: GOOD (  14.20  )
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

stmmac_xdp_set_prog() tears down and rebuilds all DMA channels via
stmmac_xdp_release()/stmmac_xdp_open() without pausing the netdev
TX path. Similarly, stmmac_xdp_enable_pool() and
stmmac_xdp_disable_pool() reconfigure individual queue DMA rings
while TX remains active.

If the kernel transmits a frame during these windows — for example an
MLD report queued by the IPv6 stack — stmmac_xmit() calls
dwmac4_set_addr() against an MMIO register whose mapping has been
torn down, triggering a level-3 translation fault:

  Unable to handle kernel paging request at virtual address ffff8000840ec000
  pc : dwmac4_set_addr+0x8/0x18
  lr : stmmac_xmit+0x64c/0xb60
  Call trace:
   dwmac4_set_addr+0x8/0x18
   dev_hard_start_xmit+0xb0/0x220
   sch_direct_xmit+0x108/0x3f0
   __dev_queue_xmit+0x844/0xd00
   ip6_finish_output2+0x2d8/0x610
   mld_sendpack+0x180/0x2e0
   mld_ifc_work+0x1dc/0x480

The existing netif_tx_disable() in stmmac_xdp_release() is not
sufficient because stmmac_xdp_open() re-enables TX via
netif_tx_start_all_queues() before the caller regains control, leaving
a window where the freshly rebuilt rings can race with pending TX work.

Fix this by wrapping each reconfiguration path with
netif_tx_disable()/netif_tx_wake_all_queues():

 - stmmac_xdp_set_prog(): hold TX disabled across the full
   stmmac_xdp_release() + stmmac_xdp_open() sequence, only waking
   TX after stmmac_xdp_open() returns.

 - stmmac_xdp_enable_pool(): disable TX before tearing down the
   queue, re-enable after the queue is rebuilt and NAPI is active.

 - stmmac_xdp_disable_pool(): same pattern around the pool teardown
   and queue rebuild.

Tested on Cortex-A55 (stmmac/dwmac4, kernel 6.6.60) with AF_XDP
zero-copy and IPv6 active — no panics observed across repeated
XDP attach/detach and XSK pool setup/teardown cycles.

Fixes: 132c32ee5bc0 ("net: stmmac: Add TX via XDP zero-copy socket")
Signed-off-by: Carlos Fangmeier <carlos.fangmeier@gmail.com>
---
 drivers/net/ethernet/stmicro/stmmac/stmmac_xdp.c | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_xdp.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_xdp.c
index d7e4db7224b0..a6611aee687f 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_xdp.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_xdp.c
@@ -34,6 +34,7 @@ static int stmmac_xdp_enable_pool(struct stmmac_priv *priv,
 	need_update = netif_running(priv->dev) && stmmac_xdp_is_enabled(priv);
 
 	if (need_update) {
+		netif_tx_disable(priv->dev);
 		napi_disable(&ch->rx_napi);
 		napi_disable(&ch->tx_napi);
 		stmmac_disable_rx_queue(priv, queue);
@@ -46,6 +47,7 @@ static int stmmac_xdp_enable_pool(struct stmmac_priv *priv,
 		stmmac_enable_rx_queue(priv, queue);
 		stmmac_enable_tx_queue(priv, queue);
 		napi_enable(&ch->rxtx_napi);
+		netif_tx_wake_all_queues(priv->dev);
 
 		err = stmmac_xsk_wakeup(priv->dev, queue, XDP_WAKEUP_RX);
 		if (err)
@@ -72,6 +74,7 @@ static int stmmac_xdp_disable_pool(struct stmmac_priv *priv, u16 queue)
 	need_update = netif_running(priv->dev) && stmmac_xdp_is_enabled(priv);
 
 	if (need_update) {
+		netif_tx_disable(priv->dev);
 		napi_disable(&ch->rxtx_napi);
 		stmmac_disable_rx_queue(priv, queue);
 		stmmac_disable_tx_queue(priv, queue);
@@ -87,6 +90,7 @@ static int stmmac_xdp_disable_pool(struct stmmac_priv *priv, u16 queue)
 		stmmac_enable_tx_queue(priv, queue);
 		napi_enable(&ch->rx_napi);
 		napi_enable(&ch->tx_napi);
+		netif_tx_wake_all_queues(priv->dev);
 	}
 
 	return 0;
@@ -121,8 +125,10 @@ int stmmac_xdp_set_prog(struct stmmac_priv *priv, struct bpf_prog *prog,
 		xdp_features_clear_redirect_target(dev);
 
 	need_update = !!priv->xdp_prog != !!prog;
-	if (if_running && need_update)
+	if (if_running && need_update) {
+		netif_tx_disable(dev);
 		stmmac_xdp_release(dev);
+	}
 
 	old_prog = xchg(&priv->xdp_prog, prog);
 	if (old_prog)
@@ -131,8 +137,10 @@ int stmmac_xdp_set_prog(struct stmmac_priv *priv, struct bpf_prog *prog,
 	/* Disable RX SPH for XDP operation */
 	priv->sph_active = priv->sph_capable && !stmmac_xdp_is_enabled(priv);
 
-	if (if_running && need_update)
+	if (if_running && need_update) {
 		stmmac_xdp_open(dev);
+		netif_tx_wake_all_queues(dev);
+	}
 
 	if (prog)
 		xdp_features_set_redirect_target(dev, false);

---
base-commit: 4aacf509e537a711fa71bca9f234e5eb6968850e
change-id: 20260604-main-f69f9564a74b

Best regards,
--  
Carlos Fangmeier <carlos.fangmeier@gmail.com>


