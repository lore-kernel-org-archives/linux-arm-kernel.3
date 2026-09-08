Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F1E9C79F82
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Sep 2026 16:07:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=VuYBB+6bBQYCt8FtvT4dMmkhp9XfqdyL4BeXMt4JPTk=; b=t2Ya4oyWhMkvVTpeW+PE3kcuZb
	70ER5wdjdEP7lRII3E0Ea7YWRS/7jWIiXV+LZNkm5HhsTatTtjwJLjFekPLqy4q4XTGaJMByHR0Im
	sB5v+PELC7elGhCPUbgorZTlXxyb7e0iK3EDm6ouEvxrpKNpDyKyiRlURMpxL1Ia7gPU9hiO25tyE
	8ippJYHva7GCa3FY5lb/MoqcFX1hKNQ/lCem04GZiIJKcBddwY0V21nQSi4UpJpctqqRbfHM2FJHH
	tNLradcQDnQWq2mxwLb4AMzho0xoajn8PHQ6z5UyX/PeYGLCJwl34zre8Xss4I2ChsFqwJqJrJ+2E
	vzuI6VJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3yMO-00000009akM-23Rx;
	Tue, 08 Sep 2026 16:07:48 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3yMM-00000009ajk-0Zse;
	Tue, 08 Sep 2026 16:07:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1788883663;
	bh=mZy1cqdWdJhHt9O0ElVrbLOd8aw7/ukD53tdlXnuAcg=;
	h=From:Date:Subject:To:Cc:From;
	b=qsHo/WrIgmVfRw6p7uZI1OLxOt70hmvt0GRmI+JHoV3y5RDzCi7Ws6iYmpccNroQe
	 tHZ/LBfaypNZ+R8BKp7vDmaGjANQDwInp0fEFCKQsm1spmUb0J82bGNAVsV37saMml
	 mRbq/3+qQ8coeZ0EwoJYv6oDLW1m54tKWRwSH/JNEKiWM2aytDS/mXwSUqBRSlEg3Y
	 6y1IRUo87FZBx+T0Zng+0l4XyGPNLxmDkCTvjFl6k67k893eJgUYg2ezjMztuSPP+f
	 bdebaUab9/5+DIc0XqK48tUGK1E3eEQQeOTfwlra1FtlrRRbmztYTb/8nmFVUrEunz
	 +4a6uVOtcYZ1g==
Received: from jupiter.universe (unknown [100.64.1.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 79C7217E0420;
	Tue, 08 Sep 2026 18:07:43 +0200 (CEST)
Received: by jupiter.universe (Postfix, from userid 1000)
	id 3903C48002B; Tue, 08 Sep 2026 18:07:43 +0200 (CEST)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Tue, 08 Sep 2026 18:07:42 +0200
Subject: [PATCH] phy: rockchip: inno-usb2: ensure PHY is running when clock
 is requested
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260908-phy-rockchip-inno-usb2-clock-fix-v1-1-f7d59c31b908@collabora.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yWNQQ7CIBAAv9Ls2U2Q2Ip+xfQgsJVVA4S1RtP07
 656nDnMLCDUmASO3QKNnixcssJ200FI53wh5KgM1tjBHIzDmt7YSriFxBU554KzeIvhrg4nfiH
 FOPS+30/O7UAztZHq3+I0/llmf6Xw+HZhXT+JiLhohAAAAA==
X-Change-ID: 20260908-phy-rockchip-inno-usb2-clock-fix-edd65b57f884
To: Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Manivannan Sadhasivam <mani@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 Maxime Chevallier <maxime.chevallier@bootlin.com>
Cc: linux-phy@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Igor Paunovic <royalnet026@gmail.com>, kernel@collabora.com, 
 Sebastian Reichel <sebastian.reichel@collabora.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3031;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=mZy1cqdWdJhHt9O0ElVrbLOd8aw7/ukD53tdlXnuAcg=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGqgMs9WpqhLxTPuwexyL6CnHWKALsLCTjiT1
 alS9w/buWlcYIkCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJqoDLPAAoJENju1/PI
 O/qaaJoP/1XvEvAnZaDbwRNrMatVi1f3Kaex+2hUDpKMZPWG1Qhi2YzZmzUfMQ03nM1ZzLQHwxe
 OptxYH8WRRj7r0ZFMo/resXz4IUTRx8fMoW2Aum0pykvB+4JL76iHAZurVS7Gw+5j8REs3jkIvs
 Ux8H7ILqBRcjnlI24t9+2owlvtAuPbbVgsJg154zEafA/dic8DD7drz7dxUpQVygeKtaOthz3qG
 G9fPz/lXRfWD/eJrST3GWjSjhv5o2BabTPWex1hQCb69lNe4DjK3BlCdem/inAnrUDcQE43xzS1
 kXoD9xV8j2JIYRW2TKhum+6KpSYcqXBcwgkEEkPmcaTKroS/12PHkxHh2E1FoOTc5ub3WivgOv8
 6zOgIAgLh0yb6Db7JDx+L25f/phwCxZ8yE8soMs+93Xi0RzVWJConxMAVuBUtV73jqdpCwBpXdg
 /+DU1nv1IQq8mKgKCglv0iDki44nS8piOLAr6yN1aJFCsvVXfXB7MPI6H4qE6xzUu8o0kfHbJT4
 xTRvVSm6GpYAIGQHrXPinFs+wMPXsB5MSsA+8Nhm95xvigTu6RQz4cw39jUA29SXd7P2S9/lSnD
 sBL0P69ooCCZAr/HlESKZ/IKHPiBuHV3AU1GBZdYe5jNI/ycXnljGyCIVx/SY/sXadOixW9PyGe
 lHEOnLeedDxujdklPRG8sgw==
X-Developer-Key: i=sebastian.reichel@collabora.com; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260908_090746_352366_25F6C184 
X-CRM114-Status: GOOD (  19.73  )
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

On RK3588 the OHCI controller registers can only be accessed when the
PHY's 480MHz clock is running. After system suspend the controller is
resumed before the PHY. The controller requests the clock, which opens
the gate in the PHY's clock prepare function. But with the PHY suspended
this just results in a dead clock being routed. The OHCI driver will
then continue to access its registers resulting in a board hang.

Fix this by resuming the suspended PHY in the clock's prepare function,
so that the clock is really prepared once the function returns.

Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
This was noticed on RK3588 EVB1 when resuming from system suspend. This
is technically a fix, but its unclear when the bug was introduced and
system suspend is broken on RK3588 for quite a while and not just due
to this problem. So I think this fix can be merged the normal way via
linux-next.
---
 drivers/phy/rockchip/phy-rockchip-inno-usb2.c | 37 +++++++++++++++++++++++++++
 1 file changed, 37 insertions(+)

diff --git a/drivers/phy/rockchip/phy-rockchip-inno-usb2.c b/drivers/phy/rockchip/phy-rockchip-inno-usb2.c
index 7d8a533f24ae..07d400967def 100644
--- a/drivers/phy/rockchip/phy-rockchip-inno-usb2.c
+++ b/drivers/phy/rockchip/phy-rockchip-inno-usb2.c
@@ -332,6 +332,39 @@ rockchip_usb2phy_clk480m_clkout_ctl(struct clk_hw *hw, struct regmap **base,
 	}
 }
 
+static int rockchip_usb2phy_clk480m_leave_suspend(struct clk_hw *hw)
+{
+	struct rockchip_usb2phy *rphy = container_of(hw, struct rockchip_usb2phy, clk480m_hw);
+	bool relock = false;
+	int ret, i;
+
+	/* Limit to single port; it's unclear how multi-port should be handled */
+	if (rphy->phy_cfg->num_ports > 1)
+		return 0;
+
+	for (i = 0; i < rphy->phy_cfg->num_ports; i++) {
+		struct rockchip_usb2phy_port *rport = &rphy->ports[i];
+		const struct rockchip_usb2phy_port_cfg *port_cfg = rport->port_cfg;
+
+		if (!rport->phy || !port_cfg || !port_cfg->phy_sus.enable)
+			continue;
+		if (property_enabled(rphy->grf, &port_cfg->phy_sus)) {
+			property_enable(rphy->grf, &port_cfg->phy_sus,
+					false);
+			relock = true;
+		}
+	}
+
+	if (relock) {
+		ret = rockchip_usb2phy_reset(rphy);
+		if (ret)
+			return ret;
+		usleep_range(1500, 2000);
+	}
+
+	return 0;
+}
+
 static int rockchip_usb2phy_clk480m_prepare(struct clk_hw *hw)
 {
 	const struct usb2phy_reg *clkout_ctl;
@@ -340,6 +373,10 @@ static int rockchip_usb2phy_clk480m_prepare(struct clk_hw *hw)
 
 	rockchip_usb2phy_clk480m_clkout_ctl(hw, &base, &clkout_ctl);
 
+	ret = rockchip_usb2phy_clk480m_leave_suspend(hw);
+	if (ret)
+		return ret;
+
 	/* turn on 480m clk output if it is off */
 	if (!property_enabled(base, clkout_ctl)) {
 		ret = property_enable(base, clkout_ctl, true);

---
base-commit: cee9395acd8043be0644b25c34bfa86623f2b935
change-id: 20260908-phy-rockchip-inno-usb2-clock-fix-edd65b57f884

Best regards,
--  
Sebastian Reichel <sebastian.reichel@collabora.com>


