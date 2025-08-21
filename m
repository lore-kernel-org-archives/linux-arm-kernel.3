Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4696CA0EEB
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 22 Aug 2025 03:24:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=TVk2QpygVx3otc29dhmdop36ZFneZ3AcyH3fxAZ6hzw=; b=JM1iwTcqvz6CIbLci05y2lw1QM
	9kIxSC9JQbr4ZCtt4hMfFLgDwiBBkiH5htl/3QVdvPF9/DcmRd30XYTLdEEh/etcJsXua8CZ2xXA7
	3INZpByFhR1PXsBK83l9ZMvKSdvcsHfpkAyZyJqnutbDYZ5soE1dy7NQ/ThsnXHRkjgxET0RToSsP
	ENijzl5kQBGfNnmYSS/LsNfKBbGozJcMzSd+wdX/Klt17IflYRt8TNQ2WmzsyDmY+bs+nBlmNeZRB
	J5jfxqCx0URS14Perex4l3EabmX8KlBnPmL26CMZdGo+cOpTH3gQo7sZyqhR+0RmA2rEQNcz9opP2
	KP6QzOsg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upINu-00000001Nng-0JqC;
	Fri, 22 Aug 2025 03:24:10 +0000
Received: from smtp.forwardemail.net ([121.127.44.73])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upCgS-00000000eBF-2iKa
	for linux-arm-kernel@lists.infradead.org;
	Thu, 21 Aug 2025 21:18:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kwiboo.se;
 h=Content-Transfer-Encoding: MIME-Version: Message-ID: Date: Subject: Cc:
 To: From; q=dns/txt; s=fe-e1b5cab7be; t=1755811133;
 bh=TVk2QpygVx3otc29dhmdop36ZFneZ3AcyH3fxAZ6hzw=;
 b=yQul93J/kIWY5QJVG6Iq6RrGRmFijZdrG4gv7mcnjvXRtD2Xtd7Yals7UKiIEA8sH0jl9jBIO
 K2o6AwaF9xvzH1MnAa7sA3ws+kXkeREk25bsmHB92T791oVW2NzQc9BWCv2ksyUzPNrWxoJ+gQ1
 FmVpS0BrqA2qVv9oa+bsdQPGAljkwi5KHLARxR0m9EHwZcf0DOPm9LuHLFRmai6DSRfdAYOoMj0
 8m/kLyynvdE8OeHFoOLnj0cz1T55cGZVgMVv9Qr2a5J+J05Noez4fuio7fdkyOVlHnhFDymeOAI
 rcrxe2tZEM4VopWxr/QSWt2rfWcq/lah8CJxZy4mtBQw==
X-Forward-Email-ID: 68a78d3a1990298b555d68eb
X-Forward-Email-Sender: rfc822; jonas@kwiboo.se, smtp.forwardemail.net,
 121.127.44.73
X-Forward-Email-Version: 1.2.9
X-Forward-Email-Website: https://forwardemail.net
X-Complaints-To: abuse@forwardemail.net
X-Report-Abuse: abuse@forwardemail.net
X-Report-Abuse-To: abuse@forwardemail.net
From: Jonas Karlman <jonas@kwiboo.se>
To: Heiko Stuebner <heiko@sntech.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Yao Zi <ziyao@disroot.org>,
	Chukun Pan <amadeus@jmu.edu.cn>,
	linux-rockchip@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Jonas Karlman <jonas@kwiboo.se>
Subject: [PATCH v3 0/1] rockchip: Add power controller support for RK3528
Date: Thu, 21 Aug 2025 21:18:40 +0000
Message-ID: <20250821211843.3051349-1-jonas@kwiboo.se>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250821_141856_985309_90ADDDF9 
X-CRM114-Status: UNSURE (   9.15  )
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

The Rockchip RK3528 support multiple power domains, one PD_GPU that can
fully be powered down, and other that can be idle requested.

Vendor kernel flag all power domains on RK3528 as always-on, this takes
a different route and instead tries to describe all devices power-domain
in the device tree, even for controllers with unsupported runtime status.

The PD_RKVDEC is used by RKVDEC and DDRPHY CRU, and is kept disabled to
prevent a full system reset when trying to read current rate of the
SCMI_CLK_DDR clock.

pm_genpd_summary on a Radxa E20C after this:

  domain                          status          children        performance
      /device                         runtime status                  managed by
  ------------------------------------------------------------------------------
  vpu                             on                              0
      ffaf0000.gpio                   unsupported                 0           SW
      ffb10000.gpio                   unsupported                 0           SW
      ffbe0000.ethernet               active                      0           SW
      ffae0000.adc                    unsupported                 0           SW
      ffbf0000.mmc                    suspended                   0           SW
  vo                              on                              0
      ffb00000.gpio                   unsupported                 0           SW
      ffc30000.mmc                    suspended                   0           SW
  venc                            on                              0
      ffb20000.gpio                   unsupported                 0           SW
      ffa58000.i2c                    unsupported                 0           SW
  gpu                             off-0                           0
      ff700000.gpu                    suspended                   0           SW

Changes in v3:
- Drop already applied patches and depends

Changes in v2:
- Drop already applied patches
- Add snps-dw-apb-uart dt-bindings patch
- Update commit messages

Jonas Karlman (1):
  arm64: dts: rockchip: Enable more power domains for RK3528

 arch/arm64/boot/dts/rockchip/rk3528.dtsi | 30 +++++++++++++++++++++---
 1 file changed, 27 insertions(+), 3 deletions(-)

-- 
2.51.0


