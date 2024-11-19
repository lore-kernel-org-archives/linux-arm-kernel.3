Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4007D44157
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 19 Nov 2024 13:32:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=CwSrNWXTaOvTSfS5toosqs8SZ/vkl62iKBpjVyFO1BI=; b=kXdfbD/Z5C0slZAVOAulcIp8Di
	7TIjdfVOiJCc/ggEDTrdVw19gvvRPKrKIDEITe5z0WlpU30G84ZH3Wc2eNhINkvanV+E656Iatvws
	PBEKDN0LAilF3vimxMlMJuJvXI1Tu7v4rGCbGs7WZb/YEH9Puz2Z45YEc1+dw6aagVujLPOxqcRJ9
	Ky9giqrN1iyYBZPOtAvY+2FOPVqP2sC9P+5Gz6mwxH2Xd9z7rFfcxLqkczYt8+EWfi7qxvrcUf4aK
	hBrt8o1h7hjsqJayQx0qyzLR46dW4tKWaZwyQ7xFxwtzVb83FNCl2V/Bvpwje3dLRi2POVM/FP4sV
	hsPNAPOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tDOKh-0000000CW2B-2YrH;
	Tue, 19 Nov 2024 13:31:55 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tDOIr-0000000CVc8-1U5j;
	Tue, 19 Nov 2024 13:30:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:
	Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=CwSrNWXTaOvTSfS5toosqs8SZ/vkl62iKBpjVyFO1BI=; b=ffQuBpZRkJrsyKP0W2/ScBQULf
	6nF5GYWZ2sZrzNHF3uMMue57xe0HQ99W/h5hNCiBLcPg+lCCaRhXjjadGSdvQRHp7tBIDAnk1stnq
	/6bu1gHkw8mI21mgUZJNgOdnmRBXsEo/WruRv6n+V7D7fHsx02QNOKjaLW7E4bBnBs3iFHvy+WrLm
	dsH/0wbRXlTVh2dfa5VqqblVaSgkpFKC3AzywHpBEmgIBXg2lkDBQndWXQkW/z8vN/kgi+XsvYF5y
	mWZupjy94gCe8DGWJGxwTeRKev3ZMEUOrEobQkw8h9tmDyg253E8l/XEBrJ6eTVtUn8JAxpeXNst9
	VA9Q57ng==;
Received: from i53875a30.versanet.de ([83.135.90.48] helo=localhost.localdomain)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1tDOIm-0006z1-TJ; Tue, 19 Nov 2024 14:29:56 +0100
From: Heiko Stuebner <heiko@sntech.de>
To: srinivas.kandagatla@linaro.org
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	heiko@sntech.de,
	detlev.casanova@collabora.com,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org,
	sebastian.reichel@collabora.com
Subject: [PATCH 0/5] RK3576 OTP support
Date: Tue, 19 Nov 2024 14:29:11 +0100
Message-ID: <20241119132916.1057797-1-heiko@sntech.de>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241119_053001_394676_DC9E2F7C 
X-CRM114-Status: GOOD (  10.29  )
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

This enables OTP support in the nvmem driver for rk3576.

I expect to pick the clock patch (patch1) and the arm64-dts patch (patch5)
myself, after the nvmem-driver and -binding patches have been applied
(patches 2-4).

But kept them together for people wanting to try this series.

Heiko Stuebner (5):
  clk: rockchip: rk3576: define clk_otp_phy_g
  nvmem: rockchip-otp: Move read-offset into variant-data
  dt-bindings: nvmem: rockchip,otp: Add compatible for RK3576
  nvmem: rockchip-otp: add rk3576 variant data
  arm64: dts: rockchip: add rk3576 otp node

 .../bindings/nvmem/rockchip,otp.yaml          | 18 +++++++++
 arch/arm64/boot/dts/rockchip/rk3576.dtsi      | 39 +++++++++++++++++++
 drivers/clk/rockchip/clk-rk3576.c             |  2 +
 drivers/nvmem/rockchip-otp.c                  | 17 +++++++-
 4 files changed, 74 insertions(+), 2 deletions(-)

-- 
2.45.2


