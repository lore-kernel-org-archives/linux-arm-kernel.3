Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37F6ECD4F26
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 23 Jun 2026 07:47:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=WiYA62dHorpFymdfXssg5HAuL1K3q/QdPM1UUVatA4k=; b=lAmHA9e9RVDJVHN6wfox+rXJWE
	6Re54PfR18vIIJcd9il9wc3XwUzueswg3POGDE8xTaHFuBKYmEBsoqFjwca/efTJ4rbYO8+cBfjFr
	fnvajnWGjq5YM0SrRYjxEdnnPkdWUzI57deosMo6vQ94pXQ9EHF67tqmLzeFzhhmrwHYbzCF8Nm6R
	lkik8//U5WOFGGFaD+DbPqSRrfHN1lJaWssLy6PovFtAKeZ83bDXTOXRtpb2MH2eW1WaJN2P55mxj
	Au1d+vN7JT43qk0OiF2NsggszJNjSfoROAx8Qqes8lkaJndGrxeK89W9uZOY1Id5qiYRlCXzQYC5S
	feIxKxUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wbvqZ-00000005qqX-10gy;
	Tue, 23 Jun 2026 07:47:03 +0000
Received: from mail-pf1-x436.google.com ([2607:f8b0:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wbvqV-00000005qoo-1nbF
	for linux-arm-kernel@lists.infradead.org;
	Tue, 23 Jun 2026 07:47:01 +0000
Received: by mail-pf1-x436.google.com with SMTP id d2e1a72fcca58-845397d1221so2940354b3a.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 23 Jun 2026 00:46:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782200819; x=1782805619; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=WiYA62dHorpFymdfXssg5HAuL1K3q/QdPM1UUVatA4k=;
        b=krnfZUtH4id9cAQP9fOxObIsPP0v0OAQrm2Aw1EDwQakfrnu4b9RiJfVKNt8nKvn2/
         g7IjHSedoiBlN7lYlQhuBMZ3uIxBIh4RKTfCEaFxL8dOUhn/R5Ps5lckiG5gSEEg+L04
         B2AIOmqBt2GXWZQmIdad9DM+y7ze8vsBKVNujrhYyDSfx9b9yOZVY/2DdINUGzVcEQEq
         UXHLhCIknaKIJHFkAeiCyuJC4rOzt2v+9Bx5tDa7ExQFZgC9rp/WJQKmHFMx71vOyJDr
         wOeu7rakw/WNxo6GplZW0v7ciBANJM/yTQfCvQosJ70fD3g/5s3XJGh45CvGVTYHqwnz
         SvSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782200819; x=1782805619;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WiYA62dHorpFymdfXssg5HAuL1K3q/QdPM1UUVatA4k=;
        b=UR0AJX4N4ZcBFTldxNuMWslSW+vqN0VnHCT/TIAbpmszkycwQXGfQkWBMRLjDjztK6
         o6/V3fJkVRtcOT0cnEZTeuyWeCgvRh2SPpY+331ew6RtkbCkohr0Paw/RdvWHmFQbWQ1
         xUX+8HwaPdqldiGMaM0T8mqrZxtmgVInAQQ+yGO3YucXj/0Djog+x7NQ+uFyHpVKjX2A
         iigR7FAskuWPnHSBDQ+cl1CW/RrTrse7KumDTLd2XYiIcCAuBoseKiWSTwigfgX1g3fE
         08RgYPIm+2p466MnzXXS22xbDn9bbyl4aiBxiGw0ViRAvRVcefGXE2lRVFwTpPOMumQB
         UkpA==
X-Forwarded-Encrypted: i=1; AFNElJ8oRkmcNQbJwqqR+ooMP1qW7T0JBHAJdqXZP9uhalJ9HALmNeqhQKsgr1MrkMR0vfXowPiAHzpQkC20by4oMMQZ@lists.infradead.org
X-Gm-Message-State: AOJu0YyB95KqfkZldDXDwONFLpnzKaI480yeERadqy0MBtLTAQVZLgd3
	VB5rickUHoTUWpxnsOdea330KewypH0qfbyxyqTINYBvnDSok9Gv4RHO
X-Gm-Gg: AfdE7cnsFnAmU5GeUZTmjupdzwnFlaPl1dxXtfOdUWWPJV3MaABjtB8GVF+nfutHJOr
	TABh1a6z3YJG4cEn3QjFMUjyyQskjbnCoUVya9qLT/QgdU1BXLWbS5ASGldW7WmQUgo1Ik73Ggb
	brb+fSppW4rszh5dmGsmQfWRu7XPeBRgUwg8intUnh2wcwiiic8JwIJm0OXS4J4wj8oZJbu9pzN
	KduPZLCQStyVtG5FuJPcaFD19dt2M2N5CFMYrksOOAyG7Zj8Bs1Onx0MaYE9ruQfvawRJpQiUry
	ra5WdCEHxAhS/LahJJSchoRv46+2QHAndzKHxu3gSpHt6P00j4H0gqlEyu/Z6BMiKOl1frlHBT3
	Uw3h7Yeg2WFuB2EtcVqK7/mwvuSVssAwpYY4LgQHaits6E3V3iYakDWOxGNe2/k8OeLqU/3SzdC
	sSRHR0ptSRXW0cwTgmGOr5tg==
X-Received: by 2002:a05:6a00:3d09:b0:842:5711:9a2f with SMTP id d2e1a72fcca58-845508a0edamr18772015b3a.36.1782200818608;
        Tue, 23 Jun 2026 00:46:58 -0700 (PDT)
Received: from localhost ([2001:19f0:8000:3e6e:5400:6ff:fe38:3d01])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84564ed9516sm9765519b3a.57.2026.06.23.00.46.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Jun 2026 00:46:58 -0700 (PDT)
From: Inochi Amaoto <inochiama@gmail.com>
To: Inochi Amaoto <inochiama@gmail.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Yixun Lan <dlan@kernel.org>,
	"Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
Cc: netdev@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Yixun Lan <dlan@gentoo.org>,
	Longbin Li <looong.bin@gmail.com>
Subject: [PATCH net v2 0/2] net: stmmac: dwmac-spacemit: Fix wrong macro definition
Date: Tue, 23 Jun 2026 15:46:33 +0800
Message-ID: <20260623074637.503864-1-inochiama@gmail.com>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260623_004659_467728_D9A47947 
X-CRM114-Status: UNSURE (   8.70  )
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

Fix Wrong macro definition of the Spacemit K3.

Changed from v1:
- https://lore.kernel.org/netdev/20260618064143.1102179-1-inochiama@gmail.com
1. Separate the patch into two patches
2. Use the right macro name for the LPI interrupt.

Inochi Amaoto (2):
  net: stmmac: dwmac-spacemit: Fix wrong phy interface definition
  net: stmmac: dwmac-spacemit: Fix wrong irq definition

 .../net/ethernet/stmicro/stmmac/dwmac-spacemit.c    | 13 ++++++++-----
 1 file changed, 8 insertions(+), 5 deletions(-)

--
2.54.0


