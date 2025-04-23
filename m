Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED85CC369CB
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Apr 2025 06:19:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Mr8rvSiMKhhr7+g2wBjSbr4ZapMlTY5YRIRH4XPzpek=; b=mk5YlcWuODR7IrUxUN5FYzt4+o
	UT7bZUj99wAh8lOP+VDDM9v5A9kiDoDvk7mmy/0a5BHunY8alRftcsCL6P15C6NLwcFrrTEFE5Rjj
	svRnnzBtUF3gvlRyjZigZdJq2uS0cNClHlJqLaAZz5E89RVC3lwHISqK1MJwVoqdhw/rpglh21qBD
	Dnxde1JRlEYxn2Td5oTf/VOAubGPKDzQseN1QG7OlHV+BKbnjE1//Ujd7XP1g2puuddEBBc7V9OBm
	6ZsY1uDyt3KeejTLH/wRvVfr1nBmjpjnMRndAposou7vAlmvSYxap6s0I/pZOK+kaMsVPagQpvw/3
	Xngw2IBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7TS5-00000009KPf-262x;
	Wed, 23 Apr 2025 06:19:21 +0000
Received: from mail-ej1-x634.google.com ([2a00:1450:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7TCO-00000009HcN-0I5f
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Apr 2025 06:03:09 +0000
Received: by mail-ej1-x634.google.com with SMTP id a640c23a62f3a-aca99fc253bso854604666b.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 22 Apr 2025 23:03:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1745388186; x=1745992986; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Mr8rvSiMKhhr7+g2wBjSbr4ZapMlTY5YRIRH4XPzpek=;
        b=aUQPyop+JcimKnlnTZaQnP2AbnCFWJEdOKMnvPZwegMke55fnCDViYkumzp7BfxfxH
         bWS00Vb4EoMKwR2ZuI3krI3GEBBAo/Y3zzvg0ANUuLwrHf3Lvmz0nidvcch9fBS4dYB9
         bbvK8kXYJ2a7NlI42Up5F+XuH9E8DGJHg/y8w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745388186; x=1745992986;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Mr8rvSiMKhhr7+g2wBjSbr4ZapMlTY5YRIRH4XPzpek=;
        b=NSJ4cOGdjsREPVMBjP7Ps6t1TCAF362GW0KfAhcUSNgO3H/xLPymDlikys/sMZOo7e
         Iz6LfZslLzRbKIp2TroFuMR4bVkDdGu/XlpjEaLcOeksEcaLbOwVyr72TWpVOIiL6X3+
         t2DIucWG/7FlpxW2xneujj2w6qxUt8j0zO9v5PnZ7ZEiA9vSy0UMx9DQg4oLbMxWDhrL
         dc1JmeTMwqdT4gOAZZehal80VHyuWmP2znEo7pJ1JQW+kz/pL3isDto+f9a0h4QQy+Gw
         y9Pzlp9uQo9V66lYV1CdSvVIMy7cUSI+8fABVCFTd2v1byUkPbzHjx//beFirgmKXL2S
         dXDw==
X-Forwarded-Encrypted: i=1; AJvYcCV6cpQzdxJ08FkZe1kMiMEhm48j/Dpu4jTnKxEn5NovDyyj1ShlaXGjHyFe67IW0QkOumOMj8dVhEpzzz+1mb1U@lists.infradead.org
X-Gm-Message-State: AOJu0YyQV+1y3NJJfaB75s+K64uUxxi65/W2oFj1DXcYSTw0yBpc+pYo
	3P482EJfKalj4btMyS8jMbepXDDI+CbwxOjkAfpqfJ8WtnD2OUjxkpuqdlIWDIA=
X-Gm-Gg: ASbGnctFIqmOiBlJ2i6nMx6Xt3v3BoeJniyf2imGLnduIrQRXYeUBCYN+jNhqcmyrD9
	nXfty12Vnju2MJv9WrXXbGU36906oSBEBLhx2OF7N4HrBScvvzLCzAze0c7aQz9RBa5EVMmbbPv
	gudA9WMYcQXQPijDWSAK2+2Ka/n6K6G2WfzqXocZpE8CubFSyzWfCzDIlW6IfwOjuTIQLEgR5uS
	9x8w62ayaP1pKHVbwctuLQFhDBfsOSk1PfcdwgpZvNcRWZR+AZDpf/eIaCH+nd+a/AQw0+j6RB1
	6dUZ2APzzPtg4RCC/q48fynVOw4d+fvo0XRn6rHUn6ALiSkVscmEo3fwXRTALp0PPciMgOkDTGN
	YGi0Gm30oemJ4/oc=
X-Google-Smtp-Source: AGHT+IFHRVjgmo/Rf2x02+US2TOfqy1M37ZfZe16WxtkqyYMdziLzd+0fdDR5em6xjEUFwKXEO/9vQ==
X-Received: by 2002:a17:907:2da4:b0:aca:cad6:458e with SMTP id a640c23a62f3a-acb74dd6021mr1627869566b.43.1745388186587;
        Tue, 22 Apr 2025 23:03:06 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.. ([2.196.40.29])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-acb6ef9e7e6sm745234366b.162.2025.04.22.23.03.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Apr 2025 23:03:06 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: linux-amarula@amarulasolutions.com,
	Abel Vesa <abelvesa@kernel.org>,
	Peng Fan <peng.fan@nxp.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v11 07/18] arm64: dts: imx8mn: add anatop clocks
Date: Wed, 23 Apr 2025 08:02:24 +0200
Message-ID: <20250423060241.95521-8-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250423060241.95521-1-dario.binacchi@amarulasolutions.com>
References: <20250423060241.95521-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250422_230308_109697_879A88AB 
X-CRM114-Status: UNSURE (   9.45  )
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

Add clocks to anatop node.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

---

(no changes since v4)

Changes in v4:
- New

 arch/arm64/boot/dts/freescale/imx8mn.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mn.dtsi b/arch/arm64/boot/dts/freescale/imx8mn.dtsi
index a5f9cfb46e5d..49be492b5687 100644
--- a/arch/arm64/boot/dts/freescale/imx8mn.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mn.dtsi
@@ -606,6 +606,8 @@ anatop: clock-controller@30360000 {
 				compatible = "fsl,imx8mn-anatop", "fsl,imx8mm-anatop";
 				reg = <0x30360000 0x10000>;
 				#clock-cells = <1>;
+				clocks = <&osc_32k>, <&osc_24m>;
+				clock-names = "osc_32k", "osc_24m";
 			};
 
 			snvs: snvs@30370000 {
-- 
2.43.0


