Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D16B1CC6B1A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 13 Oct 2026 20:36:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=mdu7JDYg4pNMYKBbp9bk7b11wP54fdQOVT/LCjvbPgg=; b=rIpjWExbf1JwRl67jrJYR5O8O1
	G1JsUSdS0FePXQ+q1mBqqCL86IuebaXYaitUGHgObBrvh2Galh5dZtaCJ2CiFu/cZRevE8pzPg4dP
	xXydyEI9K73O0p+SNNrS3tfoNkDJhz4HhLcEdv0C79nDJ4Up4vBXMrQF4SGsz2pEjfhnPYNU02rCB
	OL3JXxsHlsadcYER25i4NwmzANBAiRWKwkwaq0XXU5e7d7xkoKh3Fi6r/o4QjtXnq7bs+Vw5o0RKy
	dI/sn/K0zINlcQq+J9I24pRdhaQUkCvW7c4Kr++9GqSH3p9Owd7BilnqIit3BnV07+vmrxWFmCbLb
	1sso6Vzw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGjDw-0000000E1G6-3kaP;
	Tue, 13 Oct 2026 20:35:48 +0000
Received: from mail-oa1-x30.google.com ([2001:4860:4864:20::30])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGjDu-0000000E1FQ-3Uun
	for linux-arm-kernel@lists.infradead.org;
	Tue, 13 Oct 2026 20:35:47 +0000
Received: by mail-oa1-x30.google.com with SMTP id 586e51a60fabf-47b47de8b4cso2069465fac.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 13 Oct 2026 13:35:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791923746; x=1792528546; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=mdu7JDYg4pNMYKBbp9bk7b11wP54fdQOVT/LCjvbPgg=;
        b=aQ2easPXlcw12lUnv7Ryp9yffzNTH+X0AXSiGwHVwiJ9pbRuObtt/0YWFWZJTd5Mce
         aLH6XdEpX4W8dvtGQfEB4Z1a4a9MhDS1N/GJSuyz8gLBLLCfsearCs8TehzB+iqqkCEv
         ym5yAvUOpoNOBmX39jcAJHQBuRWJDwrsFvhICQVwlcv79QNoSQeVwaYivsEEXJvCIkhi
         IXllWwTexQmZxc4m9byHDB3n/zhXelni48AwJYqc4lqcPytEcz38c5b6SlOlaY5aPCXC
         FDYTHWGPGelg8ILHx+e+MmrRYg1jjGePhSMXh3xH/Aa3WypbnpXsh3kyu/7eU+z06gQN
         3DdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791923746; x=1792528546;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=mdu7JDYg4pNMYKBbp9bk7b11wP54fdQOVT/LCjvbPgg=;
        b=gtCt6EVsc1m7yhcHAlembLwgyaYgCiwSBcEEzshhM/f80v1nuy7gLI8G59OXJuIp//
         jtP8VfCJ5jMH7IT8XC+sx1LTE76aW2iluAAGVPmkJtFMCjSuIHcJaBIIoVQpkmH6Dk8z
         sGnahpvEnxKdx+xXBdQTxPqdkzhJgg3tVn0aysnScNvUFw8eCQthvt0grPthtJhm9SHl
         YkmawQQwXjp59Nr514IkFTDFkinlyKXVkfOw1NHxaTllYaDzcLf+wecQ55oSdJnF5H4f
         HCCsXpofeAavztBXI7SGDuOT1mw+NOpqEmLlr98QpDSCb2sHIOjrxdYFrdzjzVW6cHBs
         BSTA==
X-Forwarded-Encrypted: i=1; AKwUvBz+dgSIdxHWBjNZLZk+ZbxUGKv4UsmnRmwXf3SFRDtRqYQxdIjPBBJHkLu1dY8IMfFP2H5VjPIIHxLHeeWJwNLs@lists.infradead.org
X-Gm-Message-State: AFq9FYL6cOLaYnfgLoYUWU8QaoMb26NloPvbsIz4no8uo1TgNTpBxp0N
	+mzru3o/VYads+JkFJLlkeuwxXNJ28e55gSMqHX7y1IyyXLsr83fYyuM
X-Gm-Gg: AYBFou0G93QJ0eBzupXpxeIflCUADAlSSEz+FsjLEuPYWKF76hFbuhbCDxNjdrJ3z0U
	0RhP+Gs8C++Ua07QVe0RfURDhHpYiav73lOTluufXGysKpwCE3xC/NoB3DuOuGpb8yMvDXMIq8U
	gG8G5oJUoyXuBmqsF+CkA/1EYCh0vGKual2HXTedYVNiuMNdTFD10iuXNes9qH9Gdcwjcnbbmcl
	dfzUwAF473/WYxtFHYcbTK7rzjoeOEncHQb77eijTxe8/utM00pmOik8Cm8oKyKTgQj+NdavgRg
	w8f82NGoygT23DH06sgWI4GAul0I+ppdrMq+VFwE8G1tjTY65Uf5wWEcTe30KgcxYlt9C2IE12N
	sxjl+0E4plzknut0kOc2B83qTin7YDvFEYIE7FHZqG7rsLCgtLH3Apn8WRuMmsp66sSObf8TFfZ
	8HtMm1HUMuaQFsh/UWBi1Zb1dbg18j1X2yRETDzFWc7+/nedHySo68CwB411hTTbOXdClbyRL4n
	QpYCBoKxN501KfDMx/kk0zaZoCMoIOYWFrk/iKtGbn+dNxIWN9xEPx5HCMji4nQHHDVvVj9+KLQ
	l8iPKZbmbW+D2EB4/N00yU+zsJLBtjBhihYjlvxS0rJUh0u5A+S/ZMdd038p08dhqdQZxeFHRWX
	gHID0tkMl7Je/VqmdpC6J
X-Received: by 2002:a05:6871:54b:b0:48f:e25e:e203 with SMTP id 586e51a60fabf-4a2a89f4067mr11899379fac.52.1791923745657;
        Tue, 13 Oct 2026 13:35:45 -0700 (PDT)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4a6df871f44sm596045fac.1.2026.10.13.13.35.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 13:35:45 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Tue, 13 Oct 2026 14:35:42 -0600
Subject: [PATCH net] net: stmmac: avoid duplicate XSK TX completions
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261013-submit-stmmac-xsk-tx-completion-v1-v1-1-f21b9d098e62@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yWN0QrCMAxFf2Xk2UA7YU5/RXzoaqZR240mjsLYv
 xv18Ry4564gVJgETs0KhRYWnrKB3zUQ7yHfCPlqDK1rO++cR3kPiRVFUwoRqzxRK8YpzS9S2+L
 ise8PnRvDcfBuDxaaC41cfydnyKRw+UtLPSjqNw/b9gFVMlp9iwAAAA==
X-Change-ID: 20261001-submit-stmmac-xsk-tx-completion-v1-88760fa9b103
To: Maxime Chevallier <maxime.chevallier@bootlin.com>, 
 Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Ong Boon Leong <boon.leong.ong@intel.com>
Cc: netdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Magnus Karlsson <magnus.karlsson@intel.com>, 
 Maciej Fijalkowski <maciej.fijalkowski@intel.com>, 
 Stanislav Fomichev <sdf@fomichev.me>, bpf@vger.kernel.org, 
 James Hilliard <james.hilliard1@gmail.com>
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261013_133546_906881_3564751F 
X-CRM114-Status: GOOD (  12.70  )
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

stmmac_tx_clean() reports completed AF_XDP TX descriptors through
xsk_tx_completed(), but leaves their buffer type as STMMAC_TXBUF_T_XSK_TX.
The slots retain that type until they are reused for another buffer type.

On interface close or XDP teardown, dma_free_tx_skbufs() walks the entire
TX ring, not just the dirty_tx..cur_tx range. stmmac_free_tx_buffer()
counts the stale XSK_TX slots again, causing xsk_tx_completed() to advance
the completion-ring producer for buffers that have already been returned.
This publishes completion entries without matching outstanding TX
reservations and corrupts completion accounting for a socket which stays
bound across the teardown.

Reset the XSK buffer type after counting the completion in both
stmmac_tx_clean() and stmmac_free_tx_buffer(). XSK TX slots have a NULL
skb pointer and no per-slot DMA mapping, so the SKB type represents an
empty slot. Pending XSK descriptors keep their type until they are
completed or released, and a released slot can no longer be counted
again by a later cleanup.

Fixes: 132c32ee5bc0 ("net: stmmac: Add TX via XDP zero-copy socket")
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
Assisted-by: Codex:gpt-6-astra
---
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index b837e8e27a35..1527e03711cc 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -1742,8 +1742,10 @@ static void stmmac_free_tx_buffer(struct stmmac_priv *priv,
 		tx_q->xdpf[i] = NULL;
 	}
 
-	if (tx_q->tx_skbuff_dma[i].buf_type == STMMAC_TXBUF_T_XSK_TX)
+	if (tx_q->tx_skbuff_dma[i].buf_type == STMMAC_TXBUF_T_XSK_TX) {
 		tx_q->xsk_frames_done++;
+		tx_q->tx_skbuff_dma[i].buf_type = STMMAC_TXBUF_T_SKB;
+	}
 
 	if (tx_q->tx_skbuff[i] &&
 	    tx_q->tx_skbuff_dma[i].buf_type == STMMAC_TXBUF_T_SKB) {
@@ -2926,8 +2928,11 @@ static int stmmac_tx_clean(struct stmmac_priv *priv, int budget, u32 queue,
 			tx_q->xdpf[entry] = NULL;
 		}
 
-		if (tx_q->tx_skbuff_dma[entry].buf_type == STMMAC_TXBUF_T_XSK_TX)
+		if (tx_q->tx_skbuff_dma[entry].buf_type == STMMAC_TXBUF_T_XSK_TX) {
 			tx_q->xsk_frames_done++;
+			/* Teardown must not count this slot again. */
+			tx_q->tx_skbuff_dma[entry].buf_type = STMMAC_TXBUF_T_SKB;
+		}
 
 		if (tx_q->tx_skbuff_dma[entry].buf_type == STMMAC_TXBUF_T_SKB) {
 			if (likely(skb)) {

---
base-commit: 513444cc62e231a11c9b15ea88de0890da9b2b4f
change-id: 20261001-submit-stmmac-xsk-tx-completion-v1-88760fa9b103

Best regards,
--  
James Hilliard <james.hilliard1@gmail.com>


