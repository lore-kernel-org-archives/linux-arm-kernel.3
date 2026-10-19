Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5921CCCF2D3
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 19 Oct 2026 11:18:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=gU+rM/4AoM2OmLlkODpIkEr5BcTOLpyqHtt4WEM8bII=; b=Dve9yg1T6JCAFp
	TcLFCVpFSHQIOHd4CDY9JW/OrH1FLH5kPD3K0AQKoshVAliUJqfLPWkYi1ZydYDjM3eJKgdKKuzG5
	S/C5OGhV2K0X5d+DXik60OlYbfFPk5FLU4T8QHvcvf19gAABP5dTxpXKWXA30kt7R98M8g/sNbWZs
	iFhw0XWPS2y8yaw2ii0j4o56KojhKz5JlHMlHD+QV8AtzmVvdx45SsxLBn8E/8eRiUdLZx8hm6NDW
	G0WY2v56cyezdI2pwabQCLzPXASeUuuYioSf1kS8AHX+I7tfM1o76bWCPWkZu+Dbmyp8xuyLTaBEL
	89wpEju67XVoijyCUbpg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIlO8-00000007H0O-2B4h;
	Mon, 19 Oct 2026 11:18:44 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIlO7-00000007Gzm-0QWZ
	for linux-arm-kernel@lists.infradead.org;
	Mon, 19 Oct 2026 11:18:44 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-4a1df4c0966so8199395e9.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 19 Oct 2026 04:18:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792408720; x=1793013520; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=gU+rM/4AoM2OmLlkODpIkEr5BcTOLpyqHtt4WEM8bII=;
        b=NZZkY7MjCb0E3VE44MOE2lvFKkW782ahpie56odOJSsAu57gomtL7qZQK6gEH2lO8n
         CHYkSS6Dz/gbJCqaCKHrd++eLBrmo3aaP8meNUgFfTHWI5DUza+UMFFhZqi6ZAvUQmxI
         /yyEuEqEd8gr4zF+zb0dkmnyYAwQ4pGrWByoPCmjlGzAIpVkBJJBnE9X0c/7SiOBAOGq
         CW9MxX61rSRB1U7ppFWLz0hyPEWewkfObdj/5Etp0EgxVAPchAqitihUQm82ghgY764H
         wcfNOH+ZcnB1x0zf5P8PQXf6wcyi4pSFZJsyP776Fr78eV2/UFSFQpiawtDGAGqJQHDO
         pT1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792408720; x=1793013520;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=gU+rM/4AoM2OmLlkODpIkEr5BcTOLpyqHtt4WEM8bII=;
        b=x7ySkaJzrlzAISz8eSDoRko3uvQg7G7LebWSu8nbHPr+kIcDT8VR9CrOE6i8X0rCyp
         nCsgGIdIbR+b0fmEPpc92xlxcUgPaJILnZn1HLZeQFURkzwsj2TXmoa2gKi/3foP7W9M
         tOvDFMTPJKBVPZH+MCJdH301Mk9/4hqy4a5TIIYLu9i6v/79iXZbeCj9FwRv3fQuhQ2J
         1hViXUV9d1z/HgccjxSJKkUJaNf7Iqf7afin6RGQWuJUfhsewDI1lBj29GDvIHo+rtet
         fc1hA5Tizv8NL0L76hJkBzMBGr6sBAs58c52FGnwfhTOwQyz+hqfZXVFNYLnajPsdj1T
         pSCA==
X-Forwarded-Encrypted: i=1; AKwUvBxfciY3lO6hPZF5q3tPzGuNbGLjpRKHM+mhfFhJwEY2Jf4e+2tarSDs87RSJjg+d0NTxCyEomg+/CPavIr7IFCV@lists.infradead.org
X-Gm-Message-State: AFq9FYIsXTRE//mgafSVCFcUmTiAy0maJFU0AMWr0UjFSMxEPhK5rRdf
	e9x8Fral/yxsZvdCO4FIeHRn4E+wu2NPOZFPODTY1gDmDExKtWG7ZO4k
X-Gm-Gg: AYBFou1j2oZVPA2tEYVb/XegmuJdJ7gzrFxAd+z3AD0MyHmyjmpcGFxC4iWWjVboOpx
	rKehfmgYPnjpVKjiWnm2z3j5mMszA/n+3DI1PN0fiT7Ffo0fn0Co5w6JPUU7cJ11i6QuG1zUPTJ
	MVJHUN3MoaqzjW94hWxNpqoW6PhT9TFm+VdwyuYurBNrJSQxCJa6CqglEgpHNR8IQVBsoXFp+XQ
	4EbSUiG12QatiWCANPOe8Ukt3F4pZpEn91vxTOnUCZBt6esxz0cY3RTdZzF9ZgiXyVmdTCXy11Z
	BgdB5ovPfj4n8vM7rl8iLOrYMbb1JTyo83OUpufMXZBgot4iTGChfp5WQSexrY3TdvhfjLUAqSM
	hK1fZs+FjhC2sYp42dsa8ML1ovpAy83dxI35PvGboNC90v/kYIxroFRxcLGx1bW0ccK8SmxicCC
	o3zurkYDq4c++eUfuJAfZDqws1S4UYvvc64KKC0bARNLCgBxTEh63TQtSPFQYvx4epZ/q/EH12v
	LSMJ7PQS6KYjqTtgX2gbxpsnOsLzVums74JAKkuFEDKY+NxBY/GblF+T1OOwfPuHWlET8IHnTT7
	SdwYrdI6vG5zSZNjgTYvnQ==
X-Received: by 2002:a05:600c:1f83:b0:4a0:20b4:ba93 with SMTP id 5b1f17b1804b1-4a1d7612128mr156524285e9.16.1792408720439;
        Mon, 19 Oct 2026 04:18:40 -0700 (PDT)
Received: from [10.0.0.136] (248.201.173.83.static.wline.lns.sme.cust.swisscom.ch. [83.173.201.248])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1e3ebb3aasm193183505e9.0.2026.10.19.04.18.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 04:18:40 -0700 (PDT)
From: Antoine Gouby <antoine.gouby@gmail.com>
Subject: [PATCH 0/5] ARM: dts: Add Colibri iMX6 overlays
Date: Mon, 19 Oct 2026 13:18:29 +0200
Message-Id: <20261019-colibri-imx6-overlays-v1-0-e4d028727382@toradex.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/x3MSwqAMAwA0atI1gZs0fq5irioNWpAraRQFPHuF
 pdvMfNAIGEK0GUPCEUO7I8ElWfgVnsshDwlgy60UYVq0fmNR2Hk/TLoI8lm74C2mmxT0jgrXUN
 qT6GZr//bD+/7AXR7kt5nAAAA
X-Change-ID: 20261019-colibri-imx6-overlays-a5da84ebf127
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, 
 Francesco Dolcini <francesco.dolcini@toradex.com>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Antoine Gouby <antoine.gouby@toradex.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1531;
 i=antoine.gouby@toradex.com; h=from:subject:message-id;
 bh=sibS6+PbzNU0PLhMfzlVYE7Xqoew+WZ9iiOgUjlOo0c=;
 b=owGbwMvMwCWm0rPo7MxLN2YynlZLYsi6+qdvk9Gbh8e+i0/dPTuiabXL8+MPu7zneko6NZo6H
 ysSLHX07ShlYRDjYpAVU2TJeKIqyKcQIuvB0ZwMM4eVCWQIAxenAExkxg6G/3miV6822KTwsHi/
 N39z4Ihps1nPpVmfIizZXEQvOy1/sIuRYcshkQVL3rQvK9EX3+EabK0vOzHaqKks+vDdX4uZy4O
 YGAA=
X-Developer-Key: i=antoine.gouby@toradex.com; a=openpgp;
 fpr=68E425110E20541D48088363248CA2CD99D2D899
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261019_041843_163071_85A2ED5F 
X-CRM114-Status: UNSURE (   8.82  )
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

This series adds device tree overlays for the Colibri iMX6 SoM. The
overlays cover HDMI, VGA and parallel displays.

The series adds support for:

- HDMI Displays
- Toradex Capacitive and Resistive Touch 7" Parallel Displays
- VGA Displays

The Makefile entries build the standalone overlays as DTBOs, and add
ready-to-use composed DTBs for selected carrier boards and accessory
combinations, for build-time coverage.

Signed-off-by: Antoine Gouby <antoine.gouby@toradex.com>
---
Antoine Gouby (5):
      ARM: dts: imx6dl-colibri: Add HDMI overlay
      ARM: dts: imx6dl-colibri: Add Toradex Capacitive Touch Display 7" Parallel
      ARM: dts: imx6dl-colibri: Add Toradex Capacitive Touch Display 7" Parallel with Touch Adapter
      ARM: dts: imx6dl-colibri: Add Toradex Resistive Touch Display 7" Parallel
      ARM: dts: imx6dl-colibri: Add VGA overlay

 arch/arm/boot/dts/nxp/imx/Makefile                 | 85 ++++++++++++++++++++++
 arch/arm/boot/dts/nxp/imx/imx6dl-colibri-hdmi.dtso | 27 +++++++
 ...nel-cap-touch-7inch-parallel-touch-adapter.dtso | 57 +++++++++++++++
 ...6dl-colibri-panel-cap-touch-7inch-parallel.dtso | 38 ++++++++++
 ...6dl-colibri-panel-res-touch-7inch-parallel.dtso | 29 ++++++++
 arch/arm/boot/dts/nxp/imx/imx6dl-colibri-vga.dtso  | 67 +++++++++++++++++
 6 files changed, 303 insertions(+)
---
base-commit: 2efb7a11f1aa4d2dc285fe2680cca22cb9f72f64
change-id: 20261019-colibri-imx6-overlays-a5da84ebf127

Best regards,
-- 
Antoine Gouby <antoine.gouby@toradex.com>


