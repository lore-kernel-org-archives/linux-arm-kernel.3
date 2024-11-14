Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC242D637D6
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 14 Nov 2024 00:49:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=IAnmVBwWFf3Xhdog2eQqQl/DSldjwsVOe2c/bV8ijyY=; b=mHP5QW/LJ7L8idEaUxuRGfmzrY
	VlDPoW/6pB3vElr0UPKHihGIE8/yuWsKm2dTiUe8pwE98cUI3f/G8aLhHa2uvTJNKIq/Bx/Rbedk8
	9JDbbvsAOVlUE61FOeE1glmFKgif0ZEyddTdIftHrGPfybPsnecU97hv6iZwWNIUV1ziBCpLjmP/q
	o0X1pPPfUS6de941MGpQ4tCBVNwUd9qQskOS8ZBYekqMq5XKQyv6qhI3RoUo9PTL5KdmQjh3TGA/O
	qeRuxT1Dsct/woqK2BGuaq4MSmqBc9FF+ujgDLQ/lEJA+pS3KUMNlECP4pmWaDTEnADZI+xapAR/C
	yLZiB2jA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tBO2z-00000008NCX-387x;
	Thu, 14 Nov 2024 00:49:21 +0000
Received: from mail-io1-xd2d.google.com ([2607:f8b0:4864:20::d2d])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tBO1B-00000008N4I-1gHv
	for linux-arm-kernel@lists.infradead.org;
	Thu, 14 Nov 2024 00:47:30 +0000
Received: by mail-io1-xd2d.google.com with SMTP id ca18e2360f4ac-83ac817aac3so3000039f.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 13 Nov 2024 16:47:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1731545247; x=1732150047; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=IAnmVBwWFf3Xhdog2eQqQl/DSldjwsVOe2c/bV8ijyY=;
        b=nOmAglV0taIwFwnz3n5a4SFG6i5l/uET4wjVK7Kth8HHpCy4oO4q5Kqc1woW4X7Pvn
         O5KxgpVjGgNYKF70fZT2OvncL6KDB67OLltGuqn3wftf4USlTzIZw19Dr8BTxkGEtre0
         Z5pxGiwyP2IegLVauOl38AcAUyLoNLfsvMQOqgKzgtAQP9Yp0i7+IRDSGAyY2GBe9icx
         A1Rt9bEWgcUyaIX7/mHQsOqWjosamzPoGfmIknnAqvuGAwuMEeCBKAoXgwv7Auuy/kQS
         GyZShnHJfm26IgU2z/FNFw2O7rKfW5b5lI4v94cwgZDE++LA/Wf4SwR4sFB0uePRYvn0
         9NVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731545247; x=1732150047;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IAnmVBwWFf3Xhdog2eQqQl/DSldjwsVOe2c/bV8ijyY=;
        b=oMT/vlM6k9GuiojxEVNfaGGjVUG0Ygn7XsENQURaEdx7jR8hvq6JpWtbXS+1dpPHdi
         XWUpQB0gC96OHeMm7hYCq7UhXcCiJw7/ZV3ScM5/3iIAeTCy8uJNSOkN1UguxKQN1le6
         wntz/KzMYnY5zIpteBwUc2c4VZ+Uz/KVySrvJTNoZ57dH82ugXdAPuSkNCiSi+iWF8Vw
         2PifdiKbTmPxmqEDQNqBm6tk1L0gGqVaeGH3+QjZH/JHJXApM7zZmLHAb3up//3lK6IA
         MOAlQn5DUGe1lkjPNbwMBkCOb13ikLBEpGVQUz+gZPTOD0CR7PGmdhms5kg8O8pf6fy7
         aXjQ==
X-Forwarded-Encrypted: i=1; AJvYcCUAC2JdtC4wjrAYfKGONKESfZ4WqBNpfUH3j2ms50PgmkqT/SkGLcVbHxPJNw+Ls0lDWRpRJ9oKPpXvX5+EPaiI@lists.infradead.org
X-Gm-Message-State: AOJu0YxZMzNWXqRbl82S9Y7g3GyMLjUxXj71RJPSV5217vylg3QORdG4
	mRqR1u2aREr2eYfc0tgujuS5+o3e9l5OWzYIDbj/GO8dEiT/BlgH
X-Google-Smtp-Source: AGHT+IFxRqbD12YhC4U8wkPfDwTQO33ThQkh9I8WnH/R9DUcJXRSMyZaEJfwBf3KNdmT3lZ2JubIow==
X-Received: by 2002:a05:6602:15c5:b0:82d:16fa:52dd with SMTP id ca18e2360f4ac-83e431d3082mr1061871039f.7.1731545247358;
        Wed, 13 Nov 2024 16:47:27 -0800 (PST)
Received: from localhost ([2607:fea8:52a3:d200::8f60])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-4e02fd148fasm2446173.86.2024.11.13.16.47.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Nov 2024 16:47:26 -0800 (PST)
From: Richard Acayan <mailingradian@gmail.com>
To: Will Deacon <will@kernel.org>,
	Robin Murphy <robin.murphy@arm.com>,
	Joerg Roedel <joro@8bytes.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Rob Clark <robdclark@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	iommu@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-arm-msm@vger.kernel.org
Cc: Richard Acayan <mailingradian@gmail.com>
Subject: [PATCH v2 0/2] iommu/arm-smmu-qcom: Add SDM670 SMMU v2
Date: Wed, 13 Nov 2024 19:47:14 -0500
Message-ID: <20241114004713.42404-4-mailingradian@gmail.com>
X-Mailer: git-send-email 2.47.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241113_164729_461090_3F313738 
X-CRM114-Status: UNSURE (   8.73  )
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

This adds the SMMU v2 for the Snapdragon 670, used for the Adreno GPU.

Changes since v1 (20240730013820.41702-4-mailingradian@gmail.com):
- explain need for specific compatible in iommu driver patch (2/2)

Richard Acayan (2):
  dt-bindings: iommu: arm,smmu: add sdm670 adreno iommu compatible
  iommu/arm-smmu-qcom: add sdm670 adreno iommu compatible

 Documentation/devicetree/bindings/iommu/arm,smmu.yaml | 1 +
 drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c            | 1 +
 2 files changed, 2 insertions(+)

-- 
2.47.0


