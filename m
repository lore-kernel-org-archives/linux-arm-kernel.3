Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8CB8E7716E
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Dec 2024 15:02:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=IhPem9wvmv5a5jZS5cGqS3xRhwM/6GnczR06YcQ1XCw=; b=xt9fR/Z2vugEMYEEcaOoRQLyv5
	VeOiPG7tDOoAhghjy0MOAg9pIbo67e2+EeWofPnTJlcT8B9FC7FLs23URMDg4s8DebCDQJfhhTrQA
	mALZAv3nqNYyN/KypFAGbWryhyaqTEsW4qrd7C9linjPJJTIq9RGg9zzxaP9kPq+lsVlEC6loIJT2
	upjBLPYq+mvk4SN/zKJAqkjAhCZzqfK3I1gZvqc/sjh0blVXiwihrvXf9Q4nYfOxuKjVqvwfVZZ7N
	BnoTRIALTRLny8zYr+1tqmGYtkHOWgTe3M86+RtQUkeqln17TN7Jw+sneh2j543WzQtyC7P4HYR22
	d+l3llig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tIqsx-0000000CvPp-48qO;
	Wed, 04 Dec 2024 15:01:51 +0000
Received: from out-02.smtp.spacemail.com ([63.250.43.87])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tIqqw-0000000CuyO-18r0
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Dec 2024 14:59:48 +0000
Received: from prod-lbout-phx.jellyfish.systems (unknown [198.177.122.3])
	by smtp.spacemail.com (Postfix) with ESMTPA id 4Y3LK95QMwz4wVV;
	Wed, 04 Dec 2024 14:59:41 +0000 (UTC)
Received: from localhost.localdomain (83.21.102.241.ipv4.supernova.orange.pl [83.21.102.241])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.spacemail.com (Postfix) with ESMTPSA id 4Y3LK25jlsz8sWT;
	Wed,  4 Dec 2024 14:59:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=mentallysanemainliners.org; s=spacemail; t=1733324376;
	bh=xO9FfRnXogXsKagT1s91UTrFV6QVAy00nXwpxknoUZU=;
	h=From:To:Cc:Subject:Date:From;
	b=d2bJkY/v1AH+WRJBuTIvpf1BtUbHPCNO2AmEEJBah+7pFmJq4WG2i3a/Uib2ub1mJ
	 rcCqqlFIYlj0wN9J5SltOpz7hxyjLChIHJB5BS5JO3DEiaQmtx2XoCo8n6Cz5ngXk2
	 pe5O1et6LClWZfeC/3GfrCl0QAVzOFKvSbLWB4eF9/P6QudQUdYnpQSTY6zS/72BEg
	 PR42xTG5wKvTJv7LwKc1Cp7e+hRU34Chm0xTS4foYDnflkns0WjkmuNvs99+vqlDeL
	 TM8rIH7k+5x9/2cWo8MAKrg/csqYehG2vBSMKUaMfiQ1m2r1rpjwa63vClMgkCo/9P
	 cS1U8TD2LjB5g==
From: Igor Belwon <igor.belwon@mentallysanemainliners.org>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>
Cc: devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/2] Add pmu and syscon-reboot support to Exynos990
Date: Wed,  4 Dec 2024 15:55:57 +0100
Message-ID: <20241204145559.524932-1-igor.belwon@mentallysanemainliners.org>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241204_065946_406992_2A3E4615 
X-CRM114-Status: GOOD (  13.62  )
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

This small series adds support for the pmu, as well as syscon-reboot
support to the Exynos990 SoC. It has been tested with the reboot command
in an initramfs.

Typically, this would be added during the initial SoC bringup,
however I was unsure as to if the syscon would work correctly until I
could test it (especially when it comes to reboot), which I just got
around to doing.

---
Changes since v1:
- Wrote a description for the PMU in the dt-bindings commit (thanks Krzysztof!)

Kind regards,

Igor

Igor Belwon (2):
  dt-bindings: soc: samsung: exynos-pmu: Add exynos990-pmu compatible
  arm64: dts: exynos990: Add pmu and syscon-reboot nodes

 .../bindings/soc/samsung/exynos-pmu.yaml           |  1 +
 arch/arm64/boot/dts/exynos/exynos990.dtsi          | 14 ++++++++++++++
 2 files changed, 15 insertions(+)

-- 
2.45.2


