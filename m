Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61F7ED6CFA3
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 22 Jan 2026 18:41:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=IqerNtZd/2eIPu0s74sVae5mDkPG9QDd8bnivU2GUiA=; b=DJ6Do+K7RZkQd96ZpM4xUDn3RY
	wiBf6DV9oQeV0sGIHHjcgUCnNIhWcu3JJUprsGl6YsNrOMPhgsVo6z6/KyglpXA9Fjk0s6veSMBGv
	EVjRlpW2jc382OEikhtygWOF8Src80puklZp1TKnFMBlEKdlkzaQafHZ/n1PwTE7t2ij+XqpSWigH
	bTAyAOPsv+x1B02lX/IzKst6zls626I/L4iLjR+tNoHbgon0rQf8jXl1s7uzBMnSPUDJ7uoMdjia4
	++ry+5gVgpqNgPQj9k4EQFGEAmWQQbri/gAG+vaE7PGpkE/jxL9KKT2ppT2hR3cFZHI8+XPTAbc/2
	lfSPMfcA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vizcd-00000007ePY-1vwP;
	Thu, 22 Jan 2026 18:41:35 +0000
Received: from mail-pf1-x430.google.com ([2607:f8b0:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vizcX-00000007eOF-3J0r
	for linux-arm-kernel@lists.infradead.org;
	Thu, 22 Jan 2026 18:41:33 +0000
Received: by mail-pf1-x430.google.com with SMTP id d2e1a72fcca58-82311f4070cso302967b3a.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 22 Jan 2026 10:41:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1769107289; x=1769712089; darn=lists.infradead.org;
        h=mime-version:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to;
        bh=IqerNtZd/2eIPu0s74sVae5mDkPG9QDd8bnivU2GUiA=;
        b=pwY/0gOh2b8SMjFlgoHGQRYjdPb4jF4DUAmg9t9umo10+Kwg/Dnl8TAd3G3asnkbma
         2zDe0lcJ67vkn/KVQGEbAdUQOHhkkpllwdnadEOoxbRNC36r/9YKSaIvgbT2ASrUxGr3
         2Ao86qOC/eoC4uiaK/cLG+mXJ7uYm1hZa1VoKWjFOEiLWPK2ZB0IyZUl795rFf8Yq2Ww
         IsBwIq0U4Y6YcksqFEdv1wDO6/be2O/xAjAIJ2JQdmNDwIhlxZPJbOpL384ClQhve48c
         B3XxpnEDVGX973KFnFu++L8/f7Ko7q3jYir/7TQ107s+epDAAQPZcEsui/vq/iU+jWxt
         5z7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769107289; x=1769712089;
        h=mime-version:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=IqerNtZd/2eIPu0s74sVae5mDkPG9QDd8bnivU2GUiA=;
        b=CWjwj0/kcdXIwrx84c/9ow6lFm/zxBJDDquNcV4KHlG2PhWpsviqiupripcfkp87bW
         EWVmscRJpLsbGXklQx+Or186pJD4yeCetYQyB00SC4sZZXxWFBNrFgqabcYWOWqoSn54
         QPg6iUckOp/FtfR5/DV7DLfQ8oW0hj7jnib5JJngUCkdiOQ0TlwK4bGSmTHT/DCLBSsN
         IbxETiW05vg8NnMEwcKHk+kNZ+UIxGhpZcgb7RJurWSlupZPTXeWa1qwRamEAfpVQR3h
         MAuTxWvZxxLbsA6pzFOF37l2NbwBOOFNqtLYHMFIlBgPr7zIagCVIFN4yIQujOR175cS
         JlHg==
X-Forwarded-Encrypted: i=1; AJvYcCVE2giMLI527ka0KM09YGDttubA53FZM5S2fX/2MFWgmC/iGoW4nSClEWyhV8L0IAcH1t+afy5qUe7cq/wdCqN6@lists.infradead.org
X-Gm-Message-State: AOJu0YxZvmuI54tTHhSfeKswQJ1LrQvmXvcVetGjM+nNLqXvQwbblWkV
	tHXFwA1Ii5aT14xXG6gjhj24qnDOa71GGtjCrkyeuBYPhJNJtwGe8AmAbtgGtyAYB/Q+sh+bL5o
	Au97tH1Y=
X-Gm-Gg: AZuq6aKnEdQh3M2pxQgvwIWnHnMdryuj8godB3lQdbWTndslA0Hb/hRH2dKB2UjTAji
	R3FrXmcvoeY/vyOdkG87JrgbEStFzoJESuNpppUoZ0yumAVGcCiYi1mSBMSKF2K1L+cVLY8f7dy
	cJhUVv9Ycn4mY2GZpb6h/28LyRRtBY3Svw6Hgh+Vre97GlmLRNJV8DSF9Hoqtz/x61XGvy1BXPK
	nyYYzcv8WLJIkkHrZyftMN6ljZATLjiDYM9yUx8+eEQ4VS184IfiFfebvzSfeOO1FL9mjvxeAQ1
	Zwdfxh/LTq8S+/o8+MP79Q6CZf1HERLL5P4oWjtlCK2vWT6SkuWb2jgScyukEMMAkTFx+e3dSar
	ijnH7tQGv+qE0BFy5NtwabA2QdaVPzgGbExg6rRIiObJX9DHjNY/bN9OlM8gECX1P483b/WRwUa
	F18BRvu4W2R3d0eLmUIHU=
X-Received: by 2002:a05:6a00:2342:b0:821:8629:ef70 with SMTP id d2e1a72fcca58-8218ebb62f2mr3358968b3a.0.1769107288788;
        Thu, 22 Jan 2026 10:41:28 -0800 (PST)
Received: from localhost ([71.212.200.220])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8231871f2c0sm60366b3a.31.2026.01.22.10.41.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Jan 2026 10:41:28 -0800 (PST)
From: Kevin Hilman <khilman@baylibre.com>
To: soc@lists.linux.dev
Cc: linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL] soc/drivers: bus & hwsplinlock updates for OMAP
Date: Thu, 22 Jan 2026 10:41:27 -0800
Message-ID: <7hy0lp5w2w.fsf@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260122_104129_823538_BF230B9D 
X-CRM114-Status: UNSURE (   7.09  )
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

The following changes since commit 8f0b4cce4481fb22653697cced8d0d04027cb1e8:

  Linux 6.19-rc1 (2025-12-14 16:05:07 +1200)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/khilman/linux-omap.git tags/omap-for-v6.20/drivers-signed

for you to fetch changes up to 3bd4edd67b034f8e1f61c86e0eb098de6179e3f2:

  hwspinlock: omap: Handle devm_pm_runtime_enable() errors (2026-01-14 14:36:55 -0800)

----------------------------------------------------------------
drivers: bus & hwsplinlock updates for OMAP

----------------------------------------------------------------
Haotian Zhang (1):
      hwspinlock: omap: Handle devm_pm_runtime_enable() errors

Johan Hovold (2):
      bus: omap-ocp2scp: fix OF populate on driver rebind
      bus: omap-ocp2scp: enable compile testing

 drivers/bus/Kconfig                  |  2 +-
 drivers/bus/omap-ocp2scp.c           | 13 ++-----------
 drivers/hwspinlock/omap_hwspinlock.c |  4 +++-
 3 files changed, 6 insertions(+), 13 deletions(-)

