Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E2D2C5AC67
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Aug 2026 00:41:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=jg9t6USd7aCBm3DCerjF5PDOcPoho7Pj+WkMHzrBY40=; b=BESimTrOmm7GA70gmZO8Pgw5HB
	6ve53gf2i3Q5aTUlRbk9AdFCwXcrSe4UcgvlaPYoPJJpaw+7Ae8++/ZasimT8+Z89ucJVJZgGMB1B
	TCpJL3OunQFWpZ8nWFhf+caR6gpwhP2pUh8b/OiJNDLZnW02k36t3Z2M/BgTrABg8p5YD8Ztc7BF7
	hHQyW0po+uYYnFbygXNHxHHhkr22IJEW6YhdXtQZLynWndGA22bA2LfbamlI4n55cIOBNEueouVWU
	TO/KI/YTr3IMABTJNIwmBpzJdT724csU/FBBBfDlfMNXT9OgGqnJ9+B56zPZWWAhwbB0vQsPVHw7R
	TKCmDgIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1ws8eh-00000006uMS-0PRU;
	Fri, 07 Aug 2026 00:41:47 +0000
Received: from mail-lf1-x132.google.com ([2a00:1450:4864:20::132])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1ws8ee-00000006uLm-2MKo
	for linux-arm-kernel@lists.infradead.org;
	Fri, 07 Aug 2026 00:41:45 +0000
Received: by mail-lf1-x132.google.com with SMTP id 2adb3069b0e04-5b14d1f9315so2268762e87.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 06 Aug 2026 17:41:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786063302; x=1786668102; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=jg9t6USd7aCBm3DCerjF5PDOcPoho7Pj+WkMHzrBY40=;
        b=R/rpTsUTb5LWvKCGtb+nWyEdrX8HOjC6HjH5hZSZ98U+taBiL6Ty4R3RYQwi6k4E/Q
         Y3G3w6lgPBDbQBxS8ZLLN3FWpfj+gN2XljDWwumjBCM3T8DS4qZlmKmroT7z7nXOsM11
         wqixXIyIFgVlSh9q+LeX1BpjwCZPWr3h/q5M5pEUO7u9RrhpeLETV+sV9c40BfiDrDix
         bEgiAoOR1yQdJmJOMrvF4esrlbZY4VVsRm0Zh3dZvVzOTRUzdwCfzMqEPHk+mof9H6eL
         EQSnyBl41PBQ/NgENIF4A6r5Why+bVdJkbkCgfY7PuihoWfA6U7Uf4eNiQkgu2P7uU3y
         xudw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786063302; x=1786668102;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jg9t6USd7aCBm3DCerjF5PDOcPoho7Pj+WkMHzrBY40=;
        b=naF2bsb9Xa8E0Brtf0XHNsWTs1VkOkbIyn5TICgRUhqs9PqOqa3WZpO9zYIJgVgbsb
         YLTPQNP6ive/KYZZ7BmyQ0QrwAeaJ0l4IT8+d8BJs44nSRIQKzuHDY9Lu0MgI8KutRto
         5OlR0klSRSiwA2HuARmzckEw/9lLvtuaNjNeRty9ZT5ROI9d0JQQu4YdNMb6aMOD7niF
         RgwcRm1iFanmHJHJbJrpFm78upyetRvyavC55i+JImJ/1BRUdg5DEOlXTtC1gYcwEd/q
         rpBY9484+ZuvDRYzj8icr3zvyh7DPZPE+N8OWH3kxt2InIBptvNvxGyERicoKmgMFf+Z
         w0gQ==
X-Forwarded-Encrypted: i=1; AHgh+RpxqnXQaBW81DWXOoC8dHOowJU1ATsh2DlpilbafiSp8gPiQsXi9f+E8vyURmPkKhvg16wYEkfzXmQVL2lWyOJx@lists.infradead.org
X-Gm-Message-State: AOJu0Yx6Qfe50ctqfo6Q0uWzanPRP8QMMaeIudtcg9NcBNZB6SISEm9O
	g38LIMuZaNtlcJMdqb3nkA4Ob+p2ot1T0ORewmTCXa/2TkfqJUv5/Mo=
X-Gm-Gg: AR+sD12h40dH1dUUa4NB9XQ6H4nqhSXcINlniYNjOMRInYyOkm4yhdNAYAQxP1cppOr
	YG4/MIkEew3nmpPHV8WPOniSU5DbrC4PkLxIn176IUHr8yega5EDIt5YlcydTH5qIW7M7Ax8c//
	ga9dRsg0isH52GRFvy7NvEesAvoTy50PkcynRbWuT7I6Jf7YtYcC4PhKLmamxPpHJDKsL0PFDFI
	KLDdfpJYAyn7S0JsodsX5c5ViSQj51X6srYLvZ9X5uRVyEO8LU9zcO87ndsGbwaa0OWuqBYwIG2
	jKxkv8ppbyHichngknWVXJc7FKHODLcZBm9b/A3W7Go72x62wx/FaKqi6dwTXK/L0gP6Iy8Dx/F
	A0uYv7GKvtAWD0dhRI1Dr9Qof/VUafRHGWWuJ0K5qjvhud6UCtOt7uzEZRWhXmrFxHUz8Tx3Lwy
	P0uQ2eyS+vMmRZtDG+adSnVcdJuxJSu2kZpudfl/aBAQlFhqtsQCs=
X-Received: by 2002:ac2:5dcf:0:b0:5ae:bb19:1864 with SMTP id 2adb3069b0e04-5b2f4b90286mr1828052e87.21.1786063301532;
        Thu, 06 Aug 2026 17:41:41 -0700 (PDT)
Received: from fedora ([46.8.219.5])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b3055f2b86sm189232e87.66.2026.08.06.17.41.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Aug 2026 17:41:41 -0700 (PDT)
From: Vitaliy Sochnev <sochnev.v.74@gmail.com>
To: Lorenzo Bianconi <lorenzo@kernel.org>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>
Cc: Vitaliy Sochnev <sochnev.v.74@gmail.com>,
	stable@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org (moderated list:AIROHA ETHERNET DRIVER),
	linux-mediatek@lists.infradead.org (moderated list:AIROHA ETHERNET DRIVER),
	netdev@vger.kernel.org (open list:AIROHA ETHERNET DRIVER),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH net] net: airoha: npu: load the firmware without the sysfs fallback
Date: Fri,  7 Aug 2026 03:41:08 +0100
Message-ID: <20260807024125.434055-1-sochnev.v.74@gmail.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260806_174144_620971_747748CF 
X-CRM114-Status: GOOD (  18.45  )
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

airoha_npu_load_firmware() maps a missing firmware file to -EPROBE_DEFER
so that the NPU can be brought up once the rootfs carrying /lib/firmware
has been mounted. That mapping holds only as long as request_firmware()
reports -ENOENT.

It does not when the sysfs fallback is in play. With
CONFIG_FW_LOADER_USER_HELPER_FALLBACK set, or with the fallback armed at
runtime through /proc/sys/kernel/firmware_config/force_sysfs_fallback,
request_firmware() hands the request to a userspace helper, waits out the
full loading_timeout and returns -ETIMEDOUT. The -ENOENT test no longer
matches, dev_err_probe() turns the result into a hard failure, and the
NPU is left unbound after stalling the boot for 60 seconds:

  airoha-npu 1e900000.npu: Direct firmware load for airoha/en7581_npu_rv32.bin failed with error -2
  airoha-npu 1e900000.npu: Falling back to sysfs fallback for: airoha/en7581_npu_rv32.bin
  airoha-npu 1e900000.npu: error -ETIMEDOUT: failed to run npu firmware
  airoha-npu 1e900000.npu: probe with driver airoha-npu failed with error -110

Clearing FW_LOADER_USER_HELPER in the configuration is not a dependable
guard against this, because unrelated drivers select it. On the affected
build the symbol was turned back on by LEDS_LP55XX_COMMON, even though
the platform had explicitly disabled it.

request_firmware_direct() sets FW_OPT_NOFALLBACK_SYSFS, so a missing file
is reported as -ENOENT whatever the firmware loader is configured to do,
and the deferred probe path works as it was meant to.

Measured on a Nokia XG-040G-MD with FW_LOADER_USER_HELPER=y and
FW_LOADER_USER_HELPER_FALLBACK=y, on two images from the same tree
differing only by this patch: without it the probe fails with
-ETIMEDOUT after 64.5s and the NPU stays unbound, with it the NPU
reports its firmware version at 3.7s. The fallback is compiled in and
forced in both cases; the patch does not disable it, it only keeps the
driver from falling into it.

Fixes: 23290c7bc190 ("net: airoha: Introduce Airoha NPU support")
Cc: stable@vger.kernel.org
Signed-off-by: Vitaliy Sochnev <sochnev.v.74@gmail.com>
---
 drivers/net/ethernet/airoha/airoha_npu.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/airoha/airoha_npu.c b/drivers/net/ethernet/airoha/airoha_npu.c
index b679bed95..ca33e615a 100644
--- a/drivers/net/ethernet/airoha/airoha_npu.c
+++ b/drivers/net/ethernet/airoha/airoha_npu.c
@@ -202,7 +202,7 @@ static int airoha_npu_load_firmware(struct device *dev, void __iomem *addr,
 	const struct firmware *fw;
 	int ret;
 
-	ret = request_firmware(&fw, fw_name, dev);
+	ret = request_firmware_direct(&fw, fw_name, dev);
 	if (ret)
 		return ret == -ENOENT ? -EPROBE_DEFER : ret;
 
-- 
2.55.0


