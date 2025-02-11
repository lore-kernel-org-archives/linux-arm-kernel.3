Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 457A0C021A2
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Feb 2025 20:09:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8c1c9c+jF/PV1jw8NDHsbVdhxY5rat61pZm6lsNJS64=; b=qDzhabWigrig915omFAohS8qxQ
	P3y12G+aZrzKjscApItDPsDpvmTUeY4VxJohy95ohegv+EoBz/rB8IQRhFanG1lV+iuaODza9YTkF
	ZdWVwtNZPR6SogDMALHedUhzNzhvgoRVl8yIjEikrJgxezLTs0xP5p9ie2aZQMUwqKnYfnomhz40h
	8s/I9XmI1XirqoL8VpaWKSRawQOjPS2MMa0vRgZ22e6iS5UseRUYCKBUOCl/XzfRj5tS5ERNpTkkH
	Jy7frwFbDIPWMOLbKcqMloKnY2XFNGXHXFm6lkExu6TkmeQylTI4zRpEXW6aUVhCFsrjIR3ZkfDPP
	2hvBLzvg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1thwZ1-000000059Bo-1tIJ;
	Tue, 11 Feb 2025 20:08:59 +0000
Received: from out-177.mta0.migadu.com ([91.218.175.177])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thwLM-0000000574v-2er8
	for linux-arm-kernel@lists.infradead.org;
	Tue, 11 Feb 2025 19:54:54 +0000
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=rosenzweig.io;
	s=key1; t=1739303690;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=8c1c9c+jF/PV1jw8NDHsbVdhxY5rat61pZm6lsNJS64=;
	b=eleVucTA6Y/Aq+KS/KuUhMfrZ/8vSFdBN3OlWrWdHHpBU0ghk49P3xQYdUjDxAGBU+0HrJ
	J2abXR3zsIU58AiKOvZgYMjsLdzaOfmdYmW4SV3ELBhWfTB3p/TfBIOZ8sI13LkcX4kLBm
	EZJWGlmrWK+vOnD/No3/g3Y2Dw6IvujzqRpUTh7M74Jd15+p6fis+55+5e0XuWNVJOd2M/
	TviuwO3e63iiVfBXr5xPUkfifLz1M7d48S8S1Y9kHmasxFpkyuC8MHtOAzi2SdgD6iXxVk
	0O8dt1e+2qFLlZf4G5n5hSITxwOD4lalNZqtrqGFIzrz8PxJNm2w6+e6Yw0a3w==
From: Alyssa Rosenzweig <alyssa@rosenzweig.io>
Date: Tue, 11 Feb 2025 14:54:31 -0500
Subject: [PATCH 6/7] PCI: apple: Use gpiod_set_value_cansleep in probe flow
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250211-pcie-t6-v1-6-b60e6d2501bb@rosenzweig.io>
References: <20250211-pcie-t6-v1-0-b60e6d2501bb@rosenzweig.io>
In-Reply-To: <20250211-pcie-t6-v1-0-b60e6d2501bb@rosenzweig.io>
To: Hector Martin <marcan@marcan.st>, Sven Peter <sven@svenpeter.dev>, 
 Bjorn Helgaas <bhelgaas@google.com>, 
 Lorenzo Pieralisi <lpieralisi@kernel.org>, 
 =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kw@linux.com>, 
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Mark Kettenis <kettenis@openbsd.org>, 
 Marc Zyngier <maz@kernel.org>, Stan Skowronek <stan@corellium.com>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-pci@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Alyssa Rosenzweig <alyssa@rosenzweig.io>
X-Developer-Signature: v=1; a=openpgp-sha256; l=1317; i=alyssa@rosenzweig.io;
 h=from:subject:message-id; bh=tkJEj/YQzRh1expKxGHWwtdYnql3z/mkcCDS+zSX2Ic=;
 b=owEBbQKS/ZANAwAIAf7+UFoK9VgNAcsmYgBnq6r2StvxCY5TXwIMlIs4Iw+P0DiN0ayir0EJ6
 KQ/HmRUygiJAjMEAAEIAB0WIQRDXuCbsK8A0B2q9jj+/lBaCvVYDQUCZ6uq9gAKCRD+/lBaCvVY
 DdzkD/4/L/bBMDYggvde1Eqx824QWWfDu44UG+t80LZZu/TviEIF84g+m2pAxfFuMTlnUZoDFQC
 67aPjwjeOJKhz9cUDs8w4axQz/gXMfQB98a1yoEe5TImHVKYixY2XJBVfxNrWIjPRVSNs112AOx
 dPEVRbijgncjlJU5han4ojOiqMJNAlzaTb7qGlvXsklXYx0HEUzGmEQOl+6N6/ewJdEdUUWhUE4
 it3WQPd8VLHwEvpGdKvd5NAKkL0kS0zjsRpcF6eVIPEFMDp+lB9G+c6rdaUsBT2bGDk0QZO+n0W
 LsXI9b7GVw3YaBRjxVubuX5vyRy31oL0WUo+pIfg6mdxFo+LxElJlaZY38E+FmIyyb/hl4P0Ct/
 9VINkr1gZs5U3O0YV5fiTRmlKSNmraf1M94W3SYIPnXJnpqwQlA+xpNuM0nj1eYXPFGdUPFmvJ1
 BWgFLJsIKL+Ryl4RBdSq19Gi1ePnHxj3u3QUzNEpf7KXKsD42TgjV0S+tuFbrJGik1NGblXa3nt
 Dg+QXvHhJsPEfmwaMul17292CtsQsAhnLB1YfgWrndsNWspwgKAYq0LnH3RRZjmtecMW6rNR4y2
 8lvFr1vzSeknF6ePm2IputGPoX/LIrujpVmdgFOEz9yn/74FWvotzIAzEH/HVsPquELrOygZDAn
 Qjf8FoVwZwUwoVQ==
X-Developer-Key: i=alyssa@rosenzweig.io; a=openpgp;
 fpr=435EE09BB0AF00D01DAAF638FEFE505A0AF5580D
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250211_115452_825030_64C92A88 
X-CRM114-Status: GOOD (  10.01  )
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

From: Hector Martin <marcan@marcan.st>

We're allowed to sleep here, so tell the GPIO core by using
gpiod_set_value_cansleep instead of gpiod_set_value.

Fixes: 1e33888fbe44 ("PCI: apple: Add initial hardware bring-up")
Signed-off-by: Hector Martin <marcan@marcan.st>
Signed-off-by: Alyssa Rosenzweig <alyssa@rosenzweig.io>
---
 drivers/pci/controller/pcie-apple.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/pci/controller/pcie-apple.c b/drivers/pci/controller/pcie-apple.c
index 209535db7855fa1ee0d75290b33525dce18f560d..7f4839fb0a5b15a9ca87337f53c14a1ce08301fc 100644
--- a/drivers/pci/controller/pcie-apple.c
+++ b/drivers/pci/controller/pcie-apple.c
@@ -553,7 +553,7 @@ static int apple_pcie_setup_port(struct apple_pcie *pcie,
 	rmw_set(PORT_APPCLK_EN, port->base + PORT_APPCLK);
 
 	/* Assert PERST# before setting up the clock */
-	gpiod_set_value(reset, 1);
+	gpiod_set_value_cansleep(reset, 1);
 
 	ret = apple_pcie_setup_refclk(pcie, port);
 	if (ret < 0)
@@ -564,7 +564,7 @@ static int apple_pcie_setup_port(struct apple_pcie *pcie,
 
 	/* Deassert PERST# */
 	rmw_set(PORT_PERST_OFF, port->base + PORT_PERST);
-	gpiod_set_value(reset, 0);
+	gpiod_set_value_cansleep(reset, 0);
 
 	/* Wait for 100ms after PERST# deassertion (PCIe r5.0, 6.6.1) */
 	msleep(100);

-- 
2.48.1


