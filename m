Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71FA6C79F99
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Sep 2026 16:30:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=emj4cn58BmwUvuEYrkn19RQf/kNhJ8y8Fx3ptxT/4jw=; b=AvoR3Iih7QRiZ5d0LGnrFw7YbP
	H+TIkDuxabfN9SVovlL/sO/TaD8i4UwP1gacp1nRhvzFl5uh+jX2LSXxAoqNy+07555yKfV9egcBh
	8qlCtxeLEoYWd3+qvOZmxEtS37qe1PUZiEZcT6IX82IRQhuQjucB4a6UfHo4NERlelgXxVTkvaSJO
	hkL7Sf44o/YNFbr2vL+Bqo0t2phnzD4ZPq7xSAmVHY3VodIEkov8OCHG0uQ6BuXKFSILdqvrX+jY0
	7AuAjOYTEkY1ZlojgATcwc++d9fws9OoPCLHMTJzfpeZ/0IBh+AwgvrxN85x3PWrwnBVSAgpR5pOQ
	HNducM8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3yhz-00000009fyT-2X5n;
	Tue, 08 Sep 2026 16:30:07 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3yhx-00000009fwp-2oFD
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 08 Sep 2026 16:30:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=emj4cn58BmwUvuEYrkn19RQf/kNhJ8y8Fx3ptxT/4jw=; b=aLrVrxp2WFNH1GpesDrxih8HDL
	f4UgdE6yvgVHxnWhDkhT3erkIK7cGXJKvmfBVs1Tu0QycTGKtoVrLYzvJE7nFYz+Px+Y5gDmxAcsk
	3U3IN1Q9aIKcoB6spi7tfMZom+GX4llzmExOpFWWyeSMEzkOCS7appT28gW0Yllk/SMfQizfT6Zwc
	11xSwZGSFuQnS2PGOp0pk2uzI1cMJmas33DYS5IovbtEcZRN7izQezfqdxxwoeGha+tciULct20qM
	wIJkhrpYWgRQlL8HyclLTIbx3igBWxj3kfszovQA+StgJD1y/yoJqdBNe7NrdKCpboErKub/TeJu7
	E5YuhC1w==;
Received: from mail-wm2-x10.google.com ([2a00:1450:4864:31::10])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x3yhu-000000005pM-051b
	for linux-arm-kernel@lists.infradead.org;
	Tue, 08 Sep 2026 16:30:04 +0000
Received: by mail-wm2-x10.google.com with SMTP id 5b1f17b1804b1-49cd82be878so2407365e9.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 08 Sep 2026 09:30:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788885000; x=1789489800; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=emj4cn58BmwUvuEYrkn19RQf/kNhJ8y8Fx3ptxT/4jw=;
        b=kMz5/dAbNReDV0kMUYi5T3IadeI6vBqN8QmtpUD54Ds3ZC+NlrUDL/qmsl4ZEsrKmM
         rlwhA6KIcLWmKxx3U5SaiY/mojTlJShP1LdNZx+jkzslpfgNRLwmG6AjMuXFsyzlHFc3
         Lvz6Dw/OtFr7iVAmMEyDx8gQqESiG1wT6GDKzne6ZYBCLgr9FOoWXxKz6rNJdXw+K2+c
         0e5sfJwh9fmevJFTb65j3UI7J5yBUZX6g5DVqJDDN0EY1o/ktA6lvP7/ydKenPzZJmIl
         HOD/7UXpupl/otXFMqSCLwAIhmXSMblkqbH6V1pOikVx5WIj+Og77tpJuV3XqBIUbvsy
         Me7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788885000; x=1789489800;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=emj4cn58BmwUvuEYrkn19RQf/kNhJ8y8Fx3ptxT/4jw=;
        b=lGnzehj3aaoGwkoQ9qg0RP49DsAPPo5Wxo2kkol1FTMSj1xLmEe/wlcGUV2uX33U++
         pgrbc9M3psMzKd7OfDN0LlKwFm9sUD+o6YfpmrsDe38jCDuOfdTG9dXS5Sduh2UVuDSI
         SzOfzcXghMLWV6xw3MZoAlLWwCgMdsi768AIzqdTHe1RQoDHqW2X6tOSgd0apAkJiC+j
         0hj/9WpYzOBf/4FuXPb5oJrALwA6gTHUi0KO1cIIAYKATXa+SyZz08Cl8uwDcoRzfNAO
         otvOeiZOOmtLAhEZqG4HvSzBN5ogrmrbxERmoCKKhtMD+Oal0c/Xso4JzrnB7gJ4eeVo
         06zw==
X-Forwarded-Encrypted: i=1; AKwUvBzlhjYkz8bv0qt43NGd9wDllxRWrxvcg9GnD35NbSJPzie4BHNTioWf7i67CEwR5qo+udnXjDJYk1EI4r15exVY@lists.infradead.org
X-Gm-Message-State: AFuF++nZcD7MwqS5LcTK4Lecctjc1JDvEp7KczTG9C7dytvg8FKlaReQ
	oGImnsVph0xWaaKMXRxja87bFhA8v65nT9UYaxXbyusOUAL2B/aKcvH/
X-Gm-Gg: AYBFou1/1ZpUhey9TFBb/Z/Z0q7wktRgHj2sIbvFLv9Emsg2H2bts6cujEU67uq8TJE
	A3Z0BBjB7SWqxn1+Yr5EY6BQj3U1i8qdh6DlIgZA7lsuA5Rq5BfjclGbmmzNfTtkJflC9YpQQio
	2MXGCWeEezpZr4wcmIb4OeRRPGaaj4IbfXPFHTpXWWqNWQ8tS3fNdS9Y49874XXA5JJk8+ml5Mm
	YQtF2DXrj6i91InxDqSuFOty2Vul79H2mP7teOik6+WvSRzXHSHjyoZC/gaRaEEbayrTs1dnseq
	LKMFEB4qyoK3WtlnE8gXZEKz1/O5VKW3TWGQZwnZoDKZBWAaDcXKWLo87m0WBrpl06/qGlgDAvY
	I3glZIzVwQ2uvlqZh477+hPr+URfzSJzIOc2NmW/RoFhU8sMGUtMS9OhF9Pi6BRZWsup+bzkgda
	i6mlruUfVYNvKhvbU1ZK/Uf3LZfS3ZhRq8SFwRyTD40d0KXuTdDKPXW6qD69h9MT4NL9tBp24/j
	eohKzZ1V/oVuEVnbfyxbatyml2nxocNrpYv7LQPWHsZv0LgbTJ7dZhhlwpdVZZmsko1
X-Received: by 2002:a05:600c:c494:b0:499:d95a:41f with SMTP id 5b1f17b1804b1-49d010c3969mr205691045e9.0.1788884999944;
        Tue, 08 Sep 2026 09:29:59 -0700 (PDT)
Received: from OrangePi5-Plus.BB-HOME (20014C4E1B825D00814606522702B594.dsl.pool.telekom.hu. [2001:4c4e:1b82:5d00:8146:652:2702:b594])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49d00031c95sm378593345e9.11.2026.09.08.09.29.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 09:29:59 -0700 (PDT)
From: Igor Paunovic <royalnet026@gmail.com>
To: Sebastian Reichel <sebastian.reichel@collabora.com>,
	Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Maxime Chevallier <maxime.chevallier@bootlin.com>
Cc: Igor Paunovic <royalnet026@gmail.com>,
	linux-phy@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	kernel@collabora.com
Subject: Re: [PATCH] phy: rockchip: inno-usb2: ensure PHY is running when clock is requested
Date: Tue,  8 Sep 2026 18:29:28 +0200
Message-ID: <20260908162935.7092-1-royalnet026@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260908-phy-rockchip-inno-usb2-clock-fix-v1-1-f7d59c31b908@collabora.com>
References: <20260908-phy-rockchip-inno-usb2-clock-fix-v1-1-f7d59c31b908@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260908_173002_129382_F5956EBB 
X-CRM114-Status: GOOD (  13.74  )
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

Hi Sebastian,

Tested-by: Igor Paunovic <royalnet026@gmail.com> # Orange Pi 5 Plus (RK3588)

Repeating the tag here so it is picked up with the patch: I tested this
in your rockchip-devel branch earlier today and reported the details in
[1], but that was in my own bug report thread rather than under the
patch. The code you posted is identical to what I tested, only the base
differs.

Briefly: 4 full s2idle cycles with all four USB 2.0 hosts bound, which
hung every time before and needed a cold reset. The OHCI whose 480 MHz
clock had it as its only user went from "enters ohci_platform_resume and
never returns" to returning 0 after ~20.7 ms, 8 out of 8 resume passes.

One data point for the reviewers here, since it concerns the guard at the
top of the new function:

    if (rphy->phy_cfg->num_ports > 1)
            return 0;

All four entries in rk3588_phy_cfgs[] have num_ports = 1 (0x0000 and
0x4000 as OTG, 0x8000 and 0xc000 as HOST), so the new code does run on
RK3588, including u2phy2 at 0x8000 whose controller is the one that hung
for me. The num_ports = 2 configs are the older SoCs, so the guard costs
RK3588 nothing.

[1] https://lore.kernel.org/all/20260908144245.10700-1-royalnet026@gmail.com/

Igor

