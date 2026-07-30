Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1023AC55164
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 30 Jul 2026 06:11:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=D2dZ+8WBmAZ8INSWYao28PUGk/5wdatznsr8FR9QCUA=; b=WDoon2/90RpVCqBZp0DUbCF0/J
	wOfGgmJ4ZKTCA2SpWXnv2lTR6yaK61th7ER66qlIiK4pm2+wxax+jkz3fre//LlTCyGhLca0jTxHc
	fNv4drgygI/tdDZCLy82IlPBgXqUwfrPNSWWxuTLb9C+OLro/vjJu9MmQuNEoiKj+AiOzzv3HdjXo
	xDRc/CpZhP1easxVSg6Vn4fja1qI0ib7l2STxtDTR7C2WRH7uuxHXqgbWFQpk9RF6v/pV53Cm/nsT
	Cv/JRyLhqi4ZuerCVeN91xEWf809z9+32Po2Qgczlu1i73vJo6Ag+JAvRTrBgNXZafEWOc/J1pmWJ
	Ar+Xq53w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpJzc-00000009a7t-3cAC;
	Thu, 30 Jul 2026 06:11:44 +0000
Received: from xmbghk7.mail.qq.com ([43.163.128.44])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpJza-00000009a6K-0y5g;
	Thu, 30 Jul 2026 06:11:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1785391897; bh=D2dZ+8WBmAZ8INSWYao28PUGk/5wdatznsr8FR9QCUA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=uNyvcxUSMLXm6bf3qXnrVpiDSGGh6je2zHc3UNPfkNfhn6mViohUzU5TgQEx0RSNS
	 0sjsBd8oC57npyDiQUb/FWYVnUZ9z/dSgVvGi/gv2JQ4XWvkezjO7KT5l1iClmqfT2
	 vmtpr8uAXfe+wN7/LHXdl5edoZNlQ+Ffv85FEcT0=
Received: from ubuntu2204.localdomain ([2409:8d20:22b:54c:9e54:40ff:fe02:3f0f])
	by newxmesmtplogicsvrszb51-0.qq.com (NewEsmtp) with SMTP
	id 2DF15055; Thu, 30 Jul 2026 14:11:31 +0800
X-QQ-mid: xmsmtpt1785391894txg4lng26
Message-ID: <tencent_803FA8A6621A5D198504BC91BE003D442007@qq.com>
X-QQ-XMAILINFO: MfvJ0+4D3P+7xxzKzQ3k6L2jiKfqNsu/rtn1/30H+OnK0sm6vWNyfEuix9tTXR
	 vdvX5JQOTiSZsPBn0IL25auocfZKs+yeVyeRWfBGthdHk+aQEogSsCHGnfyX9Zze+14qEfsUYm5U
	 of5zbvG9Jg3JdYKCDecqLUqq9h/IFi3UbTHwWSBwK9pAIYOhlrxQ+IFOMQqsAwi8Zj+yBzEKbyJg
	 P1LgpNgdeKraeK60uM+GDM+Bj2utZxTxQCulN8teSZdU+srXK3pIcd5hAkEUe2+HcGrM+mXl6vVX
	 ReicJnrs7Qw9VC8nafSr3DJAW2V5bxiAZubsvThIjvia/WEOqDquNHz+JkiMuzo9ZBXtjCFlN9Ph
	 cneUd1eFR7wdjHiu9nB+kLYTkzzNMIUv1vNbqUIeUiTY5vFKn0GvzAAXeucE9VkwC2lqdzZ7rp7F
	 YdQ9CGb+6bqOKkZGf8QOA04pljHragFK9F0ANFCUc0YB5MLcBjguYrR6Y9qPY/X1SpgLUqq9P9Xy
	 46L2fF/4/V+aO5wkJfM3z7fMPT3Xv4G1jpAuOnrEb9FQ5KtGqEL25QoGzKHMbAMrxMzyvwXEoFea
	 h8FwxUX8P0C3mBsv6LMs1C3JBTALowTNQ1eEMGQo1weT1oqQfa2z9jQ2uEMQfWQ23BGyKvhkeGZF
	 UlPKwj6XcBA5pdgWnBg+08eMV0N2sakdFI/t4EKeIslxtD5417h2TqpbMGjJvLxImURrKxJFT74X
	 uAeB6NSqnkc4E2IFnMwL7hd7vnraS333NfRv03PUrbmI/UqPwcvBNbrfQQX4sprWweBGTBOY3SSV
	 crvgw61RrNRt8IIv+kuL/FjSBLc88KqDE/2AVVjzUFWHUKj6TUyxAUqL1btEKa1OqVcWPRVtmSwZ
	 EkwBRrwI0fqpcSXkKiobIkP/PI2ojpFgq4pDHygcVmvmgEdSEBcsGmEX9Zj6BWv1L6x/OPFub75E
	 f8ujPMF9CzOEObkaRoqS0sni/fkGtoR1K9q3JwksDgZ33GaEr2/u9PYGZbjZbUq8HRwmy+Ap8KA3
	 ox/n8047qhiaw1eDZDV2XWK1kgSR+6+xZNQhY4WZ7kwLgy9M3DU2vpGJEElgoQqIZfHA5kWkpXEo
	 nnpyr9UjA3e3VxCwQEQu4x6+9PQxGsLIlM0xURZBXohJipm7QyTI/Z/lrEWTsEhAlIAtEqjymXPs
	 USv4E=
X-QQ-XMRINFO: NyFYKkN4Ny6FuXrnB5Ye7Aabb3ujjtK+gg==
From: Cunhao Lu <1579567540@qq.com>
Date: Thu, 30 Jul 2026 14:11:23 +0800
Subject: [PATCH 2/3] can: rockchip_canfd: retry the outstanding TX buffer
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-OQ-MSGID: <20260730-master-v1-2-6945fdd4f0ff@qq.com>
References: <20260730-master-v1-0-6945fdd4f0ff@qq.com>
In-Reply-To: <20260730-master-v1-0-6945fdd4f0ff@qq.com>
To: Marc Kleine-Budde <mkl@pengutronix.de>, kernel@pengutronix.de, 
 Vincent Mailhol <mailhol@kernel.org>, Heiko Stuebner <heiko@sntech.de>
Cc: linux-can@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 stable@vger.kernel.org, Cunhao Lu <1579567540@qq.com>
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260729_231142_595981_9F89B815 
X-CRM114-Status: GOOD (  11.54  )
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

rkcanfd_xmit_retry() originally operated with a TX FIFO depth of one. At
that depth, the masked head and tail indices both select buffer 0, so using
tx_head happened to select the correct buffer.

After the FIFO depth was increased to two, tx_head instead identifies the
next free buffer when one frame is outstanding. The erratum 6 workaround
therefore requests transmission from the wrong buffer, leaving the
outstanding echo entry incomplete and the netdev TX queue stopped.

Use tx_tail to select the outstanding buffer for retransmission.

Fixes: a5605d61c7dd ("can: rockchip_canfd: enable full TX-FIFO depth of 2")
Cc: stable@vger.kernel.org
Signed-off-by: Cunhao Lu <1579567540@qq.com>
---
 drivers/net/can/rockchip/rockchip_canfd-tx.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/net/can/rockchip/rockchip_canfd-tx.c b/drivers/net/can/rockchip/rockchip_canfd-tx.c
index d2cbe25c46d6..c4ecdc9411cc 100644
--- a/drivers/net/can/rockchip/rockchip_canfd-tx.c
+++ b/drivers/net/can/rockchip/rockchip_canfd-tx.c
@@ -57,8 +57,8 @@ static void rkcanfd_start_xmit_write_cmd(const struct rkcanfd_priv *priv,
 
 void rkcanfd_xmit_retry(struct rkcanfd_priv *priv)
 {
-	const unsigned int tx_head = rkcanfd_get_tx_head(priv);
-	const u32 reg_cmd = RKCANFD_REG_CMD_TX_REQ(tx_head);
+	const unsigned int tx_tail = rkcanfd_get_tx_tail(priv);
+	const u32 reg_cmd = RKCANFD_REG_CMD_TX_REQ(tx_tail);
 
 	rkcanfd_start_xmit_write_cmd(priv, reg_cmd);
 }

-- 
2.34.1


