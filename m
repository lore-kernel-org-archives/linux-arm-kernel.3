Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B995CCA464
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 16 Oct 2026 08:41:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=+GyvDCXoOZxhaF1YO2iBjYziahy1VyrzPfIWpLTL1Is=; b=c6dD+N03XkfT6sk2n98pLAS5I1
	uYA16WCcCny4/1qdU5tV/rK8R1Fg6OzbBRb9mY2SL2WfcXgSrRRvgc4JmLFmaCkRBErvZcwcWmpeH
	OP2IqLsPm6PXVVAzVS/TWifyt8Npy1totJc1w5g5K4Gk/K5vLY7Jdw4UVk1qptzg6oZUQ/44RXtbm
	h8YLhfRTO2fQLHJ9puQJ6GFWj3cxfMCUrtLDWvF4ev+76gJcf3avNIAtrL7CvZfEOmPUYDOGxKHuy
	BA/vom1IE13/ciD+2hwf1Od+5MZ0GcUbV3YKN7b2d4mbv7EI7xEEzvGXWtNhtUX8f6t3JZCh+EQBJ
	/3AetFBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHdUn-00000002Lw6-1e7K;
	Fri, 16 Oct 2026 08:40:57 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHdUl-00000002LvK-0gL4
	for linux-arm-kernel@lists.infradead.org;
	Fri, 16 Oct 2026 08:40:56 +0000
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-4a0286c981dso27657595e9.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 16 Oct 2026 01:40:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792140053; x=1792744853; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=+GyvDCXoOZxhaF1YO2iBjYziahy1VyrzPfIWpLTL1Is=;
        b=MBJWzEn9wRSSvXbDjPZ5EIIasZXBaBbqgsybyJBqOzf378FOFr2gRTUHq8HIBGylcf
         r3ZdQ33zIGc4l3sU3WxuP5i8DuSVVpvhM1QMgZZk4Y/CCguGWlhrjEHICVwpnguCmEqm
         W0o6nvf34Dd92M/zcbT5Bh/6DtbllJxdNvgrep7q2HkjIgTcY5NIPGnpeq+YE74GUYWU
         QC+T9pCXuPdbG/3kExAZ860Tj6alDBq/W99ZDW9iEpGQpSuPn35Cbi2B4GpwWwRih54W
         zzqo0kt+j5pM4RH9xdgNoLJZ2wmBUxwjPV/J6CNtfFot4wuF3nOFab6yo+t2HHJYLKf2
         0Clg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792140053; x=1792744853;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+GyvDCXoOZxhaF1YO2iBjYziahy1VyrzPfIWpLTL1Is=;
        b=eQaz5uNY/lPTsvFX2aZRChZQOYcg3bv5f/Qhiui5YPARIDorOdhY/NvWrN0JnPyVtq
         zb52IGkOhcv1UySLepnN/tCyq6nuLMFTSqkQCMb2Z+34cKdr6L1kDF2+IAPCgK1SJ914
         tu5h+lhQV3riwgoAX0sJaOx2YmiwT/XrWbacuLQt1aNzLBT1SMo3m+p2+ezZhKHuh8Pv
         451F9unyIjliwplmbNrIPteHFMxO055F1hJEAxoFgOZu+wh2QMKNcXazRfJA9MJcVvQT
         0hSe8pASHanWvu2I4p+pGems6UMv1geDe6swnHzyxu4den5sSId0wpO4qiHTPk6V/mEm
         rpOw==
X-Forwarded-Encrypted: i=1; AKwUvBwRDK+BhNq3i3pm+fJbnl3x1TA60Brj1j3SeQKLfPqHXpwCbkjWlIqVVn22e0O+q3F59T18N5urg/hgMS+gcLaL@lists.infradead.org
X-Gm-Message-State: AFq9FYKptQqSTOZnBM/NaTyZCWCUKItGcJPN9pvh4nPnWqUgC+uUlYa9
	ZXqc9O37Hdm2vGcSWwEfHMuvVs7c5AAz8GNGcxUa5S20K3O7RA8UNzzx
X-Gm-Gg: AYBFou2/yIGDJ+HDS4jiZtvCNxmeXGY7d5enbgZZiEz3yEXXzlNnGrPbXs1jhc0Qr+X
	JDPCgjBHv9Fj8qNmYR82U4qNjGE+gnUxNQnoQjvCRqGgDkGyivpe1Vmxqtdvh2v8L7082r7VNDQ
	YTiAF8cobGg+SmjGI0SPCHWfsKw+D473tDpWq8oPF11pcKpf4cvR0q4wp9N1iq0sAGpx0sNJHQQ
	UznoY5DfBISlJrgSbcRhZXi/YGUk0NTsVsvxrJFVfidf/On5vZwvBCd0fNNn3GSpoEr9ZFtLQWY
	f46l3kRrlocuZm3Cr2R49Y0vIQm7PRtyznHVFa/K+nt9RHFgkDyB1rPXw6Izfr4B7GTWqKVujxo
	wNQfvS0GDVQ6pRV0RUbtVguq0GeLEkQSGHcty29ApF7rhcYK/XYGl9hAEUKEsh/f2Dq+1Lz8ABH
	/gQRLVJQ9adgvwNA6F8Llbyr1i3QWIYrxRyArtI6888PjiOMaZ7aHYQxeshvXK4w6QyyJKWbUqE
	PmSQqy1W0GmK3CwGHnCKfIuBPJG79t0na5K8RFJXE8qWDS892wPk4GGh2u89XYFoJeDpC//f9Uq
	MeuS+YLg1hgFhCck7RNozvhLgZFFQrWa
X-Received: by 2002:a05:600c:3e8f:b0:4a0:263c:704f with SMTP id 5b1f17b1804b1-4a18e4a3fbdmr441778475e9.16.1792140052601;
        Fri, 16 Oct 2026 01:40:52 -0700 (PDT)
Received: from Lord-Beerus.station ([93.66.71.207])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48dfd5033a2sm3715233f8f.45.2026.10.16.01.40.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 01:40:51 -0700 (PDT)
From: Stefano Radaelli <stefano.radaelli21@gmail.com>
X-Google-Original-From: Stefano Radaelli <stefano.r@variscite.com>
To: Frank Li <Frank.Li@nxp.com>,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Cc: pierluigi.p@variscite.com,
	Stefano Radaelli <stefano.r@variscite.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Subject: [PATCH v1 0/2] arm64: dts: imx8mm: Enable DMIC input on Variscite boards
Date: Fri, 16 Oct 2026 10:40:09 +0200
Message-ID: <cover.1792139809.git.stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261016_014055_206297_707B9CB9 
X-CRM114-Status: UNSURE (   7.78  )
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

This series describes the digital microphone connection to the WM8904
codec on the Variscite DART-MX8M-MINI and VAR-SOM-MX8M-MINI platforms.

Configure IN1L as DMICDAT1 on both platforms to enable the digital
microphone capture path.

Stefano Radaelli (2):
  arm64: dts: imx8mm-var-dart: Enable WM8904 DMIC input
  arm64: dts: imx8mm-var-som: Enable WM8904 DMIC input

 arch/arm64/boot/dts/freescale/imx8mm-var-dart.dtsi | 2 ++
 arch/arm64/boot/dts/freescale/imx8mm-var-som.dtsi  | 2 ++
 2 files changed, 4 insertions(+)


base-commit: 31f9ec9f38735f42e1f0ba57347c420e56b99824
-- 
2.47.3


