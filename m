Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02CF5CCF2CF
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 17 Oct 2026 20:00:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=AUA0BTD/dwmRkkig+Oe4GFBMuEGY8bqGFrhilsgKZsg=; b=JPuw/9cQHfyvF6
	w31RW4dxWtem0lqTBhUfiYPHPrcGSmFKR1azKlK3DoGpxUA73PuE4ex17MGr25Gphcc89UzPw/SWY
	cFTORMnDoKMLLar+dII5NeasChKZmQv5/pGLpx2yWbQ8Q2+YxhLQyeAmCw3a6SKSdD6fpqZKR+ytv
	lsjLDO8ZYFxRJh3kwrVmMzLY4djj+grpmFLCtZT0MkhWpKRrYGasOjzvDindfNqfgzXJupJeNAGqZ
	dDYGph7YY6cfAhtxJ/8u2MYWqCv7X+7h9gMaH3+9cCuKSoPm4aXWMXlrL8LTwb9tAZdGJjeeyD0qw
	uBj/9jv2lUnOo1BSBaWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIAZZ-00000005Byu-1UZq;
	Sat, 17 Oct 2026 20:00:05 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIAZM-00000005Bph-2mSt;
	Sat, 17 Oct 2026 19:59:52 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 67B55400FE;
	Sat, 17 Oct 2026 19:59:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0D7C51F000C8;
	Sat, 17 Oct 2026 19:59:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792267192;
	bh=AUA0BTD/dwmRkkig+Oe4GFBMuEGY8bqGFrhilsgKZsg=;
	h=From:Subject:Date:To:Cc;
	b=BOfktHj4SP/vcJ+nbzJOrQ9OGzo0UAC/oZeCXSg6NRv0kfkW/0kqihEVrt1oBpO7n
	 LlXDXkVOy7plfV0UdE+94Y0T1mYu1ZqHInMssmA5Zc8zV5TXncWX6lVoNQb3gNgjyi
	 K7UPchaJY8cEHaFO6Lb5oBNT64pakI7RY7O3sB0I76qtOGCJR/vMiKg6MTEVMhkpmW
	 JGofn3n603Losfpa2nAoKcmNW0sVo7d4xlERlFN3RiO8gYSjHUuoxpdZapLg0amisd
	 kOvSn4EIaoQkfLp4SwNLXGYivqA98yQ7H1kNb1BvsvoOKicm8v6OEJ1h3ILQQ+K8mG
	 yX9iHA1k0BWgA==
Received: by venus (Postfix, from userid 1000)
	id E3E7E182304; Sat, 17 Oct 2026 21:59:47 +0200 (CEST)
From: Sebastian Reichel <sre@kernel.org>
Subject: [PATCH v2 0/4] Add DP AltMode VDO definitions for DT usage
Date: Sat, 17 Oct 2026 21:59:29 +0200
Message-Id: <20261017-dp-altmode-dt-defines-v2-0-7ab3d93553dd@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/3WNTQ6CMBBGr0K6dkxboQRX3sOwmLaj1AAlbSUaw
 t0tGJcuX76ft7BIwVFk52JhgWYXnR8zyEPBTIfjncDZzExyqQQXHOwE2KfBWwKbwNLNjRRBIlb
 YlLpWt4rl7RRy8Np/r+2X41M/yKTtbGt0LiYf3rt4Flvv5yj/OGYBHLSqatNoRaU5XYzve9Q+4
 NH4gbXrun4AOT6NEdAAAAA=
X-Change-ID: 20261010-dp-altmode-dt-defines-2aa5a94b76f5
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-usb@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 linux-arm-msm@vger.kernel.org, kernel@collabora.com, 
 Sebastian Reichel <sebastian.reichel@collabora.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1990;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=PqfTqC8qpNn6JfjpApf6oEqRdK+CHCueyoPGAQnMDOk=;
 b=owEBbQKS/ZANAwAKAdju1/PIO/qaAcsmYgBq09OynXNuLyXyyQ5SWVxxDRwRhaVi3cCrJivmP
 fdaX9EONICJAjMEAAEKAB0WIQTvZg0HRj+Lcmp5VBPY7tfzyDv6mgUCatPTsgAKCRDY7tfzyDv6
 mnaVD/9GZlzEU1l9TiOtXfrV/MQlaTWxf0iCbR7yaV7e/6EuJKJDsC5/mJ5iFk+HTRhrzUKoK6J
 1Hl5VxN05xaQnu9OUbYSllPjpmhwNRvucLHMLhx6S0o3pR+cTAT4zUzu3zYXPvYyoHaUcMRp9cN
 sGkddOJthw2d9mYOio5ytXPaRGERM5ZYNcmOucYcKioo7c/9cW5PoJ7OAHhiptX6cnLeciiMXj2
 QdYauYw8uSAqTubsY8MfeYCNGj7HUNhhkkqmewejr0JUu1+hGg9lSn7qttHv+ROwmiujoNIGBMz
 4ta52lmQ+oIMp9/BFjI/8/e62vKohG4gyZnjndVZKi3BkQIKgf1MZ8Rnv9IApg5Np/iLvwLLp5f
 Bm7pdQs57S7Xswf+i/+EJKzFhfVTWL3Y9krkuLoQTCTUpTe79AlWOjwmE7RV6iydtaa1zbAykS8
 C55Ppj09pwIA8/FAYVjE8KpO43w3Hyg58/JeBLhLrNlfkEN+hlNKK+L7+NRTNctdqbf8VocxAIw
 y10G4p6sdK7klh2oTIz3h/KfaRrN1pg/mioKNJ86j1/iTSxVfb0qD56MjXjwYDMyhCFz43XN81F
 IRTQrU+xNdttbjeMIKl/+va80lj4G3PwmRxT7viuPVAfu9oisyNUPt3uWpTVFZKF+WuDtfw+W1I
 MHONLfDDYHHuD5w==
X-Developer-Key: i=sebastian.reichel@collabora.com; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A
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

Make DP AltMode devicetree entries more readable by adding a few
defines. This hopefully helps to correctly describe the supported
DP AltMode when boards are being upstreamed. Apparently right now
all upstream boards with DP AltMode *should* have set their VDO to
0x00001c46, which means that they can output DP1.4 with C, D or E
pin mapping on a receptacle that also has functional USB 2.

The patch series is based on current master.

Changes in v2:
- Link to v1: https://patch.msgid.link/20261014-dp-altmode-dt-defines-v1-0-b657c9b6e4c3@collabora.com
- s/USB_DISPLAYPORT_SVID/USB_SVID_DP_ALTMODE/ ; I initially
  used the former and somehow missed updating the Mediatek DTS
  before sending out the patches
- Collect Reviewed-by from Dmitry Baryshkov and Konrad Dybcio

Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
Sebastian Reichel (4):
      dt-bindings: connector: Add DP AltMode VDO definitions
      arm64: dts: rockchip: Use DP AltMode defines
      arm64: dts: mediatek: Use DP AltMode defines
      arm64: dts: qcom: Use DP AltMode defines

 .../boot/dts/mediatek/mt8390-genio-common.dtsi     |  8 ++-
 .../boot/dts/mediatek/mt8395-genio-common.dtsi     | 10 +++-
 arch/arm64/boot/dts/qcom/qrb5165-rb5.dts           |  8 ++-
 arch/arm64/boot/dts/qcom/sm8150-hdk.dts            |  9 +++-
 .../dts/rockchip/rk3576-anbernic-rg-vita-pro.dts   |  8 ++-
 .../boot/dts/rockchip/rk3576-armsom-cm5-io.dts     |  8 ++-
 .../boot/dts/rockchip/rk3576-armsom-sige5.dts      |  8 ++-
 .../boot/dts/rockchip/rk3588-rock-5b-5bp-5t.dtsi   |  8 ++-
 .../boot/dts/rockchip/rk3588s-indiedroid-nova.dts  |  8 ++-
 include/dt-bindings/usb/pd.h                       | 58 ++++++++++++++++++++++
 10 files changed, 115 insertions(+), 18 deletions(-)
---
base-commit: 58161ead29e50d70a317ea26b472e0c7508e69da
change-id: 20261010-dp-altmode-dt-defines-2aa5a94b76f5

Best regards,
--  
Sebastian Reichel <sebastian.reichel@collabora.com>


