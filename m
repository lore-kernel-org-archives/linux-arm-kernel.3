Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A53BCD6E4A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 29 May 2026 11:05:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=qE6RnHPAGUOc6JTeO2foqPr0MsIVa35llYbJ9yTYeCg=; b=xTVFsKlvJZl06a+zqQerZK9ScY
	2f5UYLLOBfC3ch0MRA27Y13hG+xQr9ra9H3Npu8w2fbQ+j2bsybhwke0AK5jT6XsVErTKTLIZKzWE
	3AkydMlYNDKpH3OQJsLgsRimfYEpCLJt/BpxkOxJYIg45AL/CbjtjF+wqAYv4zOoBBc3nlB1MAJ95
	UgrPgFB/Pyzj7Nac5qIJ0LE91TAlSeiOKlupnDnX7EK601yznkyfIC58UKAv4PajZn83NJslwr1OK
	yuRg6//NAzJjl8LS4OlmSBcexBRhLQ/Zfi9d7oqTakfC1Cxs0mvPNpIRgWBWwui1P/wkybv5MOgxi
	0tw57Dcw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSv1z-00000007F6d-3vsR;
	Fri, 29 May 2026 11:05:37 +0000
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSv1x-00000007F5x-0aTG
	for linux-arm-kernel@lists.infradead.org;
	Fri, 29 May 2026 11:05:34 +0000
Received: by mail-wr1-x429.google.com with SMTP id ffacd0b85a97d-45e8a834cc2so8506469f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 29 May 2026 04:05:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780052731; x=1780657531; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=qE6RnHPAGUOc6JTeO2foqPr0MsIVa35llYbJ9yTYeCg=;
        b=Mb/eh9TpSYD0FWsVdTqh90wr25NIKFKOduEXga66FG3zHm5llY3VUvD2nxNXey4WIP
         JGXBjSJ0R+5wmspwJ/KehQUNyyq5Wcjv5nzUmu3ql7EDHQ45D/I4st0gxW2wl9uqDfQT
         z+F/8gCVNC0cLMBSsU4IZSqnEt5WvJG90kvkYQFXPx4LNpxT08Ux+ECOmZb/LSwAy72B
         E7wtInKKVXPRKx+A/135UuqCKYMVQGdhF9xUFX4NcbuR2TDtYvaupowS4BSGEG4Q1O/z
         UZrs34TUXD1BuuxUMo/zuR5+VsuEYxShRfFv7aZ7PE+qW+3dvP0k2pk5WUMNqU4YiORW
         8WCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780052731; x=1780657531;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qE6RnHPAGUOc6JTeO2foqPr0MsIVa35llYbJ9yTYeCg=;
        b=Vg6v/S9kHlYLYB9KUZPqTeuzzzyQCwH9DbZtx4VSbB0scWWqpc/LcFeK0lsB+EkKuU
         YdwP2zgRZ0AglUhypaP1Rw/J/6k1RKmbx/jXg2AHhfp34FvH9A6ML2WMhyNwXDSRaI8V
         eeORU/AWJPc2d7hHLjz2j5POrQnjBnOi6nV+7AUwD5m6AXCEyhAG8XOfqtuBrkKz8ZfY
         4FmoWHgX7CWPZIHKTleX5PUwPNSzi4prUgeChauFJKNT//yzmWnxCO1M/Mlub/KD/k07
         cbeciS03uqq8CLrW3AKXSuzvLtoyhp4+nxUppB6E9Zemy0lcrrdyj5XolELi9JQ2gBJZ
         VdJQ==
X-Forwarded-Encrypted: i=1; AFNElJ9PNIsGReh3fY08j2oVucbgDYqQ6L/Hk9PDaIsPsu7P69wvh2Se1AJcfYqf7VFSfoF3hZ9kDu7IBeGF4Bh5NIzR@lists.infradead.org
X-Gm-Message-State: AOJu0YwyyAmiBttMSi1G7qpNKdRSWrcRfnLlp0vZ5ECI6iayAfLEOn+w
	8eybuSupugBa713wUbPHrVSQxJ6EqWXduZ6DLecVw0Oc4WTirIRqnZ/4
X-Gm-Gg: Acq92OHQOMfMww/8qPgabz7FQfHCpnj5G/xCzwpmKuSmtKek0jCTEZPwMRCEsf1tCFb
	vcydYVXu15fpWli6MPoGNipM3k1/EEtDshAkGCpBXH9xmm2y4kflB9aEgVDmWkPAZdrU2stV0f3
	m0ciA4crpkDBRDebVHs2L7idGA+siz5XU4LS2SlS85nNcdqVdUS8Ro2obFJgWDYyncf0Ef75hHW
	Cu31q2afqEWXf/wF/FQYm0tNUyEanMzPSz8HM/YQovzx5TpTvwi72CJk5J+7sLVHxK8JUtB3m99
	e7H0J6F/08pT7fuBxz3F52898X2ziILF0GMrfh4A5nRED/DX2C4gQchip4cDAuRdV26XOJY0dmq
	ljs26UVXbwEogU8p+/ECeTFnYhff8121GYPMf26xOTWcfIO0sO3fc048c23DwbInd/OQYtLTccB
	Dqm2Va12XsqodD7fLHGlttt/EicQBNyD+iSdHA
X-Received: by 2002:a05:6000:1a8c:b0:43b:5b25:67f8 with SMTP id ffacd0b85a97d-45ef144a48emr4457888f8f.20.1780052730683;
        Fri, 29 May 2026 04:05:30 -0700 (PDT)
Received: from vitor-nb ([2001:8a0:c4c6:f00:7677:753b:2cb5:7f25])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45ef34c3081sm3033663f8f.15.2026.05.29.04.05.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 May 2026 04:05:30 -0700 (PDT)
From: Vitor Soares <ivitro@gmail.com>
To: Neil Armstrong <neil.armstrong@linaro.org>,
	Jessica Zhang <jesszhan0024@gmail.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Nishanth Menon <nm@ti.com>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Tero Kristo <kristo@kernel.org>,
	Francesco Dolcini <francesco@dolcini.it>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Thierry Reding <thierry.reding@gmail.com>
Cc: Vitor Soares <vitor.soares@toradex.com>,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v1 0/2] dt-bindings: display: panel: Add LG LP156WF1 dual-LVDS panel
Date: Fri, 29 May 2026 12:05:18 +0100
Message-ID: <20260529110518.624454-4-ivitro@gmail.com>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260529_040533_220465_20034D4D 
X-CRM114-Status: GOOD (  12.81  )
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

From: Vitor Soares <vitor.soares@toradex.com>

Add support for the LG LP156WF1 15.6" Full-HD dual-link LVDS panel and
a Verdin AM62 overlay for using it through the Verdin Development Board
with the Verdin AM62 Mezzanine LVDS interface.

This is a follow-up to an earlier attempt [1], where panel-lvds.yaml
was incorrectly extended to describe dual-link panels. Back in 2023,
when a generic dual-channel LVDS binding was proposed, Rob Herring [2]
pointed out that dual-link panels should follow the existing
advantech,idk-2121wr pattern instead of introducing a new generic
compatible.

Following that approach, this series adds a dedicated binding for
lg,lp156wf1, with the dual-link LVDS ports described by
lvds-dual-ports.yaml, and excludes it from the generic panel-lvds
schema selection.
The second patch adds the Verdin AM62 overlay for the LG LP156WF1 panel
on the Mezzanine LVDS connector.

This series should be applied on top of [3] to avoid conflicts in the TI
device-tree Makefile with the other overlay additions.

[1] https://lore.kernel.org/all/20260521150038.103538-17-ivitro@gmail.com/
[2] https://lore.kernel.org/all/20230130170441.GA2796575-robh@kernel.org/
[3] https://lore.kernel.org/all/20260522161105.277519-13-ivitro@gmail.com/

Vitor Soares (2):
  dt-bindings: display: panel: Add LG LP156WF1
  arm64: dts: ti: k3-am62-verdin: Add Mezzanine with LG LP156WF1 LVDS
    panel

 .../bindings/display/panel/lg,lp156wf1.yaml   | 105 ++++++++++++++
 .../bindings/display/panel/panel-lvds.yaml    |   1 +
 arch/arm64/boot/dts/ti/Makefile               |   5 +
 ...verdin-dev-mezzanine-lvds-lg-lp156wf1.dtso | 131 ++++++++++++++++++
 4 files changed, 242 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/panel/lg,lp156wf1.yaml
 create mode 100644 arch/arm64/boot/dts/ti/k3-am625-verdin-dev-mezzanine-lvds-lg-lp156wf1.dtso

-- 
2.54.0


