Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09A26CA6002
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  5 Oct 2026 22:40:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=3O5Pix90BvrGtShH3HWLTeak2Koa8dPqPpawpalPiLo=; b=RliG88I6tFvX+KPscBuDAWkCar
	QjUWhXOirqvcs0qclFlREwUkVheGRkh5gOlualJerJ4LeNzj4T1cIL4joRUUAYauKpO0N+nCAriy3
	kOZjmyCHPJ8JDaKrbvKnoPhbKUWdM6iApOx4CQl75DMSqaxSNMfuXEUIpTuk1qdFOuS45wnrKtDTq
	+YN/16Sd8aQ+lX+OnAUJcQoA13eGYHlzXWAoWjdtqfSd3SV8zTSxVuU/81Vqw+Iv6P3u1CIwR83mM
	/02JOHjIKLQIxjcm1cqsCFIuxovFNVjHJum21KnceSr9w2538g25rthF93ilBHMBc8ry5hpqrM7IC
	D45wD4wA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDrMQ-0000000HHc6-26hC;
	Mon, 05 Oct 2026 22:40:44 +0000
Received: from mail-pj2-x02.google.com ([2607:f8b0:4864:39::2])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDrMM-0000000HHbS-2arW
	for linux-arm-kernel@lists.infradead.org;
	Mon, 05 Oct 2026 22:40:39 +0000
Received: by mail-pj2-x02.google.com with SMTP id 98e67ed59e1d1-3a854dffb5dso168847a91.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 05 Oct 2026 15:40:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791240038; x=1791844838; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=3O5Pix90BvrGtShH3HWLTeak2Koa8dPqPpawpalPiLo=;
        b=JApHDOihALXn9cLoQJ9drOORpl717BcuQSm4rB8EH2jSHlSi3iWUOmeFWvKVvnK9F6
         sSSR28b7u7ZSByGpS5O9+9ToBIerIRXrmgVdLhiXBHVWkXK7yG+NVqlWBNaIvofgmAee
         J6meLA1ZGgsVVj5XEL/Cw+qfZbIm/heLKzqDfcVTG9SK1v8SOucWoFlZj6+WSZCzKGNM
         5jSyc/1ZSGNkPI/eMan5GwRf1MtQiOhKg+4XxXGlMX78xmxM2eEK1+U75dBcBfcKC87E
         hXJGx88VghM3KlC/B7Xch/8hHORRkQA9UktC+ZeqlUDiboCQnvgdIOoCzfUNY2zsf7CQ
         zVYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791240038; x=1791844838;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3O5Pix90BvrGtShH3HWLTeak2Koa8dPqPpawpalPiLo=;
        b=FdBjcjLZ9PmmbJOXQXqqfM7qvmmbaKHa/ZPF0KW+RI/AfUvG/h1GaQAcIk0K8ayCv1
         lzRJ0AkERKngmO375AxO7MWxk8Q8oE/Woo1Qmnhr5NdjpgKS4unGMHDT1jqedT1SiRuf
         1lebZkFDvX5Wgw73ZQCFhnLtl9P+F5kLtkrNjZAWrclC28v0B3H//agthXjl7aUwouNR
         FxPfBw7FL1uyetd74k6vOwCBzMTVCzDK0O09k8SVGrvgmpsLRZ3XJF3magqR7A68vPXU
         /tHGj7/lysF0Ba6pApcslILQPcTccPmN5BcYwuTw3iWW5lURIBbCZKMbSJ9canyMwriU
         EIbA==
X-Forwarded-Encrypted: i=1; AKwUvBzV6dqFvJ0VLSyQrsqTYooonsGWjUtI+4n7tQdWV2aSfFfn8FUgACe61wZTgaEdl/PokEqHrif6UQhX7i3bqPS2@lists.infradead.org
X-Gm-Message-State: AFq9FYLk4xEpW0NJPd0ydrH90n02ZzlL4JedPUMgH+NO/+xahpMdc53n
	Jzw+b+hLMhucBB3Yt0E1gqr7ApMbHuGI9l3jOd3CkMC6raN6ZelTZI6+
X-Gm-Gg: AYBFou3kjSIQiQ//Mn2J3SOyIXLsuO+3XZh5F/v2kl16luattm4T3AyepXeiu4321yx
	fLOP7dnyiHIxukbzGQxvr/JZGpUXv4OqdGnDBFOzhJay1SrFuJXJFT+ci6O7Z9ToRZSBApB/xxP
	kyrolyBvguuimhExw0TP/bzm4onHhybNbxbb4WmOPtqL2xjhx32NlDHCanrE19dXWALAUYMHjhr
	/AZvSNUtstx82hFIZUWyES07fBSJZgxxjRgjONrgWp1TVRbQ3ily0YOxEr5YCAyp+pQXw5bHqq/
	9y+mjUst7ntgO576ue23byndOpVX4skFaiKKEkge+sj9arDeLogRWDSkEV5B6QVwOI2OCY5nwkV
	/EvBn3wk+F9BEffhFu9GpfBTan0H1e4aaPQK+TWfBpG1oEIJfvxndtBnzN8K0gETht4h5A4MzVe
	O57g/lslYTp5lNF80GVbnhqs5yyMyUUeeAsQWHIzfP/60pmpHs4AK/WXF1swzxImMa59MY
X-Received: by 2002:a17:90b:3803:b0:3a0:7591:ad7a with SMTP id 98e67ed59e1d1-3a6ce3b92f2mr9535670a91.5.1791240037537;
        Mon, 05 Oct 2026 15:40:37 -0700 (PDT)
Received: from server.lan ([168.138.199.194])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a853e66d7fsm1496243a91.5.2026.10.05.15.40.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Oct 2026 15:40:37 -0700 (PDT)
From: Coia Prant <coiaprant@gmail.com>
To: Heiko Stuebner <heiko@sntech.de>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Lin <shawn.lin@rock-chips.com>,
	David Heidelberg <david@ixit.cz>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Coia Prant <coiaprant@gmail.com>
Subject: [PATCH v10 0/2] arm64: dts: rockchip: add RK3568 XPCS nodes and enable SGMII on Photonicat
Date: Tue,  6 Oct 2026 06:40:06 +0800
Message-ID: <20261005224008.1140250-1-coiaprant@gmail.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261005_154038_684837_63CE0993 
X-CRM114-Status: UNSURE (   8.84  )
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

This series adds the RK3568 XPCS and fixed-clock nodes, and enables the
SGMII LAN port on the Ariaboard Photonicat.

Dependencies:
- Generic PM domain (genpd) changes:
  https://lore.kernel.org/all/20260925041751.495818-1-coiaprant@gmail.com/
- PHY binding+driver (Naneng Combo PHY SGMII MAC selection):
  https://lore.kernel.org/all/20261005221229.1095843-1-coiaprant@gmail.com/
- stmmac XPCS lifetime management fix:
  https://lore.kernel.org/all/20261005221749.1104430-1-coiaprant@gmail.com/
- net-next series (XPCS glue, dwmac-rk SGMII support, pcs-handle binding):
  https://lore.kernel.org/all/20261005223011.1124347-1-coiaprant@gmail.com/

There is no hard build dependency. DTS validation will pass once the
binding and driver are present in linux-next, which they will be after
the PHY and net-next trees merge.
---
Coia Prant (2):
  arm64: dts: rockchip: rk3568: add XPCS and fixed-clock nodes
  arm64: dts: rockchip: rk3568-photonicat: enable SGMII LAN port

 .../boot/dts/rockchip/rk3568-photonicat.dts   | 74 ++++++++++++++++++-
 arch/arm64/boot/dts/rockchip/rk3568.dtsi      | 45 +++++++++++
 2 files changed, 117 insertions(+), 2 deletions(-)

-- 
2.47.3


