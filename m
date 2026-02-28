Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F0D21048925
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 28 Feb 2026 00:55:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=oqjVAkGN45WCvwyHpK51yVytA2m9U+cdr8FXQh1dqPs=; b=EnaEIKIRjDcKsZgUhAq6w/FSsK
	iGfGbA2ZxumAFVsa2xT2bTD4ODWf51VpmukmSyK3tZmpye4hni5fUmlRBIp50BzCPSaMqRmYAGtr7
	X/5JN3pEfExcpTb+TYGGYVkrx0wKOG21P/FpADSY7xY9sy1xSjefdZoWbXhh/zj5YyDJCQA48a2rX
	Lcfg301+/yqMl1OjDbKAiCIbUb6B79HZ8Xx7QZaaeB/QWxH4q0mRV5ij/jZZqR7PUFqpGJFECfyza
	CW34mG8KSv3WN9vbG3PqacPFbhZxQRozb1hdVvJSZO1miUHdcDUPGFS6p/1xPmzPQehYCBzSslTgn
	7Bn/NoAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vw8bi-00000009LXZ-1Fqd;
	Sat, 28 Feb 2026 00:54:58 +0000
Received: from mail-vk1-xa2c.google.com ([2607:f8b0:4864:20::a2c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vw8bf-00000009LVp-3EtU
	for linux-arm-kernel@lists.infradead.org;
	Sat, 28 Feb 2026 00:54:57 +0000
Received: by mail-vk1-xa2c.google.com with SMTP id 71dfb90a1353d-5675d609621so2465877e0c.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 27 Feb 2026 16:54:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772240094; x=1772844894; darn=lists.infradead.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=oqjVAkGN45WCvwyHpK51yVytA2m9U+cdr8FXQh1dqPs=;
        b=DPFw0lQ+QpA6QvT3+fgGncTCIYHJMsVcVL1j9zQcnIBPHrCz0lZHBrhX4GV3FvO615
         V1cUDFhldR26AZXx3q3/jbl2csovlA9HXQfb1CCXnFMO0oR/JNjmL/OMNIh2gTh7ypDx
         +XOal/o0Zgtm3OBqUlusxvrB9MTWbGmubByT3Sr+MTyH/+5SObIdXWblZLF3v3fvec3j
         +pppbIOeN+fSgKUZ5G+etIJM0ALawxsjOCsGzlONKM52Y0LPFjKrTMCqVB7LHFDoE+NR
         /V8Hy/ND6krA5DnA2t0vS7qvfhKbkLSzBEeMUIRDrf6dTfXVKSra+8WjjjFf+l2TEGDe
         O2Lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772240094; x=1772844894;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oqjVAkGN45WCvwyHpK51yVytA2m9U+cdr8FXQh1dqPs=;
        b=olPdYRyhoKyxGM/PT15ddTJZBN3qVFh+YpHcueg6sZbkj+8HRpGFRuGf+vjxS6iWPK
         evykVBVHO9y3jMAkpThuNSf9ael+w4gHVcfXpx9/d1aNKWZdiyp4UDtETZbbKWXvNPns
         JDkxKNjxjrYWqg/TMndKTT1T8taRxwNDTnDdXyP07//jf6Q7yQD1wIBD7vZvIRncaAqp
         JqOWp7O+nV7cqKopsynPHq2Df65K65qY5nWXXrHl9SsNVDhGxgiisVudjECi9gVGbsAy
         1oZZby64dwtzNquU/SaJjl9gVJrzrje2TQW9bbvocih8Yq1cYAp8msyTTzdhyfufxcWg
         8n9w==
X-Forwarded-Encrypted: i=1; AJvYcCVY7QMO8P/DcfvOh7ZqktEzD07+fAJU1enr7daTKuziJA0MsCCj3XQ4VGdujQ3aJvdgJt9MeISpyM2QOM4Eh9PJ@lists.infradead.org
X-Gm-Message-State: AOJu0YxT3e0+ot23WTpZgiHzkge8+aOAP4wxPukOzt9fEr4iXjzO8aun
	C/oafXXO6RLqKdndSMfO1ybfRcY1NfpkV+ONK0yffacIk4P0mhMVIX7L
X-Gm-Gg: ATEYQzzD4JXU2bF57Bjzj2W71PCopu87DOMD+TnW//68FD/96KP3B48XzGnpUv9yzLJ
	bmc7Lv1G4w1tBi+icrnyxuHXXAbDcxDmr3dmyvUoD9maNY//raQiKzLipIjAPbShYEmvDp6GyYA
	3q25hfUiMa8PjMPcZKsdLURKV7fkvDxYyQG1mYkn0s/Z/0USVLTO5OVPmyJCw/C4aOpz4v3NRyA
	OAUTKPptKLdbAygucsB83VSoJfYHwBoGO6t0uvj9pPwr6wHf3qj/YqW42I9O7zMs8XGKfpXX4wE
	Ko3M82pA70Jc/j2ZzeCSBvgRKaxsy4LEgbjfWpYJE0pGGt1w/DdscaHyiK33SPig6FsuUiKblj/
	JWHWudtXPbVDbycxKn2hWvyMurRIn8rdJVqdLXF10jiZ0Smo1+Sl3qESaCdQ4ZMLZlVEzFVJ02Q
	vQkriCWe33KQ==
X-Received: by 2002:a05:6122:d04:b0:544:c8bf:6509 with SMTP id 71dfb90a1353d-56aa09ec812mr2879599e0c.4.1772240094275;
        Fri, 27 Feb 2026 16:54:54 -0800 (PST)
Received: from geday ([2804:7f2:800b:feb1::dead:c001])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-56a91bd2291sm8371795e0c.9.2026.02.27.16.54.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Feb 2026 16:54:53 -0800 (PST)
Date: Fri, 27 Feb 2026 21:54:41 -0300
From: Geraldo Nascimento <geraldogabriel@gmail.com>
To: Shawn Lin <shawn.lin@rock-chips.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
	Heiko Stuebner <heiko@sntech.de>,
	Geraldo Nascimento <geraldogabriel@gmail.com>,
	Dragan Simic <dsimic@manjaro.org>
Cc: linux-rockchip@lists.infradead.org, linux-pci@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH v5 0/4] PCI: rockchip: 5.0 GT/s speed discouraged by Rockchip
Message-ID: <cover.1772239598.git.geraldogabriel@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260227_165455_815252_8BC3D9FF 
X-CRM114-Status: GOOD (  10.22  )
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
of their PCIe core.

Drop all code related to 5.0 GT/s operational speed from this driver.

Endpoint Mode driver was not tested.

---

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

---

Geraldo Nascimento (4):
  PCI: rockchip-ep: do not attempt 5.0 GT/s retraining
  PCI: rockchip-host: do not attempt 5.0 GT/s retraining
  PCI: rockchip: drive at 2.5 GT/s, error other speeds
  PCI: rockchip: drop 5.0 GT/s defines

 drivers/pci/controller/pcie-rockchip-ep.c   | 13 -------------
 drivers/pci/controller/pcie-rockchip-host.c | 20 --------------------
 drivers/pci/controller/pcie-rockchip.c      | 15 +++++++++------
 drivers/pci/controller/pcie-rockchip.h      |  3 ---
 4 files changed, 9 insertions(+), 42 deletions(-)

-- 
2.52.0


