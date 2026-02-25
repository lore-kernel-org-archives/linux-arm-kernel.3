Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50EBEFD45F1
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Feb 2026 22:27:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=TcgCgCEo03Z5mFFecYPzQD3Rq4C5qPBZUB42/osw6tY=; b=GjTEk+82dCIH4mXkU94WZwpWlh
	5/pWr6Moie3pd25ZS6qAHQ7GwA6kU7EuCG1hhZGhhx9h7zEO6aHRbsMkbMTbcNf8kz+P7y0Mro1+j
	yBixy77wGkAamyfgCM+EvNoXXrNwujgXE4ut1oy1fx3ciy4+5sbCeO/BCWquXb7cUlnPjxiluYbZ8
	2QFrXKgb4XT0CMXuEiLNV3TtJq8zlUUQ09JllXW4eqp6Veny6dSfTvcjEctfqdsqiSFgPm/CFjIDo
	10liToxq9kZNP4/Uu5anMk/6vQQrvmCHdgOEZ/USlfRaWGwMC8+EaEqQNB0XP/3QfHDRGS0sB7Cr9
	PG4ZX1Nw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvNLO-00000004zwv-1w5h;
	Wed, 25 Feb 2026 22:26:58 +0000
Received: from mail-vk1-xa2e.google.com ([2607:f8b0:4864:20::a2e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvNLM-00000004zvS-1QNE
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Feb 2026 22:26:57 +0000
Received: by mail-vk1-xa2e.google.com with SMTP id 71dfb90a1353d-5674d8be45eso130055e0c.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 25 Feb 2026 14:26:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772058414; x=1772663214; darn=lists.infradead.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=TcgCgCEo03Z5mFFecYPzQD3Rq4C5qPBZUB42/osw6tY=;
        b=FrzIHlUe4RHVDNTxU7ozU/rsQKWSKCqzaO3u+mxk3WAUeCP00MFmb37yRoiFJKPSuT
         086TS1WQCkMrEzbRcYEzKSKJzs8iOBZgI2q0eiP8QbuvHw8+TLSaufioFEpRKz6B7Kso
         aAlJjNM18dktrfFn/525Ee/eaWnXAANrouupoRdFOX5Ng8Jk+NmihPym3ErcaHzyrp8B
         4j7aILb3+eriETO0EjQ6LpSSpZD7YKuENo6gkCRaP6pUn0cK48LC3rBWFv2BcwDUj/O6
         xnterClcJrm/LrVQj8dMD/rUgHX2ACSYPMV15x0EiAO0x2qUYt32fbQAe4uM6CprqXFe
         4HgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772058414; x=1772663214;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TcgCgCEo03Z5mFFecYPzQD3Rq4C5qPBZUB42/osw6tY=;
        b=GPp/WgaZbZOdDkeSBsdKNiR596ndI0cKUOf2YUS4yoQG9v85BFDDu/fJaHyTr7B2P8
         PfJs1JM9rcpRZ6z4WglCII4LS3yhyEZ0gOvkeyoS0s/TP8ae4Gf4XqLiklsk4ovqVqq1
         P7BKKJ25urVTnN8dmyLrkuMXAQs0jLucQN4VJMXjo64DtaewFs3fss3ebpAHC3c7awWP
         Revi6EEm8E9WDeQGgP4n7SFLuvZuQibDJwK5vCM32LQlBIvfX+K6TvzL06TZqdliV/Rm
         ldn/qHqYh2iXcT3dMGMrtnG3+iOn8dJDYoermo2iEwEyppXkxdXH4MijybW/9QqhkL4W
         AiYg==
X-Forwarded-Encrypted: i=1; AJvYcCWXB8gcbxo+SEdpiJHQbcInwOKT9JgRMxIPsQKUTAE/FEX94xnlauV9+GEIifvZslQoYT/LVjwgMubFAAQr776H@lists.infradead.org
X-Gm-Message-State: AOJu0Yy6mX9rlZIRh7wfybevoWxedzG7gRWfGGBkPFL2FjzaNJTX1qCK
	zUnH8b44fHc2lxOyNRh4jij4b5LfW7A+eQ6q6WONde9HqSl2Ui9pvPRX
X-Gm-Gg: ATEYQzzv6e8NiJnDnYcfEWHOodWv+B1gS880ovcU0yCTpsAcY7q0h8BzViHrJ9QmLXl
	SP/rED4Eoc0GjUgrV0WEafNZtXHrY0xOxx1csD2c7YvfhW3iTo4FwZGOcwPSKeRlGGi1NcsEoc8
	NtVpa2Ws5R9+UZAwdlSUGOh9bjBfRiylPgZIZwKg6QXHG/eaKzNTOqWAppzeWwTIIHpFAql0s8N
	0JI1ccySd/oh0OA4420Ac866zQut/VGBGcZ+yxUcei1X3YBmp4bqRUHnUGxvy5TY+ZtMR0Vi8VN
	NS8nn3d0PPSmaL8XRAWj/xPlt0B3GaFLtfctI8F1Xk11P+kLSAI1w6er27J3Bc/HCZFU0Wcikcs
	DWVIpRi6N7wywNDQcnqm6FdACOboP2Nn5l1eYKowGG2dzhN4j/zvhXpgBrT2HdqetrtvVC8qxJc
	B1yNnVfedN1e62sroPUTeH
X-Received: by 2002:a05:6122:3b82:b0:567:443f:a772 with SMTP id 71dfb90a1353d-56a92ecd28amr155892e0c.0.1772058414356;
        Wed, 25 Feb 2026 14:26:54 -0800 (PST)
Received: from geday ([2804:7f2:800b:f14d::dead:c001])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-56a91659421sm592428e0c.0.2026.02.25.14.26.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Feb 2026 14:26:53 -0800 (PST)
Date: Wed, 25 Feb 2026 19:26:46 -0300
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
Subject: [PATCH v3 0/2] PCI: rockchip: 5.0 GT/s speed may be dangerous
Message-ID: <cover.1772057799.git.geraldogabriel@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260225_142656_390171_6AA3BA00 
X-CRM114-Status: GOOD (  10.99  )
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
of their PCIe core. Even if the odds are low, to contain any damage,
let's prevent 5.0 GT/s operation as well as add a comment to
Root Complex driver core, documenting this danger of data loss or
worse.

---

Changes in v3:
- Clarify warning message even though Rockchip won't disclose details
- Drop DT changes as they were applied as subset by Heiko
- Link to v2: https://lore.kernel.org/all/cover.1763415705.git.geraldogabriel@gmail.com/

Changes in v2:
- hard limit to 2.5 GT/s, not just warn
- add Reported-by: and Reviewed-by: Dragan Simic
- remove redundant declaration of max-link-speed from helios64 dts
- fix Link: of helios64 patch
- simplify RC mode comment
- Link to v1: https://lore.kernel.org/all/aRhR79u5BPtRRFw3@geday/

---

Geraldo Nascimento (2):
  PCI: rockchip: limit RK3399 to 2.5 GT/s to avoid data loss
  PCI: rockchip-host: comment danger of 5.0 GT/s speed

 drivers/pci/controller/pcie-rockchip-host.c |  4 ++++
 drivers/pci/controller/pcie-rockchip.c      | 10 ++++++++--
 2 files changed, 12 insertions(+), 2 deletions(-)

-- 
2.52.0


