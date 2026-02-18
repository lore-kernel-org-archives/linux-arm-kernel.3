Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6254FE9A02C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Feb 2026 15:10:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YiCCUrdk9XYqcbI+I7lzNNzu+GG7xW/ZdG+JQfCsf/M=; b=2dSO7ubMuLx2YivM4rBSE1BZts
	oddrNWaeo8pJB+dOjNBynscZKX79PkUmLdJU90pj2ZcJ9UKNFx1wkRybY3KBB+WYZMFd5F3jL/Y0V
	Qzxo6fcpcwAbyI+9Oxf546Pr3FQHw0+gbu6lGHOO3sTp+Th4DbUdsgUZ8u8w4UhDpkNDUZFlOU9oj
	ap9kZ3Ikc33zEnzzpM0LI+ZGq1KuQU/hY0cfnJPfKbmtxvWpaRq6iU0mYEbQumN0rN6kew0PUH8mW
	ZrHIQaptP4GTQgogiLBkwejl2IWLGvF8BtT7DOIqfKREh0geuTfJW9/9xMBrdzJ0cLdb52p260jgb
	SEUg8uXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vsjBg-00000009ztS-0JFW;
	Wed, 18 Feb 2026 15:10:00 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vsjBb-00000009zrR-2FHS
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Feb 2026 15:09:56 +0000
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-48375f1defeso41899415e9.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 18 Feb 2026 07:09:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771427394; x=1772032194; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YiCCUrdk9XYqcbI+I7lzNNzu+GG7xW/ZdG+JQfCsf/M=;
        b=Clernq59/FvzWEVPgqOvDJECBWoFNlx80iEFDqJgxPAAa8xFMFtpy9x3Wyok005dqr
         yqvJ0FsTP6/JBE5kX0TLISdECxFamu1yuSsv4vVIR1b28MFvty2G8lHUxL65JdguknGx
         RSdZlbbkUq5WaEfSkV6YxziyholN3l5jUnzHpBAF4FZmJtkZZvtM5fsN68wXyM3dwFvi
         sDP6KCHxGIXl69v8BhP+mI5Uuo07Z2nyVb1931uc6Q+jaxXaP+95fGsPRwoSI1FK6V6A
         N5iJWNvpdWnccUiGlkzbO4Esnc52K6RGmImCkcN0vWXahuHTF8bQSdWuyJ0HbNO1ndiU
         MXfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771427394; x=1772032194;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=YiCCUrdk9XYqcbI+I7lzNNzu+GG7xW/ZdG+JQfCsf/M=;
        b=Kaqv8+UrVjoUPL2IhVnW+oOMknNrakhQmKOpLki73QmJK6nP0mXuVEBrQoTIyBOvFW
         uBfvbpA3LrB0cge/cyx+dRYxxPlA8nf3NwSszJyVrdjd7Zx78Zs224QB0YopL+3ftAy6
         OZqhHwcZr+Li/KIOvKgz9FuAgdhMztSwGLaiEwyxoSQr87D8CvkBNxv/PB6HFDFmvz56
         fqeGxHjzl5AUB4rdqRzmv61Yd1ZFR/pVdyf4r6EAFy0WjI28mmFznlbGgYBzBWpKCffx
         uQ/81cCPqm7IEVVn65jrirXWesvyHRUoIvkWUulVWQg/w8IodOepUY3eSslYbng1nZNd
         xfkA==
X-Forwarded-Encrypted: i=1; AJvYcCUZlBfuZuDugzuRHxyS2ZIy17RKWQ7jAErMrEO7BjWp9ZXsk3nU5jJYgchvT3oi/QaDdUf2dcbu4KBs2yomxgbf@lists.infradead.org
X-Gm-Message-State: AOJu0YwxhbDx6u8g1PDVql3+d5pQxFUs/jtMD+wKXwKjmZuHPzcIPwrR
	NoumPrq2GlAAKk57F+YBAzuQ89CEbHFf6Pv22biyuqPzeSw1AVL5GR9b
X-Gm-Gg: AZuq6aKE4pHj/NHms8NkC/oY/ZsbL2d0YJPsuoFTfvcCLdWaY4n7uzj7eGT6aTWBIlT
	AoRVhs402Oj2uQDEkoYk4dAj3t+Y5hEPjqGdLF+QRQx+UnBae/jpQ/jVRBDIWOSTvN0wf2iq8eT
	fb/g5D3Alhb1LDUZGRvts4ecnGOa/OX+V4ZIEivVobdrcNBzXeU5Q6Vk08VWojfJeegEgHi4/DI
	AU6ej/DIrlgMnhAWXKJ20s63B/LQke7BpLf/2LY5c450BT9mwfa0FTRbrRH9yhghadw/GSlwnFG
	xxfxBS+ASOH2pKwrKUk3wSXsMRViflWmJKRMUIYXVRCsmkG2RwHSkOQAHZIDtdJxtx2SLAtd7Bu
	sPqSresa7w6T0sp4tnDG7KxaSaJh8BjdmnneeU6NPKbGGxrnh7Pki+lf5+0H5UggmfJgGISCywo
	+dRy4bPTaFXedj+0r0YxQX4LH+NATG1p6YGuCE8MBciXHsV6HdtGH5LQqrLBeUSdcKaUy5etxS1
	UL8j1C16J39eP19FGUSLmw9huYF+aMjWjaBgMr7FKUfojU=
X-Received: by 2002:a05:600d:13:b0:477:5b0a:e616 with SMTP id 5b1f17b1804b1-4839b4c7242mr20986195e9.5.1771427393465;
        Wed, 18 Feb 2026 07:09:53 -0800 (PST)
Received: from eichest-laptop.corp.toradex.com (248.201.173.83.static.wline.lns.sme.cust.swisscom.ch. [83.173.201.248])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43796ac7d91sm44333116f8f.26.2026.02.18.07.09.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Feb 2026 07:09:53 -0800 (PST)
From: Stefan Eichenberger <eichest@gmail.com>
To: o.rempel@pengutronix.de,
	kernel@pengutronix.de,
	andi.shyti@kernel.org,
	Frank.Li@nxp.com,
	s.hauer@pengutronix.de,
	festevam@gmail.com,
	stefan.eichenberger@toradex.com,
	francesco.dolcini@toradex.com
Cc: linux-i2c@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH v1 2/2] i2c: imx: ensure no clock is generated after last read
Date: Wed, 18 Feb 2026 16:08:50 +0100
Message-ID: <20260218150940.131354-3-eichest@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260218150940.131354-1-eichest@gmail.com>
References: <20260218150940.131354-1-eichest@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260218_070955_599643_9F9DD040 
X-CRM114-Status: GOOD (  20.35  )
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

From: Stefan Eichenberger <stefan.eichenberger@toradex.com>

When reading from the I2DR register, right after releasing the bus by
clearing MSTA and MTX, the I2C controller might still generate an
additional clock cycle which can cause devices to misbehave. Ensure to
only read from I2DR after the bus is not busy anymore. Because this
requires polling, the read of the last byte is moved outside of the
interrupt handler.

An example for such a failing transfer is this:
i2ctransfer -y -a 0 w1@0x00 0x02 r1
Error: Sending messages failed: Connection timed out
It does not happen with every device because not all devices react to
the additional clock cycle.

Fixes: 5f5c2d4579ca ("i2c: imx: prevent rescheduling in non dma mode")
Cc: <stable@vger.kernel.org> # v6.13+
Signed-off-by: Stefan Eichenberger <stefan.eichenberger@toradex.com>
---
 drivers/i2c/busses/i2c-imx.c | 51 ++++++++++++++++++++++--------------
 1 file changed, 32 insertions(+), 19 deletions(-)

diff --git a/drivers/i2c/busses/i2c-imx.c b/drivers/i2c/busses/i2c-imx.c
index 56e2a14495a9a..452d120a210b1 100644
--- a/drivers/i2c/busses/i2c-imx.c
+++ b/drivers/i2c/busses/i2c-imx.c
@@ -1018,8 +1018,9 @@ static inline int i2c_imx_isr_read(struct imx_i2c_struct *i2c_imx)
 	return 0;
 }
 
-static inline void i2c_imx_isr_read_continue(struct imx_i2c_struct *i2c_imx)
+static inline enum imx_i2c_state i2c_imx_isr_read_continue(struct imx_i2c_struct *i2c_imx)
 {
+	enum imx_i2c_state next_state = IMX_I2C_STATE_READ_CONTINUE;
 	unsigned int temp;
 
 	if ((i2c_imx->msg->len - 1) == i2c_imx->msg_buf_idx) {
@@ -1033,18 +1034,20 @@ static inline void i2c_imx_isr_read_continue(struct imx_i2c_struct *i2c_imx)
 				i2c_imx->stopped =  1;
 			temp &= ~(I2CR_MSTA | I2CR_MTX);
 			imx_i2c_write_reg(temp, i2c_imx, IMX_I2C_I2CR);
-		} else {
-			/*
-			 * For i2c master receiver repeat restart operation like:
-			 * read -> repeat MSTA -> read/write
-			 * The controller must set MTX before read the last byte in
-			 * the first read operation, otherwise the first read cost
-			 * one extra clock cycle.
-			 */
-			temp = imx_i2c_read_reg(i2c_imx, IMX_I2C_I2CR);
-			temp |= I2CR_MTX;
-			imx_i2c_write_reg(temp, i2c_imx, IMX_I2C_I2CR);
+
+			return IMX_I2C_STATE_DONE;
 		}
+		/*
+		 * For i2c master receiver repeat restart operation like:
+		 * read -> repeat MSTA -> read/write
+		 * The controller must set MTX before read the last byte in
+		 * the first read operation, otherwise the first read cost
+		 * one extra clock cycle.
+		 */
+		temp = imx_i2c_read_reg(i2c_imx, IMX_I2C_I2CR);
+		temp |= I2CR_MTX;
+		imx_i2c_write_reg(temp, i2c_imx, IMX_I2C_I2CR);
+		next_state = IMX_I2C_STATE_DONE;
 	} else if (i2c_imx->msg_buf_idx == (i2c_imx->msg->len - 2)) {
 		temp = imx_i2c_read_reg(i2c_imx, IMX_I2C_I2CR);
 		temp |= I2CR_TXAK;
@@ -1052,6 +1055,7 @@ static inline void i2c_imx_isr_read_continue(struct imx_i2c_struct *i2c_imx)
 	}
 
 	i2c_imx->msg->buf[i2c_imx->msg_buf_idx++] = imx_i2c_read_reg(i2c_imx, IMX_I2C_I2DR);
+	return next_state;
 }
 
 static inline void i2c_imx_isr_read_block_data_len(struct imx_i2c_struct *i2c_imx)
@@ -1088,11 +1092,9 @@ static irqreturn_t i2c_imx_master_isr(struct imx_i2c_struct *i2c_imx, unsigned i
 		break;
 
 	case IMX_I2C_STATE_READ_CONTINUE:
-		i2c_imx_isr_read_continue(i2c_imx);
-		if (i2c_imx->msg_buf_idx == i2c_imx->msg->len) {
-			i2c_imx->state = IMX_I2C_STATE_DONE;
+		i2c_imx->state = i2c_imx_isr_read_continue(i2c_imx);
+		if (i2c_imx->state == IMX_I2C_STATE_DONE)
 			wake_up(&i2c_imx->queue);
-		}
 		break;
 
 	case IMX_I2C_STATE_READ_BLOCK_DATA:
@@ -1490,6 +1492,7 @@ static int i2c_imx_read(struct imx_i2c_struct *i2c_imx, struct i2c_msg *msgs,
 			bool is_lastmsg)
 {
 	int block_data = msgs->flags & I2C_M_RECV_LEN;
+	int ret = 0;
 
 	dev_dbg(&i2c_imx->adapter.dev,
 		"<%s> write slave address: addr=0x%x\n",
@@ -1522,10 +1525,20 @@ static int i2c_imx_read(struct imx_i2c_struct *i2c_imx, struct i2c_msg *msgs,
 		dev_err(&i2c_imx->adapter.dev, "<%s> read timedout\n", __func__);
 		return -ETIMEDOUT;
 	}
-	if (i2c_imx->is_lastmsg && !i2c_imx->stopped)
-		return i2c_imx_bus_busy(i2c_imx, 0, false);
+	if (i2c_imx->is_lastmsg) {
+		if (!i2c_imx->stopped)
+			ret = i2c_imx_bus_busy(i2c_imx, 0, false);
+		/*
+		 * Only read the last byte of the last message after the bus is
+		 * not busy. Else the controller generates another clock which
+		 * might confuse devices.
+		 */
+		if (!ret)
+			i2c_imx->msg->buf[i2c_imx->msg_buf_idx++] = imx_i2c_read_reg(i2c_imx,
+										     IMX_I2C_I2DR);
+	}
 
-	return 0;
+	return ret;
 }
 
 static int i2c_imx_xfer_common(struct i2c_adapter *adapter,
-- 
2.51.0


