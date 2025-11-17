Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B780CE8D6B
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 Nov 2025 21:47:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=e5/Mnk8IlwC7NVL0B0/CURaWGhjHy5jv43K5mCqYKF4=; b=PJwZEtbDoM4D3tlEXV4hQXjl+Q
	DrHHhOpNy2FfmanyjF5oyojBZJ1tfeF5/9wBdCoqJGT+R8IjjmFWow6xb4SdrPuSYrUVfwnFOBCmj
	VFjAopjQ41tf5t8F/5xQDHFVVbOssQSre4GxoLVgZ7aOlmtlia+0UrR1Au1O+ugjAMjkgGXNU+K3V
	VSDD4lnpLE5ts8G6L3BXnwmiooMpHZWXQW+0pVRXmw25GYJej4TtfmDqjCx1//9btRceosq7HSJ4e
	BvVzqhV6M4oQ9Qtx3O/hs+5ki5kGP6BrXH/fEsFhVqRVWMlDrQkyM0c01Nkjv/hIdQZtwG4SjvCHF
	/E8LjZUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vL74O-0000000Gtj5-37uf;
	Mon, 17 Nov 2025 21:47:32 +0000
Received: from mail-oo1-xc35.google.com ([2607:f8b0:4864:20::c35])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vL74M-0000000Gthi-0ovy
	for linux-arm-kernel@lists.infradead.org;
	Mon, 17 Nov 2025 21:47:31 +0000
Received: by mail-oo1-xc35.google.com with SMTP id 006d021491bc7-65752954c38so737157eaf.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 17 Nov 2025 13:47:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763416049; x=1764020849; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=e5/Mnk8IlwC7NVL0B0/CURaWGhjHy5jv43K5mCqYKF4=;
        b=Iz/bfqpRTVQlyCnxTTkWU6swnV9ssclkrf9v0mvxgXDOzb3o5TFvxoOztuO2/AFmNa
         +D9RsVJ3v7YIsjTBoipZbN3tQ77DZeibB6hQDyyPaOUNLQqlvrH/ktYBPrYKx4TYKizr
         VjvzfepPXYDOixiizEaLueA2gcnhCb6UYYIPghleMhsWWECIv5BA/wl/yBRYMiymi9rG
         cyunAfmpU42nknr51TrZ0MKo3C4s36guNbnUT7BKv0hkwh9YbtNiZRm4kw8FCKLroynE
         asPN+Rs4qMERXYsZ0yoOd4DZLcy5bP4M2anDg6HDr5hgjAT/SUn3l/d+06v52MrOnH6m
         Ammg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763416049; x=1764020849;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=e5/Mnk8IlwC7NVL0B0/CURaWGhjHy5jv43K5mCqYKF4=;
        b=m+Kgkd47SFdSyqurdLluN+0iuy1LGip6Aii2X/VSRXU03OJzMWM7PTMUfslBsfqoYX
         IqkiSiUdNTZ4GZ9kEORXgu1rbQ6eVi35QipikQuT7u/TOLB49e3jioEmYU0xmjKTUNF1
         z9bdUlvKAr7a08UWXz/185nfzyrndGF6OesLRD9a7wXbyIC7lHRQNw2XRqVgwcIeYjxV
         dLkT2OjYCG8y9Y2IcQ7IBf7c+n7ZKwgeYk2crXTz0w88Ev0LEyQAcOEd/XgnUCNq8Iyy
         GfQ3ZMB9r2zUIumHLu2QHsmljXTl6sSKDJZYgCQC4euziYWWs/jKDOFQfuFzc+z3CZqk
         p7sg==
X-Forwarded-Encrypted: i=1; AJvYcCUIe1L0XDmFYREkIqiv8Y4V/LrJa+YQ7Pf64vvSDKVLxYdO1D12lXRB83T37KcEwjotc+6ABnleNupJHo+46WMZ@lists.infradead.org
X-Gm-Message-State: AOJu0YyZ0E9FohK86sLWNb7hGtyfhaluxsg1EjA7S9Wi02GWT8MvlP/2
	84cBmWnIcvWzityRpbHsB6/behlqzrBTZ1yOlJWxyyzBJSsMbFl+h0Ac
X-Gm-Gg: ASbGncumVyLN02vy3AYxGHKHbdre6TSFFVWT9yUK8M93t5qY9uzgSPrOKtaiwmZ7dj8
	+PEASVTKsB5LGs0PWd406qudVyBU3m/hj/bkVJnUA01YZyjqqasKHfN6x3kdD6PkbEVtW/MEYsJ
	Qx8j1TtqOaD9T4pOCeq6IFEoGyIVqt1KoY9rrk9GEh6TLTsAEIYtVuGsJepSrvszaugvTVZNemu
	N3uNSATPU5PUWZg+U++JcBvSVo3gAyhfVc7tDwaZzXfY6/z/6Y3OcITImtrwIAa41XuMRbQuGhA
	TTy4s1w63MZgv55c6oJYDb2aLr1tzfI6hRRvqFu3FcnVU9s9nYnBtfan4b8oFLMnthB1T7Qo7+C
	bdLOwwrF7pksgiDqB8WgOoWeNNVOt6P6NdURX0TTvZSiSzDKR11nQjkYU5idlW2koCjR0VHjLOq
	9iWYRqDgLN
X-Google-Smtp-Source: AGHT+IFbFQICWh2gP02Uz3H7G+3A9sZE2Z07hnxBP+XT6lcLkkYORqspu5DTPztkG3lR2Z2E4DHMXA==
X-Received: by 2002:a05:6870:a711:b0:3ec:64d2:3fd6 with SMTP id 586e51a60fabf-3ec64d2691amr104353fac.41.1763416049047;
        Mon, 17 Nov 2025 13:47:29 -0800 (PST)
Received: from geday ([2804:7f2:800b:a807::dead:c001])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-3e851ffc62dsm6367892fac.5.2025.11.17.13.47.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Nov 2025 13:47:28 -0800 (PST)
Date: Mon, 17 Nov 2025 18:47:22 -0300
From: Geraldo Nascimento <geraldogabriel@gmail.com>
To: Shawn Lin <shawn.lin@rock-chips.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
	Heiko Stuebner <heiko@sntech.de>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Johan Jonker <jbx6244@gmail.com>,
	Geraldo Nascimento <geraldogabriel@gmail.com>,
	Dragan Simic <dsimic@manjaro.org>
Cc: linux-rockchip@lists.infradead.org, linux-pci@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCH v2 2/4] PCI: rockchip-host: comment danger of 5.0 GT/s speed
Message-ID: <2f2825741e189f5d915560eede6ff7bf827546f4.1763415706.git.geraldogabriel@gmail.com>
References: <cover.1763415705.git.geraldogabriel@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1763415705.git.geraldogabriel@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251117_134730_242743_F346BFB7 
X-CRM114-Status: GOOD (  12.08  )
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

According to Rockchip sources, there is grave danger in enabling 5.0
GT/s speed for this core. Add a comment documenting that danger and
discouraging end-users from forcing higher speed.

Link: https://lore.kernel.org/all/ffd05070-9879-4468-94e3-b88968b4c21b@rock-chips.com/
Cc: stable@vger.kernel.org
Reported-by: Dragan Simic <dsimic@manjaro.org>
Reported-by: Shawn Lin <shawn.lin@rock-chips.com>
Reviewed-by: Dragan Simic <dsimic@manjaro.org>
Signed-off-by: Geraldo Nascimento <geraldogabriel@gmail.com>
---
 drivers/pci/controller/pcie-rockchip-host.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/pci/controller/pcie-rockchip-host.c b/drivers/pci/controller/pcie-rockchip-host.c
index ee1822ca01db..0af550277ee5 100644
--- a/drivers/pci/controller/pcie-rockchip-host.c
+++ b/drivers/pci/controller/pcie-rockchip-host.c
@@ -332,6 +332,9 @@ static int rockchip_pcie_host_init_port(struct rockchip_pcie *rockchip)
 		/*
 		 * Enable retrain for gen2. This should be configured only after
 		 * gen1 finished.
+		 *
+		 * Dangerous and may lead to catastrophic failure eventually!
+		 *
 		 */
 		status = rockchip_pcie_read(rockchip, PCIE_RC_CONFIG_CR + PCI_EXP_LNKCTL2);
 		status &= ~PCI_EXP_LNKCTL2_TLS;
-- 
2.49.0


