Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3954CCA470
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  1 Oct 2025 08:48:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=XMfpQioL9qF93r02i/m3R/Lc2dj1xsmt2jY1yN46fE8=; b=QVh5KAIh5rsTPJ
	Rh8elabDkro1JmrRH/RRkv70LisM8v1Ob+EZHt5ju4BkxuMI14FidFcq2vfwQfqQ28mc/rJP9OjWD
	4QVOMpYaXPIdtMZlf9zqZh9ZsmOpl586TTMOs9FsMt+0RRF/e01EGzmElTHD3rRFDh/ZZWeBFepGQ
	EpPaT00Y2cmLgMuarquN0ReZe3upcxUGH407DDx9lAjK6zms97OSl2/mYeff+MpWvhF7To8DtC6bG
	suaUxOGwN9AhSn+xVIqMpO747p0jWAzTMn6ha3kTb/sheSPOj8iZ0PeSCtxoJjxoGjXm8vQjqGUrb
	Vjsfcpkn7Em578WA0rJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3sVJ-000000074HG-3Ypq;
	Wed, 01 Oct 2025 08:48:05 +0000
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3sVH-000000074Gm-3q0m
	for linux-arm-kernel@lists.infradead.org;
	Wed, 01 Oct 2025 08:48:05 +0000
Received: by mail-pj1-x102f.google.com with SMTP id 98e67ed59e1d1-329a41dc2ebso5838555a91.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 01 Oct 2025 01:48:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759308483; x=1759913283; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=XMfpQioL9qF93r02i/m3R/Lc2dj1xsmt2jY1yN46fE8=;
        b=gk23fZgpuCdkIykSJwvRGv672pl3u7d7Y2GTMyXRZ3Z9kEI2QUpkE5Ot2C9KD3v/1I
         h3sYw1YvMa1l+4Dn85wq0gBr25TFdpXfVF8J8qqDlLv0nBdGAOzvaboPyFxt8IWhhmCA
         NgyuLlTnd/+2kfiEnBUyR0glERC88tUKAPj2q9GnnFCrxnxCoamG+53KhicSOYIDjHaj
         gOAWW2dWuUddXCuD3tmzReb0p487nkDLipvQ1/uWpRLK46Az3pqkZcJnlB+L4iF0jDNV
         gZez6nvhzpYS2mpz4hvPfbdPlFSe1dUGcNRRW28cqDuZ9FbRGbetGfaavx1yy5cF0yWA
         rXBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759308483; x=1759913283;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XMfpQioL9qF93r02i/m3R/Lc2dj1xsmt2jY1yN46fE8=;
        b=VSTaMy2y8s4Xk3p9n6Me65RcA7Pmz6D6IwLdNusfyhPdOU2TJVa6I73MqDGwn5BeQC
         V0qnpYjNqn1iFS6YR8o9/eL0dOrs07PfnQ3YqMkJbhDwVBYeu9hO4+qNYawlHHWNuoPs
         JmCgRjBO21YCSetC94JyJJRNE6B2jH/VTjpn6YYxBiYYCubWafOwWFOJb3d6DtjNqtE8
         us3LqduXoBxtyk9L6vOWmXok9m6Wmo80BuAsmGVL0F5NifpSOgSQJj9foPq3OLl+7FW/
         C8gwvPWmIer7uosUT7ssPozZC5q/GcihV5G3kA8y9rWJ3ZNiCdczdNGGx8PcEzSYBj+K
         /5Ww==
X-Forwarded-Encrypted: i=1; AJvYcCUb5kLt5ivu7xWGKuQgV6YL5jinsYFj6+KvyF0ELK5moPGB6n/pA86Tx/cuSs+6eNfz9KJsgeUFPLH4qDvZ99ay@lists.infradead.org
X-Gm-Message-State: AOJu0YyzbCd4CRNsRWxAx6i1yzqjXRA+bEJG1fRgxo0ERF6Cx7ytYg5w
	qkB/0RhA09T7YGIkwkjjAKCHf92AqidK2TBHKrkwTbHlGmCxViBZxX1V
X-Gm-Gg: ASbGncs8w2Y2RmnEFNGJsb1VqSsPoUsFmSVVXG4e0A/415A7DWWLQQjZQNgqQEQwbeB
	kpbAi5KvW8oebQDFftjOCRWzYIPLla7LstXZXFd0hgiQcstMhX1tkw6kmQ5pYUuSQHMVSr5j8kf
	D/ajm1HdAUqGhDx3mVOj6TLZCRwho99btEKYXrfaRHJDeIz+K7xU1n4MBPWeIH1IpWUgY1S96BV
	DI+srX1nu+pTkHV//nmAUUyJ/rzhh2yqukbZDdJDlsJmHnkH6AucA5TBmt2VkULiODtWTSyReg8
	7zqvNM3JzU8eCqGy4XG/bnRY3hskmGOZaoyj02tNTMmkYCfuJqFm9JIFa1nBfOtGVn4LQA7g95Q
	iGdpA03ZG4sTvsmbvHN1wQyFAieuIKM8THnUxqiUeqFY2aZvVxTtZcf71RmoBNVH3oIQ1AZb9g4
	GORZ4vBSEdw7kc+44ApSV+HLkXLZgLWfvox490SI3vIdQgQzX3l1Z9tXU5ggAGxurBSyK50S+Rr
	4m6DB9R29QSuY/KE5WWD1C4lx0jffmZZrN8FXIojzWXO7E=
X-Google-Smtp-Source: AGHT+IFnWYeRu9k4Oaa4bTAUDYxWIdWeHxGT4Bg1jpuCkukhqqyjsyyOYdJn3LPL9nXEE8BZUqnazw==
X-Received: by 2002:a17:90b:1e10:b0:32e:59ef:f403 with SMTP id 98e67ed59e1d1-339a6f2e80fmr3239453a91.17.1759308482433;
        Wed, 01 Oct 2025 01:48:02 -0700 (PDT)
Received: from 2001-b400-e387-f8be-46e6-cc88-b318-45e6.emome-ip6.hinet.net (2001-b400-e387-f8be-46e6-cc88-b318-45e6.emome-ip6.hinet.net. [2001:b400:e387:f8be:46e6:cc88:b318:45e6])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-339a6e9d22bsm1789250a91.3.2025.10.01.01.47.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Oct 2025 01:48:02 -0700 (PDT)
From: Kevin Tung <kevin.tung.openbmc@gmail.com>
Subject: [PATCH v3 0/2] Add Meta (Facebook) Yosemite5 BMC (AST2600)
Date: Wed, 01 Oct 2025 16:47:49 +0800
Message-Id: <20251001-yv5_add_dts-v3-0-54190fbc0785@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIALXq3GgC/23MQQqDMBCF4avIrJuSTqKYrnqPIhKSUQeqlkRCR
 XL3pq67/B+874BIgSnCvTogUOLI61JCXSpwk11GEuxLA0qspUEt9lT31vveb1EYbFrrbtoPTkJ
 5vAMN/Dm1Z1d64ritYT/xhL/1v5NQSKGM1bYl5Qw1j3G2/Lq6dYYu5/wFm+YtzKYAAAA=
X-Change-ID: 20250924-yv5_add_dts-9268ac14dfc0
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, 
 Andrew Jeffery <andrew@codeconstruct.com.au>, 
 Geert Uytterhoeven <geert+renesas@glider.be>, 
 Magnus Damm <magnus.damm@gmail.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org, 
 linux-renesas-soc@vger.kernel.org, Amithash Prasasd <amithash@meta.com>, 
 Kevin Tung <Kevin.Tung@quantatw.com>, Ken Chen <Ken.Chen@quantatw.com>, 
 Leo Yang <Leo-Yang@quantatw.com>, Kevin Tung <kevin.tung.openbmc@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1759308478; l=1447;
 i=kevin.tung.openbmc@gmail.com; s=20250924; h=from:subject:message-id;
 bh=QvD/ud6DrodRNKqUA2m4nL+/50pX/gxXw21okP8DcUg=;
 b=csBBxtxldogEQ8rY3FiSkJeHOhzuac4zcoGG5wphIcMFi6EvJcjhMsjESJ6SxzR6pTZfm9a2t
 NfCmbeaOchxD43dDjoBaxFLMKIIuBCb4bv9jKCT5u50KF6oapTWBuXE
X-Developer-Key: i=kevin.tung.openbmc@gmail.com; a=ed25519;
 pk=PjAss0agA0hiuLfIBlA9j/qBmJaPCDP+jmQIUB6SE7g=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251001_014803_960789_184644D7 
X-CRM114-Status: GOOD (  10.25  )
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

Summary:
Add device tree for the Meta (Facebook) Yosemite5 compute node,
based on the AST2600 BMC.

The Yosemite5 platform provides monitoring of voltages, power,
temperatures, and other critical parameters across the motherboard,
CXL board, E1.S expansion board, and NIC components. The BMC also
logs relevant events and performs appropriate system actions in
response to abnormal conditions.

Signed-off-by: Kevin Tung <kevin.tung.openbmc@gmail.com>
---
Changes in v3:
- add missing dtb target in arch/arm/boot/dts/aspeed/Makefile
- remove unevaluated property `ncsi-package`
- Link to v2: https://lore.kernel.org/r/20250924-yv5_add_dts-v2-0-39a4a8e3c9e6@gmail.com

Changes in v2:
- send v2 of the series so that it's properly threaded.
- add idle disconnect to i2c mux.
- Link to v1: https://lore.kernel.org/all/20250917074812.4042797-1-kevin.tung.openbmc@gmail.com

---
Kevin Tung (2):
      dt-bindings: arm: aspeed: add Meta Yosemite5 board
      ARM: dts: aspeed: yosemite5: Add Meta Yosemite5 BMC

 .../devicetree/bindings/arm/aspeed/aspeed.yaml     |    1 +
 arch/arm/boot/dts/aspeed/Makefile                  |    1 +
 .../dts/aspeed/aspeed-bmc-facebook-yosemite5.dts   | 1067 ++++++++++++++++++++
 3 files changed, 1069 insertions(+)
---
base-commit: 30d4efb2f5a515a60fe6b0ca85362cbebea21e2f
change-id: 20250924-yv5_add_dts-9268ac14dfc0

Best regards,
-- 
Kevin Tung <kevin.tung.openbmc@gmail.com>


