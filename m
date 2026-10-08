Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F5BACA6011
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  8 Oct 2026 17:53:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yY8SyQWcSYsDi8cm3rA+aW2F8vWLi9p/feyMtYn7Pcg=; b=JjOQkk7C0aU4E+9MA+iD7RN/Zq
	zWfUqj0jrbbuvFc5Ov6YozFo+36MZLo8QMm9bH9+LT/Z1VnfbtL2WtTgZDVS0dZR5F7GHFpyZT09l
	n73J1CPT/WIh3+IqbDj0m8/0CDiUfwOWgkSUpM7p7iXgMtMnomhjfMexZxhEQtBCY/B2lDGf6O3Co
	Xtcngz13iCj0KGbiUjxFo5aSt5el0UzR6KFvqfz3TVy1NT74iLIpC0l7HjkN3yGrtCO2JH+4t4aDf
	jRphIjazbgbzOcbFqIRQijSpvmWwEGAka99efKKQSKHv1ef7ZHtR+QdLA+TX37JhvqEBFnCUdE4Qr
	lFL4wJaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEsJB-00000004p5w-32EP;
	Thu, 08 Oct 2026 17:53:33 +0000
Received: from mail-pj2-x07.google.com ([2607:f8b0:4864:39::7])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEsJ9-00000004p3l-3vNd
	for linux-arm-kernel@lists.infradead.org;
	Thu, 08 Oct 2026 17:53:33 +0000
Received: by mail-pj2-x07.google.com with SMTP id d9443c01a7336-2e538951d07so21448315ad.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 08 Oct 2026 10:53:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791482011; x=1792086811; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yY8SyQWcSYsDi8cm3rA+aW2F8vWLi9p/feyMtYn7Pcg=;
        b=TTs4tPwb/xHGkCmBRejdTEe4hosMHB8ebQ+kCFWGVxhiduUD1WfyTNmhzhrj+i/9qU
         nYSkcWgtCGelicAXo+NPDBoYrVgEyMYW7GinNWf9fk7mBddB3i3Gwdd+lSlx2i4vv/og
         EWAsy80MGh4e34VSnio+owJJQw+ow7LCywhmvOV7Xpksha4uJQ4PG9pDCmq+8Tffjt5/
         vOur2X74Bd/8+WK10/ZWcnpBnwhPlxeKU4mKS9XRXQvE7odDh4ZyWSk/rpdAjxXNLYYq
         Z661Jxeot6d1O4lnH3ieQgTr+ZP+6kN39Q6N0Qe3g1tWs3TtgQ9EDvricMX7eFc9pXD1
         lhxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791482011; x=1792086811;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=yY8SyQWcSYsDi8cm3rA+aW2F8vWLi9p/feyMtYn7Pcg=;
        b=Lh5V9z6uEmLTBBQLX0Aktq06DP7T2kPf/cNf6aHHUHN0/2b4y+Q7+ldb5P5UO3iWB+
         Mz0Z0TLAYd743tNr0srnRbYtP/a5AFdeH1l7aQNsTKeyGGJM+cQMoirMvlBfNpoATHEZ
         qsfHusTebXJpMnEK86tACTsU2nj4R2N4c5g0JIIylCzFgQ/npfS2cZ1vgzI6s5+L9D7U
         lePFkFaWkn984QDTRb+1xh+k6rsB1CmtoZOG+NpNpED8szM7m+jFhtjSevSij8+FN6pY
         afLU5gBMOQFc7gr09E3cxX+N9XAXOtArjchzZK88FWprh7vLaqRhNt7jlWTK8ieUrJeH
         cpyQ==
X-Forwarded-Encrypted: i=1; AKwUvBzXwWS6QJUp76fpjD+yDUzbQOPkfQxfRu0sGnOkDO44z8ghHTad8oi6L4ICKlC4MQ8amjpMeNTcR0UZBkN/MZmf@lists.infradead.org
X-Gm-Message-State: AFq9FYKxuQgs8pbeXm7Kbr/kBK6UKnR2yjBwwebaW5xLWifVhuJqyjAd
	dxNbYlpBjf5KL1hchsCr3jb6tF3m+a4I6SdEYcOsS2bVOq2RJfpr7wlG
X-Gm-Gg: AYBFou2QnuRFlKDqxEB/b5iVlYAjmXB0Qpb6Jhy7MRt4QIWhb5GmqEuMVntw14vW/Dc
	Ynz2g6zV0dDLTSd+99D6+/5AC7/TK2rdvISe/pm55WPGdw6RfVKpltjkX1YcSqUF2HXRhBuJntX
	tp4XGf+QdvlFpbLi9XALPGXz+543Jmp8GsA1KZATuTSSPLeQsslIKvKKBOcyUra4sHrrWxDpFFy
	KiNIh/ifJG6Kc/O5kzTyj0zQAHgCWYORjNSL93Z9phE+LXoywEspVYNPkxcCkl9vhhfBKYpkd74
	P1sfiFCRcZq5KqcXKKQX8A6ESMhN3A6eCoLrUvuksnckPfHtZuLWshaLBZTnfsrYFXalVEg558d
	9wbInB7F1P0RxPdbKtc+ZX2qCILoC06fFF2F8DD1N/GY1ACCQjsEOwmPReRA5/IMWt6jYrJT2CF
	UTGGIsemG0Gm7JAvcNVAHp1uCsEFUc9EHkS8XgPpzvofeQuUNjU1psJ+92Y3Nyr0GAbmblRVc5K
	Lf0O7g=
X-Received: by 2002:a17:90b:534f:b0:3a8:59d3:5317 with SMTP id 98e67ed59e1d1-3a8a0cd4b4emr5164503a91.32.1791482011331;
        Thu, 08 Oct 2026 10:53:31 -0700 (PDT)
Received: from server.lan ([168.138.199.194])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ab3277c459sm144332a91.16.2026.10.08.10.53.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Oct 2026 10:53:30 -0700 (PDT)
From: Coia Prant <coiaprant@gmail.com>
To: Jakub Kicinski <kuba@kernel.org>,
	netdev@vger.kernel.org
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Maxime Chevallier <maxime.chevallier@bootlin.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	David Wu <david.wu@rock-chips.com>,
	linux-rockchip@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Coia Prant <coiaprant@gmail.com>
Subject: [PATCH net-next v11 6/6] MAINTAINERS: add entry for Rockchip XPCS driver
Date: Fri,  9 Oct 2026 01:52:00 +0800
Message-ID: <20261008175225.3375274-7-coiaprant@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261008175225.3375274-1-coiaprant@gmail.com>
References: <20261008175225.3375274-1-coiaprant@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261008_105331_983643_BAAD44BD 
X-CRM114-Status: GOOD (  11.36  )
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
index 65e8a4b5c90b1..2f0f46eabcf54 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -23757,6 +23757,15 @@ S:	Maintained
 F:	Documentation/devicetree/bindings/sound/rockchip,rk3576-sai.yaml
 F:	sound/soc/rockchip/rockchip_sai.*
 
+ROCKCHIP XPCS DRIVER
+M:	Coia Prant <coiaprant@gmail.com>
+L:	netdev@vger.kernel.org
+L:	linux-rockchip@lists.infradead.org
+S:	Maintained
+F:	Documentation/devicetree/bindings/net/pcs/rockchip,rk3568-xpcs.yaml
+F:	drivers/net/pcs/pcs-xpcs-rk.c
+F:	include/linux/pcs/pcs-xpcs-rk.h
+
 ROCKER DRIVER
 M:	Jiri Pirko <jiri@resnulli.us>
 L:	netdev@vger.kernel.org
-- 
2.47.3


