Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 343EFC36014
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  2 Apr 2025 07:56:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WCENuk9PQu4krAXVW7qdLepJ1A4XFH9uwEadY8jcBM4=; b=U+1EzzEgN6dCFgHXaTvIWVYvwY
	4e4pyXOprV1DcddF5POdANffpWKxPUM02htcOHNs+QXW2Oa2gV/g5w5iMSHGFkDA5FSODyhAoUa9W
	ygI0rDCMKM0OTgtwIdlBBXGYVbJrCAjtvwrBG+wsTLqBK4WKojrirZytlwF+koH6T7pYbtMBwf9ml
	HgBCVswKT9aHq6RMI9qX66Ihci8q5LmukYfCJRLVqaGxFyQkQgvDTmt9PS8iRDbivEVDIZMThZg4a
	7w4Y7bH8q9P6I2KZPRR/t0k/gbyGbyKXQozHQT3+BOz6hehGCLfnLKrRR9AX4nBfx9OauPsy5WpHM
	WwszvBhQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzsxo-00000005S5J-1zFa;
	Wed, 02 Apr 2025 07:56:44 +0000
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzsvW-00000005Rk2-35Rm
	for linux-arm-kernel@lists.infradead.org;
	Wed, 02 Apr 2025 07:54:23 +0000
Received: by mail-pl1-x634.google.com with SMTP id d9443c01a7336-22438c356c8so123798355ad.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 02 Apr 2025 00:54:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743580462; x=1744185262; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=WCENuk9PQu4krAXVW7qdLepJ1A4XFH9uwEadY8jcBM4=;
        b=YuWSE8g0aCkAfqc8+JN7DDYDoi/crvP1Ri1XonXkkGTBHxEc5FNX0YfjJyJoUFhI9o
         PTGyKfPObmCZWLIuORpo/gFQPXpKDANxlSpGv+yjnlevN7NyaxEY8GfIRuZN7r5AuyHD
         mbLKnkzpqiB6j+JfawzUGPwDZWDHq1JYQ+gDZ0lKDaBGDbXnzUTYxWViKLlzE+IxQhLV
         qT0Nfy3frCWG4j+fL2tG1ZdQkLA6Eda1J6iWKD68x8k69L5FV1waFweF9Bdt13pnS9Ag
         68Ji7SohewRkRXv7ANBuw03OdH310OIuMNKb5TNU1LhEsoH7uVlyY0zWu00pJJbkGdDa
         Qlrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743580462; x=1744185262;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=WCENuk9PQu4krAXVW7qdLepJ1A4XFH9uwEadY8jcBM4=;
        b=DoOGsx3JgvlPCalSxhFeF0qEBGe+KSUB7gnyjTLdqaqIMtrngq4Hcj7n1rEwmiQMc6
         VOVdagmkGYwqGK8kucDmXucfz9u1JqMC+zqi3s6jlppwHH7HVrl6kf5YGM358eiOX8PJ
         XnrlrMBwhf1lSTH6dkHRN7eTmiZ6HeLjAd8nQAARvYVXozl0UIa2kCtC7QvLY4Q0CC9l
         QPKCuvDgE0sG1Dacb8Yl8gWt/pLfN305DLqSchNw882R7BKGTaF+vhnFPXN3pMa/IqZt
         MP+Z2+k1vMnyxkgqWCYi6tk/oF6Ls3rgwNnBDR29tFoQKCLWREdiyMdmvij46WFcI8z+
         D2Eg==
X-Forwarded-Encrypted: i=1; AJvYcCW2lXffjBljuJQo9CviHkt0nLLQWTWSX+sg4yeKkA3FvfJKfbeKLfmU4maoGipwsnwW+gN8NWYg6AQ6/cePnGXk@lists.infradead.org
X-Gm-Message-State: AOJu0YwFYnohyWdQcUv4KlXyjIsxFBe19VTEFduh0j5FuwpPRDwhfxTl
	mUrkPSgAl9ixb8eDKFnxTw2Khf6Oj9DqX2IZQq5bF/Gk0HRshIgX75RhnXDhEQ==
X-Gm-Gg: ASbGncvzE0ia1E8sck3JWqXbRuG+eXhWKVZ5MwCy+46m/EMZSameeX4uB83rHhHWXW5
	umIw9qo0xV/fGg9p8cQSp2tAFuzv69u9NzpImWDPc+y10iZVTmBXy/7EeLt3K9+08EMZQI6O6z7
	RB4S1dwAkGGWrOTz0lYCol4V4BLHG0f9kE6ILhOmZNOV/t4X2hICwvjTYNeGZ7G23DSt9mJlH6D
	hssehAncSMtkf7Llh0yB7oqdTkCdSEW8vKEq/2uJ1WZ2eA6b0QyHhVdsEgWDctSuK/VeUcFeFdF
	uc1A/5oMGrUkvLM8vl01OJSxmX/yEYGzQP2BTc+5YfEPof7muMcfC/jh
X-Google-Smtp-Source: AGHT+IGge72TZJH1J2vvYo6DD9BNpDIh2f4O+A+Z8qHrboOP7InJqdVuoFxRjCNjgzZYii4VjHrbsw==
X-Received: by 2002:a17:903:2acc:b0:220:fb23:48df with SMTP id d9443c01a7336-2292f9d682emr277347625ad.36.1743580461725;
        Wed, 02 Apr 2025 00:54:21 -0700 (PDT)
Received: from thinkpad ([120.56.205.103])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2291f1ce127sm101967895ad.108.2025.04.02.00.54.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Apr 2025 00:54:21 -0700 (PDT)
Date: Wed, 2 Apr 2025 13:24:15 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Jensen Huang <jensenhuang@friendlyarm.com>
Cc: Shawn Lin <shawn.lin@rock-chips.com>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>, 
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, 
	Heiko Stuebner <heiko@sntech.de>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Anand Moon <linux.amoon@gmail.com>, Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
	linux-pci@vger.kernel.org, linux-rockchip@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] PCI: rockchip: Fix order of rockchip_pci_core_rsts
Message-ID: <lbar6fn3uhqeyg7apvggor7a4lqy22ozkid47quumuvfv7gz36@bny3kfhxvrq2>
References: <20250328105822.3946767-1-jensenhuang@friendlyarm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250328105822.3946767-1-jensenhuang@friendlyarm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250402_005422_770622_C58656ED 
X-CRM114-Status: GOOD (  12.86  )
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

On Fri, Mar 28, 2025 at 06:58:22PM +0800, Jensen Huang wrote:
> The order of rockchip_pci_core_rsts follows the previous comments suggesting
> to avoid reordering. However, reset_control_bulk_deassert() applies resets in
> reverse, which may lead to the link downgrading to 2.5 GT/s.
> 

Oops! I failed to spot it...

> This patch restores the deassert order and comments for core_rsts, introduced in
> commit 58c6990c5ee7 ("PCI: rockchip: Improve the deassert sequence of four reset pins").
> 
> Tested on NanoPC-T4 with Samsung 970 Pro.
>

Thanks for the fix.

> Fixes: 18715931a5c0 ("PCI: rockchip: Simplify reset control handling by using reset_control_bulk*() function")
> Signed-off-by: Jensen Huang <jensenhuang@friendlyarm.com>

Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

- Mani

-- 
மணிவண்ணன் சதாசிவம்

