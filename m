Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8D4ACCD1BF
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 24 Oct 2025 01:55:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=qM2K5UWuNXprZvBDJ5c1mMhJQmIFaH7Nb7GuoKXsnbg=; b=dg9f795HBkdyOjgQSYW4jgo9I/
	W5su12/d2h2TEXMIHBE9vIfo0RSZY1yYP7FPU+HyYpw2h/NmYyABf1rY7m4quMR2jhdfnJiHu2Kro
	4z7MwmSrs8uxzTZhl0zTkJESQGdkkFoeiknQC+zHFD4yK5LF1zaOMzS15NAmYQU/LawpaBy4tlvuO
	2ujXTBV+aKaeunsiFBQV07IXf3FMkjYAJEu6ipAqPmLIKJOdKaFq5rtYhiuG5YZE7pgR0j33jIXoY
	E1t2zTT/CtZ7ka0VqILbpMvJ8v/hHWkc+9W/doDFv9EMnHeuyYdh6HhkutE5f9SsGvgxnsE7PVUXr
	QdfeLivA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vC71o-00000007z91-2q2O;
	Fri, 24 Oct 2025 01:55:40 +0000
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vC71l-00000007z8b-2GnX
	for linux-arm-kernel@lists.infradead.org;
	Fri, 24 Oct 2025 01:55:38 +0000
Received: by mail-pj1-x1033.google.com with SMTP id 98e67ed59e1d1-33d28dbced5so1965451a91.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 23 Oct 2025 18:55:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761270936; x=1761875736; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=qM2K5UWuNXprZvBDJ5c1mMhJQmIFaH7Nb7GuoKXsnbg=;
        b=iv6T6N6lxYHd5IJUuLSeVjMJe99fkgTcSZo4Un43hqgo9+TLTUAZcYsvB7nuFxn0KJ
         IZif0ORCrIVzipVOHC+jittmq3mehVHZkATenv45cURPrFDNcpXTKu4rr7ZtaU4hjXrU
         rIUecot4bxFKqhke2rIxmm3i/o6wiBTJeiXwAJR41XuXPsX2H1lnOmrgUoK5e+Xpt4py
         NZ+1y4nm/x5bUr+8Ib8vdilOeR4l3QV0kLuo0XRUP33Hce07VxZElYSVZc4BiLh8c+On
         Ov5NA5ipAy4rjyUnbOAqt8RpP21YGc+oK/+/f2LtQOXpl1WLpMyAdZrl8jq1AQU5CWlA
         XR7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761270936; x=1761875736;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qM2K5UWuNXprZvBDJ5c1mMhJQmIFaH7Nb7GuoKXsnbg=;
        b=uz4MfQ/dvX8hzq+i56+S5ppHv01qqGd2EY0rMQe3wffeDnZUbIjothYu4hJSDD1c9N
         +LaHgxiZQkeLkSfZ7tyQZV8G90UjCtH3m9SBlsnwQQhGcRC/tNN+X8RoYJ0d6iowBP2q
         cD/Kf5+qJKLwWbBoIkGkn/ZXCZOjC046/6lX92G+WYyMHIBU3akeI1W193rinY4SvGJn
         Tv3Mko0f97wisn4g5k9WTvVS3+F5pebQKT8OmyDPyQ7XfbygmdOXOEDbyF72DhywnjhA
         wKDUcNdrNEzp32ghsexVK2mqoAGvuLiuk+Js0Ar0GGGODv3Z548pKXafuaPqjDIXOJ+o
         QMOg==
X-Forwarded-Encrypted: i=1; AJvYcCWiuMvCN8eyX3SfRgX5KKzzUVnztMTtcQ3AM6k+8+HgiwSQmcvTs2vbxLvtmf/taoiN9wqUAAura6OeTK9yLJ+r@lists.infradead.org
X-Gm-Message-State: AOJu0YzLZNGDm4lCnUiwRcBEd6QGvFcYkxTjOqNwV7Cj8/mC0Mvg5mXp
	YkPS0lqbOofCl1kcgCA6EYuJ221ghsGc8WehoHfmvOSy9f7JHjvzD1XM
X-Gm-Gg: ASbGncvx7uF9+wmSD8lSRE58bN1631r1wklXP9UJ+z4Ep0oTsCF8U2ylSe9FFbfK4s4
	1UlK0FPVtg00v8WBl1bLAH5rqGY3YgdfyYI4ZsgygVFwOWHYEakXx2qDM6IgjqXLgoc56/VzJuZ
	XqXtMd6QzYgNeLFATNj1KKHwQpLBNwBdUdgYncWu2ohccdXyZwooSBmWduUnN5HtSV5b1r5EXl+
	GYjPxuSQx7T2XQC8PUDNlXcA/yUKukEpkbZ3lUoWnLcXkIfrlzlu6cqE/lLiQhUQ5aTtpAXpn6I
	JwJ2iJC5OdzzYFdIqAlN+gpdVnxQXqqYtHozjCl3aFbqyQAORZJbt9pAw+Ih5WPojDCy13YbCJS
	hlmh5sknQgzhYZ+dZ3CAMD/cH8vit1sR1kqo+dEgFK9D4XfU27iKfmqbjZie8xyIWLXQhLdnD3X
	tZV+3EIuM8BQ==
X-Google-Smtp-Source: AGHT+IFGuiuD5qMaB237ASMVYM5OY1+My1nEaULow6/U2LgSioG18/RvbKuul7ZQNTuvhLccqeac+g==
X-Received: by 2002:a17:90b:5386:b0:32e:749d:fcb6 with SMTP id 98e67ed59e1d1-33bcf86b5c6mr38689912a91.12.1761270936488;
        Thu, 23 Oct 2025 18:55:36 -0700 (PDT)
Received: from localhost ([2001:19f0:ac00:4eb8:5400:5ff:fe30:7df3])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-33dff3c3a6csm4951393a91.5.2025.10.23.18.55.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Oct 2025 18:55:36 -0700 (PDT)
From: Inochi Amaoto <inochiama@gmail.com>
To: Han Gao <rabenda.cn@gmail.com>,
	Icenowy Zheng <uwu@icenowy.me>,
	Vivian Wang <wangruikang@iscas.ac.cn>,
	Yao Zi <ziyao@disroot.org>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen Wang <unicorn_wang@outlook.com>,
	Inochi Amaoto <inochiama@gmail.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	"Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
Cc: netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	sophgo@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	Yixun Lan <dlan@gentoo.org>,
	Longbin Li <looong.bin@gmail.com>
Subject: [PATCH v3 0/3] net: stmmac: dwmac-sophgo: Add phy interface filter
Date: Fri, 24 Oct 2025 09:55:21 +0800
Message-ID: <20251024015524.291013-1-inochiama@gmail.com>
X-Mailer: git-send-email 2.51.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251023_185537_587379_A0B72A0B 
X-CRM114-Status: GOOD (  10.70  )
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

As the SG2042 has an internal rx delay, the delay should be remove
when init the mac, otherwise the phy will be misconfigurated.

Since this delay fix is common for other MACs, add a common helper
for it. And use it to fix SG2042.

Change from v2:
- https://lore.kernel.org/all/20251020095500.1330057-1-inochiama@gmail.com
1. patch 3: fix comment typo
2. patch 3: add check for PHY_INTERFACE_MODE_NA.

Change from v1:
- https://lore.kernel.org/all/20251017011802.523140-1-inochiama@gmail.com
1. Add phy-mode property to dt-bindings of sophgo,sg2044-dwmac
2. Add common helper for fixing RGMII phy mode
3. Use struct to hold the compatiable data.

Inochi Amaoto (3):
  dt-bindings: net: sophgo,sg2044-dwmac: add phy mode restriction
  net: phy: Add helper for fixing RGMII PHY mode based on internal mac
    delay
  net: stmmac: dwmac-sophgo: Add phy interface filter

 .../bindings/net/sophgo,sg2044-dwmac.yaml     | 17 ++++++++
 .../ethernet/stmicro/stmmac/dwmac-sophgo.c    | 20 ++++++++-
 drivers/net/phy/phy-core.c                    | 43 +++++++++++++++++++
 include/linux/phy.h                           |  3 ++
 4 files changed, 82 insertions(+), 1 deletion(-)

--
2.51.1


