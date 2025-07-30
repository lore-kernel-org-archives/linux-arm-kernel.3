Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 718A9C83F26
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Jul 2025 13:55:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=p08GgTAtNuoUw16P9wD9ly2Q678Qz+Rj1+xTjHzeSgg=; b=G8Fn9aWJMLqaoG19YExLwNNtZO
	JH2mOVtf5X+eu15dPc/ZodRKnt0dnJcri+gu3DCT2xvSKMyEpJsMp4l4XaatYlSESO/QkJWxsu+cF
	wTNUt3GWRSgOozwv3AtjnNvYjf6mz9K0nquuxVgzTae9acV+k6BeQamJNujoxWhsg0cTEVcBobfnN
	feyCOx7ZAB1DH9T0vXVlWvfXUP1iddLkNTIU2NvEQzWoLbXyEyZp/cx3f/7wNOsg0ChEYxI5IBg/o
	4xlN9IR1LEc+iJcsGEwWwEOzX5pijpp/ixW+P6dDZn77Bb0QWoQJN9ndcjGbNYSIahnDwmZR4nVDZ
	J/wipJWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uh7HY-00000001fCp-1jvb;
	Wed, 30 Jul 2025 13:55:48 +0000
Received: from pegase1.c-s.fr ([93.17.236.30])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uh7Cc-00000001e2e-2Csj
	for linux-arm-kernel@lists.infradead.org;
	Wed, 30 Jul 2025 13:50:43 +0000
Received: from localhost (mailhub3.si.c-s.fr [192.168.12.233])
	by localhost (Postfix) with ESMTP id 4bsY9j1CV8z9t5l;
	Wed, 30 Jul 2025 15:35:05 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
	by localhost (pegase1.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5ImwirM9pu7i; Wed, 30 Jul 2025 15:35:05 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase1.c-s.fr (Postfix) with ESMTP id 4bsY9G3wCmz9t9W;
	Wed, 30 Jul 2025 15:34:42 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 80A968B76E;
	Wed, 30 Jul 2025 15:34:42 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id QWsmRx-KqxQF; Wed, 30 Jul 2025 15:34:42 +0200 (CEST)
Received: from PO20335.IDSI0.si.c-s.fr (unknown [10.25.207.160])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 663D88B763;
	Wed, 30 Jul 2025 15:34:42 +0200 (CEST)
Received: from PO20335.IDSI0.si.c-s.fr (localhost [127.0.0.1])
	by PO20335.IDSI0.si.c-s.fr (8.18.1/8.17.1) with ESMTPS id 56UDYYp8271754
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 30 Jul 2025 15:34:34 +0200
Received: (from chleroy@localhost)
	by PO20335.IDSI0.si.c-s.fr (8.18.1/8.18.1/Submit) id 56UDYXEC271753;
	Wed, 30 Jul 2025 15:34:33 +0200
X-Authentication-Warning: PO20335.IDSI0.si.c-s.fr: chleroy set sender to christophe.leroy@csgroup.eu using -f
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Qiang Zhao <qiang.zhao@nxp.com>, Linus Walleij <linus.walleij@linaro.org>,
        Arnd Bergmann <arnd@arndb.de>, Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Christophe Leroy <christophe.leroy@csgroup.eu>,
        linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: Re: [PATCH] soc: fsl: qe: convert set_multiple() to returning an integer
Date: Wed, 30 Jul 2025 15:34:23 +0200
Message-ID: <175388225169.270550.11152208847309594157.b4-ty@csgroup.eu>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250721131511.75316-1-brgl@bgdev.pl>
References: <20250721131511.75316-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Developer-Signature: v=1; a=ed25519-sha256; t=1753882464; l=399; i=christophe.leroy@csgroup.eu; s=20211009; h=from:subject:message-id; bh=HnFftf19nbxbzRIzCXYRHL3Xne0RgZpbO7Z5YU6Gs8k=; b=jgrphHn/SaT3HhwtKAqT2ZOMETfLzyu0+6ajFuPkjx8YrmtBNGsTYaWFXkKiMYa6rt0KPIVXT vpYgu7zuB3tDrpXXojgB7IzPMrUz+7j3w4Jpp/m7ofw9yl+biDU2ER6
X-Developer-Key: i=christophe.leroy@csgroup.eu; a=ed25519; pk=HIzTzUj91asvincQGOFx6+ZF5AoUuP9GdOtQChs7Mm0=
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250730_065042_721509_C2B2EB7E 
X-CRM114-Status: UNSURE (   7.31  )
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


On Mon, 21 Jul 2025 15:15:11 +0200, Bartosz Golaszewski wrote:
> The conversion to using the new GPIO line setter callbacks missed the
> set_multiple() in this file. Convert it to using the new callback.
> 
> 

Applied, thanks!

[1/1] soc: fsl: qe: convert set_multiple() to returning an integer
      (no commit info)

Best regards,
-- 
Christophe Leroy <christophe.leroy@csgroup.eu>

