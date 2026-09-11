Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E29F1C88E4D
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Sep 2026 21:21:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=YtkRxipFDL5icgX3Q2CLk2qBLGJiypsIowMqv9dIrjU=; b=FmZW8a26K0StFR
	Y6v7CZ+OcVtLAY/unpatSKCFgtrvVmMGAHKYsVK3gE9+5kn5D9mAPrA2GqHYOyQtC6nS6xVnYhrGQ
	Qy6Cml8v5sfF6QBk/e8xGLAACX/NI+cv87NZb5eS4l9R4Y+/Rr2B7ALnM0utImFQzl9CIkcbUsgRI
	Of3P4qOlgsWQbQ8RbWBQ914+Wl7W2aKTn8FF9lcy90bMuBu0b/7se4yAs1BcrLwDXjjLQpsin9vzx
	GT1v3igKrFNpjnCenwa1PLwvq6gFhJuW6DnvKMIfOVykzSEN3z+sd59p1ymlv3YtkumNpqK8OQqDJ
	REvX5U1S8pYfkkcuoYCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x58gR-000000009qW-12i6;
	Fri, 11 Sep 2026 21:21:19 +0000
Received: from mail-ej2-x10.google.com ([2a00:1450:4864:34::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x58gN-000000009nP-455B
	for linux-arm-kernel@lists.infradead.org;
	Fri, 11 Sep 2026 21:21:17 +0000
Received: by mail-ej2-x10.google.com with SMTP id a640c23a62f3a-c264788fd58so4971466b.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 11 Sep 2026 14:21:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1789161673; x=1789766473; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=YtkRxipFDL5icgX3Q2CLk2qBLGJiypsIowMqv9dIrjU=;
        b=uk0/NYx1weJNgrTG0yq+qOlktQDxTe0bqYmv6KCV2uED/D3zMzKGBiUKhI1QZm/ZYj
         nqPnuhPE7sAvXCtAyXXOfWFLKaqbuWu6trYtPQQUpQi1XeMNNfyVv+waOq/dQSZtjxbv
         pv31t4cYKOQgEZEKkAuY5AfDm25jONURniGdVYTt/fEHB2XAzpnF+Ver7nP7j+SB7o8n
         VUr5f0s3eZrXhlMW8ZUN+wVObceOV2TVZBe+KKiiCCCz2KQd+GoNqxzEF5mYKRsElU0M
         GBr5q3reHoKHyMqgF6z6ZKv1LjAF/Fl+J6z9C7EHVNhIzUIpcN7hFpzH5MoCxhWHJ4rn
         eNuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789161673; x=1789766473;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=YtkRxipFDL5icgX3Q2CLk2qBLGJiypsIowMqv9dIrjU=;
        b=ERozGlpzI6Ut6JAoJrW6DTrc0hMdomVUMmvXjQocDbjAaZbunFqM/uGquyiZxCKWpp
         53mitqqoASkCmU1obJpoexrwvT7YazEN6KX3+YFWXw6+7rWb54V+3fAgBtA8tI+km85d
         ZVzNccIqdGX34TL94x/Kp1trCOg7OZQbkUvA4gaH017cwWihB3kXAmAE99elooHxSfCa
         0G/i86Ym86FmFmCWSkRJiT66wgjl+bKXgBtSi5+tD3sixL/k3vz0shM9WaW16vz+LN9I
         7temT8AnOL2NBw0wKuJs8pFEiqfrOkpWrVMjl3UGRM5Kbb5zj+wpehdcjEwNRWo7NAVa
         r+sw==
X-Forwarded-Encrypted: i=1; AKwUvBx8PMpXlREyPmBp/5UUMQHgBAlD0uOtoEZLMCuEbDrEGu63ZC6vySQBlYm5De1bThjUdYKsakV9iOl8fnWMQliu@lists.infradead.org
X-Gm-Message-State: AFuF++kmDEuVhDMZQuXSEZzBvmjCd5L8fnkx4dOE30UB9KuoXPoek/r6
	6hDqJRe6Ck4RVtpwdsUjSf/V2wp/vIrcXgGd1J6fZUT5MTYhNR+pfoMWzVsr0zQO1U0=
X-Gm-Gg: AYBFou2CtISH0kADOBYnYHbeNLCdlsjMZtP3IhlOPI5h3t06+WtbEXWlh6z1EwmBy2S
	lZeiNZ//eoiTUImpAqPsJgNiSdSZF7/FhB0Df3mKVUy16zocdjawsGkPAo/1Ca3WzKu86lWEzt8
	x/3SrUBx+m5b1zvNVTZyHGJTNCTkQYc+8XZUuh3ZpDOsWfxzEbcuwHvWtGdgfiqLsqJD4J59gfD
	n9GQSINiaXVZeh+8lSaOVnTqZMXSvc8iFNtITzmq+8HFkeIhLm7ultm6xcA7x14bEugZGBdaBIs
	upit+B5+4eUNS0h5B07ryI7QZDvjA+BaD/DojPHsP6zGD3cRSmAKV5d2tusYaOIcEhrqOcUInO+
	MOhh8UmtTvjQHo2lFrEr/zLjo+7+0NqQo5221tXkTj6hte8u4osQ4OLrmIRmCW8I2kvLGSCta3b
	1792r2nXGHB9C5p+SSlD8LUILBPx8QWDssD4QA8T9x43o+FWVeZROgBQM81zBP/ndYLKV0L9oMe
	3Myv/cJHcKT4B54b5HkMhMN8kPNyzy7qu3wY18yyhX9Nul/9UA4cecjMaN0hcrXlau5XKUuXSJR
X-Received: by 2002:a17:906:478a:b0:c20:3402:bd35 with SMTP id a640c23a62f3a-c2985736d25mr5788366b.12.1789161673377;
        Fri, 11 Sep 2026 14:21:13 -0700 (PDT)
Received: from petegriffin.c.googlers.com (116.118.90.34.bc.googleusercontent.com. [34.90.118.116])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c29660234f2sm126375166b.12.2026.09.11.14.21.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Sep 2026 14:21:12 -0700 (PDT)
From: Peter Griffin <peter.griffin@linaro.org>
Subject: [PATCH v2 0/2] Add arm-smmu-v3 support for Laguna SMMU silicon
 erratum workaround
Date: Fri, 11 Sep 2026 21:21:04 +0000
Message-Id: <20260911-arm-smmu-v3-instcfg-override-v2-0-5804e4f400b5@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAMBwpGoC/43NQQ6CMBCF4auQWTumFArGlfcwLApMYRJpzRQbD
 eHuVk7g8nuL/20QSZgiXIsNhBJHDj5DnwoYZusnQh6zQSvdqFbXaGXBuCwvTBWyj+vgJgyJRHg
 k7E1jlBt7R1UNOfEUcvw+8vcue+a4Bvkcb6n8rX+GU4kKqbWDq+3FGm1uD/ZWwjnIBN2+71+fp
 QY7yQAAAA==
X-Change-ID: 20260724-arm-smmu-v3-instcfg-override-b5650fdbfe34
To: Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>, 
 "Joerg Roedel (AMD)" <joro@8bytes.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Pranjal Shrivastava <praan@google.com>, 
 Daniel Mentz <danielmentz@google.com>, Mostafa Saleh <smostafa@google.com>, 
 linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 kernel-team@android.com, tudor.ambarus@linaro.org, andre.draszik@linaro.org, 
 willmcvicker@google.com, jyescas@google.com, 
 Peter Griffin <peter.griffin@linaro.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2438;
 i=peter.griffin@linaro.org; h=from:subject:message-id;
 bh=c21PgPKHOIxP9rG11c7WqJwD7hUOwv0oDlYhmLHwZRo=;
 b=owEBbQKS/ZANAwAKAc7ouNYCNHK6AcsmYgBqpHDHRXghRdY6uBz63a5ApZqNJCpKlCLxF8jzV
 5/3SSiL7jyJAjMEAAEKAB0WIQQO/I5vVXh1DVa1SfzO6LjWAjRyugUCaqRwxwAKCRDO6LjWAjRy
 usxOD/9TZnmjDxdAt4z+h8x9Bjg9ECMZxhknIg3DibsnTWsOJFDnVWfD0SOIpWiWOg/crqeJFnX
 6x2XWbd12BM0bZWsuArGA3ESu50pJBPil9ReIv/PUPft1PqLLsQeTf+z4kRS1RxLurUzsAZmHUr
 U266fE+if9Ov8Z/MNicdH76HEQyihmaEtAGzOhMpbK41V/VX5FnnsFIJrJHaH62Ni1jO1+5miJ2
 5Mk6EKnc80okBZazcn26U87g9/flORVwGvddRO03VO0RQFt9Z7pkfJpM/uxN9sNJymtxAg4qJB9
 8GK90HECfopF7wdVkBWdy7jrM2/hRIUPprg8F63ET6Yo7EwCygOYzIC6Xagu134W6tVAKlgec2V
 Yv+IA/VQ1pXtI41y4v6vXcfwnyFfvmM6hKH01CyxuES8JW3+/pDIGTEyeF+Uu3OVGkUdHrbl3K0
 b3clvzMgMDqC5Cy8NmZ61QNLJEah535UXYM/3vWdg9pJjbXiwsoKGB1sXyX+vQIJIeBXahb/Yzc
 8RAvyCIjdHJrXjh3+0aEy2Nyzpz58wMj4L2OwVUGnPZ4C5c2Oi8NbNwt7fcZ0h/jLdjEPMgQl5Z
 m7lBYdUanmvu/ZMYv64dnc6NJYMXmoQvmPh8TL37LwhXp/UaHdrnsv4aezmnif6CONBzNJmLq5G
 JyL0noaCWqix8bg==
X-Developer-Key: i=peter.griffin@linaro.org; a=openpgp;
 fpr=0EFC8E6F5578750D56B549FCCEE8B8D6023472BA
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260911_142116_161338_E5AF1104 
X-CRM114-Status: GOOD (  18.47  )
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

Hi folks,

The Google Tensor G5 SoC (Laguna) has a silicon erratum with the SMMU
integration where the AxPROT[2] signal is always 1, which makes all
transactions appear as instructions.

As a software workaround we make use of the INSTCFG override feature to
force all incoming traffic to data.

To enable this workaround, the "arm,instdata-override" DT property can be
provided in the device tree entry for the SMMU, similar to how existing
errata workarounds are handled by this driver.

The first patch in this series adds the DT bindings documentation for the
property and the second patch adds the associated driver changes. The
Laguna SMMU device tree changes will be sent separately (as that will
go via Arm SoC tree).

Note existing silicon errata DT options in this driver tend to use a vendor
prefix e.g. hisilicon,broken-prefetch-cmd or
cavium,cn9900-broken-page1-regspace. But Rob agreed in the v1 thread that
using "arm,instdata-override" makes sense here in case other SoCs need
to use this.

The Arm SMMU spec that documents the instcfg feature can be found at this
link: https://developer.arm.com/documentation/ihi0070/ha/

regards,

Peter

Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
---
Changes in v2:
- Add a more verbose commit message of the silicon errata issue (Will/Robin)
- Make clear it is a silicon errata software workaround not a "feature" (Rob)
- Fixup incorrect bracket (Sashiko / Nicolin)
- Add a note about why "bypass" is not required in commit message (Nicolin)
- Remove feature flag (Nicolin)
- Move override feature/DT property sanity check closer to the
  register read (Peter)
- Rebase on next-20260911 
- Link to v1: https://lore.kernel.org/r/20260724-arm-smmu-v3-instcfg-override-v1-0-e7acf4a8a525@linaro.org

---
Peter Griffin (2):
      dt-bindings: iommu: arm,smmu-v3: Add arm,instdata-override property
      iommu/arm-smmu-v3: Add support for arm,instdata-override DT property

 .../devicetree/bindings/iommu/arm,smmu-v3.yaml     | 10 +++++++++
 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c        | 25 ++++++++++++++++++----
 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h        |  6 ++++++
 3 files changed, 37 insertions(+), 4 deletions(-)
---
base-commit: 68142f986ff04b2b70b31db00f719bf690f64a9a
change-id: 20260724-arm-smmu-v3-instcfg-override-b5650fdbfe34

Best regards,
-- 
Peter Griffin <peter.griffin@linaro.org>


