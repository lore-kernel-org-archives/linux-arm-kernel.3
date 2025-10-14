Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14F48CCD18F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Oct 2025 08:01:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=d2aMv92Phy0rTf2dRS2nw1d+pfYeAuRbOR7OYIcVoSA=; b=UhWARv8/ZYtDHJ
	Oa/kKoTwSzkHtxrgAKqpfQGszuRnGNShAtho9QM1dIcme0N4TcD6z0cbcG8Jzw+ABf2jzgnZBOwvx
	8fCkixdKyoW0MIfUtaPbxf0kenM52ZGB62MDvrZwHyrPe0HigzYMLp3MX/4/L5hDaiUySLh94/MlA
	7OBFAqvbDjsOxnrF4jM/HCaJ4c65zNFFq+piMrDzKn3v6tWFGnNhnGNNcBtJF5XNtuv00Jrw/nydS
	crCQNU0UVxtZwPyHb9J52ol6/rg/7gYfFYWHwNAcKrFmugm1+w/d32bUpwsrOBZlda6gGba5ALWsR
	8fyka9+IQQctZ7uztU5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8ZyD-0000000FWq8-0TzA;
	Tue, 14 Oct 2025 08:01:21 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8Zy9-0000000FWoE-0dX3;
	Tue, 14 Oct 2025 08:01:19 +0000
Received: from [192.168.1.182] (93-46-82-201.ip106.fastwebnet.it [93.46.82.201])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 82760741;
	Tue, 14 Oct 2025 09:59:33 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1760428774;
	bh=yBFgeA9u02Yi9+0VS/oBb8STABvotvLYI8KT4LZTPQk=;
	h=From:Subject:Date:To:Cc:From;
	b=uJV6aLvvKs5sNImKeND8JRNHZguXhGEzynvij1YpMtoEeIdH5S9lWG0+IG6xMGW+Q
	 z4WelrHtVPZs8Y/3ZXLtIAXEM7xrvq/iJNyze6qKdyRpp+ZKrMJlc+QGYBERNX+NOC
	 FoLGRq8lnyXX4B9bXywCxhC13jD3sAaTU6gBK4mY=
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Subject: [PATCH v7 0/8] media: Introduce V4L2 generic ISP support
Date: Tue, 14 Oct 2025 10:00:52 +0200
Message-Id: <20251014-extensible-parameters-validation-v7-0-6628bed5ca98@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIADQD7mgC/43QTWrDMBAF4KsErasy+rOkrHqP0oU8GjWCxA6SM
 SnBd68SaJNFTb18A/O9Ya6sUslU2X53ZYXmXPM4tGBfdgwPYfgknmPLTII0YEFwukw01NwfiZ9
 DCSeaqFQ+h2OOYWrLHJ0SySaDCD1rzLlQypd7xftHy4dcp7F83RtncZv+4O5/fBYcuE8oLXq00
 uFbjhTqOPRjKPEVxxO7dczyyRWwwZXNtYTOC0eotVpx1cN1wm9w1e3eiABOadcrWHH1kyu33Ku
 bqyCRCd5jL9KKax6uF2aDa5pLXey91p0Lae0P3a8rAOwGt2uuSVb46JPyZP5wl2X5Bn6YOGePA
 gAA
X-Change-ID: 20250701-extensible-parameters-validation-c831f7f5cc0b
To: Dafna Hirschfeld <dafna@fastmail.com>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Keke Li <keke.li@amlogic.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Heiko Stuebner <heiko@sntech.de>, Dan Scally <dan.scally@ideasonboard.com>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Antoine Bouyer <antoine.bouyer@nxp.com>
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
 linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 Jacopo Mondi <jacopo.mondi@ideasonboard.com>, 
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=5897;
 i=jacopo.mondi@ideasonboard.com; h=from:subject:message-id;
 bh=yBFgeA9u02Yi9+0VS/oBb8STABvotvLYI8KT4LZTPQk=;
 b=owEBbQKS/ZANAwAKAXI0Bo8WoVY8AcsmYgBo7gNFW2i/Ij79z6GLHAlCu1SQNniCRvS+A0w/h
 XiN2fpYguWJAjMEAAEKAB0WIQS1xD1IgJogio9YOMByNAaPFqFWPAUCaO4DRQAKCRByNAaPFqFW
 PI5cEAC+LvUeJCDvL7UgZ3+iURdVzRot9hKbZAD679moLW7iRtCJMGjkTD3pWBaSu2y69loogrN
 d2OaXKk0Or/02HajmsLBf/lZIqHrEcV2944Hn9bQOjtroM+PUbOEGISX/5Pwbb14twfkPo5UcpU
 w3vYn1MkkZpKL9KRgcmOZ4MmDvjzCIZWA+gNbEy3fqeaD+SUtK8ASpzkioMLjgANhOC2S0nH+vQ
 HWYMckh8ldm345WNV2qTzYYSW5nIjqOkEgoPzVbYC93ZqfmGysJmlJaHe40kEx4RQ7jxSHgwj+x
 PZjIVgxctLOhrhEepHHSKlWIGwrsOd1bBW5aw7jP1mxcAc/0q2kXfH8kFuWjV6jxKwQKeynCdfJ
 34Zk1bqK0npC3Bt+mxUkoobzRoLhxOgTUbiQF2XhUiGUWCXt5SqKoLuz7tEQTkT2kWbzcBwe/6L
 SeWtQyRclZ/LkCvvUK4opEaUlLcb6z4ujTBCgBnqusi9n8DYV/qMYCSSLhiYU4rC/XfYXCtynSH
 kmrVlpiWqXts6r1uSoPTE8SqvASdWn7xKckEt/vMuNf42/OBQuIv/fiQ/hSTzJlv3yJ95D+ysL8
 GRDB6RirecYuk5G+SYFJz1DnW/sTqkz3KvppcRLW6/4LIfFk88PbtahUU/eub9OVtEE5JOzRgLV
 pnhOXaxzmLZL65g==
X-Developer-Key: i=jacopo.mondi@ideasonboard.com; a=openpgp;
 fpr=72392EDC88144A65C701EA9BA5826A2587AD026B
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251014_010117_333411_EB1059BA 
X-CRM114-Status: GOOD (  15.61  )
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

Tested on Mali C55 and RkISP1 with camshark

Thanks
  j

Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
---
Changes in v7:
- Moved version to the v4l2-isp uAPI
- Moved version check to the v4l2-isp.c helpers
- Link to v6: https://lore.kernel.org/r/20251007-extensible-parameters-validation-v6-0-5f719d9f39e5@ideasonboard.com

Changes in v6:
- Rename all symbols to v4l2_isp
- Changed the interface of the two buffer validation functions
- Reworked the rkisp1 and c3 porting accordingly
- Updated documentation
- I have moved v4l2_params_buffer_size() from uAPI because it was
  convenient for linux but not required in userspace
- Link to v5: https://lore.kernel.org/r/20250915-extensible-parameters-validation-v5-0-e6db94468af3@ideasonboard.com

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
      media: Documentation: uapi: Add V4L2 ISP documentation
      media: v4l2-core: Introduce v4l2-isp.c
      media: rkisp1: Use v4l2-isp for validation
      media: amlogic-c3: Use v4l2-isp for validation
      media: Documentation: kapi: Add v4l2 generic ISP support

 Documentation/driver-api/media/v4l2-core.rst       |   1 +
 Documentation/driver-api/media/v4l2-isp.rst        |  49 ++++++
 .../userspace-api/media/v4l/meta-formats.rst       |   1 +
 Documentation/userspace-api/media/v4l/v4l2-isp.rst | 121 ++++++++++++++
 MAINTAINERS                                        |  10 ++
 drivers/media/platform/amlogic/c3/isp/Kconfig      |   1 +
 .../media/platform/amlogic/c3/isp/c3-isp-params.c  | 124 +++-----------
 drivers/media/platform/rockchip/rkisp1/Kconfig     |   1 +
 .../media/platform/rockchip/rkisp1/rkisp1-params.c | 183 +++++++++------------
 drivers/media/v4l2-core/Kconfig                    |   4 +
 drivers/media/v4l2-core/Makefile                   |   1 +
 drivers/media/v4l2-core/v4l2-isp.c                 | 128 ++++++++++++++
 include/media/v4l2-isp.h                           |  91 ++++++++++
 include/uapi/linux/media/amlogic/c3-isp-config.h   |  92 +++--------
 include/uapi/linux/media/v4l2-isp.h                | 102 ++++++++++++
 include/uapi/linux/rkisp1-config.h                 | 107 +++---------
 16 files changed, 660 insertions(+), 356 deletions(-)
---
base-commit: 3a8660878839faadb4f1a6dd72c3179c1df56787
change-id: 20250701-extensible-parameters-validation-c831f7f5cc0b

Best regards,
-- 
Jacopo Mondi <jacopo.mondi@ideasonboard.com>


