Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 210C5C5DF85
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 20 Aug 2026 14:24:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=X1cEzBJvBztMxBKiQQCNaB02Q/HGS+t/XW8M/wtGoQ8=; b=qCyc4pZ2sEaB4wVNeseaQuF242
	dacG/sIzY8MonWIvvpH82cl/O4lwvvdDQmeFMMoFp9fPK2Q2YiroPSyJFDp+1T0uH5gKoDw1kEwzV
	0wXqmIIe+qxvU/abLMOP4PeGgQZPOR40J7SuI4b4f12gaKoVbWuOgARY2YHVli9RzoIaIpU2JSCt5
	kBiEwIMR/gBGWMI991HmyqtNDdfmjQJAzm3wMFIXNsPFvvrfpmKo+rfomNYTpOTdzCu/ymUhHNVHp
	lnjw1Uo8lXeeKVkAdrmqFFm/whVqd92AmKxhdkx3y/LwgfqSVhgMAkKNEdoKDkv/1mWKYKh6HYc7N
	0n4wiGrw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wx3gQ-0000000Bgvh-14C6;
	Thu, 20 Aug 2026 14:23:54 +0000
Received: from smtp.forwardemail.net ([121.127.44.73])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wx3gK-0000000BgtV-3QDl
	for linux-arm-kernel@lists.infradead.org;
	Thu, 20 Aug 2026 14:23:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lineageos.org;
 h=Content-Transfer-Encoding: MIME-Version: References: In-Reply-To:
 Message-ID: Date: Subject: Cc: To: From; q=dns/txt; s=fe-2eefaa527c;
 t=1787235825; bh=X1cEzBJvBztMxBKiQQCNaB02Q/HGS+t/XW8M/wtGoQ8=;
 b=M8TA0jiWCzNZFvnr1C4NRgTWGRThYdce84U0JxyxmFQAhIwD49kBl9ZEPoak5DXoxXzAL8Cwp
 051g+TGxNrYGQsKJUi9EfljXErFzMZ82mhHrf1JbhgW+uVqvMoeDG/apQzGDPvcK69EoKRSbPB6
 WQz+wCJfjFvynamI6g98FXQ=
X-Forward-Email-ID: 6a870de87f958f0d9fc1b7ea
X-Forward-Email-Sender: rfc822; tturner@lineageos.org,
 smtp.forwardemail.net, 121.127.44.73
X-Forward-Email-Version: 2.13.16
X-Forward-Email-Website: https://forwardemail.net
X-Complaints-To: abuse@forwardemail.net
X-Report-Abuse: abuse@forwardemail.net
X-Report-Abuse-To: abuse@forwardemail.net
From: Thomas Turner <tturner@lineageos.org>
To: krzysztof.kozlowski@oss.qualcomm.com
Cc: semen.protsenko@linaro.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	peter.griffin@linaro.org,
	alim.akhtar@samsung.com,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Thomas Turner <tturner@lineageos.org>
Subject: [PATCH v2 0/2] Exynos850 GPU support
Date: Thu, 20 Aug 2026 15:23:28 +0100
Message-ID: <20260820142330.84514-1-tturner@lineageos.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <GVYP280MB12139AB976CA7ACF49FEB768A1A52@GVYP280MB1213.SWEP280.PROD.OUTLOOK.COM>
References: <GVYP280MB12139AB976CA7ACF49FEB768A1A52@GVYP280MB1213.SWEP280.PROD.OUTLOOK.COM>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260820_072348_939068_DDD9BD88 
X-CRM114-Status: UNSURE (   8.80  )
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

Hi all,
This is my first time sending patches to linux so apologies for
mistakes. This series provides basic GPU support to the Exynos850
platform, making use of the Mali G52 GPU through the panfrost driver.

Thomas Turner (2):
  dt-bindings: gpu: arm,mali-bifrost: add exynos850-mali compatible
  arm64: dts: exynos850: Add GPU/Mali Bifrost node

 .../devicetree/bindings/gpu/arm,mali-bifrost.yaml    |  1 +
 arch/arm64/boot/dts/exynos/exynos850.dtsi            | 12 ++++++++++++
 2 files changed, 13 insertions(+)

-- 
2.47.3


