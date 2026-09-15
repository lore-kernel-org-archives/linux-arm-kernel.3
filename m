Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6481C88E75
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Sep 2026 10:43:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0uZyNoOS4+9a6tqQ5tfX7sqcJOVcaT+yLp/MXx9OSW4=; b=tV2YUcOa5MIsriFKdngxwRe5Oe
	F9MShLO1t0RzPBNIq/9ZhoHBkQV0dt9G9ygGUzhkGIb9yX91h9xjH33t6kk7BE8Re6qY2Pk9EVftC
	G+980h0B5u94XSTGGxvoBaQd2vhsSG0eVD1Qy1nIYs0kr+9MJwh6AOay5CUAVDEtluMHX9LNSy/R4
	DW6u7msg3kq0nuZ/oTUeTaW5keQNBBTRmaka86UocqHpuZJ8aexLlgzIdMnQEB/fXsODqe9qVIoh2
	OvJy5Sm93XNlSPTXAj+P4Kv+5Sytkr8EMvp61uQvhoa5+LqdHj4bJqyFB84nLTzO2W/v4YNmeAvOu
	NX/8AZDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6QdT-00000005xUd-44Dh;
	Tue, 15 Sep 2026 10:43:35 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6QdS-00000005xSe-2gw4
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 15 Sep 2026 10:43:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=0uZyNoOS4+9a6tqQ5tfX7sqcJOVcaT+yLp/MXx9OSW4=; b=hiDK1QtNNaP8Wih2/WT2pm/m/j
	31MMa0xncHkP1ZUonX4muCqDnax+z4/NZVXLojOYRHgNg4zBGSiABFUgzum0ErpzEffs7BVJEcBY9
	+itLBcdNqwnHpPHYXro6NhYjUIQ1fc8xzK5k1g1KQ8vrJ4IvUbpfFopqOnuql0498V3krbaBjQvfV
	2P3GO7I+GKitsKfK0hW4/eF3Aipl2PRmcvn8j4aU9tWsBnW8Jq7gsIICzi3FojAkCYAvJelH3JjSl
	cpr3/+ON/3k3JP+r29y4rGXvI91/Dgu+0UgATIqIKKbIQhthBdJlgN/zU+i/XzrX1EsA2NiPL/OK/
	uDsNPRPA==;
Received: from mail-wm2-x10.google.com ([2a00:1450:4864:31::10])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x6QdP-00000006ZhA-3M6j
	for linux-arm-kernel@lists.infradead.org;
	Tue, 15 Sep 2026 10:43:33 +0000
Received: by mail-wm2-x10.google.com with SMTP id 5b1f17b1804b1-49b912d391aso921365e9.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 15 Sep 2026 03:43:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789469009; x=1790073809; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0uZyNoOS4+9a6tqQ5tfX7sqcJOVcaT+yLp/MXx9OSW4=;
        b=igJZJtltHUp8gqDeLlMEulm6BSo5so0MRnQrlANvQxAEWJ2BrV0hIP5/oervlodqlK
         m0BdDMcjLEOu4IAKDim+01yeSQZe3NM8lXPtM6+QaMGtKoTZN+k2Bm13audxHuS92z5O
         FknGvhA489W6REbXTlRGICYkgBLNDuqFQEGvhgvYzeHm/bJBkhJkDE6cRosxkXbU85ja
         LT7UxJquie4pH7jXH6sAoqKyg73S9k+rHJuf6D+Q9vnKl9DoL9WO6RVww/Xz6CfzpU8Z
         o+WO/WD8RDnofaW8F3A6LKvrEF24Kba3yO5m2QLE9huS3/7SZizjStSbKkhh80prqQBX
         f1OQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789469009; x=1790073809;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0uZyNoOS4+9a6tqQ5tfX7sqcJOVcaT+yLp/MXx9OSW4=;
        b=qEFdyHKKma8d3sQ4TAoB1lvNaTnRwZhbvyrVdAaATUYzgdu2C4T7YmUN4KLNsPS12C
         JN+ZWfgbUDC6RbCTQzkSdmc9ndQW5PWYjDxGS9/3LmawRv67hlyoHhGoimQMR7PWrVwU
         O1BT2dMXjBhkuHkUCs13LWZV5pcoDKZR+dIiwdwEIqor/0xMp1+iohd5uTcLd7a3U13s
         MKnIaIz/zrOWGkmKlfRe0Sid6n+2xhvCXgtvzdK+XcVBeqAOxSBX9Ld9gfoUKay43yKz
         sCgo2mrU2Vpd8OmbtHS9c0uQ/YJZXm+qAoC4J3+b+BKzUiEEGtiapyC3gQ/WC9b/0GOV
         nrxg==
X-Forwarded-Encrypted: i=1; AKwUvBx6qALSdpvNMMuj/Pn+yKa5ATC8wNQnKJ7l8BgK02YbCn2nuVGJqEhEq8YdddI8FROLlnuxJSC6RUu5/7JGej0W@lists.infradead.org
X-Gm-Message-State: AFuF++l11nNuKnCTko+n0hkX2eCWep+OFZziezYTg2jGMtUJjaSTQnIi
	3Mq4KR1pHLUznv63bmeSB+dEeo3lAWHAtljinbZVIE47ygvL6EDF6k0OqQ4jnA==
X-Gm-Gg: AYBFou1ynsFbuF7Mci6Tj8drVnk54T1ozYObDMijngXlX1sEEKu+auHTg8LXfaSpU6i
	GyiyLtrzWaPpy4p3Gc/hl6CEjkWDqRRSDgKtIVRptEzubw1qhbbeCW6FsfpzpODZwFK5Qz020jb
	dciCxAhtoxOXbvGl12riT3Z9v4QrovLbBpUOCZPXsuVnRVbon4A/3OVLJCQy+0BrmI2SaKVu1dT
	S9L8MoXB4/oaKwiypI+zCG9Thr/bWaXKoem7xTP7UC5A5NzEzoB8nquuVzsqGJireiEFXkfjELy
	VdVOD8yhZh2RxjQApEC1bK3TIgj6wlBQ8TPZQQJeld/snnzZYW+TBubwGAvvCL3bskVsjZPv9jR
	zq/u8RzGxLut1b6cjWV2aCRTgfio170nhks2eb+2NFfvFgwRWSIXGBv8+sn5RKV7KlCm/Wr5OEW
	ja19Id/H2bKjL9zaeFJJ1EouBhMyNYvtFMgardNXHh9Uf1pOLPyJGmjTfth5CPTDdxX0dOwEEjM
	FvmxZEMmRICr9+GjY8tiQKma+7vuAGg0IRtGR0RBf4rLrQ2gfpAOb6YRcjS2wp0PsO7
X-Received: by 2002:a05:600c:4743:b0:49e:7cfc:a9b7 with SMTP id 5b1f17b1804b1-49e82257f4bmr8382775e9.18.1789469009197;
        Tue, 15 Sep 2026 03:43:29 -0700 (PDT)
Received: from [127.0.1.1] (2a01cb0007c59900d73f8285c1e647ab.ipv6.abo.wanadoo.fr. [2a01:cb00:7c5:9900:d73f:8285:c1e6:47ab])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e7d2a94b9sm58001325e9.3.2026.09.15.03.43.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 03:43:28 -0700 (PDT)
From: Amin Gattout <amin.gattout@gmail.com>
Date: Tue, 15 Sep 2026 12:42:46 +0200
Subject: [PATCH v2 1/4] dt-bindings: soc: rockchip: add rk3576 csidphy grf
 syscon
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260915-rk3576-dphy-v2-1-b56e68b54b8c@gmail.com>
References: <20260915-rk3576-dphy-v2-0-b56e68b54b8c@gmail.com>
In-Reply-To: <20260915-rk3576-dphy-v2-0-b56e68b54b8c@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>
Cc: Michael Riesch <michael.riesch@collabora.com>, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-phy@lists.infradead.org, Conor Dooley <conor.dooley@microchip.com>, 
 Amin Gattout <amin.gattout@gmail.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789469006; l=963;
 i=amin.gattout@gmail.com; s=20260818; h=from:subject:message-id;
 bh=OT1ITsHPctK+L8lx0K+iSmC/XdR3PBM/mhi/vcMFiXs=;
 b=xHW4ID866vtDzWpfHwdm1uVBYofPXy1A+IXn6A13CkcRw1xUF5qIJUH44laHofEaIxFhmo/Ls
 upqPyAcWXRQCvLqafGXxKHmCv/ihMy2SrzCuxJoYmPH/nvS2amffFBs
X-Developer-Key: i=amin.gattout@gmail.com; a=ed25519;
 pk=MSIqDPkCOkwtyP8Fns1m+KFU9SgqoDl2mpLe18vL+hQ=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260915_114332_004495_3F77E705 
X-CRM114-Status: UNSURE (   9.94  )
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

Document the syscon compatible for the General Register Files of the
RK3576 MIPI CSI-2 DPHYs.

Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Amin Gattout <amin.gattout@gmail.com>
---
 Documentation/devicetree/bindings/soc/rockchip/grf.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/soc/rockchip/grf.yaml b/Documentation/devicetree/bindings/soc/rockchip/grf.yaml
index 7bcb4e2f47ec..e94c83d7c138 100644
--- a/Documentation/devicetree/bindings/soc/rockchip/grf.yaml
+++ b/Documentation/devicetree/bindings/soc/rockchip/grf.yaml
@@ -32,6 +32,7 @@ properties:
               - rockchip,rk3568-usb2phy-grf
               - rockchip,rk3576-bigcore-grf
               - rockchip,rk3576-cci-grf
+              - rockchip,rk3576-csidphy-grf
               - rockchip,rk3576-dcphy-grf
               - rockchip,rk3576-gpu-grf
               - rockchip,rk3576-hdptxphy-grf

-- 
2.43.0


