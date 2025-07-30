Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68E96C83F26
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Jul 2025 13:58:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZI5DAmK+8UZTo8BKllrVIz00Tuglcysu0tyWwoMJ9Vg=; b=mcULxgK8kHBSMg3KT5niNHWKEP
	OEQzJp6KC2WBxGvOP9dufcPWOODtR64UtDmV6u/8iUxzuw5/uekQ0zSr/KY/p+gulCWMOzn1YuLAu
	CrXjdNKjFGoN3P7NKQMaBc3kccTF5kDjxNntxbFw6QrsSeQ5GA58lrooLLFkRlxvI+4j6VnuwEzCb
	fZTEvYA/k1khbAJAydA7qbr6VvHKa+UvDMiYOIsJEPNcsr3Dd1dzXhXKODtDrZNumxU8FTW+BhvxG
	miKGbGXdP5tst5wDAOdX38WxS34FMsJH90NKpd3NSJYjQ86PcSqIdvoFyDWnw/Mq/AY2Js8RcqOkC
	+B03QrPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uh7K1-00000001fj4-17f6;
	Wed, 30 Jul 2025 13:58:21 +0000
Received: from pegase1.c-s.fr ([93.17.236.30])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uh7Cg-00000001e4i-03r9
	for linux-arm-kernel@lists.infradead.org;
	Wed, 30 Jul 2025 13:50:47 +0000
Received: from localhost (mailhub3.si.c-s.fr [192.168.12.233])
	by localhost (Postfix) with ESMTP id 4bsY9h1rxmz9v53;
	Wed, 30 Jul 2025 15:35:04 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
	by localhost (pegase1.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5MxTpDkr189x; Wed, 30 Jul 2025 15:35:04 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase1.c-s.fr (Postfix) with ESMTP id 4bsY9C2Symz9t5l;
	Wed, 30 Jul 2025 15:34:39 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 4F1908B76E;
	Wed, 30 Jul 2025 15:34:39 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id B3TTTuOPHS02; Wed, 30 Jul 2025 15:34:39 +0200 (CEST)
Received: from PO20335.IDSI0.si.c-s.fr (unknown [10.25.207.160])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 32F008B763;
	Wed, 30 Jul 2025 15:34:39 +0200 (CEST)
Received: from PO20335.IDSI0.si.c-s.fr (localhost [127.0.0.1])
	by PO20335.IDSI0.si.c-s.fr (8.18.1/8.17.1) with ESMTPS id 56UDYXEm271745
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 30 Jul 2025 15:34:33 +0200
Received: (from chleroy@localhost)
	by PO20335.IDSI0.si.c-s.fr (8.18.1/8.18.1/Submit) id 56UDYXMb271743;
	Wed, 30 Jul 2025 15:34:33 +0200
X-Authentication-Warning: PO20335.IDSI0.si.c-s.fr: chleroy set sender to christophe.leroy@csgroup.eu using -f
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Qiang Zhao <qiang.zhao@nxp.com>, Linus Walleij <linus.walleij@linaro.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Christophe Leroy <christophe.leroy@csgroup.eu>,
        linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: Re: [PATCH 1/2] soc: fsl: qe: use new GPIO line value setter callbacks
Date: Wed, 30 Jul 2025 15:34:22 +0200
Message-ID: <175388235172.270971.7957080828511695950.b4-ty@csgroup.eu>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250610-gpiochip-set-rv-soc-v1-1-1a0c36c9deed@linaro.org>
References: <20250610-gpiochip-set-rv-soc-v1-0-1a0c36c9deed@linaro.org> <20250610-gpiochip-set-rv-soc-v1-1-1a0c36c9deed@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Developer-Signature: v=1; a=ed25519-sha256; t=1753882464; l=407; i=christophe.leroy@csgroup.eu; s=20211009; h=from:subject:message-id; bh=/o4cDiVkyPr0JbwYVaNEzFDJY8Bq/G7J5zt/xxb12Qo=; b=T8m3DHSjY8I3U43L/rEU2ojmXAySZGPQXNqoopT4g+PYQNfxMX5El9+y8GY8hGY8L71TgIJwE TRZuWcHBtxgDaNODgHwZ2PPCnKlCVyMagmq7d9dn3uva5+yc1VmKmGa
X-Developer-Key: i=christophe.leroy@csgroup.eu; a=ed25519; pk=HIzTzUj91asvincQGOFx6+ZF5AoUuP9GdOtQChs7Mm0=
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250730_065046_206050_FED71534 
X-CRM114-Status: UNSURE (   7.11  )
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


On Tue, 10 Jun 2025 14:38:50 +0200, Bartosz Golaszewski wrote:
> struct gpio_chip now has callbacks for setting line values that return
> an integer, allowing to indicate failures. Convert the driver to using
> them.
> 
> 

Applied, thanks!

[1/2] soc: fsl: qe: use new GPIO line value setter callbacks
      (no commit info)

Best regards,
-- 
Christophe Leroy <christophe.leroy@csgroup.eu>

