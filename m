Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A80FC3ABBC
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  9 May 2025 22:31:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=YuvwOYm4GSUNUy2wD5gyT6WoJqASKId1GoOL6RjMuAE=; b=bKgugJ/O1tM2TkduSHbiuNPbQJ
	3oyfr71si/1wfTyjvvpGutzYVIHR2XiJ4lRNqDotzGsnslUY47KzpHdEiUtAZgEtuCky6ksURahu3
	VAUcA601U/fiwPg8XNq8HwSQawPlG21DbBu1YhZUDHkewNfufiDYUmsPiqmxab/+5FDH8qJ2vEazV
	qPeq6hXFnohvVrUuKkAaMuxnpb0Jt5Pztbo+WsvkCpVfE4S/7FDWjJNEKZ7ZGP6Nrb1woFoefZUvK
	GpQi77rpoHcKGGdCt05SDwB9X9o6oKTwkkM3TZV1k+TVXg7Ya8sSbJOql2a7XLQDgrPk89k3un1Ir
	cml8EUYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDWFB-000000054Ya-1GUf;
	Fri, 09 May 2025 22:31:01 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDWD8-000000054KO-1K1v
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 09 May 2025 22:28:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=YuvwOYm4GSUNUy2wD5gyT6WoJqASKId1GoOL6RjMuAE=; b=jCAbylVOXRIktiovSyTvZZZc6r
	aLy/hXTjkCgBSDP5EweC0AltysbhZ16Zd4p97GQAWnlnvdNIlhlvze2S0VJfMUjJZdnKIleBOqhH7
	xzDRzt1hnXqkkPGCnofcrFDH8K4WdSKeF1qpVZnVGmkWeMz9oCXMEkVpoDJvZoXOmAcVZTZHuldMz
	IYtHIybt9olqKLjaFQFbV1b2Q/yMaonxXAxyEA2Wo9Ik6JWcM8qi8cogOh5q4nlDApO8ROb/7EabK
	QJj9Nl6jwKgVJaPR/k2JLbwTEzC60DqAwxTKqcpYGz2cV3AKGxWUU0ID39l4UHJTxOOtWXehlvfIp
	goVYd/6w==;
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
	by desiato.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1uDWCv-0000000GN4k-3KFc
	for linux-arm-kernel@lists.infradead.org;
	Fri, 09 May 2025 22:28:51 +0000
Received: by mail-pl1-x62c.google.com with SMTP id d9443c01a7336-22e8e4423ecso25092455ad.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 09 May 2025 15:28:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1746829705; x=1747434505; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=YuvwOYm4GSUNUy2wD5gyT6WoJqASKId1GoOL6RjMuAE=;
        b=AQNj3/fxSXEkmbfYi8At285hOgqXjO0N1VS9UmUt9FQE37fS5uCbLyiMQ6sSdv2JkM
         BTlTgNQ/QHyPMBTvJSmpsUG7luVwRLQ5cLIOuBMxj1HASV9CH8x5U8ry6OQT6rJnLJBX
         PACDECcf3pekvFiy8j6JW8ZXnCsNBc/XVIOXw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746829705; x=1747434505;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YuvwOYm4GSUNUy2wD5gyT6WoJqASKId1GoOL6RjMuAE=;
        b=rfErDWq8rEw5wPv7ulvaVc8BcUlU1h/yS6iomZft0IlxsnO6k4sbQV05KSAR6tzkmy
         gKIm+b+yjNyUUV8VQL/qFkI0YStLlbMV8L9OCWV+HaPiroEwEESZ0NAOznlWbkiNqwbY
         OgVj3BvOxl7Ir7ZlWWqqszPhyH0lmoBFgrwF8ZZQ0o/lWnJhHzKz4E6MVVWYpfRAORNM
         DH9sIq/6Ut+l7VlLcYQiHlVQkRgvC+dZ3xr9lbaZpYqcMMBOY9wXcNOENwVsHkTi5gUQ
         cdicLHJWqInIOaK7sQvexp2eH4llZYxqpvvGhQtMD+50uA0A8ErN767p9FVE5LKLscHd
         S3Ag==
X-Forwarded-Encrypted: i=1; AJvYcCWP8kWW5FfDNRI/VRMiNBGhtr2opkWzKbbriXTRmeuMvi+OluD7AR2XIV+1mLkDMul4tx2kSz+6cjHnAT/kLdOL@lists.infradead.org
X-Gm-Message-State: AOJu0Yz+A3TYGw7UJbebStmpgVez7Os7e9LH0ZJAe5QpL9C8gC06DnR1
	4CYAlb+/boC/reIOuee9gwQGqvqHY4ArmnCeXARP8DSCdwme1xfACGg2lQlksw==
X-Gm-Gg: ASbGnctEq4hXYRInluux3ivxBnfBtZh8jtbov+Z1i28UODWl004ePRKXJ4gnD3KtNyL
	V3wS3uqE130cbTyCNxkIq8hChpckTFhYQT1YytPMzvqsqtUXoStzhE4B9rYfFqCRErMUwH64tUE
	uX2IfNKn2dqFOjjvYVuiUq6cw11Q5OEzqp0052bhwxKlQqlUlODhUJQxX5bqty0Yf1ejo1XK+Kv
	PbPfjoe/wNP5dXdOSvGK3oO4MGOLEU9AsZ7YphTtas0e8F7cmufPOR/0zWAHK0/Ej+iKZMnmT5t
	MFY0vdf0LhcIo6Fc5+2GwJVdcXYxS6kt6ijFb7mShc5mmDml1EDiTgnmYijUOalAIeZRai+Nui2
	ZOmMqM+4M7GCs/tVJJ1Pc9/KJH6hiSz0=
X-Google-Smtp-Source: AGHT+IHnRTtiNbjExYWwvoR2t+W7MP9bwGubNxYQG/OewKoIdPhHsxX+NcKse+IqZBIXhDqj/IpvGw==
X-Received: by 2002:a17:903:2b04:b0:223:47b4:aaf8 with SMTP id d9443c01a7336-22fc91caf3dmr64938435ad.52.1746829705327;
        Fri, 09 May 2025 15:28:25 -0700 (PDT)
Received: from stbsrv-and-02.and.broadcom.net ([192.19.144.250])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22fc7544fadsm22584465ad.24.2025.05.09.15.28.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 May 2025 15:28:24 -0700 (PDT)
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
Date: Fri,  9 May 2025 18:28:11 -0400
Message-ID: <20250509222815.7082-1-james.quinlan@broadcom.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250509_232842_111851_07A2CEE1 
X-CRM114-Status: UNSURE (   7.12  )
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

If present, grok the "num-lanes" DT property for Broadcom STB chips and
configure accordingly.

Jim Quinlan (2):
  dt-bindings: PCI: brcm,stb-pcie: Add num-lanes property
  PCI: brcmstb: Use "num-lanes" DT property if present

 .../bindings/pci/brcm,stb-pcie.yaml           |  2 ++
 drivers/pci/controller/pcie-brcmstb.c         | 26 ++++++++++++++++++-
 2 files changed, 27 insertions(+), 1 deletion(-)


base-commit: 01f95500a162fca88cefab9ed64ceded5afabc12
-- 
2.43.0


