Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69B0DC9830E
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 17 Jan 2026 01:22:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=cxRAE+6J1/VR0TMOgZgPO8SPeLk5GzHQqIi3etGBIWY=; b=DebLyccA+UU3l/CiUPFYfcd0GP
	6DRxxh3wRhe5TOxqL2DIC3GinDFCSxnDM/3+APCut0ZqeqAC+REYrXyttxfAy9cMdArQDiOzqt1qC
	LK+kdM+zgK4QCqTLsqozISFU3LEhQ8k2DTCrf2Kgdmva518fR9/86uAFOmUChhhkvXdx8m6nou2H5
	NJ7ZFhk81rE69F4HxWKoukRO5J5NH7KFt3OcWVZnm59UA1Nxm9MlZzS19JcNSy6P21xvmCTafYLsV
	LTsZRMEvxEjFDUkMg45xkmwk1NdDtv8LbP/uJ3wAlW607fPQcM2AXZfZJD6+sHRT2X+hBMS3cGJ3Y
	l6yVKwjw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgv0m-0000000F5Zo-30zL;
	Sat, 17 Jan 2026 01:21:56 +0000
Received: from mail-dl1-x122f.google.com ([2607:f8b0:4864:20::122f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgv0k-0000000F5ZK-0mJV
	for linux-arm-kernel@lists.infradead.org;
	Sat, 17 Jan 2026 01:21:55 +0000
Received: by mail-dl1-x122f.google.com with SMTP id a92af1059eb24-11f1fb91996so6262487c88.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 16 Jan 2026 17:21:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nexthop.ai; s=google; t=1768612913; x=1769217713; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=cxRAE+6J1/VR0TMOgZgPO8SPeLk5GzHQqIi3etGBIWY=;
        b=kq4K8WWkyPv2UXxMTZqCRtC39JbGdw49gcw+N53dq7aT8shQ3f3XdQwkiSG1+31Z/4
         TCdUNgyLLzf+kEAswAMwXySELTJTSET/wNAOEj9QhUIRIM3vcqmkHFwK2COtdryRl0B5
         oV9Umf+WE6cTD/rtAdH+mS134AHV1w4DeJQ/jel5+/Ztcqasi//x6T+rYYrTyk1Q2FGF
         NaFlnkxQoRe9bXNjMYDj5u2+vKObY4IXW4eIL6f/jVbtbacUDJm96v/50hq2Fu5R/lKH
         hsE6qXXhS4y4Xjls9Hy4yniFRV2Ys1O2xNx3vMQUmmzUyh7CZTp7lRKZIPZeqguOj6/l
         JOfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768612913; x=1769217713;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cxRAE+6J1/VR0TMOgZgPO8SPeLk5GzHQqIi3etGBIWY=;
        b=fvlPWGzvdF/Irbyr56EzMOrZgytssKn2oin0fD6CH0sTpKggbprqLyJIfrNyZ4QFjI
         ulRkIr1hYiUprV1lnwaZvtijSF1tvboi/3GKdwHtSsKqaYotnMLFt/4ruU7P6NGRv/ll
         1Ha54CfaZviAHHhueNy9o3HbWOvvJGyo8gwA3b3GXaKErBUvO2hPXggc3YzRTnVx8dkJ
         V9aXJUOKaCw/BdJqDjSR/oU22/BbZV17ONgF1U1LE4kf6uNrHoBjMQ2iMsctFEwbMgz1
         K4zDgnts3dA5OYDqihyBG3aw1WuDpQVsB4X5uotA8r3K4hml6CtcTqpr3wfKsOyU7u9V
         Q67w==
X-Forwarded-Encrypted: i=1; AJvYcCU0ArTCTWnP/t0SbVN4ktdVJ+byZ5McInEl9imtwtzhls7QDL8gZG3T1efu9zOrjHrhJX+RplubS0oSCoLWlCny@lists.infradead.org
X-Gm-Message-State: AOJu0YwabIADudePZdW1n9nsExG7QVMVj067wAPsyO+agtI8niq2pheL
	XzcbWVntsL/AdLtE0fQ7gAdiJFL/RFnBQRKM91PeUYDy3Zh2mDw3ksBrXOOBjpln+AI=
X-Gm-Gg: AY/fxX4jLT7P9GyJpJNJG+eo2lbVzyhbXX1L5/7fa2RG1wmZVH6cBrLtfDRqOIYkNSd
	+E61VQw0HEzVUvQfDZRsHv6UE7BbVwqcATvu7gvI3k6vOSTztP6DoyN7uImeyZIyjjTmcM5TnyV
	4DxJ22ncg6lXYeAPlmllOak39TqNSwzDKrE30DJKdjVvHudpUZ5jGb3iqYkleho7NK4Gdo+vlEF
	9wCkFrdCZYd6hsbPlheeUYz+Xg0p1c795XrPoDk5qACu6NzVOdCQRhSZVPjJStxJbHLrXT5OABl
	N7hD2GKk7L80htngCuGgzJQjxPkEbEcab4+CisfpLtqdiyCKNP7uFScCOID4PgsXsUWU7NPKX9s
	8oBrhEQQpfkvSR8fRUy256yMHpvR+SnTSJbM346tUD0mtDiLPXTLjhnVWa+ygokCiTJTVjNfZYw
	yx1KcJZZgIKyI=
X-Received: by 2002:a05:7022:322:b0:119:e569:f279 with SMTP id a92af1059eb24-1244b3802e2mr4430875c88.34.1768612913075;
        Fri, 16 Jan 2026 17:21:53 -0800 (PST)
Received: from localhost ([50.145.100.178])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1244ac6c2besm5370810c88.5.2026.01.16.17.21.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Jan 2026 17:21:52 -0800 (PST)
From: Abdurrahman Hussain <abdurrahman@nexthop.ai>
To: Mark Brown <broonie@kernel.org>,
	Michal Simek <michal.simek@amd.com>,
	Andrew Lunn <andrew@lunn.ch>
Cc: linux-spi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	Abdurrahman Hussain <abdurrahman@nexthop.ai>
Subject: [PATCH v2 0/3] spi: xilinx: make it work on non-OF platforms
Date: Sat, 17 Jan 2026 01:21:33 +0000
Message-ID: <20260117012136.265220-1-abdurrahman@nexthop.ai>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260116_172154_255353_2F131568 
X-CRM114-Status: UNSURE (   8.05  )
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

These changes make the driver work on ACPI based systems.
Making the interrupt optional makes work on systems where interrupts are
not available or broken.

Abdurrahman Hussain (3):
  spi: xilinx: use device property accessors.
  spi: xilinx: make irq optional
  spi: dt-bindings: xilinx: make interrupts optional

 .../devicetree/bindings/spi/spi-xilinx.yaml          |  1 -
 drivers/spi/spi-xilinx.c                             | 12 ++++++------
 2 files changed, 6 insertions(+), 7 deletions(-)


base-commit: 944aacb68baf7624ab8d277d0ebf07f025ca137c
-- 
2.52.0


