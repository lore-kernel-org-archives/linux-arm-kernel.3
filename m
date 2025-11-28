Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05296D116E2
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 28 Nov 2025 15:00:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pLPLsMZ0Rfo+ZS4duCCd3bYfWswLZlnM4WVeFNQjOUI=; b=iVlxI5OkNrGkXaOJAbJh+dMDDW
	q8yD2D0OF3P/5I5+dFs5SZdQtthmD74UW+KWP7sT2UZ09sDtNhba4iTRMEVIe4b29FYKqE5Tb//pv
	6BbSc81SVo1lcOBK8gZJbFrrqkMD1h7pCO9Yoa+uJ0sVY/WVnVx/q9pdZw1yBtvqt3S5r7j46zbmK
	nqu5ulM2Yini/YttQeMjX6W96BNtnxejglBiHgmm2xJdcqhFcxWKwF20xiKB64GNApFzPg8nXLwgr
	hDIVIGcREcdL7dbcOEEC4kPv9pJM0dAXRoHimDcHy/yMrmdsa48m9ibyVv9U6YhuwOzOcYkY8DYVn
	zAE9uFLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOzxn-00000000YpS-44N2;
	Fri, 28 Nov 2025 15:00:47 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOzxh-00000000Yn3-1CKK
	for linux-arm-kernel@lists.infradead.org;
	Fri, 28 Nov 2025 15:00:42 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-477a219db05so10999415e9.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 28 Nov 2025 07:00:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764342039; x=1764946839; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pLPLsMZ0Rfo+ZS4duCCd3bYfWswLZlnM4WVeFNQjOUI=;
        b=G3leVy0YEQ+/wj+65aGvWki4cou+e7evYb4AzKm0rrwFDu2xVp9J1VjL1jIgAS3mv2
         Kz2dpPgvNzXhrRu/C17A7dC48Wnj22MgyKuTfgQXXoLN55Fnz31E187HJVPkuMYA0phi
         V6qdSlfCaBfPMp66gx+7arNHQ+4OXrwfRECN8P+Nj7yUSHoyjvcaoHL1mAmhbnwqyvRs
         psn2GtBe0N1W9Ed/ajgnjkBK7UG7sUBX7/nzygVAibjpgOKZh++U/JiC/1GDy/5hg1jI
         z7LuM22GwNVkJQAfknacL+wF9SjDIfzobT1n5ZkvbHfHP+HM4YdH7LQDNgJ/li21kkAH
         0azA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764342039; x=1764946839;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=pLPLsMZ0Rfo+ZS4duCCd3bYfWswLZlnM4WVeFNQjOUI=;
        b=JOLk5M4hAMfVPZGVlgCeGo5WZpIjmDiEf8CFmt4SzotWP9w8xVs3OBrVzMVx8s7BlJ
         CTeWsie7AmH02oSgu5wUiMBgAlYmUePX3GAugS5kyhWkALAbOetTmQdYVOzA24Oqgz3d
         SBARZywAh/Qa45nksF6I15LWX1G/tgFhROZuWqb8SBmk14EcyLc6gKgM74qM5wcrFuZd
         yeElwnybsVxw2PdckQ0mXvM8XL7Y832/dQqjm7dg6rJLeyqJIFjoCdEhbb9L2K/fEwxw
         khfxyndsItLVXUf1PO7P39rCYgXxWUGXPAnWL5uFjw7t+6UwVsJa/OkQuTOu4HtM5rVv
         0wkg==
X-Forwarded-Encrypted: i=1; AJvYcCVD6CFSwkvySqWM1Z9dFzdNPT3PH3Xn487IdKqcIvhibMaqiQa3nFiRMH7yS42aPnZzJhcLx/ELcs+DPQN+eS+c@lists.infradead.org
X-Gm-Message-State: AOJu0YybA4mpa9i1+YLLCXLOo+EZ7v4p+DK40pzk6RrtloZf5y3DeCJT
	c3c3hGOVxKC8eCoZJHpz2HwyFUwBmV65Zy1OufOz9kr3rismutpvmPxj
X-Gm-Gg: ASbGncuJ6EN+6TieqIpIJ7atM6O3NUQW00F7Q6CEEnFCT644xcGkm4PBDAaMXePpqZR
	fLwJ6rNhSzff5TncdFt4eK2NQOYM3E2ofTaNhYv2Z+6laoGwzfVgTOkPtwoX+UYbf22Y1sjqHno
	4WGzJBDW151eDmgtAcowudERaiVoq6aiy0Dh5ZrZlT0W6HmnFqdfk3dd6ZAjk4JPQhnaAiHOwtR
	kRDx4ehg1CzqPW1vWHemn6IiiqzHiQCSf4nfq/MP8asUkcZsDERGhimk/x/T+KPokjdfrlnH0nj
	hy5xnNhY4KtuPNqecdE0BYi9XSgK1WLOrI7U+OrwllftisK9DuZNWTB8mwcySflmgvaIsSCm7/k
	U1GVcRRbh8Sz1Cf5b9lAING72it2v+1fUf0vZvL82OSdY8ftweQHBINKTerEFOC+VPVjcB2DDNu
	+pF+0J9xqiP+FvYHygkRkl4lkO7O8=
X-Google-Smtp-Source: AGHT+IFlgJFRf2JMoaAN9eltREbdMzQ6kGR0QfXm0xys/mdvmCQM8er4HNjXsyUwxtFVt0idR/zaNw==
X-Received: by 2002:a05:600c:a41:b0:45c:4470:271c with SMTP id 5b1f17b1804b1-477c1116de7mr269345345e9.18.1764342038958;
        Fri, 28 Nov 2025 07:00:38 -0800 (PST)
Received: from vitor-nb (bl19-170-125.dsl.telepac.pt. [2.80.170.125])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47905303963sm93117975e9.7.2025.11.28.07.00.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Nov 2025 07:00:38 -0800 (PST)
From: Vitor Soares <ivitro@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Cc: Vitor Soares <vitor.soares@toradex.com>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	ivitro@gmail.com
Subject: [PATCH v1 1/2] arm64: dts: freescale: imx95-toradex-smarc: use edge trigger for ethphy1 interrupt
Date: Fri, 28 Nov 2025 15:00:27 +0000
Message-ID: <20251128150030.35931-2-ivitro@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251128150030.35931-1-ivitro@gmail.com>
References: <20251128150030.35931-1-ivitro@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251128_070041_344258_216FAC73 
X-CRM114-Status: GOOD (  11.75  )
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

From: Vitor Soares <vitor.soares@toradex.com>

Change the PHY interrupt trigger type from IRQ_TYPE_LEVEL_LOW to
IRQ_TYPE_EDGE_FALLING to match the PCA9745 GPIO expander hardware
capabilities and avoid emulated level detection.

Fixes: 90bbe88e0ea6 ("arm64: dts: freescale: add Toradex SMARC iMX95")
Signed-off-by: Vitor Soares <vitor.soares@toradex.com>
---
 arch/arm64/boot/dts/freescale/imx95-toradex-smarc.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/freescale/imx95-toradex-smarc.dtsi b/arch/arm64/boot/dts/freescale/imx95-toradex-smarc.dtsi
index afbdadcb3686..2cbd5606cb19 100644
--- a/arch/arm64/boot/dts/freescale/imx95-toradex-smarc.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx95-toradex-smarc.dtsi
@@ -582,7 +582,7 @@ &netc_emdio {
 	ethphy1: ethernet-phy@1 {
 		reg = <1>;
 		interrupt-parent = <&som_gpio_expander_1>;
-		interrupts = <6 IRQ_TYPE_LEVEL_LOW>;
+		interrupts = <6 IRQ_TYPE_EDGE_FALLING>;
 		ti,rx-internal-delay = <DP83867_RGMIIDCTL_2_00_NS>;
 		ti,tx-internal-delay = <DP83867_RGMIIDCTL_2_00_NS>;
 	};
-- 
2.51.0


