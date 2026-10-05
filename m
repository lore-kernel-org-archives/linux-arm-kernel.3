Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5FECDCA5FF5
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  5 Oct 2026 23:00:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=h3ikYaSpRCSX3H8ucJ72hbBucRgUg7rHXJ+trb1hlAM=; b=hzMvO7CztfNkeHgOMXzBENpViP
	W0Vd9tLIdGow9vpKCbDJBUyS6cBgtRp4c2ETNZq7bFg70OvOTH+UoNvBB1rGV1OtkZXiAgP2Yq0GG
	3u04TWlvIOQtjDJ0UQWPRrd5cfwxAdTtwxTX2BzE6pwgN7xcC9WZnA6BuBjeeMOy3GLZ0Ir1ki2b9
	iyA6CKhkbaG4T0x4Aoobdc1CRUgYpSmNRKDZiyR6NvjynasvcIePvyFfoN95IjJAE77VJCYhoLfEb
	WSdqHe4/+lorDZOrFolwBZG0CU9j8QQFZDkJ4c2UK7UreW9fzeAFTlTS6u/eZeqtZxxruGT5YhJpV
	d0tUYE4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDrf4-0000000HJ36-24jz;
	Mon, 05 Oct 2026 22:59:58 +0000
Received: from mail-pj2-x07.google.com ([2607:f8b0:4864:39::7])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDrf1-0000000HJ1s-2Thj
	for linux-arm-kernel@lists.infradead.org;
	Mon, 05 Oct 2026 22:59:57 +0000
Received: by mail-pj2-x07.google.com with SMTP id 98e67ed59e1d1-398da2bdcb9so478319a91.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 05 Oct 2026 15:59:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791241194; x=1791845994; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=h3ikYaSpRCSX3H8ucJ72hbBucRgUg7rHXJ+trb1hlAM=;
        b=em12/678LbMWtlD5tfCRGFmNxFEBGx5yBIf/up1e+/ARGxU1md4le7tOLPA9KM2dqs
         n1yjTauazVoQJq4ITDCYYaucIQF8DlY1g4A1m23M4MQu2/MEtdwZPtZWBrbwdGfZn01b
         dKaK+A5oQIlGJC78g/PtnkbvU1tIdwRhXo3CcP+TiH/1YqJbtZ/J8I+orQlsu+O4TRH3
         +tb4wwVFZ4QxG2FOLykxnTufYqQEPcLmyZIN9ZzG+QFYpffwh9OiohM3DGFOSK3LTkL7
         G/Z7lRT/vONqDv2By42AW0vUwP8dGTxi3PlmZ0PcVk6TtmNu9GQUqhebAUImAa1HTAks
         Bs+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791241194; x=1791845994;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=h3ikYaSpRCSX3H8ucJ72hbBucRgUg7rHXJ+trb1hlAM=;
        b=G8qYJSLUfN6shILag06x1lvnwKleJP9GrIgUWBgzGI839AB3zGmaaIyrXWmhxaEAuR
         k7Gi+CNZRVy/Gv1ThohgRLHZIK+WUCkB1QWtI4/cC9yQ4QXd/l9CRkVJNk+oZFiQWHhH
         Acg3DhA0YEJfZqNyVtNmHMYs5UpLe13/Oa05dHgi87pez/claTai4Af8qaWhpgwhl1es
         RpahP7iLB36ZaE3jvhQaBAcdEbUAfG7KfRuUWTwqGWdVKhsrIKrHyd5EJoXWDz29Ab22
         gQGmuRDKO9PQub7pxkwSbwa5NMpXo6fGHgavAWjShk9BPZeZj3JSK/N1X/nXf7g3HBHY
         luLA==
X-Forwarded-Encrypted: i=1; AKwUvByKzWxt7/RpVsy8+J/zae+NKUfYpT8KYVkO1CqI0omaQH4BTa7Tplf2XrQ1hO/oNO2AxB/dBO4hh9OQdFDeOGh8@lists.infradead.org
X-Gm-Message-State: AFq9FYLcJIRfd55AZYFXj1VvhT7LA5sSOU/5yCR5ZQSH5b1iQsNTpYcE
	/fqO4N0yD8YyMmTtPnTcoOeAR/xUATPBzwLiKZda29VRvpdqOkA7/u6y
X-Gm-Gg: AYBFou2zDmqzb6RH7eiF0jRI9SBlolI6USaVJucJcislbx3O+iDsDerl0SOC9yUyDE6
	sVe0f15cQSzd2Lie1333MyiYLV6JEU7uSRkmm+sW+0snbOJyqCOyeMxcJaISuk6KnnfIKUSrx1k
	Lr5x3rWs9yw5DSfWwa1mq+lDMD1xU4eMaKAEMPhkPvqaW87ZzRHwm1QaWBl9U/jCVd5sAg/3Uod
	GHZPThSdCM/sUJRRXTpmPmVWp19bQs7lgKlWyfmXEv2xy43gz2xbFm+Cd9flKFn5vNL/XBu9RRH
	DHBcFzVXmfhK6Pl3bHREM7pbGhlDiIz1BTQr8shnk/Kmp38OU4MzunnWIpToB9pyfJMs7S5UmRE
	CiitqUeb5WZZ0Yx7U4XxkF1D3NsAdWpt8gIvCeW4CkYGKxhhUw+vX/BTkTEgrXi6LlyAHFoJXCg
	h0cth7IjRACn2Gs/wem2TmyIc7FhR0vK4rlM/IXyshTVEXR/YPCVxRyxoFmDv6Z7WjrsIq
X-Received: by 2002:a05:6a00:94d1:b0:886:3d9e:aac1 with SMTP id d2e1a72fcca58-88af58d4ef9mr10577114b3a.45.1791241194303;
        Mon, 05 Oct 2026 15:59:54 -0700 (PDT)
Received: from server.lan ([168.138.199.194])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-88b0b8f5b79sm4183327b3a.15.2026.10.05.15.59.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Oct 2026 15:59:52 -0700 (PDT)
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
Subject: [PATCH v11 0/2] phy: rockchip: naneng-combphy: add SGMII MAC selection for RK3568
Date: Tue,  6 Oct 2026 06:59:42 +0800
Message-ID: <20261005225944.1171574-1-coiaprant@gmail.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261005_155955_639290_68E36D86 
X-CRM114-Status: GOOD (  11.21  )
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

Changes since v10:

- Drop the top-level "default: 1" for "rockchip,sgmii-mac-sel".
  dtschema injects top-level defaults into every matching node, and the
  injected value conflicts with the "else" branch that forbids the
  property on non-RK3568 variants, breaking dtbs_check on those
  platforms. The driver already treats an absent property as 1 (GMAC1),
  so behavior is unchanged.

===

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
driver routes SGMII to GMAC0; if set to 1 (or omitted), it remains at
GMAC1. This is necessary for boards such as the Ariaboard Photonicat,
which uses the SGMII interface connected to GMAC0.

The DTS changes using this property are sent separately to
Heiko/linux-rockchip, and the net-next parts (XPCS glue, dwmac-rk SGMII
support) are sent separately to net-next. There is no hard build
dependency; the pieces can converge during the merge window.
---
Coia Prant (2):
  dt-bindings: phy: rockchip: naneng-combphy: add rockchip,sgmii-mac-sel
    property
  phy: rockchip: naneng-combphy: add SGMII MAC selection for RK3568

 .../bindings/phy/phy-rockchip-naneng-combphy.yaml    | 12 ++++++++++++
 drivers/phy/rockchip/phy-rockchip-naneng-combphy.c   |  8 ++++++++
 2 files changed, 20 insertions(+)

-- 
2.47.3


