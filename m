Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F009C282C6
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Mar 2025 03:57:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=3Ff1YuoW1w/9iEkrNSlA4ob8xGNWh3OyF4nmQCZ1omc=; b=m2vhpGDor1NUZIz5d/rFpYM03W
	rwc5eMhCsD9/t/m4LEVq42+iGfpQ9Uv4XM5/ugbTdDucHM1joAzkDtUBnfEZUoQPXbMjzCkaa8jLb
	E9h+iFKyLrg+1ZVk6G/Q9yoKFb3S8llqfCxSYX49GP71cYKEdPh5RQ1PXIQ/hYVau2oQY2AAWTpGx
	waY5XF8W7PLEu8PcZJjJ4JNQNmdktu7C5RQIhaq6rvoBJ3VjlCBI+bpPTLa+7jZGYrG+GOubsA9IY
	j4oM58ntom4hG2oaDS32qSahJsW11bKVXAGBpA67wVVjJBNrOx7lsMMzQ0/M7aDiRxbl0KwBGU+mQ
	TjU1SOIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1towvg-0000000H7fl-2SAz;
	Mon, 03 Mar 2025 03:57:20 +0000
Received: from m16.mail.163.com ([117.135.210.2])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1towjq-0000000H63D-0AHQ;
	Mon, 03 Mar 2025 03:45:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:Subject:Date:Message-ID:MIME-Version; bh=3Ff1Y
	uoW1w/9iEkrNSlA4ob8xGNWh3OyF4nmQCZ1omc=; b=EGkBSpv7f6+coIQAY/q1e
	4XoVxgIPky8dhGmOtlHM2VDzMXPhlDFfi1OqdWdusbcv2h398dmodIjVIU5ot5QN
	tYu/RVhyh+l0EGLRYW3oLINZdSxu8ef+ZfkcIKLyU+XAdRsprgBT0lidP01d6dqP
	tWY/z0xGiX2VUV2P7twm7E=
Received: from ProDesk.. (unknown [])
	by gzsmtp2 (Coremail) with SMTP id PSgvCgC3Oc2lJcVnaJliJg--.43523S2;
	Mon, 03 Mar 2025 11:44:41 +0800 (CST)
From: Andy Yan <andyshrk@163.com>
To: heiko@sntech.de
Cc: hjc@rock-chips.com,
	krzk+dt@kernel.org,
	devicetree@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	derek.foreman@collabora.com,
	detlev.casanova@collabora.com,
	robh@kernel.org,
	sebastian.reichel@collabora.com,
	Andy Yan <andy.yan@rock-chips.com>
Subject: [PATCH v16 0/7] VOP Support for rk3576
Date: Mon,  3 Mar 2025 11:44:14 +0800
Message-ID: <20250303034436.192400-1-andyshrk@163.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: PSgvCgC3Oc2lJcVnaJliJg--.43523S2
X-Coremail-Antispam: 1Uf129KBjvJXoWxGry7uFyftrWxGryUJryDGFg_yoWrCFW8pa
	ykG3s8XrWkKr1jqan7tw1xCr1SqanxJr13Cr93K3W3Ja1DKF1UKrWS9F1Ykr9xGr12vrWj
	9F4Fy3W3K3W2vF7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07UlfOcUUUUU=
X-Originating-IP: [58.22.7.114]
X-CM-SenderInfo: 5dqg52xkunqiywtou0bp/xtbB0hMFXmfFIit1YgAAsm
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250302_194506_474875_88097A5E 
X-CRM114-Status: GOOD (  14.56  )
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

From: Andy Yan <andy.yan@rock-chips.com>

Here is the v16
Patches that have already been merged in drm-misc-next are dropped.

I test it with a 1080P/4K HDMI output with modetest and weston
output.

If there are some one want to have a try, I have a tree based on
Linux 6.14-rc1 here[0]

[0]https://github.com/andyshrk/linux/tree/rk3576-vop2-upstream-v16

Thanks.

Changes in v16:
- Link to v15: https://lore.kernel.org/linux-rockchip/20250218112744.34433-1-andyshrk@163.com/
- Rebase on drm-misc-next
- Switch to dev_err_probe
- Remove redundant empty line

Changes in v15:
- Link to v14: https://lore.kernel.org/linux-rockchip/20250212093530.52961-1-andyshrk@163.com/
- Remove AFBC/AFBCD prefix of TRANSFORM_OFFSET register
- Remove redundant blank line before function vop2_lock
- Fix nr_regs arguments for smart windows register.

Changes in v14:
- Set maxItems constraint of clocks for rk3588 to 9 as a recently
  merged patch added two optional clocks[0]:
  [0]https://patchwork.freedesktop.org/patch/msgid/20250204-vop2-hdmi0-disp-modes-v3-1-d71c6a196e58@collabora.com

Changes in v13:
- Add maxItems constraint for clocks
- Remove constraint for interrupts in allOf block, as the current
  maxItems is already 1.
- typo fix
- Explain the function of this property.
- Use maxItems constraint for clocks in allOf block

Changes in v12:
- Only change the description method for existing SoC.
- Split from patch 10/13
- Split from patch 10/13

Changes in v11:
- Remove redundant min/maxItems constraint
- Remove redundant min/maxItems constraint

Changes in v10:
- Move interrupt-names back to top level
- Add constraint of interrupts for all platform
- Add constraint for all grf phandles
- Reorder some properties
- Move interrupt-names back to top level
- Add constraint of interrupts for all platform
- Add constraint for all grf phandles
- Reorder some properties

Changes in v9:
- Drop 'vop-' prefix of interrupt-names.
- Add blank line between DT properties
- Remove list interrupt-names in top level
- Drop 'vop-' prefix of interrupt-names.
- Add blank line between DT properties
- Remove list interrupt-names in top level
- Drop 'vop-' prefix of interrupt-names.

Changes in v8:
- Fix dt_binding_check errors
- ordered by soc name
- Link to the previous version:
  https://lore.kernel.org/linux-rockchip/6pn3qjxotdtpzucpul24yro7ppddezwuizneovqvmgdwyv2j7p@ztg4mqyiqmjf/T/#u
- Fix dt_binding_check errors
- ordered by soc name
- Link to the previous version:
  https://lore.kernel.org/linux-rockchip/6pn3qjxotdtpzucpul24yro7ppddezwuizneovqvmgdwyv2j7p@ztg4mqyiqmjf/T/#u

Changes in v6:
-  More specific explanation about the AXI_BUS_ID register bit of
   cluster window.

Changes in v5:
- Add axi id configuration
- Remove the non-existent CBCR scale register.

Changes in v4:
- describe constraint SOC by SOC, as interrupts of rk3576 is very
  different from others
- Drop Krzysztof's Reviewed-by, as this version changed a lot.
- describe constraint SOC by SOC, as interrupts of rk3576 is very
  different from others
- Drop Krzysztof's Reviewed-by, as this version changed a lot.

Changes in v3:
- Add comments for why we should treat rk3566 with special care.
- ordered by soc name
- Add description for newly added interrupt
- ordered by soc name
- Add description for newly added interrupt
- Share the alpha setup function with rk3568
- recoder the code block by soc

Changes in v2:
- Add dt bindings
- Add dt bindings
- Add platform specific callback

Andy Yan (7):
  drm/rockchip: vop2: Register the primary plane and overlay plane
    separately
  drm/rockchip: vop2: Set plane possible crtcs by possible vp mask
  drm/rockchip: vop2: Add uv swap for cluster window
  dt-bindings: display: vop2: describe constraint SoC by SoC
  dt-bindings: display: vop2: Add missing rockchip,grf property for
    rk3566/8
  dt-bindings: display: vop2: Add rk3576 support
  drm/rockchip: vop2: Add support for rk3576

 .../display/rockchip/rockchip-vop2.yaml       |  99 +-
 drivers/gpu/drm/rockchip/rockchip_drm_vop2.c  | 259 +++--
 drivers/gpu/drm/rockchip/rockchip_drm_vop2.h  |  88 ++
 drivers/gpu/drm/rockchip/rockchip_vop2_reg.c  | 954 ++++++++++++++++--
 4 files changed, 1223 insertions(+), 177 deletions(-)

-- 
2.34.1


