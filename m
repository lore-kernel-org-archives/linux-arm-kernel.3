Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC93BCAC592
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 22 Sep 2025 15:20:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zuVT/NXt6gs791D+SZCmhqxz/igNEd5Yz8i1Mnw+YiE=; b=HbVcGQ2+vR+XTIA0r8cyVWYrDs
	HEvz6Oi/ZEi1MsGdlqH/fz77WxEfr8oscX9IAvFFepPgvDsn0iADg5WO5ugL97us3TqORr2uvrMf4
	QvSNCjIrbJSSnkAWqUchtfmOkJrKBc1jlWiyYmOz+gsJfTgjWVU/kULGty9r4HQLaqZUZWejuhRfg
	BaoxoQWko1C/Xpaa7hHTe8ozZeiQO+GYS0+2i7KPVj85z/Ebl/oz4JhLO7+4QxQ8+CmVgPiB7dfiJ
	bJ0eIAsrpvCy0devNRlMQiBqq3/hOk57ac91vdcZJ6yWx/5bi+K3LJUn4mU904+SlldtOKWDg+Yz3
	B8jEhKsg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0iLI-0000000AmgH-0CUC;
	Mon, 22 Sep 2025 15:20:40 +0000
Received: from pegase2.c-s.fr ([93.17.235.10])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0iLF-0000000Amdz-1TJH
	for linux-arm-kernel@lists.infradead.org;
	Mon, 22 Sep 2025 15:20:38 +0000
Received: from localhost (mailhub4.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4cVmQ46hrnz9sSS;
	Mon, 22 Sep 2025 16:55:56 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id yAj35bzrK7Eo; Mon, 22 Sep 2025 16:55:56 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4cVmQ45vFpz9sSN;
	Mon, 22 Sep 2025 16:55:56 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id B53D88B768;
	Mon, 22 Sep 2025 16:55:56 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id Wc8vrIHa2uK1; Mon, 22 Sep 2025 16:55:56 +0200 (CEST)
Received: from PO20335.idsi0.si.c-s.fr (unknown [192.168.235.99])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 3A1E68B763;
	Mon, 22 Sep 2025 16:55:55 +0200 (CEST)
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Qiang Zhao <qiang.zhao@nxp.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Christophe Leroy <christophe.leroy@csgroup.eu>
Cc: linux-kernel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-arm-kernel@lists.infradead.org,
	linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: Re: (subset) [PATCH v6 0/7] Add support of IRQs to QUICC ENGINE GPIOs
Date: Mon, 22 Sep 2025 16:55:46 +0200
Message-ID: <175855270809.96300.15498969212421871816.b4-ty@csgroup.eu>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <cover.1758212309.git.christophe.leroy@csgroup.eu>
References: <cover.1758212309.git.christophe.leroy@csgroup.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Developer-Signature: v=1; a=ed25519-sha256; t=1758552948; l=721; i=christophe.leroy@csgroup.eu; s=20211009; h=from:subject:message-id; bh=aYbrvM60FKtWFyNikef1uJvt0soMLPkWIUod5zKQIfE=; b=o2vh0AbkgZRDTZfD+sDgtiYH+hiDvCfPGLBCRbBvfV9mgwoWZUllSFmykcseyTH9sUcVFu429 IYzJdwjwgF9CXkzFUSH2+wxK1i3QMoVm1UnTnl//mmS0VCVqqVvVmhE
X-Developer-Key: i=christophe.leroy@csgroup.eu; a=ed25519; pk=HIzTzUj91asvincQGOFx6+ZF5AoUuP9GdOtQChs7Mm0=
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250922_082037_560900_B3937AD7 
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


On Thu, 18 Sep 2025 18:23:20 +0200, Christophe Leroy wrote:
> The QUICC Engine provides interrupts for a few I/O ports. This is
> handled via a separate interrupt ID and managed via a triplet of
> dedicated registers hosted by the SoC.
> 
> Implement an interrupt driver for those IRQs then add change
> notification capability to the QUICC ENGINE GPIOs.
> 
> [...]

Applied, thanks!

[2/7] soc: fsl: qe: Change GPIO driver to a proper platform driver
      commit: 156460811def1ae699eebe40d9678e4ce3d1d9bc
[3/7] soc: fsl: qe: Drop legacy-of-mm-gpiochip.h header from GPIO driver
      commit: e9713655b29a47d23cbf07aacf50b0ce8ee0a850

Best regards,
-- 
Christophe Leroy <christophe.leroy@csgroup.eu>

