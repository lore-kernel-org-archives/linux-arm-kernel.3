Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EADD1C624D6
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  1 Sep 2026 15:33:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=o0G2BdZkYIcm7ilvGhLvEO04Ul0Hj20yERUiWvshu/M=; b=jldhZf1MV2S3mtxFXhLF4rbNhW
	NagwHsWQffW2f6+WF4NpL8Hnu1IMEoe2gKrLYfu9omhLkWSBX76sdn4Sr8gkAuwxgkqgHySc23Ars
	1MVXq0z9v86XWAI1OiWQPK4yUj3MR6iZSpKMbcnL9qyk+xrYJEPaSiRzLRDpXIy3Yrn7KIbJK0VPV
	k4bTnX8X2VqWYlUJkv8K5Qkp5URgNZQohETbK8qAvStI7+6aust8+Zz+U4O3rMS+V07SvIb3BCIKB
	gliBkG+3Hdvx6zvDHxrRpLiJaO2ZSs1809sm5jXvw6XYBKmC437w4pEpyRLPg3GkPAR2eiVpjK+a0
	e7nyPUww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1QUR-0000000CVnA-25kM;
	Tue, 01 Sep 2026 15:33:35 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1QUP-0000000CVkA-0OlG
	for linux-arm-kernel@lists.infradead.org;
	Tue, 01 Sep 2026 15:33:34 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-4921eed3fa2so49816225e9.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 01 Sep 2026 08:33:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=flipper.net; s=google; t=1788276811; x=1788881611; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=o0G2BdZkYIcm7ilvGhLvEO04Ul0Hj20yERUiWvshu/M=;
        b=WwCYok0Mt4rSANmzzvA0U8YdIHXEdcbi6wEWHk7GGxg1Pb8VidD2BmEHT/QL6KR0vU
         QHrPpLLkYXsekHIYc/xVBqXUmqzFpgJWKqWbMhcjjqiaHHCJCSS2MPNZ64WUvvdqGbIh
         PhmWrMCVx0XKBKd2UT4fr/bvyQX7NCUkAjUgk5UMxUlZS23x9of+9YHGt2LLLGxCeZjg
         U3vZi2GiKCKFwdGKvVFT0fXcYde8xxXKB9NwxlAhGp7HGILYZt91pznG6/fu466ZAMVu
         mEyehaK3YS5i2mO1A/ieUM7Wj1HiVkH5DzDNwETQjsojQIfpLmpEK+nCJV3zJQQuzI9o
         IarQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788276811; x=1788881611;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=o0G2BdZkYIcm7ilvGhLvEO04Ul0Hj20yERUiWvshu/M=;
        b=hC9RfjoZiG2GKDpM6jOa6mbV/OhcgXgXQyur630AqEWgd96/R1a1FUkJWhaTP0qrXP
         K2WZcb3HsyvwBneh/PHbL5Q4NuSppGMejqK6ZF7XOxSCpIk1K+Q7MqQeYnnZqBeRg8yD
         KJK4aFnzM9zzmn5dWcni3uTR7JI2fRZLmipHip31JvE1BOxfNzRQat8S9+sPIWcyP7Tc
         RK82IdP4eg9+O7Y+wto5oUpZiSOc0ME+Vg9ue64pawo8bSDGcNx7861jCedKBUNfDTXi
         ddR9lUiqwTALGFsJnneCbPfjA3Z6x8P8HBSRF6s4jRU9FneKRMXgvEm93x1t143z2mSJ
         FsdA==
X-Forwarded-Encrypted: i=1; AHgh+RqrEmcL1OkjYaM2W41RFWCdBLY1NvZPV4zfjgboHWfKA3nWGkNRfxPLUhuGUhICgWiHqT+thZ9f4wDLDYATn7HP@lists.infradead.org
X-Gm-Message-State: AFuF++lHB0OnVM9++WG3eyZb9a/YaOxUZQxhQ6WG1N4Jy4MWRj22rqX5
	52HpmR02AqOG0gVUItR3JN+ec9pOt+ZbAVVQAjwZEzdd1SSCbozGNTRSyxXPVksne4NeW66tbma
	TkC4K
X-Gm-Gg: AR+sD111HlcuhySj+IiDg25XwEH1+pKsmIaBxHeMEH+68BHdUs7z060D9uEZy5NSKwh
	xl54HcSntatN2yTaHicBqAzz5PqMxBJFa/ThqB4PNyLp3mNDswG6hqQqc58K3pGJkAumwU+H32J
	JYkqbzZ+GSoTPvlgQhjRQ+e1NiAPuoqf9ae/iHYTk/lxm9fxxQreLUcG5kIHmLfVsbsdwwl/Q0+
	Ic0mcPIAFhTQ3WhEawe82KqDzYRRlDzofaUQ/ZmuXr3qI3s6fhEPxiXVw0K9SOkOXA3GlhujaF1
	9rlwwNmkYCt+wHUB1F5q3oxybDOMEXGvGbmcupLqUnOOvkzyLp+uE0Q0M7dvDRhfkvXTHj9uSkc
	GR3Q78pEFjvennIVxzyahoCqtxv8kpB6Wi3ZU0/oHZ1Chjp3K5p0oDYeTc0ZK+RJAHuooalFaIC
	TABQmJlHfHjDMdXWvC/ABKwcNGpR+8plbqr+R/oi2JJG0F4FXo/n93T+wYA5LT17Cpy+4h94UGx
	x9oMwHYNx/nS9qql7lP2xHx+k4WP2UtDak59MzM
X-Received: by 2002:a05:600c:4e0b:b0:499:b65d:124f with SMTP id 5b1f17b1804b1-49ce00540f1mr119597595e9.11.1788276811127;
        Tue, 01 Sep 2026 08:33:31 -0700 (PDT)
Received: from alchark-surface.localdomain (bba-2-51-220-108.alshamil.net.ae. [2.51.220.108])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49b91c5790csm314541845e9.0.2026.09.01.08.33.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 08:33:30 -0700 (PDT)
From: Alexey Charkov <alchark@flipper.net>
Date: Tue, 01 Sep 2026 19:33:13 +0400
Subject: [PATCH 3/4] nvmem: layouts: Add Rockchip OTP CPUID layout driver
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260901-rk3576-otp-cpuid-mac-v1-3-ea9135270fc2@flipper.net>
References: <20260901-rk3576-otp-cpuid-mac-v1-0-ea9135270fc2@flipper.net>
In-Reply-To: <20260901-rk3576-otp-cpuid-mac-v1-0-ea9135270fc2@flipper.net>
To: Srinivas Kandagatla <srini@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 Michael Walle <michael@walle.cc>, Miquel Raynal <miquel.raynal@bootlin.com>, 
 Finley Xiao <finley.xiao@rock-chips.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 Alexey Charkov <alchark@flipper.net>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=6571; i=alchark@flipper.net;
 h=from:subject:message-id; bh=d4EylAch0HWQDbh+CNZzCOo23MHWD8MSNDYCBCvHebw=;
 b=owGbwMvMwCW2adGNfoHIK0sZT6slMWRN+2C3Zn96lfC2ddusjhzeHOBsUORaZmnpK16kE6g0Z
 +mxD2usOiayMIhxMViKKbLM/bbEdqoR36xdHh5fYeawMoEMkRZpYAACFga+3MS8UiMdIz1TbUM9
 QyMdYx0jBi5OAZjqwD6G//EB7Gmyp/qmnLr/U/nvXiVxvrbi6TXLfphyL7NdYiexvYXhn72f8gP
 bLZ1nlmj+vZ138NICg4lzq6KfXbKWZwzweK5/jRsA
X-Developer-Key: i=alchark@flipper.net; a=openpgp;
 fpr=9DF6A43D95320E9ABA4848F5B2A2D88F1059D4A5
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260901_083333_183772_8F94A12F 
X-CRM114-Status: GOOD (  27.38  )
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

Rockchip SoCs customarily use the CPU ID programmed into their on-chip OTP
memory to derive stable Ethernet MAC addresses even when a board doesn't
otherwise have dedicated storage for those. The derivation depends on the
particular bootloader implementation (e.g. it is done by upstream U-Boot,
which patches the derived MAC addresses at runtime into the device tree it
hands to the kernel). Using less featureful bootloaders, such as direct
boot to Linux from SPL, leaves the kernel with only a random MAC address
instead, even though everything required for the derivation is equally
available to Linux as it is to U-Boot.

Reproduce the same derivation in the kernel and expose the result as an
nvmem cell named "mac-address", so that of_get_mac_address() picks it up
through its standard nvmem fallback. The address index comes from the DT
phandle argument, which lets both interfaces of a dual Ethernet board
share a single cell.

Enable the layout by default on Rockchip, as consumers of its cells would
otherwise defer their probe indefinitely.

Signed-off-by: Alexey Charkov <alchark@flipper.net>
---
 MAINTAINERS                                |   1 +
 drivers/nvmem/layouts/Kconfig              |  13 ++++
 drivers/nvmem/layouts/Makefile             |   1 +
 drivers/nvmem/layouts/rockchip-otp-cpuid.c | 119 +++++++++++++++++++++++++++++
 4 files changed, 134 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index b35b3677bf0b..ae98e1fc6121 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -23718,6 +23718,7 @@ M:	Alexey Charkov <alchark@flipper.net>
 L:	linux-rockchip@lists.infradead.org
 S:	Maintained
 F:	Documentation/devicetree/bindings/nvmem/layouts/rockchip,rk3576-otp-cpuid.yaml
+F:	drivers/nvmem/layouts/rockchip-otp-cpuid.c
 
 ROCKCHIP RK3568 RANDOM NUMBER GENERATOR SUPPORT
 M:	Daniel Golle <daniel@makrotopia.org>
diff --git a/drivers/nvmem/layouts/Kconfig b/drivers/nvmem/layouts/Kconfig
index 5e586dfebe47..6e2511ac6f7e 100644
--- a/drivers/nvmem/layouts/Kconfig
+++ b/drivers/nvmem/layouts/Kconfig
@@ -26,6 +26,19 @@ config NVMEM_LAYOUT_ONIE_TLV
 
 	  If unsure, say N.
 
+config NVMEM_LAYOUT_ROCKCHIP_OTP_CPUID
+	tristate "Rockchip OTP CPU ID layout support"
+	default ARCH_ROCKCHIP
+	select CRYPTO_LIB_SHA256
+	help
+	  Say Y here if you want to expose the MAC addresses that Rockchip
+	  bootloaders derive from the CPU ID programmed into the OTP memory of
+	  Rockchip SoCs. Boards which have no other source of MAC addresses
+	  need this to get stable ones when the bootloader does not patch them
+	  into the device tree.
+
+	  If unsure, say N.
+
 config NVMEM_LAYOUT_U_BOOT_ENV
 	tristate "U-Boot environment variables layout"
 	select CRC32
diff --git a/drivers/nvmem/layouts/Makefile b/drivers/nvmem/layouts/Makefile
index dd6c6c70b1a9..a0ade4c22c79 100644
--- a/drivers/nvmem/layouts/Makefile
+++ b/drivers/nvmem/layouts/Makefile
@@ -6,4 +6,5 @@
 obj-$(CONFIG_NVMEM_LAYOUTS) += fixed-layout.o
 obj-$(CONFIG_NVMEM_LAYOUT_SL28_VPD) += sl28vpd.o
 obj-$(CONFIG_NVMEM_LAYOUT_ONIE_TLV) += onie-tlv.o
+obj-$(CONFIG_NVMEM_LAYOUT_ROCKCHIP_OTP_CPUID) += rockchip-otp-cpuid.o
 obj-$(CONFIG_NVMEM_LAYOUT_U_BOOT_ENV) += u-boot-env.o
diff --git a/drivers/nvmem/layouts/rockchip-otp-cpuid.c b/drivers/nvmem/layouts/rockchip-otp-cpuid.c
new file mode 100644
index 000000000000..61f509c4a8cf
--- /dev/null
+++ b/drivers/nvmem/layouts/rockchip-otp-cpuid.c
@@ -0,0 +1,119 @@
+// SPDX-License-Identifier: GPL-2.0
+// SPDX-FileCopyrightText: 2026 Flipper FZCO
+/*
+ * NVMEM layout for the CPU ID in Rockchip OTP memory
+ */
+
+#include <crypto/sha2.h>
+#include <linux/device-id/of.h>
+#include <linux/etherdevice.h>
+#include <linux/hex.h>
+#include <linux/module.h>
+#include <linux/nvmem-provider.h>
+#include <linux/of.h>
+#include <uapi/linux/if_ether.h>
+
+#define ROCKCHIP_CPUID_LEN	16
+
+struct rockchip_cpuid_data {
+	unsigned int offset;
+};
+
+static int rockchip_cpuid_mac_pp(void *priv, const char *id, int index,
+				 unsigned int offset, void *buf, size_t bytes)
+{
+	char cpuid[ROCKCHIP_CPUID_LEN * 2];
+	u8 digest[SHA256_DIGEST_SIZE];
+	u8 *mac = buf;
+
+	if (bytes != ROCKCHIP_CPUID_LEN)
+		return -EINVAL;
+
+	if (index < 0 || index > 1)
+		return -EINVAL;
+
+	/* The buffer still holds the raw CPU ID at this point */
+	bin2hex(cpuid, mac, ROCKCHIP_CPUID_LEN);
+
+	sha256(cpuid, sizeof(cpuid), digest);
+
+	memcpy(mac, digest, ETH_ALEN);
+	mac[0] &= 0xfe;		/* clear the multicast bit */
+	mac[0] |= 0x02;		/* set the locally administered bit */
+	mac[5] ^= index;
+
+	if (!is_valid_ether_addr(mac))
+		return -EINVAL;
+
+	return 0;
+}
+
+static int rockchip_cpuid_add_cells(struct nvmem_layout *layout)
+{
+	const struct rockchip_cpuid_data *data;
+	struct nvmem_cell_info info = {0};
+	struct device_node *layout_np;
+	int ret;
+
+	data = of_device_get_match_data(&layout->dev);
+	if (!data)
+		return -EINVAL;
+
+	layout_np = of_nvmem_layout_get_container(layout->nvmem);
+	if (!layout_np)
+		return -ENOENT;
+
+	info.name = "mac-address";
+	info.offset = data->offset;
+	info.raw_len = ROCKCHIP_CPUID_LEN;
+	info.bytes = ETH_ALEN;
+	info.read_post_process = rockchip_cpuid_mac_pp;
+	info.np = of_get_child_by_name(layout_np, info.name);
+
+	of_node_put(layout_np);
+
+	ret = nvmem_add_one_cell(layout->nvmem, &info);
+	if (ret)
+		of_node_put(info.np);
+
+	return ret;
+}
+
+static int rockchip_cpuid_probe(struct nvmem_layout *layout)
+{
+	layout->add_cells = rockchip_cpuid_add_cells;
+
+	return nvmem_layout_register(layout);
+}
+
+static void rockchip_cpuid_remove(struct nvmem_layout *layout)
+{
+	nvmem_layout_unregister(layout);
+}
+
+static const struct rockchip_cpuid_data rk3576_cpuid_data = {
+	.offset = 0x0a,
+};
+
+static const struct of_device_id rockchip_cpuid_of_match_table[] = {
+	{
+		.compatible = "rockchip,rk3576-otp-cpuid",
+		.data = &rk3576_cpuid_data,
+	},
+	{},
+};
+MODULE_DEVICE_TABLE(of, rockchip_cpuid_of_match_table);
+
+static struct nvmem_layout_driver rockchip_cpuid_layout = {
+	.driver = {
+		.name = "rockchip-otp-cpuid-layout",
+		.of_match_table = rockchip_cpuid_of_match_table,
+	},
+	.probe = rockchip_cpuid_probe,
+	.remove = rockchip_cpuid_remove,
+};
+module_nvmem_layout_driver(rockchip_cpuid_layout);
+
+MODULE_LICENSE("GPL");
+MODULE_AUTHOR("Alexey Charkov <alchark@flipper.net>");
+MODULE_DESCRIPTION("NVMEM layout driver for the CPU ID in Rockchip OTP memory");

-- 
2.54.0


