Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EEC4CFD45F6
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Feb 2026 22:28:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RbmElmhsWLmxkCWwbLCza2bJ6ctDAX0b+gZt/+eBHkg=; b=oEmOgYshbBnRPBFHLdSsoyWrGY
	b2DE18VA5Ll1MZWSMgNHvOpBa69Qt+pAOf7b717oliQNOws0kNvvpJ7ioVbowNNbBfUOX36EPKjJE
	gpqdojP72fVIQBD5kO198in97XbWKTiYXixceLz1LX9WIM5y/rX2PPprSRzND217++A3lE+JVgfrk
	VUCp+XVnkoA3VSnaAi/V1vzi66aLmkurx0JoBRG0w0RVztbPUJxSUYZW+y+gMvBQ5ZHAgbqdWkmu+
	uz+aQomAjTBBKuzY7uJX3SdrND0AXuQ1pBXe1phXDbPKYRqExs2YKOve9EbjfRWPvxXHItcGv4L/t
	mbwIg9rw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvNMJ-000000050Mw-3kt1;
	Wed, 25 Feb 2026 22:27:55 +0000
Received: from mail-vk1-xa36.google.com ([2607:f8b0:4864:20::a36])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvNMG-000000050L9-1HGg
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Feb 2026 22:27:55 +0000
Received: by mail-vk1-xa36.google.com with SMTP id 71dfb90a1353d-56a91a5e64eso61863e0c.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 25 Feb 2026 14:27:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772058471; x=1772663271; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=RbmElmhsWLmxkCWwbLCza2bJ6ctDAX0b+gZt/+eBHkg=;
        b=lDRv6UWAynFaM08Gf+5ucgg/lewJx8NSbcVq97CIXZ0IQYxDaWDZTx15ZhQ9CITEi8
         Zh3p4XwAVsPUNa33Eimz9mawyw0TmNZQpGs/KikguuTlTDGAszQBnlFuCcIM9F9R9mkc
         b7T9hjqml9TOQz7m9Mi+omZJ7hkRniSx4pEUkziom474NigzKUYBWCHHCysUNqcAGGYq
         MtJnisVWpxHKS4+AQ6+t/2cDtGoDOUbDbQIZrAoRajP+pBuQKHsVnjIKF8B8aJrN/qq5
         OgdowT5lku7sCAFSMme1LIABtNYFV/90M9egaXlYis47OsP+RhGB8x0kR5Ts/Ztnd242
         g8Ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772058471; x=1772663271;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RbmElmhsWLmxkCWwbLCza2bJ6ctDAX0b+gZt/+eBHkg=;
        b=bF65zZFfR38Lgy6Pgx0yQshaR0GDNv/uqLIVQW0g467YGWL/XwvuUOhsDMBpVwX2Tc
         a913NGeAePehXLZBB80R41W1pNhv3yUgt8FTZeHh58iNF3Ddod6/Unygzidmpt0O1y9U
         Lt3ekfKh6aO/oKjHKBSzngkrkydCfmCYZfEhbv9uln/rEg80upZ2xWsISY0fcjNiuNuF
         G7ggKZFQUSxPAjgMfej3rSxMTXaIFzdSBkkj0yyeaYiRlEJQjeQIinRWdQ4XQAkHmVOR
         pRfAYfEFaQWNcEAEALEBQPsd+PqlUqnGbC/rk/BHsEetaLXMQlnuh+uRq5dMDkT7VsIe
         Ah/Q==
X-Forwarded-Encrypted: i=1; AJvYcCXVWKArrm3DJyzi654I2wJA5aD/b+2xOPFqfCVoFPeocR0a6URu9aKDpZIniT8cTB0q+DhjJswyucEBFTW7xn+d@lists.infradead.org
X-Gm-Message-State: AOJu0YyB5cX7TR6Ps9xhIUJTZTrJGe2K/vOuAG+XXfw8APa7V3u3JbtL
	XfTpVJjoFN198w1T1BmWjWmZTp+IzBIhuinfjWTLQuABKcSJaVomU+aO
X-Gm-Gg: ATEYQzz83p7ZurGLJ36KGjBDsaDvkkxStP0eOCLU0kuGRVu2ZSrTzevas1JoazWjDaC
	/1xFCMjwr+SURQzxSaYm5NvvQF1w1lE5Hz7B7d1bagCi4u3RKHWT4wZvZSAL9KruWkfzjjtyi0R
	yervvTA6c5RvzApOaDKtWZbkswRm+fbvePXnEcnBoPcD6hBsd7klDlvwKqH0hdPVmMKplEWAKHn
	DTo9g7xdBC0LpPEgqQ2GVHG1Xh2ShxHeBBjdhIjH+5rftrtcbeX5fTccYiEaQv/V7xXB7aHsLSn
	z89/M3WRqgwsvn/SPGMd8FmSVPYlzxeOU79Sqplk+7DF2VhjP6xuCjeXSWHqSiLCrPRPKhqy/Bh
	Yyb0+o1hE+Omj3F2mSjX/+cSUNjg/GWXg6lUmuNFZnDb/GZaKJwExMC5B/jsXtqkFX6jogzt7FQ
	bAiNH98C3pcQ==
X-Received: by 2002:a05:6122:3306:b0:566:37dc:e219 with SMTP id 71dfb90a1353d-568e48c946cmr7126900e0c.15.1772058470884;
        Wed, 25 Feb 2026 14:27:50 -0800 (PST)
Received: from geday ([2804:7f2:800b:f14d::dead:c001])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-56a922afe47sm399366e0c.20.2026.02.25.14.27.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Feb 2026 14:27:50 -0800 (PST)
Date: Wed, 25 Feb 2026 19:27:44 -0300
From: Geraldo Nascimento <geraldogabriel@gmail.com>
To: Shawn Lin <shawn.lin@rock-chips.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
	Heiko Stuebner <heiko@sntech.de>,
	Geraldo Nascimento <geraldogabriel@gmail.com>,
	Dragan Simic <dsimic@manjaro.org>
Cc: linux-rockchip@lists.infradead.org, linux-pci@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH v3 2/2] PCI: rockchip-host: comment danger of 5.0 GT/s speed
Message-ID: <8db835ffe384db63ee598a203751b298ad1cc267.1772057799.git.geraldogabriel@gmail.com>
References: <cover.1772057799.git.geraldogabriel@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1772057799.git.geraldogabriel@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260225_142752_353036_5C7FC1A6 
X-CRM114-Status: GOOD (  12.54  )
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

According to Rockchip sources, there is grave danger in enabling 5.0
GT/s speed for this core. Add a comment documenting this risk of
"catastrophic failure" and discouraging end-users from forcing
higher speed.

Link: https://lore.kernel.org/all/ffd05070-9879-4468-94e3-b88968b4c21b@rock-chips.com/
Cc: stable@vger.kernel.org
Reported-by: Dragan Simic <dsimic@manjaro.org>
Reported-by: Shawn Lin <shawn.lin@rock-chips.com>
Reviewed-by: Dragan Simic <dsimic@manjaro.org>
Signed-off-by: Geraldo Nascimento <geraldogabriel@gmail.com>
---
 drivers/pci/controller/pcie-rockchip-host.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/pci/controller/pcie-rockchip-host.c b/drivers/pci/controller/pcie-rockchip-host.c
index ee1822ca01db..4faf3e29b7d5 100644
--- a/drivers/pci/controller/pcie-rockchip-host.c
+++ b/drivers/pci/controller/pcie-rockchip-host.c
@@ -332,6 +332,10 @@ static int rockchip_pcie_host_init_port(struct rockchip_pcie *rockchip)
 		/*
 		 * Enable retrain for gen2. This should be configured only after
 		 * gen1 finished.
+		 *
+		 * Dangerous and may lead to "catastrophic failure", with data loss
+		 * or worse!
+		 *
 		 */
 		status = rockchip_pcie_read(rockchip, PCIE_RC_CONFIG_CR + PCI_EXP_LNKCTL2);
 		status &= ~PCI_EXP_LNKCTL2_TLS;
-- 
2.52.0


