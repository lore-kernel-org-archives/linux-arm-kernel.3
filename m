Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD684C79F87
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  5 Jan 2026 12:56:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=en2pW9puE35IFTbs++BWoNNKvbkB1aM3UnUzh6oqOZ4=; b=ij/xUErRHhBmdmsrib7oelKOoq
	QvnRyRvH8FRf0nrX0YIjpBuArkw9k04z9hZLkAdMZP7kwFGZ81bOhwJqteDdxnTATOng5U+mfQBHW
	DHUyEMIIwa4EEMioRQEcs8WYoLxOugTESXMFf7U/CgBeDjbFwMGT1q6U+aE9L5CIYMn8heAduX85z
	o0yKy7EShE8chx3j+CyagH5oKASrxGnsjatUEAo1JWSICW04FcTHHnZ3YhrOrkTMkC9UEn6zS+sRc
	lv8Ls4Y2Hj4xd30YP+83k3KNHTg4DvaE8u9t4HmoUtT9QEWTr4aocIkOPyWo51yhcdgZy6gLbBPCo
	iVBv1/2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vck8c-0000000BMPG-2G0p;
	Mon, 05 Jan 2026 12:56:46 +0000
Received: from mail-ed1-x52d.google.com ([2a00:1450:4864:20::52d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vck8a-0000000BMO4-1lr7
	for linux-arm-kernel@lists.infradead.org;
	Mon, 05 Jan 2026 12:56:45 +0000
Received: by mail-ed1-x52d.google.com with SMTP id 4fb4d7f45d1cf-64d0d41404cso18432110a12.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 05 Jan 2026 04:56:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20230601; t=1767617802; x=1768222602; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=en2pW9puE35IFTbs++BWoNNKvbkB1aM3UnUzh6oqOZ4=;
        b=WsKes/SNSZYBZzffwpWS35Y8Wvn0rA3trU//TiukoLh2911ZLx0pGxBGqx8NZa57ic
         rko5CqeZQTiqdrbByMqEflyjrvEL/i1otHO0x7lGSfCAALScuDsBnqJS/7HSjuAEL+Id
         UUJB+5GZbR5U/A+IZuvaBlFnYsuRIGrLOSt02eQOBRUx8002sLm+tzRyHVwyLa0DrGqP
         s9gKSufLx/5yXwfMCn4+McmKD5BLYUacdoKo6BAfe3ftfJP3aCTbbFlBdT4tD8AHHLUT
         O07bTHBt+BE8CeJ3KZRUm5aQsl/xHFG7Y305UjY4Jk/LyLX34oM3zVktX1gOvM/f1JlH
         Tx2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767617802; x=1768222602;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=en2pW9puE35IFTbs++BWoNNKvbkB1aM3UnUzh6oqOZ4=;
        b=asuq9E7uzsJWRSBt4acpYj4PCSk3zoNcti9bjMUmEv7qncw5CrzP4IvxrPJc8IqU+d
         1aufuvf4hf6ILPNtyaQgufgtYPH1bM7Hn7swrakfiuTMQDqhiFux1frXFEvTObQokGO3
         FwDlyCHBqAY02sOIET39cUiahN1jMiWySd6PKvrczQOkwiHSNxI63HPMY5y1N9UXmlcS
         8qtR7GGsCrDShmMIqAzZDNgzmnrrlSfGkgxen2/6JUN+G+PoYZgZWO+G+0tkvRyUa9tO
         GFVmaH1D0XBMcTmvkJaP3ST8wqUBjquuhXm+3Xp9O9IiVk4MxuxPL7Opn95o90QO7H4Q
         43MA==
X-Forwarded-Encrypted: i=1; AJvYcCVsQAdZn5as3OsojEijiVsgmHZB+w2mDEBjOvVC1x+KFybDpqGQkzdZFdw0ETX0hTBwgmiL3cMGWIAWC8o/WCAT@lists.infradead.org
X-Gm-Message-State: AOJu0YzHJvIAUpLjVcodeKxEkjg+D2QNDScgJWcjrdEfKesmcgH1OYja
	gaq5VHotE66IDuO6ydKeRapmZF84B+uby10/ELe46oistl08OnG+iOEJ
X-Gm-Gg: AY/fxX449JOcqS3Whrys8pnvVwcXyXZMJj636wOCE2zBGGOGcN9DpAYF7hCZVz9ozxa
	LucODVI2wgNeamQiZHQKNlLpHzLn3EhsRsY2Y1MJ7uLzgHt5Y5ZZxo2uLy78lhqGOxt16RxM51H
	oWWX1eXcOw8yLZEMbg8cnSZ7Zz0isEHSTYHZFFHmMQwcwIfhP38WMtIvXiclARG8wDwJk3xdN3l
	80lG3ze+PI4gx98qScrW4El+silZZDbdjgyO64YhicYXuHQ4NZSvxNW8uqbr+hqWyqgmkbt5j4b
	6zI3XgKtFTv/8b74CK5o47utL4YZrUMarfL4/k1g5lj4qsQkFol7yxPIsAIs9JgB+wTDar8svgF
	WtZVKiWCkQOZdyeK9XHOj69R261GbHbCA2pU2NKMsljQRX6gKmbFNjAmCFQPoyiw3Tp23OP2H6d
	6ZRIPNq25kF9HKLmx9T+K61kgKI6HFFBm+PwJMpHJRRqGB3LSd9HxN3YeVUU29VwA9UkGUWq/M4
	8YWJ7dPUBJGBhHxH+yrw/8zS+CD47de+YPoQR6ZTAc9Rl4XfXrW
X-Google-Smtp-Source: AGHT+IGkQHUVn4G1LTfeKcgEt+M7w3okEoSSOC40iYpGOWHCsX59BOszv9hkdCiQgf3kosmWwCeYyQ==
X-Received: by 2002:a05:6402:3587:b0:64d:3b22:a5b9 with SMTP id 4fb4d7f45d1cf-64d3b22a88fmr37161484a12.9.1767617801949;
        Mon, 05 Jan 2026 04:56:41 -0800 (PST)
Received: from blackbox (dynamic-2a02-3100-a8ad-5500-1e86-0bff-fe2f-57b7.310.pool.telefonica.de. [2a02:3100:a8ad:5500:1e86:bff:fe2f:57b7])
        by smtp.googlemail.com with ESMTPSA id 4fb4d7f45d1cf-64b90f53b21sm53582712a12.5.2026.01.05.04.56.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Jan 2026 04:56:41 -0800 (PST)
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
To: linux-amlogic@lists.infradead.org,
	linux-pci@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	bhelgaas@google.com,
	robh@kernel.org,
	mani@kernel.org,
	kwilczynski@kernel.org,
	lpieralisi@kernel.org,
	yue.wang@Amlogic.com,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: [PATCH] PCI: meson: Drop unused WAIT_LINKUP_TIMEOUT macro
Date: Mon,  5 Jan 2026 13:56:25 +0100
Message-ID: <20260105125625.239497-1-martin.blumenstingl@googlemail.com>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260105_045644_467913_203445FC 
X-CRM114-Status: GOOD (  11.12  )
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

Commit 113d9712f63b ("PCI: meson: Report that link is up while in ASPM
L0s and L1 states") removed the waiting loop in meson_pcie_link_up()
making #define WAIT_LINKUP_TIMEOUT now unused.

Drop the now unused variable to keep the driver code clean.

Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
---
 drivers/pci/controller/dwc/pci-meson.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/pci/controller/dwc/pci-meson.c b/drivers/pci/controller/dwc/pci-meson.c
index a1c389216362..0694084f612b 100644
--- a/drivers/pci/controller/dwc/pci-meson.c
+++ b/drivers/pci/controller/dwc/pci-meson.c
@@ -37,7 +37,6 @@
 #define PCIE_CFG_STATUS17		0x44
 #define PM_CURRENT_STATE(x)		(((x) >> 7) & 0x1)
 
-#define WAIT_LINKUP_TIMEOUT		4000
 #define PORT_CLK_RATE			100000000UL
 #define MAX_PAYLOAD_SIZE		256
 #define MAX_READ_REQ_SIZE		256
-- 
2.52.0


