Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82188F436B4
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 17 Apr 2026 15:12:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=sQg7mK9oWEfVQ2/f5M3NYZgfP1n9UD9hwZDhumEKaq0=; b=vu5l5x8/bVTNm/
	ui/j9C7lKpJS2letK0KppTDEoa5RAm8sSMg8j8M89qscafQbgngxg0AVlHUOzu/HfJdmUGvq75aO0
	1mRzEtJOnHSJGfsXFEDwwILpRvoUqJChMEUDiYIyhfjvM/yk6jtQCBS52GRS72Q9KRZXQzvMdOYCf
	IGdFA3RrjsBqTtszUKQ6wuTTwWNVhf9s8dQRr7M4ESy1Th/OJnlUAl8CihGw9rPcKgBEqYLk39pr6
	702ar/8GjI2i++Odm7/1DQDWfRIg1bbcNTW7PzZV3yXTguFc3VfvGbnoY7qLC3AVe72ZL3He2lUt+
	pcfnJ6doDMarC6exykng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wDkrQ-00000004BdK-2Xvd;
	Fri, 17 Apr 2026 15:12:00 +0000
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wDkrN-00000004BcR-1uot
	for linux-arm-kernel@lists.infradead.org;
	Fri, 17 Apr 2026 15:11:58 +0000
Received: by mail-wr1-x436.google.com with SMTP id ffacd0b85a97d-43cff5dafc3so581492f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 17 Apr 2026 08:11:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=flipper.net; s=google; t=1776438715; x=1777043515; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=sQg7mK9oWEfVQ2/f5M3NYZgfP1n9UD9hwZDhumEKaq0=;
        b=SLCL0/FczCsqcAxLsxl5mfrEcZCpdpV2TxIUrlNnsbH+6UyKjslTvcmSu7EMMI6HfV
         +h+AFcKeh2wSt/4TXjVoW7ImyTPuMRNXjIqCSWUmlxrMCuAgkD5Otqd58dGaaGHY1/H9
         uro4pJeEy1/46U86t16ioLc+vkFjC/Ex/vGnouNVZF2Reg0GuHz2Gy+7Gso32k2XiOy6
         ksJRN5QcKrRuyOaFsGitxR5bC3XqaGZYFRcsQBQCgsn9sECQpkdwTlYy1RMwOCIp5Boc
         06bTUxVw00M+cwYHOAQFUJOXVDjYsiKto01lnMVkiK5727bjxICmkzdq+r9Ye4XwTlAl
         s2ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776438715; x=1777043515;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sQg7mK9oWEfVQ2/f5M3NYZgfP1n9UD9hwZDhumEKaq0=;
        b=lac8Ivp1C0lRHf1d1f5VSz5ibwfkRLw/oK7sHyogowAxohRz1uurZpekZcVYDQN/mu
         cwsv2EChnoZnjxxdtHsssPHpXXHmFKBrbv3beJaUIPLUWkK372D03WjmvKerLdC58Wc9
         MteAOVIBrS5ANMcB6IxfajK812p/YArA6FgnZILXbGvCT3laoKkJk7/CyBSneevCB7LD
         u8uVrcy55oUH+rzTyiq2PI5CXzmchKqDxZhG9QfIswranap0DCp0zvtt+AEbihBn/pxl
         YlTq2uWp6YKS106HWlX3w+PMSvNJ8aVyUMW40WBJh4/d8diHfGva8Qudn58XB3+xtdHT
         Wcjg==
X-Forwarded-Encrypted: i=1; AFNElJ966RBmmp9g5PGklRra7OyqhTlR11t1ZeR65RzAQEoHDQb5rfQTxdb749nXUmfNrhB5tPpMzyiNxRVd88n9eKtf@lists.infradead.org
X-Gm-Message-State: AOJu0Yyd9gp2s+DrX73iAGSr1nEJEiq62QqLvr3eMb6lujLUMor45QgF
	dl7MM2dZ823YZ8V56+yz2g61nbMV7jUOnuhv/wIA1leESt8iy2+/pcWyRUbf8bgNPyI=
X-Gm-Gg: AeBDiesDM2Ml/e3KO+Fn1hCLEk2kPGCTcsh1KaFw+F4sEdwc/hSefKY3IRSG+xi+0Jn
	jA0P1e2/k+n9J29nM4RX/S6LP+NWbGWzt6I50HHvnrH3AqEmPKw8Q2msVigDZM7DDn6a4Uka6eK
	JqdM08AqzuoGkkZVGmb765RGS/zA/4C70+X2rICRuCJGjyOOfNpC5nju88A+oFcAO86Eh2BenP7
	oWHEhiOotxxhzqmGe1RDYuxDsWjk5SvDqqmjFM1Kvt247EWKcIzn4wS+QJt10SFyvxsn7hXhuBb
	82HNERi7Neh7M3K68g42j1ooBIm19bmbgcpyI0vCB9LTlo8gt06tLCPTE8eLL7jw8Gc3ceEyyGQ
	7vgDsD7VzDGG0NKuhiRPnlsRNnZLcGSQs7JR7W9Zx2Cpw4cOtvrAaseXjnPXe+nax8IPLkFPPST
	61udzl2xYjrHuCdG+i2DQQp41h5TowMAXcHOo/mGOR4w5M093rgnol8rvWyQmvD3kMYrJsZFDjf
	6hXSXxqv3PgsxsD
X-Received: by 2002:a05:6000:25c6:b0:43d:7af0:3a7c with SMTP id ffacd0b85a97d-43fe3e0d44emr5071076f8f.29.1776438714844;
        Fri, 17 Apr 2026 08:11:54 -0700 (PDT)
Received: from alchark-surface.localdomain (bba-86-98-192-109.alshamil.net.ae. [86.98.192.109])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43fe4e591cesm7376426f8f.36.2026.04.17.08.11.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Apr 2026 08:11:54 -0700 (PDT)
From: Alexey Charkov <alchark@flipper.net>
Subject: [PATCH RFC 0/4] arm64: rockchip: The hunt for exact pixel clocks
 on RK3576
Date: Fri, 17 Apr 2026 19:11:43 +0400
Message-Id: <20260417-rk3576-dclk-v1-0-26a9d0dcb2de@flipper.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAK9N4mkC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDE0Nz3aJsY1NzM92U5JxsXZNkS9OkpCQzc1MLQyWgjoKi1LTMCrBp0Up
 Bbs5KsbW1AIDnryliAAAA
X-Change-ID: 20260417-rk3576-dclk-4c95bbb67581
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>
Cc: Pavel Zhovner <pavel@flipper.net>, 
 Sebastian Reichel <sebastian.reichel@collabora.com>, 
 Andy Yan <andy.yan@rock-chips.com>, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, 
 Alexey Charkov <alchark@flipper.net>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=5622; i=alchark@flipper.net;
 h=from:subject:message-id; bh=eG6IXyh4y0jftfvJQuYeuV3rZuFLFef4kpCOHmG+mBg=;
 b=owGbwMvMwCW2adGNfoHIK0sZT6slMWQ+8t2WWV9R/clycvGR0/uPTWCN3dJ9VT99gcTL/Hd5f
 GmKaUv4OiayMIhxMViKKbLM/bbEdqoR36xdHh5fYeawMoEMkRZpYAACFga+3MS8UiMdIz1TbUM9
 QyMdYx0jBi5OAZjq9xmMDGuFlPK4MlSmfOu6l9yp8VWFYYnYIr53Sd8+n/vLFHqtfTsjw/UZxlM
 2PbvjOunWdh5h59QtF+ewbtocl+W88rtRnJeeISsA
X-Developer-Key: i=alchark@flipper.net; a=openpgp;
 fpr=9DF6A43D95320E9ABA4848F5B2A2D88F1059D4A5
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260417_081157_546231_1C308C1A 
X-CRM114-Status: GOOD (  32.10  )
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

Dear all,

Need the help of the collective wisdom of the community.

The problem I'm trying to solve is reliably obtaining the exact pixel
clock for arbitrary display modes supported by the RK3576 SoC.

Rockchip RK3576 has three display output processors VP0~VP2, each
supporting different ranges of display modes, roughly as follows:
- VP0: 4K 120Hz
- VP1: 2.5k 60Hz
- VP2: 1080p 60Hz

Each one obviously needs a pixel clock. The required frequencies for the
pixel clocks vary greatly depending on the display mode, and need to be
matched within a tight tolerance, or else many displays will refuse to
work. E.g. the preferred (maximum) display mode out of VP1 is particularly
awkward, because it requires a pixel clock of 248.88 MHz, which cannot
be obtained using integer dividers from its default clock source (GPLL
at 1188 MHz), and the nearest approximation is 237.6 MHz, which is well
outside the tolerance of e.g. DP specification, resulting in a blank
screen on most displays by default.

The clock sources are of course configurable, in particular there are muxes
connected to each VP for selecting the source of the pixel clock:
- Each VP can take the clock either from the (single!) HDMI PHY or from
  its dedicated dclk_vpX_src mux
- The dclk_vpX_src mux can select the clock from a number of system PLLs
  (GPLL, CPLL, VPLL, BPLL, LPLL)

While the system PLLs can be configured to output a wide range of
frequencies, they are shared between many system components. E.g. on the
current mainline kernel on one of my RK3576 boards I've got the following:
GPLL: 1188 MHz, enable count 20
CPLL: 1000 MHz, enable count 17
VPLL: 594 MHz, enable count 0 (yaay!)
BPLL, LPLL: 816 MHz, enable count 0 (but these last ones don't have
            predividers, so are less flexible)

So ultimately there is exactly one free fractional PLL (VPLL) which can be
used to generate arbitrary pixel clocks, but we have up to three consumers
trying to drive different display modes from it (e.g. HDMI on VP0, DP on
VP1 and MIPI DSI on VP2). We also want to be able to adjust the PLL output
frequency on the fly to satisfy the requirements of the selected display
mode.

And this is where I'm stuck. Trying to satisfy the requirements of up to
three consumers while changing the PLL frequency on the fly sounds like
a poorly tractable mathematical problem (is it 3-SAT?). We can take the
HDMI output out of the equation, because it can be driven from the HDMI
PHY (which is capable of arbitrary rates) instead of the mux, but that
makes the decision of which dclk source to use for a VP block dependent on
which downstream consumer is connected to it (HDMI vs. something else).
Even then we somehow need two devices to cooperate in picking a PLL
frequency that satisfies the requirements of both of them, and change to it
without display corruption. I'm not even sure if the CCF has mechanisms
for that?..

What follows is a brief set of patches which illustrate a partial solution
for the case of "I just need 2.5k60Hz on VP1 via DP and don't care about
the rest". It switches the VP1 unconditionally to use VPLL as the source
for its dclk mux, allows changing the VPLL frequency on the fly, and also
changes the frequency calculation logic to allow for nearest-match
frequencies which are not necessarily rounded down. These are not meant
to be merged as-is, as I see the following issues:
- The flag allowing the PLL to change rate is in the clock driver, while
  the reparenting to an unused PLL is in the device tree. If these go out
  of sync, we might end up trying to change the frequency of a PLL which
  is used by other consumers (I presume that could be dangerous)
- If VP0 happens to be driving DP output, it won't be able to produce the
  2560x1440@60Hz mode for the same reasons as VP1 - then it must also be
  reparented to VPLL and allowed to change its frequency on the fly

It does bring me from a state of "always blank screen on DP output until
the mode is switched to something magically working" to a state of
"most monitors work at the default preferred mode" though.

It is tempting to just reparent both VP0 and VP1 to VPLL and allow both of
them to change its frequency, while leaving VP2 on the default (fixed)
GPLL and relying on the fact that 148.5 MHz (the required frequency for
its maximum supported mode of 1920x1080@60Hz) is conveniently 1188/8 MHz -
just what GPLL can provide. Then also force whichever VP is driving HDMI
output to use the HDMI PHY as its clock source. But we still have the
problem of DT vs. driver coordination, and I'm not sure how to define
the policy for "if you've got HDMI connected, you must use the HDMI PHY
clock for the respective VP, whichever VP that is".

I would very much appreciate any thoughts on how to approach this.

Signed-off-by: Alexey Charkov <alchark@flipper.net>
---
Alexey Charkov (4):
      arm64: dts: rockchip: rk3576: assign dclk_vp1_src to VPLL
      clk: rockchip: pll: use round-nearest in determine_rate
      clk: rockchip: rk3576: allow dclk_vp1_src to propagate rate to parent PLL
      clk: rockchip: rk3576: add ROUND_CLOSEST to dclk_vp1_src divider

 arch/arm64/boot/dts/rockchip/rk3576.dtsi |  2 ++
 drivers/clk/rockchip/clk-pll.c           | 16 ++++++++--------
 drivers/clk/rockchip/clk-rk3576.c        |  4 ++--
 3 files changed, 12 insertions(+), 10 deletions(-)
---
base-commit: c7275b05bc428c7373d97aa2da02d3a7fa6b9f66
change-id: 20260417-rk3576-dclk-4c95bbb67581

Best regards,
-- 
Alexey Charkov <alchark@flipper.net>


