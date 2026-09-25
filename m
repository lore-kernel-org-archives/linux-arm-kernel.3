Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A91F7C98326
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Sep 2026 00:10:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uoMaAm02Pyqn85C4te1/bOInshnG9mfbEU4HCghL9sk=; b=x4xaxkyLodoN8omj6zygUm3mYx
	toUigMv3seUW0wTmdNIbz7alHuKgiMD+xhwvMPfZUuYqOMEGFZfblqzlY62BX56nMIl5qxptXKgUQ
	o+RpCsqDKtBCcwwUDgi+/yToqVv61GQtydbqNhRG16eKlwEO+jHjAd0alNg9sWuZN36j586qPgeXS
	/gVYQu4T0Pag7EMm0IpcDl8MnbF27YmgmUWZ/68ZI71BHFrA8sjZt/C7TbDeEZdB7odTtwkh6OC3T
	4xiSF3NBXM+3RiDulAiklDMR5qmdS3kb4WvEi+QER8ilvI9oqeL+LC+gG0n2YwZYtoiDzRnQwzj5N
	/cpzeJNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9tWc-0000000CRLu-296G;
	Fri, 25 Sep 2026 00:10:50 +0000
Received: from mail-dy1-x132e.google.com ([2607:f8b0:4864:20::132e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9tWV-0000000CRJM-23W3
	for linux-arm-kernel@lists.infradead.org;
	Fri, 25 Sep 2026 00:10:45 +0000
Received: by mail-dy1-x132e.google.com with SMTP id 5a478bee46e88-33e456e7869so912006eec.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 24 Sep 2026 17:10:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nexthop.ai; s=google; t=1790295042; x=1790899842; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uoMaAm02Pyqn85C4te1/bOInshnG9mfbEU4HCghL9sk=;
        b=DD1AYAcX6uvS4idTMK7JVv8K5Ol6Un9NKas1xm3cWgR0rtuz8lDgQsunZ5XgwIxTbc
         lTqkFKJaeP7RFhFMYyraLemi+K0Sg8O20fIt6LGzry41rv0M7HZ57yyCNq/czL6Ym+LS
         liUSol+7Roer0wbaKgrTiUSNkWmABYmk6eaEmnZjroX50q9OBT6Vac7wZHho48CubE1N
         9GYPRdT0FAVgzncs6jzWc5zibhv5eJ//3PuI+aqbb8L3x5zZJhTRn9BQ6lrukc5zVolX
         tivXqGKpuY9joyMZ2JDeVJCzdW8oaK1qRc4LQyIHnFlabKDKn5f5ycYBjZKQNysT+KJ/
         OH1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790295042; x=1790899842;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uoMaAm02Pyqn85C4te1/bOInshnG9mfbEU4HCghL9sk=;
        b=j/Eo9O54kkrPvGFeh/dCoaEcNacjyJAq09MAm4yFknFffsS/ZUlig3fk/13jfXkZDM
         rw30fTpxrt8ebu4rL2mq0Cq5jk6bETRXkbDJHDIg6RlPM9zZfgmFptryrap7NmX/ygKm
         3RSQOArKo/fHp4Oow6TkPONdPMH2Bbg980tCls37rHXEHX3xTLLQo/TzywXLKOG+mIch
         EOHrtpY+JGYcHR2zhhxt9ZCCaTkno2adf7upTbzsvFpY6sP6VB/LtASD2y33YcVFViIb
         ypjh3fh3ekIO6vYbBHBv08bE8E31hUdiTJcBUfk90cup/0/QDOmru5KVsxoJSuss40Xk
         k7Mg==
X-Forwarded-Encrypted: i=1; AKwUvBziuIiyrCoy8uB2nZl3B6HY21vhtIsKfa6NVQosRZ0F6LkmHMcDwPXHdY2F3H9MD091SumJJqKv9NNQ7Pe48oe5@lists.infradead.org
X-Gm-Message-State: AFuF++n1x9Oe75bcmLCFYoZBOUlf3rMpoomAlJefcQ/x6FWgQkeGLRfm
	e7jpXawQTTz9LApuYUWK7H8PlFbM8lVxIWW55/zIkTeHpwhyesZL5qxBY97osof6/Aw=
X-Gm-Gg: AYBFou1KdfbWAycAh9lzLR0IQIgl5JXG29r2HtRMBPuIRvWbPACnDbv9JIxPFhCg9KM
	4iQXX0fnNcvzSFKT10012A9wDWIUntHVx3hITIue8Kr/hQ2oPQGyqIkaFvOIOb+Re3tTs9vrWTh
	ZChkcFAcpAnCSrb8CKVHZxeHuLTyfrYyYCtJEAfYkl76ewqbru/ggeudN+W1vEn2/CDXtrpg0Xx
	mzIbnfztetBvV8nYVmkDarCv5B9GNYhG10SK2OMBtP93MAH8Z7/ZqOdut1l2eYph4GXzZZKZ4mc
	zIPScbJypnLGuLSQRSROsRQCVdtKMpopa1ap3A8APdmVrEGw/9bKCiGn0tFtCMlzwzrJAsui9zW
	fXNANs5Af0pOl6O053Q6Z40x4Py8RINe2yxScOH/2+/ior5oq2ze166miyYcvmvnltpT+alddah
	gsYskmT7ZUUKqNTUoruQom/Sg/g+cBk0ao5YdzOnNigZXwZ2ckp5YYOsPpERaMbGiCid6uQZrlf
	g==
X-Received: by 2002:a05:701b:4254:20b0:136:4bbe:9524 with SMTP id a92af1059eb24-1450403dc38mr3141393c88.10.1790295042387;
        Thu, 24 Sep 2026 17:10:42 -0700 (PDT)
Received: from [127.0.0.2] ([50.145.100.174])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-34145632298sm1787647eec.22.2026.09.24.17.10.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 17:10:41 -0700 (PDT)
From: Abdurrahman Hussain <abdurrahman@nexthop.ai>
Date: Thu, 24 Sep 2026 17:10:37 -0700
Subject: [PATCH v7 3/3] i2c: xiic: don't clobber msg->len to signal
 block-read completion
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260924-i2c-xiic-v7-3-df7e752332ef@nexthop.ai>
References: <20260924-i2c-xiic-v7-0-df7e752332ef@nexthop.ai>
In-Reply-To: <20260924-i2c-xiic-v7-0-df7e752332ef@nexthop.ai>
To: Michal Simek <michal.simek@amd.com>, Andi Shyti <andi.shyti@kernel.org>, 
 Wolfram Sang <wsa+renesas@sang-engineering.com>, 
 Raviteja Narayanam <raviteja.narayanam@xilinx.com>, 
 Wolfram Sang <wsa@kernel.org>, 
 Manikanta Guntupalli <manikanta.guntupalli@amd.com>
Cc: Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>, 
 linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Abdurrahman Hussain <abdurrahman@nexthop.ai>, 
 stable@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790295038; l=2009;
 i=abdurrahman@nexthop.ai; s=20260510; h=from:subject:message-id;
 bh=1rvaVBS5z3PcQvipdDAj9WVWm6JugqJIhc+zC3OYV1M=;
 b=CeyCZ+j6PyXwi2IxNzqHNhjgrX9Og3sz3PrfkkWqKWWMlqelDQm1WAl8kwmODXCZf5TYFasH7
 auvAVv5l3aKDqLqlLiHm/m/SAC2AwA1Kj6Zst3jMHnPM3mIuPqGGkse
X-Developer-Key: i=abdurrahman@nexthop.ai; a=ed25519;
 pk=omTm9cCAbO0ZhS32aKfJDKue0W3sQGpG9ub5eYHif8I=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260924_171043_543134_8E8266DD 
X-CRM114-Status: GOOD (  16.17  )
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

At the end of a SMBus block read the BNB handler force-set
tx_msg->len = 1 to push xiic_tx_space() to zero so the STATE_DONE
branch would fire. Two problems:

1. tx_msg and rx_msg alias the same i2c_msg struct during a receive
   (see xiic_start_recv), so overwriting tx_msg->len also changes
   rx_msg->len. The i2c core's i2c_smbus_check_pec() then reads the
   PEC from the wrong offset -- buf[0] instead of buf[rxmsg_len + 1]
   -- and either mis-validates or returns -EBADMSG.

2. xiic_start_recv sets tx_pos = msg->len (typically 2 when PEC is
   enabled). xiic_tx_space() is unsigned msg->len - tx_pos, so
   setting msg->len = 1 with tx_pos = 2 underflows to 0xFFFFFFFF and
   xiic_tx_space() never compares equal to 0 -- the STATE_DONE check
   falls through to STATE_ERROR, giving -EIO.

Instead, advance tx_pos up to msg->len. That drives tx_space to 0
without touching msg->len, preserving the buffer length that
xiic_smbus_block_read_setup() already grew to cover the length byte,
the payload and the optional PEC byte.

Fixes: e4c1ff772e1a ("i2c: xiic: Add smbus_block_read functionality")
Cc: stable@vger.kernel.org
Acked-by: Michal Simek <michal.simek@amd.com>
Signed-off-by: Abdurrahman Hussain <abdurrahman@nexthop.ai>
---
 drivers/i2c/busses/i2c-xiic.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/i2c/busses/i2c-xiic.c b/drivers/i2c/busses/i2c-xiic.c
index 5cd737c7608f..5e397a7e63f6 100644
--- a/drivers/i2c/busses/i2c-xiic.c
+++ b/drivers/i2c/busses/i2c-xiic.c
@@ -889,8 +889,11 @@ static irqreturn_t xiic_process(int irq, void *dev_id)
 
 		if (i2c->tx_msg && i2c->smbus_block_read) {
 			i2c->smbus_block_read = false;
-			/* Set requested message len=1 to indicate STATE_DONE */
-			i2c->tx_msg->len = 1;
+			/*
+			 * Drive xiic_tx_space() to 0 to signal STATE_DONE
+			 * without truncating the rx_msg length.
+			 */
+			i2c->tx_pos = i2c->tx_msg->len;
 		}
 
 		if (!i2c->tx_msg)

-- 
2.54.0


