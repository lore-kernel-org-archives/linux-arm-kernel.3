Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 363DAC369D2
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 21 Apr 2025 05:43:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qP16P958gYh46YoBLSFtpJ/M9EjZ/0g/N+HcV5FZKJ8=; b=3/GnyNEsR+YiijGy4bG+dH+l7p
	9+/jNi9ElcWoAmSQgC2ZOCQZHRGxwbpvj4Ew3wnEil4ei2GM3aY89cddp1h+BbbKdQCd6KRHckbrN
	OqeW4j70J6msq1+Izp0kwcCrN0RqRAcRxyMwiSKq3TMrQ4tZ1gR+Qun1dGe2W/4kPC4aKzqeLYbQ6
	QjRYLPBxB9NpS1f/tJ2esUwlI38cPzcwlKxe8OupLzI5f0IF8WifGwuDVBHIm+kAzdshMGBD4J2oK
	o99ICY4x7siXQt9HbX0hZtNUHGxpZ0OnIXA4qH8/8tEjvZM5q06P+wygmvyYWAmqBlpg/g08pklnj
	IjI8f7uQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u6jw5-00000003eBB-1bXu;
	Mon, 21 Apr 2025 05:43:17 +0000
Received: from mail-pf1-x443.google.com ([2607:f8b0:4864:20::443])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u6jq1-00000003dgb-1R18
	for linux-arm-kernel@lists.infradead.org;
	Mon, 21 Apr 2025 05:37:02 +0000
Received: by mail-pf1-x443.google.com with SMTP id d2e1a72fcca58-7398d65476eso2885280b3a.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 20 Apr 2025 22:37:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745213820; x=1745818620; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qP16P958gYh46YoBLSFtpJ/M9EjZ/0g/N+HcV5FZKJ8=;
        b=STV4ozhmYpWxNoQEC0Cz2Q0KEaySNx+zyjK2fxtPZsNhVF7GxgV4CKoNqwOc8d/5It
         TatgrxWXyndLIU3D+E1sHB1dSsGKNO9e+qqmMnO4ztrleL2chSiPyUC2iPMzyRBGdGUj
         QZNKomzYYOdy5jqluESt1zwdeumDck/vImQM3+9R7j3OqLz7TAU+fR7QeC96dn1XX98V
         120KfHAw/c+tQ0nx7P9FkBfQlHTGi1i54HTNlS/bLefXJ6nuoqhzDdFv1vsVeuD+y13q
         A1j5AHOEWRGXzVaEpfFec6ei3oSZzeMTm4cfJcCfGrn+lgGnnQK2jkRkKpPt5DvGmR1y
         SnOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745213820; x=1745818620;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qP16P958gYh46YoBLSFtpJ/M9EjZ/0g/N+HcV5FZKJ8=;
        b=HG0bKwA7sZXNDaE4Z167CAjVfY4wgX18gpY4GS9mLEt2jtHm3Zk1pO+Swy+4b+QRLl
         ATrEr8LaOmyplNpCguDnMzQ2Y6B3f2xlPqAigP5JoPi4o23760aXBuUBIQOKDZFGgo4E
         FNanRKpuxjkBINaYGH3q7tasDuE+/YzfVDAF3az3GI/yWpTot8K2eHTTt6uskM3e8/9i
         IOBv6p1gG9LY3zFhiy4w/cviuVfP6R8dx4UV4hOCy/uA55xsGZ7C5kSdccL2KzbqiJzs
         GIH2QNg+bB7tTfrFspoGYt8MmHJ+rs/UvvvttgrCKfXSUVrnvLNFz1xzeV9oC5EDW94T
         vDBA==
X-Forwarded-Encrypted: i=1; AJvYcCVu6LXjhkCyA+O1aM32cAao61DgVBVRJ6VNHEFZmyWPd5jW9aOr7dc7zCjnlRA0nMb1hjniKRpWaDrhz8uHPJBU@lists.infradead.org
X-Gm-Message-State: AOJu0YwQrnLkf79khDBpnM5kfpzEYnIoN6SBE8y6gb/UVVn4N0o+NZgz
	24ygcgBwx0UmVYpzsJ3vX8SXnosQIAR2K02czoDqB5FT2hCwTWZx
X-Gm-Gg: ASbGnctdq6YGI9auCQKWK2gA0C8rgkR2mKhF+T0Lt9h5CS8Ewm5hy6z5+g4UtqqBtDc
	m5uw7yd3+wz/HXPIrzTVHeSSqxm6DpjeC8ZmIIonYsLbvRWaunpmakhhuvM4TZEctDe3kGXTED/
	EXwgacq0lKzOwBhWWg01r7xPA4I3Fa+rIyhuHr6aNfsfPzlnrnEBIk6vhPNgzY+9jSZOA8SlElP
	ucmdu4PdtD7EddzIwjV1VDOr08xFc7IRc4gfBdsEzDF2ps2FKGSsnrYbl99Yp+u053Jo242xAM6
	GgWg35nUgr83LAvd8dDWHFln8as04D3JPU4=
X-Google-Smtp-Source: AGHT+IGaq1j44bIV9U9aAP6Lw87+CebUioUl2IXpzgU4JKDPc1gVaozyiEZcGrmNCAOWX4YZqafxgA==
X-Received: by 2002:a05:6a00:3905:b0:736:9f2e:1357 with SMTP id d2e1a72fcca58-73dc1b7d92cmr16890178b3a.12.1745213820426;
        Sun, 20 Apr 2025 22:37:00 -0700 (PDT)
Received: from [127.0.1.1] ([2a0d:2683:c100::bf])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73dbf8beaf2sm5634270b3a.5.2025.04.20.22.36.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Apr 2025 22:37:00 -0700 (PDT)
From: Troy Mitchell <troymitchell988@gmail.com>
Date: Mon, 21 Apr 2025 13:36:39 +0800
Subject: [PATCH 2/2] i2c: imx: drop master prefix
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250421-i2c-imx-update-v1-2-1137f1f353d5@gmail.com>
References: <20250421-i2c-imx-update-v1-0-1137f1f353d5@gmail.com>
In-Reply-To: <20250421-i2c-imx-update-v1-0-1137f1f353d5@gmail.com>
To: Oleksij Rempel <o.rempel@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Andi Shyti <andi.shyti@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, Fabio Estevam <festevam@gmail.com>
Cc: linux-i2c@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Troy Mitchell <troymitchell988@gmail.com>, Yongchao Jia <jyc0019@gmail.com>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1745213806; l=820;
 i=troymitchell988@gmail.com; h=from:subject:message-id;
 bh=qnDuboyg3uC3ZM73XxREV7nSTfV+BWdos5WixRH5ZSc=;
 b=9uDtFJOoouBVDqMeSweTMN8B5tBnbcf6uzO7/1YWRkgpM8iHl97fMt3EJ7tOaMIeXYzCFS9LS
 xyWr9Pns8uVDLFXmqfUey18aE+a/BSO9hELI++WhIAvbX4BdBLxZoq9
X-Developer-Key: i=troymitchell988@gmail.com; a=ed25519;
 pk=2spEMGBd/Wkpd36N1aD9KFWOk0aHrhVxZQt+jxLXVC0=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250420_223701_387473_0155BF6A 
X-CRM114-Status: GOOD (  12.15  )
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

In light of the recent updates to the i2c subsystem,
drop master prefix.

Signed-off-by: Troy Mitchell <troymitchell988@gmail.com>
---
 drivers/i2c/busses/i2c-imx.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/i2c/busses/i2c-imx.c b/drivers/i2c/busses/i2c-imx.c
index cb96a57df4a0..dd07fde79632 100644
--- a/drivers/i2c/busses/i2c-imx.c
+++ b/drivers/i2c/busses/i2c-imx.c
@@ -1690,8 +1690,8 @@ static u32 i2c_imx_func(struct i2c_adapter *adapter)
 }
 
 static const struct i2c_algorithm i2c_imx_algo = {
-	.master_xfer = i2c_imx_xfer,
-	.master_xfer_atomic = i2c_imx_xfer_atomic,
+	.xfer = i2c_imx_xfer,
+	.xfer_atomic = i2c_imx_xfer_atomic,
 	.functionality = i2c_imx_func,
 	.reg_slave	= i2c_imx_reg_slave,
 	.unreg_slave	= i2c_imx_unreg_slave,

-- 
2.34.1


