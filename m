Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8EF9C624D3
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  2 Sep 2026 13:08:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=8CCYbVer4UrDr5i1p//z3lDPoKdyao2pFzFH41cydj4=; b=cQ4F2TG3xg/UPc
	bCbwi4dcWjU+A+gPMhLjS4Xp+gnLnm3s21leZ39DfnZ37s3G7C4v86slVWxgTiloMPBjVa9BFohS2
	9tl/EA2dYRqcRMR/ZgL8BxL2smRJVEvBZKLRIDmH4kgI7cTyZSWSDOnfZEapg41sn33AM484tVpN2
	+c+xc9CMIxx5R5bhJGy1IA611G3KgPpU0nSVk4+HL4opaDzOx7K5aU+ljMHtu+4CMENbZjYN6dluB
	Xg3H6MajC/BO13GSc+RUQR/rUfbb0y0aWw9A5zrlc2Ja10/kCVxeRvWI6IebAmeLuF4Lzsc0hLWBP
	0/WkpLODMg79Vi0daKBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1khF-0000000El3E-1NdN;
	Wed, 02 Sep 2026 13:08:09 +0000
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1khC-0000000El2H-1RXh
	for linux-arm-kernel@lists.infradead.org;
	Wed, 02 Sep 2026 13:08:07 +0000
Received: by mail-wr1-x42b.google.com with SMTP id ffacd0b85a97d-48444eff835so265028f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 02 Sep 2026 06:08:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=flipper.net; s=google; t=1788354484; x=1788959284; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=8CCYbVer4UrDr5i1p//z3lDPoKdyao2pFzFH41cydj4=;
        b=Vn1NXywQAT60d5qISNLWjPr73QX3LkklvBp0h4ouorPu/9Lou2EzSDAxQ81magyaNE
         84RtTRNvNXVoRhFdQ07AEzk+8qRgCuFLwkL9vRTceaEPAHBYhyUDvv26e+BV2bvviZO1
         KYeGc35ux+0z86V9uAi0FQlXGyJk8OaO1jo621NHOlqjpT5FOT4iNB0PsKt/9c1uOs/7
         mA/pbM6YSXqfPrqrmR/LtZSzBbMHnIx5Pv9eTcj1Sw4adQ+LO+uGrkVAmL4sMr46s6kG
         KJHhq9cTZeUfenKofJkxuw2FVuRrIb5V9mwk40zJhh9MBnE3kXdb0nU+fC+KVyoBFieU
         skAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788354484; x=1788959284;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=8CCYbVer4UrDr5i1p//z3lDPoKdyao2pFzFH41cydj4=;
        b=DQFtzvNiDja9xaIxE8QTt8OTXVxC1esmZ9zD9EQsE+2LJE9KihHLe3Y+1PyjV5Dvmi
         /7HK6YnmNYtqLSg29wqPoufhEU25PGbRrORK0z7cx3HkFGOVfDMChfk+LMWcbljK1hNx
         FUhCi1KhrV4OChvkn1n1KgV7vhcL8fTTyB6IHQl41Ly0taXGJ1SlSeUehCJ/LXcI+dRM
         fuG5R3anNwtZRPLRHYLKlwOYppXy2ybv6waBIw0KuPhv7aOBJlSztFHf3iwOdOeFbf5s
         QkCl477f89Au02DyUpEofQY3AkFioN1HiZd20pqZx06NsYb4TqyhgpZ2MjIR47FehKK0
         Nq3Q==
X-Forwarded-Encrypted: i=1; AKwUvBxxhN57zhPlSQGNsSFTmK6V9fBECcNRbzUwZHcVD3Jimhqsol3AvqMAr8wLiJ3KHKozXJoGNA2GqmkdtJ8L0lGK@lists.infradead.org
X-Gm-Message-State: AFuF++lmKFYLOpS4nfAZb9CxEn7la1MrZbHNVpPrKKf32HVx4EvBp3Ki
	Kd3r1S4MF+dtXeXtxlba2eIZC8jE1n21l9O0SQoSa0/dkeZI0rYRaD6ZRbsRJ+ssBQo=
X-Gm-Gg: AYBFou3IyX7CRxzudSYCLv7qFj5uXCQb4iGXQ7EJ4TLpgATlN4M6TycM6D8h+8YBteQ
	PhCUmFbLgTne5dRJUMkCnVI4lm0vmyZgCwSP9hGVlzSRHOfFQOVPINVyAPXwjqg5+sdfK5GXRTj
	Is3S4lIvGbUvpDF8X1EiiWguICn7M9hYOMcxOQB+IFhBwTx8bJnPteP0ahUX+XJ1W4iOh1pxQ5G
	xsi847JUI+XnU19yiNKoBiclmA5ax9+IQfpTI2iS1ItLQfXEVjl6TDcFWexTZVelruYneQDyTfs
	gNLofhtAqf6eGP4MWTL6/rMe93h7si1pktwqkqRTkXonlLnKFhwPZ/c/rc7cSQh66WKjjwS/oZL
	LCCNMJVZcCGSudtAhNO8xPwY1o27QCyK9PcJpgvAJ3o4BJXjIy/bS9ieyjYq0Y0wEi258x72aSy
	GieOWUFSNsKDbgT86rnkJE2VJ5Q3RRew76FonkNFKCsLhGtCgRV0kioIVH6wcOST9ovqhkpcPRj
	iKaNPI9TZqfxjW67idDhWwRnxwq+OmlLJY1DOvqLg==
X-Received: by 2002:a5d:5f88:0:b0:484:3728:1369 with SMTP id ffacd0b85a97d-48488efe756mr8590701f8f.6.1788354484288;
        Wed, 02 Sep 2026 06:08:04 -0700 (PDT)
Received: from alchark-surface.localdomain (bba-2-51-220-108.alshamil.net.ae. [2.51.220.108])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48448e72b5bsm6385800f8f.4.2026.09.02.06.07.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 06:08:02 -0700 (PDT)
From: Alexey Charkov <alchark@flipper.net>
Subject: [PATCH v2 0/4] nvmem: Derive Rockchip MAC addresses from the OTP
 CPU ID
Date: Wed, 02 Sep 2026 17:07:51 +0400
Message-Id: <20260902-rk3576-otp-cpuid-mac-v2-0-e4b7fe2ab13f@flipper.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/4WNSQ6CQBBFr0JqbZkeGF15D8MCm0LKoel0N0RDu
 LuAB3D5kvffnyGQZwpwSmbwNHHgwa6gDgmYvrE3Qm5XBiVULioh0T90VuQ4RIfGjdziqzGoTSV
 UqltRlimsU+ep4/eevdQ/DuP1TiZurc3oOcTBf/bfSW7en4tJokBqKqkzVYjOqHP3ZOfIHy1Fq
 Jdl+QKT/cYNzAAAAA==
X-Change-ID: 20260901-rk3576-otp-cpuid-mac-3c90243d0884
To: Srinivas Kandagatla <srini@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 Michael Walle <michael@walle.cc>, Miquel Raynal <miquel.raynal@bootlin.com>, 
 Finley Xiao <finley.xiao@rock-chips.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 Alexey Charkov <alchark@flipper.net>, stable@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3327; i=alchark@flipper.net;
 h=from:subject:message-id; bh=0hKapFxMequ4DFaz8IR0nd0cULM83AQBEbTt3mZlvzc=;
 b=owGbwMvMwCW2adGNfoHIK0sZT6slMWTNkN9ksZpPpmbdppJLOz+c4jmdszvBs+tw3vmTiV17O
 P/MqBQP6pjIwiDGxWAppsgy99sS26lGfLN2eXh8hZnDygQyRFqkgQEIWBj4chPzSo10jPRMtQ31
 DI10jHWMGLg4BWCqs5Yz/OFfdfprubXAJqfcozGLZzpss3aRY1SYacewUL/xd+5t7UMM/xQmNE1
 stVm8VtpLJ7LV8ZzeogtcjE6bV4XNOl9bVFLXzw8A
X-Developer-Key: i=alchark@flipper.net; a=openpgp;
 fpr=9DF6A43D95320E9ABA4848F5B2A2D88F1059D4A5
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260902_060806_415695_C8491845 
X-CRM114-Status: GOOD (  21.83  )
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

Rockchip SoCs are shipped with a unique CPU ID in their internal OTP
memory, and Rockchip bootloaders use it to give boards which have no
dedicated storage for a MAC address a stable one anyway: they hash the CPU
ID and patch the resulting addresses into the device tree they hand over.

Kernels started without that fixup, e.g. straight from the SPL in Falcon
mode or by any other loader which does not implement Rockchip's derivation,
fall back to random MAC addresses which change on every boot.

Formalize the derivation in the DT binding and add a Linux kernel driver
implementing it, so that a Linux image can use the same stable addresses
regardless of the boot flow.

Only RK3576 is wired up here, that being the SoC I can test on. Other
Rockchip SoCs keep the same CPU ID at a different OTP offset - 0x7 rather
than 0xa on RK3588, for instance - which makes supporting them a two-line
addition to the driver's match table plus the layout node.

Patch 1 is a prerequisite fix. The OTP hardware has its own internal state
machine which only works correctly with serial access, but the current
driver serializes nothing, which results in timeouts and/or corrupted
reads (e.g. returning splicing a TSADC trim value into the buffer of a
caller asking for the CPU ID, or mixing up trim values of different TSADC
callers). Hence the Fixes: tag and Cc: stable.

Cross-checked on an RK3576 board: the addresses fixed up into the FDT by
U-Boot match the ones derived by the new driver, and the driver correctly
assigns them to the network interfaces when the kernel is booted without
U-Boot proper at all (via Falcon mode).

Sashiko also rightly pointed out a use-after-free in the nvmem core when
a layout driver is unloaded leaving its sysfs nodes and the postprocessor
function pointer dangling. This is fixed separately in [1].

[1] https://lore.kernel.org/all/20260902-nvmem-layout-unreg-v1-1-2d16bebeb518@flipper.net/

Signed-off-by: Alexey Charkov <alchark@flipper.net>
---
Changes in v2:
- Switched from a scope-based guard to explicit lock/unlock calls in the
  OTP driver to avoid mixing styles in a function using goto error
  handling (Sashiko)
- Link to v1: https://patch.msgid.link/20260901-rk3576-otp-cpuid-mac-v1-0-ea9135270fc2@flipper.net

---
Alexey Charkov (4):
      nvmem: rockchip-otp: Serialize reads
      dt-bindings: nvmem: layouts: Add Rockchip OTP CPUID layout
      nvmem: layouts: Add Rockchip OTP CPUID layout driver
      arm64: dts: rockchip: Derive GMAC MAC addresses from OTP on RK3576

 .../bindings/nvmem/layouts/nvmem-layout.yaml       |   1 +
 .../nvmem/layouts/rockchip,rk3576-otp-cpuid.yaml   |  73 +++++++++++++
 MAINTAINERS                                        |   7 ++
 arch/arm64/boot/dts/rockchip/rk3576.dtsi           |  12 +++
 drivers/nvmem/layouts/Kconfig                      |  13 +++
 drivers/nvmem/layouts/Makefile                     |   1 +
 drivers/nvmem/layouts/rockchip-otp-cpuid.c         | 119 +++++++++++++++++++++
 drivers/nvmem/rockchip-otp.c                       |  15 ++-
 8 files changed, 240 insertions(+), 1 deletion(-)
---
base-commit: 8b72f6626dc39b9e7e82b2721d4f7c3b86286012
change-id: 20260901-rk3576-otp-cpuid-mac-3c90243d0884

Best regards,
--  
Alexey Charkov <alchark@flipper.net>


