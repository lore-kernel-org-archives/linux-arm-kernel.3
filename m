Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BBBA7CCD1AB
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Oct 2025 19:33:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=eceHFX0RmtQDMq4x5hNy8OnbHWKSwCTIDv7MpsAV2Jo=; b=ER/ZJcPmEFkpRcYGrPJaufBeWk
	CmjJETUdp5nLC3Dee9W2xVxxW3nycJ5VovO2MnhMYf47f+AgjGwzfbzlz2kfFpidDLfUxYt0xZjON
	thD8/iXTSq4b3g22gR07Kmj2mBpSobFJjw6F/6OBsqNl5Y1OBkKn1W4l3pNEaA7XbWClzwGYvh5GH
	c7FbZ+i2gNW/WhWiQWQMNsP+4BpNuGDbWC6TNHKeikiLFqQK+RW5DTlreiep+sYsYKN19i2VMGTAj
	sI/M+CIKx1jyrYsFY62+eALrqitbIR/AgZ7coib2M556ceQywuSz81elpL5B7jCaqXi0wkykIGwmC
	WqMmS8aA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBI6t-00000000Uzl-0iQ1;
	Tue, 21 Oct 2025 19:33:31 +0000
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBI6q-00000000Uxq-07jl
	for linux-arm-kernel@lists.infradead.org;
	Tue, 21 Oct 2025 19:33:29 +0000
Received: by mail-wr1-x435.google.com with SMTP id ffacd0b85a97d-4283be7df63so1827734f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 21 Oct 2025 12:33:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761075206; x=1761680006; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=eceHFX0RmtQDMq4x5hNy8OnbHWKSwCTIDv7MpsAV2Jo=;
        b=V7/hR632+S7Dy7mSkBxvr6g7bhqjnxDhV5FJ3aRE5UukZ9jniJtJkeeLTkUDH4fDIl
         GZgKqn840IT7LjXHpMSk+KAJsql6GnGaGBEkbC9uSAdxK2rAOOYSfyS1vk7ae1l9oIqR
         ipCT9SEi9xdFTcSBDZDDMnfvOLm+VL9qRilhceltcjWMGWR/jUsriUrG2sIYHx8Vs9ZY
         BH4vxzAiRQuyRjLHF0nGnjjMK+Vot72t/0Bv2YzRcDx4fVFatoReZXc6uUuuUIRnf9CH
         vojLLXVRa5oV+qqod7nyj9eOQEnpSpqdgL3r/fXTNkOsGhbEQAs9Fs8i73BbP9td8O2J
         bgXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761075206; x=1761680006;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eceHFX0RmtQDMq4x5hNy8OnbHWKSwCTIDv7MpsAV2Jo=;
        b=blM1tsOCbMs8bYFzv5HuTZGXSmtF3hBOY/Z5wWzMma7pcu59zoZ8oY0DxhkNZ9y8BL
         B4Jd4SiKy7hkLO1S1CM2WzxvMOcqHQuDlc5hWTeo+zcblCbw+iwGuH9BcbscSfIqxTtD
         hDBbHnUDL/uK4od8YmWVcgHXFgpVeDjXDcOh5q0YXIYEu1dzzeK6+6p0dJzIBlSm+/1l
         XuZSuNvGmvwGkfDrGVWpYQLP7CJCT73UZA+NngKsU/LSUFrJEP+JbuTDZRJuYqLntfc9
         9C8+EXI33F5txFLv7mt+i5PaSL7IwFb0YPGsMT7FySPEwyqvEU7breiHqmXdoMFOcKGH
         DcKQ==
X-Forwarded-Encrypted: i=1; AJvYcCW9gGKMkqdpMvo7t/2AgCiqKeFlB8bgEjHTEdiZNWejfqxA6Ro73CqBiacR2hRlaf1Y1Zm5zgtpge0RUsTzdyUk@lists.infradead.org
X-Gm-Message-State: AOJu0Yw+MypqkYNME8TTrOGik/GXznOGWPpRbXI6ha9hwpyAcv8M9H0X
	dSxZ3nV8klBHOdLk9VdmlyurvLs0ipc0M88cSAxbzhhqO0wn93uunc7TkrjXAw==
X-Gm-Gg: ASbGncsfq6qkRweNodRmn61M1q0oPtoSan4kxjEe1zSCWW/x0o+gfhUq54axm175302
	2o0HVQD+c0K98PfE4OzpeYmrtubGsqXg5vREYvfe8PvhbBu5gsmjB/+5CTuU6rvx9KVMzYMVq76
	QKrZvzrDJ7C8tbujsRRBfKn4yz29/VDzRoPpHNTiYFliMgdQWjCUHKxdmVatBbWwYDbDYwv2NJT
	k7WbJVLM0+C2nRH4DIvvuRjobaw3/vV8cTLZEg8xfn9XPnwCPcvnnFLgHIggotv/rvauyOV87LZ
	NGcdTKVz+QJ4NST75pDl7a/EtlsjxaE7PypG9jSFGSgGlOTd43NT+CMLcmBZXrRilhlj6k1z16f
	zZbxdrshD15b/vD+RvA1FUbCp7rA2GaRhu8023zihUs9eIQB9jZZMdMGzYmTI8TYREcRe87d7H1
	iWXmttM684uNoaj+pFuDllTE+FxAE6YYkOfAptcvyE0/s=
X-Google-Smtp-Source: AGHT+IHOYqls17257tkZfrI1j3S/rbxbkd3G5LS7Xa1V5wyrUo+IQJd6ypdrMXOGDYIilpkwXDnmEQ==
X-Received: by 2002:a05:6000:22c5:b0:427:492:79e5 with SMTP id ffacd0b85a97d-42704d7504emr10968810f8f.21.1761075205922;
        Tue, 21 Oct 2025 12:33:25 -0700 (PDT)
Received: from Ansuel-XPS24 (93-34-92-177.ip49.fastwebnet.it. [93.34.92.177])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-427f00b97f8sm21327187f8f.36.2025.10.21.12.33.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Oct 2025 12:33:25 -0700 (PDT)
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
Subject: [net-next PATCH 0/2] net: airoha: initial phylink support
Date: Tue, 21 Oct 2025 21:33:10 +0200
Message-ID: <20251021193315.2192359-1-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251021_123328_100579_F8D6970F 
X-CRM114-Status: GOOD (  10.28  )
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

Christian Marangi (2):
  net: airoha: use device_set_node helper to setup GDM node
  net: airoha: add phylink support for GDM1

 drivers/net/ethernet/airoha/airoha_eth.c | 110 ++++++++++++++++++++---
 drivers/net/ethernet/airoha/airoha_eth.h |   3 +
 2 files changed, 100 insertions(+), 13 deletions(-)

-- 
2.51.0


