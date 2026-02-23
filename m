Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC0D3EA4FA0
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Feb 2026 11:17:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=w2fDgtw5Km3aQZsh4vi4EMsTjWhe4lzXuaMoNrX1ecI=; b=UmJHHnBA2kGIU8
	eKTPVwkZrq4TOUSGMYI7IqvGbqXyjWIiCfNZFY2notFiDz6EOBLeMdwhZEQowFuisIgG483mRKCSZ
	ThwaU2LmMMAFGoAlJFiTDKNJefydcp23hNMTyTEnpoTbSgHVyv9YJm7MRSo6c7rK9HhaFeHQYHQmk
	2DoyQJFPbhbnkTbX+UKu1f5f/9f+rJlXt0EF3Dh4dDW/dU1bk/RsJNHnty0PzKjd28IOE7gYWE8aV
	2Kx4vh5CPX8aHR8JjCxQTY+cxSNVF7VYBSSLOx8T+im4/jnGVnxa003IABWHDwBIa5vtQWQ16zjsE
	jYvz4P/SA0u3UGxuYgqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuTwb-0000000093v-4Aji;
	Mon, 23 Feb 2026 11:17:41 +0000
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuTwa-0000000092r-0IiG
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Feb 2026 11:17:41 +0000
Received: by mail-pl1-x632.google.com with SMTP id d9443c01a7336-2ab47d8b33cso23304755ad.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Feb 2026 03:17:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771845459; x=1772450259; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=w2fDgtw5Km3aQZsh4vi4EMsTjWhe4lzXuaMoNrX1ecI=;
        b=XCvlExVQHzb4wVAotNCSbIrPDtjWTOa+mmBOXzVDDA2fi5ou3tkpGLEUMynP99XWu7
         B6ocisFMFYIIDNN/O13TZM8P4GoG+vgUzGLmljNyUJRdCUlvr7/CBOj3PcCPtCNMnccQ
         PBElxrcx139AUtAlaclwoinwDd2mIdkXmcmKn0A54W1CE1Ho/OiQE/dQ+ce2r6u8WpTZ
         /xhzsQ+6eh/Hjz1rXdKG7F7LlbUrqz9ymXF2nYFEfy6MnGLVwgdfXCPk3iAmksiUAh0B
         cPXDVs4Bc/VAUFlYDkbPuliEMqMTgl7AU+JafzwXAU4yeO5lYc4iI2GOiGsFBrPBi8+Z
         CWvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771845459; x=1772450259;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=w2fDgtw5Km3aQZsh4vi4EMsTjWhe4lzXuaMoNrX1ecI=;
        b=ZUmfxVPCnUPQlcnbyBhN+ALijbXT5xA3xdWXjcNi+rjWWTLHqLHg036e1WLRb9BUcS
         hNmHAdn7mVekKzCJht/6HaLCewLaZQOamdZSlzid7Am3oTB4eUoWVGxat7dB/O7aEWVQ
         2zqqQ03b/Ezyk2XZrJ8isKg0BPUytSalvxyFauVRu6xAacSe+5jzvbZzM3LKWR2pKC8I
         bv8o/78yqbWziikX59nIai2TqGf87q2cEN2EcqSMbabp6eqp77GxRd8T1u8OyAO3BmPZ
         YzZlAUXSZ6en4N0oaBD6MwaVcuhdOCzNKkOlWuyEREr54yZK1C2MdlH11kLNluy+Xa2Z
         GO6w==
X-Forwarded-Encrypted: i=1; AJvYcCWa1MxojXHbBgKolAddrvnVBD3oZzKQ9W6UzSlQ/Jy4fRBiegOHv1kBf+bK0HhQBuoFfBKHJFubJxL8zNChvlBi@lists.infradead.org
X-Gm-Message-State: AOJu0YyYzCutOJJNkZzDEbMT/in3mwi9Qup/8FfXS99CWSm7Nr2xZvex
	ygjmZPC8VOhaFouqebrFLxU3MpRfg4U6MXZ3d8wUbxc7u1wsVzRnF7kY
X-Gm-Gg: ATEYQzyFL1KgRVqMBgXDQJtD7rwxVzNRIttaUkQk5alq8y7pD2yKdWdgXeGtRIKwrLo
	fOWSbFQ5FkVu1c7jIjep9MQWzCo/Mw/Rj44BIzxXkMWyXHaCwemkkwSudp4ANnjQLkF/SVmlmsb
	de0oighRS1SanLH58vT4TM9cxrB/FTggDn3W7FvBmvFMx4saz6hnHTmotfKCU2FOBn+IkMALYeC
	IxvmnTcy5q5GghWoHGqkw9qRUiMw1YjEbH4Hv7H/LF2Ot9R7hwyzAPou0FwM/nkftg6Y/23YwEm
	bx5q8YTJXcJ6jRr0pcBPIhtMVRv2/wroBJNLG3gba9fv8YQuB53BDHEs+/QB+NZKnRW7FAS1gv5
	GzweXU+hFi8TmhJ6W5bGvdpqV+So6t1Ez2SVVuOCLrE8EZ8hiWTrt1XdIWx4S/xTQdDGxQYny29
	CGsiEEoK7n+hHw3RVrTWtnTzNtJGnB29LLYQOur5uDoBi/ew6dLnt3DJWgj+1CLksO1o7upHO+x
	xMdvlnzvSPwdxzQVwCrKm8Qa6I7a5rUqn9byT6yfPUfs2yTa1P6364XsV6qGV/iN02tSHQlm2RG
	AEAC5gJ4Q/vpvZtAwSQ8
X-Received: by 2002:a17:902:da87:b0:2a7:b039:4b52 with SMTP id d9443c01a7336-2ad744556admr77368315ad.1.1771845459054;
        Mon, 23 Feb 2026 03:17:39 -0800 (PST)
Received: from 2001-b400-e3a6-b683-040b-c296-04cb-fbc3.emome-ip6.hinet.net (2001-b400-e3a6-b683-040b-c296-04cb-fbc3.emome-ip6.hinet.net. [2001:b400:e3a6:b683:40b:c296:4cb:fbc3])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ad74d36911sm71799335ad.0.2026.02.23.03.17.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Feb 2026 03:17:38 -0800 (PST)
From: Kevin Tung <kevin.tung.openbmc@gmail.com>
Subject: [PATCH v5 0/8] Revise Meta Yosemite5 devicetree
Date: Mon, 23 Feb 2026 19:17:32 +0800
Message-Id: <20260223-yv5_revise_dts-v5-0-fc913e902488@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAEw3nGkC/3XOTQrCMBAF4KtI1kYyk6S1rryHiMTMVANqpZFgK
 b27sSD+FCGbl8n3Jr2I3AaOYjXrRcspxNBccrDzmfBHdzmwDJSzQIUWAJayS3Y3PuQd3aIEZFB
 MVFkqREbXlutwHws325yPId6athv7Ezxv/1YlkErWnoq9MflU5fpwduG08M1ZPKsSfnBUE46ZG
 yqJSwXe7vmX6zdHqCZcZ+4dkHV6iQr0LzcvXuThdLsZt1dojLW1dl+fH4bhAQq6EKZpAQAA
X-Change-ID: 20251118-yv5_revise_dts-12e10edd95d6
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, 
 Andrew Jeffery <andrew@codeconstruct.com.au>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org, 
 Amithash Prasasd <amithash@meta.com>, Kevin Tung <Kevin.Tung@quantatw.com>, 
 Ken Chen <Ken.Chen@quantatw.com>, Leo Yang <Leo-Yang@quantatw.com>, 
 Jackson Liu <Jackson.Liu@quantatw.com>, 
 Daniel Hsu <Daniel-Hsu@quantatw.com>, 
 Kevin Tung <kevin.tung.openbmc@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1771845456; l=2248;
 i=kevin.tung.openbmc@gmail.com; s=20250924; h=from:subject:message-id;
 bh=sn95Kmv45LT872ri2FvDg858dufHQIsNYNwjQItqP04=;
 b=v9ocOnlabQ3l+MXROW2xlibhQ+Stuu0mjZuPPNQc9/VkoFtSyBlue6Pb43vEUHQ+dYfMB/lq1
 Z6Ft01u9RMmAL4e3UaGUEgyI6T1earuY4MuQ3GCfeuhDnkhYI3JT6xr
X-Developer-Key: i=kevin.tung.openbmc@gmail.com; a=ed25519;
 pk=PjAss0agA0hiuLfIBlA9j/qBmJaPCDP+jmQIUB6SE7g=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260223_031740_135319_205280E6 
X-CRM114-Status: UNSURE (   8.42  )
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

Summary:
Revise linux device tree entry related to Meta (Facebook) Yosemite5.

Changes in v5:
- Fix host0-ready and add POST end GPIO
- Expand PDB and HSC abbreviations in commit messages
- Use IPMB consistently in subject and description
- Rewrite "Correct power monitor shunt resistor commit" in imperative mood
- Link to v4: https://lore.kernel.org/r/20260130-yv5_revise_dts-v4-0-4d924455f3a7@gmail.com

Changes in v4:
- Add PDB IO expander device node
- Add GPIO to bypass OCP debug card commands
- Expand commit message explaining the shunt resistor correction
- Link to v3: https://lore.kernel.org/r/20251219-yv5_revise_dts-v3-0-ca1d5a382013@gmail.com

Changes in v3:
- Correct power monitor shunt resistor
- Revert the previous SGPIO P0_I3C_APML_ALERT_L renaming change
- Add new SGPIO line names and rename signal
- Retitle Update sensor configuration for more clarity
- Link to v2: https://lore.kernel.org/r/20251120-yv5_revise_dts-v2-0-4d7de701c5be@gmail.com

Changes in v2:
- Add ipmb node for OCP debug card
- Link to v1: https://lore.kernel.org/r/20251118-yv5_revise_dts-v1-0-fcd6b44b4497@gmail.com

Changes in v1:
- Increase i2c4/i2c12 bus speed to 400 kHz
- Update sensor configuration
- Rename sgpio P0_I3C_APML_ALERT_L

Signed-off-by: Kevin Tung <kevin.tung.openbmc@gmail.com>
---
Kevin Tung (8):
      ARM: dts: aspeed: yosemite5: Increase i2c4/i2c12 bus speed to 400 kHz
      ARM: dts: aspeed: yosemite5: Remove ambiguous power monitor DTS nodes
      ARM: dts: aspeed: yosemite5: Add new SGPIO line names and rename signal
      ARM: dts: aspeed: yosemite5: Add IPMB node for OCP debug card
      ARM: dts: aspeed: yosemite5: Correct power monitor shunt resistor
      ARM: dts: aspeed: yosemite5: Add power distribution board IO expanders
      ARM: dts: aspeed: yosemite5: Add debug card bypass GPIO
      ARM: dts: aspeed: yosemite5: Fix host0-ready and add POST end GPIO

 .../dts/aspeed/aspeed-bmc-facebook-yosemite5.dts   | 117 +++++++++++++++------
 1 file changed, 87 insertions(+), 30 deletions(-)
---
base-commit: 5d1d2ebbfe226540c630e9998374e16dad2779e4
change-id: 20251118-yv5_revise_dts-12e10edd95d6

Best regards,
-- 
Kevin Tung <kevin.tung.openbmc@gmail.com>


