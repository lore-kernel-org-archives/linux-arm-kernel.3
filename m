Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 230E6C369AB
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 27 Apr 2025 06:18:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=sVkOXl+FItqnBG4PWwNvXOPdmDOL8HuWkGunCwBr2+Y=; b=cKqMw5J1FPbnBs
	wkUN12rAE5rDQrtBCkuMx6rRo7sR2+xbTdSORQbh9UGW6IofNVm/IkUehmIF6brx0kYkLJDjX/gzl
	4jLcgkDWII0I01AJFqVXrn0hwBRM2xl9adElJygEqC0PqgDHGN/97lyySz857Cy0ngFRGubRzawOw
	l2had4YEuJi98A4Y7j0yP1GB3yydqDCMRiS5DyRF/fVMG1NlubKM7/L+ySXLkoYioTrOQaA1p36rP
	0PbuASIS4R/CUAgmIiXnrdRJqVdu29dWxh1q7XL3fPpWso5eYVgRQCdkynnhT7qPDhFW9HCQDJxc7
	ttHb9AEEBPn8Kt2DyMzQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8vLJ-00000002y2e-29O8;
	Sun, 27 Apr 2025 06:18:21 +0000
Received: from mail-pg1-x544.google.com ([2607:f8b0:4864:20::544])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8vJM-00000002xlz-3uNp
	for linux-arm-kernel@lists.infradead.org;
	Sun, 27 Apr 2025 06:16:22 +0000
Received: by mail-pg1-x544.google.com with SMTP id 41be03b00d2f7-af9a6b3da82so2373950a12.0
        for <linux-arm-kernel@lists.infradead.org>; Sat, 26 Apr 2025 23:16:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745734579; x=1746339379; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=sVkOXl+FItqnBG4PWwNvXOPdmDOL8HuWkGunCwBr2+Y=;
        b=jWaiqvLd58gIj1AS6K9t9CTGDJKotGzayzn1b8dhxUvg1jy6YelB8CUTo5V+hY5fIb
         dbwDtJxl0d9tJTCXc6cbVG1zfZ426javMBWAxmXabuSw27h01ChH/ZtwMSS7aYM0HvYl
         u8prOrij4/z0poy2rPHxQVlf9UzDnDhIsUpwLEZe+WSG2DzLhG2gOLGDZTiHoIQFF5AY
         pl5cE9d6R43Io8wrJu/KFGTmLjcw8HJFrRRYlgrBsUB3EdFua2NmO5bL0gDHz5PK/CFV
         bKODHM00L7NmzOCKmk4XlPrflZEcLNsChdbZJ6p9fIxY0HLgmIv22TMwbDjoN0lCyJlk
         PyRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745734579; x=1746339379;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sVkOXl+FItqnBG4PWwNvXOPdmDOL8HuWkGunCwBr2+Y=;
        b=dmzbI38oYVmcfnDymuGlW83yO+XAjBmWUSqawcoe4f8qMWlPt/CRpQqcqlbWIkp6YV
         Aq/hcHoWsmXkVP3GfpMdgmz5QVtSnfzT/bEuXAU0nd7gkwpR39qSsTh2XFvgogC0qB7F
         u0IIHINHWHzVjukJ4p+7SJsSBgvlUDmWh/gnQmJwtZFzAbYRaZRfAict5UVK5aToAiGi
         VCfmmVVY8c4YCJ5A01eyZd616Xq7cfasYnWmkqRUhRWcv/czWNRrgIlA+mKC6+FOpGH7
         L/CwvtHcYF3sFJbBDaYEK8Jndh+fAFat2yqiXbujgrfx/f52fH1pJvI1hqyINkQSBwmd
         C0nQ==
X-Forwarded-Encrypted: i=1; AJvYcCU9vfLhISV9KfAeUhrQmo/4k21DDWSUBFeG4D2SR3WtF6cUSVh3FioKiw7eDOSaYh+bcqgHmd12yVzOV6zuo5ke@lists.infradead.org
X-Gm-Message-State: AOJu0YzebQ0br8oRj32NEcbcMyJHDyCLGyKsgTv+LdM0issyJamPXM8I
	9ekSHeG1wnol5EHMJvfJNa4pwxFO+aTi/IKXSMCWtTNoVN4TJ2tPXfts6iSbDpUQ71kQ
X-Gm-Gg: ASbGncugRIuYLRpiIANXRucW9OI5qJOMNEXAlTKQSVdX8q9Q5F34XIZKECTim1X6TWf
	aQJuXwRU5/n6NdO3N+dV1Wvs64cWYPUt+U2XxsAKU80u77ZmNwAo4nHBnbOuut68I3I95CGPxq1
	PYoBlFJWurlGg4lgfAJi4Gup4gM/pWMl4MclZ5VeBkGCR5GgNrQeACjFWIClSb9MQFIljees7uv
	LqAoYYONvEN3JM5jqlvosDGbDu++0+ALpqhjF1L9Z9SYnGmznBhez681Jsflxk+rgDXTRDG/xaq
	6iUU1YIaIk7RKJL/YYwRyVebLL/nZ2PtsJs=
X-Google-Smtp-Source: AGHT+IGBhNvZrPFXBrP6EMdlDeC9iJtG6LNBbpfeI0Y349BALjf9LLYTf9Dnt8oACeh5pZIUz91ILQ==
X-Received: by 2002:a17:90b:3a0e:b0:305:2d68:8d39 with SMTP id 98e67ed59e1d1-309f7ddd52dmr14596177a91.12.1745734578705;
        Sat, 26 Apr 2025 23:16:18 -0700 (PDT)
Received: from [127.0.1.1] ([2a0d:2683:c100::bf])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-309f782d461sm5080287a91.39.2025.04.26.23.16.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Apr 2025 23:16:18 -0700 (PDT)
From: Troy Mitchell <troymitchell988@gmail.com>
Subject: [PATCH v2 0/2] i2c: imx: adapting the mainline
Date: Sun, 27 Apr 2025 14:16:08 +0800
Message-Id: <20250427-i2c-imx-update-v2-0-d312e394b573@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAKjLDWgC/3XMywqDMBCF4VeRWXeKkzQqXfU9igvJjDpQLyRWL
 OK7N3Xf5X/gfDtECSoR7tkOQVaNOo0pzCUD3zdjJ6icGkxuXH4zhGo86rDhe+ZmEWQiLgrmqpQ
 K0mkO0up2gs86da9xmcLn9Ff6rX+plTBHIlu21Fpn2T26odHX1U8D1MdxfAGDSpRyrAAAAA==
To: Oleksij Rempel <o.rempel@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Andi Shyti <andi.shyti@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, Fabio Estevam <festevam@gmail.com>
Cc: linux-i2c@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Troy Mitchell <troymitchell988@gmail.com>, Yongchao Jia <jyc0019@gmail.com>, 
 Frank Li <Frank.Li@nxp.com>, Ahmad Fatoum <a.fatoum@pengutronix.de>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1745734572; l=1057;
 i=troymitchell988@gmail.com; h=from:subject:message-id;
 bh=DtaW7OP2HYTPn66Jo2Rzozz1dqRdlYrtqq0+MD41MKA=;
 b=UQtKorS1lD5nKkZmkn2u6pSa0dlWJkQzqKzsVPpcbHAb8Slpn66/D3G0oDkLFVwsW3schQyFm
 P7g6OrbvRz9CPWLOHqVmAs8/0owueY6zScF+rcKWD8vSwBXI/eVJbrO
X-Developer-Key: i=troymitchell988@gmail.com; a=ed25519;
 pk=2spEMGBd/Wkpd36N1aD9KFWOk0aHrhVxZQt+jxLXVC0=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250426_231620_975636_A17A5837 
X-CRM114-Status: UNSURE (   8.65  )
X-CRM114-Notice: Please train this message.
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

Since this patch[1], we have new callback function names.
Since this patch[2], we can use `guard` to call `spin_lock_irqsave`
and release this lock when it goes out of scope.

Link:
https://lore.kernel.org/all/20240706112116.24543-2-wsa+renesas@sang-engineering.com/ [1]
https://lore.kernel.org/all/20250227221924.265259-10-lyude@redhat.com/ [2]

Signed-off-by: Troy Mitchell <troymitchell988@gmail.com>
---
Changes in v2:
- Add more details in the commit message
- Drop a useless variable
- Refactor the logic of i2c_imx_isr function
- Link to v1: https://lore.kernel.org/r/20250421-i2c-imx-update-v1-0-1137f1f353d5@gmail.com

---
Troy Mitchell (2):
      i2c: imx: use guard to take spinlock
      i2c: imx: drop master prefix

 drivers/i2c/busses/i2c-imx.c | 43 ++++++++++++++++++++-----------------------
 1 file changed, 20 insertions(+), 23 deletions(-)
---
base-commit: 9d7a0577c9db35c4cc52db90bc415ea248446472
change-id: 20250421-i2c-imx-update-d11d66dd87e8

Best regards,
-- 
Troy Mitchell <troymitchell988@gmail.com>


