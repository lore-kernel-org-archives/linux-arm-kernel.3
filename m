Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BDF88C624D0
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  1 Sep 2026 19:57:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PI+vV4+0K0TcTEqjOArwaIQ6QABITxoJC6J2ctoQ1yA=; b=JceouitGTsaJ7tW3GbQiLw3yhq
	QlUGOzShcKiUsV8xHoc0VbyYlyBmTA+Vr1ISRh7razzuHUuZusnqzqwXsPx9t1h+T0TSBwOSeG2pP
	XwIoaM3QxyW1D2NXf/OF7Ue8+jjEP+p0I5/vsZpwmRvr6DFKTWjO07cI1jRbCAud9q6WjQ09YLZeg
	lCF0D0PEJ/jdbdGfFH7kqfXGQHPwUieuBCBwLz1F3+YXc3IwfHS5WF4WD/N45zG+WSjHgKSCgmQUS
	V4xW0o47J3K8HHp7FAF41eTTOZ1TL9b5UvDhZDwTkLEL+yt7vxiBmV1XAmcAi6LLe5wRx0PDhXMsd
	R2i7qfqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1Ubq-0000000DGon-2iHC;
	Tue, 01 Sep 2026 19:57:30 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1Ubo-0000000DGmh-0G3W;
	Tue, 01 Sep 2026 19:57:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1788292644;
	bh=rCvlPknLGM17Xc/ny1wY7xGWECwsix65LrYdnOlW7MI=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=AwQldk14HlTia8gWljufFe9X4XuwnSW57CSg9aaW+5JdeAR+5+ozFGd0heCPgzSo2
	 RxZGkaf9GGbshx0tdL3CgIVLSgj30Olup4PdpJV+KgMlNZAyB35Rj8vZm/HI27nLDr
	 OVA1rbLs0N9hU3Jdy/lyWlZe7RnMlGXdG2jL79pql5qhP81yXd0nYsUqIhx9AQ05qR
	 JDftH1nkqLACGA1lPBz/zAKFPoyOHHS6HUcr1oa+UMgmIK0JBHN8QGLTpViIOcFlH3
	 JERZWsJjC7jiuwLCehnbJSXM+B4VRWq7Emhk6dCeSo2IxV6mcSAeghJRpznwNHWTEI
	 YRtvE3auxXyHA==
Received: from localhost (unknown [100.64.0.241])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id D24E517E057E;
	Tue, 01 Sep 2026 21:57:23 +0200 (CEST)
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Date: Tue, 01 Sep 2026 22:55:13 +0300
Subject: [PATCH v2 1/3] phy: hdmi: Add optional FRL TxFFE config options
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260901-hdptx-ffe-v2-1-3a5922c76fc5@collabora.com>
References: <20260901-hdptx-ffe-v2-0-3a5922c76fc5@collabora.com>
In-Reply-To: <20260901-hdptx-ffe-v2-0-3a5922c76fc5@collabora.com>
To: Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Manivannan Sadhasivam <mani@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 Andy Yan <andy.yan@rock-chips.com>
Cc: kernel@collabora.com, linux-phy@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260901_125728_251477_A004CC16 
X-CRM114-Status: GOOD (  13.42  )
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

During HDMI 2.1 FRL link training, the source and sink can negotiate a
Transmitter Feed-Forward Equalization (TxFFE) level to improve the
signal quality.  Starting from zero, the source may increment the TxFFE
level up to a maximum agreed during the LTS3 stage if the sink keeps
reporting FLT failures.  TxFFE adjustment is optional and only attempted
when both the source and the connected sink support it.

Since the existing HDMI PHY configuration API covers the FRL rate/lane
selection only, provide the following fields to the frl sub-struct of
phy_configure_opts_hdmi:

* ffe_level: the TxFFE level to apply, only meaningful when
  set_ffe_level is set.

* set_ffe_level: a 1-bit flag that changes the semantics of the
  phy_configure() call, i.e. when set, the PHY driver must apply the new
  ffe_level and ignore the other frl related fields.

The flag-based approach reflects an important invariant in the link
training process: whenever the FRL rate or lane count changes, the TxFFE
level must be reset to zero.  A separate phy_configure() call with
set_ffe_level can only follow after the rate has been established,
making the two operations deliberately distinct.

Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
---
 include/linux/phy/phy-hdmi.h | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/include/linux/phy/phy-hdmi.h b/include/linux/phy/phy-hdmi.h
index d4cf4430ee8f..1d4b62475079 100644
--- a/include/linux/phy/phy-hdmi.h
+++ b/include/linux/phy/phy-hdmi.h
@@ -19,6 +19,10 @@ enum phy_hdmi_mode {
  * @tmds_char_rate: HDMI TMDS Character Rate in Hertz.
  * @frl.rate_per_lane: HDMI FRL Rate per Lane in Gbps.
  * @frl.lanes: HDMI FRL lanes count.
+ * @frl.ffe_level: Transmitter Feed Forward Equalizer Level.
+ *	Optional, only meaningful when set_ffe_level flag is on.
+ * @frl.set_ffe_level: Flag indicating whether or not to reconfigure ffe_level.
+ *	All the other struct fields must be ignored when this is used.
  *
  * This structure is used to represent the configuration state of a HDMI phy.
  */
@@ -29,6 +33,8 @@ struct phy_configure_opts_hdmi {
 		struct {
 			u8 rate_per_lane;
 			u8 lanes;
+			u8 ffe_level;
+			u8 set_ffe_level : 1;
 		} frl;
 	};
 };

-- 
2.55.0


