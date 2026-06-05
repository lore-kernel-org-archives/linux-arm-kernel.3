Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42544CD6E7E
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  5 Jun 2026 11:38:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CFbJYflDDV02dtarv4YB5PHu3EiVcrVU9/w1VgU1PjM=; b=Js+/usYkJ5gRLDIKHa5JsDlgwR
	R1OHXnU59Ei3t7cV0CcBRotHesGNw2MEm1Ivh+tCEpeNZ2k8gcnDEtdzgVcjEEwRn7AkXWTG1Boq0
	mceHQeCFWW8MbmPeestdGACred17RIDvfdEnDA3lGmTcSyJKBPbVTZ9vgDh2XiWy3yziw6LMkkXdK
	foK9RFwl0MpDC1JrOGvKlDTBrc4OoK8WUkwWmLaMie6Fx2txtuOC7cu0Q0urMdTfykrAPWWK8evMj
	Cif7ZmDPJ4KbT3kacrhvtNMAf0AVQU5zs79ZqV2IOYcr62qjXfeq5FIBg9pmY6wxu237EBke1NIPn
	t351YZVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wVSsL-00000000Ydv-18um;
	Fri, 05 Jun 2026 11:38:09 +0000
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wVSsI-00000000Yaq-16mT
	for linux-arm-kernel@lists.infradead.org;
	Fri, 05 Jun 2026 11:38:07 +0000
Received: by mail-wr1-x42d.google.com with SMTP id ffacd0b85a97d-45ef4223be7so1015837f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 05 Jun 2026 04:38:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780659484; x=1781264284; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CFbJYflDDV02dtarv4YB5PHu3EiVcrVU9/w1VgU1PjM=;
        b=mKDiGy9+V3JgVkaEwSl4OFZKfpkW6z3h2fBygRxBgMs8cbzMolCKapRxN1k2nIYknN
         iT559b7EMM98LhtqvuskCw9TMvYw13+i+kIdqWSp1klCcPIh7iDLamwWGH8l2urVa0V3
         MFaRrKx9h8GqPvsEom3Ds4dg93VUJsaUHrXrYP7slzT/cFCuZMWzkA0OXkT//tUaPJ8i
         AdbU7NJk5iBua2bO2FEbjNx1TLRwcH3kcn2a4B/dKHXW/h3wvOntN8o5W1F0VxjOoEac
         g9HWEArrsFRSU0cp2rwIkOulN+qgUSH0k8ZLoP7LzTK1TxsbSTalPm++tCjRY3koeVZp
         B+uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780659484; x=1781264284;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=CFbJYflDDV02dtarv4YB5PHu3EiVcrVU9/w1VgU1PjM=;
        b=Tp4JdG3qk6+igKqOrZfchtQ0yVMH5LH+K+WfSjAmPPtm5UmVnaCcuSwL1zHPDGmIix
         iptIk23pbydewMlK3LNi3HH5PmaGkWT5gUQpz/zvkAf2i0oNvfrFFp6hrlRENI7PX0/a
         IOLa9zEFzgUzOD9r8TGW74CTY7ZA8AgCSqqekbmEJfW83SNkNrrCJ4X/YxUXl2XA5Wnn
         y8Z0xykXogpU/Q2926mS50MBFA+BxEWaXpnmNxH9NrQj/vjCYub11QSpzmPnJ9d8o1Nk
         +u1JEbkkuWjbE6+/CRV8V7bCexSacSIPEsr0IcW1wjOq9TOx6Y+3j1cZ2T5W/bxkodTr
         Qe+A==
X-Forwarded-Encrypted: i=1; AFNElJ8ZHRg8LSGa8KP+E10dyrVxo4VPISNLPkCv6cn/HZFv6jtLS0wpMkSLM4I1eTsqTZKX065lPBs7UzB8TNnG6mgr@lists.infradead.org
X-Gm-Message-State: AOJu0Yzh7Ri5ifDHrjP5WBPffdD4MPBpuQfom4Ge6pfrY6im00WiY4GN
	A/XTXjhn22RzSMBJDPlJW2fsgT3V0+MenvS5SjMhFX5nPOFllS1fmPQp
X-Gm-Gg: Acq92OE1Lqbq4qu7jYdRBeyKjtF6vT8xUSHNPSiRMnJz7yP5HS+j+IhIyQ/b04DGkmg
	ENeh2IDg8/vysI/9sNTmlCuPFtFO4lwVPOzI+sjn0ITqzuluTaKvSFtF/Iqau+vmsrwIdVB7OfL
	JtMwNiJRwdhY30cLUJ+4FAGbzg5SAv0gBQWc2uxiULkPjX4I18Frg0tTkInsaUQBxe30gpwnKjt
	w3pJ0Bdwjs9D3/BAGqU/DOBkJY5h0c82sIvH6mE6+YPBr9SS8wwobW5ntsWd+5/Eti3U2NXlD5k
	n6nxAbRAXepmUzzOZlrq6jJjMcZgJtIBEPgywTVM1u8C7Y3vjpF8pshcKn2OivqG7qWSXpd8VfV
	d2NK/3LwHRLRdeL4sfX1Szw0+JpUu2Im33ECjcWckoShQc7wBPJ0SvLiKGhKVqhCUDUE8HvqTZv
	4BVLXQZDXN6HVDml6LJoWlHr28NZDxIS8T82CuwhS0BYSciTwsFCtK9Z2E6wou
X-Received: by 2002:a05:6000:a91:b0:460:1755:160e with SMTP id ffacd0b85a97d-46030757dd4mr3877576f8f.33.1780659484157;
        Fri, 05 Jun 2026 04:38:04 -0700 (PDT)
Received: from SMW024614.wbi.nxp.com ([128.77.115.158])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-46028a6dcbdsm15262439f8f.7.2026.06.05.04.38.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Jun 2026 04:38:03 -0700 (PDT)
From: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Peng Fan <peng.fan@nxp.com>,
	Fabio Estevam <festevam@gmail.com>,
	Daniel Baluta <daniel.baluta@oss.nxp.com>,
	Francesco Dolcini <francesco@dolcini.it>
Cc: linux-remoteproc@vger.kernel.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 3/4] arm64: dts: freescale: imx95-15x15-frdm: remove some rmem regions
Date: Fri,  5 Jun 2026 04:36:20 -0700
Message-ID: <20260605113621.1479-4-laurentiumihalcea111@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260605113621.1479-1-laurentiumihalcea111@gmail.com>
References: <20260605113621.1479-1-laurentiumihalcea111@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260605_043806_326271_86435FA2 
X-CRM114-Status: GOOD (  10.06  )
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

From: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>

Remove some of the remoteproc reserved memory regions, which are currently
not being used for anything. These will be added in the DT overlay
enabling remoteproc support for this board.

Signed-off-by: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
---
 .../boot/dts/freescale/imx95-15x15-frdm.dts   | 21 -------------------
 1 file changed, 21 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx95-15x15-frdm.dts b/arch/arm64/boot/dts/freescale/imx95-15x15-frdm.dts
index 0f43e3be7058..f9b0e266754d 100644
--- a/arch/arm64/boot/dts/freescale/imx95-15x15-frdm.dts
+++ b/arch/arm64/boot/dts/freescale/imx95-15x15-frdm.dts
@@ -188,16 +188,6 @@ linux_cma: linux,cma {
 			linux,cma-default;
 		};
 
-		vdev0vring0: memory@88000000 {
-			reg = <0 0x88000000 0 0x8000>;
-			no-map;
-		};
-
-		vdev0vring1: memory@88008000 {
-			reg = <0 0x88008000 0 0x8000>;
-			no-map;
-		};
-
 		vdev1vring0: memory@88010000 {
 			reg = <0 0x88010000 0 0x8000>;
 			no-map;
@@ -208,17 +198,6 @@ vdev1vring1: memory@88018000 {
 			no-map;
 		};
 
-		vdevbuffer: memory@88020000 {
-			compatible = "shared-dma-pool";
-			reg = <0 0x88020000 0 0x100000>;
-			no-map;
-		};
-
-		rsc_table: memory@88220000 {
-			reg = <0 0x88220000 0 0x1000>;
-			no-map;
-		};
-
 		vpu_boot: memory@a0000000 {
 			reg = <0 0xa0000000 0 0x100000>;
 			no-map;
-- 
2.43.0


