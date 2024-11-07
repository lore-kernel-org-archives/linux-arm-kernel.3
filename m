Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5BF20D43350
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  7 Nov 2024 12:01:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=z4S7eFAqOKlyh0GLmEWkpvO9ikI1XkubVMydYt9t5D8=; b=tkyM7TepxxXYwHKKRuvUW15Ycv
	h6cISS9VegoCh9G2m5HOgyDIuC2iZ1rxMEM0l4R1aK+CeAbp1ku+Y512RerPOsO+dgh6JJq0NjV5q
	aFHdyDAVaFeCMNVs01Gr970D/RwoR7f6nI6oStb28w6WKl5sjI4pFgs+EoHikq33lIrPf9v1ZMjIA
	q95nqOA6aKGRC0j3rbQXR05sT9fUju244XnlH2OiaAaFmdEdAOBBnA2cC1lp0wC9vVtx7PpOOX0zX
	AsAM4M9ec+kJVssN3YqpYmGRfjM3FZpqu4fr1dD+N3k/hBJtRAkVshpyfnsj27O/3dl1tYYSQBNhB
	6LynHZ7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t91CW-00000006qoF-2ERg;
	Thu, 07 Nov 2024 12:01:24 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t90zQ-00000006nl1-2hff;
	Thu, 07 Nov 2024 11:47:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:MIME-Version:References:
	In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=z4S7eFAqOKlyh0GLmEWkpvO9ikI1XkubVMydYt9t5D8=; b=vLcp2aRDwCSVwAoqK7+/n31gD/
	7pj/YV9z9UmFqiQb3zgVSjTeWqcggKAbbNcrqXf3t72o6Wrjw/h5ZiHDFJA7nVq11AH28hvkXbprD
	/zJuGZh4FTBtFkBVnM89jFuT5pNS63bOEDXe3tBNTXAvygkHDrcRsk648E5IIui0zzX66a+77F9e9
	013SZvC1FrBEZyrN+PaPiFq02VcrH7HdcW9/ORKUALAtjZHU9VPIFIhaUNXLjZlsBvzBtWunwi8tt
	RDZH5xF/SdTjmNRrRg944sfttUsdBXa6vkOyufCKv2JtY02Ma5k7i8U9Qie4LrXgOFLG23IFUE62w
	0UE1gw0A==;
Received: from i53875b28.versanet.de ([83.135.91.40] helo=localhost.localdomain)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1t90yz-0005lF-IE; Thu, 07 Nov 2024 12:47:25 +0100
From: Heiko Stuebner <heiko@sntech.de>
To: lee@kernel.org,
	jikos@kernel.org,
	jic23@kernel.org
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	jdelvare@suse.com,
	linux@roeck-us.net,
	srinivas.pandruvada@linux.intel.com,
	bentiss@kernel.org,
	dmitry.torokhov@gmail.com,
	pavel@ucw.cz,
	ukleinek@debian.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-hwmon@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-input@vger.kernel.org,
	linux-iio@vger.kernel.org,
	linux-leds@vger.kernel.org,
	heiko@sntech.de
Subject: [PATCH v9 2/9] mfd: core: make platform_data pointer const in struct mfd_cell
Date: Thu,  7 Nov 2024 12:47:05 +0100
Message-ID: <20241107114712.538976-3-heiko@sntech.de>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241107114712.538976-1-heiko@sntech.de>
References: <20241107114712.538976-1-heiko@sntech.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241107_034752_754295_A198599C 
X-CRM114-Status: GOOD (  16.40  )
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

The content of the platform_data of a struct mfd_cell is simply passed on
to the platform_device_add_data() call in mfd_add_device() .

platform_device_add_data() already handles the data behind that pointer
as const and also uses kmemdup to create a copy of the data before
handing that copy over to the newly created platform-device,
so there is no reason to not extend this to struct mfd_cell, as the old
copy in the mfd_cell will be stale anyway.

This allows to pass structs gathered from of_device_get_match_data()
as platform-data to sub-devices - which is retrieved as const already.

Signed-off-by: Heiko Stuebner <heiko@sntech.de>
---
 include/linux/mfd/core.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/linux/mfd/core.h b/include/linux/mfd/core.h
index e8bcad641d8c..faeea7abd688 100644
--- a/include/linux/mfd/core.h
+++ b/include/linux/mfd/core.h
@@ -72,7 +72,7 @@ struct mfd_cell {
 	int			(*resume)(struct platform_device *dev);
 
 	/* platform data passed to the sub devices drivers */
-	void			*platform_data;
+	const void		*platform_data;
 	size_t			pdata_size;
 
 	/* Matches ACPI */
-- 
2.45.2


