Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D71F0CD37B7
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 11 May 2026 07:46:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wErO40OAlXA0m7VCC6f5qpf//Pf9vFknfGugsyxSfv4=; b=bjN22ty9QwHAn9k/odcAP3K9Jh
	+et/GARlFIqvJL1nUHX8dyPwli0jWL3RWpOAomqC+llbnH/iSZtHVIkLtpdiu/xjdn4UNZV0rp5ux
	QZub97J0Uv3J9G9alnvqAdV+/M8TfRElkCJ+B6jLVS0QcZAJ3katiVjAgHry8yp3vkn0GzeUyYmuD
	i4z4/OQNjyJmc5Qb3Wu1mAhiFOsrUTVcXgCzCt9Z/kCmmhsrQl9RL7lbMAbdXJtywcR1m5ocp2Kti
	dvDUE4YPz/6+rMFuRX5gQdFOO0jurYYCEZ25o5tQ1qEChM4aG+UlH6m1QJkxyyDA9aj/CiC/nDyPm
	S6lSvHtQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMLLR-0000000Ce8I-3pFZ;
	Mon, 11 May 2026 07:46:29 +0000
Received: from mail-dy1-x1330.google.com ([2607:f8b0:4864:20::1330])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMLLN-0000000Ce5g-3XLC
	for linux-arm-kernel@lists.infradead.org;
	Mon, 11 May 2026 07:46:28 +0000
Received: by mail-dy1-x1330.google.com with SMTP id 5a478bee46e88-2ee990e8597so7079183eec.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 11 May 2026 00:46:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nexthop.ai; s=google; t=1778485585; x=1779090385; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wErO40OAlXA0m7VCC6f5qpf//Pf9vFknfGugsyxSfv4=;
        b=d5MqfgstGtNPGI3EjKZ8r/uQS5xh+u73gXpdSDq/wXO3rml7jX3uhavkHAA5zOd2c5
         QV2CPPEjPlQbMCbb+1lLmeu/lCialweyJmJddwZvgs3R1LtXtgLrvexFhki0DsMMw62w
         epqvPsRxV0tskftw2BiuvHPF+mNnWC+fCEd8Jn4nU9JEtnT/VAE0hEdXzEf/5iIXdyET
         SCqznyWB3mo0DhLbPZar+VKM6u+Qfa0tS1xxK/AT3b3DoGxbB+NrmjgJ5ARdsbJj6DHE
         QkyrkxqfstpZvSxWjlO+LJzJ5zTb7tCepMxoJ3Lx7YQRiktJnC2GXRbrgGsLBCmVuWSm
         AsfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778485585; x=1779090385;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=wErO40OAlXA0m7VCC6f5qpf//Pf9vFknfGugsyxSfv4=;
        b=S0yT/++32RJ3UXeXEMMEtk63/43daQPFynvbV7I520UAoWUiMNALlXq9wafZdiC5bw
         W3K+4HdaVUswYRLn4zrf701eVOdGw4HdxSM5tGRGKK7C2AkCLVnr3HdHYTTOmcYfVHEt
         xdXLBD/Fh3A4e7Mh4W4JrspX7o3Cj+gBhk1JLGxksS/xM1R2FWw4Z5PgES/7uf3URljK
         4x2/FNdRLPmVOc8oGM/4IOn50ZrQG+MRMcFdEj++yqsXi3ulH+QbjK5HszpUHFKx1twC
         3x5knunanMVw9SXBJq/cEdqqozCgIwXqvb08BipyXsUeWpDvHHGeEkoTkgHEzRpN/5WT
         T3zQ==
X-Gm-Message-State: AOJu0YyuqNgGMeyVp6JwqINrpZrWRodo+58zKAlC8DBPhwpFezKASd4M
	gSvPKMkxie59qUF2+4DegyNS19Q7NE3jzPnsT0/K0oFK2tSR14aM8eYbCexVPGXDsLw=
X-Gm-Gg: Acq92OFlVXZhLGfLnBr7l6jbnrCFTs9vhNFfMUMDL01jYZY/74hjJ8H1/+OJfJ/s9UL
	mcNA6tHXil72ZwpsGs7o9NSaTUTROr/UhIuWT5t3tfKagY1xbNyCIuMLBhVaBIXwt+kMuPu1UvV
	vA+OoRHkrrgZ53POpnVpIupS1u1smD90BJou7aYugIlM72UX/rE81CGRzJDC43EZ2NBln7qA/Jf
	o0xUtg/Gas1TUkOTxEoGajvimieL1KrR7yaZxq28ItQVtoAtNGWP5hBRGPhqCm+L/K9f1HamZyF
	cLjxK9onfGReBOknRqWMMQg0k98APEufStoeelP/Mp19txuJjsUvsZnN71Er38ABQ/bHk35OEVO
	YIYvI73gGn+wb636WnzTgSLYAnJ6qy2xH2DnHDXtmT5FPMqZXAOe14Y8kZ5sZtmNy4odAHJB13R
	FI+OYVZRk4dizfc+j9alAFRqqV0w==
X-Received: by 2002:a05:7301:578b:b0:2df:7fe3:96a with SMTP id 5a478bee46e88-2f545c976a8mr11709144eec.0.1778485584615;
        Mon, 11 May 2026 00:46:24 -0700 (PDT)
Received: from [127.0.0.2] ([50.145.100.174])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2f888e381c9sm12205702eec.26.2026.05.11.00.46.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 May 2026 00:46:24 -0700 (PDT)
From: Abdurrahman Hussain <abdurrahman@nexthop.ai>
Date: Mon, 11 May 2026 00:46:12 -0700
Subject: [PATCH v2 1/3] i2c: xiic: preserve PEC byte length in SMBus block
 read setup
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260511-i2c-xiic-v2-1-c16380cb1594@nexthop.ai>
References: <20260511-i2c-xiic-v2-0-c16380cb1594@nexthop.ai>
In-Reply-To: <20260511-i2c-xiic-v2-0-c16380cb1594@nexthop.ai>
To: Michal Simek <michal.simek@amd.com>, Andi Shyti <andi.shyti@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org, 
 linux-kernel@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778485583; l=2279;
 i=abdurrahman@nexthop.ai; s=20260510; h=from:subject:message-id;
 bh=WbRNSgR6fF75ujIFRpZT+WIk0CWNPjAlMacuue3U6KE=;
 b=bHXgIxBPq/DfWG3LxVv/I1TZyOj4J79btpDvtIwXuTBO0Ws8u8ehEVZEILe7jCdUbb1OnVDKz
 n2XCDgSp0gzAUAwLKPexATrF9DHZFFJLSA2gM4gzPlMhOQiiItOoVOy
X-Developer-Key: i=abdurrahman@nexthop.ai; a=ed25519;
 pk=omTm9cCAbO0ZhS32aKfJDKue0W3sQGpG9ub5eYHif8I=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260511_004625_888468_89ED3EE2 
X-CRM114-Status: GOOD (  14.92  )
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

xiic_smbus_block_read_setup() overwrites rx_msg->len based on the
announced block length byte, but the i2c core appends an extra byte to
msg->len when PEC is enabled on the client (see
__i2c_smbus_xfer_emulated in i2c-core-smbus.c). Before this handler
runs, rx_msg->len is therefore 1 + pec_len, where pec_len is 0 or 1.

Overwriting rx_msg->len to rxmsg_len + 1 drops that PEC byte from the
caller's buffer: the PEC byte is never drained from the FIFO and the
core's i2c_smbus_check_pec() reads the last payload byte instead of
the actual PEC, returning -EBADMSG even on clean transfers. Capture
pec_len before the overwrite and add it back when recomputing
rx_msg->len.

This is a pure bug fix; non-PEC behaviour is unchanged (pec_len == 0).
Tested on a Xilinx AXI IIC FPGA block driving an adm1266 PMBus
blackbox read -- with PEC enabled the full 64-byte record transfers
cleanly after this change.

Signed-off-by: Abdurrahman Hussain <abdurrahman@nexthop.ai>
---
 drivers/i2c/busses/i2c-xiic.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/i2c/busses/i2c-xiic.c b/drivers/i2c/busses/i2c-xiic.c
index 3e7735e1dae0..959a47b645a5 100644
--- a/drivers/i2c/busses/i2c-xiic.c
+++ b/drivers/i2c/busses/i2c-xiic.c
@@ -539,6 +539,8 @@ static void xiic_smbus_block_read_setup(struct xiic_i2c *i2c)
 
 	/* Check if received length is valid */
 	if (rxmsg_len <= I2C_SMBUS_BLOCK_MAX) {
+		unsigned int pec_len = i2c->rx_msg->len - 1;
+
 		/* Set Receive fifo depth */
 		if (rxmsg_len > IIC_RX_FIFO_DEPTH) {
 			/*
@@ -546,7 +548,7 @@ static void xiic_smbus_block_read_setup(struct xiic_i2c *i2c)
 			 * Receive fifo depth should set to Rx fifo capacity minus 1
 			 */
 			rfd_set = IIC_RX_FIFO_DEPTH - 1;
-			i2c->rx_msg->len = rxmsg_len + 1;
+			i2c->rx_msg->len = rxmsg_len + 1 + pec_len;
 		} else if ((rxmsg_len == 1) ||
 			(rxmsg_len == 0)) {
 			/*
@@ -562,7 +564,7 @@ static void xiic_smbus_block_read_setup(struct xiic_i2c *i2c)
 			 * Receive fifo depth should set to Rx msg len minus 2
 			 */
 			rfd_set = rxmsg_len - 2;
-			i2c->rx_msg->len = rxmsg_len + 1;
+			i2c->rx_msg->len = rxmsg_len + 1 + pec_len;
 		}
 		xiic_setreg8(i2c, XIIC_RFD_REG_OFFSET, rfd_set);
 

-- 
2.53.0


