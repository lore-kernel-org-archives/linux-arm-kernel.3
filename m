Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B575ECD343F
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 18 May 2026 03:35:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=O4z4QeYZgLmQ+74XBWrLJRwdCJBglkAJbbIu6ajXqKY=; b=vWe5ySjY4+WDkYUM35eHf2QxfZ
	wBWAjgO7MCW0PCTx5rCVxGMZPlZDe5Yx0UKA6hQImsura/Nf65hoJh6w69PdqNXuRYfo7MqxlhFNH
	KmdoLDkLrB5+6wTNhYxX4ITNNNL3fa5vGhPv0oElYIZb437sqZAp0O4T3BY+Vw1ITvqwBd5uoJSHV
	lQppgcGAbtipyRzWEXtnNeYD/7hhFuzrx87TZy4p6vGHF7/T9O6tYpA2i7qkl0u1+pn8WB4MZsjxx
	oUV4ZmQx1LnD2ZyRF7/I2IVQEc0VPxorDz7jRNhbVPLQm6uxa6oECKPDf9XAWFBhSRBsxYOcIeocT
	7IsXj3yg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOokq-0000000E4Q9-0DSA;
	Mon, 18 May 2026 03:34:56 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOoko-0000000E4PU-1Pvc
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 18 May 2026 03:34:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=O4z4QeYZgLmQ+74XBWrLJRwdCJBglkAJbbIu6ajXqKY=; b=Bec3aJKSQYMcREpXXA5RqVgjUn
	4IFx5EBZRVjH6QhsdCIdW+3EF3nYsJHLsTyTJHlMFlTJei6BIUB671LH+aiFH9IrU0hkHEtFi+OeL
	zMpDm64N8qonQ96eNYLUGmWwaE/F7RoYwjFHrb3JWJ1MbOt4e1WHlS4UnLEQHQgCWwLwYNtaVbZRN
	E3878Laww78gxac+IyhgPmS5HNNhcNNgUkj+4OFlaw18rXW0fnN2Mq9Jzvzs4wCm3m6FxcOHMgknB
	Wcdpgpyh7JD+ZovKIzSmi6nFpwRkvxZopeGPmMJXQmRdwIHmh795wQWlinyOPy6xwYTzKO1Te9/Lu
	08aGZilQ==;
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c])
	by desiato.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOokk-00000009kdH-3rsb
	for linux-arm-kernel@lists.infradead.org;
	Mon, 18 May 2026 03:34:52 +0000
Received: by mail-pf1-x42c.google.com with SMTP id d2e1a72fcca58-82748257f5fso1666552b3a.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 17 May 2026 20:34:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779075289; x=1779680089; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=O4z4QeYZgLmQ+74XBWrLJRwdCJBglkAJbbIu6ajXqKY=;
        b=CndJuZPfENXNYTbOqPNjwLxKv29eXHpSPFk1Y4JNdqbuQCnCTfQvRWPGtYFnfO3mhB
         +OHOUVGJmLbR9FM8rFK9ZHhrZROnHUKRVePijbcNQUVbRZhGYg5rwe4IRS4KoVJwHUKH
         IIEwD5cozpTTYQZO6rR8SKd69AQSzsQJiqdHcHsQWZeKnUwO/uFeHXkj8PM/gdCXYoQY
         j+RVLzKrEDaaokSKL8q2AiAiuITil86yj3rTUZfhNlY1anOp5DvcFhsxF7EL2jNwn/Mx
         i6ngiRBrUVZyv/xbNuYz7hUBmZPfwh03+qRkE1fYa6i0cYzexyjI0f0z27ikUoGwSkBg
         k0Qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779075289; x=1779680089;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=O4z4QeYZgLmQ+74XBWrLJRwdCJBglkAJbbIu6ajXqKY=;
        b=JTg69zbstr24oTAqZLD8ykDX9e4ad0BRiLnPbrG7nEnnI7T0vsaXIaw+1904ygAF4k
         9k5JyyWjfo+lVAmxxMjoN709+xKxkiInxeGpHkclDOpOozMkp/c7jpwZGNuE2wYNgug/
         ZeqvcE0eyN7ENBN62r0tPndnvuEwbosw0RpFyDHDeKC6FbVVqM47pOiBc23fhccjc9/i
         rlgM0bP9ArvBYtIJF9ix3Oqml+tpETS3HLeAotok8HXoJLisCl/Mhbl06gzV0mvu+7m8
         uQT4sgAWp+vf8LUW8eyTbuWoDxBzSq+bmpo8XV16PPXNCXCcfLvWqRD+HcrMBT6X3NWd
         2JEA==
X-Forwarded-Encrypted: i=1; AFNElJ961+Y283G4MeRZdC0rGDy0xcdG5Vl/DLC+NqgJ1zngUk0+G9w1mhYAYvGv2KnBOX1AiPWE60p+Ft1yPmTpmWa0@lists.infradead.org
X-Gm-Message-State: AOJu0YzDU7U0sS6Y3qYhA28sFl1USfXfsrHvK+I6GXjtdOWW8X2nMJoM
	TQdgT1yYEGHn2ul6+0Xy/I+5QMmTI3zFik1QESiHxKd9xdot6Cts+6da
X-Gm-Gg: Acq92OH/On7oQz6/QOYD/ABc5iqmjzGUngAP0nNFkFqhrhGshkgB1WkF82R1RPIQxAl
	2oxQHYrHdl2dA4QpLgkbu0+xw4G4a1fG3YHQLj5PS2Q/mEyJv0/g2/Pd8m0uO8S2L4DjER0kQvl
	vczqOAjpegi+KPsbuwSP1p9lPYVfpphwwJo5ga2di0WfT8wGAnutlGHESOh0CnoT/QctjcWo1Ph
	2m1GcZGRl2VMVT8aOSSh94r1PFPHWjduQDjDghdNglN6zz4eWq4YUHX9BIDRJX5pSS2b5NsNzXU
	ZsPzcgcUMuJJZSG7J9FSYgMkQ5pGBBkkwUOilMW3kPZbJcI058quNXpG/U6Ag+ohyqtN8MvHFo6
	WgudLx6eXY16t3Jp+HnEHMyETtZKvO71Hp31u+vSJanfeeho7YabqwWIeq+53zzm1UpUXfX06pH
	neg/4c+Yg70a9PZInbDTYdjViRrnOC+BJq1ILqk98k
X-Received: by 2002:a05:6a21:3987:b0:3b2:8674:9830 with SMTP id adf61e73a8af0-3b2867498e9mr3029580637.14.1779075288739;
        Sun, 17 May 2026 20:34:48 -0700 (PDT)
Received: from debian.prasanth ([103.177.82.201])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c82c4031662sm11183717a12.16.2026.05.17.20.34.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 May 2026 20:34:48 -0700 (PDT)
From: Prasanth Kumar Padarthi <prasanth.padarthi10@gmail.com>
To: joel@jms.id.au,
	andrew@codeconstruct.com.au,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: andrew+netdev@lunn.ch,
	devicetree@vger.kernel.org,
	linux-aspeed@lists.ozlabs.org,
	linux-arm-kernel@lists.infradead.org,
	Prasanth Kumar Padarthi <prasanth.padarthi10@gmail.com>
Subject: [PATCH v3 0/2] Add ASRock Rack B650D4U BMC
Date: Mon, 18 May 2026 09:04:38 +0530
Message-ID: <20260518033440.17569-1-prasanth.padarthi10@gmail.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260518_043451_368475_501DBE77 
X-CRM114-Status: UNSURE (   9.69  )
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

Add initial devicetree support for the ASRock Rack B650D4U BMC,
an ASPEED AST2600-based server management controller.

Changes in v3:
- Reorder board DTS nodes alphabetically by label.
- Clarify that the management LAN PHY is an on-board discrete PHY.
- Keep MAC0 phy-mode as "rgmii-rxid" based on the extracted vendor DTB.
- Keep flash layout unspecified until it can be validated on hardware.

Changes in v2:
- Add MAC0 dedicated management LAN description with MDIO PHY at address 0.

Prasanth Kumar Padarthi (2):
  dt-bindings: arm: aspeed: Add ASRock Rack B650D4U
  ARM: dts: aspeed: Add ASRock Rack B650D4U BMC

 .../bindings/arm/aspeed/aspeed.yaml           |  1 +
 arch/arm/boot/dts/aspeed/Makefile             |  1 +
 .../dts/aspeed/aspeed-bmc-asrock-b650d4u.dts  | 71 +++++++++++++++++++
 3 files changed, 73 insertions(+)
 create mode 100644 arch/arm/boot/dts/aspeed/aspeed-bmc-asrock-b650d4u.dts

-- 
2.47.3


