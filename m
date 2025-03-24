Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F2F8C36002
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 24 Mar 2025 13:00:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mjmaPyBHSXf8PuBe3jKy6bt1Qi4MPOA66CdtkxcGuKQ=; b=sTFRI6Uy+AmHHbIAI8CjOKqmOk
	lkQ1M5h5QZwMr0CoBkoxaTzAthPsu+th6CvNd7EJZdabswS1e+2NjHZMA6Zx5dQ/bAW3AaICYL+gL
	FyKVf6LNUsvUK2sSyHggsdM4U+CmX5aDr/f61MCgdq2AHlSNkERiNGADqRMkiCzavvfk783eA1lTm
	bdDuVx/GXqcDtpJLqPkEkHi/2zPws2rjAN35A7tJLcRreu7sdKHwtnYL/GpYOEl7x5rDJt8ZpiIVk
	ymSJtNqcNOaBh3ydIDik7gI/Dsp6tZKAC6pRrazbE0xg+sYsCLxDcfvRXlEQCy1lzebos93cWWFqo
	LfQaKNxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1twhPN-00000003AEC-1ydX;
	Mon, 24 Mar 2025 13:00:01 +0000
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1twhHm-000000035vv-3izN
	for linux-arm-kernel@lists.infradead.org;
	Mon, 24 Mar 2025 12:52:12 +0000
Received: by mail-wr1-x42b.google.com with SMTP id ffacd0b85a97d-3912622c9c0so486983f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 24 Mar 2025 05:52:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742820729; x=1743425529; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mjmaPyBHSXf8PuBe3jKy6bt1Qi4MPOA66CdtkxcGuKQ=;
        b=LeOUPJvRovFRuh3ghnGGV3dIpmYEbwIsNiKOSjSSVbXXVEEgBrqXYPsloA6eDvlQ7k
         zIkBYRBEFSxaT08xzQsXtK8TIqDwCWgAQWouMPxVZ+d1eZwg2WjEeIq3VY2gTg36fE7F
         3Q7C+6Kc6w8gmBFEFZ4Wrqce4wORm6VMpozaxS11dX03mvV6sjmHfERCmSM7pUyPkgnm
         1aAzfV6Dfr5vpf9caI/nMa2O7gcr5ZHNDpIDOuMVFKYBEHVp4c2PunbLp7pdcMacH4z5
         Db4zBdtDgGeUZgnNfPwChU4XoHtgWZs4s6vv4g0H6Rmss9CG5DsuRptCmeIN9RWUxeMc
         BOjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742820729; x=1743425529;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mjmaPyBHSXf8PuBe3jKy6bt1Qi4MPOA66CdtkxcGuKQ=;
        b=fr/QrX/p6Qk+A2EorJlzmyX9U96x/1qDSpFwtGHsqdTkHBQjCPVCEyLcOB/d6m8mq2
         9NNslgPrs5Gk88413m5RqLLNxYEFcogoro/4sIgrq+h+Sect8OXBhQaorDtEzFyoD4yU
         OHOCB6C31ebD3FinIXxD4tPGQLrOJU9/m3YeKOAbLZWeB/rAN5rLTQB8asy3qo5xw3cE
         hBjRzfAXpVLP65rJodDDo6kaJhzveGq1HwnhD58GZXS9J1Om4MqLj8hkgCGb//9YuVLr
         JBV9mhnX27906PfaOJWf6sn5OcbXzIWjpJDFBR4wk0oEHXOmWwsuS4wW5XxkgrS27CW9
         ecgg==
X-Forwarded-Encrypted: i=1; AJvYcCW+tjCMRKXztZGiVo92YjLgBXgqfhtEFBXY8BzAsNRMsMnWimPobd79z1NMe15K9sXW/P55gZHxtVrUGbKSvWLF@lists.infradead.org
X-Gm-Message-State: AOJu0YyNhYDgVj9r6y4SQ4bfSiENrPN3LqX2cKYz8aMzmhVgqGcXI32/
	OpH0ifPglrGUoUKdhrD9Pdvr+KRKqG6SgRkEVlCIplRmch2HjwgXN3q9vihU12M=
X-Gm-Gg: ASbGncs/Cj5TORznqM1XbSLYN2nZV10C9FnlikjSVckf4Vi1RTdi7KaP5773KtOvmCm
	D6WmYdfIdeGmq/5va4QzachxGkvPYJehnqaQKaujkOcSiXltNbkrnwAnm7ciazEx9vAhmXJ/mFL
	pSXFVcBIB+jlTesfKCBrMo6IEGQ2rgMe2+uewz/UQJraZVR7K7oniai4dlpLxnRlIMdxVIlh34J
	gL4bN3mi+F0UTVlsrhX8lQOObxRfBZyRLy7kKVLGnIofjMAuS78S4qaA3Q3NWf61+Wfi/ajjJab
	mvlFQ3x3S7hHujoiOmb/vfl3ukyM9HqMOSxU0fq+VGI0zjcIkos/TDg+BQ==
X-Google-Smtp-Source: AGHT+IEqvip+CcbtHMcAP3ZwBIgJtEmf4kkkBavjhgyRCafFGFSCWjHrpx6YQVQWOVUsbGUmdeCJag==
X-Received: by 2002:a05:6000:2c8:b0:391:320d:95de with SMTP id ffacd0b85a97d-3997f8fd165mr4483091f8f.4.1742820729282;
        Mon, 24 Mar 2025 05:52:09 -0700 (PDT)
Received: from krzk-bin.. ([178.197.198.86])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43d4fd2704bsm118704565e9.18.2025.03.24.05.52.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Mar 2025 05:52:08 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Florian Fainelli <florian.fainelli@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Jim Quinlan <jim2101024@gmail.com>,
	Nicolas Saenz Julienne <nsaenz@kernel.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	=?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kw@linux.com>,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Srikanth Thokala <srikanth.thokala@intel.com>,
	Daire McNamara <daire.mcnamara@microchip.com>,
	Marek Vasut <marek.vasut+renesas@gmail.com>,
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Greentime Hu <greentime.hu@sifive.com>,
	Samuel Holland <samuel.holland@sifive.com>,
	Bharat Kumar Gogada <bharat.kumar.gogada@amd.com>,
	Michal Simek <michal.simek@amd.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Tom Joseph <tjoseph@cadence.com>,
	Ahmad Zainie <wan.ahmad.zainie.wan.mohamad@intel.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-pci@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-riscv@lists.infradead.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 2/2] dt-bindings: PCI: sifive,fu740-pcie: Fix include placement in DTS example
Date: Mon, 24 Mar 2025 13:52:02 +0100
Message-ID: <20250324125202.81986-2-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250324125202.81986-1-krzysztof.kozlowski@linaro.org>
References: <20250324125202.81986-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250324_055210_927725_953F0870 
X-CRM114-Status: GOOD (  12.11  )
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

Coding style and common logic dictates that headers should not be
included in device nodes.  No functional impact.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 Documentation/devicetree/bindings/pci/sifive,fu740-pcie.yaml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/pci/sifive,fu740-pcie.yaml b/Documentation/devicetree/bindings/pci/sifive,fu740-pcie.yaml
index 844fc7142302..d35ff807936b 100644
--- a/Documentation/devicetree/bindings/pci/sifive,fu740-pcie.yaml
+++ b/Documentation/devicetree/bindings/pci/sifive,fu740-pcie.yaml
@@ -81,10 +81,10 @@ unevaluatedProperties: false
 
 examples:
   - |
+    #include <dt-bindings/clock/sifive-fu740-prci.h>
     bus {
         #address-cells = <2>;
         #size-cells = <2>;
-        #include <dt-bindings/clock/sifive-fu740-prci.h>
 
         pcie@e00000000 {
             compatible = "sifive,fu740-pcie";
-- 
2.43.0


