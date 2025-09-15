Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B659ECAC59D
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 15 Sep 2025 17:18:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=X+NwuRrfiPqH6UBOQ7Zlv4C0tAGMSybv7BRSufDxwMc=; b=V206ZZ3qqD4hyS
	tKeJvzJFWbAD9Owzr17EQzpIMe/7vdVijkRgadDSpVy+J4Q0T10nkkiiy0zGwlhr49yNLy+eOl4kD
	UHUbUkE1QM8u25RIkQ3X21AuKumPvlyKRyQifdmtskLR9EX7zWZwkXetWKVza9tkDPBoFwgDc9A8p
	TrwJty7Mio4nLi3PBp7u/q9App3jEa5Bks20vpNfqVqScPo5aNYF66tymHYzcNnD1ppmYoNPr8Ziq
	jrMazJoFdcPBpwyZkRAs0cKa16CiPKMaHRvPYd5quMF2E+JCVyZ6O08QP46lS2vZrlx170SUgmr7j
	krtZ4xF6fRM6f5osb+Ig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyCqf-00000005FPS-10aB;
	Mon, 15 Sep 2025 17:18:41 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyCqb-00000005FL3-1qew;
	Mon, 15 Sep 2025 17:18:38 +0000
Received: from [192.168.0.172] (mob-5-90-56-182.net.vodafone.it [5.90.56.182])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 41DDB710;
	Mon, 15 Sep 2025 19:17:17 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1757956638;
	bh=TKUNoFfaG7mUu050VdbIYJIxqktZZZ2hBbKcgYdK2GI=;
	h=From:Subject:Date:To:Cc:From;
	b=DzFm2SUQEqFHw196ty5KYeMEPz4ZMbRvfE/r7cGshGsqu7Jz8bHsrE1arlH4Sdb8Z
	 CQXwAcfiwZlG7NzEGUZIjY+SC0Z90pRVm5Wr9pNCb/tCqDLQ1fUY081B6zCfca3rT4
	 uR6pWuxob6+udUmK9dXAZGXt4EV3Lc0+CFLOD49k=
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Subject: [PATCH v5 0/8] media: Introduce V4L2 generic ISP support
Date: Mon, 15 Sep 2025 19:18:09 +0200
Message-Id: <20250915-extensible-parameters-validation-v5-0-e6db94468af3@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAFJKyGgC/43OTWrDMBAF4KsErasy+jGSuso9ShfSaNQIEjtIR
 iQE3z1yoDSLhnr5BuZ778YqlUyVfexurFDLNU9jD8PbjuHBj9/Ec+yZSZADGBCcLjONNYcj8bM
 v/kQzlcqbP+bo5/7M0SqRTBoQIbDOnAulfHlUfH71fMh1nsr10djEev3B7f94Exy4SygNOjTS4
 j5H8nUaw+RLfMfpxNaOJp9cARtc2V1DaJ2whFqrF676da1wG1y17o0IYJW2QcELVz+5cste3V0
 FiQbvHAaR/nCXZbkDmPsnT98BAAA=
X-Change-ID: 20250701-extensible-parameters-validation-c831f7f5cc0b
To: Dafna Hirschfeld <dafna@fastmail.com>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Keke Li <keke.li@amlogic.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Heiko Stuebner <heiko@sntech.de>, Dan Scally <dan.scally@ideasonboard.com>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Antoine Bouyer <antoine.bouyer@nxp.com>
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
 linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 Jacopo Mondi <jacopo.mondi@ideasonboard.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=5208;
 i=jacopo.mondi@ideasonboard.com; h=from:subject:message-id;
 bh=TKUNoFfaG7mUu050VdbIYJIxqktZZZ2hBbKcgYdK2GI=;
 b=owEBbQKS/ZANAwAKAXI0Bo8WoVY8AcsmYgBoyEpp6lTZEj3KM8EMTSZiL/v1T7U+vwHuOifKT
 GmpXp02U7iJAjMEAAEKAB0WIQS1xD1IgJogio9YOMByNAaPFqFWPAUCaMhKaQAKCRByNAaPFqFW
 PKd3EADGfGXT5SOJKgthvh7rOhjWsh7Cck/r4ls+Pd3x/0QdkEXjLLQ2hFoZVkKuHGXBEuaqk6k
 H47OVMKIJ2utKlWHjptg9AIVSRLfo/oK1sQvuhYs8rbSJs5eR5BNG0gWDFORTg+GX0GFAuQRg2x
 dAvAOZz/9T87s3V4SV6NmgWEpJnmsWFebcc4fhoQFekuBainH1sk1erHUZZ7GyFbf4JpU5hp9vJ
 kKepyfeIHvjRKrOozb67BOclEjlhQlz6z0hv/nV6gTVKPsCingIcVnDKZK+d607v6RlGgWBDuSS
 hJgyOwwV4E6nAzdq90Wzb+/xPfafUmM/g2bjFfkUo1efF9czMDGozBjzfrqJ8qSnrTFS8p8Fdxm
 Xbmrl0Lp02zYn7q0X/L5g+Mksa1WCJjdym9+trUdWqA4ObfJ3koDGjPD+pqiEN6oCiPhKg9hJuI
 hXKDXrbrKOqzbXdyIX7BICCli8jNvzDde41FmlibzspabBTmf89S+nxtshxflJ6lU6oBhTEmxcJ
 cyec73JeU/m5v2PTmMBRSN8n9vJQLp2rqdsvdpmYuw+n2kHuPuqlfbgc0DL1wiOXDq+Qit+PLkV
 2rzxuibT7rPlbUQLi3iA/lE9xDxnCdV+SCssO5hyBcsBaoCbp85Wwyfe73oIm5WqCN/2CwKA6PP
 pW6F1jiBna3yQNQ==
X-Developer-Key: i=jacopo.mondi@ideasonboard.com; a=openpgp;
 fpr=72392EDC88144A65C701EA9BA5826A2587AD026B
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250915_101837_626655_04925480 
X-CRM114-Status: GOOD (  15.41  )
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

Extensible parameters meta formats have been introduced in the Linux
kernel v6.12 initially to support different revision of the RkISP1 ISP
implemented in different SoC. In order to avoid breaking userspace
everytime an ISP configuration block is added or modified in the uAPI
these new formats, which are versionated and extensible by their
definition have been introduced.

See for reference:
e9d05e9d5db1 ("media: uapi: rkisp1-config: Add extensible params format")
6c53a7b68c5d ("media: rkisp1: Implement extensible params support")

The Amlogic C3 ISP driver followed shortly, introducing an extensible
format for the ISP configuration:

6d406187ebc0 ("media: uapi: Add stats info and parameters buffer for C3 ISP")

with a very similar, if not identical, implementation of the routines to
validate and handle the ISP configuration in the ISP driver in the
c3-isp-params.c file.

fb2e135208f3 ("media: platform: Add C3 ISP driver")

With the recent upstreaming attempt of the Mali C55 ISP driver from Dan,
a third user of extensible parameters is going to be itroduced in the
kernel, duplicating again in the driver the procedure for validating and
handling the ISP configuration blocks

https://patchwork.linuxtv.org/project/linux-media/patch/20250624-c55-v10-15-54f3d4196990@ideasonboard.com/

To avoid duplicating again the validation routines and common types
definition, this series introduces v4l2-isp.c/.h for the kAPI
and v4l2-isp.h for the uAPI and re-organize the RkISP1
and Amlogic C3 drivers to use the common types and the helper validation
routines.

The v4l2-isp abstraction will be augmented to support statistcs as well.

If the here proposed approach is accepted, I propose to rebase the Mali
C55 driver on top of this series, to use the new common types and
helpers.

I have been able to test this on RkISP1 but not on C3.

Thanks
  j

Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
---
Changes in v5:
- Move everything to v4l2-isp prefix except from format documentation
  which still is about 'extensible-parameters' (to be paired in future
  with extensbile-stats)
- Simplify documentation and move it part to the driver-api
  Documentation
- Remove 'group' and 'features' from the generic handlers definition and
  adjust rkisp1 accordingly
- Link to v4: https://lore.kernel.org/r/20250820-extensible-parameters-validation-v4-0-30fe5a99cb1f@ideasonboard.com

Changes in v4:
- Fix the definition of V4L2_PARAMS_FL_PLATFORM_FLAGS
- Add __counted_by() attribute to the data[] flexible-array member of
  v4l2_params_buffer
- Minor style change
- Link to v3: https://lore.kernel.org/r/20250819-extensible-parameters-validation-v3-0-9dc008348b30@ideasonboard.com

Changes in v3:
- Rebased on latest media-committers/next
- Take in Dan's suggestion in block size validation
- Documentation minor spelling fixes
- Link to v2: https://lore.kernel.org/r/20250710-extensible-parameters-validation-v2-0-7ec8918ec443@ideasonboard.com

Changes in v2:
- Make v4l2_params_buffer directly usable
- Centralize ENABLE/DISABLE flags definition and validation
- Take in Dan's v4l2_params_buffer_size()
- Allow blocks to only contain the header if they're going to be
  disabled
- Documentation fixes as reported by Nicolas
- Link to v1: https://lore.kernel.org/r/20250708-extensible-parameters-validation-v1-0-9fc27c9c728c@ideasonboard.com

---
Jacopo Mondi (8):
      media: uapi: Introduce V4L2 generic ISP types
      media: uapi: Convert RkISP1 to V4L2 extensible params
      media: uapi: Convert Amlogic C3 to V4L2 extensible params
      media: Documentation: uapi: Add V4L2 extensible parameters
      media: v4l2-core: Introduce v4l2-isp.c
      media: rkisp1: Use v4l2-isp for validation
      media: amlogic-c3: Use v4l2-isp for validation
      media: Documentation: kapi: Add v4l2 generic ISP support

 Documentation/driver-api/media/v4l2-core.rst       |   1 +
 Documentation/driver-api/media/v4l2-isp.rst        |  37 ++
 .../media/v4l/extensible-parameters.rst            |  97 +++++
 .../userspace-api/media/v4l/meta-formats.rst       |   1 +
 MAINTAINERS                                        |  10 +
 drivers/media/platform/amlogic/c3/isp/Kconfig      |   1 +
 .../media/platform/amlogic/c3/isp/c3-isp-params.c  | 248 ++++--------
 drivers/media/platform/rockchip/rkisp1/Kconfig     |   1 +
 .../media/platform/rockchip/rkisp1/rkisp1-params.c | 441 ++++++++++-----------
 drivers/media/v4l2-core/Kconfig                    |   4 +
 drivers/media/v4l2-core/Makefile                   |   1 +
 drivers/media/v4l2-core/v4l2-isp.c                 | 108 +++++
 include/media/v4l2-isp.h                           | 100 +++++
 include/uapi/linux/media/amlogic/c3-isp-config.h   |  86 +---
 include/uapi/linux/media/v4l2-isp.h                | 100 +++++
 include/uapi/linux/rkisp1-config.h                 | 104 +----
 16 files changed, 793 insertions(+), 547 deletions(-)
---
base-commit: 0e2ee70291e64a30fe36960c85294726d34a103e
change-id: 20250701-extensible-parameters-validation-c831f7f5cc0b

Best regards,
-- 
Jacopo Mondi <jacopo.mondi@ideasonboard.com>


