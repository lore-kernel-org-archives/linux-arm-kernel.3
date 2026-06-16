Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC7B2CD98E1
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 16 Jun 2026 15:25:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=b7M8qZtmu0bZQdu1QNURqoYjrqJMG0t/ykNnN1cBj2w=; b=ULsMAMQ5qA7KLAmD73wyl79TTq
	4pqfFIgnqcLLkL1sPwG7QfP3RnemIIEv0BJshdJr+eYExzHYQjGOte5XFDL0JOB8t4C5F2GVUo95G
	ybcP1iuvUZmphZ+ul1B+s8mTpJ3d+9ix0bQURBnnUsoQ1QUvO4ErFVY3oznUKHuw8uqR41HHzO3Zz
	L5kHqRdzg4Xu2Ao7TNecLfqiGSYpi+3zfQMH+WsH6xuEosrk8qqAdVXxidyTv6/49jgGHBHjxriL5
	kgCpqR8x+g/mFuksJE2rE6Df82f5bTM5mb3GA8146wWrcxPe7tVczWgT/0iCI63Noz0TJ1r0zTWh/
	T3fymQZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZVex-0000000G0Pv-1K8u;
	Tue, 16 Jun 2026 15:25:03 +0000
Received: from mail-dy1-x1330.google.com ([2607:f8b0:4864:20::1330])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZVeu-0000000G0Og-22RT
	for linux-arm-kernel@lists.infradead.org;
	Tue, 16 Jun 2026 15:25:01 +0000
Received: by mail-dy1-x1330.google.com with SMTP id 5a478bee46e88-306f36df4feso3293669eec.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 16 Jun 2026 08:25:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781623500; x=1782228300; darn=lists.infradead.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=b7M8qZtmu0bZQdu1QNURqoYjrqJMG0t/ykNnN1cBj2w=;
        b=aKhVqO7r5aZwtnkqQmyAyWGiYQuKo0GWH5VtNUFOqNypfAW/usma5zsH1mfBSIVe/V
         GObckdTY5+11e+EXihD/v737ggpRRXQHjEOtVzqbkFyDLuF6v5E8fuTe/eoX0zIfURes
         gGchNJ4mBLia/8MsbHBuibhzbdUddPFag8iP6kibwggk9K1ee3ExjpGku4WnRz6Tvikl
         cfxQYxvSroXpwmEdzCHsP7pLc06Rs5KQVjovdeQQKdh350BvyFij2vTbe50gqfqiHA+z
         +W94I3+AlS+Ym9nJqN2wuOa8KSP5mgirlFOa6/nKAw3aNsROr2M5bwu+H5yo02BlF0H2
         fqLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781623500; x=1782228300;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=b7M8qZtmu0bZQdu1QNURqoYjrqJMG0t/ykNnN1cBj2w=;
        b=NTDTotmAF0GKeKI58OSAPRchENKpyuagUZk1nqBXxq08eGq0lrymDpD9oXlNhPJiWH
         mxVmfJh5TtjNIPChlcWlH8fDfKp0O0sEJ/tA8CdFTsmrPS465B8tHWuMEuYAuPKodb5w
         NzqYrcmxSUvwXo2fHSLs/6zMsGa2cyd+fjjPHjCm6gT+9KH06hgZxtnatPz8pLM07vS5
         X/sCe06tJkkoNb69sfvSMvDinOq6QSfHLye2f0JK2/Y8RXH1L9M0ZNPnLU7jfHOFUqgj
         aSt/nLgRJDR8msKh5VUQZog2y/CTBkVGdmu0pHVk+m24DLx83z2dq4h1LabJUIRV70EG
         N4wA==
X-Forwarded-Encrypted: i=1; AFNElJ/VN9AkMW4LdSM0kH0/eHaSwn6tBr9c7ChAC1gmEm2E+L6AMCTBSGO6qx70fI/LL++tJXMPXMifw8/VP+/w02Y/@lists.infradead.org
X-Gm-Message-State: AOJu0YxduLZ4LexkDqMdHaDrlWj/8pukWqHQaGMg9auLHsyi4wrSZetI
	k7lLXDuTiJkxoh/sBZFsKotXKN9DbX/pXOBAsqrTCYDgDEiUwzlV4Csk
X-Gm-Gg: Acq92OECLJvrGtA6o7122iKvKVjw+GBl4W0KytNSpyyin3kUl81gsiTeVt2RSXa5nDe
	4NFXa6dF659bSOBKtk3Kh8JSHuXkHmJTzdn7Eh+WtZdbxdrsfjVo+3rCmJB5Sk+r3uKYZ4ta3f7
	tiq0ml3EhJQGreWQu9oZeW/RQ6bsX4SoO39oncYjmn1gTuUeTVRz7ag+lE5jAHp2+GWOT76t9/b
	y1jaVBtP4m48DiA0lsKJWK2/Nc0M3Q5WX4hN0X6iZubeThmH+TE7HMRDzqw1LcXwTJPnMkLeLJm
	lu4FoUb1z35JcBbKRT+owYD8/OhrgZeQubMrjHkYAdXbWRVbXvVZdnIWcXsFjSDOQVraLfvRA2z
	nNjhm2gbOgbQg/7X++2RZLOThG+EtexRGSjy6FOpJNDkk3fP4rpvINxzF7YlBBpC8Hq6+usfBeL
	xmUt8crec9PPPnm8RaxOjH
X-Received: by 2002:a05:7300:bb07:b0:2f9:1004:b2cd with SMTP id 5a478bee46e88-30ba3ad0bcfmr2565276eec.20.1781623499389;
        Tue, 16 Jun 2026 08:24:59 -0700 (PDT)
Received: from geday ([189.115.92.220])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3081eb95450sm23757871eec.28.2026.06.16.08.24.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Jun 2026 08:24:58 -0700 (PDT)
Date: Tue, 16 Jun 2026 12:24:48 -0300
From: Geraldo Nascimento <geraldogabriel@gmail.com>
To: Shawn Lin <shawn.lin@rock-chips.com>, Dragan Simic <dsimic@manjaro.org>
Cc: linux-rockchip@lists.infradead.org,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
	linux-pci@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Geraldo Nascimento <geraldogabriel@gmail.com>
Subject: [PATCH v7 0/3] PCI: rockchip: 5.0 GT/s speed discouraged by Rockchip
Message-ID: <cover.1781622998.git.geraldogabriel@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260616_082500_595903_B279B0A4 
X-CRM114-Status: GOOD (  10.83  )
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

Dragan Simic already had warned me of potential issues with 5.0 GT/s
speed operation in Rockchip PCIe. However, in recent interactions
with Shawn Lin from Rockchip it came to my attention there's grave
danger in the unknown errata regarding 5.0 GT/s operational speed
of their PCIe core, including data loss.

Drop all code related to 5.0 GT/s operational speed from this driver.

Endpoint Mode driver was not tested.

Changes in v7:
- In pcie-rockchip.c (PATCH 3) drop unreachable code
- Link to v6: https://lore.kernel.org/all/cover.1781207474.git.geraldogabriel@gmail.com/T/

Changes in v6:
- Squashed patches 3 & 4 together as suggested by Mani
- More formal warning message as suggested by Dragan
- Set the 2.5 GT/s bit regardless of if link-speed is set to 2
- Link to v5: https://lore.kernel.org/all/cover.1772239598.git.geraldogabriel@gmail.com/T/

Changes in v5:
- Changed commit order to not break builds and adjusted copy pasted
  commit message. (thanks Charalampos!)
- Reintroduced behavior to force 2.5 GT/s in case there's something
  non-default in the DT. (thanks Dragan!)
- Link to v4: https://lore.kernel.org/linux-rockchip/cover.1772169998.git.geraldogabriel@gmail.com/T/

Changes in v4:
- Incorporate suggestion by Bjorn and refined by Dragan to drop the
  "catastrophic" code
- Link to v3: https://lore.kernel.org/linux-rockchip/cover.1772057799.git.geraldogabriel@gmail.com/T/

Changes in v3:
- Clarify warning message even though Rockchip won't disclose details
- Drop DT changes as they were applied as subset by Heiko
- Link to v2: https://lore.kernel.org/all/cover.1763415705.git.geraldogabriel@gmail.com/T/

Changes in v2:
- hard limit to 2.5 GT/s, not just warn
- add Reported-by: and Reviewed-by: Dragan Simic
- remove redundant declaration of max-link-speed from helios64 dts
- fix Link: of helios64 patch
- simplify RC mode comment
- Link to v1: https://lore.kernel.org/all/aRhR79u5BPtRRFw3@geday/T/

Geraldo Nascimento (3):
  PCI: rockchip-ep: do not attempt 5.0 GT/s retraining
  PCI: rockchip-host: do not attempt 5.0 GT/s retraining
  PCI: rockchip: drive at 2.5 GT/s, error other speeds

 drivers/pci/controller/pcie-rockchip-ep.c   | 13 -------------
 drivers/pci/controller/pcie-rockchip-host.c | 20 --------------------
 drivers/pci/controller/pcie-rockchip.c      | 14 ++++++--------
 drivers/pci/controller/pcie-rockchip.h      |  3 ---
 4 files changed, 6 insertions(+), 44 deletions(-)

-- 
2.54.0


