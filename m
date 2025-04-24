Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6E2BC369D5
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Apr 2025 16:06:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OmKgb2P7k7ka3054x1IngydlF8noVj1FtGkMjW5J68k=; b=lkcbRUCx0fV2Nkz1IlHXM5Tswn
	sHaOahqAs9ARfqOF0MZ4HmXHMTxVufXFrwYx/wiM9N2VGw0IXI/Uep2/kEk0aLJjbCH3GYp1cUNfb
	VBsM4cMwDib79vy9C69Q9bEaoHdFKM8hO8ZPgwC/1bx0NCqz1Y1KMLsGpJp50AbJGQCKtp54PzKMJ
	rDuPxQlJUbzfW6DHOUpgCJ9jxOfBqSAX/MkUvdRxxeHrf9TyvTyDM1xiRc/usxkDePTF4jluMaAvm
	1jBmVxgkzVDU7s4/fEIy0J1Jj62YZbnXj60zMzrTPsdYkTcwVZtXvL2E6pajhgfoYBr/pTi6PPhSx
	lhdho9MQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7z5K-0000000EdHj-0orR;
	Thu, 24 Apr 2025 16:05:58 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7xL0-0000000EKi3-3tCc
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Apr 2025 14:14:04 +0000
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-43ed8d32a95so9461375e9.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 24 Apr 2025 07:14:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745504041; x=1746108841; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OmKgb2P7k7ka3054x1IngydlF8noVj1FtGkMjW5J68k=;
        b=hhyyfZtMCMP/gnmBwWp3Y73dFmHDh7KRtYgd0PqaFzept73fqf+h/d5nYmnhtIOv7g
         loAVycZFVrVxj8ZZnCOOAglVfdOqMmpipt7pjaGpqLuOoYFSeQQ+TLO8cfRD4Cjwq8oo
         Sos35SLkQtDTc8W4eiT+GkljptopRjzqoM+84VM91DCl0ICoNFtkCW7yamJOk06p9Oed
         XHUmF5d4ryXlM4XGTsum1Xt+WeoZwyaEm0mPOu/SaKq2h6gwWwu3pTc5EZOQ3UTA2bSm
         yt/q3EKlBrHKlswDH76D0R6TsAkpc3pfuHW/LdU7m5UCN3Rz/zWzvSLK3HhBClUIUYwA
         RVIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745504041; x=1746108841;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OmKgb2P7k7ka3054x1IngydlF8noVj1FtGkMjW5J68k=;
        b=pqQQH1Gu8qLFYFIKJ+0v9lCmaUC4J4gdavnyEPx8r6wsE3od9GAfqsJlJD1nBkZXDx
         Gkis6xmqcdSsxqI19mg0a2NK7QcWD6GTtqcMD/yYQw/zh2eQXsi7obZxYWHhzyxelu5q
         9GKHooW8PnYztW9IvRHF02J56S+6G5s6ZTyWXBbN30qe+AsIRmgC8bACe3gt74LGhQ74
         aBiZ4ZfBtMWpejweH0dg6vWB7YIv6WsORCADMQ4UcL9Sr7nSIDLI0Lkf3S0i+JpQdXJh
         4LMg+2nIq6c5uCdOOtOwxZn2bwQ5d3s4IqCPntgMvU++YlEXsjHwzj5VfYBJqZTrvs/V
         63Ug==
X-Forwarded-Encrypted: i=1; AJvYcCUCsqIdd9V0pYZYVuYbrofduvSy4FF42pbLw2abM/lGdh10gBtqEA+Zdurl1fLpL+It86+Ev14SN+LDg1CCP2QM@lists.infradead.org
X-Gm-Message-State: AOJu0YzMdTm0VbsBd1qqY7o5LlW3R9ObQ7Y5vIMvo+yrVfYORhbX3Tgw
	T5GDI75CY2euyOEd/C/55GQiphfTuucJPCasT1+L3S9YyGIERt3yir+PPNG6iuQ=
X-Gm-Gg: ASbGncuOUTGJLyHgAlkhPD1vpF93iZL9NtxdJhMG+8COs+CrjIEtwqDb8K9ilJCmOV7
	rwcEKKcrTsZVN2R5Sa5GLo4WdHCSDEoIIF9/MfX0IR0f9VRpd5aGl+4hE37WgOlkitBwHakssod
	+Y0HhX+roLrAS+IlR1dPE8+UPG5fdkEbu1uQH48qJIZLnG6SRVL8vmfX5OQLy4S7gZ8/OHpQr6E
	phsgsjfQHTl2DfecfYclKeSrP1kRjVqv+FHiTWw2j/mfbIlB7koCuOpn8nZa6WR7pJ9yQuY4Ror
	naHWH2wnG1RKfDtKtQKcr+gHsQeNOuAC5NVf1QVD3wislnKkUu9tFWMATA+pf2VqpSLjbcCUCBE
	Pyq3FQBtqDAl0nYxplxS5/5fr7cI=
X-Google-Smtp-Source: AGHT+IGfkZ98OulZ0pJYU5c1ld+aBqoKjFuSpgzRjo7Jvo/4HTkJCAjHkRJEje6F6WXTnu8CxQELEw==
X-Received: by 2002:a05:600c:3b0c:b0:43c:e8ba:e166 with SMTP id 5b1f17b1804b1-4409bd83db4mr21261755e9.22.1745504040937;
        Thu, 24 Apr 2025 07:14:00 -0700 (PDT)
Received: from seksu.systems-nuts.com (stevens.inf.ed.ac.uk. [129.215.164.122])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a06d4a8150sm2199951f8f.7.2025.04.24.07.13.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Apr 2025 07:14:00 -0700 (PDT)
From: Karim Manaouil <karim.manaouil@linaro.org>
To: linux-kernel@vger.kernel.org,
	kvm@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev
Cc: Karim Manaouil <karim.manaouil@linaro.org>,
	Alexander Graf <graf@amazon.com>,
	Alex Elder <elder@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Fuad Tabba <tabba@google.com>,
	Joey Gouly <joey.gouly@arm.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Marc Zyngier <maz@kernel.org>,
	Mark Brown <broonie@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Oliver Upton <oliver.upton@linux.dev>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Prakruthi Deepak Heragu <quic_pheragu@quicinc.com>,
	Quentin Perret <qperret@google.com>,
	Rob Herring <robh@kernel.org>,
	Srinivas Kandagatla <srini@kernel.org>,
	Srivatsa Vaddagiri <quic_svaddagi@quicinc.com>,
	Will Deacon <will@kernel.org>,
	Haripranesh S <haripran@qti.qualcomm.com>,
	Carl van Schaik <cvanscha@qti.qualcomm.com>,
	Murali Nalajala <mnalajal@quicinc.com>,
	Sreenivasulu Chalamcharla <sreeniva@qti.qualcomm.com>,
	Trilok Soni <tsoni@quicinc.com>,
	Stefan Schmidt <stefan.schmidt@linaro.org>,
	Elliot Berman <quic_eberman@quicinc.com>
Subject: [RFC PATCH 12/34] gunyah: Add hypervisor driver
Date: Thu, 24 Apr 2025 15:13:19 +0100
Message-Id: <20250424141341.841734-13-karim.manaouil@linaro.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250424141341.841734-1-karim.manaouil@linaro.org>
References: <20250424141341.841734-1-karim.manaouil@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250424_071402_967868_6BCC5087 
X-CRM114-Status: GOOD (  20.66  )
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

From: Elliot Berman <quic_eberman@quicinc.com>

Add driver to detect when running under Gunyah. It performs basic
identification hypercall and populates the platform bus for resource
manager to probe.

Signed-off-by: Elliot Berman <quic_eberman@quicinc.com>
Reviewed-by: Srivatsa Vaddagiri <quic_svaddagi@quicinc.com>
Signed-off-by: Karim Manaouil <karim.manaouil@linaro.org>
---
 drivers/virt/Makefile        |  1 +
 drivers/virt/gunyah/Makefile |  3 +++
 drivers/virt/gunyah/gunyah.c | 52 ++++++++++++++++++++++++++++++++++++
 3 files changed, 56 insertions(+)
 create mode 100644 drivers/virt/gunyah/Makefile
 create mode 100644 drivers/virt/gunyah/gunyah.c

diff --git a/drivers/virt/Makefile b/drivers/virt/Makefile
index f29901bd7820..ef6a3835d078 100644
--- a/drivers/virt/Makefile
+++ b/drivers/virt/Makefile
@@ -10,3 +10,4 @@ obj-y				+= vboxguest/
 obj-$(CONFIG_NITRO_ENCLAVES)	+= nitro_enclaves/
 obj-$(CONFIG_ACRN_HSM)		+= acrn/
 obj-y				+= coco/
+obj-y				+= gunyah/
diff --git a/drivers/virt/gunyah/Makefile b/drivers/virt/gunyah/Makefile
new file mode 100644
index 000000000000..34f32110faf9
--- /dev/null
+++ b/drivers/virt/gunyah/Makefile
@@ -0,0 +1,3 @@
+# SPDX-License-Identifier: GPL-2.0
+
+obj-$(CONFIG_GUNYAH) += gunyah.o
diff --git a/drivers/virt/gunyah/gunyah.c b/drivers/virt/gunyah/gunyah.c
new file mode 100644
index 000000000000..3e795e3ba881
--- /dev/null
+++ b/drivers/virt/gunyah/gunyah.c
@@ -0,0 +1,52 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (c) 2023-2024 Qualcomm Innovation Center, Inc. All rights reserved.
+ */
+
+#include <linux/gunyah.h>
+#include <linux/module.h>
+#include <linux/of_platform.h>
+#include <linux/platform_device.h>
+
+static int gunyah_probe(struct platform_device *pdev)
+{
+	struct gunyah_hypercall_hyp_identify_resp gunyah_api;
+
+	if (!arch_is_gunyah_guest())
+		return -ENODEV;
+
+	gunyah_hypercall_hyp_identify(&gunyah_api);
+
+	pr_info("Running under Gunyah hypervisor %llx/v%u\n",
+		FIELD_GET(GUNYAH_API_INFO_VARIANT_MASK, gunyah_api.api_info),
+		gunyah_api_version(&gunyah_api));
+
+	/* Might move this out to individual drivers if there's ever an API version bump */
+	if (gunyah_api_version(&gunyah_api) != GUNYAH_API_V1) {
+		pr_info("Unsupported Gunyah version: %u\n",
+			gunyah_api_version(&gunyah_api));
+		return -ENODEV;
+	}
+
+	return devm_of_platform_populate(&pdev->dev);
+}
+
+static const struct of_device_id gunyah_of_match[] = {
+	{ .compatible = "qcom,gunyah-hypervisor" },
+	{}
+};
+MODULE_DEVICE_TABLE(of, gunyah_of_match);
+
+/* clang-format off */
+static struct platform_driver gunyah_driver = {
+	.probe = gunyah_probe,
+	.driver = {
+		.name = "gunyah",
+		.of_match_table = gunyah_of_match,
+	}
+};
+/* clang-format on */
+module_platform_driver(gunyah_driver);
+
+MODULE_LICENSE("GPL");
+MODULE_DESCRIPTION("Gunyah Driver");
-- 
2.39.5


