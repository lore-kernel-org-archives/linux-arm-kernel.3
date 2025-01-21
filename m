Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 388EFC0218B
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Jan 2025 12:58:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=2tKEcOHUOoj6M1N+AbaF6ST0bT5lNvPCmN4NWW4SFdg=; b=WQw1oxkk/tw3lH3o3HVIsKHr/f
	VmvQ87WmFxAD1nXyp0Y4FkgndirweZCRJTp9oD4EWfotQFzQvHWxqN2xlmA+kkALp+yFqv+K2jdml
	kdnr3JZFCPTIef9PDXhs4GLIA/V9OaNk0y36askd+W7thv5enFzRacpGHOPYiAhMkH7fsyRm/FWkj
	TMaTJD8HTN0b5ZJy0xQVUe9vqPihSOqogbKA6EnKbvEqNGtkkGUREdnzsMZ2V+odI1RWzC2YvVfj0
	37Py6VDcxIJBmacJC2GpUfD9ijMoDSSehnu/OMN0f7dudRqBol+IoSqHUjMtSLBgs5ixtaXtY7MvN
	2mEfP3Sw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1taDpH-00000007uop-28Cc;
	Tue, 21 Jan 2025 12:57:51 +0000
Received: from mail-ej1-x631.google.com ([2a00:1450:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1taDnl-00000007ual-3MLy
	for linux-arm-kernel@lists.infradead.org;
	Tue, 21 Jan 2025 12:56:19 +0000
Received: by mail-ej1-x631.google.com with SMTP id a640c23a62f3a-ab2e308a99bso1161833566b.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 21 Jan 2025 04:56:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=thaumatec-com.20230601.gappssmtp.com; s=20230601; t=1737464175; x=1738068975; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=2tKEcOHUOoj6M1N+AbaF6ST0bT5lNvPCmN4NWW4SFdg=;
        b=2xQH13M2HpkQAvoq9Ci3BXSXgFLb4jbKtPfivBw2eLpxJeKmeYHW1PaXoQGyP26eja
         iUiu5Y+YoL4FwY+67F4i7hTjIU9aDbtUNgdiqPt6guc1ldXkhHLSEtIsdLhW+oEXOEee
         Yuf7a3JQrsMUQfe80bRYGDfcd8u9NP8oflZZX7q666mNb+aTqYzvreuH52zx+pBnFXnI
         pdv2qxkbTW5lWvZzbT2A7JtMnY7SJKNHj2GcazOJg1jU70aaVahmPperjSm43hW7nsG3
         zTvOg+gYoJMxX9XxZdi0er7rgdO+Jj212ws6H+34gztFJMM12CruU9ShFe52qr7/Qb4+
         a1qQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737464175; x=1738068975;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2tKEcOHUOoj6M1N+AbaF6ST0bT5lNvPCmN4NWW4SFdg=;
        b=Fci86ckO3oGC7iAEzVM2PKuWdWk6NptfnsZVO2L5eTifXCjdwXx7TtorWptcw4Qrs6
         OxHmcCl96Nib7A3k98geW9jmL20TjrJ586dHMydN8LD0nqmtyNREUvVuDgO4s1Ys+0EJ
         EIlcn0cfmjyK4jYJ4fEiyEWMwY9GyYedQ+341MZ/rVkZCYFTWt0aGVPn/oFCV1yVqqpR
         QPD/mb9520Zb/J8u3wL5PV/nuAY4bmLg7FaXDlg7NqQC736Q6r+UlnE6fJ/L2vmh1zEw
         rm6ssPlCQd+eVl3O9BXTJm6OKj3079h20tM/nhivz6woyKN0glUzkurEmt1sXzy0DxCa
         jK9w==
X-Gm-Message-State: AOJu0Yy7kykvXQURIyguz4z1NaiL+L+M0q2+E7nFj54FpXVKijMd3Hvl
	Ox0MH6jUnqLGgp/lCcaECAgO/uUCAT60ZFq6PGwHSI/CHLlxGTHbe+y7dNyM0lNzdd77DS+kilg
	L
X-Gm-Gg: ASbGncvI23P4ODFvbJcfU9NdHJe8G+HaCZzJZVd9BHTVr7xrymxs5j7F16doDZjTipJ
	sVkmGfJkuSML3UuVLJzbZ1ik+u4B83WYUVPZwOEMBqyS5R9reX/Pvn3Ncw7n9Mj/9ug5WZAsyEO
	+QdmNA40Es8/H4By6+dQ3RNIli1R4/xM4/G2ebdDqftV+PnAVMoh8H62sXnOIasFc4wan+sgLl3
	b289qHhIdfO+1utNTegPqCrS1dWi2UOyBnqIeHcxQA2WPlOxToi0gN5Vf+0vCu5OStPom/TOAZB
	wjc90LgEG0SH6arxkV361mJuCg==
X-Google-Smtp-Source: AGHT+IHR/cBAroTUZCaiEdxwuMtCTe0EdEvbyOMLExycVSHdkWsyOdkdL4afo+lVY6hdc2SpvD4elg==
X-Received: by 2002:a17:907:97ce:b0:ab2:f255:59f5 with SMTP id a640c23a62f3a-ab38cc9056cmr1524096566b.16.1737464175468;
        Tue, 21 Jan 2025 04:56:15 -0800 (PST)
Received: from lczechowski-Latitude-5440.. ([78.9.4.190])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab384ce0529sm740943866b.43.2025.01.21.04.56.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jan 2025 04:56:14 -0800 (PST)
From: Lukasz Czechowski <lukasz.czechowski@thaumatec.com>
To: linux-arm-kernel@lists.infradead.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	heiko@sntech.de,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: quentin.schulz@cherry.de,
	Lukasz Czechowski <lukasz.czechowski@thaumatec.com>
Subject: [PATCH v2 0/2] Disable DMA on secondary UART on PX30 Ringneck
Date: Tue, 21 Jan 2025 13:56:02 +0100
Message-ID: <20250121125604.3115235-1-lukasz.czechowski@thaumatec.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250121_045618_042516_B728B7B2 
X-CRM114-Status: GOOD (  11.30  )
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

The PX30-uQ7 (Ringneck) SoM has two external UARTs, connected to
uart0 and uart5 controllers on the PX30 SoC. The uart5 does not
expose RTS/CTS pins on the Q7 connector, as they are used for
different purposes. It was observed that UART controllers without
hardware flow controller behave unstable if the DMA is enabled.
This patch series moves the pinctrl-0 to SoM dtsi file and uses
/delete-property/ to remove DMA from this UART controller.
----
Changes v2:
 - Update commit message of patch 1/2
 - Add Cc: stable@vger.kernel.org

Lukasz Czechowski (2):
  arm64: dts: rockchip: Move uart5 pin configuration to SoM dtsi
  arm64: dts: rockchip: Disable DMA for uart5 on px30-ringneck

 arch/arm64/boot/dts/rockchip/px30-ringneck-haikou.dts | 1 -
 arch/arm64/boot/dts/rockchip/px30-ringneck.dtsi       | 6 ++++++
 2 files changed, 6 insertions(+), 1 deletion(-)

-- 
2.43.0


