Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9117C54FDF
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 30 Jul 2026 10:13:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=D2dZ+8WBmAZ8INSWYao28PUGk/5wdatznsr8FR9QCUA=; b=el1zaUVe0URlXMhlaGgTNjmHqG
	OG6A1KSE6gQQyFIXddDhNuV+Fz3gdIW+RqpGQJKwBgri0TRo8tm2/dyYGDKJ8OpcGEvJk5sNmMMGK
	3R/EnAGhxgv+gL32N6QJJCqFbE8i2Q/APmOJfBi1bAnCRy9M0xpasvQ1AciuJISw5hITbUg1EHHcZ
	pgNIG+IpbjdzeKoq+xq1iExN+93meeOThps+QCIxxxVempne+BeNrL775XFpHx33K5t/SbUszF/KA
	hD4IXekyJhSYIPEtcQ/0j8m3IfOl5utFyHKnXwos6OGPy98KdDtgY1Otp4DdEM4zIzdx9hXiejQvN
	VjOKi+eg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpNlV-0000000A9kq-18rM;
	Thu, 30 Jul 2026 10:13:25 +0000
Received: from out203-205-221-221.mail.qq.com ([203.205.221.221])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpNlR-0000000A9jM-3MHV;
	Thu, 30 Jul 2026 10:13:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1785406398; bh=D2dZ+8WBmAZ8INSWYao28PUGk/5wdatznsr8FR9QCUA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=im7c2w8ZY+HFeLfeia8F6OCcCfDzRHLsG7XPEhFCRJEXllwUJYTwI1YNNKnXkgqrz
	 kiSW1PEO+0Y3ml64BYgfT1OouZeFAZAVLh4RjG5C6Jnju00yVXSkQapkAs/I10Sv+K
	 LgZATB0olGVd9hZM4wOb+2eYBAc3SM3gwHiQnrAE=
Received: from ubuntu2204.localdomain ([2409:8d20:22b:54c:9e54:40ff:fe02:3f0f])
	by newxmesmtplogicsvrszc56-0.qq.com (NewEsmtp) with SMTP
	id 2F88CE83; Thu, 30 Jul 2026 18:11:56 +0800
X-QQ-mid: xmsmtpt1785406320t0nla270x
Message-ID: <tencent_9A8D6405DC23EAFB7D35E9D09CC93424F00A@qq.com>
X-QQ-XMAILINFO: MlFiathi08wuL68g05Bew/1Dsk+TXee8hoXreVEpw925Y6t6CkfIWqATAdoekT
	 pDeBn16t36o3t5J9AKGVLtGUqgmuLcOnF+NPfjMFxDZ/5CuhyCgmqy6khAG8ufn26+U+o5z6dzyk
	 up3JJu2lhu7//eeeULr0/dJiLkaeXVikhDfA1UMSWZ+ahTLRIxWUaaADtY+NIgv6YiclomW3bZsV
	 hmuAll0OR3tjeh7OeDZh/sHDlgLXOK1eYedoO3l6j7t+KmqJyPOcNQ/9scB5M6qC0Z5ZPhVn02da
	 EBL18c5hNt5B8CCW02wwqUBqVTNFyJ5qFIjGqKfY5I0NvuPpAwISe0ZlQvnKQr3wOK/B/+2NRkqo
	 zYugjjoX3UmciA1QqgNxmMiDL/WO9/k9P+KY3Lbu42RalMlEeRYSMD+awZK2+Yf/vJ91NXaBYO8G
	 EnwyUmUEMjZCCy00oiKXfL4Nxpb7vSgm0LTVlEBYnibSzVhsjNbGKtL/S8+Jx4ZnI3J7oHDa0bRX
	 0Mo++nAtQnwD+w22XHTc8rSJ4PqpoCcZ9HeGFKp7BQ+62WxqDKq3bU3/qCyT2vxLaAvxzUE++6GZ
	 WwgXaLKOCiCN6qr5D5WZWdnbJkGLEq9nGsVF0GF5SlktIBCRVq4RBP9Z1hFk+m3BTc3ItXplfyqh
	 NQefx7ZCH3L/3/84pGrPpvNykPBKNlRYcIRQEcGpB6yGt8d4fKOXQSt6jaeF6RDHYEvu28GxR4Ty
	 R2CexNvvma9RJq29Gf++YDd3UfwHuefsth3+2Mytw+zK+HMKUpPpCZinjMN0Jju3DEO9bPLoF5Nk
	 imBTv+iNt+l8zvgZ1SFzD5PhtD5xD16FigNrLfPK4SoFsDh13t0N9PrivF4A+KZstLNzmkwYIRMo
	 TJUXRxtd+kFYyStUSURXvACaRhGx5DJ0tS006Vs4cWxQVz9Y2qUKW0vk6SbEzgITyUVpWtEqyVkF
	 wcbSfudAtQlHhprMq9YcIVfHJj3tc18aVVOznMY363E7It/tm/2dIKjEap0c5S/pqjbLA+X8wPjk
	 hRofN9vjUjcnO7CuQYYOXaevw9B/Jtc46uocCMfrYKOsCesrnO/O7AiTX/BU+XfULnWnyWGsDofh
	 xcyIJCS0lft1Tpq0n9deyGG82KmZpnaOPC98MFP7rsJfO1mhxuYKwg025srJOBieuJH8z+cFNPiV
	 kEQvbGm0JT5At9sb770idtWcyHJ8mWTRuw2kmeaTHaNK0Q4w==
X-QQ-XMRINFO: Mp0Kj//9VHAxzExpfF+O8yhSrljjwrznVg==
From: Cunhao Lu <1579567540@qq.com>
Date: Thu, 30 Jul 2026 18:11:47 +0800
Subject: [PATCH v2 2/3] can: rockchip_canfd: retry the outstanding TX
 buffer
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-OQ-MSGID: <20260730-master-v2-2-572974052400@qq.com>
References: <20260730-master-v2-0-572974052400@qq.com>
In-Reply-To: <20260730-master-v2-0-572974052400@qq.com>
To: Marc Kleine-Budde <mkl@pengutronix.de>, kernel@pengutronix.de, 
 Vincent Mailhol <mailhol@kernel.org>, Heiko Stuebner <heiko@sntech.de>
Cc: linux-can@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 stable@vger.kernel.org, Cunhao Lu <1579567540@qq.com>
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260730_031322_140651_450F8776 
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


