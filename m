Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B38AFF8864
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 29 Apr 2026 04:15:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cUANSDjJgu1WXHjNheDgVJfCwB+h6we7yJfErm3QH3E=; b=av2ltrCEGVtbFL52bEnFcPogdO
	XGIpB9AO5eQazkIclsdXC24TCY1NacExnO6ky5KdYSbX34WhWFKKV95X1kDgyz8YU6rPdIjz4ATdT
	kTyw6a54OCTDvl0QOJQ+sbeUe/I0uHoGeRfApJyDjW/wKhSurhp9WevjOrjQ5VmJPWONQgiTtHPjT
	OCmyICOou0ib1pMNMnonecnpobR6VTy1hKhBuhVChHxRa+/b8hkt+zizdwDikuDTIFuHvbsybA6OO
	CTiZ9j9b/ojc887iz+plb+TBejw6ObEUChfFpkyaQPK0jQfz8vHTl8BTLqgTJnOQZfo/8IzwCr9AO
	0B98QybQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHwKu-00000002uFs-08rP;
	Wed, 29 Apr 2026 04:15:44 +0000
Received: from mail-oi1-x262.google.com ([2607:f8b0:4864:20::262])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHwKn-00000002uCo-2J2T
	for linux-arm-kernel@lists.infradead.org;
	Wed, 29 Apr 2026 04:15:39 +0000
Received: by mail-oi1-x262.google.com with SMTP id 5614622812f47-479d4df9035so302122b6e.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 28 Apr 2026 21:15:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ausil.us; s=google; t=1777436136; x=1778040936; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cUANSDjJgu1WXHjNheDgVJfCwB+h6we7yJfErm3QH3E=;
        b=IUGzzLj63dR29Iok2GgPOzfKAQvDAFBouSXuj55YYicyhdIqF+GFzVRYZoSUZerUQY
         iG2oYxGV9Di+Ap/Y6qN6lSyEx9nch+nm9RD4VJxmX6JLSqh6ERNCGJoinoKupHi+pD8r
         M9+tMkRxdDieYymKzLAitHIk87K2yww6KkfHMemhuuAjTyVlWAgfM+DASSZrkjfznPNp
         NTXdafcuXQzsyD17FVoFF96b2SPQg2/gYtCMXUrA6Z2SpVv/1xq2HHVi50SV+Dy2UwhF
         ZoB7pOiaiqImnYMDwgWrcafHWDwM8vwe2rhl9Pml6Z/DjZF257oF3l1iBX2kn/KS42cb
         Jqbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777436136; x=1778040936;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=cUANSDjJgu1WXHjNheDgVJfCwB+h6we7yJfErm3QH3E=;
        b=JPl8O7nGKywdY8FoktXqOSnh6B2JkcMAnSOECRBBHfJbpSfbl4ze0oaH/wY4mWs5TG
         AOZxLRFeU3vcQncuRjHbtW6SoScwXQMowRjJPROzrO+QhcFDUfzrA5e1QZn2cl+9ApVI
         /cmw2ODHBs9qfNqWPW3XwYKtYGWvvl9Qjx0ED4m1OupvblEcUFTewk/tzscvHJmRvd9K
         KonnfKR5OxkO6qPc9pymKai9wlYN5nUiNKak/JMHdXI98jufzj3MrPpOI+E1ICPwif/7
         A3u0FsYIxbxwGOYKdQP4IGkA6C+mYej4tO6hckCkr1+fOg080bJBI7kEqGmDh9w3T41+
         2a7Q==
X-Forwarded-Encrypted: i=1; AFNElJ+Ce4+Q9j8QBkbfCvajbuRtwWUaNzrqRsu8TaR/odPhNpPmbO3g4aSKggTgOQDFhx2nwROo0XnAl6Ajng8OmVkr@lists.infradead.org
X-Gm-Message-State: AOJu0Yzen9xuXtAL5sWPJxkTepQq6E3EtPvSgkpHGeT4du5F8Z8ZCiwB
	1aZdKetLLfBvKkfMmoUGqksQQ2FxT1ntRfM4atCyxN3vyCjNpmTsHia3SbFGW80/4GYkLcKFyDQ
	UNFoix4oXdlSvFI70bzM/QGzmMiQ9C2CVsQw2
X-Gm-Gg: AeBDievATPeOzayx5Mbv6onaUQpkbWpSiJhTNP+evZiqNwjlupcFrcHC79P6jPQiLeo
	dwVJ1N1pjXWGDGpqTmuNgzSpVSCbT7YnaNuzOs88cadJpbbxsVEOAEGjP45BnerQSd1C7ykd2mp
	pW3auOx+MnNHWlc36yXwkPXRf9QVaS828vQAmwpxjwnJKnUJEl5Qe1E00FcasKCDQkvX6zWcAkp
	ZJ0zylHoxab0o+YkKPHYGHNNRmum3ircbBLYgX3koShrdQMlXRnQy33OTtNhw35TOM0B7mtbb+Y
	ACuPGtuJKpWop/WjviBYH97SeHCCYVjm9exD442HGl41FMpb9PvTkNt3TxZ4Ad5ckBI280+98Tg
	fJyKDmbrrFTmNjyeDYd37aUKbqrzCpPoKc8P3KtBM19VTjnOEW52JCyI=
X-Received: by 2002:a05:6820:2210:b0:67e:2a62:35ba with SMTP id 006d021491bc7-696699b7162mr686474eaf.15.1777436136286;
        Tue, 28 Apr 2026 21:15:36 -0700 (PDT)
Received: from ryac.ausil.us (207-179-239-100.mtco.net. [207.179.239.100])
        by smtp-relay.gmail.com with ESMTPS id 006d021491bc7-6966baf952asm41557eaf.9.2026.04.28.21.15.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Apr 2026 21:15:36 -0700 (PDT)
X-Relaying-Domain: ausil.us
From: Dennis Gilmore <dennis@ausil.us>
To: Andrzej Hajda <andrzej.hajda@intel.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Robert Foss <rfoss@kernel.org>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>
Cc: Alexey Charkov <alchark@gmail.com>,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	Peter Robinson <pbrobinson@gmail.com>,
	Jonas Karlman <jonas@kwiboo.se>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
	Dennis Gilmore <dennis@ausil.us>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH 1/3] dt-bindings: display: bridge: simple: document the Lontium LT8711UXD DP-to-HDMI bridge
Date: Tue, 28 Apr 2026 23:15:26 -0500
Message-ID: <20260429041528.558254-2-dennis@ausil.us>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260429041528.558254-1-dennis@ausil.us>
References: <20260429041528.558254-1-dennis@ausil.us>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260428_211537_591846_108A5102 
X-CRM114-Status: GOOD (  10.34  )
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

The Lontium LT8711UXD is a high performance two lane Type-C/DP1.4
to HDMI2.0 converter, designed to connect a USB Type-C source or a DP1.4
source to an HDMI2.0 sink. The device can be running uncontrolled or it
can be attached over I2C, the bindings describe the uncontrolled mode.

Signed-off-by: Dennis Gilmore <dennis@ausil.us>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 .../devicetree/bindings/display/bridge/simple-bridge.yaml        | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/display/bridge/simple-bridge.yaml b/Documentation/devicetree/bindings/display/bridge/simple-bridge.yaml
index e6808419f625..752c736c8f85 100644
--- a/Documentation/devicetree/bindings/display/bridge/simple-bridge.yaml
+++ b/Documentation/devicetree/bindings/display/bridge/simple-bridge.yaml
@@ -30,6 +30,7 @@ properties:
           - algoltek,ag6311
           - asl-tek,cs5263
           - dumb-vga-dac
+          - lontium,lt8711uxd
           - parade,ps185hdm
           - radxa,ra620
           - realtek,rtd2171
-- 
2.54.0


