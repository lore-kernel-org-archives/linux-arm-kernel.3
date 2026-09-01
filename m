Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 822C5C624C6
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  1 Sep 2026 09:09:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=T9TiGLOlBJPaa6ACMJt76ajLLQMGHpzZnyu3DaDv9wI=; b=G9IQJORuzmQUClbKKWZnhBVmU8
	kwHcvD9a0tfbjoyfgw3Sk0MtxS+OKgF07rKQ2Jjat5GFDwumhaPzpv0FrU9UVqSM0kbJbAAv5nP1G
	eS+8l3RmE+DdajieR1X1GmRCyAcZpnC5UGYwRRrjR8i/bvTBbinmiagqrZ6zXqAhd1Ci7P64xERdy
	CZpdfD+iIGCtoJHx7qBlgJz9CvVuuCA+4HWQZzW0Y/aW+rJjWtEQ8Vvx/SFD2iS6IpG0TxdAGgfc+
	Sx2+0xw2497qUmVZlYn9wtOZi7091piBRw/IvNbARLDukB8dTcYmtYhi/yt45hcLi9+raEnl7WBsZ
	10vqLJmQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1KUs-0000000BNXN-0e9e;
	Tue, 01 Sep 2026 09:09:38 +0000
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1KUp-0000000BNVj-2evr
	for linux-arm-kernel@lists.infradead.org;
	Tue, 01 Sep 2026 09:09:36 +0000
Received: by mail-wr1-x433.google.com with SMTP id ffacd0b85a97d-48444ec4fe2so196121f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 01 Sep 2026 02:09:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1788253774; x=1788858574; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=T9TiGLOlBJPaa6ACMJt76ajLLQMGHpzZnyu3DaDv9wI=;
        b=IyYgnSYRpFHlaW+2yrCJWHZv9Tc0WHj9wozUMjn3LafShtVkBsVNnJG5myfoTfLJ7T
         X0wJtulP2cN9keRhPKpnJgo6LtGDIrKXHVNfZap6z8AVljoaMUEWloRUKy9/oovAuhVe
         07VgPIjWWEhHfu//PEkDw6kGwKWX9yr7XNf4o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788253774; x=1788858574;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=T9TiGLOlBJPaa6ACMJt76ajLLQMGHpzZnyu3DaDv9wI=;
        b=Yk17h7lAvb4HY7N1gJsSxJonenggZClTO7ILg1iQ/UHQVzACZO49s7q940dGwxc3V6
         srNrr3+719tbLum3DGzbTVjLEBG5zHiXEd8v+huKDhAkG3/bBMTQ1KQytxFcx+PbtZE4
         AtZ056i4m7+jLGXKdAghbGFXOtSzsjPLTGyCS0T7GJVpKfRUedlSv8zDFZHOUiZJ5p6e
         ji0mupjK8hFzKvwv7a2Rsnf0K6huyUkw19JWWNY7xq8TaQX0aQRZQuD5Fc8O3/kohmHQ
         BL14dfrh9z0XyNLVaz6bp2LwCKF36bukQYBJe4/SW0eMwwAdtTc9uS72Mzl2/IqiWytW
         Xvig==
X-Forwarded-Encrypted: i=1; AHgh+Rp5Q4CW/jTmuQAbj+IZnaGrnKv3mLj1QvlZ5q2L72Y4wQFYeMLu4/Uxelb4YVI8WqiwNEGMjFwKqLxMwCdmKJAq@lists.infradead.org
X-Gm-Message-State: AFuF++mZ4FAuJ+/owiyzO1VRim2/yH2gKX4U8Lij9DXu80bmkbscQQlt
	iGXnyiL8DUoIRRj1fIwSIksNf2gMlTtbbfIFz0wn4rqoJeRWJEWqBo+20NLYYT5ypfo=
X-Gm-Gg: AR+sD11G39IFFq6GksS82kO9W5dqtWg7ylNjAykRapudgEe/UZuVu3T4/uMzDwVbe8X
	xcRUfVj92xZN9P5ewCABjTPbvCIwaLz6TPhu5u2EoMIp8iz7ZIcy6KVU/v23kB1ypHBgel9xlaq
	EbhmbK7pxgu2GmlZLejsaBwkLu1HRAE25GbU1s20nHmLl7i9pfOeXzxPR6IFTzTQHF3C3p2Gi/O
	7jblhzDyfaDp2qsO6fSAtUJUfM7WFLFAFO2iHhyTHmnKXoI3PNGRhV/628cGpPrkXyvOu0quFh+
	ThISpGhqgg+cOj5D+FgKChnPNpvj36WimGIDLKbWdjzVrvEOuLoHe5u2P/x2ZR+y+XDv5llJu6o
	zrqj82qb1UnT5CVpHlpjdYlltqlyIvtesJPcQPgnbwpuU1xb1tRvoqkxR3ekZDfLkThoCUimEtG
	LOIkKgkTioSu+2rnnVnaHj7QRRb65cdqEABW9U62vnzU9bX4GDfyg3xKS3OtzYMuH6lvVq4cu2t
	vxDwomAf5OmTjZuE/6mLx9g8e2KvHxQOzjxCfQzAH7joc06A7TqIUz15OxgS90idhxLrwXGvx3q
	Mmpla9kMMEN9dKz4MpcYQgiGyYLPNQr+7AcTXoCMz7uwFqSuJZQ+qSzxjob3gtXXeQ==
X-Received: by 2002:a05:600c:190a:b0:49c:e1f1:3dd5 with SMTP id 5b1f17b1804b1-49ce1f13dd6mr5345715e9.4.1788253767752;
        Tue, 01 Sep 2026 02:09:27 -0700 (PDT)
Received: from dario-ThinkPad-P14s-Gen-5.amarulasolutions.com (host-87-9-102-148.retail.telecomitalia.it. [87.9.102.148])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48442c425cesm3825273f8f.6.2026.09.01.02.09.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 02:09:27 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: linux-amarula@amarulasolutions.com,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Abel Vesa <abelvesa@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Fabio Estevam <festevam@gmail.com>,
	Frank Li <Frank.Li@nxp.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Peng Fan <peng.fan@nxp.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Sebin Francis <sebin.francis@ti.com>,
	Stephen Boyd <sboyd@kernel.org>,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-clk@vger.kernel.org
Subject: [PATCH v11 0/2] Support spread spectrum clocking for i.MX8M PLLs
Date: Tue,  1 Sep 2026 11:05:16 +0200
Message-ID: <20260901090912.585681-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260901_020935_703362_A2208BD8 
X-CRM114-Status: GOOD (  17.36  )
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

The series adds support for spread spectrum clocking for i.MX8M{M,N,P}
PLLs (audio, video and DRAM). It has been tested for the video PLL on
boards using i.MX8MN and i.MX8MP.

Changes in v11:
 - Add patch "clk: validate spread spectrum configuration" to reject
   invalid parameters in the clk core before they reach the providers.
 - Fix issues claimed by Sashiko. See the details in the patch changelog.
 
Changes in v10:
- Drop patches 1-22, superseded by the generic spread spectrum clocking
  support from Peng Fan, merged in 7.3, so the i.MX8M specific infrastructure
  is no longer needed. This patch is now based on the following commits:
  - ae794aa6e88d ("dt-bindings: clock: Add spread spectrum definition")
  - c86814e70390 ("clk: Introduce clk_hw_set_spread_spectrum")
  - a7f16660af39 ("clk: conf: Support assigned-clock-sscs")
  - 7d98de6ffdab ("clk: Add KUnit tests for assigned-clock-sscs")
  https://lore.kernel.org/all/20260826165611.236321-1-sboyd@kernel.org/

Changes in v9:
- Add 'Reviewed-by' tag of Peng Fan for imx8mn platform patches
- Fix building warning raised by the kernel test robot for patch
  v8, 11/18 clk: imx: add support for i.MX8MN anatop clock driver
- Add patches for imx8m{m,p} platforms:
  - 23/23 clk: imx8mm: support spread spectrum clock generation
  - 22/23 clk: imx: add support for i.MX8MM anatop clock driver
  - 21/23 clk: imx8mp: support spread spectrum clock generation
  - 20/23 clk: imx8mp: rename ccm_base to base
  - 19/23 clk: imx: add support for i.MX8MP anatop clock driver

Changes in v8:
- Drop the patches added in version 7:
  - 10/23 dt-bindings: clock: imx8m-clock: add phandle to the anatop
  - 11/23 arm64: dts: imx8mm: add phandle to anatop within CCM
  - 12/23 arm64: dts: imx8mn: add phandle to anatop within CCM
  - 13/23 arm64: dts: imx8mp: add phandle to anatop within CCM
  - 14/23 arm64: dts: imx8mq: add phandle to anatop within CCM

Changes in v7:
- Add and manage fsl,anatop property as phandle to the anatop node with
  the new patches:
  - 10/23 dt-bindings: clock: imx8m-clock: add phandle to the anatop
  - 11/23 arm64: dts: imx8mm: add phandle to anatop within CCM
  - 12/23 arm64: dts: imx8mn: add phandle to anatop within CCM
  - 13/23 arm64: dts: imx8mp: add phandle to anatop within CCM
  - 14/23 arm64: dts: imx8mq: add phandle to anatop within CCM

Changes in v6:
- Merge patches:
  10/20 dt-bindings: clock: imx8mm: add binding definitions for anatop
  11/20 dt-bindings: clock: imx8mn: add binding definitions for anatop
  12/20 dt-bindings: clock: imx8mp: add binding definitions for anatop
  to
  05/20 dt-bindings: clock: imx8m-anatop: define clocks/clock-names
  now renamed
  05/18 dt-bindings: clock: imx8m-anatop: add oscillators and PLLs
- Split the patch
  15/20 dt-bindings-clock-imx8m-clock-support-spread-spectru.patch
  into
  12/18 dt-bindings: clock: imx8m-clock: add PLLs
  16/18 dt-bindings: clock: imx8m-clock: support spread spectrum clocking

Changes in v5:
- Fix compilation errors.
- Separate driver code from dt-bindings

Changes in v4:
- Add dt-bindings for anatop
- Add anatop driver
- Drop fsl,ssc-clocks from spread spectrum dt-bindings

Changes in v3:
- Patches 1/8 has been added in version 3. The dt-bindings have
  been moved from fsl,imx8m-anatop.yaml to imx8m-clock.yaml. The
  anatop device (fsl,imx8m-anatop.yaml) is indeed more or less a
  syscon, so it represents a memory area accessible by ccm
  (imx8m-clock.yaml) to setup the PLLs.
- Patches {3,5}/8 have been added in version 3.
- Patches {4,6,8}/8 use ccm device node instead of the anatop one.

Changes in v2:
- Add "allOf:" and place it after "required:" block, like in the
  example schema.
- Move the properties definition to the top-level.
- Drop unit types as requested by the "make dt_binding_check" command.

Dario Binacchi (2):
  clk: validate spread spectrum configuration
  clk: imx: pll14xx: support spread spectrum clock generation

 drivers/clk/clk.c             | 14 +++++++
 drivers/clk/imx/clk-pll14xx.c | 79 +++++++++++++++++++++++++++++++++++
 2 files changed, 93 insertions(+)

---
base-commit: 786262be6048deab760f68c8acc2c85607165894
branch: imx-pll14xx-spread-spectrum

-- 
2.43.0


