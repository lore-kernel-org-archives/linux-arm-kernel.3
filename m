Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4DC2C43458
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  8 Jul 2026 23:34:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	MIME-Version:Content-Type:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rcfqpyklPdRJm8BTRultdJ4ZxpQ7NoW5CVhgwgaydYs=; b=YYWeiFUmfGuESDptT6rGBc7FPW
	+5w9Fg6XR3paxtYfLkBlzRtV+tSIz17UcFk/x9FroHOS9EvDLTvXTno3BmTTrlnVdkU1yfIiXc7JS
	s9AjYb9dBITISBTI4mg2rEAx5aovhDQ8AXTYs2I6PuktDMQF30BytP+k34mV2sEwfUr9kB7RSQ91o
	VmTcq8arg8bPHw63X64t+kmB28AMYN+ZwNcPL3aVLAH7KWVoKPtwKYytbszyXzXS1qdzeRgEzuyWS
	2JPH7dsigEbbnkGEgXjBzaU4epr53bsxQlEFtBh18T3LyUb/xwFX8mghccYJQqvCRdgcgWGiETarC
	I2iyTPHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whbmk-00000000bPU-0mBT;
	Wed, 08 Jul 2026 23:34:34 +0000
Received: from mail-pg1-x52a.google.com ([2607:f8b0:4864:20::52a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whbmi-00000000bO1-0U5r
	for linux-arm-kernel@lists.infradead.org;
	Wed, 08 Jul 2026 23:34:33 +0000
Received: by mail-pg1-x52a.google.com with SMTP id 41be03b00d2f7-ca88130e09aso61753a12.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 08 Jul 2026 16:34:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783553671; x=1784158471; darn=lists.infradead.org;
        h=references:in-reply-to:mime-version:content-type:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rcfqpyklPdRJm8BTRultdJ4ZxpQ7NoW5CVhgwgaydYs=;
        b=WMiy4xmW1hIznjBb7OPkjBfWwd6mlCDwDS5qwYs4eaR47Zj+uXoaXwFml/Ksvgp4p+
         IekTrpY7CkNzJOjJ8WO3dOZGflgrkHFRVIaqI5J7E0+4tcHIWzfjmSO2xM58vOWsB/X/
         IOz0n1j0E73j4pbkffB5WAkvKeYrt3rgilZgCyW5SNunJpJaUt2p1UCm7cZ9ywo4KAwh
         h0b8v6wj+Lw++y5VPDm/G+HmFev63ZSwPkFLSJ3CLgQ0KrLpZ8N8dn1nfDBz9ZfJMG9S
         ppEWTElXBjm+s/c9++yixz2kiZK63P9xcyLAFK+luAn497XSiW+sH9JwvIDr5z2YiYY/
         30Dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783553671; x=1784158471;
        h=references:in-reply-to:mime-version:content-type:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=rcfqpyklPdRJm8BTRultdJ4ZxpQ7NoW5CVhgwgaydYs=;
        b=CIYWDXC2TlOyOaRaZKvZBCRhGDMDfXx76JElOAkwxTzRqfw9tWrHGzMRDoxtMtMGCO
         eZ2o3tCUAnxJGhyLKQa3FRcom6/Nkr5ngwea9sVDG+EkyrfEXsxXbhOb/ipEux5GN6VC
         u9Mj7DQ/LYR8b5PSFT+3Cgbbu8rvs9VFBkIaUUMY/j779Z+r5f1UTKxeaMR3e/hYFB9e
         pTaIeEGY1wL3suMbUesK6qvxsDANhteHpR27zpmXWxxZ8PEwsnzHRE7F8cxBtwAWKRX2
         Fo5kh9Beno7hTbTULOLrd21/alrbZwiHv9ltGEbXK6uQ57S1BzW3Eirkt/jWVGZRZXLj
         +cTg==
X-Forwarded-Encrypted: i=1; AHgh+RphPXXHDjJBsda7EH7DxGI9OGY+Z/76TNXW4aXuaw5ib0rZcYZGmU2oX8Vi8y0kXuffAybmdj6n9H/fCHbEsTjV@lists.infradead.org
X-Gm-Message-State: AOJu0YwenHnRF0LXvwuCv/Fa81Cg5an4TRnxpOarPv6P4WYwo3rfJFm1
	fvxdgXs94eIk6xHKMUjAr5hBPnZyv7k4J9s1AUKwCgLgRFwEKbjHgEqW
X-Gm-Gg: AfdE7cnNhg6TSMD5KuaBkS9aUH/CYsYEmo8JhNWFgyiAllpo2Ko1wNr0pK+639h/9t/
	5CDAi8npqCbC93h+UZO13cKvB9o3J/O666/1TvrsLrSNjQPwTJgfFdRrS5L1Rq8qTkVs3HOraQr
	hXdrUTw7cKtQQxi/wOSwQhP9iQ5jnzJvCgcMmOvzzdGrSG44m+ftqO3nFocXYzQlS4fnfxlNWJu
	iVLXUUS8MNJpHm7xeX5RAQMO7YIG+NZfXL63as3yAbgi+3g4KEyXz6QiYyx7u/uYtbldtR4CvhB
	EPVSef8MrM/kRKpOZZ9/JJPHyrvALbfWhlWX4DQJ3HSh0gT1HT8+0hPP66DFKjaDne5yVJXABx4
	lpdiJMomg4P9uNd/IHc+HUP0D485LWrge6RJyHBPFkKRjITLKVgUw8wjtaw2E9b7/NZCxhFon30
	MCrcbPnA==
X-Received: by 2002:a05:6a21:3a85:b0:3c0:9c18:d5ac with SMTP id adf61e73a8af0-3c0bd237362mr5073243637.73.1783553671195;
        Wed, 08 Jul 2026 16:34:31 -0700 (PDT)
Received: from [127.0.1.1] ([47.253.114.73])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-ca5b3c1f77fsm2927638a12.32.2026.07.08.16.34.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jul 2026 16:34:30 -0700 (PDT)
From: Wayen Yan <win847@gmail.com>
To: netdev@vger.kernel.org
Cc: lorenzo@kernel.org, horms@kernel.org, pabeni@redhat.com, kuba@kernel.org, edumazet@google.com, andrew+netdev@lunn.ch, angelogioacchino.delregno@collabora.com, matthias.bgg@gmail.com, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>, Russell King <linux@armlinux.org.uk>, "David S. Miller" <davem@davemloft.net>, Daniel Golle <daniel@makrotopia.org>, Qingfang Deng <dqfext@gmail.com>, SkyLake Huang <SkyLake.Huang@mediatek.com>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH net-next 3/5] net: phy: mediatek: split Airoha code to dedicated source
Date: Thu, 09 Jul 2026 00:32:00 +0800
Message-ID: <178355366449.113894.1139754683497248912@gmail.com>
Content-Type: text/plain; charset=utf-8
MIME-Version: 1.0
In-Reply-To: <20260708102341.53919-4-ansuelsmth@gmail.com>
References: <20260708102341.53919-1-ansuelsmth@gmail.com> <20260708102341.53919-4-ansuelsmth@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260708_163432_155611_4D28A44B 
X-CRM114-Status: UNSURE (   6.93  )
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

Hi Christian,

One minor typo in the new Kconfig help text:

In drivers/net/phy/mediatek/Kconfig, the help text for
AIROHA_GE_SOC_PHY has a leftover "d":

    Include support for built-in Ethernet PHYs which are present in
    the AN7581 and AN7583 SoCs. These PHYs d will dynamically
                                            ^
    calibrate during startup.

Should be: "These PHYs will dynamically calibrate during startup."

Otherwise the code split looks clean.

Best,
Wayen


