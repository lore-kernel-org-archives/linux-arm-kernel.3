Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84204C982FA
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 21 Sep 2026 21:15:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=U/vKdd1PGMiT//oVPsancO8xe/Fi08biK7Po64XBXdU=; b=dUc97Af+3wKsCd
	YjCpKVhMIm+gTDF+62OJAnQvawryuZJN34gBfTBtSd159EBN8m1ue95pdV61kZ32FVLRbZqh+KV51
	5OwSK9JmsKEXbTIbKHiVHm9wLfABK7wKb1s4+jNq/A2XAs39Hx/bX5qx4Mq7MSZ8UHTW9xF1XCOTR
	XfNte1LdhNvP1ZXQkfgUxj6cG6kQuld+6sA5b+gGL+fCVeLyT24xhoYr8Ji2I2DVPZYNewM+MCnuz
	xMYJZIWHBXEOLSwojx1kHyRI9szP5DIviLo4lFOvBSPnQNKDFtBuH7I21bkX/ryCdjNBxiMy3DAaD
	bLpTE4BsMMxJKFti2ImQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8lM1-00000003R4z-0kGF;
	Mon, 21 Sep 2026 21:15:13 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8lLx-00000003R3l-12bi;
	Mon, 21 Sep 2026 21:15:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1790025306;
	bh=uz+1Ip6QENWsADg1pboQHCC4AQH2T4g6L75Y7bdCPX4=;
	h=From:Subject:Date:To:Cc:From;
	b=Juol2uSR+lCANzQWFWAxlzqnzHMccXwuCD/YC5BXarLbIehH5s8EZu6KpRFt4rNWb
	 3m63oXcQqVQ2Xg/SLX27EF5aDr33uLCGDEWqZ7ptzZ9sBPSfoov0WevNIrWoFfkOWx
	 W/Fql1S2zWbKJKCsaq51EFDuDY9jR1Oiu/M3zwZfY6m6JuPqW2LilBw273ji21RZZd
	 LF+nmLVlF69juOfhP6BKkVaWxT0sPzrjOOuUKXWypZqgymHLNDukJpzA0+0e9wMbst
	 /q3fVVT3OAJbzimkY+MTesc1azSOMJ0t3br7+ttafOnL6KtNc148rL87T9xWeeCvTZ
	 YC5yWzbly04OA==
Received: from jupiter.universe (unknown [100.64.1.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519)
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 996ED17E0C7E;
	Mon, 21 Sep 2026 23:15:06 +0200 (CEST)
Received: by jupiter.universe (Postfix, from userid 1000)
	id 50FF848002B; Mon, 21 Sep 2026 23:15:06 +0200 (CEST)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Subject: [PATCH v2 0/7] PM / devfreq: rockchip-dfi: RK3576 support
Date: Mon, 21 Sep 2026 23:15:02 +0200
Message-Id: <20260921-b4-rockchip-dfi-rk3576-support-v2-0-04f847016321@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/43PQW6DMBAF0KsgrzsROAEXVrlHlcVgxsUNwe7YW
 K0i7l5DWlXddfmlr/9m7iIQWwqiK+6CKdlg3ZyDfCqEHnF+JbBDzkKWsinbSkF/Anb6qkfrYTA
 W+HqsVQNh8d5xhJORzXOt0QzKiDzimYz92IGXyyOHpX8jHbfV7wbT+5Ll+Kj9wvmOH/aPqSfCe
 fFgCKkhMkit7pLc1noMBNrdbjZ2RVKHI7CuxCaPNkTHn/unqdqh/z6VKigBa1VLlK1R/XDWbpq
 wd4yHbInLuq5fPi4Ol0oBAAA=
X-Change-ID: 20260917-b4-rockchip-dfi-rk3576-support-4f2685cafd7f
To: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 Chanwoo Choi <cw00.choi@samsung.com>, 
 MyungJoo Ham <myungjoo.ham@samsung.com>, 
 Kyungmin Park <kyungmin.park@samsung.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>
Cc: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>, 
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org, 
 kernel@collabora.com, Sebastian Reichel <sebastian.reichel@collabora.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2303;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=uz+1Ip6QENWsADg1pboQHCC4AQH2T4g6L75Y7bdCPX4=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGqxnln2X8WMLZpbX/WOMENzlWYo6LZ2SXsiC
 jnf9ocGVQUoMIkCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJqsZ5ZAAoJENju1/PI
 O/qaMN4P/R+I8W7SmUX+3xT7r8TMVydE2oRThJbk7gB2kYwBdrZj/4aKc4gJDvPti4f0kBrKBXm
 xB7NWy6gKf+GPuGSvQRVlyB4/C/Wx3gUmz7mtn0lbO0y/pPF72oYhiviHezGseELVUoOPUKSf+5
 e6yQjlSjX4q+wJ2eUs9uqENVjAYv1R71fkzKU4A4MR2Q8QtEDrjXZUO48PF9UjI19iRKyQynEtz
 IVGL1x/je+hZqdNlJZHdblShsiPdYpCGtNxeyuS/LQD8FvEa/+ZvmXimsI8/ec/VdnYdF2es8qM
 hQbhszEowRrRW+22Q4+qJp2NYv/iVmAXSxPvVFs0LUZne5d8wxICzNka8v6AwvsFxUxLsgh42Vr
 uexcaXN1Ly67lSyHGIPz/Sr/bMCkZdyNakLdq6HY3oIWISubi6eaCJ/QAMNIZziz0teKZhUGhvc
 9y5PH4/ukbyT+2YXn2e/ZM3oCs7kYds2Ax3ma0+8VAew5gWZaI6I+RDYxtqT/4JEzrq2A3+l0ZW
 CbevW620GKnQzn9XAXOLKK/gDUY7UrLa6c3BDCljgQPIsECOQhQ4L4riuRVr/l4/mx5Nlq6ZY9q
 0E4Ay0jxtvJbEnJqDxvvqvdPMMGgGCojgsIDZTOyDBN/zIkVz6ZFMiYvM4++BzKAQY+553ItCDn
 svbMdd3buxZJsXih+2yAyRQ==
X-Developer-Key: i=sebastian.reichel@collabora.com; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260921_141509_450356_C143EF67 
X-CRM114-Status: GOOD (  12.42  )
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

This adds RK3576 DDR perf monitoring support to the existing DFI driver.

This series depends on the cleanup series adding RK3588 clocks together
with some general DFI driver cleanups:

https://lore.kernel.org/linux-rockchip/20260917-rockchip-dfi-cleanup-v1-0-4f00a97a69a6@collabora.com/

As RK3576 did not yet have upstream DFI support, the clocks are
considered mandatory for RK3576.

Changes in v2:
- Link to v1: https://patch.msgid.link/20260917-b4-rockchip-dfi-rk3576-support-v1-0-a5752a29f7bd@collabora.com
- Update DT binding to just define minItems/maxItems

Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
Nicolas Frattaroli (4):
      dt-bindings: clock: rk3576: add more DFI clocks
      clk: rockchip: rk3576: add missing DFI clock branch
      dt-bindings: devfreq: event: rockchip,dfi: add rk3576
      arm64: dts: rockchip: add DFI node to RK3576

Sebastian Reichel (3):
      PM / devfreq: rockchip-dfi: move register offsets to variant struct
      PM / devfreq: rockchip-dfi: prepare support for v4 DDRMON
      PM / devfreq: rockchip-dfi: add RK3576 support

 .../bindings/devfreq/event/rockchip,dfi.yaml       |  19 +++
 arch/arm64/boot/dts/rockchip/rk3576.dtsi           |  11 ++
 drivers/clk/rockchip/clk-rk3576.c                  |   4 +-
 drivers/devfreq/event/rockchip-dfi.c               | 136 ++++++++++++++++-----
 include/dt-bindings/clock/rockchip,rk3576-cru.h    |   6 +
 5 files changed, 142 insertions(+), 34 deletions(-)
---
base-commit: e5e04726cdd043e309677071ab1b65a4b18f422b
change-id: 20260917-b4-rockchip-dfi-rk3576-support-4f2685cafd7f
prerequisite-change-id: 20260917-rockchip-dfi-cleanup-feae6eefae9c:v2
prerequisite-patch-id: 9b56fea3de6c3cf86c5bba33be03da8fabe4ab11
prerequisite-patch-id: 6c0231d124501b5a5e09e32243e4878a606f8b8d
prerequisite-patch-id: 85ff85240fb912a93e1a306cdd6e75416b156a2f
prerequisite-patch-id: 0551828c703b115f8e240ee69ebc0065f5a53536
prerequisite-patch-id: ad55ffe5e8ff53fb7088aa3ecfcd00bb1d67b80b
prerequisite-patch-id: 2af929c305fc289aaf52d437c7ecd5a471a00465
prerequisite-patch-id: b7f769793ec072640d6672d0b9297ad940af3b9a
prerequisite-patch-id: 2c12b9645664ad5a5822a2a858652363e01067cb

Best regards,
--  
Sebastian Reichel <sebastian.reichel@collabora.com>


