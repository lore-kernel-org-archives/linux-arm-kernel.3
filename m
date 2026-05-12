Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44245CD4F38
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 12 May 2026 08:54:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=gIgKAZNxevefqCFUTH674T3+a5pG9FBGkTYT66x3UTw=; b=U7xtW/2Ny8vxYgTlCmEPRu8W5w
	hS0QHOL5GLijvHAdKIez4ZCmJXl3oGxfYEVow9UrvH0lC66gphjpLcgtdo+FNJrI1Q8eSanQZzQ/q
	AyaGoCxzPEuFh6g2WTGPvb7h66vIv3Q73R6PXmbvBt3nJmYG/KTUvqXjneRW1ttNahd3FzPN3IbiY
	nm6cC7UAwjX79I3UFl5jnVa3aZTtro0rAG86KOygLq88MEflw+bsrwVnIz50Lcl+giXIZS81Os5//
	jNbA9JfQC2tEud3n9+Nzqz1vPp+FJyI5KSek2bMEFjc/QVvNBVisX4foPZPUvd0u97Q77GPE70MML
	sXB9SAug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMise-0000000G98m-3hWw;
	Tue, 12 May 2026 08:54:20 +0000
Received: from mail-pg1-x530.google.com ([2607:f8b0:4864:20::530])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMisc-0000000G985-0Z05
	for linux-arm-kernel@lists.infradead.org;
	Tue, 12 May 2026 08:54:19 +0000
Received: by mail-pg1-x530.google.com with SMTP id 41be03b00d2f7-c8027e876fcso2124664a12.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 12 May 2026 01:54:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1778576057; x=1779180857; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=gIgKAZNxevefqCFUTH674T3+a5pG9FBGkTYT66x3UTw=;
        b=EJ/viv9skhk3bkocVfwgSHMuQiPxTuUabCTdxGWxLF1wqhhnnVquOay5rngUzI7bHg
         t0QioiXfBk0fuVXJ41J6SPk6dYCUvJRIfRLEx8DgAZJuPMq1a6e9x/2vFqNXn/XDP9Xw
         vtzVDtiZDFhf0pxpsiAvJNRYtWPTo05z+3Oog=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778576057; x=1779180857;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gIgKAZNxevefqCFUTH674T3+a5pG9FBGkTYT66x3UTw=;
        b=mODv2l1AKEDMG3nKNXU/tbJxAEUXEWpbtirOeXYSp1qtAW23Jqayj6S5tIt90z7xw/
         CBJfQODMCt/tSVh4/TnDHLg4ZmfhMJSaN/XpSc2rQ/90niqIlvJ9bruGUecISgazjr3c
         qGpeIPHey48P/W0OfUPgCmpummvUpSRpEXGREc3HBEiuRn0gCVOqqw01ALPfVLG2Kwtj
         MopOUz71twig60h9j9PQzpCj8uHPz5fMnp04BlbqAhLKwg58D/A9S/WINbwh+F4hRE/W
         H8u4RSGy2yVjgPqgxkQxt/PR4MwHGmrsfS1o6xBdm+AX7NAEOiJTzjnh7cD9NJWJv754
         GWLQ==
X-Forwarded-Encrypted: i=1; AFNElJ9uOBgZVYpv3FAQmsAyWViWGQUX6m9e5S0xdxd5tIuvxZJ50zBU2sSGL6Q5b1ycZCYjadrk3z0jfwA5kNckneer@lists.infradead.org
X-Gm-Message-State: AOJu0Yyy53aIiAlYn6gbtUDPQk48qlJKmow6FX8ydp2sLZxwKWVBgi9U
	rSOGgSAMGVuyv4lhjG8FHqptGaW1r8TnUlGFb8M+xK+nzLeJI7GBYltw7Xm4vtndoQ==
X-Gm-Gg: Acq92OHFOHLhHIHoZ0SPj0zRs9jb+GN3ZwNPFYo/zmR+HoIphTOPl8xX7wB8eiOfYo4
	SE5oOr3WEbpqgxm3VAr3CQQ5Tj66ry/OtYWMtt0SkKT6Vd++QYsaHgCWdt+W6Z1D1Z2zpKhpOFr
	Te1D3fZ143qVdw3VK89AIpB1JSmtJg0r6nwQz6DPnKn1+3CCYPk2o5s/g3bm2YtEwZGl6j3cxCp
	j5Z7ImIcDH3OVxCjIyqfzqbYhqt0JXLVSiIJs2zWDy9BQB0nBwRcpTaEqycFppQDP8yB0hYx8xg
	CGMe/kxKYalLpTkuS2GHePLElT24wPUlOlu7HNyVswN5wPRR8vYesiW9D1uT45qQO/oHM7m02ic
	mLp8919wfbA8bKF0tc3kaTkH4ZurPXxp5i0uboQw/8H0V6reSTHX7xtrMqui2Hyqy1SOVDFpA86
	Hvw/smHTUvRBri7AQJhjL337ubISAoGc7xyJkzy+VEFNafcik0jv4bbIi5evC6L2pccovImG/vz
	wEhusJa
X-Received: by 2002:a05:6a20:7fa9:b0:39c:787:f196 with SMTP id adf61e73a8af0-3aa5a99f496mr29462031637.16.1778576057122;
        Tue, 12 May 2026 01:54:17 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2a00:79e0:201d:8:6606:2bd2:159a:55e3])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c826771a8a1sm11136856a12.24.2026.05.12.01.54.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 May 2026 01:54:16 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Lee Jones <lee@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	devicetree@vger.kernel.org
Subject: [PATCH v3 0/6] regulator: mt6359: cleanup and add supplies
Date: Tue, 12 May 2026 16:53:48 +0800
Message-ID: <20260512085358.1693208-1-wenst@chromium.org>
X-Mailer: git-send-email 2.54.0.563.g4f69b47b94-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260512_015418_308730_93A82CBA 
X-CRM114-Status: GOOD (  21.71  )
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

Hi,

This is v3 of my "MT6359 PMIC cleanup and add supplies" series.

Changes since v2:
- Fixed vsys-smps-supply property name (from "vspms-supply")
- Collected reviewed-by on patch 3
- Included Lee in recipients (sorry about that)
- Link to v2:
  https://lore.kernel.org/all/20260429074113.3720271-1-wenst@chromium.org/

Changes since v1:
- Moved regulator supply properties up to the PMIC mfd node
  - This requires moving the properties to the mfd bindings
- deprecated vcn33_[12]_(bt|wifi) regulators and added vcn33_[12]
- model the deprecated ones as downstream to the new ones
  (vcn33_[12] -> vcn33_[12]_(bt|wifi)
- Handle internal supply of vbbck directly in the driver, instead of
  specifying it in the binding
- Added patch to constify data structures in the regulator driver
- Link to v1:
  https://lore.kernel.org/all/20260320072440.2403318-1-wenst@chromium.org/

This series is part of a broader collection of regulator related
cleanups for MediaTek Chromebooks. This one covers the MT6359 PMIC.

The MT6359 PMIC is similar to the MT6358 and MT6366 PMICs. I've done
cleanups for those in the past.

Patch 1 adds the names of the power supply inputs to the binding.

Patch 2 drops the restrictions on the regulator-name property from the
binding. The name of the supply rail ideally should match the design
schematics, not the PMIC's output name. The DT should be free to set
whatever name it needs.

Patch 3 deprecates the vcn33_[12]_(bt|wifi) regulators, and adds new
proper vcn33_[12] regulators. The two *real* VCN33 regulator outputs
each have two enable bits that are OR-ed together to control the
output. This allowed WiFi and BT stacks to separately control power
output without coordination.

Patch 4 constifies the data structures used throughout the regulator
driver. While not directly related, it touches the same context and
it is easier to include it in the series.

Patch 5 adds the supply names from the DT binding change in patch 2
to the regulator descriptions in the driver. This patch has a whole
bunch of checkpatch.pl warnings, but I wonder if it's because the
context size for checking complex macros is not large enough.

Patch 6 implements the changes of the DT binding change in patch 3.


One part not yet covered in this series is the removal of the *_sshub
regulators. These are not actual regulators, but a set of separate
configurations to be used by the low power sensor hub or embedded
controller. How these combine with the standard set of configurations
set by the main processor is TBD.

Device tree changes will be sent separately. The goal is to get the
regulator tree as complete as possible. This includes adding supply
names to other regulator DT bindings, and adding all the supply links
to the existing DTs.

Please have a look.


Thanks
ChenYu

Chen-Yu Tsai (6):
  mfd: dt-bindings: mt6397: Add regulator supplies
  regulator: dt-bindings: mt6359: Drop regulator-name pattern
    restrictions
  regulator: dt-bindings: mt6359: Deprecate bogus vcn33_[12]_* split
    regulators
  regulator: mt6359: const-ify regulator descriptions
  regulator: mt6359: Add regulator supply names
  regulator: mt6359: Add proper ldo_vcn33_[12] regulators

 .../bindings/mfd/mediatek,mt6397.yaml         |  50 +++
 .../bindings/regulator/mt6359-regulator.yaml  |  52 +--
 drivers/regulator/mt6359-regulator.c          | 400 ++++++++++++------
 include/linux/regulator/mt6359-regulator.h    |  10 +-
 4 files changed, 339 insertions(+), 173 deletions(-)

-- 
2.54.0.563.g4f69b47b94-goog


