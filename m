Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37A34C43458
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Jul 2026 00:50:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ONeYv8N9dUBr81lM9h8pInyopfZQ3N966Qn7edWjcyU=; b=YN6XXDY0RI/gjo2KnXJrPvfbZN
	3Hhz4/i/+G3EWGkPmcOCBZBVrZ+nbgmUIc0VNrybTfG1hE7xjCOyIRTMg1Qcx9sm5Nz1AEcmUSXTG
	90torMzAwTKSHBG5VcRWXY6lmRFzrK/GMXkgwdEbwrBTLB9dho//8LWV++w6D1DdX+szkyde10ll/
	b7tykLooRm/R5MlBRczErYaSUFUZhjhS4LpxneA6uzxxTQKrQPbAAZI6mPDzeXjwveqD5W04f8XDl
	SSFRgqye2jF3retjZ96TAFt4yjOVLXHp5Y9LkNY0Ugakuj6A4TCYOLN82OA6UHLJO1CWAIdcC4c51
	51+3XQag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whcxv-00000000fje-2A8a;
	Thu, 09 Jul 2026 00:50:11 +0000
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whcxt-00000000fix-1w62
	for linux-arm-kernel@lists.infradead.org;
	Thu, 09 Jul 2026 00:50:10 +0000
Received: by mail-pj1-x1032.google.com with SMTP id 98e67ed59e1d1-37fc02e660bso423554a91.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 08 Jul 2026 17:50:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783558208; x=1784163008; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ONeYv8N9dUBr81lM9h8pInyopfZQ3N966Qn7edWjcyU=;
        b=fTC1DC9zPhRwYfDNs0QzoBRfg8o/dTgAA6DdGLZKtNhO1c0HBdBU8eMec5EO4SdfAj
         ocZh7ddITy/EU2rlG7sORHRpzIkvwiWOSyMzjExRICdp9erbwsWf4X6Nyf5s8+Q5+P39
         78K8AVLltL4xQyKwT2crL5DWt7ekd94tB/CoeGDEKoSef90eyEfZrObgFY7xZySdDC0D
         BrN6/94+SRcz7spnIHphZpmMI2/se6ZkxMgl2C9HULgHEUJWNhyulU9ZzjcG+4+dJj2G
         Xp5IjDDVoolJ3HWWLSY5x5x4sSvayJyCmylcpHa1nwEYYFf03uK2kd/ix83ODtJUHkYY
         ZqyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783558208; x=1784163008;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ONeYv8N9dUBr81lM9h8pInyopfZQ3N966Qn7edWjcyU=;
        b=NTvh4Y8ZGd+UwdzS0BAloosyExvWiJgDz11QZ1znW688qGIy3dgDoHMX/1D88/lbw8
         3GAiGjKelOi2LHkc3R4TONZDiDlbQlMx1DS7fZkPql1yJbbDSkugAbmZ4zFFJQVWSJjX
         dqGcOGx4LH6xpZbJdDnns4Zn+3hBuOIDgJ7h5vUTv7ltEs+1GnivBcqp69oKFAVkH0yc
         DEtIAHqZwljvLFjPtCRLtG1YR0K/WNwCvbVrT98lIf6QNdx6CSrtMbnWLkNrqi7o+J4v
         tZJzF9SApdOhX197VKvG9eUKuDrr+HvFbVvsNuLMGqjFBd9LU4LAXtkir0sMphvYY0GM
         d+zA==
X-Forwarded-Encrypted: i=1; AHgh+RokRg/p5kjMR+zI1ep4ae/H/QW9KDqP1MuTgKFaXWX2RXt9tN8v5eLEZgZWSUcxXbZwDcax7tpjvCOgx+Ht1l8O@lists.infradead.org
X-Gm-Message-State: AOJu0YyVEXT6UbcAy2q1h7MUTyNQBekrozt0W6QaWlGhXoqZHeMmHEe5
	HQQ/A+pvlX9N9UxlM6YJ66z6jITXfDr7xVEra2t6NS9Ny8Q82hTW9Cj9
X-Gm-Gg: AfdE7cln0OdkHd7/BheIl1pk54v3gR1mN6FGaoHVIM7u8txfLjjsCu1u/WC4lValedG
	rxc6/cTvN+GYsikzzz/n7O43qM1NsXJFIinOQ1Bs8YTzlRhNN33c476rtVFWe3k8oh61xN8HxWH
	MZy+FFYDXqreSqxB9y4Un6Ox+Oaw9WPug8dsxNs+8idiD8VrYrlQ7uLgo4Zk9SXg9n86FtbJRAX
	zYItEuPjGKWZ5FXD8IarNcDZC7840YX9tJJFZo54lLK/x8bvV/lgjEdTJuQ5jXpAzrnB+710Llq
	zeNFCAF+bEmP4+/lMIMmOfpsAuXfe9VxEYp4gCOubB9fAvGfE4nRyND3um07xmBpPgnkyDK0kS3
	yxiT5ZA3oF7o/XePJlPYiRcGatpbNGL65xQXkzBaJ0jYn3cbbSiZtE9P51vsxj5lEGnbVW0PWjJ
	Kz2gbmvjAI9kQyh2PYNy0XLHwiYO0uoKNMNJwYJjH8Q+aX+mN81beJMiFFkK0vWzqVVumoFEJzS
	F8Z5fE0PpJSJxNNV1dIks1XUwOBcQDpD4FA3W8yHfbtfgxkPxH47hbLTmD1IdvhOn5MrslwKPbh
X-Received: by 2002:a17:90b:3f0f:b0:37f:d262:1e0a with SMTP id 98e67ed59e1d1-3893fd5f5acmr4857883a91.12.1783558207834;
        Wed, 08 Jul 2026 17:50:07 -0700 (PDT)
Received: from ryzen.lan ([2601:644:8000:7a86::e35])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ccc9d59e51sm35604605ad.76.2026.07.08.17.50.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jul 2026 17:50:07 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: devicetree@vger.kernel.org
Cc: Andrew Lunn <andrew@lunn.ch>,
	Gregory Clement <gregory.clement@bootlin.com>,
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Dennis Gilmore <dennis@ausil.us>,
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/Marvell Kirkwood and Armada 370, 375, 38x,...),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCHv2 0/3] ARM: dts: helios4: add regulator supplies
Date: Wed,  8 Jul 2026 17:50:02 -0700
Message-ID: <20260709005005.1587852-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260708_175009_552900_CAFD1E15 
X-CRM114-Status: UNSURE (   7.87  )
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

This series adds missing vcc-supply properties to the EEPROM and GPIO
expander on the Helios4, adds SATA regulator supplies.

v2: remove thermal patch

Rosen Penev (3):
  ARM: dts: helios4: add vcc-supply to EEPROM
  ARM: dts: helios4: add vcc-supply to GPIO expander
  ARM: dts: helios4: add SATA regulator supplies

 arch/arm/boot/dts/marvell/armada-388-helios4.dts | 13 +++++++++++++
 1 file changed, 13 insertions(+)

-- 
2.55.0


