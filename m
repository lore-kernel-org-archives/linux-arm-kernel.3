Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE37EE7719C
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 10 Jan 2025 09:55:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=nFjtc361L1m3WrvhcILanOsHvqG76+wLYkWt5yxv28I=; b=yREb0Vcww8XQPCcvZsMmQfJNAO
	re2Ujwk/wkx1SHrmQQMR3RqFjdugSpgOPcSgJ2Yu5wZesp+sF0JwjbeAtH50d79KbmVcdl0LjsiQd
	rc7o9CxfvCATHRT7tJelAXCRRNOBOmBcDnI92rybT8aWwjLrXTGy+FJwG0y8NOVzqRAEhkMoIhyUP
	8Y63wJ/mw/Cn7K6ivnJhzQwpyR+dEXm8QQORiqntE9CPWE6CITGF3juWjJKxfUQLuSXoqu7G9vzDX
	ZghuzAKUQXtVjhWqN1CMiiGB1+BF8q6cFudP5qyFy4fJ3JXzGBHYIGtMfwuzW+DXMm+yjBYdDp0TU
	mH63NV3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tWBjh-0000000EpmQ-0SCU;
	Fri, 10 Jan 2025 09:55:25 +0000
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tWBiT-0000000EpOd-1dOB
	for linux-arm-kernel@lists.infradead.org;
	Fri, 10 Jan 2025 09:54:10 +0000
Received: by mail-pl1-x633.google.com with SMTP id d9443c01a7336-21654fdd5daso29671545ad.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 10 Jan 2025 01:54:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736502848; x=1737107648; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=nFjtc361L1m3WrvhcILanOsHvqG76+wLYkWt5yxv28I=;
        b=iaLkWRudH7JPGq6QxYxARygaIqciE0fku1rcdMKNSTv8ZgjHMU3OeNHCkZUGTQjYyI
         56zH8vY2OasJuT8v0RcuYTMJTl84pFb0hscjCLgD6PFjTj4GL0SxwbSnrCjcLvRmQ3VL
         nP7+gUG2LbhVlUiea4ddyGHmxkkzVlcUTtuBpab2TjKiqi3RbH/3rBi9IsSo5LKAwb4h
         xvuN2XSG0VaeWm58X0soBeXTAhVUb6oaFhV16pD4iiaHWB/tC7/KMzBEdIMZ2oJCov3K
         pSyOGp0L/hD8OTABstNULZTMt7j0VFOvrlKJ6cxQ2ZHHXfvlG8zjxm3rK3kDWt70u5N2
         Eaqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736502848; x=1737107648;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nFjtc361L1m3WrvhcILanOsHvqG76+wLYkWt5yxv28I=;
        b=k9VX5W3u2eM3KwdZ7178IjV0xsVHdqAcvCzlWqG7EXSGUS41VXV1NesbOId+BdwlOB
         mr6Zzr+YAnAjyEoJ5zky+tTGYB3I5sr5ZQsIgj/7m6XnbxNpZaKhyv76plSFSjgFOqg1
         OzapStiSFDRLF1pjzKTyprJRswUflpmoFrWhZR90ET2f6ZFaLihu3wyvYOfD101lozbt
         72mipPiq2ypkyrGJ+Tv0QOIiQilLW0F+1et0fVu0JRO2LcySUKlAQ9P7oGF6NOQnnZn2
         y/puWVWRbdtnExSBbJP+4eix9JDIq9uEMBWFfOTDvFgqLff/KgrVvcu2Z3jp6vIOnB01
         XDoA==
X-Forwarded-Encrypted: i=1; AJvYcCW5OearK2W/xuNIxA2jhv0TI4lvfJuYXBrXGeqIvgY4mVIjZ+NZhOlherHbMKL1Fpf9AM2BFo/oadmZbt4sU+Cp@lists.infradead.org
X-Gm-Message-State: AOJu0Yz7JoAx/1Se5hqSXjSn1x7nO2nCugu7tdUV4ya1AJ1+wHBxBDek
	yjiyFWAngRk0e7lsu8rHb0HB5ljxz2wDyLZnfGGXAFYZvNNNBJzk
X-Gm-Gg: ASbGncuvRfXR5zf2JJO+LJd30dgO1OPP+0a1Kc3u7LrK8lEC/yB2+wqt2ERtWYPFhpZ
	zdC8pULQzD3dTzDuEvZ/djDSInlioSO6ykGMM6dDCEgnvaTKxlWRCsSOmFsUhMxAjfhNHxSTazp
	7OeTnKLkJ/GG6feZ5sAn9px30rgebb0zi0dPvkiWV+MzIE++LdGWxzo7/I97+yIQQsZQ1fM/7YA
	zr8Kizv3lv2DYC4NSG+5U+p8EVx/eaQYqnCwd1xn/O+gt4q+4OinfAQaTO6OrnqEOTXAA==
X-Google-Smtp-Source: AGHT+IHidL4NMTe1WTqflVHXmcGk6gO9iCsHE6DEmrgSOMzB5+zgj5qg5pxONnHGy9PfSNiUkL8Uog==
X-Received: by 2002:a05:6a21:4a4b:b0:1e0:cbd1:8046 with SMTP id adf61e73a8af0-1e88cd28733mr15562582637.0.1736502847835;
        Fri, 10 Jan 2025 01:54:07 -0800 (PST)
Received: from localhost.localdomain ([129.146.253.192])
        by smtp.googlemail.com with ESMTPSA id d2e1a72fcca58-72d4069217dsm1186183b3a.151.2025.01.10.01.54.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jan 2025 01:54:07 -0800 (PST)
From: Furong Xu <0x1207@gmail.com>
To: netdev@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	xfr@outlook.com,
	Furong Xu <0x1207@gmail.com>
Subject: [PATCH net-next v1 0/3] net: stmmac: RX performance improvement
Date: Fri, 10 Jan 2025 17:53:56 +0800
Message-Id: <cover.1736500685.git.0x1207@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250110_015409_426423_B9FC4975 
X-CRM114-Status: UNSURE (   8.46  )
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

This series improves RX performance a lot, ~34% TCP RX throughput boost
has been observed with DWXGMAC CORE 3.20a running on Cortex-A65 CPUs:
from 2.18 Gbits/sec increased to 2.92 Gbits/sec.

Furong Xu (3):
  net: stmmac: Switch to zero-copy in non-XDP RX path
  net: stmmac: Set page_pool_params.max_len to a precise size
  net: stmmac: Optimize cache prefetch in RX path

 drivers/net/ethernet/stmicro/stmmac/stmmac.h  |  1 +
 .../net/ethernet/stmicro/stmmac/stmmac_main.c | 32 +++++++++++--------
 .../net/ethernet/stmicro/stmmac/stmmac_xdp.h  |  1 -
 3 files changed, 19 insertions(+), 15 deletions(-)

-- 
2.34.1


