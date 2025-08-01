Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3EA9CC87FD2
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  1 Aug 2025 07:22:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=A1HSYmHZRVrlkC/wtA94N2UZ9r/llCEGSWTmtx5jA+Q=; b=AkBIp0bbjGeOTuh0iWquFlfRO9
	GrEfJsVKKjo0Zv6MOdJaEQn9uvNywN5wHwASANFVb2T08CYPjNFJfQUO1px8CzaJcW6PXiIEHvjjJ
	vvjMOEjptvj+Yft3+NS4AWx7pFGiLEFt45cMquecSjTR7/yvL4fuEJ1akKU4raqAgQiIIgr0CXcYY
	qy6T4ZKZTPM8B24CWrqP1WNnT3vO2Eszoi/sxbZG8JVzo4OP0uVfpHYDGBvI9DXa2vyuH2H/UdpwG
	3DXB4cRdTT5wO+JjM5vrP3AEU7UH9bPYWpRom2xDLsQOeI2DYmf/kO1mWeN0C9ayqJVoIxBUoO0lu
	DVs0NEYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uhk6E-000000057zp-2uvJ;
	Fri, 01 Aug 2025 07:22:42 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uhjwa-000000056wz-0Ase;
	Fri, 01 Aug 2025 07:12:45 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 2B8BFA556F0;
	Fri,  1 Aug 2025 07:12:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4E9F1C4CEE7;
	Fri,  1 Aug 2025 07:12:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754032362;
	bh=kZ2ssGifWusx+VAn097N3kTz4drLvew5uJnr57tCeTk=;
	h=From:Date:Subject:To:Cc:From;
	b=VZLqfKfiKRLlgY1GsmMNqmcAw+Ljlp+kTbga2cVoFEGFqoZLcyLQLg1lTEBuniLPG
	 U37aCWmUSTcCCaxJ8fnsdKhBs2jvv0TuUhpX4k0sRbiQU5rmCiha8wMgqYgiuCaiEQ
	 x9yUzwpZs8nqy0/CjEF48+b/pq0CqtesNohPItUGXL2iyPL+zG0/jlB867lu+18K7z
	 JZmkXC1n8GFoxta3Zsgc03uRqRKK2Ahrgs9bmnibBwB8ZD6aHGps4sb7hbnc4+zhTB
	 XAX2irL2hZdpj7WP2LAJxgdmC3hypmnrK6/Axej8UXQuqeoc+rDknJf0n2l96PJcGD
	 N3QT6otILCZHw==
From: Lorenzo Bianconi <lorenzo@kernel.org>
Date: Fri, 01 Aug 2025 09:12:25 +0200
Subject: [PATCH net v2] net: airoha: npu: Add missing MODULE_FIRMWARE
 macros
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250801-airoha-npu-missing-module-firmware-v2-1-e860c824d515@kernel.org>
X-B4-Tracking: v=1; b=H4sIANhojGgC/5WNQQ6CMBBFr0Jm7ZgWLCSuvAdhUcsAE6ElU0EN4
 e5WbuDmJ+8v3tsgkjBFuGYbCK0cOfgE+SkDN1jfE3KbGHKVG1UVGi1LGCz6ecGJY2Tf4xTaZST
 sWKaXFcKq0ureKmNsYSCJZqGO30ekbhIPHJ9BPkdz1b/3L/2qUePFKFc6l5bK24PE03gO0kOz7
 /sXfRMOItUAAAA=
X-Change-ID: 20250731-airoha-npu-missing-module-firmware-7710bd055a35
To: Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Lorenzo Bianconi <lorenzo@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, netdev@vger.kernel.org
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250801_001244_177947_44231BF1 
X-CRM114-Status: UNSURE (   9.19  )
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

Introduce missing MODULE_FIRMWARE definitions for firmware autoload.

Fixes: 23290c7bc190d ("net: airoha: Introduce Airoha NPU support")
Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
---
Changes in v2:
- Add missing Fixes tag
- Link to v1: https://lore.kernel.org/r/20250731-airoha-npu-missing-module-firmware-v1-1-450c6cc50ce6@kernel.org
---
 drivers/net/ethernet/airoha/airoha_npu.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/net/ethernet/airoha/airoha_npu.c b/drivers/net/ethernet/airoha/airoha_npu.c
index 9ab964c536e11173e3e3bb4854b4f886c75a0051..a802f95df99dd693293b1c0cc0fbf09afab2c835 100644
--- a/drivers/net/ethernet/airoha/airoha_npu.c
+++ b/drivers/net/ethernet/airoha/airoha_npu.c
@@ -579,6 +579,8 @@ static struct platform_driver airoha_npu_driver = {
 };
 module_platform_driver(airoha_npu_driver);
 
+MODULE_FIRMWARE(NPU_EN7581_FIRMWARE_DATA);
+MODULE_FIRMWARE(NPU_EN7581_FIRMWARE_RV32);
 MODULE_LICENSE("GPL");
 MODULE_AUTHOR("Lorenzo Bianconi <lorenzo@kernel.org>");
 MODULE_DESCRIPTION("Airoha Network Processor Unit driver");

---
base-commit: 01051012887329ea78eaca19b1d2eac4c9f601b5
change-id: 20250731-airoha-npu-missing-module-firmware-7710bd055a35

Best regards,
-- 
Lorenzo Bianconi <lorenzo@kernel.org>


