Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A00BD25B56
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 28 Jan 2026 12:59:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=j8uaattQ84x7k0dHlXaaGs69eppir8vSPiEkCl0d5XE=; b=q2C4AbSExJp4BbtheX6zJ7qHY5
	bRoiLSRN1jAG7TPP64Ly/QZIQI43Lf28r+HrPGRhVam5yM44Bvx/wcFQVIGnrhkhV1lJZ2PnX0zlW
	8cZO2Eh8l45/7YUbKsLcvXqHVKzPFXAVJjAUffCMgs02W8sEb6+PmRzU7GoKblPSWUyHgtNHuIaTs
	U2p02QI8HlAT4T4V+iqZQRnoT66Dq31uu8qvHPvwEH6dIfkA+MhFRky8+T/CUKqItgABTwcCXAxYm
	tNQuvs5nhdSC/b+dP9LPkOIfWMjuCM27McSHUb84Lu0DdtsvjbO4fXNAW7kQRj1ajm77s1lw54a8y
	q/nBE3uA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vl58P-0000000G1e8-1iuE;
	Wed, 28 Jan 2026 12:59:01 +0000
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vl58M-0000000G1d9-2SlJ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 28 Jan 2026 12:58:59 +0000
Received: by mail-ej1-x633.google.com with SMTP id a640c23a62f3a-b8707005183so1038244466b.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 28 Jan 2026 04:58:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769605137; x=1770209937; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=j8uaattQ84x7k0dHlXaaGs69eppir8vSPiEkCl0d5XE=;
        b=bn74BCcWOnyioY5VJbVIRdBn0alSSSnjR6yd+IEvCPJ/TqdVEWrsl5Z1V2iuSf0Q+B
         sYe48BZhI0u7YbL03KVFcmuF3e/XboDGNz8o3WyAS71SJ2brX3cbVWZmrQU+LOFTJH0C
         yVMFg9k2awMYwLs4QeDhvBy8IQE3See4qmUFeFJvqNFEefGJExfNpmm+o+HrTHb14XBX
         pO2Fdg2W/6iCGd+RlHoSlMR4Vq18IFVH4pQk8eCPLEUwDvft3u29VhcUbP5vKVDD8JjG
         Gpa3wVwdER2TfWzUBFPqyuwx3fGCyG0bsAnD7aR730szy19OSu7D0UL8Go4b0RySY2PV
         Z/jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769605137; x=1770209937;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=j8uaattQ84x7k0dHlXaaGs69eppir8vSPiEkCl0d5XE=;
        b=sUIQS0SrL9KjQ9l1Up/JvH5kFY25peW2S7Gjp59K/4xn70LTQc+gkI9DDRMZ3z1rQ0
         cQ5RpH/ixkOTY/jSTg93xsgbjXTX7rdf/c076trTFhDxOckEYFNGAIc584h9XWOPJyDY
         KyyyrxUBos7VGP/ZCm/uIsG2Rv3vqdz/vW/LbDVkz26FdgojONF4jU7om2IxWHtbOwDQ
         lv/qw881sI5k/oA2bZzD1PVyhVdbQ4c0KTh5olYemN4+UFWdGTOlqxwH6y4IOacOugPc
         qrLqHal5F0Z1End+Z8XK0jPdY9KEFzLFJtS1er51Z1GZO4S9nlm7snEo+He771L9Yukl
         3GHg==
X-Forwarded-Encrypted: i=1; AJvYcCU6wFmX1zJN51+mRITdYwErrmGzD5PcRtxtYpO5OB3VUhGyk41ZpSrcRhYTrpIEEPFh3VfQlYAzn2aSwMgsNQHe@lists.infradead.org
X-Gm-Message-State: AOJu0Yy0tOyVrYCAe7YIEP/0RkafllaYTQYYBZprA3uUaRonEHR+bYOZ
	PEG+BoEFjkF6i7zjjnCGrWTKCWYqy8VJxkAubKVFfBAF6k82igpOqvqD
X-Gm-Gg: AZuq6aLRUvZrGbJXGo7kuCjkehtUpbVDLYHPC09CGNJKrYa27iojECqNoAmmQM9qrso
	YCe90ybbd0OVeYSwH6x1RbKWoPvDJgwJvYcOLfiXQDVLoh/q0mN3xuFzBgwCcExiFKZm/ubhj9k
	0clwtMFnau/TVelpKDKC5/ZV7Dr692A/7oBssKQIvq7BAFCXK+Lhcyda1B13TTGRvfHzcrvie1o
	TT09nrNvI/ofkQplJAHv3XhL7VdqR0c1N2+nosPlOEfLPNPG9mw/8fYAn7j4f1L50qW8A8qabAE
	eSX6iZVj/pILvqk/z61EPvAN+TwEMd2brYN8pm9ZShKnMtOpsvfqXIxwnbVwSBCvGKWrfvrg2Ow
	WkRwyJlxXVU0SeVmMtsVFbIZWkMiaZEdB8cuYpkV9gIh56bhpJLs8mDYnjYRaYTAH2+XYbDTzwF
	kcWz89ltSEGL0a9avU6W7xpfVPu1jP2/eWYXk=
X-Received: by 2002:a17:907:d8e:b0:b76:f090:777b with SMTP id a640c23a62f3a-b8dab2e7d35mr340320966b.22.1769605136436;
        Wed, 28 Jan 2026 04:58:56 -0800 (PST)
Received: from localhost.localdomain ([2a00:23c4:a758:8a01:e29d:6e0e:72c1:d15d])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8dbf2f3e26sm123344966b.67.2026.01.28.04.58.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Jan 2026 04:58:56 -0800 (PST)
From: Biju <biju.das.au@gmail.com>
X-Google-Original-From: Biju <biju.das.jz@bp.renesas.com>
To: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Richard Cochran <richardcochran@gmail.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	netdev@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Biju Das <biju.das.au@gmail.com>
Subject: [PATCH net-next 2/8] net: stmmac: dwmac-renesas-gbeth: Add support for RZ/G3L SoC
Date: Wed, 28 Jan 2026 12:58:39 +0000
Message-ID: <20260128125850.425264-3-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260128125850.425264-1-biju.das.jz@bp.renesas.com>
References: <20260128125850.425264-1-biju.das.jz@bp.renesas.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260128_045858_639310_D1C6E9E8 
X-CRM114-Status: GOOD (  11.71  )
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

From: Biju Das <biju.das.jz@bp.renesas.com>

Compared to other Renesas GBETH stmmac glue drivers, RZ/G3L GBETH IP use
the version Synopsys DesignWare MAC (version 5.30). It has an extra clock
compared to RZ/V2H and has ptp_pps_o interrupts. Add support for RZ/G3L
GBETH by reusing device data of RZ/V2H and can be extended to add other
functionalities later.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
 drivers/net/ethernet/stmicro/stmmac/dwmac-renesas-gbeth.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-renesas-gbeth.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-renesas-gbeth.c
index be7f5eb2cdcf..19f34e18bfef 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-renesas-gbeth.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-renesas-gbeth.c
@@ -214,6 +214,7 @@ static const struct renesas_gbeth_of_data renesas_gmac_of_data = {
 };
 
 static const struct of_device_id renesas_gbeth_match[] = {
+	{ .compatible = "renesas,r9a08g046-gbeth", .data = &renesas_gbeth_of_data },
 	{ .compatible = "renesas,r9a09g077-gbeth", .data = &renesas_gmac_of_data },
 	{ .compatible = "renesas,rzv2h-gbeth", .data = &renesas_gbeth_of_data },
 	{ /* Sentinel */ }
-- 
2.43.0


