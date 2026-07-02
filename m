Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E8B7C43458
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  2 Jul 2026 20:28:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Xvtrv/+d8hgkbnhW0n0gWT+809XDlEUPExgyc3n/9CQ=; b=YffVtnQcasgjQu
	owRHexxYImthoSCosNkGwtw2h/obA7TT0zkC9pNoPlimtqqZTKyDmAMjxWq71ctujt5EeJMbSJ6ba
	slWRZpxQ0xaYkk87e1A+qUH59IPeYo0CuSTdsb+K7UVHFToBZ0F9YDcScFcMdc3PemfoX1Mgw7+BA
	RvVMksTnUy/ivhRT6V5WO7zUMEBENWeXMPMKldG9rgkC41vvctCPAdqh5CVzvq/EGXSqzQtMPqZuw
	5MIMGWaYa8StqOdZBjkaOOViUp6QFtiFbObmDJJ+ZyI6UhCQdV6DOTbtMm1OH7VvJ0eMQ3y6dLXC+
	y6w06iCKYxqc4iQCbpPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfO1T-00000005RTs-1m51;
	Thu, 02 Jul 2026 20:28:35 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfO1P-00000005RTF-2t3e
	for linux-arm-kernel@lists.infradead.org;
	Thu, 02 Jul 2026 20:28:33 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-493b1710405so12219595e9.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 02 Jul 2026 13:28:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783024110; x=1783628910; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Xvtrv/+d8hgkbnhW0n0gWT+809XDlEUPExgyc3n/9CQ=;
        b=Ftq3QaBXelVJGtiCPaExBUYrmh6VMKnh+Z5DbzUgS5ycyno8VeFrCurRthQ5zw0vMX
         VRe53Crvu3qu3kjTQmDOkwtLYko4o043dyfwSB4HctVL20LLB361RBE+RSdi2jhGa1pD
         gE3i645s7XRYzJoCC/4cYC8vAWXrnFgTtEMMuE1156myX7Ua/1Bn0al3shQgkKRks0n6
         cJyUQ0ffYoUnai02kiDiTuA31va3TynWmLfownXJes7esC+YTBqKA2JWlorn7FmUBoLq
         aRjQ8DDYap01cB+OESk5Yht1ePt8BC7Q9OyW6zkZnI9Vq0FIFAPsvvXeRvHI7aLX0woe
         lUpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783024110; x=1783628910;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Xvtrv/+d8hgkbnhW0n0gWT+809XDlEUPExgyc3n/9CQ=;
        b=MwR/4Bov2QiGOhoNZLnVIjepBCHj2mZOqLSoEhhMOl+oRLzDgtZn63lrcrKYLv9DBj
         cJ0g4hbtJ6nX1nVNOR35jijpmRcCWRlH9QuEYqVG3TuLGZxL9Mi0szTnA2Vfn4x139vM
         Dv4Iwdai56P+/fCxPF8lr0b1vgA/P9oSI9kLIQG3S4u/FfylkgfR83iUEeEdbgTZGyUy
         zABzgoXMZ1+JsLM+f7hxxo1o2jjfacxyWL3NU9CdUc+msWBgMzKAYT4J259v9yGAEUAi
         UvGsHD3U6h+jxkxwakcKIFQZIGt+ryWB9fBaOpCoGVUD6Zx45if1WbXVNiB4Kw8TFaM2
         VAHA==
X-Forwarded-Encrypted: i=1; AFNElJ9zoVaKqN+fWiKXPuEfda5b+OSUmmpUDhKRTXsyK8VgjxYqrdtuaqXd1Sjr8mrO8852bw2R+Uy+WNsCSLvEPuyz@lists.infradead.org
X-Gm-Message-State: AOJu0YyXK+g9laxm/52GdqsHgIF1g7BZ3dIOFNMc6I+p5pWm0TGd/fJJ
	YQuORDWMizRPwL+WwlqhUb3Q912a8VavqxurN9UrAtxulBcVt6hgdsae8gkU3xSIvxw=
X-Gm-Gg: AfdE7clA4RoQazRuRDRdkkUdrGqj1C/hn6bU1x2Edcz4vKbcVXTp/JLEbgJ61C/vnOk
	MhTiU4CdcP964Chn5OYwl2Dvo/aVASRYZoxjWdLz/ZVL6p6tMHGGie6IbCGIQwFWmqGk0jHiVfV
	5nHRv/X5HGZZq66JUAEYHH+xwBUXz95cWaDusABpptyxZpCfbUodqs1hvIzgRoZqXjERY9n/82g
	CF4enjpHc9d5mCXYLzr5cuVYaebhhgNpXBMKeopF4isuQR0K0Km0mUMAiarUhSncTLhPdJMnUbm
	H/B+mfD/XJfLLFNgPK3rAGB+2SWu+GKyYugV3Mwb2MVNiXFjV1YO5GVnwSkj736SuRttwPLpIL9
	L+UPgaOtZ9gD844eK4iXQO6vRiavS4yJKGqOAAulCT9lOYVg26LjgNJqeHMcckYOYm5vuhjyyBx
	oujupm9AXSRmhr2EpB3hkWZzs=
X-Received: by 2002:a05:600d:8649:10b0:490:44eb:c1ea with SMTP id 5b1f17b1804b1-493c2b905d3mr89908715e9.24.1783024109578;
        Thu, 02 Jul 2026 13:28:29 -0700 (PDT)
Received: from [192.168.0.2] ([197.250.51.120])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493c6369488sm80321145e9.9.2026.07.02.13.28.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jul 2026 13:28:29 -0700 (PDT)
From: =?utf-8?q?Stefan_D=C3=B6singer?= <stefandoesinger@gmail.com>
Subject: [PATCH v6 00/12] ZTE zx297520v3 clock bindings and driver
Date: Thu, 02 Jul 2026 23:27:55 +0300
Message-Id: <20260702-zx29clk-v6-0-377b704f80c4@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/2XOTU7DMBAF4KtUXmNkj/9ZcQ/EwnbGrUXTQBKiQ
 pW7M00XiYLkzbPmezM3NmBfcWAvhxvrcapD7S4U7NOB5VO8HJHXhjIDAVYYKfjvFUI+f3BA3ai
 ASoLPjKY/eyz1ujS9vT9yj1/fVDg+PlmKA/LctW0daQEm76TEjEDPoQFU4KJJLlrwSNUpuKINu
 3ed6jB2/c9y5CSXsn/3TJILjjLFXErBYN3rsY31/EwLl44Jtk6uDshBKAKbrIQoZu/UxkFYnSK
 XXUGjMSrvy97p1VlpV6fvLoagUwOAodk7s3HgV2fIuVCK0Bq1DLB18zz/ASz8meTKAQAA
X-Change-ID: 20260510-zx29clk-2e4d39e3128c
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
 Brian Masney <bmasney@redhat.com>
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 =?utf-8?q?Stefan_D=C3=B6singer?= <stefandoesinger@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=4773;
 i=stefandoesinger@gmail.com; h=from:subject:message-id;
 bh=unQsydtjAAVv4Ud2oQVvNHCT/ZtVhlkJsaaSsqaqI/0=;
 b=owEBiQJ2/ZANAwAIAT0TvMhUTxoiAcsmYgBqRsnkUE94LCgDtF4324R9Is48FRxPumYtJWGXk
 aO3oADIaqeJAk8EAAEIADkWIQRDFvS2qgVbJ5UyXWw9E7zIVE8aIgUCakbJ5BsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMiwyLDIACgkQPRO8yFRPGiI4EA//SvIbIp3vn7Ya2hiovUKHEh7UGCh6JwW
 2ZvfyZEwvuuxHjW45iAuJm+UsXdOk/vS6ru72gINVgAYN1g4yREtCL4vILJMygDj/coRXD1UQBJ
 Y5DI2FYoItiCuyaJQ4VKyq2T3TX0kr6K7FOYgAzr/QDhkarc0XmLCUsKkkoUWfz3kO8iDO6VU62
 rMLTSSP92uEuBHfvAvX5u5//SMXx0fQG+g5GFs2HsxN2TBCoTVvwvW7Vn2qmwoB1uMr4QJvb/p+
 50zF//TKaBWpCftFiUzeaxZ5RZhrtjw1oYaX8GnvyRAWXUoOJi13vesyg2SW5Ede6oAn5GcRNzC
 5SZiStQgkpuA/we41pha84kbCTqx1pnSAMbIxiRKs1Mw+zOy5n1c5U1EBKnGZ2s4DXoR3ajQH2v
 gzxT2e9GU7sbdq5eVCLp007I/YHjaSHHeHBtSju5pTZxD+O8L9TGcBZZhLCuhXtFu25CgAvbMnQ
 h3i6ZUBIg/RzKiQeWjbjeGbhm9JBEb07cYYdItI66MZlwXyX4Qu9E9/wJA+ffpEymRs4SjXJsiQ
 EJSbJo4n2OVzWzgUi8Qphln/nOByw2niT4JKZ0ht/hX0BjJtxOLqqf6LL/rH0ZSDg79ajWXh2P6
 zbWhVjRyq/35CjSmeWsgGdvdvpqGhKbIBaWfA6gUHbVRusWJD+zg=
X-Developer-Key: i=stefandoesinger@gmail.com; a=openpgp;
 fpr=4F9C2C8728019633893EBBB98CB81F9A72BBA155
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260702_132831_769534_C86B6C12 
X-CRM114-Status: GOOD (  17.07  )
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

Hi,

I am sending version 5 of my zx297520v3 clock patch. The major change is 
using regmaps rather than raw mmio to access the clocks and moving reset 
handling into its own mfd/aux bus driver.

I think the list of clocks in my driver is fairly complete; It is 
certainly a lot better than what the downstream ZTE drivers have. I 
deduced a lot of it by trial and error. I am sure there are some clocks 
missing that will need to be added to the binding later. Afaiu adding 
clocks is not an issue, but removing or reordering them is an ABI break.

Signed-off-by: Stefan Dösinger <stefandoesinger@gmail.com>
---
Changes in v6:
*) Use MFD for all 3 controllers - I hope both Conor and Philipp will 
agree. I kept top and matrix bindings in soc/zte and lsp in clock/ 
though.

*) Clean up issues found by Sashiko. I pointed them out in the individual 
patches. They are localized fixes and don't affect the overall design

*)small code consistency: Changed "zx297520v3_lsp" to use "-" , "rst" in 
driver names to "reset"

Changes in v5:
*) Use MFD instead of aux bus for top and matrix clocks
*) Move top and matrix bindings to soc/zte
*) Give USB PHY its own resets
*) Other localized changes are noted in the individual patches
- Link to v4: https://lore.kernel.org/r/20260616-zx29clk-v4-0-ca994bd22e9d@gmail.com

Changes in v4:
*) Use syscon and regmap instead of raw IO
*) Move reset to its own driver on the aux bus, but keep reset and clk 
in the same binding as it matches the way the hardware works
*) Go back to having matrixclk in its own device because syscon deals 
poorly with multi io reg devices. List all PLL outputs from topclk as 
inputs to matrixclk
*) Some more hardware research: Figure out the parents of the 4 possible
GPIO clock outputs and declare them in the driver. They are unused on 
the hardware I have, but they show that all PLLs can be used.

- Link to v3: https://lore.kernel.org/r/20260529-zx29clk-v3-0-c7fe54ea388f@gmail.com

Changes in v3:
Model top and matrix clocks as one device
Add PLL driver
Fixed a few issues found by Sashiko: register lock, some missing devm_, 
error handling

v2: Fix build issues introduced by checkpatch.pl fixes that I didn't 
spot earlier.

---
Stefan Dösinger (12):
      dt-bindings: soc: zte: Add zx297520v3 top clock and reset bindings
      dt-bindings: soc: zte: Add zx297520v3 matrix clock and reset bindings
      dt-bindings: clk: zte: Add zx297520v3 LSP clock and reset bindings
      mfd: zx297520v3: Add a clock and reset MFD driver.
      clk: zte: Add Clock registration infrastructure.
      clk: zte: Add regmap based clocks
      clk: zte: Add zx PLL support infrastructure
      clk: zte: Introduce a driver for zx297520v3 top clocks
      clk: zte: Introduce a driver for zx297520v3 matrix clocks
      clk: zte: Introduce a driver for zx297520v3 LSP clocks
      reset: zte: Add a zx297520v3 reset driver
      ARM: dts: zte: Declare zx297520v3 CRM device nodes

 .../bindings/clock/zte,zx297520v3-lspcrm.yaml      |  96 +++
 .../bindings/soc/zte/zte,zx297520v3-matrixcrm.yaml | 178 +++++
 .../bindings/soc/zte/zte,zx297520v3-topcrm.yaml    |  86 +++
 MAINTAINERS                                        |   7 +
 arch/arm/boot/dts/zte/zx297520v3.dtsi              |  98 ++-
 drivers/clk/Kconfig                                |   1 +
 drivers/clk/Makefile                               |   1 +
 drivers/clk/zte/Kconfig                            |  27 +
 drivers/clk/zte/Makefile                           |   6 +
 drivers/clk/zte/clk-regmap.c                       | 250 +++++++
 drivers/clk/zte/clk-zx.c                           | 142 ++++
 drivers/clk/zte/clk-zx.h                           |  80 ++
 drivers/clk/zte/clk-zx297520v3.c                   | 819 +++++++++++++++++++++
 drivers/clk/zte/pll-zx.c                           | 495 +++++++++++++
 drivers/reset/Kconfig                              |  10 +
 drivers/reset/Makefile                             |   1 +
 drivers/reset/reset-zte-zx297520v3.c               | 234 ++++++
 drivers/soc/Kconfig                                |   1 +
 drivers/soc/Makefile                               |   1 +
 drivers/soc/zte/Kconfig                            |  20 +
 drivers/soc/zte/Makefile                           |   3 +
 drivers/soc/zte/zx297520v3-crm.c                   |  95 +++
 include/dt-bindings/clock/zte,zx297520v3-clk.h     | 171 +++++
 include/dt-bindings/reset/zte,zx297520v3-reset.h   |  61 ++
 24 files changed, 2875 insertions(+), 8 deletions(-)
---
base-commit: 6eb8711ece2ce27e52e327a5b7a628ed39b97f45
change-id: 20260510-zx29clk-2e4d39e3128c

Best regards,
-- 
Stefan Dösinger <stefandoesinger@gmail.com>


