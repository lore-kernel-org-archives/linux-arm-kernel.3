Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D2D9CE8E9A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Oct 2024 17:44:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=NBM71vD6WDqf0TCJvK6rWX4TDGTSUy4YN3C5hnGxHqo=; b=E9YAWyix9/d8xf
	YHFmSOFJZp2XbOCBFb7f5weL4J9BPibLeTGcMSlA181/CXBIPHYzKEVqOGHlFATiOGKf2RK+j8xr3
	t+hGRc2MOMUP5o3uHYwN/HLCGLOd29BO6Ihqo5MTHKnJn5UOfavP0jFtx8WowzRSPBAzx5+kIhEy5
	wleO8YnZRy7gG+BtmukZTE43GRK0lLOlqes6k87GhZwNBBZkE62cjcWf9WezROTS3E3x4XA4VZWJx
	sPbVJ3SYqpkz/uCi4bOE2JApImEUCSwk3Zrec+Wmfm8WgUjazBt21dRNqGXH5VdqDh1N6y87Fe2sE
	oThSYaGGyzDgCFcfr5Ew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t41sm-00000001KSs-3MpW;
	Thu, 24 Oct 2024 17:44:24 +0000
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t41YH-00000001Gh6-2TM7
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Oct 2024 17:23:15 +0000
Received: by mail-pf1-x435.google.com with SMTP id d2e1a72fcca58-71e5ae69880so825353b3a.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 24 Oct 2024 10:23:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729790591; x=1730395391; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=NBM71vD6WDqf0TCJvK6rWX4TDGTSUy4YN3C5hnGxHqo=;
        b=S60XGGqjIxTAMK/Cm5sWcOvOPN84JtBOS56evs3z/MlCj5Qb3l0Iq2J+lP4Rpci29t
         wsLfDSVnM+WHoPxvNpFHBebA0XGQpU+Cm8L+7z4GPud7zPCiN4T/eq64alkx2wtB7As1
         NnqFYarHQFhkMEVTEfTXIemuZGU1vaxnlcDq5lmAfqhK9iNcH1Wjhq0AoTJEVkf9ZDWM
         s9A5wPBL0xpfq8uJNQ6hzLSn+b0sDNBYTBggR6YTQsifT44rXoE3zwAJ2S5qSGBYVNcN
         KS33WAnlH03KVFX+2tY0D0msr1v9ANvogBmiMeO1L0DvanEKdfDUoZ+XenFehqhxuLUp
         Ov1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729790591; x=1730395391;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NBM71vD6WDqf0TCJvK6rWX4TDGTSUy4YN3C5hnGxHqo=;
        b=DWb/ZIG6ustZbmRs+w3aZCkB2vlHVO4dEJbN0fEXGFL1Bf9c0ER7Hu08uMeqlmhZNn
         6bTFqhdOLw2MZO83bb5dd2tn9oH7qFM4MPxNt8tOgXpWuXZ7DpDlsTF8rTt6FtrqEagR
         3DzPUisWwt1bErDDpwfHGqi/c7lpLELDMZI7DD5+J4XIzFR2YpEX1H3bs9/g2xOt5wLI
         DFlN/sDFW0p9Xp2rsZeG6seBi7fyqZ/L2bOlh37ox2CmlbFWHrYwrxaoa0W1Ko6f5e99
         6JivFQIj9kL9RkRB+YmF5rYdR4DLaktLQ8wpxE49xRB0tPMeZnaGP9BNGyxEmK99j4kp
         MKAA==
X-Forwarded-Encrypted: i=1; AJvYcCU/sen+YucAeROGgrsMTBYBHLJi9YuOjmTAciFn4OmjuxTkZdRFwXdRgUdPlR7Sa7XVZUaIPfNZtldh9h2SX2gL@lists.infradead.org
X-Gm-Message-State: AOJu0YzY8n2BU3QzUY+mAc3XQMW2JOWrxganiThkt22aHaSoYsUTpKSH
	tCDaA61qqZaRmQ4YB+DqlASLgqD1zqmfI1uqxSoC8GHKaAkV08J9
X-Google-Smtp-Source: AGHT+IGVo1RaZUfhxMDG2y4ONxaW9Mm/VearOH8rgYdvQwVVjjmjcPfVHGU0nhenMc+XNZBQnF7BEA==
X-Received: by 2002:a05:6a00:3d43:b0:71e:8049:474e with SMTP id d2e1a72fcca58-72030bc178bmr9500663b3a.26.1729790590929;
        Thu, 24 Oct 2024 10:23:10 -0700 (PDT)
Received: from 2abb50c-lcedt.nvidia.com ([203.200.25.7])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71ec132fef0sm8258816b3a.63.2024.10.24.10.23.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Oct 2024 10:23:10 -0700 (PDT)
From: Shivam Chaudhary <cvam0000@gmail.com>
To: richard.genoud@bootlin.com
Subject: [PATCH] Typo: Fix typo in atmel_serial.c
Date: Thu, 24 Oct 2024 22:53:00 +0530
Message-Id: <20241024172300.968015-1-cvam0000@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241024_102313_687726_54BCE22E 
X-CRM114-Status: GOOD (  10.70  )
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
Cc: alexandre.belloni@bootlin.com, gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org, Shivam Chaudhary <cvam0000@gmail.com>, linux-serial@vger.kernel.org, claudiu.beznea@tuxon.dev, jirislaby@kernel.org, linux-arm-kernel@lists.infradead.org
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

Corrected minor typo in atmel_serial.c
- Fixed "retreives" to "retrieves"

Signed-off-by: Shivam Chaudhary <cvam0000@gmail.com>
---
 drivers/tty/serial/atmel_serial.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/tty/serial/atmel_serial.c b/drivers/tty/serial/atmel_serial.c
index 09b246c9e389..bb1978db6939 100644
--- a/drivers/tty/serial/atmel_serial.c
+++ b/drivers/tty/serial/atmel_serial.c
@@ -1166,7 +1166,7 @@ static void atmel_rx_from_dma(struct uart_port *port)
 		port->icount.rx += count;
 	}
 
-	/* USART retreives ownership of RX DMA buffer */
+	/* USART retrieves ownership of RX DMA buffer */
 	dma_sync_single_for_device(port->dev, atmel_port->rx_phys,
 				   ATMEL_SERIAL_RX_SIZE, DMA_FROM_DEVICE);
 
-- 
2.34.1


