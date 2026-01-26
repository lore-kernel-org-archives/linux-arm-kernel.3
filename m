Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85954D19502
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 26 Jan 2026 17:08:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=claQvVXz/VziMYPyMPRAVg575BPbyYj4cSjuTWLePIU=; b=X+i1nlRUYqDWvj87R4vnXXjGsW
	F9KcxmvMaXKmFl53Bh48iaXnj32ZXpcCR1RxosPejStgoEsjGz4HVfDGbGcTw0NehpLU2T3O2GU9G
	zZhK1kVHno1SmThnXK2nY+tsRU83BrTE+TmJnccBWz/tm7FLQUY9zDAEbTUSopzZHTyj9Nai/DTkq
	XToMhxbuJn6dR0LkjvnSbhrmYUafxVFe+raAiaHtwwK77Xt/ixi9NAxByfosVaw1PbGUmCgXIKOwe
	5mhjYwX1DIImktd0iR4oZQNlDPXPgZuWSn/ru4Ltz/KKu/CJRAz2HibCHTLTrQ/u19sCd9OGkz9yh
	NdvhW1/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkQ50-0000000CvPp-0biK;
	Mon, 26 Jan 2026 17:08:46 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkQ4c-0000000CvEn-3V3C
	for linux-arm-kernel@lists.infradead.org;
	Mon, 26 Jan 2026 17:08:24 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id A9628442ED;
	Mon, 26 Jan 2026 17:08:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 5D74EC2BCB1;
	Mon, 26 Jan 2026 17:08:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769447301;
	bh=OybWCogfBgN8xZ/i/vgh3wMiiMXnvU+ML2P4SNzVv2E=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=BgXJh0jNFHyZBMnwZSQNNXMcbKEsjmN8odwDmWldh9wwA7NfX8xjmFSB3mnqysurv
	 t8RpdNGaF8JTq94mXsbgaFgZr3e7ZpWQMDGyQPqWywpDw5B7tsQ7vN5w9zSiS+0SqS
	 tjJcEmnWb5NUSdxbY6SCuFEE7cYnafPydtwbyeQXI5MKfuQPvGYSkkQt0aIHbxIQIE
	 UENi2/lf2igbuT+cMcgLhFNb13ppttl2P6nEo5vu5eMfpHg/S7SPxG6/YJDoT+GElB
	 xZJcOYAQWco8nTHltAKI5+qeyPdShqJL78z+ORckzgvR7wWwhevy1MTS7aK7v7/S4K
	 kO+XRTXELhBhQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 52F89D19502;
	Mon, 26 Jan 2026 17:08:21 +0000 (UTC)
From: Abdurrahman Hussain via B4 Relay <devnull+abdurrahman.nexthop.ai@kernel.org>
Date: Mon, 26 Jan 2026 17:08:19 +0000
Subject: [PATCH v5 4/6] i2c: xiic: remove duplicate error message
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260126-i2c-xiic-v5-4-88a16a28721c@nexthop.ai>
References: <20260126-i2c-xiic-v5-0-88a16a28721c@nexthop.ai>
In-Reply-To: <20260126-i2c-xiic-v5-0-88a16a28721c@nexthop.ai>
To: Michal Simek <michal.simek@amd.com>, Andi Shyti <andi.shyti@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, info@mocean-labs.com
Cc: Andy Shevchenko <andriy.shevchenko@intel.com>, 
 linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 Abdurrahman Hussain <abdurrahman@nexthop.ai>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1769447300; l=800;
 i=abdurrahman@nexthop.ai; s=20260119; h=from:subject:message-id;
 bh=GVZq2HmFuG7CNJnGoqYZGmD0YpSeA59LFKPs+6ye6Uk=;
 b=BoLKdz1mXkh+9FOaj+7RkXE2H3BzPV3zmnuidek6FzRj3sbPuBJucSaLV3gNgmDBN+gfkXHs+
 dFfCjnwL51yCViUTSELre9K3EJxfSiBA3C8S5XYuBJkdp6kiRYlz53D
X-Developer-Key: i=abdurrahman@nexthop.ai; a=ed25519;
 pk=S+ysnf+NwMcBdHBlyKIUEAtaFGSIhQwcJcgcXhq0osg=
X-Endpoint-Received: by B4 Relay for abdurrahman@nexthop.ai/20260119 with
 auth_id=608
X-Original-From: Abdurrahman Hussain <abdurrahman@nexthop.ai>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260126_090822_902655_8DF80DDF 
X-CRM114-Status: GOOD (  10.32  )
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

The devm_request_threaded_irq() already prints an error message. Remove
the duplicate.

Signed-off-by: Abdurrahman Hussain <abdurrahman@nexthop.ai>
---
 drivers/i2c/busses/i2c-xiic.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/i2c/busses/i2c-xiic.c b/drivers/i2c/busses/i2c-xiic.c
index a4a8087c1407..a06597bbf6fc 100644
--- a/drivers/i2c/busses/i2c-xiic.c
+++ b/drivers/i2c/busses/i2c-xiic.c
@@ -1492,10 +1492,8 @@ static int xiic_i2c_probe(struct platform_device *pdev)
 					xiic_process, IRQF_ONESHOT,
 					pdev->name, i2c);
 
-	if (ret < 0) {
-		dev_err_probe(&pdev->dev, ret, "Cannot claim IRQ\n");
+	if (ret < 0)
 		return ret;
-	}
 
 	i2c->singlemaster =
 		of_property_read_bool(pdev->dev.of_node, "single-master");

-- 
2.52.0



