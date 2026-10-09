Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49650CA5FED
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  9 Oct 2026 06:12:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=hisN95+6a7XvPzB2QIk2WRzBl1FPATS6t+0EeJt3NAI=; b=GZC64ltGFsZbIIb2plaTrK+gQ8
	2PKMjlHYCHYVjpAG+FIJjZbFUFBItz3JKbjWg4OMVO1Zoei1MklRmkIwrw56dnOwrisN0t/AlhcYM
	rIltipDmzlK8hJs8AA75ozaiefc/Ia7VZi3VfQMqBRO1xkQ/txXbk0TytjSewfNrZP5BHKjPidMIo
	k+7oXWMKsHtjdi3f6ZQOGto2/UEQlMQ6X93CGLDdrI/U3koKguSc0QBgzTfneKy96QePXoulabYPz
	jmMrZ9Kch958Mpm96oJJSEimKOJsmGsXyvLPuHsYflTkOLzf60bZWMK+/JxGwRFHZAoPkbA7jXz1F
	IRA0h1ZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xF3py-00000005bda-1MWQ;
	Fri, 09 Oct 2026 06:12:10 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xF3pv-00000005bd6-0ofR
	for linux-arm-kernel@lists.infradead.org;
	Fri, 09 Oct 2026 06:12:08 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-4a1682bff3cso30414445e9.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 08 Oct 2026 23:12:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1791526325; x=1792131125; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=hisN95+6a7XvPzB2QIk2WRzBl1FPATS6t+0EeJt3NAI=;
        b=a1/ncXYbZr/6RDAPdBMtQddpfwZgRbmb5p8PZ0d0sSW3pxZMo7Az2vOTJtmk8aY7Df
         aoUg1AnzQqlRJEDDjYVYvd5KguiJw8nd+xghgnf44TWqqziEoMbNYRmt4M0dz2W/bpFb
         VmnEtOxhbvF95M1IPbuqefDLgEtpbt6NDSNv+QU/7bmRyseEUvq8vl+WQ1YP1UaeXzNq
         6ZXD1+t2KCSdvEwQgd81u+f5UvQPzcpf6KUOHQuV7NXg5WsDuOcwluiAgkMKgxEA27WV
         MW6XNG9yGRKoZPzYoRtDBhUtrSuu5xEVZw1Bjvyk7xK+cjcthbIwrbhtvY4KqZxoPw8X
         +vlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791526325; x=1792131125;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hisN95+6a7XvPzB2QIk2WRzBl1FPATS6t+0EeJt3NAI=;
        b=FtJYBuyZB2PMYSFqV+kvB79KyTXxF0Le2qx5itWgg8gCX+HL4ppOFF4giuNtHyVGco
         nUjaoZcycONcXSHkgQzbvdzsu/HLm/ddye95tYAN45WyymIUCGZOF0+mrgO8KNBluR5y
         fMQrQYAUAXXE/OhhSccu891rRTZLJozB8OkrQhcW1fJ3JCPNLWXqAMAE6+ZV4AaTPnim
         opdHLgJT/iLTfClZF/FHUy+LFJ0bnHUKOExb1ljEWcc62D2WbUxpG/4JSmz7QhpCZRHQ
         02kF7NiCCVVRAuMv5Mbc69TxZ86kJIZ5TN24qu/qgLiWse7+RAog9I8tmH/k06cgiGQl
         r4HA==
X-Forwarded-Encrypted: i=1; AKwUvBzgci+uo13nKcKWjI56XfGHg+3hBi365fLtc7pkJEDWbW/GUiNXzUrC78jwII8GuRLRGx5dsDzOm79ZxDdQc83i@lists.infradead.org
X-Gm-Message-State: AFuF++ml4OIMgpz5lbsvZCex7y0yfgEbYn9ZXlNDg/B3SUBxKvqBb3Pk
	kAOHuob5Hraj6H0b5oM/kZj6RyH9Y5vzprKe5j+hcoo5Qt8Hv0PPemi7c7PiiE8Od0E=
X-Gm-Gg: AYBFou38OCCzye5nL5oTGSv+BIQqjITGiU48Cws51h3Bqz256r6HihdCpOltxs+AP2g
	tHdD6gR6EHgi33MAuGL+fcqudgHf3g8JPk9xfnWMJt/JTnEiSoGpdqQ7gCVrRYupVUq2vR6U7lA
	RQPYCty/6+drXumZz675dMJ6BYUt/5g7ZtUN397Kxk/TSoleDBjS/aFYlMd8h5QsYIw20n/psgs
	hP8HRm7A/+GtIF9I+He14qh6NKTvx1el/Zzovl/7+JBCbbp1LPRLbhUo7vxn91IKus940k57QZs
	Cuqmv9slhQnSdLXtba9GKvIGw3Eqdr4gDeHW9NPqBZQqfXRT5TWPj//jSZjkBTZWvrgqvI8eYnQ
	r5+l2qVnevo0XCZJUlOCyB2FtK7j8++hMaB9oT2osAm5w2KnHCwEqx+Ad13RvbkEVkmiHFpNppu
	sT3SVwwBpqbACCwh9mNM6RyrpLoBgVdfLGj+tLZzGniSKi2MyDQlT4gExckt3b6x/A/b5wc8E8g
	EKbYFgB8U5Q8KfHLK5XpSBdEqIubEvsQle3+oXa/bY=
X-Received: by 2002:a05:600c:4747:b0:4a1:77db:45d9 with SMTP id 5b1f17b1804b1-4a18e47aa9amr13922655e9.6.1791526325310;
        Thu, 08 Oct 2026 23:12:05 -0700 (PDT)
Received: from claudiu-TUXEDO-InfinityBook-Pro-AMD-Gen9.. ([82.208.30.17])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a18eb4485dsm39001075e9.2.2026.10.08.23.12.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Oct 2026 23:12:04 -0700 (PDT)
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
To: soc@kernel.org,
	arm@kernel.org
Cc: nicolas.ferre@microchip.com,
	alexandre.belloni@bootlin.com,
	linux-arm-kernel@lists.infradead.org,
	claudiu.beznea@tuxon.dev
Subject: [GIT PULL] Microchip AT91 SoC updates for v7.4
Date: Fri,  9 Oct 2026 09:12:02 +0300
Message-ID: <20261009061202.29652-1-claudiu.beznea@tuxon.dev>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261008_231207_239173_606A2148 
X-CRM114-Status: UNSURE (   8.01  )
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

The following changes since commit cee9395acd8043be0644b25c34bfa86623f2b935:

  Linux 7.3-rc1 (2026-08-30 13:34:40 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/at91/linux.git tags/at91-soc-7.4

for you to fetch changes up to b847099fdcc855b04b017a67bd6d3097ce277175:

  soc: atmel: Convert to of_machine_device_match() (2026-09-20 16:26:50 +0300)

----------------------------------------------------------------
Microchip AT91 SoC updates for v7.4

This update includes:
- replace __ASSEMBLY__ with __ASSEMBLER__ to avoid confusion
- use of_machine_device_match() instead of open-coding it

----------------------------------------------------------------
Geert Uytterhoeven (1):
      soc: atmel: Convert to of_machine_device_match()

Thomas Huth (1):
      ARM: at91: Replace __ASSEMBLY__ with __ASSEMBLER__

 arch/arm/mach-at91/pm.h | 2 +-
 drivers/soc/atmel/soc.c | 4 +---
 2 files changed, 2 insertions(+), 4 deletions(-)

