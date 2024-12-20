Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55992E7718A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Dec 2024 11:13:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Xsz5HN/Gm6vz86vevKnGFWkVhhUxca+JtK1d2I18t4M=; b=kWD37kuPMQ6L2+M7tpZMdnBnFl
	6YzjC2Ku2O81buE2m7uotJGUQCyX9WgKRPljKEGrZeI4ci80XATKfAi+QwosPPRCkloHusM66XwMb
	B1eIO139OnYzkHKztAcqS9FOPGHSpkRgSP4CJ54+Va4S65z3kVHdTT9jVkMIVGmgADWOHLOloLlGV
	N2AIrDBOzrVz2UQEVgI4wyrgpeQh0fKSyOh/E4L4fNOnj+e8btqw6Nz6w/olXPmud4j5G5b+edp/Z
	OKzYTHVxU7ilBKwMZJgAOWBlFQT5NRoPqDmEjWIeO3fIScyIEOG0KakcZouc3MabWifD8jRZZuff+
	+2G+bilQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tOawJ-00000004gzJ-1I2v;
	Fri, 20 Dec 2024 11:13:03 +0000
Received: from mail-m1973178.qiye.163.com ([220.197.31.78])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tOaP2-00000004c0b-0xY3;
	Fri, 20 Dec 2024 10:38:42 +0000
Received: from localhost.localdomain (unknown [58.22.7.114])
	by smtp.qiye.163.com (Hmail) with ESMTP id 65699807;
	Fri, 20 Dec 2024 18:38:36 +0800 (GMT+08:00)
From: Kever Yang <kever.yang@rock-chips.com>
To: heiko@sntech.de
Cc: linux-rockchip@lists.infradead.org,
	Kever Yang <kever.yang@rock-chips.com>,
	devicetree@vger.kernel.org,
	Conor Dooley <conor+dt@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-gpio@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH 04/38] dt-bindings: pinctrl: Add rk3562 pinctrl support
Date: Fri, 20 Dec 2024 18:37:50 +0800
Message-Id: <20241220103825.3509421-5-kever.yang@rock-chips.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20241220103825.3509421-1-kever.yang@rock-chips.com>
References: <20241220103825.3509421-1-kever.yang@rock-chips.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZQ0kfTVYdQ0hCQ0xLH0JKTUNWFRQJFh
	oXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0tIVUpLSU9PT0
	hVSktLVUpCS0tZBg++
X-HM-Tid: 0a93e3a5d73a03afkunm65699807
X-HM-MType: 1
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6Nj46HBw5PDIKKgg1ThwIMSgP
	TiEKCkNVSlVKTEhPTUJKSkpMQkJCVTMWGhIXVRAeDR4JVQIaFRw7CRQYEFYYExILCFUYFBZFWVdZ
	EgtZQVlOQ1VJSVVMVUpKT1lXWQgBWUFDSUI3Bg++
DKIM-Signature: a=rsa-sha256;
	b=QvguwkaRAR+DxhHrWtFUyQq5fDOxONOwftlH9eTUC3KB/+D29ccZfPKoN+FX9tLmHZzUwDQjhnx5JvgqYSLv219I+keluYqIaY7e4yCUh3IpPO8QPI/ozAtd5kVmZKtFN7C+VzZLrZB1JY1Ic+lFoquYvW2QrAdbLmxDH14uoGc=; s=default; c=relaxed/relaxed; d=rock-chips.com; v=1;
	bh=Xsz5HN/Gm6vz86vevKnGFWkVhhUxca+JtK1d2I18t4M=;
	h=date:mime-version:subject:message-id:from;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241220_023840_427238_2361DFEA 
X-CRM114-Status: UNSURE (   6.58  )
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

Add the compatible string for the rk3562 SoC.

Signed-off-by: Kever Yang <kever.yang@rock-chips.com>
---

 Documentation/devicetree/bindings/pinctrl/rockchip,pinctrl.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/pinctrl/rockchip,pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/rockchip,pinctrl.yaml
index 6a23d845f1f2..80a2b1934849 100644
--- a/Documentation/devicetree/bindings/pinctrl/rockchip,pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/rockchip,pinctrl.yaml
@@ -44,6 +44,7 @@ properties:
       - rockchip,rk3328-pinctrl
       - rockchip,rk3368-pinctrl
       - rockchip,rk3399-pinctrl
+      - rockchip,rk3562-pinctrl
       - rockchip,rk3568-pinctrl
       - rockchip,rk3576-pinctrl
       - rockchip,rk3588-pinctrl
-- 
2.25.1


