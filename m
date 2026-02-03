Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10006E87841
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Feb 2026 15:44:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=wtQMwL+gjxGfGoTNzWyOYhGjyrQbkqCiIsEn6qxeGvQ=; b=2KnM8LOfHECCLW
	H0jbw+ntjmhhrZqkhyRrQXRdqSCrX31Z5t1l9mFkFEy5iHUeKnWtukCDDml/yrEIUmKGZgIyv8L5p
	4dgVAamodJVlgY9WC9/fThjK0FO0otMwNgc+y2cnLY5n/ogohB/ULUBLJbFYy/DRfkLfEfYmcCQB7
	E9ba6sHemCUhu6frhsOpN3fE1ifPfA6nqc8C0Jt1BYAYFZ72Ziw4kpJrmDf76FvlXmalIka/NPDwO
	Iqn2x4IRlO2X8GgGrz/yYDP49kXTDWDuzXevBnWT4jDvnuW+5PytL2iI1gUQec6AsajVWJ7WiOOP8
	wTA+xou2LqBNjJ5aj/lA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnIa3-00000006rB4-3Ccy;
	Tue, 03 Feb 2026 15:44:43 +0000
Received: from mail-oa1-x35.google.com ([2001:4860:4864:20::35])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnIa0-00000006rAe-1d5D
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Feb 2026 15:44:41 +0000
Received: by mail-oa1-x35.google.com with SMTP id 586e51a60fabf-40427db1300so3585164fac.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 03 Feb 2026 07:44:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770133478; x=1770738278; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=wtQMwL+gjxGfGoTNzWyOYhGjyrQbkqCiIsEn6qxeGvQ=;
        b=MB95mnXgxQqdKKyzqQ4LGdqfq0eeQplCxEpjscKeGq+Hxr7iUFaF3RvJaosufzbfOa
         HFDs9No7lupL9GmvMQi0fsYkm99dQQA2IuFotWFqKgYyltW2XKFoOsX1AUc6FW51JpSq
         zhU9ZNLn71t5D4UnmVb/mveTLF32qG4k39y3kr0PuPnmS34qfXIpNfFGZuURQxEAcRu/
         6HbCn4MboQ6sqLoRrHs59qrtkvMjw2IPcxcv4CYqoaAkL/G8dPNZCgev71F8mVlJAZCJ
         5+DuownDDqtmyMZWkCz7huPTiaSaruKSD7n8l/mpnMzhgjOkSw2G/VJP2Mw8TpR1PZVg
         sN4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770133478; x=1770738278;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wtQMwL+gjxGfGoTNzWyOYhGjyrQbkqCiIsEn6qxeGvQ=;
        b=I4Tn3otOsTyHCwnS+CYCRx89KHUr4YWWM+LsAm0/wosjBMzoqsz7sYcXEskfn/PjPY
         F1oE65gvJHnDYAzdRnurgHG3dfNvSbeT/Nnj55sz/GKcoymvW92ptSDszypPhss91JWz
         fDHGmOSeWGgXLyHtChDsbJQ3N8E6ifvtATqQ7py6aoM4Ae08ILlIbErS9V3+njuj6OB2
         fhqByHpwoHeD4EN0CMDTr/hIHJVT0rSGX88lw4g+ACBKtLervL5/RyCIIXHQbjTfQA0V
         paWxDQUfMNNpFjSGPV1hN7Nn2QpQNc41NkGtXmgRndUvCF69NAHNtoBlJRE3hlAn9P6Y
         nhxw==
X-Forwarded-Encrypted: i=1; AJvYcCX1EQqs6YNT+tQWTdTUIqa0S9SyHvyAqfZplyhxiYjwlyzlm30eVwSBFAftbKmqrA4mWBW/hT76NxnLu5VCV+Pc@lists.infradead.org
X-Gm-Message-State: AOJu0YzgiQlt7HBjZyIE+4dKsDiAvPmdQiL1EJpkIPeSfToq6DPm8MpU
	jVeOf/fuogtL/xT08b7qgwOPwMOYd2JH3kTvZ4b7kqCjZ8hMFOpv7jDzNrTlDQ==
X-Gm-Gg: AZuq6aLZp6iU3Q0/sBUsSrBkyCEc6LzZ3tBs8+1OGhrlgngWSMq5GfdI5aOhuAy8hzy
	qtBXLTQP4AT6HaVrXwzB0Ys3XbZrKdaSMbjshSQdQScnssUMyd9ipp6YOKIUyhGVfMS7vPaao+D
	+ZabPs4bmVAj1ezWbk3KS/HHS19gidDjGScCP2CDpRD3xQ49nPreSbsO6glktpE3orRhn3K8Rzc
	AcpF6WiO2ST9WKsvUSk+fQhaN++r+Mo6mrg8mhUIMyvx8u8JS/2U5TgJOO5Ntr/XLsSRcVpzruH
	SqZbSGDFtVXXGlbRq0VOvsblxvg7Iascjl2xVdhYA1ww8v40ZH7b0aMvZCze2wMdnmzWoV0pjkf
	tDgt7rLLRwMIZYoID0Nmfzpkud955q0h3vdnPrVr1gV1p/RKaZvYt09uY0KtjZRN0amK5mBicYI
	1rK0Drb1tYWGYn9BVIlMv1DSFrQQ==
X-Received: by 2002:a17:902:d2c5:b0:2a9:410:23f6 with SMTP id d9443c01a7336-2a9041026f0mr92040735ad.41.1770127689433;
        Tue, 03 Feb 2026 06:08:09 -0800 (PST)
Received: from junjungu-PC.localdomain ([2408:820c:9008:ba52:f091:7dff:927e:f788])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3543d52c396sm7694684a91.4.2026.02.03.06.08.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Feb 2026 06:08:08 -0800 (PST)
From: Felix Gu <ustc.gu@gmail.com>
Subject: [PATCH v3 0/2] clk: imx: imx6q: Fix device node reference leaks
Date: Tue, 03 Feb 2026 22:07:56 +0800
Message-Id: <20260203-clk-imx6q-v3-0-6cd2696bb371@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIADwBgmkC/22MOw6DMBAFr4K2zka2+VPlHlEKYxtYBXBiRxYR4
 u4xVBQp5+nNrOCNI+OhSVZwJpAnO0dILwmoQc69QdKRQTBRMJ4yVOMTaVqKN9Yqa6sqzTslCoj
 /lzMdLUfr/og8kP9Y9z3Sge/rv0rgyFF0MtMy17Kt8ls/SRqvyk6wV4I4m/xsCmRYsqzkWqu6N
 uxsbtv2A/dBS6rcAAAA
X-Change-ID: 20260130-clk-imx6q-9c4b8835fc26
To: Abel Vesa <abelvesa@kernel.org>, Peng Fan <peng.fan@nxp.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Lucas Stach <l.stach@pengutronix.de>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Akshay Bhat <akshay.bhat@timesys.com>, 
 Ranjani Vaidyanathan <Ranjani.Vaidyanathan@nxp.com>, 
 Shawn Guo <shawnguo@kernel.org>
Cc: linux-clk@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Felix Gu <ustc.gu@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1770127681; l=776;
 i=ustc.gu@gmail.com; h=from:subject:message-id;
 bh=XcqnFlVFb+q5pUp+ILYhKu8XvgoxFm9HCTOCAqQXxGs=;
 b=9FwXxjEanYN+X2SsRmYYg5nYD3FjoF7puIvCUqknvObRBF9hSGgd5rmBb+yfTfG4X77VFQCXa
 zUXyP8e/jRKAvZ/07IQQn4uKCxHEPJrH5u1qmIMtlPHyQ2Mph+MdV9L
X-Developer-Key: i=ustc.gu@gmail.com; a=ed25519;
 pk=fjUXwmjchVN7Ja6KGP55IXOzFeCl9edaHoQIEUA+/hw=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260203_074440_440004_DD91FD6E 
X-CRM114-Status: UNSURE (   8.61  )
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

Signed-off-by: Felix Gu <ustc.gu@gmail.com>
---
Changes in v3:
- Fix Frank's comment
- Link to v2: https://lore.kernel.org/r/20260131-clk-imx6q-v2-0-70471ddc99e0@gmail.com

Changes in v2:
- Fix device node reference leak in of_assigned_ldb_sels()
- Link to v1: https://lore.kernel.org/r/20260130-clk-imx6q-v1-1-2fa4da5dab85@gmail.com

---
Felix Gu (2):
      clk: imx: imx6q: Fix device node reference leak in pll6_bypassed()
      clk: imx: imx6q: Fix device node reference leak in of_assigned_ldb_sels()

 drivers/clk/imx/clk-imx6q.c | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)
---
base-commit: 33a647c659ffa5bdb94abc345c8c86768ff96215
change-id: 20260130-clk-imx6q-9c4b8835fc26

Best regards,
-- 
Felix Gu <ustc.gu@gmail.com>


