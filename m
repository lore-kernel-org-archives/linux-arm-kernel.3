Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14120CA5FE4
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 19 Jan 2026 07:06:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QdqXJQ9SD4mBVfDw4jh15uw9xK6Rmy9YzEWN76DUozM=; b=YkxbrsQycPy/e8VXst/PYQdAWV
	jOVJvsr7F/EiA6OuruUXaGOYdxxAfLNySJqPF96K0wKsKLlm6+SCtS5Kv3vERTAa1+wCaspJT8lEK
	urJA0T1KfoCSk1NrU02FAuBAovwbQirGjT+bU4i0EWjVxKT9SOZplYdrOWJIkG+lCxLF3eH4Kb+Ir
	OfWOkJ9v6vWPGKRdIyr4WNCuOopJ9yDT4lLsaIJDwsEsXAMJMm9F5rRP2d0F3f7dMxJiX9XP4tbES
	eh1MCbBrsdCIA9jtNfc07Ju/6fnTeH4KP/ywLmkvt0US1YXvfjnh8sqs910UGOsU4JZKopaibHkUl
	Y0/BXpJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhjLc-00000001Rpc-26v9;
	Mon, 19 Jan 2026 07:06:48 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhjLP-00000001RlS-2fxn
	for linux-arm-kernel@lists.infradead.org;
	Mon, 19 Jan 2026 07:06:40 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 727CF444FC;
	Mon, 19 Jan 2026 07:06:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 41A10C19425;
	Mon, 19 Jan 2026 07:06:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768806394;
	bh=CBGg3x/vucOg+TkQQF7Y4KAwGgR2HgDde7MgFS6bYuU=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=GKaEAnEzMyE//jpsjeXOcE6qOtEjh43DlkPb5Oe5wx1PBj9OqvR9phWxtx1J4q9Ne
	 BjmC9oYHA1u25xgWaj2+W0ca9rSJbCfvOdNrn3Cr5DzAUVCyLFgKFD2+qmmqktSEGx
	 qBFX3DF8Hkm2Sy0an6lUuLNjFpK5M8bOuTDwmL2m+O5x+nao3y60a4keuF31roDt8Q
	 FcfMElVJqUyYm4wHmTKrfjjaDpDZbGm9L4Wmy0fz+KiDVmyD5rvSQ6hXmU8st1cLQ9
	 7Xbs+ApJDEbxwfhucvvKigqXIABH7sc2IasZaPT1gvSSqMABpo8A7L49svLShS44Rz
	 WXXKsOnZDaqcA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 331D1CA5FF5;
	Mon, 19 Jan 2026 07:06:34 +0000 (UTC)
From: Abdurrahman Hussain via B4 Relay <devnull+abdurrahman.nexthop.ai@kernel.org>
Date: Mon, 19 Jan 2026 07:06:23 +0000
Subject: [PATCH v3 2/3] spi: xilinx: make irq optional
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260119-spi-xilinx-v3-2-4566c33bac0d@nexthop.ai>
References: <20260119-spi-xilinx-v3-0-4566c33bac0d@nexthop.ai>
In-Reply-To: <20260119-spi-xilinx-v3-0-4566c33bac0d@nexthop.ai>
To: Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Michal Simek <michal.simek@amd.com>
Cc: linux-spi@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Abdurrahman Hussain <abdurrahman@nexthop.ai>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1768806393; l=964;
 i=abdurrahman@nexthop.ai; s=20260119; h=from:subject:message-id;
 bh=PBkRm5i7Y71sKWBVU/SvixzOItjnO8vO5sXpyGOffJs=;
 b=t9iSVOWCuMCe/7ZCazYCqmZGC83AcNhDLXOidgKbHtDmZUNA4H01/V6Cssev3nPLdV91x4NKb
 dHwdG/Wva74CZjpS75S7uc1856hxqJ4fpb/I9gkcrFRmn7CmUsyzhWw
X-Developer-Key: i=abdurrahman@nexthop.ai; a=ed25519;
 pk=S+ysnf+NwMcBdHBlyKIUEAtaFGSIhQwcJcgcXhq0osg=
X-Endpoint-Received: by B4 Relay for abdurrahman@nexthop.ai/20260119 with
 auth_id=608
X-Original-From: Abdurrahman Hussain <abdurrahman@nexthop.ai>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260118_230635_701949_2764647E 
X-CRM114-Status: GOOD (  13.32  )
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

Both the hardware and driver already support polling mode. By removing
the mandatory IRQ requirement during probe, the driver can now fall
back to polling when an interrupt is unavailable, ensuring
compatibility with a wider range of systems.

Signed-off-by: Abdurrahman Hussain <abdurrahman@nexthop.ai>
---
 drivers/spi/spi-xilinx.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/spi/spi-xilinx.c b/drivers/spi/spi-xilinx.c
index c86dc56f38b4..4aa67fc61cb6 100644
--- a/drivers/spi/spi-xilinx.c
+++ b/drivers/spi/spi-xilinx.c
@@ -471,7 +471,7 @@ static int xilinx_spi_probe(struct platform_device *pdev)
 	xspi->bytes_per_word = bits_per_word / 8;
 	xspi->buffer_size = xilinx_spi_find_buffer_size(xspi);
 
-	xspi->irq = platform_get_irq(pdev, 0);
+	xspi->irq = platform_get_irq_optional(pdev, 0);
 	if (xspi->irq < 0 && xspi->irq != -ENXIO) {
 		return xspi->irq;
 	} else if (xspi->irq >= 0) {

-- 
2.52.0



