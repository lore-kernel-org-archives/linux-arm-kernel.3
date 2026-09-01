Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 056B8C624D4
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  1 Sep 2026 12:58:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:To:From:Reply-To:Cc:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Ld2dHDdDQiF6ur3QIWVOyuCBe04N1lf3nFHFqeQJu60=; b=P+W2MqBYwPxMNwajUgudMZj4yS
	Dt8sWr5SVpgXyBC7ul8FOU9F7Xk3Zyq0zY/EVMz2/TLY6w7JDNE/I3IV6zb7IKgOwKJQWp9vxxMCM
	bmjgHvK/8rWi5gDYGgtHUd5BJcQeohuykcIfBpdZa47eRKnEiOkBssCwJqO1XPOKYlycu82cMuWx/
	2dTq7WRHQTPSLqcJug89n5FB4nHHaYK8T0GnscWNq+RwpQ6CRw8NvbCw0VrcDU+4rSW0uD8nBvSx6
	QKnahFAb4MZsVWZKD4m0Kf1G2CXpbdqGTYMD4wdosjbUvtRBmPwlT443XBgSsFSGUhlLJkFXwQMoW
	f64FOkng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1O4P-0000000C9BS-12FT;
	Tue, 01 Sep 2026 12:58:33 +0000
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1O4M-0000000C9A7-1mDg
	for linux-arm-kernel@lists.infradead.org;
	Tue, 01 Sep 2026 12:58:31 +0000
Received: by mail-ed1-x534.google.com with SMTP id 4fb4d7f45d1cf-6a6108734d5so694260a12.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 01 Sep 2026 05:58:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788267508; x=1788872308; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Ld2dHDdDQiF6ur3QIWVOyuCBe04N1lf3nFHFqeQJu60=;
        b=ng7KKaWqT6/XV+FiKt91qszscZP7rzjhs9fJpFKCziWCEAMH1WAl4+e3rXES4L6A+I
         qo3Zy8Yx+C1uTgFZT1comzOSe8fqFmKzzIf7SLO2fyMpaihRi0ByYdaDQkuFRQiWVvij
         F84NjGGVIhDdRdzEh/RObWkg+L3h9yb2VZHPxuZ2CeRvVSL1pb3j+4Vl9k3CTauHNhHl
         jNgFWh/rAG5iIDiua1MHnZDYlGXnUwDUyqg/amBZd8dQLYf0PeJl0gjVJE/JUcbuaYwV
         IGLysUq3OyJkHxI8VfCfnsj7BGbsau4qpkuQ3l6bQ7QI0YgxdluU6FmUlv79awzLJde3
         8/GA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788267508; x=1788872308;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Ld2dHDdDQiF6ur3QIWVOyuCBe04N1lf3nFHFqeQJu60=;
        b=StO80YANGbXyRPu7OPfZozJl0euWqnKS43fJkdzlDd2+5l8b1AvsWwvUdcseJW0Q/M
         LuaNhItLfgx5nIBXEx10EOGae9+BMG5CnXQbUT9xQ+20OCt+/qaX9o6vF9tUY+Y7eq8u
         oFWsKzAVL/+x9qe/FVA1W6Q9gshQdFWT0cBop8tfELuIlTEPuiW4Sy+utDHupcWFNuWD
         FVDRZpneB5lT/QUh3XOn0BKmV+Px161DUr42xJTR11Au/VLCGRA5Fa00KhIvIKYdrJjv
         7ZJeTf0MEmr+XX9nkYXl6rNh5zPSKl27Bg5GR0t/XDpylGg74+Uc0IfFGh69KRJ+e7tN
         HmuA==
X-Forwarded-Encrypted: i=1; AKwUvBx5vGjH+BGAoOPfVkxu53xtD8/uMp9xsUGhVmmngKlwfTmn74Bp9FJTiEmi76LI9ug7IBVjYl3CqNJMx92jR6g/@lists.infradead.org
X-Gm-Message-State: AFuF++lcHpLywasphpjcKgT3wCUHUg3L3kYV04xbqQbFccWQl+XzX6Af
	5Xl1KVnpXg5ZDzp5jw4CRmM6DnfX+Z7i704vaILKgSAMkd+1MRCXPkigagiRqErh
X-Gm-Gg: AYBFou20PrQUTyTdR0uo5oZNWHHNygp6rPO5lb6x0z67vXHASHIA580RxuXMoe6bNde
	sKhvviQSBhh0poGN6jjmK6Ai7gPj0Uh9BZ47Nc+N/q1brmf/3NI2vmhyv5v+eC9SLBVN/LX798t
	tnf1yVWZgjAJ6WWK9t2foy39M1xOFHk2UxeYMYRbkHha+Qe02wMAUJc7h0s/0ToM/OvgNtbVB2C
	G0FyKsO5X9XTjdM8ccIDagXcfF6PTHIJlAj1tNx0ZMzxdVvDGMCxC8kD2EiaS4ZbQpsZLSd/smD
	XsBoEfdoDm8q9WhHqAdi1L36RfAV9CobGeQpTZQFUL6xCjS6qHOoE4DP7kq9rAvUapXpUtUX869
	q2d3MAgwml91oeGNhvlz4anyEEs074kqEXCPev7mOdQw0begW6wZRPXCrayyM3DoUGGHqglM34y
	Cqw/jYvgwwqVUzAyiLpVGMT8RuhCI7GZCG5CQXeQKsw6LhEfpo+zkpBwVzFyee2pL1Vow7TQiHm
	2duoNr6vANUMpdhF5h8SSVOyWbMRh/RsO89iMoIGFF2WTEthTh6gox9HuEe+Nc=
X-Received: by 2002:a05:6402:24a5:b0:6a3:95bd:143c with SMTP id 4fb4d7f45d1cf-6a663a26d14mr6639703a12.5.1788267507997;
        Tue, 01 Sep 2026 05:58:27 -0700 (PDT)
Received: from Ansuel-XPS24.localdomain (host-79-26-252-140.retail.telecomitalia.it. [79.26.252.140])
        by smtp.googlemail.com with ESMTPSA id 4fb4d7f45d1cf-6a66d15d10asm773959a12.28.2026.09.01.05.58.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 05:58:27 -0700 (PDT)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Christian Marangi <ansuelsmth@gmail.com>,
	Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 0/2] phy: airoha: add support for AN7583 PCIe PHY driver
Date: Tue,  1 Sep 2026 14:58:16 +0200
Message-ID: <20260901125819.20378-1-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260901_055830_472637_91282A99 
X-CRM114-Status: GOOD (  14.99  )
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

This small series introduce support for Airoha AN7583 Gen3 PCIe PHY.

It's not possible to reuse the EN7581 code as the register changed between
the 2 SoC and also the setup method changed (different calibration logic)

Putting the PHY in a dedicated directory is also needed for other series
current pending that will add USB PHY support.

Also a dedicated schema is added as the register names is entirely
different compared to EN7581.

Changes v3:
- Improve example for Documentation patch
- Deinit G3 PHY on QPHY error

Changes v2:
- Drop move patch (handled in different series)
- Rework to regmap implementation
- Rename files to more specific name
- Add .exit logic
- Drop QPHY in favor of external PHY handling
- Update schema with new requirement and improve example
  Link: https://lore.kernel.org/all/20260827122127.18874-1-ansuelsmth@gmail.com/

Christian Marangi (2):
  dt-bindings: phy: airoha: Document support for AN7583 Gen3 PCIe PHY
  phy: airoha: add support for AN7583 Gen3 PCIe PHY driver

 .../phy/airoha,an7583-pcie-gen3-phy.yaml      |  65 ++
 MAINTAINERS                                   |   8 +
 drivers/phy/Kconfig                           |   1 +
 drivers/phy/Makefile                          |   3 +-
 drivers/phy/airoha/Kconfig                    |  13 +
 drivers/phy/airoha/Makefile                   |   2 +
 drivers/phy/airoha/phy-an7583-pcie-regs.h     | 377 ++++++++
 drivers/phy/airoha/phy-an7583-pcie.c          | 826 ++++++++++++++++++
 8 files changed, 1294 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/devicetree/bindings/phy/airoha,an7583-pcie-gen3-phy.yaml
 create mode 100644 drivers/phy/airoha/Kconfig
 create mode 100644 drivers/phy/airoha/Makefile
 create mode 100644 drivers/phy/airoha/phy-an7583-pcie-regs.h
 create mode 100644 drivers/phy/airoha/phy-an7583-pcie.c

-- 
2.53.0


