Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60CC3C531C9
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 26 Jul 2026 13:17:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4Siogxd1mnPfoRDu26OqqhqR/dDnozwHaf8cFoli+/U=; b=fPK3pQs4jTrkIBx3f353ZhRe4N
	BEijGg1GxeXWv+oGCVTWlFeS+/gcjjUfBqRFwDaHlkyq3m50yzlN40jYdtBA4A1EtbMXXCQ49MYn9
	R1KLVNgM1gqneb9SlCeTWPYo8Q/syg52S8n40LEE7zEbCq8gx+lDPaCWvgUywp718i1JNvJAZmOE5
	+aeBnSrU2Kf3TP5Rc9Ox4BPGvSjBqhH/OecZ1zjEG6ngUp9ypFJiQNetMdtmEPj0Qd28t91SNsWaF
	NO3SoLjBKgCC6PAnR1foIFKaH3wVri/G6FQdZS+IUPK4LqRo7akVwDpkKcEqMgjYIhzgyuaRbMN71
	Y58dw44A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnyiq-00000001BlV-3Sn3;
	Sun, 26 Jul 2026 13:16:52 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnyip-00000001BlN-0E3T
	for linux-arm-kernel@lists.infradead.org;
	Sun, 26 Jul 2026 13:16:51 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id D481560008;
	Sun, 26 Jul 2026 13:16:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4E79D1F000E9;
	Sun, 26 Jul 2026 13:16:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785071809;
	bh=4Siogxd1mnPfoRDu26OqqhqR/dDnozwHaf8cFoli+/U=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=VRHaw2GoQpDSfvcJXRQtVy6ORniM+b1MVX1SJdwRzULm+ZbodjVa/zcRtdMV7xeyu
	 HkMG8PdX1T/I5kwRTDEGEBgaDz7uAdCkAfc715f72C4uCqNNmvHs7rL9uvEzC6mknK
	 MlQNpbGq3CueFIwdFF3Gr90NzOybVM/J+gLfknlT4YC8Ke6qcvqFx8ttAPGVnbnGBw
	 HvKXQOKGVPMUfWlvj0aYpp48n9/UGoc/vKud39t1ugVnThelroOUxJyv62FhJM1yyv
	 Kg3y9+ki8BGH1G4/Kr7exkZy8RQ3e5mT/giD01Pt8KuKwapQRYwuS+C8OC5RDHfbuj
	 sMEAatKtV9bPQ==
Date: Sun, 26 Jul 2026 14:16:42 +0100
From: Will Deacon <will@kernel.org>
To: Peter Griffin <peter.griffin@linaro.org>
Cc: Robin Murphy <robin.murphy@arm.com>,
	"Joerg Roedel (AMD)" <joro@8bytes.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Pranjal Shrivastava <praan@google.com>,
	Daniel Mentz <danielmentz@google.com>,
	Mostafa Saleh <smostafa@google.com>,
	linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	kernel-team@android.com, tudor.ambarus@linaro.org,
	andre.draszik@linaro.org, willmcvicker@google.com,
	jyescas@google.com
Subject: Re: [PATCH 0/2] Add arm-smmu-v3 support for instcfg data override
 feature
Message-ID: <amYIuhYenP4-qHyV@willie-the-truck>
References: <20260724-arm-smmu-v3-instcfg-override-v1-0-e7acf4a8a525@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260724-arm-smmu-v3-instcfg-override-v1-0-e7acf4a8a525@linaro.org>
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

On Fri, Jul 24, 2026 at 01:39:41PM +0100, Peter Griffin wrote:
> These two patches add support for a new "arm,instdata-override" DT property
> that enables the override of the instruction/data attribute of incoming
> traffic to Data by setting the INSTCFG override bits.
> 
> It is intended to be specified when the smmu can't guarantee that these
> attributes are provided correctly from the client device.

This is going to need an in-tree user and a much more detailed
description of what is being worked around before we consider this for
inclusion.

In particular, if a particular client is emitting data reads as
instructions, then a better work around would be to avoid mapping its
domains using IOMMU_NOEXEC. But I can't tell what's going on from the
limited description provided here.

Cheers,

Will

