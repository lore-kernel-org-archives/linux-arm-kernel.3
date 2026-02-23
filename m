Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BFF1AEA4FC7
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Feb 2026 15:59:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=t76BPzASeG+A+xxBrM5LvbXuwE5GuYbbPbwpXECdxNQ=; b=YScOWQHjdlf1CCbn7eORhqXcWo
	oRnYqexuiF9n11V7ZznEvbIoQFCAFeG8cY4J3PvE/Byn40IkUiuuVEdJQR8NbDl4dBBmgulZhFoGc
	M62TaEQLWk6I1mHL6igJs0rs2nUcClprxJhGq5iHpviwAcjmXluH7qFVMmqBK6ENpr95dvk4nKhD6
	ZgCxzRnX/i7YU+W89LZytt5mZ9UkToF8djl7rKarLx6dyusxJ3Zfk7BzJCAf50WSXyrci7kNRR/KE
	+E7KtrRrig8gkBApEy/cK7m7Pdap0yJnJHL0q/Yw9l9kN7SxOiwNLyJr6a8e2hqPX+doY9QJDOfNr
	4ZQkMvqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuYLL-00000000cLn-26k5;
	Mon, 23 Feb 2026 15:59:31 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuYLI-00000000cJk-132e
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 23 Feb 2026 15:59:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Reply-To:Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Content-ID:Content-Description;
	bh=t76BPzASeG+A+xxBrM5LvbXuwE5GuYbbPbwpXECdxNQ=; b=SVvkyQkXEQKDwVs8WrcF4FrKQ+
	7grPI6KM+mmuEQ6JKgMx4chK0tbgbMjeH00kSgoeUtDw3s8+Ma7tEzgPm5GVfr6D0+UMRGaPg5YoV
	MAygJTqDVXsDkTHMJCelYBMXyZiZoNJSndW7G+gi4U/DoWfnwVw6kByuHLw32OFElMB2hAwSyJN7P
	0EHP5VdnkFqbxyojqgh6trP8ErhjDcIa611QOtxPgcGUDLFbvpkTEw5YgGhHxdpAeTdlZL6MMOXhI
	6lqPTt4qnDPSyZpIsbMZ9NdF1SGKjauQvysvB/QdT22fXiNE7nNX92AZLwPweEy+2KoPDI9E3pHJu
	UFTafspg==;
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuYLF-00000005PNK-0VW9
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Feb 2026 15:59:27 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 1F47F44566;
	Mon, 23 Feb 2026 15:59:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id F0334C2BCB0;
	Mon, 23 Feb 2026 15:59:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771862360;
	bh=eDeGqWzfszSxlsa0dgDJoVbCF0RNmd/ZzVa697YK8KE=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=RQ6ZeCtL9n4bB0jdne9IogDl7WOMZu1aVge4oisE82c/ew8EiVeUL7IVZFY6idg2o
	 ZdN0PbY3VHZa28FX8nTyXse2aOCgV4/nWbgpDO8lrm7Ovejbz9JjsHsVz2zNkUj/Op
	 NKkcQQFSf/qk1IgkNfB0bmYRiPtmHP68k97IQscYt+pxaf6vjMLevIVr4wFJBu5wA7
	 PZEqF4ymhhE2dO0xPDMgmPZHwj6PyGpg2tbeRTwggePYPbxfKlmT1NQ8gnYy8DsBko
	 MO89F1U+velR/Qf2hy1/MmsN0ESgtJQtEyb1//7ba30K+vgTHGr3heONQSkrN+3EqI
	 BtEpmAODggjBQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E60B7E98E1E;
	Mon, 23 Feb 2026 15:59:19 +0000 (UTC)
From: Abdurrahman Hussain via B4 Relay <devnull+abdurrahman.nexthop.ai@kernel.org>
Date: Mon, 23 Feb 2026 15:59:20 +0000
Subject: [PATCH v12 5/7] i2c: xiic: cosmetic: use resource format specifier
 in debug log
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260223-i2c-xiic-v12-5-b6c9ce4e4f3c@nexthop.ai>
References: <20260223-i2c-xiic-v12-0-b6c9ce4e4f3c@nexthop.ai>
In-Reply-To: <20260223-i2c-xiic-v12-0-b6c9ce4e4f3c@nexthop.ai>
To: Michal Simek <michal.simek@amd.com>, Andi Shyti <andi.shyti@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Andy Shevchenko <andriy.shevchenko@intel.com>, 
 linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 Abdurrahman Hussain <abdurrahman@nexthop.ai>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1771862359; l=861;
 i=abdurrahman@nexthop.ai; s=20260119; h=from:subject:message-id;
 bh=7a+Jv/sysSvCd9GgBokRdDYOqlTm04F/cT7DP1ztyWA=;
 b=yUwadXileWxfaXhhsoyottKwsdmIg23ZJsFROqUlA6qIGvuEPkkkn3orZJN3IvkPzyirgjsLE
 MqZXzAIGXIzBhXzPkTyJQsVuGJJrH6BGWxu3m7oXuyi94i1l4xyzIAG
X-Developer-Key: i=abdurrahman@nexthop.ai; a=ed25519;
 pk=S+ysnf+NwMcBdHBlyKIUEAtaFGSIhQwcJcgcXhq0osg=
X-Endpoint-Received: by B4 Relay for abdurrahman@nexthop.ai/20260119 with
 auth_id=608
X-Original-From: Abdurrahman Hussain <abdurrahman@nexthop.ai>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260223_155925_583660_E832B924 
X-CRM114-Status: GOOD (  10.42  )
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
Reply-To: abdurrahman@nexthop.ai
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

From: Abdurrahman Hussain <abdurrahman@nexthop.ai>

Use standard resource format specifier %pR in debug log.

Reviewed-by: Andy Shevchenko <andriy.shevchenko@intel.com>
Signed-off-by: Abdurrahman Hussain <abdurrahman@nexthop.ai>
---
 drivers/i2c/busses/i2c-xiic.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/i2c/busses/i2c-xiic.c b/drivers/i2c/busses/i2c-xiic.c
index 463a207c6a76..80e183b6e4f1 100644
--- a/drivers/i2c/busses/i2c-xiic.c
+++ b/drivers/i2c/busses/i2c-xiic.c
@@ -1519,8 +1519,8 @@ static int xiic_i2c_probe(struct platform_device *pdev)
 			i2c_new_client_device(&i2c->adap, pdata->devices + i);
 	}
 
-	dev_dbg(&pdev->dev, "mmio %08lx irq %d scl clock frequency %d\n",
-		(unsigned long)res->start, irq, i2c->i2c_clk);
+	dev_dbg(dev, "mmio %pR irq %d scl clock frequency %d\n",
+		res, irq, i2c->i2c_clk);
 
 	return 0;
 }

-- 
2.52.0



