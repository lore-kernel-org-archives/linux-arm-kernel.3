Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44F59E7717F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Dec 2024 19:35:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=rc3A45HXeJQe2ZrNhLH0eDGKZhhxeva5GyE+y6Wopp0=; b=tgCr1E/LhGvMnO4I0ex+FseeR9
	Gi5OD7cueCJr9lSN4WJxXjSJkt9TRbdH9ziwa6PJipe0U3vhcPTI2RkfmFyP2Hpb9fH4+ZheLwtXr
	1hWa1ntx16hkw8AxKe2HRXrWZJDh1l0cKjRO0K/rw9UuXhxHnkJU55frnrenGsXCv4GqXsB3Su5MH
	7GraiVp04mpgag7m184ua6nuMwyJBspHRfYMQxJxAs1lF5HU24p92yoj7unGdAOXJ4HgOf9u4mr5A
	EiktUWRCmTeXsOFJLp+3kVoLi+gm6rDGyyQsW/eqrMEPEIRtDgyqeMlmU2YHAGka70NmKh9QMKIg4
	uxrOKK0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tNdLe-0000000Edgt-3fmF;
	Tue, 17 Dec 2024 19:35:14 +0000
Received: from mout.gmx.net ([212.227.15.19])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tNdKZ-0000000EdcK-1bzV
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Dec 2024 19:34:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.net;
	s=s31663417; t=1734464040; x=1735068840; i=wahrenst@gmx.net;
	bh=rc3A45HXeJQe2ZrNhLH0eDGKZhhxeva5GyE+y6Wopp0=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-Id:
	 MIME-Version:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=hl1hOxnRhQulMdEiZci8H+sA9aCmFv7x8ce9yTOGklHPF/gFNe/9tXdqUkwU+oHP
	 SvPDyMRrVxGoaNW69QE0hEX5E0xSq3bUZ+JumXA+gSkp/RzfvJrfVfntT9cCR5mHV
	 o25RtoIbGNn/shZxCsHkYUnO/3oJMxDqOns7XejkiqlgEKqQ5EPDhK/tEj+Y4V9I6
	 EoHqX+mE284tJ+C2tIOWhgzSlcfNrZB/50WUVurLgmfPUsmQl+YYCu36wwbVo6R9F
	 EBLiLgYVvBR2DifROJRk1vVhkmehianU1n4JPYkbcl4eIVMX0lF2L1DDPtV3gFBo+
	 RF12lq0ZFCnY05qz6Q==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from stefanw-SCHENKER ([37.4.251.153]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1N7QxL-1tdgP70mPl-00v3aT; Tue, 17
 Dec 2024 20:34:00 +0100
From: Stefan Wahren <wahrenst@gmx.net>
To: Florian Fainelli <florian.fainelli@broadcom.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>,
	linux-arm-kernel@lists.infradead.org,
	bcm-kernel-feedback-list@broadcom.com,
	Stefan Wahren <wahrenst@gmx.net>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: [PATCH] arm64: defconfig: Enable pinctrl-based I2C mux
Date: Tue, 17 Dec 2024 20:33:56 +0100
Message-Id: <20241217193356.111102-1-wahrenst@gmx.net>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:b0ElINEPTudl9AjrBS+bhNigngHkwaUnuAz7DYhyFcVgTiX5jg9
 mRm/Tfr4H5OXVg8pbhwJ089WbfvJqAEWmAAPoEqiNS0GLruwedi6DqSfP3CQZlgRrmfrDOY
 +RgB4XM6ZquOg3iOQsWGRjUOOCUuOgMUMlxG5kUmWX6HscvpLCVL4Mg4vLRYfzugB7u/tIO
 XnA/mVvtDyok33U0m1sgg==
UI-OutboundReport: notjunk:1;M01:P0:1h9uOzM7bqI=;AEaVtfMgz1Ngxv/pySQZ932zaer
 mXOR2WNBbpo1dSE95jis/UuseQlsBzuUc+K8w0Mz+O4506UYoamQ4er30IZ5zLpkUkThaElKM
 l21+Lo9NpJ4g2cKwiOGjW8GXCR+/7LaZlhL8zkUJAZ4m4x3+xvBJQG/0aqvnFChKUSnizZKJ+
 Ct6BWkIYGOOYXLsKSh+cBhmItVBxYtXHcI5NxMIA61iD61IsvMmJdhhliuFym0nsKfY7siw/9
 kT0TlW/OJIq4pjZNKpZyL8TSPHBbtUgroK3WpD+rOjFmV2E7q2bSJ39OgokH5OJv4aORiMJXT
 0g+jzh3f1LfAnpWdqMmsH41fn8QAhcOaD/Wixq2P7FwczlR1yoQV4zPLNV6VlJ7+wxqCgqyju
 E2jl3ltCJKKy0QmHJIVay5GjhBnmVsfAFFVy//LIQoj/9uuG9QYUrcJ61lEi8amhnfSwvi9JB
 m34+IrGsaz1NneFD6ydUfga1qPDvBtLQGSbny3q9047XaNxfirQsSCQ6ft/cohzgTVHiEbytx
 CQr27FCDr+COeDLdRB+UobgyMG03ZLX7onRCOYrMY1nI3kt0ZvwSKwSjGllUJ4arOCWa7LjD3
 gEY/ALXFu0HYCbCBqjrXyz49dxbbUdImmZb2SSehNHvYbqT+I8XT+cPNp0kA4QwWHkqq++x1w
 4iJqbrnl5EA9g29V0R48lBcylhrZOiJ7IEk6Jzm6uyIgWdyqmSOqkWsUH6X8yOGinB+f3sRn9
 qkwW0fMyWwtRUUKp8EelMwHQpP78zoznHr0QmPaPuAcnGu4t0StNTLhug83JVF8IwBCmC2J8X
 YhkdH1PA4Y2DA0/g4tnl+16hZrtilwalec3GLwnYUdm9P00DLlMUVHa45sfo1qpaCLodPLBOI
 6trhClnB3qZvLf5B0PK6tT2bwYNvkC4I1IAwgg1Z0PUcVRg7UOCtdvvL623vawzXMqD8ofxso
 POLA7WnSRPps0LUNaMlo+G1RXr/aCNsuQcsBMyldA8BFy4wR+mootphiurFhXTXiRPjfRUtUN
 7VMpfwHhUcLikw6C/2lJRSmkWFTMwov6o0NbUyBE3Ei6n1GGgxS64zJ2Mj66jzdRjbr8bE1Ok
 dzv3qbyo16WXFKkeddb1dHJWTCSNpb
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241217_113407_710070_8CE86B72 
X-CRM114-Status: UNSURE (   7.38  )
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

The commit 84b1d6cc3e4c ("ARM: dts: bcm2711-rpi: Add pinctrl-based
multiplexing for I2C0") introduced multiplexing for I2C on BCM2711-based
Raspberry Pi boards. Unfortunately we missed to enable the necessary
driver in the defconfig.

Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Link: https://lore.kernel.org/linux-devicetree/961b3d43-b4c9-4573-82d7-844=
aa129d994@notapiano/
Signed-off-by: Stefan Wahren <wahrenst@gmx.net>
=2D--
 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index c62831e61586..0fee3848d03a 100644
=2D-- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -516,6 +516,7 @@ CONFIG_TCG_TIS_I2C_INFINEON=3Dy
 CONFIG_I2C_CHARDEV=3Dy
 CONFIG_I2C_MUX=3Dy
 CONFIG_I2C_MUX_PCA954x=3Dy
+CONFIG_I2C_MUX_PINCTRL=3Dm
 CONFIG_I2C_BCM2835=3Dm
 CONFIG_I2C_CADENCE=3Dm
 CONFIG_I2C_DESIGNWARE_CORE=3Dy
=2D-
2.34.1


