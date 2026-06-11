Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A6B6CD98D5
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 11 Jun 2026 12:31:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=teVLg0Nyuj+w1MMVxMfpzz5P6C59n9FO9KlK84OODHU=; b=NkUSd2ACCzvjrI
	fkfYyh1Bz4HYGvonJN9KZKrpU0uUMAQDf3VMp23TNjsUv6qecLS/0XRSxkQBhek6tK/qvccK7y98N
	rv4l4sVGguJp+E70e2lBcl6X7yLTsmQbjKnHXy8X5j+0OPUAfcIOw+Ta5AlyPlXR6xQ8UgSVSVhBZ
	319BsxTGnENLnJSxN8kn/BHZnyGMgHoLU2mvGUp216onpAVNwFrBBZCbls7jUB3aKYS5a2Eb2FLZb
	d+Uu/q09l/UWarCj8Zi+jHwrKvAiibaGDzYOs6iqd6q4bXAbt7XBDJsEX34QhUtlVr22P3kqMiuYJ
	zu09qMtgJXDdinM8S0oQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXeZ3-00000009Oa1-2Unk;
	Thu, 11 Jun 2026 12:31:17 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXeZ0-00000009OYH-2HHY;
	Thu, 11 Jun 2026 12:31:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1781181070;
	bh=CfBaFR7IIQurIHffqh2lk07ZzXs4jZs2QAXHDQClotk=;
	h=From:Subject:Date:To:Cc:From;
	b=LhSRI1IuudofmGk+Na/ZvleYAxpdUtJg7ahHb2UrLVkVafINCpE5ZHAX1uQvpEMAD
	 KC2Q9Ez5Jl+7mDTOAIAttJJgfC02E4W4l/n5gTZw0NDNkbD+RG+Fdqv5gJs2/tHnCp
	 LiZ7j0aD28E7ldov9XzNNN47M2paJSJi/HDXKdVvhBDqcCWFgDZDtTpA3JJiznJAtx
	 nhXpalyHaJrd+5OyN9Y3vuQCzgo92VHya0xK9UqxGuY9yiPVlyETPqWWqUSDB12lac
	 lSCX4CYbk0/Qv3wWflet5lLongc9jrmOqRxM1+GPynpg6F5g4SAX6ITKBdTunQIyFw
	 XJBeSlxQzkn0Q==
Received: from localhost (unknown [100.64.0.241])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id B964C17E03D7;
	Thu, 11 Jun 2026 14:31:10 +0200 (CEST)
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Subject: [PATCH v3 0/6] phy: rockchip: samsung-hdptx: Clock fixes and API
 transition cleanups
Date: Thu, 11 Jun 2026 15:31:02 +0300
Message-Id: <20260611-hdptx-clk-fixes-v3-0-67b1b0c00e16@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/3XNQQ6CMBAF0KuQrq1phzoFV97DuCillUakpCUNh
 nB3CxsTjcv/J//NQqIJzkRyLhYSTHLR+SGH8lAQ3anhbqhrcybAABmApF07TjPV/YNaN5tIhRS
 AWIKtEEhejcHshzy63nLuXJx8eO0PEt/a/1bilFFb15UFidAye9G+71Xjgzpq/ySbl+BjnDj/N
 SAbiMIIXspaq+bbWNf1DYYjU8L2AAAA
X-Change-ID: 20260227-hdptx-clk-fixes-47426632f862
To: Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Heiko Stuebner <heiko@sntech.de>, Algea Cao <algea.cao@rock-chips.com>, 
 Dmitry Baryshkov <lumag@kernel.org>
Cc: kernel@collabora.com, linux-phy@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org, 
 =?utf-8?q?Thomas_Niederpr=C3=BCm?= <dubito@online.de>, 
 Simon Wright <simon@symple.nz>
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260611_053114_745485_08A4AF7E 
X-CRM114-Status: UNSURE (   9.63  )
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

This series provides a set of bug fixes and cleanups for the Rockchip
Samsung HDPTX PHY driver.

The first part of the series (i.e. PATCH 1 & 2) addresses clock rate
calculation and synchronization issues.  Specifically, it fixes edge
cases where the PHY PLL is pre-programmed by an external component (like
a bootloader) or when changing the color depth (bpc) while keeping the
modeline constant.  Because the Common Clock Framework .set_rate()
callback might not be invoked if the pixel clock remains unchanged, this
previously led to out-of-sync states between CCF and the actual HDMI PHY
configuration.

The second part focuses on code cleanups and modernizing the register
access.  Now that dw_hdmi_qp driver has fully switched to using
phy_configure(), we can drop the deprecated TMDS rate setup workarounds
and the restrict_rate_change flag logic.  Finally, it refactors the
driver to consistently use standard bitfield macros.

Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
---
Changes in v3:
- Replaced div_u64() with DIV_ROUND_CLOSEST_ULL() in Patch 1 (Sashiko)
- Fixed theoretical usage_count unbalanced issue in Patch 2 (Sashiko)
- Rebased series onto latest phy/next
- Link to v2: https://patch.msgid.link/20260511-hdptx-clk-fixes-v2-0-664e41379cab@collabora.com

Changes in v2:
- Collected Tested-by tags from Thomas and Simon
- Fixed a typo in commit description of patch 1
- Added a comment in patch 2 explaining why PLL config errors are
  ignored for rk_hdptx_phy_consumer_get()
- Added a missed FIELD_GET conversion for lcpll_hw.pms_sdiv in patch 6
- Rebased onto latest phy/fixes
- Link to v1: https://lore.kernel.org/r/20260227-hdptx-clk-fixes-v1-0-f998f2762d0f@collabora.com

---
Cristian Ciocaltea (6):
      phy: rockchip: samsung-hdptx: Fix rate recalculation for high bpc
      phy: rockchip: samsung-hdptx: Handle uncommitted PHY config changes
      phy: rockchip: samsung-hdptx: Drop TMDS rate setup workaround
      phy: rockchip: samsung-hdptx: Drop restrict_rate_change handling
      phy: rockchip: samsung-hdptx: Simplify GRF access with FIELD_PREP_WM16()
      phy: rockchip: samsung-hdptx: Consistently use bitfield macros

 drivers/phy/rockchip/phy-rockchip-samsung-hdptx.c | 216 ++++++++++------------
 1 file changed, 95 insertions(+), 121 deletions(-)
---
base-commit: 293e19f416fa3f233a2fb013258f7abcb39ad6ed
change-id: 20260227-hdptx-clk-fixes-47426632f862


