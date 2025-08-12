Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB432C87FCB
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 12 Aug 2025 12:39:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=l0CFpq1HCuyeYFLbDR8k9bWBZ4oNvj1i296rXTBH/70=; b=SmHrjw498fAXgvDTMjk5COsc0a
	6rXoCYqpoCa6HNnf/S1BlSI/X8F530qqpwDxoLjOVM0oF9OqUJAl38mPrFgrEBISLrFHcJqsyVSzX
	kp3rCwzzbZOSwG5DXZKHgkP/zR0YjkTDXwgawBMzP+Q3pAYTgP9YS2V7s8fy8TBJZlKBqxqB6gpBy
	jO9SiDExztOX15mMFd9TzAdRLguOtwdP0sahW3CWs64IOPgciewU3Q4nb8/QuF0TIcSKqQdL6obkQ
	dMUMQbHu4klk9R9nWsWeYaQ9ZmQfb4EFfyZ2Dnk86EcFsDalhW8w6C3nfYf/MxqGWmALOE6rrFM8V
	ifBqdo6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uloHV-0000000AlRL-2uYL;
	Tue, 12 Aug 2025 12:39:09 +0000
Received: from mail-ed1-x543.google.com ([2a00:1450:4864:20::543])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulkgd-0000000AI9r-2gBu
	for linux-arm-kernel@lists.infradead.org;
	Tue, 12 Aug 2025 08:48:53 +0000
Received: by mail-ed1-x543.google.com with SMTP id 4fb4d7f45d1cf-61568fbed16so8154991a12.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 12 Aug 2025 01:48:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1754988530; x=1755593330; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=l0CFpq1HCuyeYFLbDR8k9bWBZ4oNvj1i296rXTBH/70=;
        b=Fvaw1Y/BPkITzkJi/Wm7ap9fgj0s++Mek6n8A//ZLL2qzUQKBz35NoBfvbp9Vd95CP
         6owqwTPCj4BzWomLVO7j3QRygQj3+T4nBZUozPPBy+fV1Q2dn4XHTl14dHlUs5pZhyxf
         4jzaJUx0rRs2q0dB6JYfCWdUxm6xaHaA/FQtD044CfK51dYqu9+z3ztivVx+6yKImOS2
         Y/18XI85FsCsMlg2mPwTSMtmGCGIGj/11BJIFuz726VDfzTwPrw3UyBbOKrph2uucsqB
         9iruZiVw1i13CNzSVtlTm+rynWgJHruy4CB3JAoGBp/Kq/j5VRYz2qfiuRj6MuIpAQaS
         YK6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754988530; x=1755593330;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=l0CFpq1HCuyeYFLbDR8k9bWBZ4oNvj1i296rXTBH/70=;
        b=sqpBUPMd1SxalBYtV0k1uW0mc/FeX7drEkZzflubTC8TnISEhanKAEmc1pBU/OK/Dq
         W6lq1f3adc03NCmVflKU2hHbAGARIxbzjplD96N+Y8YwoqYV/xHv+0WCUSJ7gqYxK6yI
         OH5VGIpW3TLx+wTL+7DQr9hvgtxKae3qbb6ECiHgnqKb1/i4J/O0uXufflTY+YKhjUwp
         EGrre7JgSrDeNqUW800P2cK9q3nj056qdUyPgWQYIsEN82Cln2P4NqNGsWldEP56hGCE
         aiELwFQ/KochsXlhBQZuCJZ4W4ahLHiaPaz0A9YgHXFUJs3XnzOjyK2JRN8HUG9w3i+v
         4+EQ==
X-Forwarded-Encrypted: i=1; AJvYcCW51TrzDAT0GmdI5JWxrfLOAg8Io0XTtC75gKulLINcVqHs7+QS8RaRcStL/dvyRXcO9ByN/526poaZJrRNwFCx@lists.infradead.org
X-Gm-Message-State: AOJu0YzIChCyDsWglF2xH+6avacqz155h0631Fjgy+RAIhcxKa6FhBdZ
	TQsAN5EOqQIM2jo88qLjzXStD/22sKlEzkHuvKC+6EQSKKmXDSc+0K/PkylTG8GOgbM=
X-Gm-Gg: ASbGncuGcFg6osGnuE4FHBeUNMepR7s4G8CcWblHXCDzOjP8dICM37dcX0K9rYfPbB4
	xBh/htu4HeA0DyeYT2IdUwOuF8Mm2qiiTGLVATx0hhrO6V5JLHS+MbzI1tQmBYUTaOqZwIFEtP+
	iyDIWPdin7CaMif/hPp7RDYefUhGn0GEMW3wTrPSRLETyOl1kNpuA3KirBkWs15ORMMZpi/OY8j
	cdpL0UsdiSeW+AcT3yT8qCYVk7UrGu1WOoGPqAqVjPD6gZjmIyVaoSDPHcwsi1PNwKsJJleCT3f
	z9pFnMui3G19+mGXC5RCMEUqB3kJx2Mo8FUnSqSC0w9eyyMVi7/MUTplXvDYvSwfRMg4U0R2HXO
	f6ZgnqIXgsOcu4USV7rSFD8xhfZDt87UZeo/9Gx+JcKvPL9JOT+OF7weX5jcWZOh2Yw==
X-Google-Smtp-Source: AGHT+IHtFs8w0fVJyzS1M1cginNB7x2BJdFDZRxDj5MXgzQYeyqcq0scZCRhd7hs7865IgJzSU8QUg==
X-Received: by 2002:a05:6402:3111:b0:614:fead:3d56 with SMTP id 4fb4d7f45d1cf-617e2e8fc4amr8958140a12.32.1754988530010;
        Tue, 12 Aug 2025 01:48:50 -0700 (PDT)
Received: from localhost (host-79-44-170-80.retail.telecomitalia.it. [79.44.170.80])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-617df37d061sm7754871a12.40.2025.08.12.01.48.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Aug 2025 01:48:49 -0700 (PDT)
From: Andrea della Porta <andrea.porta@suse.com>
To: Jim Quinlan <jim2101024@gmail.com>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	kwilczynski@kernel.org,
	Manivannan Sadhasivam <mani@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-pci@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rpi-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	iivanov@suse.de,
	svarbanov@suse.de,
	mbrugger@suse.com,
	Jonathan Bell <jonathan@raspberrypi.com>,
	Phil Elwell <phil@raspberrypi.com>
Cc: Andrea della Porta <andrea.porta@suse.com>,
	kernel test robot <lkp@intel.com>
Subject: [PATCH] dt-bindings: pci: brcmstb: Add rp1-nexus node to fix DTC warning
Date: Tue, 12 Aug 2025 10:50:37 +0200
Message-ID: <20250812085037.13517-1-andrea.porta@suse.com>
X-Mailer: git-send-email 2.44.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250812_014851_676327_1EE05F59 
X-CRM114-Status: UNSURE (   9.85  )
X-CRM114-Notice: Please train this message.
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

The devicetree compiler is complaining as follows:

arch/arm64/boot/dts/broadcom/rp1-nexus.dtsi:3.11-14.3: Warning (unit_address_vs_reg): /axi/pcie@1000120000/rp1_nexus: node has a reg or ranges property, but no unit name
/home/andrea/linux-torvalds/arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b.dtb: pcie@1000120000: Unevaluated properties are not allowed ('rp1_nexus' was unexpected)

Add the optional node that fix this to the DT binding.

Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202506041952.baJDYBT4-lkp@intel.com/
Signed-off-by: Andrea della Porta <andrea.porta@suse.com>
---
 Documentation/devicetree/bindings/pci/brcm,stb-pcie.yaml | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/Documentation/devicetree/bindings/pci/brcm,stb-pcie.yaml b/Documentation/devicetree/bindings/pci/brcm,stb-pcie.yaml
index 812ef5957cfc..7d8ba920b652 100644
--- a/Documentation/devicetree/bindings/pci/brcm,stb-pcie.yaml
+++ b/Documentation/devicetree/bindings/pci/brcm,stb-pcie.yaml
@@ -126,6 +126,15 @@ required:
 allOf:
   - $ref: /schemas/pci/pci-host-bridge.yaml#
   - $ref: /schemas/interrupt-controller/msi-controller.yaml#
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: brcm,bcm2712-pcie
+    then:
+      properties:
+        rp1_nexus:
+          $ref: /schemas/misc/pci1de4,1.yaml
   - if:
       properties:
         compatible:
-- 
2.35.3


