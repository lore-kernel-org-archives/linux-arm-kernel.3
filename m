Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC997C71157
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 21 Jun 2025 07:53:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=QjH3SClgXI+/6Dzi1H3p1vPtwWYmzgf9jmyxigyRNKs=; b=3E38pk/qomLp+7
	MToElBcNi+2x43QeZFTJ+B8FyRdRUDEERg8GNJ8bZBmOX0RCtIzRt+TYFEDzj2sv/EKU/ehTb22Ko
	EwLnObsy9CAlYcsnBHkqE35VyY5lBJFu8IEp2IUP927CRgnREd4rXmG2kEVJyQ4iERZGYAfqU2eBD
	YHxahjpdkKMKjUgjQGyZ6jXUfJLH+t5/laXqVTtXTrThUVckS66v4trtyx25IGug674JSQ4YaYPxI
	1JxUDfxtIOOo0lQ8MkjLHPxq/R0TxHjIPfsi7zMbNh2dPg2HLYV6/A0ousbAnWNtwIN/6FOiOyfMb
	qDsIwtbuT+yaPwPN5XIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSt2r-0000000HDwA-3p0u;
	Sat, 21 Jun 2025 07:53:49 +0000
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSt0d-0000000HDls-3S5i
	for linux-arm-kernel@lists.infradead.org;
	Sat, 21 Jun 2025 07:51:33 +0000
Received: by mail-pl1-x630.google.com with SMTP id d9443c01a7336-234fcadde3eso35340855ad.0
        for <linux-arm-kernel@lists.infradead.org>; Sat, 21 Jun 2025 00:51:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750492291; x=1751097091; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=QjH3SClgXI+/6Dzi1H3p1vPtwWYmzgf9jmyxigyRNKs=;
        b=kIN0nu0o23HMECGTAFSYufMWuwuoKtCL1rHLx9fMNrhgcZLxViehJv+gnkM93Wfov+
         fn2nARIasKYbN9i7Yuw4Lmjgth6oICQrr+7LX8cipOlFlhy6fsMFVnJH1oSRRVCMTCjW
         9JUG0imMnxzlw2FpXuBLE8acZ4ZqQVumHPCL0MyjU4Sgq97YmHvyNXkFkka5XVmsnHxP
         MDbnKKTASJnGLUvB/p+PCIKgPHxwoA/Xi+Iz8/JXG43lZTTg+LoMW7+dqd95eUbTRMQF
         LuoNcJqakJyE/NCS1thBD87ThUgTm/GBYLRaQpjfHKADnPeeMnbpIXH5m4S2A1VTf7OQ
         KEcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750492291; x=1751097091;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QjH3SClgXI+/6Dzi1H3p1vPtwWYmzgf9jmyxigyRNKs=;
        b=Imr61uloI/wbIT2HDCYoD+aeJwY2QLxxa1IefSRYPHjL5RH6A7JKMNucwQmpK6oXsl
         31jwZZyqKF1jhl4mKQW2ICtmfwfQwZgDndOPz2VVu0UMCoy96u59ykOY7Sn3gBZT/Oh7
         GP14sC47bFKtZ9vmdOejY2uHgpuur5X9JxzwiOFivHU6eYQUW89Acn2UOm2Pye4eINNO
         zFnG89vb3HHHQtibJwMen1GArLcm4IfEpE4+ShzmegF0SVYo9Ktu8Y6uaU29HGTFK/1t
         4AVlJqa5iGvgZhnuDnQk2jTC0hZBTh4SM803Aoqtp2obJbws+RnMiW4vP3D7tf3zk8aW
         AKow==
X-Forwarded-Encrypted: i=1; AJvYcCXKnr+MXhk3urkTv1SZK3y5xDWHxUZtvGtjFjvLHC5M74DR/FJXUiLLNrpzXXtTSKwiFH8gWza0qrZwMnv3Q6jL@lists.infradead.org
X-Gm-Message-State: AOJu0YzatNbp8YYWx+/WMsb3+zsc5w/rBFWePX2KlbWv106e5OWtNL1y
	5ylc+90YG94owkFW3GMP7Aenv+jzYsAKWt3+IwQNLOSwRfQi+wignfDY
X-Gm-Gg: ASbGncumWkLu59ltTbFOf6gcLDp83kvi0V5HzfHDXV1Hn/NcmNxbbKXvXHzeKUP+5iY
	QahSFDT+Wb3jNjLQASqXjcOr+j1rmwZfhGsThGNC1NaCcF9wQnUbsAcfk+VFUimDdaPHYk5Hz7V
	xCPkkt+ooxqmBvrqua+pD+FOv/k4GZ9LqdcKZj1svW2sUdVCmESNdCCepxftEAYMeHzTV/oOBI6
	iIdlXVbrq3nZ3rh9EdKvz0JyxQZY4zSoXB+Loxhh5f/xvgvDyHbt0CksU+BL8SJsjEWsAl8hBTW
	PaJyRe2xQV81Rfhk/BMQzg2tOR8pnj9GlozmYhjw38E4RESrUj0oJn3R+uCSruLrwkHRabMGi2V
	FUqO7XacqF8fwsAUhnNc8yCt3ceSBNdo=
X-Google-Smtp-Source: AGHT+IEyGXu1Hnb5EyVdRM7a2b3XmM0IodUz97aojyFKVoSTQ6nDz9nCL93hZ+xKfu3PXPQjvFm1Xg==
X-Received: by 2002:a17:902:f64a:b0:234:b44c:d3c8 with SMTP id d9443c01a7336-237d9a74415mr71122785ad.37.1750492290735;
        Sat, 21 Jun 2025 00:51:30 -0700 (PDT)
Received: from [172.17.0.2] (125-227-29-20.hinet-ip.hinet.net. [125.227.29.20])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-237d83ee9f6sm34823025ad.73.2025.06.21.00.51.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Jun 2025 00:51:30 -0700 (PDT)
From: Leo Wang <leo.jt.wang@gmail.com>
X-Google-Original-From: Leo Wang <leo.jt.wang@fii-foxconn.com>
Subject: [PATCH v2 0/2] ARM: dts: Add support for Meta Clemente BMC
Date: Sat, 21 Jun 2025 15:50:58 +0800
Message-Id: <20250621-add-support-for-meta-clemente-bmc-v2-0-6c5ef059149c@fii-foxconn.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAGJkVmgC/5WNQQ6CMBBFr0K6dgytUIWV9zAsyjDIJLYlbSUYw
 t2t3MDl+/l5bxORAlMUbbGJQAtH9i6DOhUCJ+OeBDxkFqpUdanlDcwwQHzPsw8JRh/AUjKAL7L
 kEkFvEZpKmko3PdbqIrJnDjTyejQeXeaJY/LhcyQX+Vv/sS8SSqAajdYNUXXt7yNz/q7onTujt
 6Lb9/0LFAttqtgAAAA=
X-Change-ID: 20250618-add-support-for-meta-clemente-bmc-941a469bc523
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, 
 Andrew Jeffery <andrew@codeconstruct.com.au>, Kees Cook <kees@kernel.org>, 
 Tony Luck <tony.luck@intel.com>, 
 "Guilherme G. Piccoli" <gpiccoli@igalia.com>, 
 Geert Uytterhoeven <geert+renesas@glider.be>, 
 Magnus Damm <magnus.damm@gmail.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org, 
 linux-hardening@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
 bruce.jy.hung@fii-foxconn.com, george.kw.lee@fii-foxconn.com, 
 Leo Wang <leo.jt.wang@fii-foxconn.com>, Leo Wang <leo.jt.wang@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1750492287; l=1084;
 i=leo.jt.wang@fii-foxconn.com; s=20250618; h=from:subject:message-id;
 bh=N2liG/VEGn1zE58WPTY+qTYBZrxC0ajqZccxgE1zYhE=;
 b=fCy/a+Emc3jwuaGbTCnI1u0J6Q4wpXHsYr7ABj3llz3y/iKtON9QG4+bPd2oXl0lGKNnIwxHG
 1cKF4oLZlwrADnOQp+1mn6tAnP3IjZ8Ko7b/XEx7cz9N0S9VWrlOWg9
X-Developer-Key: i=leo.jt.wang@fii-foxconn.com; a=ed25519;
 pk=x+DKjAtU/ZbbMkkAVdwfZzKpvNUVgiV1sLJbidVIwSQ=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250621_005131_868189_7996AE15 
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

This series adds initial support for the Meta Clemente BMC based on the ASPEED AST2600 SoC.

Patch 1 documents the compatible string.
Patch 2 adds the device tree for the board.

Signed-off-by: Leo Wang <leo.jt.wang@fii-foxconn.com>
---
Changes in v2:
- Fix patch 1/2 subject line to match dt-bindings convention.
- Reorder device tree nodes in patch 2/2 to follow upstream DTS style.
- Link to v1: https://lore.kernel.org/r/20250618-add-support-for-meta-clemente-bmc-v1-0-e5ca669ee47b@fii-foxconn.com

---
Leo Wang (2):
      dt-bindings: arm: aspeed: add Meta Clemente board
      ARM: dts: aspeed: clemente: add Meta Clemente BMC

 .../devicetree/bindings/arm/aspeed/aspeed.yaml     |    1 +
 arch/arm/boot/dts/aspeed/Makefile                  |    1 +
 .../dts/aspeed/aspeed-bmc-facebook-clemente.dts    | 1254 ++++++++++++++++++++
 3 files changed, 1256 insertions(+)
---
base-commit: 52da431bf03b5506203bca27fe14a97895c80faf
change-id: 20250618-add-support-for-meta-clemente-bmc-941a469bc523

Best regards,
-- 
Leo Wang <leo.jt.wang@fii-foxconn.com>


