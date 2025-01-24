Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DEBA4C02182
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 24 Jan 2025 02:44:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gUr8glPor4PY9LWUaf6Hy93FwZ+OFlyI/oBmRms57JE=; b=VmA10QZLC18DvlWS9COqpvIaUX
	kCG0JSV5lMGdZvrsFbDOv8TovdrQ9Y0/Dk3aB42SLi5VgolLlWQbfAn65qvkrVNSXB/yXVvnKrbmI
	2GoqTPbgsk9XkrHyj/k4IkUzlvjXCvptluf/UpHGiSAIPZNP4GiYEsJB9OIBE9YWMd4JWnM1mUJHO
	aKwknw27Rj+1qbPkpkOetvJmrqCpsMRl7JxVtqKVSoVfWXWNXek9lSDxoYxa8heXtQzawENwAEW30
	By9DBzVs3XdLiol0pVMTXwii4RbkknmU/grsEDownQ8ap6cbfUAwehjV1ZX7Kg9ftVOLMEREUVxDp
	WmtVRh+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tb9gL-0000000DkwU-3Te6;
	Fri, 24 Jan 2025 02:44:29 +0000
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tb9f3-0000000Dkes-0U09
	for linux-arm-kernel@lists.infradead.org;
	Fri, 24 Jan 2025 02:43:10 +0000
Received: by mail-pl1-x62b.google.com with SMTP id d9443c01a7336-21634338cfdso36012405ad.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 23 Jan 2025 18:43:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737686588; x=1738291388; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gUr8glPor4PY9LWUaf6Hy93FwZ+OFlyI/oBmRms57JE=;
        b=fgmC7ktFNUvo2vgbVHaYJUV1X8zyhf7AJTi1fLOWQpPLV7SzYHWNUE3+DrEUkxqXD+
         l3aVjNEyZ15gLFgL7+ctP9DYawpYtfcUc9GWwQKgSJ0JqYYnkBongN5uN2HR6papXl+g
         VJt2I58M2ITFbDpvFrIEo9WxV78m2J4MrYv/F8pA+ov2aPRGy/2Kni5AcuQoc6yUEW7j
         n77AJsg9lT8ntrDFSKm4kFBgJZqxYqWgJKrnGu14NiZlAdLSzpQ7EuzoMaL5s+d8Uqme
         DQDBxdOCwZmIArCHi9/sLElPtp2RwD31x0tkrncGhjUV8s9bckaIUdeOmua9TLQP8IUf
         k7rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737686588; x=1738291388;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gUr8glPor4PY9LWUaf6Hy93FwZ+OFlyI/oBmRms57JE=;
        b=F1wQo8U8IlubdGNuRCdPs+Hy/uFMFNlAfEbefROOU5BmPCN9PFPPQ4CfzGe628ELPE
         0VccariQhFXwszSWmdJhnpmoz3fzLMle3r5JevHQ1sYv1o5ZghxY+xSYkUX1zIHGmZud
         qSBkU8LzSn1ckbYS+WYIy7tBRN/dIMSF4xQmRlhUCriRq46boCIA/5GrP+vlOk5a8i79
         F8LaBKY71c8pHxau7DPQ7XavYqiR9Jea4oJlORyF2BLLc5Gl5ZQieDDeZdzbfldEFxoT
         SKV9gA/stpg03Z7lkn/7ZhFJh8uRB/4R5843/zRUvINGQILoU9eDMZyZ6FI8uddCrn9j
         odaQ==
X-Forwarded-Encrypted: i=1; AJvYcCW1RTXM2vjaQ4NnPhJtPve1tvfFGZ+5VjqnjywUbmE/LOkPRLePTf36vZQvGB7O7nsAPXYHdkKUnIkNUUKZILEm@lists.infradead.org
X-Gm-Message-State: AOJu0YzLMfMSRFNAhaddLfFbDqqTWPzkC5C98vYq4KLM5qILTEKC+1el
	Z44W3LH+2E+9Lj632JG2uZGvJ/68+2/hEP4gskRlcGZxCDbWYOVJ
X-Gm-Gg: ASbGncsGBGG1RfCogjbgq7x41wIK//UWDE40cuYSaWJCp6xe4eC9kq0prHKxLay6vFM
	iCf8BXdBRYxePatFOn5vIMpbgiFmyLdDKGLXRsJ2FpLIxagwFfnBFR575aOKfSkQt2xoVOcN+3r
	hZs2CgukQBQlGGMYJOwYsFy1lhCl03dF/iLnuTs81wevv7AWG5MsMcjZOKrgCfp3NkMhCMktPNx
	2Oiap9snpxYnpNZ2X4GOvTMrCqcxylOu4O/2ueHXsrt0OrJkWYPSaRvChRdsLoF08S/fhKHeu5r
	7LsJXMz8+gtw
X-Google-Smtp-Source: AGHT+IE1TjZAhue2BOZibYjg2nefwmslQC24rfaOQvrKIXArpghvt/uN1d+O/NDrEY+ImyktqYYP7g==
X-Received: by 2002:a17:902:c951:b0:215:b058:28a5 with SMTP id d9443c01a7336-21c355c65a3mr359067945ad.18.1737686588269;
        Thu, 23 Jan 2025 18:43:08 -0800 (PST)
Received: from localhost ([129.146.253.192])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21da41413e4sm5866175ad.158.2025.01.23.18.43.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jan 2025 18:43:07 -0800 (PST)
Date: Fri, 24 Jan 2025 10:42:56 +0800
From: Furong Xu <0x1207@gmail.com>
To: Andrew Lunn <andrew@lunn.ch>
Cc: Brad Griffis <bgriffis@nvidia.com>, Jon Hunter <jonathanh@nvidia.com>,
 netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Alexander Lobakin <aleksander.lobakin@intel.com>, Joe Damato
 <jdamato@fastly.com>, Andrew Lunn <andrew+netdev@lunn.ch>, "David S.
 Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Jakub
 Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Maxime
 Coquelin <mcoquelin.stm32@gmail.com>, xfr@outlook.com,
 "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>
Subject: Re: [PATCH net-next v3 1/4] net: stmmac: Switch to zero-copy in
 non-XDP RX path
Message-ID: <20250124104256.00007d23@gmail.com>
In-Reply-To: <ccbecd2a-7889-4389-977e-10da6a00391c@lunn.ch>
References: <cover.1736910454.git.0x1207@gmail.com>
	<bd7aabf4d9b6696885922ed4bef8fc95142d3004.1736910454.git.0x1207@gmail.com>
	<d465f277-bac7-439f-be1d-9a47dfe2d951@nvidia.com>
	<20250124003501.5fff00bc@orangepi5-plus>
	<e6305e71-5633-48bf-988d-fa2886e16aae@nvidia.com>
	<ccbecd2a-7889-4389-977e-10da6a00391c@lunn.ch>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.42; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250123_184309_161261_C87E6238 
X-CRM114-Status: GOOD (  17.26  )
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

On Thu, 23 Jan 2025 22:48:42 +0100, Andrew Lunn <andrew@lunn.ch> wrote:

> > Just to clarify, the patch that you had us try was not intended as an actual
> > fix, correct? It was only for diagnostic purposes, i.e. to see if there is
> > some kind of cache coherence issue, which seems to be the case?  So perhaps
> > the only fix needed is to add dma-coherent to our device tree?  
> 
> That sounds quite error prone. How many other DT blobs are missing the
> property? If the memory should be coherent, i would expect the driver
> to allocate coherent memory. Or the driver needs to handle
> non-coherent memory and add the necessary flush/invalidates etc.

stmmac driver does the necessary cache flush/invalidates to maintain cache lines
explicitly.

See dma_sync_single_for_cpu():
https://git.kernel.org/pub/scm/linux/kernel/git/netdev/net-next.git/tree/include/linux/dma-mapping.h#n297

dma_dev_need_sync() is supposed to return false for Tegra234, since the ethernet
controller on Tegra234 is dma coherent by SoC design as Brad said their
downstream device tree has dma-coherent turned on by default, and after add
dma-coherent to mainline ethernet node, stmmac driver works fine.
But dma-coherent property is missing in mainline Tegra234 ethernet device tree
node, dma_dev_need_sync() returns true and this is not the expected behavior.

The dma-coherent property in device tree node is SoC specific, so only the
vendors know if their stmmac ethernet controller is dma coherent and
whether their device tree are missing the critical dma-coherent property.

