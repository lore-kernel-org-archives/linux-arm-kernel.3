Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AEC78C5B56A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Aug 2026 16:17:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=RR2VgYwZjBupSt8VlBAmyBBmTAH9MTVFGE/w24WyCi4=; b=NnCO478f1aud2TbZZ+NspRP6Ui
	k2ERXsSUqUZx6pbQlq3NqwuddvIP/r4omjK39ce6yQLN7bhLwBCEGtkgbo44H7RjpCn3nhEaHIXxs
	s4pB10P17YUC/usKJra23W5t0NGxrOsr/zTCmr5A9tSVkDKT6C0yZ/3OPBaVTsHzJiRDZGl/x2dDB
	399kySZIkebUWfKnfAarcEjwltSVFtqcPLRcnrbmqGUaRD5mqcpxxOHl82wXqZL59fhq+UaqJMWr4
	L3sWRwv2Q/wGVL7er/V2X51DnC00Sm1hY0UEf757nFhHCHHfHOrEg3ojejOtV/GO3LpoGWCUFslZC
	i1h8fqFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtpAU-0000000ET6H-22Wp;
	Tue, 11 Aug 2026 16:17:34 +0000
Received: from mail-lj1-x235.google.com ([2a00:1450:4864:20::235])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtpAS-0000000ET4d-0Y0b
	for linux-arm-kernel@lists.infradead.org;
	Tue, 11 Aug 2026 16:17:33 +0000
Received: by mail-lj1-x235.google.com with SMTP id 38308e7fff4ca-39f631dbce3so648461fa.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 11 Aug 2026 09:17:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786465050; x=1787069850; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=RR2VgYwZjBupSt8VlBAmyBBmTAH9MTVFGE/w24WyCi4=;
        b=pJW1nnfzjIyCBUgL6fs406uulye1g3piNkcN/M3ivkFrcvjC0k2nt8nDSHjOJsqJAw
         N9SUtaYOfSgD3BTQR7cLxCezYKCYR/9gRTZH6Hsq9EDOtHotlUAyGtb13Fp5zK8WBWdA
         R4huFxvZaZVZY9FtvfWomaZ3zXqIqlORc+vZqdu27nSuX7tFAcc1RWcam5x1NgO47ikF
         ILvc9IbfoibgAnoGvTuoLcjvZAjbG6TFzJceCbpjYkyuFjdJgu2GVfGC/7fj/HNmed8V
         7ZUrwTCEaAbPU3poF19Wwf2DRizqQMQ98oKCJrW1oE9d2WYT+PiMueeFy8hwTKuyr5cS
         MvWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786465050; x=1787069850;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RR2VgYwZjBupSt8VlBAmyBBmTAH9MTVFGE/w24WyCi4=;
        b=c3ChuHwhSzJdLPwPabY0SirqyjeZknNfyu6ou0GZOSdk+oBWQMkgnefyrG/TTAWl65
         otXp6u30+x9zOLC/sbmlmAjFoWnz8a1AZeYpDaHleFIvwyTn+l6rx+5F056IhVo8IyBA
         s+j5Z/AKCUvvs20U44SXc4Ene4YYKyUc5oYDKA+IX9n9D1vCmEutcuMq2xm5CLXBPS69
         kbJ/MYD5yCuLkVozgfPlBfhkEz4QXM8f3GR3U7w0MPtP3OCdX9oAiBSgFSJothN9wyHl
         CemgRE/ryGcA/11hXxCyY9OW/x/l9dAktK/ln8yKGt/gkBVmsuWSI1gKWWlkFXr0yZmU
         AkCg==
X-Forwarded-Encrypted: i=1; AHgh+RrWYPgKinWrWBv1RI9aKN0xn6myhm+oQLvH26x/zdMWjjzeFV0NgGEhgYQ+JPhzehmB/DOtldzd7+MyKuTsBjbH@lists.infradead.org
X-Gm-Message-State: AOJu0YzZ9cefAqZsir3fs1zAQ3ZojpYNFHbDkG2a0oHFcKYqM0VWUF9D
	E//8WeOCCUEETHDoxSO4d6vjm3E+E6sP5vpNQiexDOnXdxBAViLXaok=
X-Gm-Gg: AR+sD11gUGWtJUmOUptj5Diz1kBfjdDFzM3gaYZpuuIY1Hs7a3EySY5Haf9D47dIIqX
	d68cVHXFUReyyicHO4jJMliCNS8N2jpPwj5VeFcK1H/+hVTqapXxyIaGtOMiIwKDHfNm8PkLFRO
	YeJR2W1UJxhzrq1tBInudO47fNMxRsVQcxd6AzRqnGU5Cw5jJs8U5SUX6a5zx4j9tuoUwrD3eT3
	9yKQu4tJm4pQWqH/JCyQHvHkTDnP+4Zc4jORnv3JJHtyQ4HmMORKO1hHwtf4wC/zicHgl69gy5b
	C0DwRll5FmK7pKA3yhqUVi1W+LA9/IufmyOLAYN47kAxD21Sy6WOan2fRhl8ZVDH3vuBLBNLccB
	aVAw+OzKH0F7emXo7EsdFRhBAnRf8yDXqbFCtNQ44nBSFBjiqf4Rp9EqsTWQ90WqhaH52U0Zvs5
	Hz4gjACkfzNBle09ziqQDY7PkoZqjpeKUt3Q0TFgW9cGd8UCftG+w=
X-Received: by 2002:a2e:b8d6:0:b0:39e:fff5:7cdc with SMTP id 38308e7fff4ca-3a0f8d24244mr5889591fa.18.1786465049259;
        Tue, 11 Aug 2026 09:17:29 -0700 (PDT)
Received: from fedora ([46.8.219.5])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3a0fa5bc458sm3575781fa.27.2026.08.11.09.17.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Aug 2026 09:17:28 -0700 (PDT)
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
Subject: [PATCH net v2] net: airoha: npu: load the firmware without the sysfs fallback
Date: Tue, 11 Aug 2026 19:16:59 +0100
Message-ID: <20260811181717.19339-1-sochnev.v.74@gmail.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260811_091732_457930_AF063C01 
X-CRM114-Status: GOOD (  22.51  )
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

Use request_firmware_direct() instead. It sets FW_OPT_NOFALLBACK_SYSFS,
so a missing file is reported as -ENOENT whatever the firmware loader is
configured to do, and the deferred probe path works as intended.

Two consequences are worth stating plainly.

The helper is not merely bypassed for the boot-before-rootfs case.
fw_run_sysfs_fallback() returns early on FW_OPT_NOFALLBACK_SYSFS, so this
driver's firmware requests can no longer be served by a usermode helper
at all, including on a system where that is the only delivery route;
having no second firmware source, the driver would defer forever there.
That is a deliberate trade-off: the -ENOENT to -EPROBE_DEFER mapping was
written to wait for a filesystem, and the sysfs helper interface has had
no in-tree consumer since udev dropped firmware loading.

request_firmware_direct() also sets FW_OPT_NO_WARN, which drops the only
message naming the file that failed to load. Report it from the driver
instead, so the name lands in the deferred probe reason and shows up in
the "deferred probe pending" line emitted at
driver_deferred_probe_timeout. The generic report in airoha_npu_probe()
goes away with it, since it would otherwise overwrite that reason with a
message naming nothing; of the paths it covered, devm_ioremap_resource()
reports itself and the malformed firmware-name property now does too.

Measured on a Nokia XG-040G-MD with FW_LOADER_USER_HELPER=y and
FW_LOADER_USER_HELPER_FALLBACK=y forced on, two images from the same
tree differing only by this patch:

  without:  fallback at 2.477s -> -ETIMEDOUT at 64.555s -> probe failed
            with -110, preinit at 69.6s, NPU unbound
  with:     no fallback, NPU fw version 1456.62 at 3.665s, preinit at
            7.6s

Fixes: 23290c7bc190 ("net: airoha: Introduce Airoha NPU support")
Cc: stable@vger.kernel.org
Signed-off-by: Vitaliy Sochnev <sochnev.v.74@gmail.com>
---
v2:
 - Keep the file name in the diagnostics. request_firmware_direct() also
   sets FW_OPT_NO_WARN, which dropped the only message naming the file;
   report it from airoha_npu_load_firmware() through dev_err_probe() so
   the name lands in the deferred probe reason. Drop the generic report
   in airoha_npu_probe(), which would overwrite that reason, and give
   the malformed firmware-name path a message of its own.
 - Say in the changelog that the usermode helper path is disabled for
   this driver's requests rather than merely bypassed, and why that
   trade-off is acceptable.
 - Both points raised in review of v1:
   https://lore.kernel.org/netdev/20260807024125.434055-1-sochnev.v.74@gmail.com/

 drivers/net/ethernet/airoha/airoha_npu.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/drivers/net/ethernet/airoha/airoha_npu.c b/drivers/net/ethernet/airoha/airoha_npu.c
index b679bed95..de75376db 100644
--- a/drivers/net/ethernet/airoha/airoha_npu.c
+++ b/drivers/net/ethernet/airoha/airoha_npu.c
@@ -202,9 +202,10 @@ static int airoha_npu_load_firmware(struct device *dev, void __iomem *addr,
 	const struct firmware *fw;
 	int ret;
 
-	ret = request_firmware(&fw, fw_name, dev);
+	ret = request_firmware_direct(&fw, fw_name, dev);
 	if (ret)
-		return ret == -ENOENT ? -EPROBE_DEFER : ret;
+		return dev_err_probe(dev, ret == -ENOENT ? -EPROBE_DEFER : ret,
+				     "failed to load %s\n", fw_name);
 
 	if (fw->size > fw_max_size) {
 		dev_err(dev, "%s: fw size too overlimit (%zu)\n",
@@ -230,7 +231,8 @@ airoha_npu_load_firmware_from_dts(struct device *dev, void __iomem *addr,
 	ret = of_property_read_string_array(dev->of_node, "firmware-name",
 					    fw_names, ARRAY_SIZE(fw_names));
 	if (ret != ARRAY_SIZE(fw_names))
-		return -EINVAL;
+		return dev_err_probe(dev, -EINVAL,
+				     "invalid firmware-name property\n");
 
 	ret = airoha_npu_load_firmware(dev, addr, fw_names[0],
 				       NPU_EN7581_FIRMWARE_RV32_MAX_SIZE);
@@ -772,7 +774,7 @@ static int airoha_npu_probe(struct platform_device *pdev)
 
 	err = airoha_npu_run_firmware(dev, base, &res);
 	if (err)
-		return dev_err_probe(dev, err, "failed to run npu firmware\n");
+		return err;
 
 	regmap_write(npu->regmap, REG_CR_NPU_MIB(10),
 		     res.start + NPU_EN7581_FIRMWARE_RV32_MAX_SIZE);
-- 
2.55.0


