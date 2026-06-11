Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 545CBCD98CE
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 11 Jun 2026 13:29:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=kr6lr/Zk4qDdZQL9yjJdI0zh4QdrOtRvdN1aN8UPXKU=; b=zhiTxmkNnAcZT14E9zbgsh8Mp1
	9svmTKzMf13B13UEKbmqLhBY3B92IxMWnQiiN+W/+Etj8O4k06CdKAWJs4jbn/+cbZBCvtlLjcVrT
	Z7S8OiUey9l479X1RnSXENJhD3M2zZsHZMlfv/NOHWgKd8/uQPWDhjPo0MangpAO6iUSjxsYStx33
	iwuKwOczT8NW6OiK3VJLkcyTZQoHreQWVVoR5klWu6/4LEoDwpYvDu7uO5kyjy+dc24uBoYOghf8R
	v2F/5jtFkIeHp53nfpN+07duafmvMDOIB9+5PwNC7bh9i5qHlZ7yTDHdgJuhlekabIUCXsymuAsu0
	SbTcu/Yg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXfSm-00000009W5x-4Aqn;
	Thu, 11 Jun 2026 13:28:53 +0000
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXfSk-00000009W5a-0Ml3
	for linux-arm-kernel@lists.infradead.org;
	Thu, 11 Jun 2026 13:28:51 +0000
Received: by mail-pl1-x62c.google.com with SMTP id d9443c01a7336-2c2da7fa321so3737775ad.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 11 Jun 2026 06:28:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781184528; x=1781789328; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=kr6lr/Zk4qDdZQL9yjJdI0zh4QdrOtRvdN1aN8UPXKU=;
        b=GnHGxvIIiLaO1Tot9gq2WVJziO4HcoIHWBV370mroCxk2cj3aJbAWBPDzlULStfVgH
         LmtfozZkxj2uMlMBzzsB2zTvLjrn45ZY/jVl+ZJKPhLBRjF4OHfE3KUewcU6H2resPsz
         o3a9Yve4vST1oNCO3V0gqaUYOK600AnjiuhLHpWEKHTwGjXTy76d6+QtaGyMP9/4YQjI
         yOhbY2oGTCgsb8nl+q1jxVD+RtUBrwx/+McgvtmVJ1jTwngXbRMDwwGdTGzJlK9ZUH+N
         lYvRVwPuGgn6ONE/S6IYl5p5oKG8CQcPrevBFEsmJhHS7EBEJNpjWQ+w2howiHQfCbqf
         JKYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781184528; x=1781789328;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kr6lr/Zk4qDdZQL9yjJdI0zh4QdrOtRvdN1aN8UPXKU=;
        b=rTr3JsgYJ2tnN7qR8P1TrwgODzQu3zgcI5fgd+gTMoKj8qwvzKk9MeYhUB6DFnDCbX
         fciz42Lv6vjastFb17IuxvoduSreNfORLNrueKraRqL7f/i+OycI8EMuSX97AIqFvQRc
         xVcz/giTsZ2mSpca2dfQFK/9K/H3vrunpvubv9iyiUKHKJQv0F6qWyty0HmHIFzqtsP7
         oEGJyT/TJGSe/l7/IVCnKWM0iDsc4/af08tIOuJ1IyfaO3/NzSIJ/Lh9qcEXcqftjQAu
         z8jYK/cLPCGXighQM7l7Qnf914qBPpf2LHpytrsZYf3EGKUpSs9sUJqla89e0zM/Sdx8
         yrcQ==
X-Forwarded-Encrypted: i=1; AFNElJ/O/NCPES8agUcvLhT0QAqBo4e78f4yjy+QrCpRvAwCedYHcaV2GwmhptdgS6CEj0LLnDeHyQJ+PYLWtGQyTN2g@lists.infradead.org
X-Gm-Message-State: AOJu0Yw1ft9gbni9f5lZGbO8zdCh9PmQ+UTTsGcVKL+p2VFdAxnqfbrZ
	JBLNd6UezJKALx7ujHMXOv8iKdSJMzSHW+vpF2dw9b59yXe0HBMa0WOj
X-Gm-Gg: Acq92OEulvb6SuoE2JUc3qQDAmJYyivptBbp8zeK48hvEdv498tllz41gu/WNzZwZ6a
	Ngr4iS3bmb9YDpuRbZS273CdS+A2g12xN+zW97DFnQ/gUY99ldNadCaF3M6AFhaNEfhKPDZRKlx
	4dKoWQS74MMyx7kvNTDXu9Bc9B8d1wCCCbjgx4JTpbIZpnvZfWytRH+WPNMEefmN+T3PUJkQKyV
	pxXbxwsDzlDGzmERLnMvRXLkdhcqO72GSl5dyrYnubtkJCepycSDOW/Pnw1whCpe+/Ez6gzzR5c
	ytF5nmU+eL/CQE0Ovprrz6QgNcUA2jB1+eGBQOYht6HWpirk1CklLImUk3WXU2kfWF4juw+0zCP
	krIClOyOq9Y7VTtIkOa3p7OVF0lUZVOH70Uevg88QYlU9hbECJtFQPzRP+ugiMqllidqvlEPTIt
	RiiLbxULdw4DtubEgImLmX0AelUnrLaSz1h2oB37+E4WQmB5LU1+LUeOQ2iHSCXO+mtuMT1wFrm
	kHGsKxEoG/q9ywK68xB7usJOtCqwb/ZHvwX8oqqybUas27hfEhctrcpWn/+4EBbSlisVucYwKQw
	bu0T4ZfEazkmJQ77NpXvYhGJi2YcjJ470Ba8k22rQ4PI2RLF
X-Received: by 2002:a17:903:90c:b0:2bf:dd8b:7cd with SMTP id d9443c01a7336-2c2f10165e3mr31858515ad.10.1781184528412;
        Thu, 11 Jun 2026 06:28:48 -0700 (PDT)
Received: from jfk-HP-EliteBook-640-14-inch-G10-Notebook-PC.cse.unsw.EDU.AU (dyn-dhcp-226.cse.unsw.EDU.AU. [129.94.175.226])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c16629cfb4sm292927115ad.59.2026.06.11.06.28.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Jun 2026 06:28:47 -0700 (PDT)
From: Weigang He <geoffreyhe2@gmail.com>
To: Hans Verkuil <hverkuil@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: linux-media@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Weigang He <geoffreyhe2@gmail.com>
Subject: [PATCH] media: cec: stm32: prevent out-of-bounds write on RX overflow
Date: Thu, 11 Jun 2026 23:22:48 +1000
Message-ID: <20260611132248.114519-1-geoffreyhe2@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260611_062850_208674_05CA06A1 
X-CRM114-Status: GOOD (  14.18  )
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

stm32_rx_done() appends each received CEC byte to rx_msg.msg[] using
rx_msg.len as the write index, incrementing it on every RXBR
(receive-byte-ready) interrupt without checking it against the buffer
size:

	cec->rx_msg.msg[cec->rx_msg.len++] = val & 0xFF;

rx_msg.msg[] is a fixed CEC_MAX_MSG_SIZE (16) byte array in struct
cec_msg, and rx_msg.len is only reset on RXACKE/RXOVR or after a
completed message (RXEND). The number of bytes received before RXEND is
decided by the remote CEC device (it sets EOM), not by the driver. A
peer that keeps sending bytes without ending the message drives RXBR
repeatedly, pushing rx_msg.len past 16 and writing peer-controlled bytes
out of bounds into the surrounding memory. This is reachable in normal
operation once the driver has probed and receiving is enabled, from the
IRQ thread, without any local privilege.

The length check in the CEC core runs on the consumer side, after the
byte has been stored, so it does not prevent the overflow. Bound the
index in the driver before the store, as the other platform CEC drivers
already do (e.g. tegra_cec), dropping the excess bytes of an overlong
frame.

Found by static analysis tool CodeQL.

Fixes: d69ae57453c8 ("[media] cec: add STM32 cec driver")
Cc: stable@vger.kernel.org
Signed-off-by: Weigang He <geoffreyhe2@gmail.com>
---
 drivers/media/cec/platform/stm32/stm32-cec.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/media/cec/platform/stm32/stm32-cec.c b/drivers/media/cec/platform/stm32/stm32-cec.c
index 1ec0cece0a5b7..8c2fc232202de 100644
--- a/drivers/media/cec/platform/stm32/stm32-cec.c
+++ b/drivers/media/cec/platform/stm32/stm32-cec.c
@@ -132,7 +132,8 @@ static void stm32_rx_done(struct stm32_cec *cec, u32 status)
 		u32 val;
 
 		regmap_read(cec->regmap, CEC_RXDR, &val);
-		cec->rx_msg.msg[cec->rx_msg.len++] = val & 0xFF;
+		if (cec->rx_msg.len < CEC_MAX_MSG_SIZE)
+			cec->rx_msg.msg[cec->rx_msg.len++] = val & 0xFF;
 	}
 
 	if (cec->irq_status & RXEND) {

base-commit: 9716c086c8e8b141d35aa61f2e96a2e83de212a7
-- 
2.43.0


