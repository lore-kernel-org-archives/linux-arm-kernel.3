Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78CF7C83038
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  1 Jul 2025 18:31:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=zu/aUYBf0PlNS00AS61bNHCusGOm1IQrumCJLXD9I7E=; b=2FMzHQPHC5bpTKQNXRWlShEnoI
	+e9hTfOqFytt9p16KsqpdfhvExE/b0Pld2091W9k1UTkY8WhVvP0boMpIK1omwnsKctJoGr1VxpwN
	1m25MJ7pdRuSA63UK7AqjgeBKTMAobzzH5JjRHRnYleDYN4fsLJDze515v8QkpjftlRmDh/QBsGEE
	PrpIZKNVfM1Ib1DI/6a213eEhUWEqEMAW/VQ+bl9kGNglhCThu2EijbJ2t4B0XtBgkc1lL2jXio5h
	6Dtnish5XDaE099ZYekBz8oA4YzHW2GtRj7wxRbWVGOkJrDtpEYSmaWIlbAXiaeZOhQImYzf2G4cF
	b68jjWVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWflO-00000006KqO-1MB2;
	Tue, 01 Jul 2025 18:31:26 +0000
Received: from mail-ed1-x52d.google.com ([2a00:1450:4864:20::52d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWd5Y-00000005uxB-10UQ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 01 Jul 2025 15:40:05 +0000
Received: by mail-ed1-x52d.google.com with SMTP id 4fb4d7f45d1cf-60c5b8ee2d9so12767294a12.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 01 Jul 2025 08:40:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1751384403; x=1751989203; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=zu/aUYBf0PlNS00AS61bNHCusGOm1IQrumCJLXD9I7E=;
        b=Cbz7YOWFUpBuPELtJdTaXyJ6yWg2RoOKvGZt6kM73tEi2H7Jo2sS2wYnKAokxHh5sm
         +6MvugTtatMCoX/NGv1CuFuaOdCNIIomrG9E0KgYkt1x9CIMSVYX1y16Zml8po5GAltZ
         ofzpvjJ7kgVenuV4ICMEQSJdZeVGd3EQ3BB8cJC7fV+3hjJDYs56dr6WSJ88Xnks8rB/
         01+DV+MH3bCyYDlsHg0es/DkbMg661/3ZuFQQWa85jZSX3F//zISKlEBDYhqKM4Z96rP
         UshndXYkpuqX6yP49AZNNOWvv6X3QIpotp07kKZu/ISKOlquQD5L4z24TGyEPlSH6A+O
         7BKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751384403; x=1751989203;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zu/aUYBf0PlNS00AS61bNHCusGOm1IQrumCJLXD9I7E=;
        b=aFcfIZS+FsHnEfM2gqKkceMXU9neKXpOWvsBn5DDu9OWio0zdSfDlHXFe6qjxMnimK
         OI/gOBS5uKrkMUYCH/5U9Iqs4hbgdQZUr4b5b/TF3l2xh9LxpK5Ck5jS5JwH9u5+Qbtu
         Pv/h9Z1t2m3lrpMAnSUGgebmaQk/UUw5l2xGblEZbwuZedb9mePoxSHh74OahXAvcCXH
         Q79mfm4c6CUJOlh93EPKrgwhnEPWvPU3LBEVQhLw2EYvoyrcq7yB+R4i+x84gE7+uyPs
         zRBnb98vsJ1QfQhmR754tB++PUIwRVqpo9qw+QRCT7l4CD1Ah7VT/btNH+VnNYV1CrtO
         FGhg==
X-Forwarded-Encrypted: i=1; AJvYcCWKfulTq3FgOmo1AoXEVh3vfQoT2nKUJNArordAta3ygPbGRC9AJ4LV18os9gAtTysMFbCJDOkG2prjVsuuHYfu@lists.infradead.org
X-Gm-Message-State: AOJu0Yw2Y43DDu5YbJ9fJDypXINjFBoORXf/4UujN+yU/eTUSisjTsvC
	ZFE3PhHEuhf3FucW4toxI4+sxwMbyVzVY5QMpijz/6bts/QTIsMvCep7OU2udKtOTd8=
X-Gm-Gg: ASbGncv01EdbG+BiXCrRiXeSJjbPEwf7/btkDpqqChcRknSQ5059B0FTURXr3eHg8fE
	PQFMjQ08h6ktt0EFQwhOPZEUq2ocLLmt/mlrRl0Yu0DnYDKslQUgWyCkB8YcDQh2MdK3EGRLY6e
	bv2mP3Myrz0Sm4Eu8pjaq+4TlH6axt7LKuy2sf6hgaWQXBda7D25V9YHcoM5isWYtZr3JNgOS67
	SWEvwlgKGt+44AO0uEFrsBI+vaGCpwmClZSg1Adjl+BccZPjaIPEDDzX0VsdnRvJ6QMUTwf+iUj
	x4SIqoPdegYFw/EURxAwcp7KX16GNQPu2zoQd6w7K1VcJFosZ+PFTTmcPUvWEFZ25FAJv/a+3v0
	eOOYpzozs77MEgEDhcsCeDeoUkikT
X-Google-Smtp-Source: AGHT+IFbVlpj3QgOb1lb2mwjuHq/uY0ogPM6n+DDSiv55WQWMetHGs7+SzXxABdKNyldpmd3rH0BFg==
X-Received: by 2002:a17:907:3c89:b0:adb:2e9d:bc27 with SMTP id a640c23a62f3a-ae3501a3fdfmr1843016566b.54.1751384402511;
        Tue, 01 Jul 2025 08:40:02 -0700 (PDT)
Received: from localhost (p200300f65f06ab0400000000000001b9.dip0.t-ipconnect.de. [2003:f6:5f06:ab04::1b9])
        by smtp.gmail.com with UTF8SMTPSA id a640c23a62f3a-ae35365a149sm902911966b.64.2025.07.01.08.40.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Jul 2025 08:40:01 -0700 (PDT)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Daniel Lezcano <daniel.lezcano@linaro.org>,
	Thomas Gleixner <tglx@linutronix.de>
Cc: linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	Markus Schneider-Pargmann <msp@baylibre.com>,
	linux-kbuild@vger.kernel.org
Subject: [PATCH] clocksource/drivers/nxp-timer: Don't call platform driver struct nxp_stm_probe
Date: Tue,  1 Jul 2025 17:39:56 +0200
Message-ID: <20250701153956.151075-2-u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1766; i=u.kleine-koenig@baylibre.com; h=from:subject; bh=xIDuTWlVNtbxYRGDgUiY1kjsuLGle4dbWyJlIAE+380=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBoZAFMd9hfYvSDdH6NlNBCtd+mWzxIpcu7SzyJL Vv4ihk8tK+JATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCaGQBTAAKCRCPgPtYfRL+ TqoQB/4rMtlq6IeeAFEak8bwAIxskqFVJckOHDLYXcaqI/AQtZonNEwemRE5kIU49xfq0xBknb8 WhbD/au1vD8NX+pejwkunkUi5xvElERYZRYVKvWQFVAEw1BMBdrlv6kvnn9TWJxTv87WAynCtIr SWR2UwkRj10qxtpywXotdOkYjDCLCgCiKaFSTrrIk++QUOF9RPF0U3BaPi73Klw9UXo4ULu9ezt BnyyX4XQ5OcLWlmOo/xIXUBxTEGqeZe62jhHXhB1ulxXU/EVYUhc5JrgqSiEIHGhO7DLzxbILD3 MET4Jx+ac2dRs2Nzp2FOUYMXZilVx0hHfkvu/t9LewvM9oqj
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250701_084004_283290_98A1B162 
X-CRM114-Status: GOOD (  17.24  )
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

There are a few rules in the modpost step checking for section
mismatches that depend on an object's name. The checks for objects with
a name ending in (e.g.) _probe are more lax than they should be for
platform drivers.

So rename the driver struct to end in "_driver" which is the common
thing to do.

Note that this results indeed in a section mismatch, i.e.:

	WARNING: modpost: vmlinux: section mismatch in reference: nxp_stm_driver+0x0 (section: .data) -> nxp_stm_timer_probe (section: .init.text)

that should be fixed. If the relevant device is already available with
all dependencies probed when the driver is registered, the right
approach to do that is using module_platform_driver_probe() instead of
module_platform_driver(). Otherwise it's more complicated.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@baylibre.com>
---
 drivers/clocksource/timer-nxp-stm.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/clocksource/timer-nxp-stm.c b/drivers/clocksource/timer-nxp-stm.c
index d7ccf9001729..1a70c9013921 100644
--- a/drivers/clocksource/timer-nxp-stm.c
+++ b/drivers/clocksource/timer-nxp-stm.c
@@ -482,14 +482,14 @@ static const struct of_device_id nxp_stm_of_match[] = {
 };
 MODULE_DEVICE_TABLE(of, nxp_stm_of_match);
 
-static struct platform_driver nxp_stm_probe = {
+static struct platform_driver nxp_stm_driver = {
 	.probe	= nxp_stm_timer_probe,
 	.driver	= {
 		.name		= "nxp-stm",
 		.of_match_table	= nxp_stm_of_match,
 	},
 };
-module_platform_driver(nxp_stm_probe);
+module_platform_driver(nxp_stm_driver);
 
 MODULE_DESCRIPTION("NXP System Timer Module driver");
 MODULE_LICENSE("GPL");

base-commit: 1343433ed38923a21425c602e92120a1f1db5f7a
-- 
2.49.0


