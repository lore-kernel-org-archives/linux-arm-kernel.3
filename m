Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4CD58C5B572
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Aug 2026 07:47:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=+wlLfGsWdr8phAtVLv97nZ0UPHdHbGHGBacvXoI9xCQ=; b=Pe/xwsDDoY/Qu7knizoztfJsX6
	5TKb2IWZ75MC+BDztPM2OUnkm8O/FOaCIIRZw/TIjNxpgQmITyyUt9JsYbI3dscZEFSoGKJSjRMiB
	XimV+QHJ8TmTmHDHBxVPN1UpIdOutB3Qtf8LZNki/HEmPnQXQ0PEqpsU2u03DLO71VisK+xFESqmO
	SfOxZ+CuP79R9YI7wfjvrCvzYX2HV2QNpSZh7OcZp+XRsg7tV/NCdCwKFHDU5KSfktYfIwC5CHhu5
	rirmEdNtQqFgXBgxsJEou6yJUwiheCHi7B5oHTA2D0XSRNsmsMkLpMpUnkDvL80/bGeGMlhgCDmn0
	MssKyPpg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wumd8-00000002CjY-2AfR;
	Fri, 14 Aug 2026 07:47:06 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wumd6-00000002Cip-3n2M
	for linux-arm-kernel@lists.infradead.org;
	Fri, 14 Aug 2026 07:47:06 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-4953de5be0aso5251255e9.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 14 Aug 2026 00:47:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786693623; x=1787298423; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=+wlLfGsWdr8phAtVLv97nZ0UPHdHbGHGBacvXoI9xCQ=;
        b=Hd82nhsfQ5L9mt34RsClyGmf52bq4TeX/SCKCNOyhcIdiaNU2ak5IoO4AGXqmh2gez
         wW5JleDJqyRzfBK7IgDLlJgCQYUq92F3Lc8CzhZtDlfYhHs9IpD1Ndmd6Yt4ikkzMVdF
         C4BKZ6B7sRvyU0xjdYDhr1aUKh3yLC1x/hWjSVH8Wr8WZkyb0OSovo4nzpO2EIe1wEJP
         eKLEHfUoWB87g2ign8MMKZ9Jpjxj5CYainFHkz8xD/HHK4rhHIraYsnZnlblBDfxYESE
         EjVtDTs/cPyHw3bGuG+fiLwPePOtoDKJOzuQQa2m8P08Hxb+yJBWbeRhV678Ujlz2LW9
         Pk4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786693623; x=1787298423;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+wlLfGsWdr8phAtVLv97nZ0UPHdHbGHGBacvXoI9xCQ=;
        b=awMuknCAGnqydyvXvRXLPwmGOQJpZtp8RRMCMOE7xfdHY2dx6RVaa6GqARqHaUnBIm
         5KmfIOpwchkrUusiIbweS27zMrBTSBYYG8V2lovYGq8wxkIJAvhdDs6qeNEL336UJiDD
         BNcbv/nOKSOTuZVoTerTfwmlehQBlnsVxdgwNjDFUYGtTHvYS8racyh7hlbSnOqSthkq
         eGMTRpJVI5zMqzg8J8KBx0ZefRSx5Qrj35TU7b9mxKbmP/lvnrzP/gdjgFMxGm7Dus/6
         v8D10livdjcncXdPsMrWwE0J74262gkq4uvpu9mFuIlNv48ojfvlNJrv1Gy6SPE157yG
         SX/g==
X-Forwarded-Encrypted: i=1; AHgh+Roq4AIpq6dOKWjijHFjTc9nMZZPVOgWIvY+G4VqCUXYKiHyisO/0Ka3AOHb8Qo8ZRcX8C0/xl+wm7Dlb+OAx1JF@lists.infradead.org
X-Gm-Message-State: AOJu0YwFza8bPFlH1j9AoIZdM6HxQVD2T0TNybBDJq3uVyFUj1mKSlDh
	GhIufWXnnckOifGaLaEGquVpEKVCqvbSOtIYafd+2f3eruzsDzrUMBH6
X-Gm-Gg: AR+sD12uImXEShqlNtQItqaWaZRRnIy2pP5JCLVvZMNovAXRTZx1QM7iYYwiGtPssKh
	+0Mb5mZJpvSb4ifN484LlAGz9CiyfHPJQ2zdhqjKhB9P5uRYXfaRg5V5/Ko7L3sYFl2ljo5tnDY
	tMCztjOc6RLGenfxI9oYrGb5yRUO6B4cNcTi12RVZphcYXZ2Td+q+jIc60RyhC77IipTwvSBr9j
	fxUdhukogI6p6BwvAllzH+n/c1Pr7b+FdWlzXzgSFDnnNhZxasE3dbh6JkYPsrQJ5jk/B+AJMfs
	8D8/zip4YHBzadTKUw8OlWIEXUdwbhte5nNHEC8Wsgpb1KaeL4B685iEC9fxn3pIKDX6GItfDFE
	evwiME/wc0lvSmM9La0Vd/kivbOY5gJccWwSn2x9sFqKguHSrjdDymtLVbryyVFr/fJq5yyCTCz
	9ZoH6tbm474L9IzSCcbIAf2s/8hmaf/kLfHSA5uJmvo7sGgs5h4x00DCs0qcsM78CeAQ==
X-Received: by 2002:a05:600c:3496:b0:493:f318:3bc6 with SMTP id 5b1f17b1804b1-4998796e478mr55812165e9.13.1786693622590;
        Fri, 14 Aug 2026 00:47:02 -0700 (PDT)
Received: from deb05.proceq.com ([213.160.61.66])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-499899b5f86sm8172825e9.5.2026.08.14.00.47.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Aug 2026 00:47:01 -0700 (PDT)
From: Mehmet Fide <mehmet.fide@gmail.com>
To: Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>
Cc: Frank Li <Frank.Li@nxp.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Stefan Agner <stefan@agner.ch>,
	Fabio Estevam <festevam@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Francesco Dolcini <francesco@dolcini.it>,
	linux-arm-kernel@lists.infradead.org,
	imx@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Mehmet Fide <mehmet.fide@screeningeagle.com>
Subject: [PATCH v5 0/4] ARM: dts: vf: Iris carrier board for the Colibri VF50 and VF61
Date: Fri, 14 Aug 2026 09:46:56 +0200
Message-ID: <20260814074700.2491256-1-mehmet.fide@gmail.com>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260814_004704_960569_243D5188 
X-CRM114-Status: GOOD (  17.40  )
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

From: Mehmet Fide <mehmet.fide@screeningeagle.com>

This adds a device tree for the Toradex Iris carrier board carrying the
Vybrid Colibri modules, plus two small preparatory patches for the
module-level dtsi that the i.MX Colibri variants already had.

Tested on a Colibri VF50 on an Iris V1.1, most recently on 7.2-rc7
plus this series.

Changes in v5:
- drop the kernel version from the test description in patch 4
  (Krzysztof)
- collect the Reviewed-by tags

Changes in v4:
- gpio-line-names packed four per line (Frank Li)
- keep the EXT_IO pin group applied next to the carrier hog group
  instead of overwriting pinctrl-0 in the Iris dtsi, verified in
  pinmux-pins on hardware (Sashiko review)
- enable pwm0/pwm1 like the evaluation board does; both chips
  register on hardware (Sashiko review)
- the compatibles keep their hyphens; Krzysztof asked for hyphens in
  every newly introduced compatible in the v2 review

Changes in v3, following Krzysztof's review:
- fold the Iris compatibles into the existing -on-eval enum entries
- use hyphens in the newly introduced compatibles
- drop the fixed 5V regulator that only fed the VBUS regulator
- sent as a fresh thread instead of in reply to v2

Changes in v2:
- add the dt-bindings patch for the new compatibles
- describe the USB host VBUS regulator instead of hogging USBH_PEN

Good old times indeed. You did this job before me and pulled me into
Linux in the first place, so having these patches reviewed by you
closes a nice circle. I seem to be following your path in every
detail by now, the hairline included. The tiny board is still out
there measuring every day. Thanks for the reviews!

Mehmet Fide (4):
  ARM: dts: vf-colibri: apply the EXT_IO pin group
  ARM: dts: vf-colibri: name the SODIMM gpio lines
  dt-bindings: arm: fsl: add the Colibri VF50 and VF61 on Iris
  ARM: dts: vf: add Iris carrier board support for Colibri VF50 and VF61

 .../devicetree/bindings/arm/fsl.yaml          |  12 +-
 arch/arm/boot/dts/nxp/vf/Makefile             |   2 +
 arch/arm/boot/dts/nxp/vf/vf-colibri-iris.dtsi | 126 ++++++++++++++++++
 arch/arm/boot/dts/nxp/vf/vf-colibri.dtsi      |  56 ++++++++
 .../boot/dts/nxp/vf/vf500-colibri-iris.dts    |  14 ++
 .../boot/dts/nxp/vf/vf610-colibri-iris.dts    |  14 ++
 6 files changed, 220 insertions(+), 4 deletions(-)
 create mode 100644 arch/arm/boot/dts/nxp/vf/vf-colibri-iris.dtsi
 create mode 100644 arch/arm/boot/dts/nxp/vf/vf500-colibri-iris.dts
 create mode 100644 arch/arm/boot/dts/nxp/vf/vf610-colibri-iris.dts


base-commit: 3d6d817622b0a9721e3cc404df3469171582be13
-- 
2.54.0


