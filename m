Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09925C55174
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  2 Aug 2026 20:34:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=tXBqjlY2f6bYpFJSuXlfBIwEMNbQe6Xjdd649Bgo4nA=; b=R6O/ln1mbvLHGP
	NtLjTDtNZtp/lnr5STHG7jIYkmIUoO0O41o3eC29CHgympf4TYuk0ZdvJJpieiYMaThe4ba6TGpq+
	+9gDpqwg7C0FBte25udfXdRrsVZesSjvKjdPIjyO1G9o0WrOnk8R6JLeM6O6PwtVYXBtebzEtVd4c
	2C0ywuDwzuOc6XolAt9hUu2k6p4B3dZrpmjMA/0wMe5a0OTScLny+oc+QB/MUY9DOR7t0vUg6Ia8f
	jybFgmFSjznvIINGd9PYuTcXTxiLKrLf0iEM/4UBIYxTWDjuwjXhLv8bmwuHGgtx7uSIVBEkJOe0t
	98VhcrhcFDgRQE8d8PBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqcsp-0000000G1Mu-27qk;
	Sun, 02 Aug 2026 20:34:07 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqcsm-0000000G1Lm-3INl
	for linux-arm-kernel@lists.infradead.org;
	Sun, 02 Aug 2026 20:34:06 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-4954d29264cso7102715e9.2
        for <linux-arm-kernel@lists.infradead.org>; Sun, 02 Aug 2026 13:34:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785702842; x=1786307642; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=tXBqjlY2f6bYpFJSuXlfBIwEMNbQe6Xjdd649Bgo4nA=;
        b=Zze5I3slr5IGetNAsi/XQNxHdGlYr7s6x04o3dMixKOSzvEq61F6rjbEnJteHX5DMW
         vqp7xFMGQPYYicKasDweWsMG2mQmAielLggvwj6iZuD+LDl+LNuSzewLLH1ZBvy/m4bP
         qbo/R3KQYC2mSQgDfGDpMsx6vCp14nWgI4pdbTfuZQ+XsKLc+o0PboVIm+COXpjwpCFP
         dLzLGv0udvKdyUyf7/FPWgdvTRa9TMFMi633xHKJ+N+CM+Kwcdtxil++jR9EW+uWF5fA
         yecs93qaX3Qh3ZUGaD56gK5ZXhiS8KfP+Pn4VmZXSvguTDuLmFEtuZFo/jjsI4mcZaKQ
         pzmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785702842; x=1786307642;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=tXBqjlY2f6bYpFJSuXlfBIwEMNbQe6Xjdd649Bgo4nA=;
        b=luTFi8WCnNcpnhbqc+NPllG5LC6nAEb+Sxfr8ci4hISeTVtim3kFYfVTtuBB2NoVEl
         1BesdChWLzPvCL3czUJPP8Ys2VwdQFXbmgokFnHqBM401Cbyj3H+iYnH3s1sBesARAYa
         QGqMpMxx8Xpm+5vgirtjtGfMhCCg6AVwAiYMhuNW8nltvK9U9B2QRAUhzldnQm6rdGni
         WTNfjP4NZ33H13Hm/S0PWwglQ1f95mjUqMMA35cdMJVrXh+mVa0D2HnuJd6Wnumv6FFw
         /sQiA4+AVXop1mZaWCs0mslGlYBrPCOX7zGR6FNdBYl1Nm0B6Q23xzdAMORVDrRolZtk
         2DJA==
X-Forwarded-Encrypted: i=1; AHgh+Rrh8WzLyV87O+FoXtXUezfL0GJjgVEiZp8YN9GMQKD336wM36mXkx37Cgx5sNcaGp92hstTwXjML2I1RrHWQwLI@lists.infradead.org
X-Gm-Message-State: AOJu0YyfiuiltZV30csLeKji5vt3M/fdHLYDFgJ6ombUk6jGQtZYaWf5
	cbjpBfYPlRpVi9F2ckc6Ei4NH9cn/CN8e9BKivfxiuH3KAcXpXSxxZ49
X-Gm-Gg: AR+sD10KoiSzRNJ7Q+xceP/V5BMnZeA7FmWJ7ojjkILQg26LY9JrDYcX1ghY9h76NZk
	LaBxf1FsYmbBxuivugtUTnbuoFLody1JDcvrOEW03IPDIzPS1J7J9mPJpYtTiH6BcpiKf35qGZk
	n3F4pyA9p1Jw3G5NvleIxXvNU8HIdTIX0Fw9lI/vlly+DTwaoOIuMsGrWCDMranAUMFrJMhOoCN
	zqOFX8rwFpkPvgz5HYa4SJDBRxQtJQUwtp4fF7UXsnkVzVCilLsSOfJhVu75j9DQjoPBfOFeltn
	af6It31nKD9Nje+tF6Mq5oXiIGpmy5A6fcqgLm6Vt7CBqUmUyvpKt0WI6oI7RecYC/rqOudC3g3
	C2W+ZmhNhTaf/Z0nPgZrSXS9LknHL+1bEEI+99HDjSq6jpoXokEOqv1oHxT+HKFHspS7P2uN5EQ
	O8vCDTVs19ltMd67QLdlih3xj/JIgP+WZsPPBsUwWH+wK4hfIY66U2h7hHKup3yPBhyz+M6OWBX
	Cfi2cpX5Ss=
X-Received: by 2002:a05:600c:811b:b0:495:6934:414c with SMTP id 5b1f17b1804b1-4980c696c7emr154090745e9.19.1785702842254;
        Sun, 02 Aug 2026 13:34:02 -0700 (PDT)
Received: from [192.168.0.2] ([197.250.226.155])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49807bb45ebsm118499905e9.4.2026.08.02.13.33.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 Aug 2026 13:34:00 -0700 (PDT)
From: =?utf-8?q?Stefan_D=C3=B6singer?= <stefandoesinger@gmail.com>
Subject: [PATCH v9 00/12] ZTE zx297520v3 clock bindings and driver
Date: Sun, 02 Aug 2026 23:33:32 +0300
Message-Id: <20260802-zx29clk-v9-0-d05530d85d28@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/2XQy07DMBAF0F+pvCbIM3b86Ir/QCz8mGkt+oCkR
 IWq/47bLhzCciyf6zu+iJGGQqNYry5ioKmM5Xiog39aibQNhw11JddZoEQje5Ddzxl92r13SDo
 rTwrQJVFvfwzE5XxPen17zAN9ftXA0+NQxDBSl477fTmtV5HIGpV7Vhqi94m1xcAUe+my9s6xw
 WBSAHHL2pbxdBy+7yUnuIf96zNBJzuCGBIzkzf2ZbMPZfdcH7xnTDh30BxWh54l5aSk5H7p1My
 hb05VlyxTrymoWnjpdHMGTHP65oL3OmZE8nnp+plD11xfnfXMUmvS4HHpTHNWYnOmOmVttFKzk
 0kvnZ05sM3Z6rR0GiBxYmWWzs0czpy79Qwgbay/CfnPftfr9RdFFtOHcgIAAA==
X-Change-ID: 20260510-zx29clk-2e4d39e3128c
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
 Brian Masney <bmasney@redhat.com>, Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Russell King <linux@armlinux.org.uk>, Lee Jones <lee@kernel.org>
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-phy@lists.infradead.org, mfd@lists.linux.dev, 
 =?utf-8?q?Stefan_D=C3=B6singer?= <stefandoesinger@gmail.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=7558;
 i=stefandoesinger@gmail.com; h=from:subject:message-id;
 bh=ytkVlGWPC4ZaFYhCIySoL2e+Zt6OCP0DIB5EwOX97uk=;
 b=owEBiQJ2/ZANAwAIAT0TvMhUTxoiAcsmYgBqb6modbMmWTEjfJLS3Z6rWqgIE4+olimQZbU63
 SKtgKVYwimJAk8EAAEIADkWIQRDFvS2qgVbJ5UyXWw9E7zIVE8aIgUCam+pqBsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMiwyLDIACgkQPRO8yFRPGiKAphAApm5Me2guqbkgXD/SWGOTxtNV/dl2exj
 Jeqdx6EpnTWGJwnww9aM9S7eL0OtPfNKAZarMRAKhMhqNPB/FLr5ApZSlGhWG2ZC7eaBLnmcbpt
 VJC3+YWYPzqLt+87KUD+qbYJgm2FnLqDkG900TWF7TXJeCm7gn/5snqFpxc6epqiyggr1YJ5SbA
 Rx5YelP9xjPSlItbiIT3yCrt33LD8A7yqb5czo80VdHLGyx8ogkNBQSUK2XVXpK37uvo6SvWs8y
 pCVEOLBxoBJJ81uku2HXLrNNwcR8UmrbR7RZSz9VfhEw1c/4uQZl/7ZbIRyugm0FoebYD33quxo
 pDEiT1ocU/M4zroec8ehe4a0b/LAeKcvn8t2zBDa+6RTzK1KY8MqKuXBfSuS7B12/Iv0wZ5S0m3
 Ne0LNFFOH7BaqSzz5REOR1TXL05Sh98G1ePeV6AiMczrv6J/cJ4dZ9VxV4eOz78wCQ8WNT3ZNom
 gNwWeZ8q8XR+ucu3FHU2i9hSYRGFzAcCVCCPR6yR84l3VA/adE6PdDYySgVxOshcknUY9yaI37v
 QNtYr4vpIs5NOFHSCX5FxMbwwUyFnWZ3H34JELxiDrsx/owPhBr9ivZgNkZg+uhaF1n3ULK2nVb
 QmAueSe4wRQEhk6er4ExNgtkMBUf/lO1VyuNaxdjwxDWxV71dexI=
X-Developer-Key: i=stefandoesinger@gmail.com; a=openpgp;
 fpr=4F9C2C8728019633893EBBB98CB81F9A72BBA155
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260802_133404_863198_8CCCA1B9 
X-CRM114-Status: GOOD (  24.33  )
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

I am sending version 9 of my zx297520v3 clock patch. The main change vs 
v8 is that the clock driver uses parent_data.hw instead of global names 
for parent matching.

I think the list of clocks in my driver is fairly complete; It is 
certainly a lot better than what the downstream ZTE drivers have. I 
deduced a lot of it by trial and error. I am sure there are some clocks 
missing that will need to be added to the binding later. AFAIU adding 
clocks is not an issue, but removing or reordering them is an ABI break.

Merge dependencies: The binding patches (1, 2, 3) and DT patch (12) in 
order. The MFD parent (4) is independent, although changing the ordering 
likely needs trivial adjustments in MAINTAINERS. The clock driver 
patches depend on the headers added by 1-3 and apply in order 
(5-10). Reset needs headers (1-3), but it is independent of clock.

Though in practice mfd, clock and reset drivers are dead code until 
patch 12 adds the DT nodes. Clock and reset drivers won't be 
instantiated without the MFD parent.

Signed-off-by: Stefan Dösinger <stefandoesinger@gmail.com>
---
Changes in v9:
*) Use parent_data in the clock driver instead of parent_names. That 
required some infrastructure to keep track of registered clocks rather 
than devm-and-forget. A nice side effect is that it uncovered a missing 
top->matrix clock link. (Brian)

*) Remove the self-referencing USB PHY reset in topcrm (Krzysztof)

*) (Hopefully) get unevaluatedProperties and additionalProperties right 
in topcrm (Krzysztof)

*) GMAC and SDIO on the matrixcrm controller need topcrm's ahb clock as 
parent. It is added to Matrix's binding and fixed in the driver

*) LSP reset and pclk handling moved from clock child to mfd parent 
driver

- Link to v8: https://lore.kernel.org/r/20260727-zx29clk-v8-0-7a107b00f1dd@gmail.com

Changes in v8:
*) Put #phy-cells into topcrm. The mfd child will have to assign itself 
the MFD parent's of_node to satisfy the check in phy-core.c's
__of_phy_provider_register().

*) Added another register to matrixclk that controls in-controller 
distribution gates. No functional change, but it nicely confirms the 
top->matrix interface

*) Changed clock indices to start at 0, adjusted driver to not use 0 as 
"do not export" marker.

*) Rename DT fixed clock nodes from osc26m -> clock-26m and osc32k -> 
clock-32k

*) Fixed more issues pointed out by Sashiko

- Link to v7: https://lore.kernel.org/r/20260717-zx29clk-v7-0-408411cfcf36@gmail.com

Changes in v7:

*) Moved DT bindings back to clock/ (Krzysztof)
*) Added a usb-phy child node to top to expose the USB status register
*) Add clock gates that control input of PLL clocks into topcrm and 
forward to matrixcrm. Strip down matrixcrm inputs in the bindings to the 
known clocks in this register
*) Add DDR clocks and resets, arm arch timer clock. They are marked 
critical and tell CCF not to gate off the aforementioned input/forward 
gates
*) Remove syscon from matrixcrm (Krzysztof). The DDR mailbox system is 
on a different controller (soc_sys at 0x140000). ZTE's code merely 
controlled clocks in matrixcrm, which doesn't require syscon on this 
controller.
*) Consistently use double quotes in bindings and full include paths 
(Krzysztof)

The individual patches call out changes in more detail.

- Link to v6: https://lore.kernel.org/r/20260702-zx29clk-v6-0-377b704f80c4@gmail.com

Changes in v6:
*) Use MFD for all 3 controllers - I hope both Conor and Philipp will 
agree. I kept top and matrix bindings in soc/zte and lsp in clock/ 
though.

*) Clean up issues found by Sashiko. I pointed them out in the individual 
patches. They are localized fixes and don't affect the overall design

*) Small code consistency: Changed "zx297520v3_lsp" to use "-" , "rst" 
in driver names to "reset"

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
      dt-bindings: clk: zte: Add zx297520v3 top clock and reset controller
      dt-bindings: clk: zte: Add zx297520v3 matrix clock and reset controller
      dt-bindings: clk: zte: Add zx297520v3 LSP clock and reset controller
      mfd: zx297520v3: Add a clock and reset MFD driver
      clk: zte: Add Clock registration infrastructure
      clk: zte: Add regmap-based clocks
      clk: zte: Add zx PLL support infrastructure
      clk: zte: Introduce a driver for zx297520v3 top clocks
      clk: zte: Introduce a driver for zx297520v3 matrix clocks
      clk: zte: Introduce a driver for zx297520v3 LSP clocks
      reset: zte: Add a zx297520v3 reset driver
      ARM: dts: zte: Declare zx297520v3 CRM device nodes

 .../bindings/clock/zte,zx297520v3-lspcrm.yaml      |  101 ++
 .../bindings/clock/zte,zx297520v3-matrixcrm.yaml   |   98 ++
 .../bindings/clock/zte,zx297520v3-topcrm.yaml      |  122 ++
 MAINTAINERS                                        |    9 +
 arch/arm/boot/dts/zte/zx297520v3.dtsi              |   81 +-
 drivers/clk/Kconfig                                |    1 +
 drivers/clk/Makefile                               |    1 +
 drivers/clk/zte/Kconfig                            |   28 +
 drivers/clk/zte/Makefile                           |    6 +
 drivers/clk/zte/clk-regmap.c                       |  237 +++
 drivers/clk/zte/clk-zx.c                           |  189 +++
 drivers/clk/zte/clk-zx.h                           |  142 ++
 drivers/clk/zte/clk-zx297520v3.c                   | 1571 ++++++++++++++++++++
 drivers/clk/zte/pll-zx.c                           |  580 ++++++++
 drivers/mfd/Kconfig                                |   11 +
 drivers/mfd/Makefile                               |    2 +
 drivers/mfd/zte-zx297520v3-crm.c                   |  117 ++
 drivers/reset/Kconfig                              |   13 +
 drivers/reset/Makefile                             |    1 +
 drivers/reset/reset-zte-zx297520v3.c               |  236 +++
 include/dt-bindings/clock/zte,zx297520v3-clk.h     |  144 ++
 include/dt-bindings/phy/zte,zx297520v3-topcrm.h    |   12 +
 include/dt-bindings/reset/zte,zx297520v3-reset.h   |   61 +
 23 files changed, 3755 insertions(+), 8 deletions(-)
---
base-commit: bee763d5f341b99cf472afeb508d4988f62a6ca1
change-id: 20260510-zx29clk-2e4d39e3128c

Best regards,
-- 
Stefan Dösinger <stefandoesinger@gmail.com>


