Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F878C02198
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Feb 2025 12:59:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=iyY3cdE11o2Hq1NrWpk3ftrZpWXzglM3zy/nv7F8T9g=; b=otyFYfpYnnLNn2cKIbSeWT00S/
	51fB7+vnbnItvj4GxverwZjwZrcbWberYL92KUvMv+7AM3ctI1I0xpy9ASs7EMatUaXV+eDP3xF25
	A/oTjmQsi8S2NgozxU2DSZHuthsAbjItgftkmELtQ+LXqU+SEx2siwgeZ2MeArT2BFgtjzUWI1fKP
	XRusNR0irb5b1lkYoGhd0hRLDuGGU367DvAOCPG0wyUM49P820Z8iZSPndyd5HnWz/h4YSK8hoB0E
	FLronzRt+EjBbmjIx92y2NboBNnXZLNQtHu6ESrCL5cgDlG5Jh9zc4Xr4mwK0hohEFOwWvhZjooPt
	YHe+wyAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tkNBu-00000008DoM-0sXv;
	Tue, 18 Feb 2025 12:59:10 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tkNAQ-00000008Dbx-1Otw
	for linux-arm-kernel@lists.infradead.org;
	Tue, 18 Feb 2025 12:57:40 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-43995b907cfso3344045e9.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 18 Feb 2025 04:57:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1739883456; x=1740488256; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=iyY3cdE11o2Hq1NrWpk3ftrZpWXzglM3zy/nv7F8T9g=;
        b=u5ZBJ7U9OfgD6C+7F6htS+KS4OpM72V8apfxZEnSWiP3+t2BrzRRe/a5q9/3elAVva
         qpyV4Y3/QvF5PWIPJxRrIuvm+Rg7LEyLkEhPKIKC0o4jjJ/HXPAmKiQJO7r8NietgcYE
         IlfNP7id1Y06Ie+quf9ZCYBxjmJU8pdCwi90fGLt6Tq0U94xlh6tXZjcmpm0srlmHsyT
         ST8f5HZxOv84imHZY+TIvn5OGj+5NHi8ZyiJOOPFAubXpZ6QFfzJmKq3oYp2O5AOerj0
         xa//09tiv3tAj0M7FbcmSTNpf6xWyO7o4DwVF4MChUKEbJaai0EaCgNGk6dFSnkwbFOT
         NkDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739883456; x=1740488256;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iyY3cdE11o2Hq1NrWpk3ftrZpWXzglM3zy/nv7F8T9g=;
        b=roBNqFkboQywTgYfa0q+QOQgouCPiCu+cnzjZBHt4suIUdCerrG6ADLkXpfwpuP8Wf
         OYWCjkatoLoxCHhKnScTgD7mYxT3fwUtLn3uItnj8jcl7RP3uDr/Sr/Fo86M7MewCTmw
         XfmEuYxOj8/BPF2Xf0TMnQDvcqGWViwtDwq40bXs0t0EZ1l+rZjVMlhjCVVyIdMOwkAE
         D6GbYDZt4k+pD1QV+QWWbnNhm2nuFlsao2VnYd+XAwSFZLAOQDcKQM5UmnmC4FFHfKbG
         qaNMBuR0rXSTo9pngLjsuvAI3+oNQrhA01oSWRPPByJRqrpIKjPrNqkKhTfrhkGsORog
         1FSQ==
X-Forwarded-Encrypted: i=1; AJvYcCVfATrAOft09nzzN+SN/EtpnKPL7RD2r7N+2l0UKpQdVxn7oPExO9P/A21Nl66cPjFx73P24ItcZcVEThqpnmb3@lists.infradead.org
X-Gm-Message-State: AOJu0YzxsM9rr3HMWiPzI5cI679M//0oHfXtEfU15J6DIVZIeq4esLT3
	J0bZVBWGryUo/dmdfSjc9nPEQWUDtR55/hP+G04CE+pqefiwji2fOPXlNPqbFhTbR+1D2S2am70
	H
X-Gm-Gg: ASbGnctF4Nxfve0jM4B/sDB/j3pb6xNuDik+wAe/t4pd9YCk6CXtTAfqqvY5myCzo8W
	hgDUC1HrMqwAHCOaZ3/9lVy8BsvVB4/9quwKjruHhTQFaYyO4vkKu385Abd72rjZCpFcqbyKhwz
	ahQKbccXlYUd1sUzCn37sRv31+ehXBwxSI3YggS6piz1NnxfvQGgPBsMA+Cen3vWQGVIi+cvikP
	6u2Zup/21G6QYjefZxjdFbL64bRaVokLjBtL7OuHyLwihuH/1C5i21I+ef/bO72qQJN4VIK9dJN
	CfiviITGGAxEIUIf2GQ=
X-Google-Smtp-Source: AGHT+IEtE+TYwufyBI6Y+xikUzOIEu3Qh2/mlCAbkWqlJNQx7IkfumfWZLkaerK2JUgf8XedhMemIw==
X-Received: by 2002:a05:600c:3b12:b0:439:96b2:e9b with SMTP id 5b1f17b1804b1-43996b212d9mr15246635e9.9.1739883455734;
        Tue, 18 Feb 2025 04:57:35 -0800 (PST)
Received: from [127.0.1.1] ([2a01:e0a:e50:3860:65d3:d915:ef89:ac43])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43987088ecbsm50009405e9.31.2025.02.18.04.57.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Feb 2025 04:57:35 -0800 (PST)
From: Guillaume La Roque <glaroque@baylibre.com>
Date: Tue, 18 Feb 2025 13:57:19 +0100
Subject: [PATCH] firmware: config: ti-sci: Default set to ARCH_K3 for the
 ti sci driver
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250218-ti-firmware-v1-1-7a23aacfb9d3@baylibre.com>
X-B4-Tracking: v=1; b=H4sIAK6DtGcC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1MDI0ML3ZJM3bTMotzyxKJUXcMk82TzNBML01TTRCWgjoKi1LTMCrBp0bG
 1tQCUwUg4XQAAAA==
To: Nishanth Menon <nm@ti.com>, Tero Kristo <kristo@kernel.org>
Cc: Andrew Davis <afd@ti.com>, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Guillaume La Roque <glaroque@baylibre.com>
X-Mailer: b4 0.14.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250218_045738_628389_03107778 
X-CRM114-Status: GOOD (  11.53  )
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

Defaulting the build to ARCH_K3 for the TI SCI driver.

Signed-off-by: Guillaume La Roque <glaroque@baylibre.com>
---
Link to comment done on last serie [1] we come back on first version of
series[2] to not use imply but set deps on ARCH_K3 in driver directly.
An other patch will be sent to update Kconfig.platform when this patch
is merged.

[1] https://lore.kernel.org/all/20250123-timodulemailboxsci-v4-1-b1a31b56f162@baylibre.com/
[2] https://lore.kernel.org/all/20221122202245.449198-4-nfrayer@baylibre.com/
---
 drivers/firmware/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/firmware/Kconfig b/drivers/firmware/Kconfig
index 9f35f69e0f9e..109abe063093 100644
--- a/drivers/firmware/Kconfig
+++ b/drivers/firmware/Kconfig
@@ -215,6 +215,7 @@ config SYSFB_SIMPLEFB
 config TI_SCI_PROTOCOL
 	tristate "TI System Control Interface (TISCI) Message Protocol"
 	depends on TI_MESSAGE_MANAGER
+	default ARCH_K3
 	help
 	  TI System Control Interface (TISCI) Message Protocol is used to manage
 	  compute systems such as ARM, DSP etc with the system controller in

---
base-commit: 2408a807bfc3f738850ef5ad5e3fd59d66168996
change-id: 20250218-ti-firmware-1b7c7f485e5a

Best regards,
-- 
Guillaume La Roque <glaroque@baylibre.com>


