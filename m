Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 531B7C531C9
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 26 Jul 2026 13:26:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Pedwj7ip/TTN4l9zpA2Hv+d7tqQJ7Bsv4qn8F/T2XqY=; b=QLnzrFJqdpX9sYbjEfTNl09oHB
	Hkft2X0lDQa2osXBGW5EhRWtxcu2X/gtf74DjkRzlB47M8a767etqhpD5Ye6sE4nxh10T0FzHVeDX
	yi5kAhWg+qNTi6h/Bs7MEyX7VcxfeA6vUqVXvuQf7zLjENtT3sE0HdFN3JHqBb455Tmub452UWOaF
	TcdsqEcxTpNcpaaO0FsVYoXAEQ2GgpRBXqByV6vNNqkwY6phEAokUHQx0g0afI6kaXArg0dVIXOWg
	QWbikPN3Eu8jPD1Z651AeAx64VcwqxDAtKGKKQ2TF9OhoFTmUb0r4eRkZWDFjWYDFhF/flUIupIgo
	ZDxHtH5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnysG-00000001CdS-20L0;
	Sun, 26 Jul 2026 13:26:36 +0000
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnysD-00000001Cd7-4ApG
	for linux-arm-kernel@lists.infradead.org;
	Sun, 26 Jul 2026 13:26:35 +0000
Received: by mail-pl1-x62d.google.com with SMTP id d9443c01a7336-2ce7d2adef4so23515635ad.3
        for <linux-arm-kernel@lists.infradead.org>; Sun, 26 Jul 2026 06:26:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785072393; x=1785677193; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Pedwj7ip/TTN4l9zpA2Hv+d7tqQJ7Bsv4qn8F/T2XqY=;
        b=GfHjXFnpRExc6AUkwgMmHVsOKOnNeDBizbCs3Nobp/beorXTAu2z/VmC83BNpHfIC6
         ah+VL4aTl5gbcKbf2AwpWiI9IaeQNrzht0Vdr1ylO5KfkkWWfE6KnTvLutg2AEevNqR5
         HKD/vWDDyEiv7Ch7LJy2aBdydMgDKNWl378Um0qwSdD3q6RhkvPtc7jKLw13Z0EFhDEo
         eMJVJ9VAK+cQWCImGfjZjbIUQ3Vemn36k04wBk1LHJIy4VR7pAhkJKJRd6jg5daygbHR
         gtCrlKsAe+AXYcnPXH8FZs60Gn/aOiKQalW9e8Rm7tFbicNaGxVWqoXVCGO646CkOpwC
         3ENA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785072393; x=1785677193;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Pedwj7ip/TTN4l9zpA2Hv+d7tqQJ7Bsv4qn8F/T2XqY=;
        b=BVvVc6DHUHr/Hf8/xbNXNqrKGenv7Nu2R+FKHBCf/7xX7x+AFVX0qHTA2vUihAglpz
         POoxn3QWYFdkR70OD2iOLVk67AJMztlzU3D30amc9ljKE171uBZo3n5A8aIYWosndJpj
         BzjFmpCyhcueIgM/XgfZGwFpwRYQC6ErtAW684SI28+fn8knNnO4vZ8iuUlzMetA+Cuo
         v98z6x+OrOlQN1N/aqH8vccDw7SuEZw+4tdPPXQwvOi3l1HyGGVy0IjQ7LVJoP+MtxX+
         6csEidOyScQ5O7wXe6FxrodZKfeY8djHhzkxANpq39EmrRBZ/Q+ZeGM5XONJlImre3JK
         0sDQ==
X-Forwarded-Encrypted: i=1; AHgh+RrO3hmJy/uDEfcMZjdZh4cWoF7WoPQo3304m7AvWjIVKop1namJQysN+stzWEchRUtr3oy9waZV9aBgbUW0vxUu@lists.infradead.org
X-Gm-Message-State: AOJu0Yyext/HqmuNK53EWsK4uIPOtOB/5f4FvT03XD631Ptf5jECXj0q
	/wUHZKhmwNtR5pggWTuvfiO1Be7fv9FUH9NNFEA1CfEqnPbx4gwma3Kk
X-Gm-Gg: AR+sD11xhxu6jtqOinDyGwxsIUEk00yr09oswT4/jska1/ZU0kJHTTMvENwrfWuf8qe
	JVnOYybzDY2JbX9xY1henkv9x9ajsFZT8968O5pHYhnEyoxF7EKsCLOkFJXARojbQfp59w2cJ/U
	JAlQEKric4JYndgpCYueOotAn4Lztci6TplO3yRL5rt5IVoMVGhr5oKnI+56CqpV3TqZeS58Ch0
	RvdnA6BmHBPyM4mdeXq7RLtqB16LmUZt5fdrKXGvhyznB5EVK9WwNTQZ3SkG3KDm43cBUTIZsdq
	097e/JRcy0MPzbPZAGSgmumOVtSoln0L13bDAjPbO5Hb/Qo1p8s1rxqAFG46/U/6KzAlVL7qy2v
	z/08cl3DkpmMuA0mjeX+z//IZKexWje8OlmACp53z47U27T5IMwrhsFHepI99T12d4Gahn9h7UY
	3i
X-Received: by 2002:a17:903:b0d:b0:2ca:4f33:e86f with SMTP id d9443c01a7336-2cfde7ae37cmr48204445ad.12.1785072392719;
        Sun, 26 Jul 2026 06:26:32 -0700 (PDT)
Received: from server227.. ([39.170.101.209])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cfde7bbdc2sm20677655ad.42.2026.07.26.06.26.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Jul 2026 06:26:32 -0700 (PDT)
From: Zxyan Zhu <zxyan0222@gmail.com>
To: netdev@vger.kernel.org
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Russell King <linux@armlinux.org.uk>,
	Russell King <rmk+kernel@armlinux.org.uk>,
	Maxime Chevallier <maxime.chevallier@bootlin.com>,
	Serge Semin <fancer.lancer@gmail.com>,
	Romain Gantois <romain.gantois@bootlin.com>,
	Hariprasad Kelam <hkelam@marvell.com>,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Zxyan Zhu <zxyan0222@gmail.com>
Subject: [PATCH net-next v2 0/2] net: stmmac: Fix PHY attach when custom PCS is in use
Date: Sun, 26 Jul 2026 21:26:16 +0800
Message-Id: <20260726132618.3580612-1-zxyan0222@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260726_062634_041562_72E68A0F 
X-CRM114-Status: GOOD (  11.33  )
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

This series fixes the issue where stmmac platforms using a custom PCS
via the pcs_init callback fail to probe when no phy-handle is specified
in the device tree.

Patch 1 is Russell King's phylink patch that relaxes phylink_expects_phy()
to allow PHYs to be attached in 802.3z inband mode.

Patch 2 skips the PHY attach in stmmac when a custom PCS is already
configured via priv->hw->phylink_pcs, avoiding the "no phy found" error
for platforms that manage link state entirely through the PCS.

v2:
- Include Russell's phylink patch as prerequisite (Patch 1)
- This is now a 2-patch series targeting net-next

Russell King (Oracle) (1):
  net: phylink: allow PHYs to be attached in 802.3z inband mode

Zxyan Zhu (1):
  net: stmmac: Skip PHY attach if custom PCS is in use

 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 4 ++++
 drivers/net/phy/phylink.c                         | 8 ++------
 2 files changed, 6 insertions(+), 6 deletions(-)

--
2.34.1

