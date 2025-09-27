Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63BCDCAC5BD
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 27 Sep 2025 14:04:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=wb6sZ+c3yKQM/tcEc4SNtuOGZPQiSEEYEWgDlTqRwD8=; b=sUNKHCW9CugFsE
	obvPCAN+KKlMR8ADSyAfagV1IQqdYtrbGwTNfkR0g0SliUVz3Gt7dZs+cJB/7GgOXKUfxAmtS+3SL
	90XScVAIL4FD9Gv1yDXZVYWp4Xr2VmYMyzMTryhtWTw8f4Pp81nMrWj33pRcbCy/qAEYxLDbPlXWO
	SOgaaGhwLLKbOxcGZZ81deirxV25MsSuAj5gZh8F4Wb0qMRj4noW+JskjvPbbWn7stmclHt1+Ftx0
	LThrwDUNfmG+hTxtwTMyFJtp9SDsw/njrH16cBNcskOKkAf/a0DM0P9e0O56orLcC9yys0PK4//we
	0Q+PhJooRyg6NTHjnUgA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v2VWw-0000000ACQp-2eoy;
	Sat, 27 Sep 2025 14:04:06 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v2VWv-0000000ACQ8-3dUX;
	Sat, 27 Sep 2025 14:04:05 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 428A4601DE;
	Sat, 27 Sep 2025 14:04:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 71C6BC4CEE7;
	Sat, 27 Sep 2025 14:04:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758981844;
	bh=mGr2EMGRgUnBXBgYyHfdnuWKDBCqqz3YASJ/ym88WdU=;
	h=From:Subject:Date:To:Cc:From;
	b=JZ/+ZWVK1MJMw8WwpkRJzaMVWsf7Mgux6URVM8FXcX2pYxausVn8xARS0VT1RleYG
	 JXIlS50WKgOin7NcHIddcJIgP8oJZzVNjMZsSd2MTL7XCd84M/oxeQWiLiUveuls31
	 KQu9zqrA/wR7hYHybxiYd9dkAGi4cahd7W53AiSaTamSK1ilFAYqa03scmnWZjiDMG
	 TFbbXsIU7NQRHs5LtNiqhlQT6gUHgBn8dMum7rx8pY5d9TzoPtdTrrQBITCtmeF/+M
	 xP9ZILAARPrOxONbNW4iJPbIhfOhnzZ40bDZUkq+ykrX+IYDeDmn+G6KTt7WOVZ3NF
	 N3qUxCFy24HLw==
From: Lorenzo Bianconi <lorenzo@kernel.org>
Subject: [PATCH net-next v2 0/3] net: airoha: npu: Introduce support for
 Airoha 7583 NPU
Date: Sat, 27 Sep 2025 16:03:39 +0200
Message-Id: <20250927-airoha-npu-7583-v2-0-e12fac5cce1f@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIALvu12gC/3WNQQ6CMBBFr0Jm7Zi2lIKsvIdhQWCAiaYlUyUa0
 rtb2bt8L/nv7xBJmCK0xQ5CG0cOPoM5FTAsvZ8JecwMRplKXYzDniUsPfr1hXXVlOhKsrpU2jk
 7QF6tQhO/j+Kty7xwfAb5HAeb/tn/rU2jQmtrqsiMk2rG653E0+McZIYupfQFdiv8Na8AAAA=
X-Change-ID: 20250926-airoha-npu-7583-63e41301664c
To: Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Lorenzo Bianconi <lorenzo@kernel.org>
Cc: netdev@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
X-Mailer: b4 0.14.2
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

Introduce support for Airoha 7583 SoC NPU.

---
Changes in v2:
- Introduce airoha_npu_soc_data struct and generalize firmware load
- Link to v1: https://lore.kernel.org/r/20250926-airoha-npu-7583-v1-0-447e5e2df08d@kernel.org

---
Lorenzo Bianconi (3):
      dt-bindings: net: airoha: npu: Add AN7583 support
      net: airoha: npu: Add airoha_npu_soc_data struct
      net: airoha: npu: Add 7583 SoC support

 .../devicetree/bindings/net/airoha,en7581-npu.yaml |  1 +
 drivers/net/ethernet/airoha/airoha_npu.c           | 93 ++++++++++++++++------
 2 files changed, 68 insertions(+), 26 deletions(-)
---
base-commit: 1493c18fe8696bfc758a97130a485fc4e08387f5
change-id: 20250926-airoha-npu-7583-63e41301664c

Best regards,
-- 
Lorenzo Bianconi <lorenzo@kernel.org>


