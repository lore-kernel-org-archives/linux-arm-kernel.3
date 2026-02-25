Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2C5CFD45FA
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Feb 2026 23:08:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=xhDmJuAoZW5VMSQqsyhD5EcI7PCWrxtCTZMCIgCsggE=; b=rw6bRwB4kS4ZVt96kHSp+dbhxp
	QN3sH535I4ayvW99ar8pyH16gui90H7fHqGKpb4qPL8azLpCE5uIKPpQ7b9UMHyGVvN5GWyvtDaE4
	jJ6wie5YcON8NWkj8o868vdTdN+6HiQtOKojtUKzqPi5BtFDF5Nkg+Qryp6lkWwW+N6XaZGTYxqd6
	oN9Yfh2cgE0BEnUWH3yuRbWUDLYM57uxAsSl23TjNqsOhog5PbYb0K453+4E9RCYrJ06fiZaePtOc
	oefWytTH9lK7/0Je1OZfCgcKbaJQv1oMu7bxWtjCPDDSQRdMcHDcvvybxzo/TT1eEZlfGXIcdn0k+
	MDQJVbiQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvNzu-000000052QX-0aCE;
	Wed, 25 Feb 2026 23:08:50 +0000
Received: from mail-pl1-x643.google.com ([2607:f8b0:4864:20::643])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvNzr-000000052Po-2svR
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Feb 2026 23:08:48 +0000
Received: by mail-pl1-x643.google.com with SMTP id d9443c01a7336-2ad617d5b80so1015395ad.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 25 Feb 2026 15:08:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772060926; x=1772665726; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=xhDmJuAoZW5VMSQqsyhD5EcI7PCWrxtCTZMCIgCsggE=;
        b=HCPgYp/QKoDwrCNJ+AJQODk5bI/nkNw+vgWDureGrBPLtWntTSYIk8/bDCNZsAhcnJ
         HTzQcGKCSB16APXJpEjf2wQsLHZDzlj89hW2qSZS+9tZK3YP9DKegimZIgYNz41yuu9F
         N6rX2F0xYYvADnOkolj7GcZ205GWoa6JAGOyWbCRfFeQ9BhbmJGxu+B4bwKSouESlbu/
         NgVXfyovToE+TjKDLIC1Dkc4j4XVmWJZhKMzInp546g9mFzAtM9qEvDWhlpwrUPY0yyk
         X9KZgXMC0kkfxBch5z5lLGXmIPNjStUQv1dBamJUJp0Yw8SuY6m2x2HltxdM9THSltrM
         i36w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772060926; x=1772665726;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xhDmJuAoZW5VMSQqsyhD5EcI7PCWrxtCTZMCIgCsggE=;
        b=pWaTaecxwyUSj3WVVPYeU7t/Z85RGkXO26hJCqGf7hBUB3pUmK/neTuU/yYnYXMtlF
         nIY/e5hqLcOnBXWCgJEQZ1gPExNHFlOXtptQ2QsdKITx6nKdi564iQXyZm/DsoG1Qb6R
         Tcj4McC0zxIFfIjijas1xul/zTLAIFfy4cEQpnICJaB1BH5IknzjxjdAgb/sDEshRWbX
         v7EVpvxhOAPyNicu6lEerYG59TDrgihe9IW+f8ipWrSQpNix49x178EmjQBGpSc1GjI1
         0Wf0VpieCwtYIY0Iq9ciCYyaoLfO/ZOI3Bl7nkzWe5tSDUZ5161eXhmzzW+RUh+uQw3s
         0diw==
X-Forwarded-Encrypted: i=1; AJvYcCXaVYY7VzYuaXUl5KcC4HLvvq2Kdc+4VAIqrqzJfsj6+vXjRVCUc3Lh9eI9KUi0hA+IypR6+x3lVd0G4OYbWhfj@lists.infradead.org
X-Gm-Message-State: AOJu0Yzr6DEweTPPjAtmM+uZnrIiRlqms6dU6GYC/yW86RdhKGhNQYHZ
	bXlsmzWSrb0L2ro/W0Lc2MamLwA7AtHtaOL6CIH+rqXtDVo1+bNXMplq
X-Gm-Gg: ATEYQzwZ7sb5gFFoLOXmN1HtTx+73kSqGtdBo6UFy0fwbCZjMqN1HnFXB0+2I42Fiqx
	Y+o/YsqT+c5qVDxRlxEOr0ONw1CnHeRLeFHNNjWCWRJLKN4uUM9P6uEWzQ+k1qe2NhshHvKKBCt
	eUE96a23+M1qWZxLJH1h7OVujR7tqv8VZXJzAIj36SEtQQ5xAfXbZW7jku7VMtZ6jd6ZB39rVZa
	k7kDJlHzuHPmGsBQheXL5O/f+PNd0fPYruUIuUhn+2Mjq2nFws2d2TtdRTYW6+pBgMFsVm1JaXU
	lxq7Zq4c2Ipb2iKmbpqrFgAwTz35yjAtG21lSW1BucARcmcQtZjQZbDTdjQYTsj/mATJRB+5Ojd
	7UEmzscGTkPWD9IejO92xkUtmjSzEyUsVF2wwwrGLy9nGpWlzghWvjCcMP5O0x/uHp89iIrlULz
	l426KVYQhQ71wzhc3spNwpBqI7dHB1DtzXbVKZu983j/2Cpm83REXBYFTjv4iXNPRG
X-Received: by 2002:a17:902:ef45:b0:2a9:62f1:3fbe with SMTP id d9443c01a7336-2ad745136dbmr177955665ad.34.1772060926018;
        Wed, 25 Feb 2026 15:08:46 -0800 (PST)
Received: from ryzen ([2601:644:8000:56f5::8bd])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2adfb5b2309sm3378285ad.19.2026.02.25.15.08.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Feb 2026 15:08:45 -0800 (PST)
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
Subject: [PATCHv2 0/4] ARM: dts: BCM5301X: add WAN MAC assignments
Date: Wed, 25 Feb 2026 15:08:23 -0800
Message-ID: <20260225230827.21715-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260225_150847_750314_2C3B77A6 
X-CRM114-Status: UNSURE (   7.46  )
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

These are used to specify the proper WAN MAC in dts instead of having to
handle in userspace.

v2: remove commits with switch overrides.

Rosen Penev (4):
  ARM: dts: BCM5301X: EA9200: set WAN MAC from nvram
  ARM: dts: BCM5301X: panamera: set WAN MAC from nvram
  ARM: dts: BCM5301X: AC3100: set WAN MAC from nvram
  ARM: dts: BCM5301X: AC5300: set WAN MAC from nvram

 arch/arm/boot/dts/broadcom/bcm4709-linksys-ea9200.dts    | 7 +++++++
 arch/arm/boot/dts/broadcom/bcm47094-asus-rt-ac3100.dtsi  | 7 +++++++
 arch/arm/boot/dts/broadcom/bcm47094-asus-rt-ac5300.dts   | 3 +++
 arch/arm/boot/dts/broadcom/bcm47094-linksys-panamera.dts | 7 +++++++
 4 files changed, 24 insertions(+)

--
2.53.0


