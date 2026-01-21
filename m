Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E98BEC44502
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 21 Jan 2026 09:12:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Fbq78sea0hmX5//P4GjhYjkpSX+LqZ+KYNl1xezZDJM=; b=gOLx1yscj8hDAl34ddT+MigYbg
	GePnvX/Q1GtFfoYlcWXZQ8hctJ6iitM/AZtPQWD8yW12DB7vjxc6ZXNTjz2oescwgkrfKl4xknEwV
	N1l6MX6O3vr8gzfRXXGXgKO3GsL0cVafewbJAYWhRqRC6dfsxXKGXVXZvrjTBvOpW+DTNRPuF4Whe
	IsDQ6ycAgSAZwcJerdR5O1bNiXNqLxxjETjxLXEf7e1xbmdqtcnEo8eMeq+vaUYOerfvgXjGujMyN
	lypjfYuTNTj5arW5gm9P1su4mRBnGHbbX/FGHC/A3rHWU/ZTP8YxDlR6J3ZJcgkGTmbPuEwn1cIQQ
	MAohMxIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viUGb-00000005A2P-02to;
	Wed, 21 Jan 2026 09:12:45 +0000
Received: from mail-qk1-x732.google.com ([2607:f8b0:4864:20::732])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viUGY-00000005A1j-39wN
	for linux-arm-kernel@lists.infradead.org;
	Wed, 21 Jan 2026 09:12:43 +0000
Received: by mail-qk1-x732.google.com with SMTP id af79cd13be357-8c52e25e636so897688685a.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 21 Jan 2026 01:12:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768986761; x=1769591561; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Fbq78sea0hmX5//P4GjhYjkpSX+LqZ+KYNl1xezZDJM=;
        b=EzwERhwX4h2XJnE9AaQovAwK5KnzmSMzihuP5A0oBBDt67TdpCxYqJ+B+11xrUlh5w
         t8zeGhFhTsiJyBU1xq6E4lnnSF/j2Vtgv2uOpkB1BovGXeM1E2S/AbGBJgsrJluxW3HI
         YpHKnJE9bju6LwxUtNn26dxqLWc8YATRdSipiio2zzTwxj63uxLv+T/b9L5HPqqaya92
         6mqCGA6bYXPE8HeShqx68RvNqbIMsJ9HYSPkUXlMWAYrcznfbW//PNr4xpRjiockqVy2
         FST04QpbSV1C7ufaALVazor6qkwzm/mRrjdJcICajYc+WUgBEd6ZHelvhs3WyRuZDWbb
         knsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768986761; x=1769591561;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Fbq78sea0hmX5//P4GjhYjkpSX+LqZ+KYNl1xezZDJM=;
        b=UieHNo/1mM0s5Ly+MFNzAB/m3tbAerx/GpV/6VoWhP/x3Hau/+bhR8/D3aF4vWnTNf
         cIfAazxUWb1O3fco5GNZ+OkIyKAtmfnyazVYdKVZb28BREluoytpt1H2RxaYKoR8xzVx
         g8xmuO9StksAQc7XobgXt2bOSQ/WkX4TyhbkuTprL7/Bxg0tWLD/CU8hSmHQo1587vC2
         QXV9nG2hcH1YIz67c5983PHJE62IQie2BlkNdParU3RTuWUElLsd5zWcPPolUz/zWvA4
         LEoqYscqjGVftGMo8xInVzfA8qn1jazH8c6pY6DrNdP/nky38QjOSICZvCENBaDg/2v5
         FKQA==
X-Forwarded-Encrypted: i=1; AJvYcCW6RyPuRMe67jbXb7bRCoIMi5k4YUA2hNjQdn7o0/ivrU2BJ2ilhETOoTdxDh/Zkt80vRTsj4xruKsoM+w3f4T/@lists.infradead.org
X-Gm-Message-State: AOJu0YxVrN0Hpy8WGkwJnDe6It9Y7+F8vGCFxwfq2RU0ulKmUdeAViqo
	2f2NCUX7l2XJRsKTEtxf2LgSE/Glo3S+TFNmmG9OPcQw0SYBzQDEGsjT4VCZ/Cza
X-Gm-Gg: AZuq6aJsAGt5ugsiMUbS+wAXEj2g9GnzeDsMH1iP1++z4CmU5XC2+CZscz6CUAsqotT
	w9NXwuy9QM2vrIg6UiBA5V0cAOHWhv9NL0HihH5Qs+EOxbIyZia4Ep3RcOSC2oLVVtHhGWg2VAz
	f4JKiTCnQ0Jv/l0h9glEdI2hLRmoAsJSi2CH2uO5C7SGAcEaUksGAGLZSpJOoJwoemeHcZ07IYn
	eFo0EhtMLynB0MtYE4B53Y7CWNSVnjeHCIPOK29kdlimgIzkKiONIQFSW/2mQh+2qWqBd9bWWgy
	fQabkOubZ5IPx9fnH9NKix/aKV4sXGyS+Ie2JDLlmgkjKkdcD6vi32JDQKctnfCdEBbgiiSJp2A
	thLD007E9pQdGUJOi22zCdszHvC8JPg+gaAfo0QvZzmV3KCkNsYZSAQfyNmXOnog0r6FKg53Qkd
	sgTFaje8dk9Q==
X-Received: by 2002:a05:7022:6b86:b0:11b:923d:773f with SMTP id a92af1059eb24-1244b3081a4mr12334928c88.5.1768979609488;
        Tue, 20 Jan 2026 23:13:29 -0800 (PST)
Received: from localhost ([2001:19f0:ac00:4eb8:5400:5ff:fe30:7df3])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1244ad7201fsm24056346c88.7.2026.01.20.23.13.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Jan 2026 23:13:29 -0800 (PST)
From: Inochi Amaoto <inochiama@gmail.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Yixun Lan <dlan@gentoo.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Richard Cochran <richardcochran@gmail.com>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	"Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>,
	Yao Zi <ziyao@disroot.org>,
	Yanteng Si <siyanteng@cqsoftware.com.cn>,
	Vladimir Oltean <vladimir.oltean@nxp.com>,
	Inochi Amaoto <inochiama@gmail.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Chen-Yu Tsai <wens@kernel.org>,
	Choong Yong Liang <yong.liang.choong@linux.intel.com>,
	Shangjuan Wei <weishangjuan@eswincomputing.com>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Boon Khai Ng <boon.khai.ng@altera.com>,
	Maxime Chevallier <maxime.chevallier@bootlin.com>,
	Quentin Schulz <quentin.schulz@cherry.de>,
	Giuseppe Cavallaro <peppe.cavallaro@st.com>,
	Jose Abreu <joabreu@synopsys.com>
Cc: netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	Longbin Li <looong.bin@gmail.com>
Subject: [PATCH net-next v2 0/3] riscv: spacemit: Add ethernet support for K3
Date: Wed, 21 Jan 2026 15:13:08 +0800
Message-ID: <20260121071315.940130-1-inochiama@gmail.com>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260121_011242_793201_18B9E5D3 
X-CRM114-Status: GOOD (  12.67  )
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

Add initial support for ethernet controller of the Spacemit K3 SoC.
This ethernet controller is almost a standard Synopsys DesignWare
MAC (version 5.40a). This controller require a syscon device to
configure some basic features, like interface type and internal delay.

Change from v1:
- https://lore.kernel.org/netdev/20260120043609.910302-1-inochiama@gmail.com
patch 1:
1. remove phy clock
patch 3:
1. improve comment and include something special about Spacmit K3 dwmac
2. reorder the included file
3. fix wrong delay macro used in spacemit_dwmac_set_delay.
4. add check for maximum supported delay.
5. use DIV_ROUND_CLOSEST to calculate best delay configuration.
6. use assign for the ctrl register initial value.
7. fix input when calling of_property_read_u32().

Inochi Amaoto (3):
  dt-bindings: net: Add support for Spacemit K3 dwmac
  net: stmmac: platform: Add snps,dwmac-5.40a IP compatible string
  net: stmmac: Add glue layer for Spacemit K3 SoC

 .../devicetree/bindings/net/snps,dwmac.yaml   |   3 +
 .../bindings/net/spacemit,k3-dwmac.yaml       | 103 ++++++++
 drivers/net/ethernet/stmicro/stmmac/Kconfig   |  12 +
 drivers/net/ethernet/stmicro/stmmac/Makefile  |   1 +
 .../ethernet/stmicro/stmmac/dwmac-spacemit.c  | 221 ++++++++++++++++++
 .../ethernet/stmicro/stmmac/stmmac_platform.c |   1 +
 6 files changed, 341 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/net/spacemit,k3-dwmac.yaml
 create mode 100644 drivers/net/ethernet/stmicro/stmmac/dwmac-spacemit.c

--
2.52.0


