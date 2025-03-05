Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25196C282D3
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Mar 2025 07:59:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QUsr/iCnKd/GZUSiPP0qg3YZq8O3ABD8811wmqc6RIE=; b=l5AKFTXTWd8fCaNQ4hu/6ieOKH
	xrVDagVkMQxSsic3uwQvCFZmdj/dl0sAK4mjRS+UGAPl43S4/aci3+jRx9v3vvugztGIGpdrDkq5B
	FtBKfb4VO+ZHoevMYkykwEloYo/rBlEceqJsbNrtHpr56rUNqt8AUXvrlKrm1YRlZ2stDNVPCXwLx
	Uv+4Qft+cl9pBRJQMG1Bx+mpga4FL/dQhLgV6Uh1PjzA55xS9gvGr0UXPIjbdUkAQdsEQ+hTrfVSR
	igZ5VYxjm9D2H/gMqdYhO/7gcvLNHoGHhD2VC1ozmemHFyMxt09Gf6hG+mho8D3ntpRjkZKPw2t25
	7c6BqxNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpjeY-00000007J0K-42M0;
	Wed, 05 Mar 2025 07:58:54 +0000
Received: from mail-pl1-f180.google.com ([209.85.214.180])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpjYv-00000007ICa-21qL;
	Wed, 05 Mar 2025 07:53:06 +0000
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2239aa5da08so57775285ad.3;
        Tue, 04 Mar 2025 23:53:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741161185; x=1741765985;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QUsr/iCnKd/GZUSiPP0qg3YZq8O3ABD8811wmqc6RIE=;
        b=EB+Sk6BuyBmRxTamvVOtpg7UD44LRYoRGBvTrieGK1lDJtjuOwc4MFyv6a1AFFsnY+
         rS21pn6HKMJdUeMPYQHZPKhmFWVms0kyOubc5XYkXUOA6Ta9z7rgFEx6ZG0PM+5F9qDH
         1tvLgcVT7Rg5TiyOjT9z/TPplaujPoMBOJMhDVV+yQ2Yu2/ENQ5fOr0/NFWBdsL7RGz+
         m5aiWtfmQD3B/69J6dHpdAfbpKEy0Gv3RnwUA2mifOZIGNXD3HL6Fd73uNbdJDacLIO+
         NA5QNUPnWsqrwWmJ1R8LDIDVn5pp7VJ5tIuHYKbO5k9Akl87HJimp3zmZsnVUAIe22nA
         GirA==
X-Forwarded-Encrypted: i=1; AJvYcCUNAhDYJfFy9QKWfQNLeG54wqqP6n3uXbWDD+7okDgrhJ5PrYyIC8b6X/SBiqJ/t45HKLOn+8nRIibhcHJNnZQ=@lists.infradead.org, AJvYcCVu9JIwfPkXamElEDPBEsX2S4Y6QYza4gT/5LjzYaVmZV6ZyCZzHDeXvvY6vQEeFDrN/wlbcDprNUzY8MF0vk3v@lists.infradead.org
X-Gm-Message-State: AOJu0YwPnsJEvnsrplKL/4AMtwZGpAP9jtKdLh1P0BDul9VTmsCEJ71a
	+J/VH3AJsQALT046k6mxK0uUz88bS3djysAaQiNzKCmVWhCcnzEZ
X-Gm-Gg: ASbGncvqTS213JCHhA23YSpUycJYiLulU4AKTjrQv/ybFxG8+wxTtNvX6HxG/H7qJXs
	ZMXD2hjPiilxuRDvu2abAqK25yUo6sIxffpyENDp9OVMAY+4lUgNbKhADHr298hYK2CD7iMETx6
	i/TtgefD4ToYtSf8jSzoKpnrZCaP5jFVzKeFTyRMR9gnljXO2j3kd3DD8otUE2dhp6g8/1bZ/Gr
	eRlSnS4gGsvQ7zuT5KNh0FM4VPJle2ToRRKB8+y5i2QWH8KnE0Z9co6X5/rqdpdo4t7v+Lll1kH
	inevVgWSboqNnW55Kvh+i6mIP/hAlexpHdPAj24JZSH04QAfZX3V83RDAvVT8aP6LQSSyUzO60z
	guTA=
X-Google-Smtp-Source: AGHT+IGc/QGITU1VyyG2bR8BE8zXWKg2nLipJcMYsipV+Ey8nHltBSogWbamh50FAZrr7Q2bpkYmww==
X-Received: by 2002:a17:903:1987:b0:21f:85d0:828 with SMTP id d9443c01a7336-223f1d6cd19mr34190085ad.41.1741161184651;
        Tue, 04 Mar 2025 23:53:04 -0800 (PST)
Received: from localhost (fpd11144dd.ap.nuro.jp. [209.17.68.221])
        by smtp.gmail.com with UTF8SMTPSA id d9443c01a7336-223501fd276sm107054275ad.104.2025.03.04.23.53.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Mar 2025 23:53:04 -0800 (PST)
Date: Wed, 5 Mar 2025 16:53:02 +0900
From: Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>
To: Charles Han <hanchunchao@inspur.com>
Cc: ryder.lee@mediatek.com, jianjun.wang@mediatek.com,
	lpieralisi@kernel.org, manivannan.sadhasivam@linaro.org,
	robh@kernel.org, bhelgaas@google.com, matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com, linux-pci@vger.kernel.org,
	linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] PCI: mediatek-gen3: fix inconsistent indenting warning
Message-ID: <20250305075302.GD847772@rocinante>
References: <20250305070022.4668-1-hanchunchao@inspur.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250305070022.4668-1-hanchunchao@inspur.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250304_235305_545988_B9D720AC 
X-CRM114-Status: UNSURE (   6.32  )
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

Hello,

> Fix below inconsistent indenting smatch warning.
> smatch warnings:
> drivers/pci/controller/pcie-mediatek-gen3.c:922 mtk_pcie_parse_port() warn: inconsistent indenting

Applied to controller/mediatek, thank you!

	Krzysztof

