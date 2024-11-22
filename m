Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0EEFFE6ADCA
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 22 Nov 2024 22:20:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=da17qF15VPZTU2YSYHqLzMcyFK3KqWPtGcD0XFwPoOY=; b=v+0/BMyP81yiTaFNHOfTf2Ern/
	QgxT/Hxi529GjiuMO9oWrgWQ8s5nr8S+JLAicszMSb1G5eMiLyEy57ZUz1BFjIWSaXOT3PJuUHkfN
	fjqaYDy7/5fscRQpWn55gTsrLA+7pXGuu1GueOpP3a4WCmjpj/cHS6kUA1W9/ALjTroaSqrsaFflu
	SHYyIQGXNSXvbISj46UYDB2E9Cn4FMLTSUiKzx0QC/7bqSu/IPMekiDnxiRo2tYgK0AwGPORot5A+
	Fv+jKsRnrRIO7MA9xu+98g1TwariPOtowKcVcG7RJAlO7/uIOhqCvdEx/78hPdHBCnF+Jm18xi+s6
	+e9W1UIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tEc0F-00000003P95-1oUY;
	Fri, 22 Nov 2024 22:19:51 +0000
Received: from mail-ej1-x632.google.com ([2a00:1450:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tEbxT-00000003OT8-0bvE
	for linux-arm-kernel@lists.infradead.org;
	Fri, 22 Nov 2024 22:17:00 +0000
Received: by mail-ej1-x632.google.com with SMTP id a640c23a62f3a-aa51bf95ce1so146066566b.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 22 Nov 2024 14:16:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1732313818; x=1732918618; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=da17qF15VPZTU2YSYHqLzMcyFK3KqWPtGcD0XFwPoOY=;
        b=j/t7s+koGOtkMjPo+Xju/uPsxg/fZGiys1uu/PKH3vIu8rbgnnCHMI9lCC/2pqwGlZ
         NhcKyUYxDS0mXg24fS/iHHnyMgza0lZXqlbfCwCldBa0FZ1SGHUwldYNRkazUcgM40Qz
         yOvm5qesdkoZre2CnRamrV2rm87mKJGcFBKKM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732313818; x=1732918618;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=da17qF15VPZTU2YSYHqLzMcyFK3KqWPtGcD0XFwPoOY=;
        b=KPMAHtezIINjJVoVigfwxHtP7M/sy4gjOV0p4LCcFcQd/pwxGmbyVa47ajHQ17sTUr
         dEIxsf8Qe2oFTfGtWNTmGStY4z0rJZ+34lu7mVwPmml+et+RCMDPdZKInSJHOuKIyJ/s
         CdaQWUYX1D4jWbT7xzKZbhZgCicKoEnl5eY/2ReuN9hXrtEj6mNXVuFbVi8O8aOqogJd
         4P8HURZHmqUMaxXv2l+Qwvsa0aCkJEe/Acy1XL9b5iR08Swy+DdAx36eQi+TWt0+EUU1
         ypl6c1vTK9NoriDnhuIrPTNhehV6dbh+Wu5GQmccy8OB91VrmzpQpMm4KDuk/e94XwG7
         Tg+g==
X-Forwarded-Encrypted: i=1; AJvYcCVW6d4k4fU7e0tQgOPgtOTWT8LfFKRChgsIJKCfLCR+/8Jk6JZkJONmRmqpIk1LU8ZYBeT1yhx3Gzj/PJK+MzBs@lists.infradead.org
X-Gm-Message-State: AOJu0YwgnnVAMwCQD137y4sLlU9/cbkTNK4U8mt4JVfKUaVtIidCwHSs
	IeCvyEG2qmMVFA70O5UEAHIKk+obP5NN7ZUNJ6ZJh8oJzsup833XJu+jlAt8cMo=
X-Gm-Gg: ASbGncu9cyT+2V/cMH2OZ5QgJqiI4+/+/XpF813q97sU0di5MQzKUzqMcndsk5FxnNs
	O2P5I45pdVthO/ZD0JL1SjCf6S/1ciS9W57YSIb52XBTsaeAsWvetpwa7JJHKvcOQcDUxHwqEFW
	iA8B3lvaxTb/ui15/CLRCuKXtUWTsL1d9NLi7GCdtH+aSSGLs6OPjEXzqpagiCweTifRBsB9iwJ
	DFcNbPkN7oRVxwvBL9nOpyBJnr3h376W/+B07xhxh1QdCBdI15xXvkws5aPy5tyzA3tdy8gTaos
	aktmV7Acf+AdAlp7yYIy16lRuajBCoNoymoPLu1r90LzyCWH3LXAEuH20WTVe2GznaoN7ogm8B4
	l4WKGotI9HqvWK313
X-Google-Smtp-Source: AGHT+IFqavb84q465UWZ6gGwXgO+FxfrEo4gdscEtW86lZSTJTKpRR6rT4g7qMsIZYvAutdo4gpnMQ==
X-Received: by 2002:a17:906:4c9:b0:aa5:cec:2785 with SMTP id a640c23a62f3a-aa50cec28b3mr343858766b.25.1732313817919;
        Fri, 22 Nov 2024 14:16:57 -0800 (PST)
Received: from dario-ThinkPad-T14s-Gen-2i.homenet.telecomitalia.it (host-82-54-94-193.retail.telecomitalia.it. [82.54.94.193])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aa50b52fcebsm148226466b.127.2024.11.22.14.16.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Nov 2024 14:16:57 -0800 (PST)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: linux-amarula@amarulasolutions.com,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Marc Kleine-Budde <mkl@pengutronix.de>,
	Samuel Holland <samuel@sholland.org>,
	Vincent Mailhol <mailhol.vincent@wanadoo.fr>,
	linux-arm-kernel@lists.infradead.org,
	linux-can@vger.kernel.org,
	linux-sunxi@lists.linux.dev
Subject: [PATCH v2 03/12] can: sun4i_can: continue to use likely() to check skb
Date: Fri, 22 Nov 2024 23:15:44 +0100
Message-ID: <20241122221650.633981-4-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241122221650.633981-1-dario.binacchi@amarulasolutions.com>
References: <20241122221650.633981-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241122_141659_179755_E0D0E1A6 
X-CRM114-Status: GOOD (  13.50  )
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

Throughout the sun4i_can_err() function, the likely() macro is used to
check the skb buffer, except in one instance. This patch makes the code
consistent by using the macro in that case as well.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

---

Changes in v2:
- Added in v2

 drivers/net/can/sun4i_can.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/can/sun4i_can.c b/drivers/net/can/sun4i_can.c
index 17f94cca93fb..840b972498c1 100644
--- a/drivers/net/can/sun4i_can.c
+++ b/drivers/net/can/sun4i_can.c
@@ -570,7 +570,7 @@ static int sun4i_can_err(struct net_device *dev, u8 isrc, u8 status)
 		else
 			state = CAN_STATE_ERROR_ACTIVE;
 	}
-	if (skb && state != CAN_STATE_BUS_OFF) {
+	if (likely(skb) && state != CAN_STATE_BUS_OFF) {
 		cf->can_id |= CAN_ERR_CNT;
 		cf->data[6] = txerr;
 		cf->data[7] = rxerr;
-- 
2.43.0


