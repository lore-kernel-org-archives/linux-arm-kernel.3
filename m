Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D4D6CCF9FE
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Nov 2025 06:27:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=9n+VOC446iMLGSUtF1aVw7jOFyi8anlj6U7DHCW/jPs=; b=doeW87tE4ULgZfE/tJ6ab1nhQu
	8Bq8ZPz51y23ahhVk86YQ7dySEuaWEOnNHr2nA+hFoiZDh1TVLOKZNg2JhT4LQ6CoA13UzHZjpTUS
	eNm8m39xHsKui5p1AWA5jILGuoEIjt0g5PjE0dZql8dH0v3QR8vaDeC4Z2yfseP8WF8x935rPbGre
	1GqodWCQW3+0oYQ7TlYmt9CufYENHu2+tME8yCdr4HkdFJSjcs5Tbe72ObsF3Iv+rG1FoexpAdPzN
	uYhHptz/RwrcQ0V1ftmcHIPjZS/c9iXTa4VpWjC/maptrQ1NL/UM4R4wVHn+zK982XU9msZ5rmGEX
	iYs12Xpg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vFo1l-00000009IEo-15Wf;
	Mon, 03 Nov 2025 06:26:53 +0000
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vFo1i-00000009IDe-0hT1
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Nov 2025 06:26:51 +0000
Received: by mail-pl1-x635.google.com with SMTP id d9443c01a7336-2951a817541so39553875ad.2
        for <linux-arm-kernel@lists.infradead.org>; Sun, 02 Nov 2025 22:26:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762151209; x=1762756009; darn=lists.infradead.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=9n+VOC446iMLGSUtF1aVw7jOFyi8anlj6U7DHCW/jPs=;
        b=ZS7LxCjFlcHTfYP/4sULYg6sthPoly1EhdANivDf8itTUelo2fL3vR0WIs5mFZeuj5
         o7n4SLzUTKyNvWQR4FBsw5BemyVV0P695PAFCreN0FvEdgETUg7aqGxzZdV1dH2ts6Kw
         B3/xxMEMQ4EJbFc4zgFGblBscAM4EPL7rBIFU3+aEwkqvsq5KrIXfPRmvYrqdoePxQy2
         skMQEDf6GZ2FGmz8iyCLDw/iSuTn0Hcb4apKMZKYD7E6NSlRnWYjn6CxB4vPGCgky831
         TYnf9vhcwry9l7YCU7NiGof1+jr/Is7oKo1VO7BjXVbqCDXjE/RzjJWiW+4j/PeZbZLJ
         bnKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762151209; x=1762756009;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9n+VOC446iMLGSUtF1aVw7jOFyi8anlj6U7DHCW/jPs=;
        b=irlXrz5BLLs3SkPAbZBFkMTXMiscecd51gvtlc1Ct7ZV5a9oaq6yI8poZcPCvgPKyN
         u7yAe5zu/vBtvWgAaTEnNQMdozDlVR19zG7uQOXqWkwGBSjL2wmvRjXxZKDzpKlgoBBu
         Ob9vl5OJgIoFDFJDlg/2gXrP/qXftSblRE9JCRjjeXn6y1BRwwiE+Grj39CLdRqmp0GY
         K1hIn9EQaGNRsu2j5+exmwtn2Xnw02BF+jQK+mC/iNIlDAjWGtMNku6j8CBMHrYJl3R9
         ezYfhwsEvjieX8oRF9yoLLI4J/TSp9LTB6pl+I4I2R1xVGtoMiSjdStkSxnrqy10wV0d
         F6yw==
X-Forwarded-Encrypted: i=1; AJvYcCVDOMKMm0c3kJYiUGimcEmar10xl2s2z9jnGqIBgjKGOCGEDG4XJVKEZ4v1hcoreLZGZAm6Raemlqweq8Z0HPZS@lists.infradead.org
X-Gm-Message-State: AOJu0YwjSqEyPJ6Y6JZqIRrFQ1RwV5H0JIkzOiu2FGxbFWCMahiECVIR
	ffR9JimsLrcoFh5LxDD54ea7Ff72SHAN05+nuZYnM+b9YPyjfzidFvMe
X-Gm-Gg: ASbGncvIuf9ROAGRQabxhq3YBga9sPQ85KDUdU66ddwYvRpxJ6IkzibDEJN90hunMXp
	ux4/lQmohDCW/+uwPJQk0B+ucjrmXOLg4Cc+HWLwU+LBom4Jc7QEYHwFIEVMeYwcNC7lh4kgecZ
	rltwxSShSZiKGgj7g6ohRfbo8t1NjVlKV8U51uFlgq8qnT4F1gpx8yGOXNAa0adfT8nwUeTraOe
	UWC3wK2b+RBzoKed08jLeYly0qPrrDO4ZRHEnSG4tgEAB8H7EjSYPBvWQgzZI0+FYca5aMCewkR
	R2Vhtcl3JBKxSQ9CkkrY8gOHsI9kzZyFgqtO6UevopIYfLIByIESP/Ta9STAfUhAFfUPnx0BjM3
	3HGYrKgCtygzXXg+6FMA6o6QFyV0FvdQn4f4CvrN5kZ91I+kB9qSSjdcG2qBOMUAGirokrW3n3g
	==
X-Google-Smtp-Source: AGHT+IHE85ZAE05MQ29tDiEe73xuX9q1kSirWYaSnQbdQ95U62fo8gMJxYb1mTHJbA73o23JvHBMaw==
X-Received: by 2002:a17:902:f705:b0:26c:2e56:ec27 with SMTP id d9443c01a7336-2951a3d5107mr152483975ad.19.1762151208773;
        Sun, 02 Nov 2025 22:26:48 -0800 (PST)
Received: from geday ([2804:7f2:800b:fff9::dead:c001])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2952699b603sm107777285ad.79.2025.11.02.22.26.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 Nov 2025 22:26:48 -0800 (PST)
Date: Mon, 3 Nov 2025 03:26:35 -0300
From: Geraldo Nascimento <geraldogabriel@gmail.com>
To: linux-rockchip@lists.infradead.org
Cc: Shawn Lin <shawn.lin@rock-chips.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
	Heiko Stuebner <heiko@sntech.de>, linux-pci@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Johan Jonker <jbx6244@gmail.com>,
	Geraldo Nascimento <geraldogabriel@gmail.com>
Subject: [RFC PATCH 0/2] PCI: rockchip-host: support quirky devices
Message-ID: <cover.1762150971.git.geraldogabriel@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251102_222650_221356_4DE0E2A5 
X-CRM114-Status: GOOD (  12.65  )
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

With these two changes I'm able to work with a Samsung PM981a OEM SSD
that is known to be not-working with Rockchip-IP PCIe.

Previously I attempted a contrived solution that mostly worked for my
simple purposes but was rather inelegant and impractical.

Now I have isolated the behavior to the three lines in the two commits.
Omit those three lines and you get a working set with the kernel.

I have no idea how to actually implement this in a way that makes sense
and doesn't break the PCIe spec but it is my sincere wish that
interested RK3399 parties test the change and report any regressions
with already-working devices and specifically, successes or failures of
initial link-training with these changes.

Geraldo Nascimento (2):
  arm64: dts: rockchip: drop PCIe 3v3 always-on/boot-on
  PCI: rockchip-host: drop wait on PERST# toggle

 arch/arm64/boot/dts/rockchip/rk3399pro-vmarc-som.dtsi | 2 --
 drivers/pci/controller/pcie-rockchip-host.c           | 1 -
 2 files changed, 3 deletions(-)

-- 
2.49.0


