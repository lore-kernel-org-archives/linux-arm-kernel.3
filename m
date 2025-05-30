Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0905C5B543
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 30 May 2025 22:43:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=m1drmllmtmwtWNasJJpvTqgcFCz1TJ/ySV8IFsfDlfk=; b=z1pitq4tVL40Uu9VCzaNQx5M0V
	MSW8qplUAsU1q1UFcEcmWiJ6MJPFXotApLwRvlXEskp5lBodYSiRezQ2pqynSNeGjY01ERuCofxC0
	2zhEbb/AFVFsE5SOQdpiXjbohX9p3UPDCMbyz16j+9gL/wvhnx06NNIXFiXjR7/Ptnw49+B59yTNK
	35MmJW/ya3GQML3siAtGVK8fE5l14wfJoW0OMo1N6scmZFq69wwH8mVlJu9yqXizDrmlecvJtIVpY
	t/m7r4ZlFlugLJA2klWjqVTkTk9G/4o0WcC6qGhUD10YFe0CvaqsEANUl5ynISNY1WrTpb02FqI0J
	QzQQGQNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uL8RD-000000026Tt-2zaG;
	Fri, 30 May 2025 22:42:55 +0000
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uL8P5-000000026B1-0mbc
	for linux-arm-kernel@lists.infradead.org;
	Fri, 30 May 2025 22:40:44 +0000
Received: by mail-pl1-x629.google.com with SMTP id d9443c01a7336-234ade5a819so24250125ad.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 30 May 2025 15:40:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1748644841; x=1749249641; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=m1drmllmtmwtWNasJJpvTqgcFCz1TJ/ySV8IFsfDlfk=;
        b=APsIdpMsM0plhjP1FwSG6gtDugcYkFYgMX2Dl1R687h47iBdCm6aigTfx+OPd8wfaF
         WjHMD6Hdzrm/90sKb5Cl9Nrto1eeGkIqUBa+RVWlKjDBF1JUJ5zflwsRxnLjruzFTEuV
         H17CuJQnkUXp+W/RFQ8e+xNQVeP8DMZlovQ1o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748644841; x=1749249641;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=m1drmllmtmwtWNasJJpvTqgcFCz1TJ/ySV8IFsfDlfk=;
        b=kUreyeJsyR4DFShinrw9p7z2+GpxBD575eW/MANgu/KY6+Ns9bwV+GPVPLmfOxWwP+
         LefeRr8x09ZBgbwLgdFIarBNxV2yDnRrAuweMExihqijX1GVy5N26wRSjpzEG1eMGtu8
         Op2dpus9GakrXYbq+A4kMeTlRWSagfirbuiR+43j0Uw63hrMEdVydMescrGS36GSMbpi
         hUyi/Wym224jMdqUMG7yHj0dMdc4JDdTtd/WdtWJP3p4a6qc/mUjfCLNkKCymtW/BaUf
         Q3ov5+g3imYkw8zsAn7/8Uv8TyX7EyqgA+KsIuqOCY2qyF5cMsrSInjR8WRRljOkWV88
         xFKQ==
X-Forwarded-Encrypted: i=1; AJvYcCVt8XCgCyF98Sy5hZRd3rYo1+ldArN1FE4gJ7hjYI+cJR7gHmTMUEZOXmawu6+RwFps+/iVKZ/m9f2qk2P1BKwb@lists.infradead.org
X-Gm-Message-State: AOJu0Ywu/g/ApR+sjDdJ+kEi6AuN3HPSk2KkOEAyRytzD8aVHhNKwS5S
	rj8tFBhwGKETg1DIWToyUMtc9Qal/8jYV2rMlwjyG5+LrEf7IPqsA/xVCUPazbLLYA==
X-Gm-Gg: ASbGncuL3+tj4PqpXsBUWtPM6J0zTfu5bEHjOMjr2NDF6bcJC1FAcmS58LxD6iwDm1J
	1Huw5ypHrxAoGhzlKpDA+KfEHebPQEhuLwxXuH8ElrY+gGdAfW2zUH9HBD9/RqxxiJ1IRUiDE16
	dXxYaB9bTvuiedeycXmx2gpk2EXTadwg2va5ShmXJERXp2o6wT1J4NXqOi+rIjIWmr83p2WcZkb
	lKOhrUokzVPHus6l1e3n7jR1pAI1HDOxpi7qjBdrzxdjpVxkyG+4DD5MsqlMIS4OmdsPaXZhoGh
	+drgT6Fmfk5ly41QLM2Oayo32Qg40jI/TSW7E8L2IfNFrtLpx1lYA9ue+M+bYZXnkmZTFJKmVDH
	uaIrV9DhGzOg9IJLxNL04enYE/pkG68c=
X-Google-Smtp-Source: AGHT+IEjX5DIunGuGQempttaCvqzE5hKj7Lhn61f4N914bLVvv2ywe+jCdSk6DPyHm6F+JX3bD1s6A==
X-Received: by 2002:a17:903:b0e:b0:234:eadc:c0b4 with SMTP id d9443c01a7336-2352a08997fmr77984725ad.44.1748644841428;
        Fri, 30 May 2025 15:40:41 -0700 (PDT)
Received: from stbsrv-and-02.and.broadcom.net ([192.19.144.250])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23506cf523esm33109385ad.170.2025.05.30.15.40.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 May 2025 15:40:40 -0700 (PDT)
From: Jim Quinlan <james.quinlan@broadcom.com>
To: linux-pci@vger.kernel.org,
	Nicolas Saenz Julienne <nsaenz@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
	bcm-kernel-feedback-list@broadcom.com,
	jim2101024@gmail.com,
	james.quinlan@broadcom.com
Cc: Rob Herring <robh@kernel.org>,
	devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS),
	linux-arm-kernel@lists.infradead.org (moderated list:BROADCOM BCM2711/BCM2835 ARM ARCHITECTURE),
	linux-kernel@vger.kernel.org (open list),
	linux-rpi-kernel@lists.infradead.org (moderated list:BROADCOM BCM2711/BCM2835 ARM ARCHITECTURE)
Subject: [PATCH 0/2] PCI: brcmstb: Use "num-lanes" DT property if present
Date: Fri, 30 May 2025 18:40:31 -0400
Message-ID: <20250530224035.41886-1-james.quinlan@broadcom.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250530_154043_258199_E3D8C006 
X-CRM114-Status: UNSURE (   6.53  )
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

v2:
  -- DT bindings: Add default, maximum values for 'num-lanes' (Rob)
  -- Add 'if' clause to clamp maximum requested num-lanes


v1: original

Jim Quinlan (2):
  dt-bindings: PCI: brcm,stb-pcie: Add num-lanes property
  PCI: brcmstb: Use "num-lanes" DT property if present

 .../bindings/pci/brcm,stb-pcie.yaml           |  4 +++
 drivers/pci/controller/pcie-brcmstb.c         | 26 ++++++++++++++++++-
 2 files changed, 29 insertions(+), 1 deletion(-)


base-commit: 01f95500a162fca88cefab9ed64ceded5afabc12
-- 
2.43.0


