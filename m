Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97BF4CFD2F6
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  2 Dec 2025 09:54:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=fmcXNUEO80mXAVYkIIIRpgbvGeVPZ2JwOkqQjxC/qNM=; b=FVDb4X00TLPiPwxX5M1H45KwZH
	e7K2PG1gbub4OshFI3gGoiQJOYunTNg+QnVQlFjdPh42bQYNL8oeS3ryx+kTmNA9dxtOM2Ou+6pPn
	Yl9eMOjFEzjhpnZK2jRZvq/dfiR6DHvzvQxB8fgdiaOu2qRhEtZEwlFPjGXfbfhICUcZgFGZv2CNy
	ph1UzMQ6iGIZjqhp0ccv/OX1qsK+naiAyqWj+nhB9BAgr4VfMoCrSRPP9aJ15dr4f7fMMeWs/ei8b
	e9rAAjdECdS9CBkcYasVfhlfJhpK4kX1SaIY4sUJynZUeY1m4KJSEcT6EAc+UOGf27euCnDClN6g9
	HeR7hasA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQN5l-00000005CzU-27Th;
	Tue, 02 Dec 2025 09:54:41 +0000
Received: from mail-ed1-x52b.google.com ([2a00:1450:4864:20::52b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQN5j-00000005Cye-0GIu
	for linux-arm-kernel@lists.infradead.org;
	Tue, 02 Dec 2025 09:54:40 +0000
Received: by mail-ed1-x52b.google.com with SMTP id 4fb4d7f45d1cf-645a13e2b17so2027898a12.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 02 Dec 2025 01:54:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764669277; x=1765274077; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=fmcXNUEO80mXAVYkIIIRpgbvGeVPZ2JwOkqQjxC/qNM=;
        b=U5nrKEHQ3j6ZsCXzT7sVvq+3dh78duQPfZZExPPOAHrgxOTRgVq0ZOdvhGJQ7CA95u
         mhRIaM2LnPcKJwF1LNgdo5bgycfxJkNTQRSA4XUhs3tXnqaor28TJyAXsu35PrPi4uZf
         +E4Z4UFLSfJCHiXWN3yl1J228hcpKmv1ewBzAyq+29rg1Zbtf7c4uPWm+P+Ilwqp64/m
         XvTaFtfJ0cG0/f38l6nXCY4+AItIloD/MUaKWjWpSsL+xujhsA2PSlgAofF5rWot5kAW
         EnYCXIZR++63hVTjrP7gRAnUl2B1wBI1L7XdcCd2xzUt6XH10tdi5wAEXCK6Mt7dVd5g
         mCmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764669277; x=1765274077;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fmcXNUEO80mXAVYkIIIRpgbvGeVPZ2JwOkqQjxC/qNM=;
        b=PgoMndmTcJBqHdWQ9Twu1FKgrv+9YF3xVgJ0plGXdEXu87wbGCaZz5QVHitIucqVIH
         dis/qN6AoybXiOL0ZRUab/o4OAo6PAnHzJGvlJvR4aOm/LORz0t60vCRy8HIbo7uem6y
         pQS4OVfvLQmtkVjuKO8QgcT4VRLTghrNUoiL6Eq5/QilPO5M9hi+VCfOApADQjlqh0zU
         KZnw/qBd6G11Kb75OMV88zfG8tKUeYNU5ZVNjfgtFtpjDvdoz+aWLvwtMd//kpqV/wPI
         opU97NHlFa5IF9bMSdSH4401g4ixP35vH/j3/5o+Cq19O9GI7vxmA1+EyatnVt6ptxLi
         lkRg==
X-Forwarded-Encrypted: i=1; AJvYcCVIdmYaFuaKJqD2aAt4orQLrZmOQAiX2xSNfks4bnSgiVB0/RUo1nyuoYfDWyXUvKx7RHDBTo9qNgm0zsPD2WWV@lists.infradead.org
X-Gm-Message-State: AOJu0YxbqPNMbDzZhy+n4REnPyoIxHqEyPlf0eLWkzxZ6KT0fFrTQISw
	V0OWPTeoOxBsYjK4qVkx7gggAt2IAsWsxOsq7pUv63TVVCnt6O6XkI+vhA3L9fYHuiM=
X-Gm-Gg: ASbGncs+H5xjbU22uidmgoVpaDHazNToCkSqc5KA44WVCtaVDnMoXLlFYo8rkKqB0xY
	USAH2ptoB5oTZnkNkNw90bHDQEvvmVyS8lgOkMklaO6guuv4nl9gD1+3y452QasLNYT8SdDEN/7
	TDDTxxPH9uPBOxto3brMCRyHKFLPzW0y6GlDiiUncJ5TAr81v8QbHh+MG7inWEz4YRWmQV+W78r
	UfSPohsZ430k4V4sWW6jNtTqE3963cGUNe1Up3XpNc/bBWQfvGYukIZsxvWPcb/HrMrSuu81C1X
	JAOMmw8sf6TQhf9p3N+y5g7glfVEegrOvKyTUfGrIPNOSJyYtTKv71jo17qO82GnDNd9ngVpioK
	ClQF/TbpYnuf6Z+RBG+REikNVJkxGG5nkXVZMGZt8OTLVbTqDnpAFREgBjWJPD1aqeU+ogSfRQd
	7cKR4UgGmxUgCsFNCmAV5fev1jnaie
X-Google-Smtp-Source: AGHT+IFJ63lxp3eqfF6B3HqtZfdhy6bpjHT9zOV3GMz4SeDzpuMwc0q+BDsBTOMbJgg/CZ2xByTBig==
X-Received: by 2002:a17:906:c10e:b0:b73:2df0:9fa9 with SMTP id a640c23a62f3a-b76c566bccamr3151399066b.59.1764669276496;
        Tue, 02 Dec 2025 01:54:36 -0800 (PST)
Received: from alchark-surface.localdomain ([185.209.196.169])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b76f51a9819sm1494466566b.25.2025.12.02.01.54.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Dec 2025 01:54:36 -0800 (PST)
From: Alexey Charkov <alchark@gmail.com>
Date: Tue, 02 Dec 2025 13:54:31 +0400
Subject: [PATCH v2] arm64: dts: rockchip: Add overlay for the PCIe slot on
 RK3576 EVB1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251202-evb1-pcie1-v2-1-810693b1b72f@gmail.com>
X-B4-Tracking: v=1; b=H4sIAFa3LmkC/03Myw6CMBCF4Vchs7amUwWBle9hWPQywiRCSWsaD
 em7W3Hj8j/J+TaIFJgi9NUGgRJH9ksJdajATnoZSbArDUqqGlG1gpJBsVomFNrRqe302dWdhHJ
 YA935tWO3ofTE8enDe7cTftcfoyT+MwkFCtsoY3RtEZvLdZw1P47WzzDknD9VrquJpAAAAA==
X-Change-ID: 20251128-evb1-pcie1-ade389a4d590
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Alexey Charkov <alchark@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=3470; i=alchark@gmail.com;
 h=from:subject:message-id; bh=EiXesyPMoSc0xu7TjPVo5wefAUNtnNky3tjqoIW+AFk=;
 b=owGbwMvMwCW2adGNfoHIK0sZT6slMWTqbY/lOdT+2f7X5obnj38bezgrMH3WFfszl68h9d+Jg
 3G+035N7ShlYRDjYpAVU2SZ+22J7VQjvlm7PDy+wsxhZQIZwsDFKQATkbvHyDD565v1+aeZN6gq
 BIqeDb5mNnP5NPFfR7OK0sJdar+Ze9xkZJi31pDL3qBQ8tc3n9Ptv75NXSP3KtTp24Moni6xqPL
 bM5gA
X-Developer-Key: i=alchark@gmail.com; a=openpgp;
 fpr=9DF6A43D95320E9ABA4848F5B2A2D88F1059D4A5
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251202_015439_120325_B20763C6 
X-CRM114-Status: GOOD (  16.47  )
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

Rockchip RK3576 EVB1 has an onboard PCIe slot (PCIe 2.1, x4 mechanically,
x1 electrically), but it shares pins and PHY with the only USB3 Type-A
port.

There is a physical switch next to the slot to transfer respective pins
connection from the USB3 port to the PCIe slot, but apart from flipping
the switch one must also disable the USB3 host controller to prevent it
from claiming the PHY before the PCIe slot can become usable.

Add an overlay to disable the USB3 host port and instead enable the
PCIe slot, along with its pin configs. The physical switch must still be
flipped to the "ON - PCIe1" position for this to work.

Signed-off-by: Alexey Charkov <alchark@gmail.com>
---
Changes in v2:
- Added the standalone .dtbo Makefile target forgotten in v1
- Link to v1: https://lore.kernel.org/r/20251201-evb1-pcie1-v1-1-c62bba5c1167@gmail.com
---
 arch/arm64/boot/dts/rockchip/Makefile              |  5 ++++
 .../boot/dts/rockchip/rk3576-evb1-v10-pcie1.dtso   | 31 ++++++++++++++++++++++
 2 files changed, 36 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/Makefile b/arch/arm64/boot/dts/rockchip/Makefile
index ad684e3831bc..ecd2dd365e97 100644
--- a/arch/arm64/boot/dts/rockchip/Makefile
+++ b/arch/arm64/boot/dts/rockchip/Makefile
@@ -153,6 +153,7 @@ dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3568-wolfvision-pf5-io-expander.dtbo
 dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3576-armsom-sige5.dtb
 dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3576-armsom-sige5-v1.2-wifibt.dtbo
 dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3576-evb1-v10.dtb
+dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3576-evb1-v10-pcie1.dtbo
 dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3576-luckfox-omni3576.dtb
 dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3576-nanopi-m5.dtb
 dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3576-roc-pc.dtb
@@ -252,6 +253,10 @@ dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3576-armsom-sige5-v1.2-wifibt.dtb
 rk3576-armsom-sige5-v1.2-wifibt-dtbs := rk3576-armsom-sige5.dtb \
 	rk3576-armsom-sige5-v1.2-wifibt.dtbo
 
+dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3576-evb1-v10-pcie1.dtb
+rk3576-evb1-v10-pcie1-dtbs := rk3576-evb1-v10.dtb \
+	rk3576-evb1-v10-pcie1.dtbo
+
 dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3588-edgeble-neu6a-wifi.dtb
 rk3588-edgeble-neu6a-wifi-dtbs := rk3588-edgeble-neu6a-io.dtb \
 	rk3588-edgeble-neu6a-wifi.dtbo
diff --git a/arch/arm64/boot/dts/rockchip/rk3576-evb1-v10-pcie1.dtso b/arch/arm64/boot/dts/rockchip/rk3576-evb1-v10-pcie1.dtso
new file mode 100644
index 000000000000..dccf4a5debdb
--- /dev/null
+++ b/arch/arm64/boot/dts/rockchip/rk3576-evb1-v10-pcie1.dtso
@@ -0,0 +1,31 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * DT-overlay to enable the onboard PCIe x1 slot, which shares pins and the PHY
+ * with the USB3 host port.
+ * To use the PCIe slot, apply this overlay and flip the Dial_Switch_1 right
+ * next to the PCIe slot to low state (labeled "ON - PCIe1"). USB3 host port
+ * will be unusable (not even in 2.0 mode)
+ */
+
+/dts-v1/;
+/plugin/;
+
+#include <dt-bindings/pinctrl/rockchip.h>
+
+&pcie1 {
+	pinctrl-0 = <&pcie1m0_pins &pcie1_rst>;
+	pinctrl-names = "default";
+	status = "okay";
+};
+
+&pinctrl {
+	pcie1 {
+		pcie1_rst: pcie1-rst {
+			rockchip,pins = <4 RK_PC4 RK_FUNC_GPIO &pcfg_pull_none>;
+		};
+	};
+};
+
+&usb_drd1_dwc3 {
+	status = "disabled";
+};

---
base-commit: 7d0a66e4bb9081d75c82ec4957c50034cb0ea449
change-id: 20251128-evb1-pcie1-ade389a4d590

Best regards,
-- 
Alexey Charkov <alchark@gmail.com>


