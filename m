Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97BADC531F8
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Feb 2026 02:14:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=t3es94jlcNTS37tfcja1nmQeDCIBs8JooU5l0G5BheY=; b=yxak7wq7/AP8HxYILg3XeSkgUR
	DZLTm/ovNCioUJnONaGMixaKD710q5xQeYBZd7CWw5Sa2zIf7r3VSg4OWjAmh3CeBVFJMrn8qyZk8
	XTzqCPyrdg6PQ+aXoKVId4/nLF+ep/xOYAFwWtPXr6yVpnPWgtxsEeN6ly+ffQC37ar0a0x4LDQ7M
	pLnd7Mv44gXLd/wz9YJAH+h5SHvbbr25g5Y38L+9EdlxH1WmVq0SHzefVTS6AAqKOqtfcgur4zuzc
	5KzYBxFcmO34E7mu2RV6GhNdPHsmsqXKiy5clYzM75LBC0u4ehHmzkRZsJyEDXmyyQVQ/HiupNbCv
	asDeepCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vtG23-0000000D2cw-2oVs;
	Fri, 20 Feb 2026 02:14:15 +0000
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vtG21-0000000D2bi-1YJx
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Feb 2026 02:14:14 +0000
Received: by mail-pf1-x429.google.com with SMTP id d2e1a72fcca58-8217f2ad01eso1662242b3a.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 19 Feb 2026 18:14:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771553652; x=1772158452; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=t3es94jlcNTS37tfcja1nmQeDCIBs8JooU5l0G5BheY=;
        b=gK8MhuFfT+GeylyBHc/Nd3/IiVcweS5xsHQ/ieApiyJN6y0jxaaNw/AZ5YL4ua6Izy
         RPSJdRYwQp6XWVrHMofHIFBTIcYnMwLHs1z5l+0cjouKchB3yd4YUxTu+WkF1QhPa41H
         EGVYZk3q2PmLK0bY/6yli97xGrILWDZm4Hcc/XPRM7AhvG0KXytI/+Dc0XJgvkjJtTzV
         3IKzljQSrYHC+08nS1XyQ07e7AR3w5umNwfSm3Kj5zAGP7pWkr84JnE80sy8HENNx1VL
         cE/NUvBX7Q54bQEraycuQ+3PH513fQfxGO9tdYYUdVZ0/g2+SAvXWGXxI7AW0P6bbXE+
         Bmig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771553652; x=1772158452;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=t3es94jlcNTS37tfcja1nmQeDCIBs8JooU5l0G5BheY=;
        b=NiqzmBu3Vy0/4gVbT43RS2Yh9Qo10+D/lQ3lfrSo7vOM8yB19BegXQKYdmq5buzJFb
         9ZrhMVoYsKW/eWWdhJ62SM8FKLwZP3vJO3tao+ZWPcf4/jZmhFF5Ki3FCgbQ40ydbQkn
         TwAv1g2Ic0AOCMWlw+IycrYI+5k2HFl9F8n3KZ6+b9/pxSNjhgSHNdkg5xBcTQH0VsSj
         gAb22chF2YMQwIM0d3qTuP6TfQ4Ls9ZArMPbO8h9GkPSvMe2S7+cSodrHIlgmvrfCDXx
         3bMPpdMIE5rIq4mPzX8zd/+Kp5D4vqFxvZBQm2jq49qSd3Fpy8oE5FzsQWU6lVvfxzEj
         9CGQ==
X-Forwarded-Encrypted: i=1; AJvYcCVMISlSdoB/ZbtxjfS2YVJHYanQcmnQP80Z/NaX86o1sK7XIRUfolBlvE7YdcCAi6R1pUlY94cbTufUsmyHAXN5@lists.infradead.org
X-Gm-Message-State: AOJu0Yy4I4rYB+TZ2I2Hr2dwdQFB2X/3+pQl5qHy6CSvnQIhiuhJpjrv
	PXfll6BvnuF7USI5xaGX8t0pnaSy4h362W0b0LfHYA8ZDhGCCUQLxXN8
X-Gm-Gg: AZuq6aKuxfcnT9kp9nNl48pUXADyNUZDlRwdd8xg3x5qhaDw1F+E0hkiwmEBnRUrAF0
	biCSzxIv5JW2wdpNfVSObk++V81OYeoy0vjYFdW+G7vUNGsjz9FOHUNN63QrxQBbvG6IvsLsqIR
	DA8u5gzaEMHCwBjBd7nPFXGQshF47r9pLXv77UfC31lyc/gdQ31S2ac/DAOz5MHe05AKhiU9YLq
	S+utS3UDLhc673hH2zR1+u/fraW56GU1j/d6C2dE2mnRpmnM+PjAO7/q3eJzUfi5G6KJeisJ0Ye
	jx6ijC3Iivx+5R1uMc1xnSFgNRot93S+f3eQSY4zapR1BUU+HAwSpOBRuzpmzlXIyVl5+rnOBQv
	jrAZDXP5PnwU8yY61P2J22jPu4r1ayEEAcbpshL4FUk+g0sq88k1kHisTc3I1+TZFI908
X-Received: by 2002:a05:6a00:1d88:b0:824:d179:2105 with SMTP id d2e1a72fcca58-826d0973035mr98269b3a.56.1771553651799;
        Thu, 19 Feb 2026 18:14:11 -0800 (PST)
Received: from ryzen ([2601:644:8000:56f5::8bd])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-824c6b69b13sm19607225b3a.30.2026.02.19.18.14.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Feb 2026 18:14:11 -0800 (PST)
From: Rosen Penev <rosenp@gmail.com>
To: devicetree@vger.kernel.org
Cc: Florian Fainelli <florian.fainelli@broadcom.com>,
	Hauke Mehrtens <hauke@hauke-m.de>,
	=?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org (moderated list:BROADCOM BCM5301X ARM ARCHITECTURE),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH 0/5] ARM: dts: bcm470x: set MACs where missing
Date: Thu, 19 Feb 2026 18:13:48 -0800
Message-ID: <20260220021353.40554-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260219_181413_410187_6C759C1B 
X-CRM114-Status: UNSURE (   7.26  )
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

I believe these predate the bcm,nvram driver, which makes this
possible. Downstream OpenWrt currently assigns these in userspace.

Rosen Penev (5):
  ARM: dts: bcm4709-linksys-ea9200: set WAN MAC
  ARM: dts: bcm47094-linksys-panamera: set WAN MAC
  ARM: dts: bcm4709-asus-rt-ac87u: specify switch
  ARM: dts: bcm4708-linksys-ea6300-v1: specify switch
  ARM: dts: bcm47094-phicomm-k3: specify switch

 .../broadcom/bcm4708-linksys-ea6300-v1.dts    | 45 +++++++++++++++++++
 .../dts/broadcom/bcm4709-asus-rt-ac87u.dts    | 37 +++++++++++++++
 .../dts/broadcom/bcm4709-linksys-ea9200.dts   |  7 +++
 .../broadcom/bcm47094-linksys-panamera.dts    |  7 +++
 .../boot/dts/broadcom/bcm47094-phicomm-k3.dts | 43 ++++++++++++++++++
 5 files changed, 139 insertions(+)

--
2.53.0


