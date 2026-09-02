Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81F6FC624D3
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  2 Sep 2026 13:08:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rn7i8U/ATxkqsV19D/fOiSUDBdGRoqkMbRkOr4LDxWI=; b=wWZm8+dlkTMxy6i/0L4y94Y8H1
	fJPiGwmwkQ105remAKF3GPzSnpi9o3ckuLUACt636E2DC/ABFbWuxSerSb2HJK7GgImpC/l775FxM
	ej/m5sqETTnI5BboEjxQWbUf5UnwyZBH0dwBSnx5vD1YHZqn9AQNvJNobJ6aoG0QqE0KLdEEXJK5U
	DuXi+S89zKjvjdJ6f57nHFdEs7l7IYW97QfwVcslhCuc1aeYPztyDWTSbn7AvIKPy4wNL1Lsd4NN4
	eej6nrimXx+sw4PnNy7Zi35RbSNFHMkLA1SwFC08V4yF1Z+8dM1fx44kgRuCrcuEVSmpXzZdAiNiR
	CG43xroA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1khR-0000000ElD6-0mUr;
	Wed, 02 Sep 2026 13:08:21 +0000
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1khO-0000000El9k-2Qsh
	for linux-arm-kernel@lists.infradead.org;
	Wed, 02 Sep 2026 13:08:19 +0000
Received: by mail-wr1-x42b.google.com with SMTP id ffacd0b85a97d-484362f5c4aso1106496f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 02 Sep 2026 06:08:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=flipper.net; s=google; t=1788354497; x=1788959297; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rn7i8U/ATxkqsV19D/fOiSUDBdGRoqkMbRkOr4LDxWI=;
        b=00o2qrgVJXelIlNHwyF3oRJy0HCAlP7XVO82yFsV9pmD/M0DqXsSx+V6Ykl70U9Ftl
         V/ZhLcGhmURJMYv3JdvZiAgMz+QY/XY0KnWELgOkuIhjVPteDkGQm7t83meHyycFDozy
         Y5K+GqPp5u8gMxepP7+3WbEcNu9QU2W6l9e58VGMRCxd7OgmKQjoI3jFEO9kN6d6y9P/
         5hHHEXTUynjJSIC7HrT2Km5msldVWOwYeuPPi3sMBlOxNZcbtkD0jcHT5njIBesOFZIJ
         HktnAzSbDujwzSkssqkmMm2qrgxUBCOcWvEBchnScDZGJ4GgJQEudsquA6vIYu0qD534
         8TQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788354497; x=1788959297;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rn7i8U/ATxkqsV19D/fOiSUDBdGRoqkMbRkOr4LDxWI=;
        b=AwDL3a50Rn4uic5AjVY7ArupyTFypc3hAbB6epGs25y+3+nYmERDJJkY0Wm6OQVONj
         7mYDXTX+1D/W/yQ9BWRrEp6t1YVJpV1/mwR7fz+URYsOH3XdO1AAgtGLGDgJx3StQwqV
         Gww4/O8Gu/EUBoXf4XCN07I6jxB6v5oxeQq/L4ig2WkRUVNyEwwlE/KQTqn5AJUNc7PH
         V5Ua1Z0DED+E1RrExZbg1jP+X06rNrcVmanCth+ZGfGnBDGQPBNbOoxGGMlOXCLbVkHH
         haQVkt5pVZX+GFSu+h9UtG27hrpm74ppnuSCHaEcTVg3+jRQ+D0ZrbAt7U2O31NJxidy
         pm0A==
X-Forwarded-Encrypted: i=1; AKwUvByJaF/sFZZFyHK7DK2ukWCuUd1mQ9CJ7iGrlZUp3V4BheFQ58KBz7VMVgaScU8zWsLbOkul7uzYzQSZdglN6GXX@lists.infradead.org
X-Gm-Message-State: AFuF++kjAIfdNXPGIny5s2YVKu0T90VSpePwqc4oG6PnevxPPRKOzMc6
	1rqKQi7W4+nXPChQGkvO8GjjRl5rDTtDzg/xYi+aliMiDVMh9OzHoIOigbvRZk40hIk=
X-Gm-Gg: AYBFou1A5/GCUzqG4y7YF3F7tQ0RUuUMVxvlrpwTxPjHafoP4khUO38MzUkmruiC0fN
	7yH1wEIGf28ePrOQMMbZXIIb7xMll3XJpS9LdFQs1W1xSq0aRDfyEgPIAKFFwUd2V4vi9UiIdt8
	yEAQGaeUkTKv4fzk//DbCpoPxSc4pKwe398m3kieyuxjpm/dZV9Ng/OePkop1p+nhly0BNTT3NT
	J83SvwieaxEml4mJWBM2az/QN1T+qj5oDL0rkajZRklt+n1w0rziBY2jIZzSVLa1LJUthJlLimF
	j520ls5Ec1AMILtjFxBCRhc/UaWyTg/Ih2Gt9vTy1I/1//3kUSjLtQsf2zNbPkP43JYTOrtm6ir
	kSJAM5u/FkSVzxxIGfYx7VUR43+rZW075/+CfoDNOwSODCjxGHnCnhsW5khz1gaeYtIGMfoctZj
	5+KbQAFagHrtLhu5IREdJ1aKR1n1hYve4nwOz+j/aHFD0gCfQMej1J4m3UmbH/Rg2FoHp49fT4o
	JuQeMTybG+czT2eW54VRZA4SKe234iFI06bwYvtZw==
X-Received: by 2002:a05:6000:480a:b0:47f:eac2:6f55 with SMTP id ffacd0b85a97d-48488f2229cmr9455000f8f.19.1788354496630;
        Wed, 02 Sep 2026 06:08:16 -0700 (PDT)
Received: from alchark-surface.localdomain (bba-2-51-220-108.alshamil.net.ae. [2.51.220.108])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48448e72b5bsm6385800f8f.4.2026.09.02.06.08.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 06:08:14 -0700 (PDT)
From: Alexey Charkov <alchark@flipper.net>
Date: Wed, 02 Sep 2026 17:07:54 +0400
Subject: [PATCH v2 3/4] nvmem: layouts: Add Rockchip OTP CPUID layout
 driver
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260902-rk3576-otp-cpuid-mac-v2-3-e4b7fe2ab13f@flipper.net>
References: <20260902-rk3576-otp-cpuid-mac-v2-0-e4b7fe2ab13f@flipper.net>
In-Reply-To: <20260902-rk3576-otp-cpuid-mac-v2-0-e4b7fe2ab13f@flipper.net>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=6627; i=alchark@flipper.net;
 h=from:subject:message-id; bh=k/jn5XrqJoguASStGfL3pZWOMkauDZVjoO+fk0jB14g=;
 b=owGbwMvMwCW2adGNfoHIK0sZT6slMWTNkN/8sWiqYlX7jJmH7nT4e3brq3wwePmr7anCydLqP
 /wyV9p6OyayMIhxMViKKbLM/bbEdqoR36xdHh5fYeawMoEMkRZpYAACFga+3MS8UiMdIz1TbUM9
 QyMdYx0jBi5OAZhq1VyGX0yeHJcebT3JbLu6IsNvjsrnOV83vHY4XReoHrj5q+iRUz8YGa6XBd7
 8sviF8aWphy/ISb6zXftL997Uhvfbr/Jr3a69vocRAA==
X-Developer-Key: i=alchark@flipper.net; a=openpgp;
 fpr=9DF6A43D95320E9ABA4848F5B2A2D88F1059D4A5
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260902_060818_662319_956B0DD5 
X-CRM114-Status: GOOD (  27.10  )
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

Reviewed-by: Miquel Raynal <miquel.raynal@bootlin.com>
Signed-off-by: Alexey Charkov <alchark@flipper.net>
---
 MAINTAINERS                                |   1 +
 drivers/nvmem/layouts/Kconfig              |  13 ++++
 drivers/nvmem/layouts/Makefile             |   1 +
 drivers/nvmem/layouts/rockchip-otp-cpuid.c | 119 +++++++++++++++++++++++++++++
 4 files changed, 134 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index f3d07ce7b3c8..73e0531445be 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -23727,6 +23727,7 @@ M:	Alexey Charkov <alchark@flipper.net>
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


