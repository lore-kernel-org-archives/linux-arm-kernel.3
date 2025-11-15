Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1563CEB2CA
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 15 Nov 2025 09:10:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ADQAnSwvVC1ImIoBeUuLW2dj0lHsSmlBEy4wGW0y87o=; b=aILmk9b0isqCTXTYEspBnG60QA
	rYHqPwvgz/FEJD/b1jpEHW67UeRdaGTFMLsj4Db2YCCrLb7PTwRbDR6PAowFZo9PJ9fJetNHpt0Lf
	GIcBO9yuTAjNbfoyBHsClEPORFlk2Uq4Qlvm1kCAWgxju8MvX+ShpTCFiKHBNqAmdSt8BR+fKB94j
	bS6zYy0mzdUSlMFPT6UZnvhn/6lpuKlkEzKT+sxXpy4jDl5YIsmd3WOHaB+D7Py/r/+/mMDXqM/9c
	4OIw1Iut4MlentuQWaHXwkQIl5OtzxKq9QtaZ6jwxm+++buf5Q/IJ2zPLhB0zQLilwszOE26OcKRC
	va4nlvkA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vKCIO-0000000Dd7V-26xf;
	Sat, 15 Nov 2025 09:10:12 +0000
Received: from mail-pf1-x436.google.com ([2607:f8b0:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vKCIM-0000000Dd6a-2bnv
	for linux-arm-kernel@lists.infradead.org;
	Sat, 15 Nov 2025 09:10:11 +0000
Received: by mail-pf1-x436.google.com with SMTP id d2e1a72fcca58-7b9387df58cso3598873b3a.3
        for <linux-arm-kernel@lists.infradead.org>; Sat, 15 Nov 2025 01:10:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763197810; x=1763802610; darn=lists.infradead.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ADQAnSwvVC1ImIoBeUuLW2dj0lHsSmlBEy4wGW0y87o=;
        b=c2UnbdOEx2XyKRoktMHYc0udbaooRzSZLHE8RYYl2VBGIluaD/PALtWRVH7Wr/MyAb
         Fs9I788OQytYE9m2pejFHOfW9Aiu+Aw7hLHNigAOMt5s7QFqgBQADwaeypvKo9MG6t2i
         16bzG1AfIUYY5f3HRISngBc3kDFBrC04/gHMhjbHJVs9gLJ6QuLA9q6Kmm9fTi9igv/6
         hzunKwB9mg5xfAPSP/ckdJ/O+5n57U2xOCcJtaeaS6qr2+8dzdXyImvi11BQb1ulycP2
         S8h+OfhZDmFs1SyeA8Z4S/P40RB/v9odM1tI7QUdI6rCFk+Bk4TkT/WaSy1169ljhVdn
         PcNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763197810; x=1763802610;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ADQAnSwvVC1ImIoBeUuLW2dj0lHsSmlBEy4wGW0y87o=;
        b=hP/EPYrSS1GLAntVSo3nG6xMVbaPeLtmTo3H4BpdC2YxKOxD8ETvPolp2bsDQsAk+J
         ryrxuSD5TPzAz9h58rhp55jdf0iRR8/2zYd178eeOL75377dWioyFrAfzvwh46TOeoT1
         arFrgj4uKOPunbBoYPI5neshcE8Pi7ZMdpPGvJYlcxbzjHlgGqiQpZV+lS3VH1I1Nq5O
         +gHwPlEDtpn9I8GjVBqxvrD7yfSmbhBjC5uSIs5u/nnsXtI+XjojNcs5EbS56lDTp0VA
         vBQDeAakNa755zZnlgkyRnF9N/5Oui62DhFapPzUa835g5PnQfcDrpVO7KUkCR/eqZjk
         PbqQ==
X-Forwarded-Encrypted: i=1; AJvYcCUegNup6rwUQ/6kRaC4Py4D8U/0luv0I7UZvo5WEsC8HrBzhEXtPVwIcZ92qDY0zDUXy86xAtOOZPpm4XC6ueVP@lists.infradead.org
X-Gm-Message-State: AOJu0YxgO0o5oPH8ahCfH3SaLz1mx1Ch3i8BDXlo9UMrDINouryJ56gH
	wIlmZRDxJBbcDH3+cE8chabRtqpfKlNzy/dAR8A7k5G3kxkXeS+CBqOw
X-Gm-Gg: ASbGncsQlsRj8oVWK/QNCQi3EeTsHwXKVDxKJpo5luVUeAms+6tn+GxQfR38JmdxDzL
	DNpHccsjAbnXK+tYV8E8B5ZiOX+LjjXtQR2D8dRroW8SIybgMbXzLpgXGvSctg04YXP5EA8YEDR
	quODC+G5IXf/42Ykd4DSydfwzj1E/NRBhrIUNaxIbkt2ih9Ck57BPTzokOQnXqC5FB7s+abiNxP
	tvi2ThHCXtNFo3dNQ5xYF4kEt7rvrTSkXp0wKEvz5tbf+9bsihRGdRkBSbAdJZYkeZfEb5GMrTq
	y+OCJEj4ufkiVk7g6vzs50boR99Wwwyzy6iFZyTvQ1wfgYddRpw6yuVbVmDJ/ot39/wC8B/+9bj
	+AJXNQKZ3IFeNfn6053wq3EiDNh0+opKY4Lw3LBhH1Sx/WONWouUVe7pJeTATAsIRZxsPgoKN3A
	==
X-Google-Smtp-Source: AGHT+IHdjP02d7ceK6K3dpKetL3hR+ZP5vYC0Jlsf4TI9ATvPdblwdLfXK7WX2I855lZDI3z3GpW8A==
X-Received: by 2002:a05:7022:7e0c:b0:11b:9386:7ed1 with SMTP id a92af1059eb24-11b93868306mr476264c88.46.1763197809720;
        Sat, 15 Nov 2025 01:10:09 -0800 (PST)
Received: from geday ([2804:7f2:800b:a07a::dead:c001])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-11b06088604sm20965645c88.7.2025.11.15.01.10.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 15 Nov 2025 01:10:08 -0800 (PST)
Date: Sat, 15 Nov 2025 06:10:01 -0300
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
	Geraldo Nascimento <geraldogabriel@gmail.com>,
	Dragan Simic <dsimic@manjaro.org>
Subject: [PATCH 0/3] PCI: rockchip: 5.0 GT/s speed may be dangerous
Message-ID: <cover.1763197368.git.geraldogabriel@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251115_011010_665152_459EF41E 
X-CRM114-Status: UNSURE (   9.48  )
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

In recent interactions with Shawn Lin from Rockchip it came to my
attention there's an unknown errata regarding 5.0 GT/s operational
speed of their PCIe core. According to Shawn there's grave danger
even if the odds are low. To contain any damage, let's cover the
remaining corner-cases where the default would lead to 5.0 GT/s
operation as well as add a comment to Root Complex driver core,
documenting this danger.

Geraldo Nascimento (3):
  PCI: rockchip: warn of danger of 5.0 GT/s speeds
  PCI: rockchip-host: comment danger of 5.0 GT/s speed
  arm64: dts: rockchip: drop max-link-speed = <2> in helios64 PCIe

 arch/arm64/boot/dts/rockchip/rk3399-kobol-helios64.dts | 1 -
 drivers/pci/controller/pcie-rockchip-host.c            | 5 +++++
 drivers/pci/controller/pcie-rockchip.c                 | 8 ++++++--
 3 files changed, 11 insertions(+), 3 deletions(-)

-- 
2.49.0


