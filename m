Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7AE12CA5FFC
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  6 Oct 2026 16:28:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=iyS59LHL863YniTBRLDQIsOwBigLIOw+B5p59bUiqbM=; b=AyjPBqsFuXjzqldHxTzfvC1S9i
	CETihry7cxKxfGDF1kV6e9QFiYKRn/SgiWD7jDgHlBfSaR1YmgoHk47HStOFLI6e7cEDpX/KrfuL2
	0gDgB2KS+pp+Wy3I+vjmZZ+JnCiBWDvTR8g65Z/DVj8hCE6rGxzlk7J67G12HrBqYAh1X0c5Obbi+
	miF+k/O7a0zzrsMwhabLAFEJbnFyqUEI0+QOgx2VQe4tINVbSurUBJqzZtPU9r4oY0aN/u+rYUloy
	vRMSx2CqFLUNFI/zAYtMqGAVGBkkmfcNy/ybU2rjQB6az1gLkSEuHDG9J9+84hzmwhbT969hp5KP+
	Nr07m+cg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xE81c-000000018PT-49LJ;
	Tue, 06 Oct 2026 16:28:21 +0000
Received: from mail-pz2-x09.google.com ([2607:f8b0:4864:3b::9])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xE81a-000000018OU-2IRh
	for linux-arm-kernel@lists.infradead.org;
	Tue, 06 Oct 2026 16:28:19 +0000
Received: by mail-pz2-x09.google.com with SMTP id 41be03b00d2f7-cc7c6cc3513so501294a12.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 06 Oct 2026 09:28:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791304097; x=1791908897; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=iyS59LHL863YniTBRLDQIsOwBigLIOw+B5p59bUiqbM=;
        b=s+4N9H+UkIKQDngEpuTUHfAlSDiS09UyeGZL2yQrlKO1rmjA6iqQxpR7UQvKHnM49K
         dBT0sdvS3bPOXKVjz6HewVOliqzOfSTFMZlB0c7zQxj48qfYOZQldjr8mkgFyudd+Mpm
         HaXJY45sHkfjFFIen1JT5D6pvIwDrVtHUUotIcvK1gEvFsYNo2UtiFEyVPVBVMjo9FBU
         hOFeX0BpsRRE6eNzRiPb4I3+amgyD9OYxM2IT5mxLoBb2vVEXg5H7mpJMKXgL/7B/Uw7
         D2J7xsbZ8x6kZO8vIevQ/4AlBCD7TTFCn5hcrCT4gdcmHscgbycnAt/XQS/r6mWtWszw
         IOCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791304097; x=1791908897;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iyS59LHL863YniTBRLDQIsOwBigLIOw+B5p59bUiqbM=;
        b=Hs4kmTpmAbmmdX4kxV51c3g3Vr6goTHonaND70Jnh3QJ5V5rFVW3TjupiPCC+AvfCx
         XmNFwBfVFfm1NPHIxYiVqojS/jpOo5K+cdgJ/0aQ43zN+Ydk2LmsNpY++rF2WOxm3Mkm
         cofdW45vhwyE5zbnI5CFRefS+oFZuP95/+Kf/22IY1APBusz96mKQs0atlbEHwBc1EUF
         K0L2pdqBu+cA5ViRvtJd5CWQ+YuId1yCtfZBDF6nu45XuF8275CNcIfEUbbNHS6MimWZ
         ZXfIQCiGd+oqIby/KYov6tCBv9necSQ+v++lo9mbRfldm6+nFHErEDQ5uu2d1anNWMUi
         gR2A==
X-Forwarded-Encrypted: i=1; AKwUvBxbIQ1Rx4dsDyORjUA1qns+hTULqwgeZccg2txAcMGeYLOhJxYgN21unLErtXLHTPlCaLx8fuYQT1XKhIXrYTMR@lists.infradead.org
X-Gm-Message-State: AFq9FYK2Yta1bJBD0YtxNuZ6p7Ikx/bjJBs1qzshdrpbTPzEGw47Ce9N
	ieGfMy+Hf+audf+9Sv8cKYVkLJVYvNJ40QQ8PebLy79qU1YVvU3al73Z
X-Gm-Gg: AYBFou31zwOg8CLx49uo/DfxgYA9ouW9PivANvJNFQrqvThAPUWNimn7JppPHbQiIcC
	DUoNW3VDl0DOGBE1kYKttr9Ch+w+OwgTELuQcKdCHfZ4y2i0mft07QwRllvlaORjkk3VBIRRvkc
	Ts5ZbGHPR/sSZvt4c3ECxB307Hlowyf551oy1emRcb5f8Xox2tmyE/THJvx2vXYv2cVd+Up3Dym
	M0x32Rz2yx6OPKKm7W799gcF6/9LHB9PHwLKLzVuQKldrIPPzWMZi9neKqk+7XmSXMGRdjNLBsy
	u+tvbUDsBaTBp3XJ50okIdIHAi5Z+4+FEa2oOtZ48ZN8lzr5FTx3tmAr4HtEiZJ7AbfQWVuyYR8
	Z2QYCy/itMGCYQ6mFfJEbPHl/tjGzJxA3yJGwdAMy/mW1QSTX+QCgAJ61MWFIhgvPZX74LNpm1C
	3Mbi7MONFVnWXkmCOHBoD+p3zL3aOcDNhHBAlr0nSol/sIFS6mX2iRrdkdDSJftsbGUFWq
X-Received: by 2002:a05:6a00:3cc7:b0:881:f5e1:6e8c with SMTP id d2e1a72fcca58-890df4ab129mr1783463b3a.33.1791304097548;
        Tue, 06 Oct 2026 09:28:17 -0700 (PDT)
Received: from server.lan ([168.138.199.194])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-89188a0d603sm259898b3a.19.2026.10.06.09.28.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Oct 2026 09:28:16 -0700 (PDT)
From: Coia Prant <coiaprant@gmail.com>
To: Vinod Koul <vkoul@kernel.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Coia Prant <coiaprant@gmail.com>
Subject: [PATCH v13 0/2] phy: rockchip: naneng-combphy: add SGMII MAC selection for RK3568
Date: Wed,  7 Oct 2026 00:28:04 +0800
Message-ID: <20261006162807.2843858-1-coiaprant@gmail.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261006_092818_589666_3040BCAE 
X-CRM114-Status: GOOD (  13.33  )
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

Changes since v12:

- Only write pipe_sgmii_mac_sel when the property is present, leaving the
  routing unchanged otherwise (Shawn).
- Validate the value in the driver and reject anything other than 0 or 1
  (Shawn).
- Drop "default: 1" from the binding; the property is tri-state, so no
  'default' in the schema is appropriate (Rob).

This is the PHY part split out from the v10 RK3568 SGMII series, sent
separately to linux-phy as suggested by Vinod and Jakub.

On RK3568, the SGMII interface can be routed to either GMAC0 or GMAC1 via
the GRF register pipe_sgmii_mac_sel. Patch 1 documents the
"rockchip,sgmii-mac-sel" DT property, patch 2 adds the driver support.

From the RK3568 TRM (Part1, Page 229), PIPE_GRF_XPCS_CON0 bit 1
(pipe_sgmii_mac_sel) is defined as:

    0: SGMII routed to GMAC0
    1: SGMII routed to GMAC1

The hardware reset value is 1 (GMAC1). If the property is set to 0, the
driver routes SGMII to GMAC0; if set to 1, it routes to GMAC1. If the
property is absent, the driver leaves the routing unchanged, so the
effective value is whatever the bootloader or hardware reset left.

This is necessary for boards such as the Ariaboard Photonicat, which
uses the SGMII interface connected to GMAC0.

The DTS changes using this property are sent separately to
Heiko/linux-rockchip, and the net-next parts (XPCS glue, dwmac-rk SGMII
support) are sent separately to net-next. There is no hard dependency;
the pieces can converge during the merge window.
---
Coia Prant (2):
  dt-bindings: phy: rockchip: naneng-combphy: add rockchip,sgmii-mac-sel
    property
  phy: rockchip: naneng-combphy: add SGMII MAC selection for RK3568

 .../phy/phy-rockchip-naneng-combphy.yaml      | 13 ++++++
 .../rockchip/phy-rockchip-naneng-combphy.c    | 42 +++++++++++++++++++
 2 files changed, 55 insertions(+)

-- 
2.47.3


