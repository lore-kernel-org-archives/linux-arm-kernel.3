Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 350A1D116F3
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  1 Dec 2025 13:32:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=jmWOE8tsVdZV+/3MWOEyJyy+ZPffvlIHcvjJiju9iok=; b=wGeJy4Ksv6K9CDSYxZam2EhE5e
	rQJk+87K9H3buKSFmM+2GXYrEbit3f2STShKVtMrVDwSspQN8U6ab06MT1HBhobj+kN5PhukeEBRx
	WBPsW1HieLViUGBQxRZWWALwEfTpfPFKDglmuMbwzl2R5AGKdmNSH0+kYF/uZ/7bz3MB2xiDaP6lV
	zgE2V7c5IrItD7mD5iPZjZuoRkidbYJcCo1mrqbJwaT54gvcRgjTHEOqjiWtPYqL1OZMy79yRfdtP
	3XdCilaEaFNxUMlRRorDO+6kizY3a/XyNv33R5z0EoQMi/vRNSb/7HR3JF8oX5S3Yw1fR1kkNhFgS
	N6CIaDOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQ410-00000003yzG-1Myb;
	Mon, 01 Dec 2025 13:32:30 +0000
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQ3dd-00000003gze-0CsL
	for linux-arm-kernel@lists.infradead.org;
	Mon, 01 Dec 2025 13:08:22 +0000
Received: by mail-ej1-x62a.google.com with SMTP id a640c23a62f3a-b73545723ebso822940266b.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 01 Dec 2025 05:08:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1764594499; x=1765199299; darn=lists.infradead.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=jmWOE8tsVdZV+/3MWOEyJyy+ZPffvlIHcvjJiju9iok=;
        b=Vixfoh6CQBlOBX13bdwRwB80btvH5FkL3mvkRMqU8uROPuMltks2oK6FxjNPXilZiU
         Br5ENXRX/AaKNWmYX+QkUpPcLdwpW6pywtcKqdx+syK1mPKgXnpPJP0ReD0rhNjqgY2o
         xEkKVuVPUwq/HkwmUsVjeDfqWao2b7rSL7+PzoTPt1wX5WwisbGcJ0Z1t34RDDMcikP9
         Buh8xlrrrDVyflmQBc7Sa1pGWD4elo1F4XJn5QOLIxMBgvhZC8QffNHaMGJmcOhoIyO8
         hu1dnTtsG8h4XecGlgTT2XCovFQgdALlLWc3mzmj21iX2cX5Frjcd5gC9CZAlc5oPPxN
         4sDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764594499; x=1765199299;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jmWOE8tsVdZV+/3MWOEyJyy+ZPffvlIHcvjJiju9iok=;
        b=SCPGJ/K/Bw2WjT2ao1VHJoNQRFvFIYtQmrDWoge8epeq0DYWQi0fsNq14K6W8CvQUr
         XBnqS77gtowEluoWlObL4j18Dxo9m+aP/KfA/Gaq+m89wYJk3umvQaulkw3iWgTxqjD2
         DQDMRKBiL4qPAY1vgS2WSwnKoJIbSZaV91GC79Bzjd8BKU2rekUksDxJL1kejZfeA005
         A34XRjX/usfWr9/e+rbygwZwMxB3tmHnZYYiNXurCReRrT+Xmsx2yg3DRz0lKP53xShP
         IWKt+Q8PdbdXVwfzegc0ne1jtDcXJ2preT29j41+RxwobPAY2Sv3WOMoo9EHyDWg5Q6i
         K6Uw==
X-Forwarded-Encrypted: i=1; AJvYcCVpzHxxFqFwuWgDX2P7x1r6XAEp7vF80rO9EfNnNE/l2IeOWbyqvVIQ5CUwBBgPK6vAtx6sLBOm/gj/6usF2+OS@lists.infradead.org
X-Gm-Message-State: AOJu0YwrTRJs0/hbdUYPHl8vdfYlDpsAU105s9QdnBBpjfZR72EOKNzI
	J+5RW5fLTttOGEWzO7e3HbVNhWInRiUl3H7kEA7QL1MYcDJiKqcht2kvWpcQZOKuW74=
X-Gm-Gg: ASbGnctc8nzquzOqiuCQ5/RVrARmqCyiccDopgZ8U3YJkTMKuoPsoDUQ/7sPc1RCmBD
	FNMf2PWuC+cyhZWx5skz38VHJZs/L5lJSSQg+d7nrQX8tXYdTzKQ6hwF1U381AS58DDMPVJ7v3R
	hgusriZtLk5LpjrkQd9rNFL0ccGsMp2sRNhaoxEhNz5WH8Unjy7t+ol8z/XTsbhlS1/i6yu9jgq
	kNQNwNucjUIHug8yHbzjDT7iZovik33kvOMbG7k8qYG3nTHitdAVqRZmH+vedxVLQaaqvIN9gK3
	6PBe4u4Ps82DWtaxUTYogsa+tK6Wvmj2sDYWQ+4ycKwaqtUFgp2Wh03UjIqYewctfC7ewEp6QWq
	uOiGoTHA6okymz3QU2NEXh0l1F0tMhiSX4ErMbGgDwLovhku4pBJ9m5KjsaNkAC0SKf4P3MxbRm
	ns/kUcFTwg80ETGfte
X-Google-Smtp-Source: AGHT+IG+9MCSjBtPt6W2+zBUhes3WpovLtX4vLeIrokTyK95t4Xc4QrjoCg1IRxwpvpD0DbH6J0bKQ==
X-Received: by 2002:a17:907:e8c:b0:b72:eaba:aac2 with SMTP id a640c23a62f3a-b767173c3f7mr4361122366b.26.1764594498454;
        Mon, 01 Dec 2025 05:08:18 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id a640c23a62f3a-b76f59aecd4sm1238751566b.44.2025.12.01.05.08.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Dec 2025 05:08:17 -0800 (PST)
Date: Mon, 1 Dec 2025 16:08:14 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Chester Lin <chester62515@gmail.com>
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	Conor Dooley <conor+dt@kernel.org>,
	"David S. Miller" <davem@davemloft.net>, devicetree@vger.kernel.org,
	Eric Dumazet <edumazet@google.com>,
	Fabio Estevam <festevam@gmail.com>,
	Ghennadi Procopciuc <ghennadi.procopciuc@oss.nxp.com>,
	imx@lists.linux.dev, Jakub Kicinski <kuba@kernel.org>,
	Jan Petrous <jan.petrous@oss.nxp.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Lee Jones <lee@kernel.org>, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	Matthias Brugger <mbrugger@suse.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, netdev@vger.kernel.org,
	NXP S32 Linux Team <s32@nxp.com>, Paolo Abeni <pabeni@redhat.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>, linaro-s32@linaro.org
Subject: [PATCH 0/4] s32g: Use a syscon for GPR
Message-ID: <cover.1764592300.git.dan.carpenter@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251201_050821_105276_0C4BC1F8 
X-CRM114-Status: UNSURE (   9.17  )
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

*** BLURB HERE ***

Dan Carpenter (4):
  net: stmmac: s32: use the syscon interface PHY_INTF_SEL_RGMII
  dt-bindings: mfd: syscon: Document the GPR syscon for the NXP S32 SoCs
  dt-bindings: net: nxp,s32-dwmac: Use the GPR syscon
  dts: s32g: Add GPR syscon region

 .../devicetree/bindings/mfd/syscon.yaml       |  2 ++
 .../bindings/net/nxp,s32-dwmac.yaml           |  6 +++++
 arch/arm64/boot/dts/freescale/s32g2.dtsi      |  8 +++++++
 arch/arm64/boot/dts/freescale/s32g3.dtsi      |  8 +++++++
 .../net/ethernet/stmicro/stmmac/dwmac-s32.c   | 23 +++++++++++++++----
 5 files changed, 42 insertions(+), 5 deletions(-)

-- 
2.51.0


