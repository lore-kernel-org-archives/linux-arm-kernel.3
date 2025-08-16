Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C0CBCA0EE6
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 16 Aug 2025 08:50:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=n00OWL+w8sWdTdOAmEeus4NBoquiXkV9tCtbNCC3Db4=; b=PQ21wv34PzxKndNJD25szvcgc8
	CmfERkswiGONiVabWj72VUSbqNw0TlH7ItNd6cKat1QswrQ41Q+jPu4EBLGLaGUK6ZExjMqQMv+8y
	SNtFHssMx33HGzkoh7AR8eY6k71pz9ULaHZO/XN47qUxSYYCKxkA4RS9vzv1uKD6XGeg2JwnhUPrm
	KM/t/l06UCATNP7NZbPzodY52O/z9JJPexzdsoeTbdPV1KKT15gc+kI/LMDeHVBAc6durNNsSzjW8
	iumpFfqDtsjRvJYV/JajlUqk1DFDk1wKYyMi6eppbDgXjCkrV/CPT2/M/J3/hRhDxMDqDA9KORSrb
	v9CwAXbA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1unCc5-00000004KSr-1efj;
	Sat, 16 Aug 2025 08:50:09 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1unCZX-00000004K6I-3mhi;
	Sat, 16 Aug 2025 08:47:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=n00OWL+w8sWdTdOAmEeus4NBoquiXkV9tCtbNCC3Db4=; b=MXjJxGM5xYpSSqW1RYza4ZFkrp
	Op5KG6bNF6vfIf8l2DkAghEw+3XJqTowzhHfDcbgMYTd2oeqMRx54nKlPS0MXKVEB4XuUn1FbxMFZ
	rvQg4BxYFsXiGh5KFuGv0JGvCtevlBAWTO8lkmISz7qOid1rFyfuHZUAPIlo+xMpkn/oPc3Z23SGi
	8yidrn4n4t4dQdG0oMJA5mBweg5wy03AgLueprnmSwl7x6t1xFMcnfGO0sC+XMfcegKc85Pc72zaQ
	ZPBvsLPgFw9oyv2Ug5qXkoMgirRmRBEeJZDL3PUApRQG1KdXjnx/p+wR6zPKt3Ap5BudmbLXrxtmB
	LnBoz+cw==;
Received: from mail-pf1-x432.google.com ([2607:f8b0:4864:20::432])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1unCZS-0000000GwKV-2e6i;
	Sat, 16 Aug 2025 08:47:30 +0000
Received: by mail-pf1-x432.google.com with SMTP id d2e1a72fcca58-76e2e8e2d2dso1625356b3a.1;
        Sat, 16 Aug 2025 01:47:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755334044; x=1755938844; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=n00OWL+w8sWdTdOAmEeus4NBoquiXkV9tCtbNCC3Db4=;
        b=B0RXVbN/w+1B4CNvmdCd9lwGV5ggiZPirHjmfVzl7lwQ5Fa1qrNI+4Klo/5VXvr8Gk
         f5aGSyzGB3ep3NAGEywc9AEsrVBd07xvO3SS3ABuZ2siU7E4pR4h+Z6Ne0ZjdeJea+Ht
         KIuvHRJ02ziTyDxKHg/b6+HTo96wOmjA3NqJ5fzjGdGn4ZEBU95UjW1KGgDRHf7Ias2H
         jT788mhgzHBMYDntOOxLYp/NJQe7CF8kFtcVl1Td5tzWHyA/OrdO7wwj/D8dE8miQ8/l
         k+GR0cm4fytL3um5MXCZi82zRRmy9UEDrMPskMJZ+9U+8RNzMgA8edKf6dQggAyewYUT
         qR5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755334044; x=1755938844;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=n00OWL+w8sWdTdOAmEeus4NBoquiXkV9tCtbNCC3Db4=;
        b=iIZL5Jfu8oltzx9WKfuvNZLqtCtu76sd32ETiFMvWbVARnvuG4x7Dn2NklleyUwnC6
         tr3KT6pdvt3PgxeTHvN/JsNtvpusRRGdkyLrph7lztf5KGCr2Th/AH6UdTE/tobcDbMX
         2/aMVkV7X7yfa7yN5xfpkOcrSb/HCEM5HON9E0Qp+iqQ1MNG+PgLaiWvRuU4SQc3KYLu
         /xD1Jr4+UPn6rUmQd51irKA+f6GNKUIw7pJaw/gtkgajdB2px3arXZyOE+Sv4DQzsq4i
         uTg8Ndii/Ou7IalEgmmkWGy2Qv/nor+ZuSnclB1aQhwONGfzRym8ANczLt9sut26zI/C
         oB9Q==
X-Forwarded-Encrypted: i=1; AJvYcCVZD8SjDqYqak9x89IJwKZFC2Z0N15PLEKfK9MKpuNvB5SDtSvTC4+Q+9nqnBM48QKJLwwJpl1QdPMM@lists.infradead.org, AJvYcCWYhdhorR8zXmg17g8m/dsR7OR21LLCzky4TwsqLGFPKev7UGeLO0ag57QmVPsPublq8VVL55RDLhNliYtuAx0t@lists.infradead.org
X-Gm-Message-State: AOJu0YzKHfqRnI+s/6bB7UemgKIKPNRPGlr570EJycwcAJScAU8rKcXw
	zRsnhrbqRnZTBkuWupbzgqEnv/DSGyQxhSozmCDadKxnELFliA+YteeS
X-Gm-Gg: ASbGncu/LOqY/Ig7B/9HYm5sNMLAQUKaCcmrTkDul9tdCQ9G6JaYGJgaWXuaJk1ZdhW
	OXtanOEMj9ARKGNXOFzXCPk0QiKE1pjmjNtvbbpzIoSGGTTCc50U87cOZyh7iWy4Mqhpux3qlzK
	b/EWwKohlOnkQZ/ooEPhPbWSAgCCEJt7gi/+T5NVwVucswBMmRGGG4+CT4AXNuBxGSqkjn3bkHy
	r+X0VTyoL/Tbs/FHwXrOBfJ+zf89kwrlzjbitEBvo/cvp+3HufslJxiUYOQEvtZ/uQyrkjUwdoV
	qCrgG1BOqtG6z2WqZRnDhZQVBvZKVUCBW7ikijaRpIecAecWeVebcr+K8bTLVG2arCj79sd6i1c
	Bd5WV4Yf7Q78=
X-Google-Smtp-Source: AGHT+IHRLGNB8SYXmPKw81D1VOKbz4q3gvNOhwVUuxSt8mOuivVjupipoQ1fbt8d5uqOtt3TGwriuA==
X-Received: by 2002:a17:903:22c6:b0:242:9bc4:f1c7 with SMTP id d9443c01a7336-2447909bfd5mr31610805ad.54.1755334044121;
        Sat, 16 Aug 2025 01:47:24 -0700 (PDT)
Received: from junAIR ([212.192.12.80])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2446d57f12esm31048215ad.157.2025.08.16.01.47.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 16 Aug 2025 01:47:23 -0700 (PDT)
From: iuncuim <iuncuim@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Andre Przywara <andre.przywara@arm.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>
Cc: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-phy@lists.infradead.org,
	linux-clk@vger.kernel.org,
	linux-sunxi@lists.linux.dev
Subject: [PATCH 0/7] arm64: allwinner: a523: add USB3.0 support
Date: Sat, 16 Aug 2025 16:46:53 +0800
Message-ID: <20250816084700.569524-1-iuncuim@gmail.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250816_094727_046357_CE102256 
X-CRM114-Status: GOOD (  14.54  )
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

From: Mikhail Kalashnikov <iuncuim@gmail.com>

This series is a draft and does not include patches for dt-bindings.
The first series is necessary for testing on other devices and
initiating discussion.

This series of patches adds USB 3.0 functionality for the
A523/A527/H728/T527 processor.Most of the code is derived from the BSP,
 as the datasheet does not fully describe this feature.

I have verified functionality on two of my boards, walnutpi 2b (t527)
and x96qproplus (h728). When testing usb3.0 on x96qproplus, I get
reconnections of my nvme, it looks like the port does not provide enough
 current to work. I have encountered similar complaints from users of the
  device on Android. In the case of walnutpi, there is no such problem.

Based on 6.17-rc1

Mikhail Kalashnikov (7):
  clk: sunxi-ng: a523: add missing usb related clocks
  arm64: dts: allwinner: a523: add third usb2 phy
  phy: sun4i-usb: a523: add support for the USB2 PHY
  phy: allwinner: a523: add USB3/PCIe PHY driver
  arm64: dts: allwinner: a523: add USB3.0 phy node
  arm64: dts: allwinner: a523: add DWC3 USB3.0 node
  arm64: dts: allwinner: a523: activate USB3 for all boards

 .../arm64/boot/dts/allwinner/sun55i-a523.dtsi |  52 +++-
 .../dts/allwinner/sun55i-a527-cubie-a5e.dts   |   8 +
 .../dts/allwinner/sun55i-h728-x96qpro+.dts    |   8 +
 .../dts/allwinner/sun55i-t527-avaota-a1.dts   |   8 +
 drivers/clk/sunxi-ng/ccu-sun55i-a523.c        |  32 +++
 drivers/clk/sunxi-ng/ccu-sun55i-a523.h        |   2 +-
 drivers/phy/allwinner/Kconfig                 |   9 +
 drivers/phy/allwinner/Makefile                |   1 +
 drivers/phy/allwinner/phy-sun4i-usb.c         |  10 +
 drivers/phy/allwinner/phy-sun55i-usb3-pcie.c  | 267 ++++++++++++++++++
 include/dt-bindings/clock/sun55i-a523-ccu.h   |   4 +
 11 files changed, 392 insertions(+), 9 deletions(-)
 create mode 100644 drivers/phy/allwinner/phy-sun55i-usb3-pcie.c

-- 
2.50.1


