Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ECF3CC61DD3
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  1 Sep 2026 15:04:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jFOAryefyj3E8LprwQb6zM23kP14ZZpWJUCwFcY71vI=; b=SiTfBzGIALzF4uHuGaC+2jekwA
	vUjNml99ajUqbjA/Z3GaB8XC7PvK1Vf190jj+RDA0HStdT/27/vYZDfS+WJ8zAy2iuIPFf2OqNMFp
	S5ETuy+KmFtqLk1mRT7ZDwx5WfaYReKg49PM5DAJg5DS4X6ildkdFTTm1PVEb13zmKOvrWH9JTyZd
	BXfIxrjOL1xduB3DKjKZpVCtGuzXZVdlo+cfgG1NTJmrHvJ25FYfvw+NjiTHVdFsXoxA/NOUh0mHk
	94udn/xB9tkNjL/1aQs5H9WxPJ0O0c5gdHpk5tR2w9xv2qPx1JLZhFTI+dOWz480WrE9oRaoGyIhW
	pTocDClg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1Q22-0000000CQb6-2yE9;
	Tue, 01 Sep 2026 15:04:14 +0000
Received: from mail-pz2-x09.google.com ([2607:f8b0:4864:3b::9])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1Q20-0000000CQZt-3uKF
	for linux-arm-kernel@lists.infradead.org;
	Tue, 01 Sep 2026 15:04:13 +0000
Received: by mail-pz2-x09.google.com with SMTP id 41be03b00d2f7-cc1ddb3ba3eso3187706a12.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 01 Sep 2026 08:04:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788275052; x=1788879852; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jFOAryefyj3E8LprwQb6zM23kP14ZZpWJUCwFcY71vI=;
        b=P4CemD6vg6v47biQQDo/D2523jTiufVg9PMaKMBMg5CnU1AzGDWiGloQf/L3JjARnS
         UwchxqUBlP4+RMmA1SMKNJ515DXh3eTFZNJgXtBWVwKvTRYhdU8s+oRoFpN3t89r4Acl
         vyhgNERdt2Np3O2EWYDcAvng94BlVDEFkGdmCpkmOjkAk+kLVH2Xt+8rK54UyuILPUQw
         rtBA5IyMzYMFSOdWRI7CO+O8zSRfcAfEu1m3i5CyaaP/l4oDOq0iJs0u63N34oL21dDH
         AnSGst1TBLjFuQZF1jDHKBNK0vVEq6K9+Cw4st6z407Pk676T3+FM1XDGq2LT4rkPMFX
         rXgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788275052; x=1788879852;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=jFOAryefyj3E8LprwQb6zM23kP14ZZpWJUCwFcY71vI=;
        b=kjLa4wMyTWIZjM0JFYZuxa1MCcjQ7uNN3F7H0K4InsJqA8WQAmSneGjnWti1wqrLbF
         ujJtOCWgb13YzyVuofhkUw6qkzkNq5tgtaElO0h7xrA66XMBTDDo699Q8vHPGsIM81c4
         6F8Dt9lsQZvZF6P5lMIuYaXPP5JqJH626kIbTAK/4tMnEOwj57VTQVNpDxZQIe0tIMrr
         IjAOIzOrG9RnINnKtNdHfNMAJ0J1xXv85+dLNZgyJJAI/eDtrPHM6CMxV2TqO/uWZoWk
         oQbYj21Lzuv/JxtVT9CfqRaqt7GKHhtlobys6IF8BeocP7YGjDy0dxsNjL6wMhnn5yfK
         cFSA==
X-Forwarded-Encrypted: i=1; AHgh+Rpr4p2NpBpOytmQ0/np0uXIRNjpqPIOKFImASKOHAn9BRVtsk19jBKCfNXBypWprfoTV95Ryd33bPhwjWTMR66S@lists.infradead.org
X-Gm-Message-State: AFuF++kLVXNUUyNWfEJITbSFwKrRR5sLe5pukcKK1TALXz9WODyCPaM1
	m8sHxIx26FpFIGHmPRL89mzZn6KIZAX2+GHKggt455Dz0xr2TOz4NeRD
X-Gm-Gg: AR+sD11gnYV1CUDHPF3hHMkvObRE2InQ7lF2pt67br+rZnrzmKJ/lP7W1qXEQfbSdZQ
	r6L5qC11/s5dz4UQvCToUB0CJfpG/Bt0bzkO5yWb1hBNEg2lmrE3yatU0qzKPHUZ7ibbbnCevzd
	AlHtLgKFBKsQFvzbXE3Rxi2VwXNk2Yy4b7m2tceraqKvUL2Kv/P7vLAXMI/wmke1cZQV+syxmsZ
	F2frQA0IhXDv68gedZLEHas7V28FBS6Yq1Mx1XgEy8+Z768opi/3vtkpdayD07hnNn6KOxX9GMv
	nnPWJSuTwkLllsylzDngr84nHev6NfrFdvj3lcJPYNcOXUh3Dbhc5wuiTZ3C2O5EkAlbtnLS4Kq
	7VjdU5yIL29EXPvSy78k/wGLY3c8Kdjc91eUFKi4B+FgbTG8/bk8v/ewA3BAat4aCnRVHS1DqsD
	aAccXYpOF4yex6GYM5hJDoKkiqMdLtMeTVXG8whlefCP45VPWD38Mc5bgMlKg=
X-Received: by 2002:a05:6a00:4501:b0:857:72f8:dc91 with SMTP id d2e1a72fcca58-85772f8de55mr39669660b3a.18.1788275020723;
        Tue, 01 Sep 2026 08:03:40 -0700 (PDT)
Received: from server.lan ([150.230.217.250])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-85dc0716846sm27914b3a.45.2026.09.01.08.03.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 08:03:39 -0700 (PDT)
From: Coia Prant <coiaprant@gmail.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Vinod Koul <vkoul@kernel.org>,
	Maxime Chevallier <maxime.chevallier@bootlin.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Romain Gantois <romain.gantois@bootlin.com>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Coia Prant <coiaprant@gmail.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
	Russell King <linux@armlinux.org.uk>,
	Shawn Lin <shawn.lin@rock-chips.com>,
	David Heidelberg <david@ixit.cz>,
	netdev@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-phy@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH net-next v3 10/10] MAINTAINERS: add entry for Rockchip XPCS driver
Date: Tue,  1 Sep 2026 23:01:10 +0800
Message-ID: <20260901150111.141037-11-coiaprant@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260901150111.141037-1-coiaprant@gmail.com>
References: <20260901150111.141037-1-coiaprant@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260901_080412_984113_B49BAD51 
X-CRM114-Status: GOOD (  12.37  )
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

Add a MAINTAINERS entry for the Rockchip RK3568 XPCS platform driver
and its device tree binding.

Include the relevant mailing lists (netdev and linux-rockchip) so that
future patches are properly distributed.

Signed-off-by: Coia Prant <coiaprant@gmail.com>
---
 MAINTAINERS | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 3a19da74d00c9..c3b17752cc817 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -23744,6 +23744,15 @@ S:	Maintained
 F:	Documentation/devicetree/bindings/sound/rockchip,rk3576-sai.yaml
 F:	sound/soc/rockchip/rockchip_sai.*
 
+ROCKCHIP XPCS DRIVER
+M:	Coia Prant <coiaprant@gmail.com>
+L:	netdev@vger.kernel.org
+L:	linux-rockchip@lists.infradead.org
+S:	Maintained
+F:	Documentation/devicetree/bindings/net/pcs/rockchip-dwxpcs.yaml
+F:	drivers/net/pcs/pcs-xpcs-rk.c
+F:	include/linux/pcs/pcs-xpcs-rk.h
+
 ROCKER DRIVER
 M:	Jiri Pirko <jiri@resnulli.us>
 L:	netdev@vger.kernel.org
-- 
2.47.3


