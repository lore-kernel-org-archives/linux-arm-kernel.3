Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6547CCD1BE
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 23 Oct 2025 14:59:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=OWoL1UZ/q1eqzSis7uaNsqbiHg0hktnmtvNBWCaQMdw=; b=2i0G6jukTdDL82wrrKDFZPSRAI
	NUsXxs6SXvg0iDJi7IYWkyIF3QC13rmBPLlsaePo2Ml/8WDRuia5XjQCHa8S2BXrOT10hYFwkTRYK
	LYKtb/mOnPVETm0Ehr0iHUsp0QI3acx0UJiUO1hyta0r54/kjm1DipYmirp9N1XyaRSJfXqOTnWrg
	HFlTE1fnIdKUCbuiwdNMHSWZ/2O6lupjvwLcky/Obr+j2rPXLpLhNQWP273W4yZEoZwcF9kjCCgEp
	RRRq4vDLG7aCuCAB+r988xw1XTRhk02uXzlrHzsvoa00Sk+oxDsRh4zYpBicROGvoVlf3dz2zhURr
	iqxlog+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBwmT-00000006fXW-0Zek;
	Thu, 23 Oct 2025 14:59:09 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBwmQ-00000006fUj-1K0E
	for linux-arm-kernel@lists.infradead.org;
	Thu, 23 Oct 2025 14:59:07 +0000
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-471bde1e8f8so5051595e9.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 23 Oct 2025 07:59:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761231544; x=1761836344; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=OWoL1UZ/q1eqzSis7uaNsqbiHg0hktnmtvNBWCaQMdw=;
        b=A313K2YVI1Gq6eHsWtId1HqRlePGh4lqCLP+VZst1FtKzrwWt6q9ZeoFtMeVoHMtJb
         ruN2xT+WnWzPxoKSvgEhOOhJmlLnmp6rx5YpQtjMJQ8vMwQcgRk4+oJVLaXopvuk73xB
         kPH0pLPXKhuEAi4maigDiqR1TlmPUKSucsza8BDjxSlF5rfPvxLzsn+O7PRa8TlD4VYB
         +9jpCKPQR2AbE5wJzmuJYSYW4oWVq6CjArEKNWlgzb0gC9DLGYOfxKOjQ4xyXwWR+Gc0
         2Vx1//iU9qRm4vsxKeeCxhDdXloAKzOoYHx43/ZK8I7EejEZ1rlXbUfraQWuz2N/557k
         q5iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761231544; x=1761836344;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OWoL1UZ/q1eqzSis7uaNsqbiHg0hktnmtvNBWCaQMdw=;
        b=bfG22Jku2EpXHe/DVa0jpafn33yWhKVFHzxAdgz1o6lv2uIibDNycrL557SIO2ndIJ
         TGzHJs58Y/qiChLj1yOFoUFhhhd2FfxTFeuuA5g/aakm0L28X4OPwuO/kuZjtbh9mzWv
         O0aqQ2Tn+e7UEDSMppNJ7GTFhrmhwIYcMPFGu7LilaJWKRX4c7kLBdHn/RW9opQStMX6
         95xmMmWHpWq9vrq+NVh1YF0a21jGO7AfEgPfQWIVvkJqpX08yNMiIkK0x3UkzoI2ViDf
         Z9JtnKxdTpVdYNeVDv9LPAEyDXj38R2OnJf2Q9YCX8vqQMKsrlS8xytR69Z9ppik7b7b
         FvyA==
X-Forwarded-Encrypted: i=1; AJvYcCVrP9zrQf9mvwNE/fAg/YeEtnqmqLX3drPT5xGNFzPtBD2K956gWISQv5hW4kkk8AYDK8hzH/rEEdVsVMavBzzk@lists.infradead.org
X-Gm-Message-State: AOJu0YzITn5vMDcx2rpGcdrlOs/zuKu2fX/KfjrvNVIser9TurYRE/69
	kr7mBz8hgSPKcTVXbEUVq54fFQL5rcf5juPCpsJhVX4wNcBAcGtkFUQH
X-Gm-Gg: ASbGnct2rHuVzzAsVHpGKgiPluPqeZnWgzHHhnU00I3mV9Lwh+A4n1WliH4e5WiOcB7
	y/W826sKVbLutPAJh4ffqeeyyTaUjW5HHGVwpkO7D+dWheQX625ECbVChnjQpdvdtkQY5wkuaAn
	Oy1UctV9BENVz/GHA8sdZ+nu8E8D3BYUv0liEtPGPVb/tgeZ+LumVznupbVjGFsRwMt13UtVrIe
	DmOlBhBWtJ8mwDlptSGHfG9z9zqlvyZH1v9162yTr0hpZTxMWkM33fe1qOYcF+SQYyWwHmvZUiG
	Vk/iL6tftMla/ZKWR8sJLuLes7OZy9YJrTm3G848kITgJjOWc5kQObkJVrJTeQGf//+8RSpQ2aA
	1wAKWpFnGpdfPnB8IujwQstTMMLK09o1GjaRznR5EiFkYkbmeOBd2f+AIICYXbZ2aUDOhU4sPjN
	c/Ik/0lYCOC2UvXlW2g9jMVVRKisZErWufipsPZkWM
X-Google-Smtp-Source: AGHT+IHX3KE00pQn3aNP1QwDiE6EhD5Q3hRD8inmO43mr2wuZ5/VM7zYPzKmzGmrYwsAVd3vpyhaEw==
X-Received: by 2002:a05:600c:4f89:b0:46e:3edc:2811 with SMTP id 5b1f17b1804b1-4711787750dmr167242385e9.14.1761231544110;
        Thu, 23 Oct 2025 07:59:04 -0700 (PDT)
Received: from Ansuel-XPS24 (93-34-90-37.ip49.fastwebnet.it. [93.34.90.37])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-475cae9f292sm39822325e9.5.2025.10.23.07.59.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Oct 2025 07:59:03 -0700 (PDT)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Lorenzo Bianconi <lorenzo@kernel.org>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Russell King <linux@armlinux.org.uk>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Christian Marangi <ansuelsmth@gmail.com>
Subject: [net-next PATCH v2 0/2] net: airoha: initial phylink support
Date: Thu, 23 Oct 2025 16:58:47 +0200
Message-ID: <20251023145850.28459-1-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251023_075906_351503_E54F27B2 
X-CRM114-Status: GOOD (  10.78  )
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

This trivial patch adds the initial phylink support. It's expected
in the future to add the dedicated PCS for the other GDM port.

This is to give consistent data when running ethtool on the GDM1
port instead of the "No Data"

Changes v2:
- Move setup phylink to airoha_alloc_gdm_port
- Better handle phylink_destroy on error path
- Fix bug for device_get_phy_mode

Christian Marangi (2):
  net: airoha: use device_set_node helper to setup GDM node
  net: airoha: add phylink support for GDM1

 drivers/net/ethernet/airoha/Kconfig      |  1 +
 drivers/net/ethernet/airoha/airoha_eth.c | 79 +++++++++++++++++++++++-
 drivers/net/ethernet/airoha/airoha_eth.h |  3 +
 3 files changed, 81 insertions(+), 2 deletions(-)

-- 
2.51.0


