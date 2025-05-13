Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35B35C3ABC3
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 13 May 2025 06:45:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=y99xS7SY2LAz3TrF1rHqHfHg9H2RdQzzJUTTaDgx+SY=; b=Kax+gx866GtTGJglHgHgcHNxmA
	ooB7Nv3S5Lh/IOMq2sNFmKN3B4JDmuraoLbXGe+/jmp3omUtn4ztpMbAg++4xJP9/o9s7jejL8ihD
	E/6w2DYgHNEfEHNvhMsF4u2g9+xtWWEoYfjhhoa66KTov5as0TUYuJI4Sq29h/2i8TW/mzC40bJ2i
	I4O1SIRrGKw/a6klksncMOeQl/+Xi4R1ClE6tgCg3giylek1R6t8OBh+9Pr9CEIRwVE4+FUUwSspL
	nhJxJAncV5Oyamsa4WDYC1DLXJpSQ7++311+zjdtq684OKIWB81HxI3TnhQXoeFXwxazQl7OBq8F1
	Dl1YxEqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEjO6-0000000BXBS-1Qg0;
	Tue, 13 May 2025 06:45:14 +0000
Received: from mail-pf1-x442.google.com ([2607:f8b0:4864:20::442])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEjFt-0000000BWFB-1JlB
	for linux-arm-kernel@lists.infradead.org;
	Tue, 13 May 2025 06:36:46 +0000
Received: by mail-pf1-x442.google.com with SMTP id d2e1a72fcca58-74019695377so3856628b3a.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 12 May 2025 23:36:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747118205; x=1747723005; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=y99xS7SY2LAz3TrF1rHqHfHg9H2RdQzzJUTTaDgx+SY=;
        b=gIXvf5i3E6VcjiUW/I6Yto/HcGfHlZNc7gL9Cj9gn2mxMD2GDpzXp4XjLDh13nkx6y
         d2cKxCAP5gogfLw5YivJuMfo9qp/1meQD5TSyYdbmHBhuEA72ixPxm21GCRdatxy/TRF
         kEvN0WAsBrUQNhqhqWE+dpq3dz9o+fuUT+0NcKTmNZ2BJFjoUzfblekrv1DfV+YGsf1i
         0vqpQH1j7+I3o2dvu6PfwPc9wyfQtohRbS8T44DCATIvUhKfhT2SL0NlTqwO7wAS0fZP
         Cp6ScdkLB86LvTO1zqt9jZvD5L3g//aYaBnVYARpk/0SL5tV4AbHe6Dbe1bADgi+4PxH
         bo1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747118205; x=1747723005;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=y99xS7SY2LAz3TrF1rHqHfHg9H2RdQzzJUTTaDgx+SY=;
        b=GakWh3Vo96m6+zxrQJ7FZa50Wqsjpd5WXOd3dDnpyAC/TTOzNvW1o6CLGnCWYFsvtF
         jcoj2VwoOYUlJOFhDLyzrrapbrs8ZPDl0qE3FPBohSJfx7lMQLJB+Lr5q/UouFSYmkOR
         a2cVFORLiFUcSFzE8UERoQusszpKpo5VuTRixCi+Y/cUsSxCOkMCwgFbkbgTEQKBre0n
         1OVvNcyJUDe6hYKTOl205evzs4ewfU+BRNUF+yYYbrzDZe/fyyYmbg2/dQeQ+mLB1Su/
         HbUdvaJykdWqTE8RKb2mLPpgMf5eXIW8HdlyEOlh9FYlawXsLlp9dlWKdHpOE8hDr+td
         YNYQ==
X-Forwarded-Encrypted: i=1; AJvYcCV3pVF9tOBQZdxwxPSikXslAixA7i4S/69os+hcnNL+eIy+RdpH/G+GT21iAqAPecXK72ubUH2S2UY1RR8dZtXa@lists.infradead.org
X-Gm-Message-State: AOJu0YwC0nGDpS6JujjL2Ww3IJT6vn463qa0BgUPjELjLq4Lp0D9Mkwt
	aidzf4K2vfTnbDNQcoJ1LfsIkKqZuc2oPAj+GJP8DiuAEoa3babd
X-Gm-Gg: ASbGncupTwxTm663l3uaxkgSbz+Ys+w/49bNEkYJ3t+4QGZRZqZV9Dxa7UwC8oPwK0o
	jmaZGBgFT8o2UlEDlGOv7TD2I/xbmDEq8tEM44jcDkEBUMm/sTwHo7hhysachDxjFhKOt7lX6l9
	90udaNobus0nMoMIp3BBJTODRshpYeC0MtLudWdWgDdsoO2I7E6R7lCH8NpQ4qM5EWa2Q6bbo6k
	lKVryVqVv4onmOVPY4F0WzYtIeFGg8zqWFD/Ysu8uBSsLgXLFdTP9H34oQUhOb0c5KouODUDL+b
	u2460W3kPDcdgvMRYmuNR0u004E9lkDpAijKlYb6Z21hn5E7yisIBZ8=
X-Google-Smtp-Source: AGHT+IFJWXy24yaetI34omZb1r4anR0SzeBfbfb+3vCHkMA5r41DKDPTr4sjv1kUrFcK6m2M+hxgTw==
X-Received: by 2002:a05:6a21:3510:b0:1f5:7cb4:b713 with SMTP id adf61e73a8af0-215abb3a301mr23308487637.19.1747118204664;
        Mon, 12 May 2025 23:36:44 -0700 (PDT)
Received: from [127.0.1.1] ([91.124.30.36])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b234a0b76ccsm6657936a12.27.2025.05.12.23.36.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 May 2025 23:36:44 -0700 (PDT)
From: Troy Mitchell <troymitchell988@gmail.com>
Date: Tue, 13 May 2025 14:36:14 +0800
Subject: [PATCH v3 2/2] i2c: imx: drop master prefix
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250513-i2c-imx-update-v3-2-817b7426a67e@gmail.com>
References: <20250513-i2c-imx-update-v3-0-817b7426a67e@gmail.com>
In-Reply-To: <20250513-i2c-imx-update-v3-0-817b7426a67e@gmail.com>
To: Oleksij Rempel <o.rempel@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Andi Shyti <andi.shyti@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, Fabio Estevam <festevam@gmail.com>
Cc: linux-i2c@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Troy Mitchell <troymitchell988@gmail.com>, Yongchao Jia <jyc0019@gmail.com>, 
 Ahmad Fatoum <a.fatoum@pengutronix.de>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1747118187; l=873;
 i=troymitchell988@gmail.com; h=from:subject:message-id;
 bh=Ip3fCjtKHIWdXoxS2ayjmqQZ2CXz2QC9JgKDfWc8a7w=;
 b=dtZzgsLgDl4KFfOlioaf2TlzkSvJK7YIv+UGk86oqaYvH+1y/9yehAeMD3OYYPYJjYj4B7deQ
 sLWQG6khLQIDMDqVZzcC3TMjq2ndve+vwEALeKmMzhawudTm3ezOiut
X-Developer-Key: i=troymitchell988@gmail.com; a=ed25519;
 pk=2spEMGBd/Wkpd36N1aD9KFWOk0aHrhVxZQt+jxLXVC0=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250512_233645_355593_51F2C72C 
X-CRM114-Status: GOOD (  12.22  )
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

Reviewed-by: Ahmad Fatoum <a.fatoum@pengutronix.de>
Signed-off-by: Troy Mitchell <troymitchell988@gmail.com>
---
 drivers/i2c/busses/i2c-imx.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/i2c/busses/i2c-imx.c b/drivers/i2c/busses/i2c-imx.c
index 5b276e007292..d85adfb73bac 100644
--- a/drivers/i2c/busses/i2c-imx.c
+++ b/drivers/i2c/busses/i2c-imx.c
@@ -1687,8 +1687,8 @@ static u32 i2c_imx_func(struct i2c_adapter *adapter)
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


