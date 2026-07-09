Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5EA71C43458
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Jul 2026 16:04:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=u7N2Wz8N3g79uBYieYx5umiLmofN8vzB4vLH6EOh0wc=; b=DiUgsBDcroVD6EJulNX+9ZewSI
	LF7NEbsx6Y4rZo485MHdT2BJk1cy4TdSSaucrQLdmcmoxV+lO+w9/mmva9pBG9NvZ+cUhLbkvdqoV
	yWf766+g0m8WkWXx46qSxNi1j5FJURvJE+hAKzY9jnyr3qpAICyprMvDm77oueBZgVivFodSQXeAY
	vCjthfNOC5idplomSDHyUM7eZOpa32SNrfxXU8mHnl6Ttv0JGBj42fM3SB42ixC3yxfxEyfto++j7
	3gW5hb9gUPnVK7rYVqBdZFN5iOd+bDjM5GoIlFy9A0ewoZH+HUHX0o8qAQ84nr6yxyg5gAOTbyLEY
	F2zNlmZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whrF0-00000002zkK-2pVL;
	Thu, 09 Jul 2026 16:04:46 +0000
Received: from mail-ua1-x931.google.com ([2607:f8b0:4864:20::931])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whrEx-00000002zjS-40eV
	for linux-arm-kernel@lists.infradead.org;
	Thu, 09 Jul 2026 16:04:45 +0000
Received: by mail-ua1-x931.google.com with SMTP id a1e0cc1a2514c-9697a691b5fso646032241.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 09 Jul 2026 09:04:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1783613082; x=1784217882; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=u7N2Wz8N3g79uBYieYx5umiLmofN8vzB4vLH6EOh0wc=;
        b=CTD3H1Rfgnn4zLU6tcWpfQ6gJU5V/+0qhFtRq3DqC8D+73c026PfY3SUeDp5MFFKCx
         a5q8XJQ0DlFLWhQvu+8jPheWIMqQ+0nnifAN6mZDJOW4k6yLHou5blLjRdchOXkGCJq8
         8iQWxKDUPQr+3KlUnL7YxqjxqldDFzG7IpoRW/KSUltSqCkGk8VuPZKq4ys7YdRPVu+g
         PK+YRtZX2FpPBOLYGqF+ROyiVydfvc9sO+4+7aru/cik8hpJOYZOTG1siFpvDMgWQcT3
         fCiNfiIf6sKWKjMojhAuEmYeozJk5roWmuxRbCzOMxQCETVhpKJ5nCcDIoR31eutkwIE
         JKZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783613082; x=1784217882;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=u7N2Wz8N3g79uBYieYx5umiLmofN8vzB4vLH6EOh0wc=;
        b=BwCphduBgtf/9h3cwb6GwI7Yu9leWOIDBxNg41DqMbbTQzPSRYU4GsRu0sM6jLWfQs
         yY1SNruqgdnb3EWau1CA9PsEOmN1AqC0pjkONPRuXoUiJvQYhRp0rAwYN7iyZB+UWQG7
         p5hTTXxxH7mbiXWz2CnB1jqYNEohzVDcrA2Hp723a+HUDStcp9+Ull+HHP8k0CMnwlv+
         MFspVRXGOivCJw5NeGmmJpXJlbYtnEUWaVWT3AWSt18WSTymHr8CpWtIV/ZY2aLV3P9e
         4+dg3Cb78wQi7GKhGB245PsmBGQShjVhN6rUiWMWLSxDsereGPXauHy2VgzgG/NyTsjv
         J9tw==
X-Forwarded-Encrypted: i=1; AHgh+RoLzHd/hMpmcfMnmADUkqqmjoYmbxTO5obS9g7DZTX/Pdcpd9fpP6KfF/CEhfm6mtdRwlAukIiGUFlEyKyvSi8B@lists.infradead.org
X-Gm-Message-State: AOJu0Yw0j2OxV0kVpFkBfPzac8rpzS1chujX30tDaYezsSc4C7R9zVNZ
	eJYRzBMlu1b7OsHIdasnN7aV6F9adR/If6LzBTaXt/1wmRL882LaKjC7Tg5ek/5iNOtkkVYTEoD
	xajGs
X-Gm-Gg: AfdE7cmnuqvoeMfUhSZSlsTSnd72EX/Sjsujd7+GHxICVyrDIqFPFd2Re7aFedkHm79
	pDAErTS5E1vscrV6GMqKKvWkn81Qv2svwpLWEo8i0qTFItwerbkYakCBikFGh84NCDt5MUmoThJ
	Z5JjonttWP6z2D0cqVobKRfLitRBCRoYU8iheZYJCqPUAi3SaxY/RGItCJWBXrNT/ku2RboSCF2
	oYExGXfTBSebRnFNqlToDHDFiC3GWeohU9H7VzI5fIwefJjZj3pLgBP8JKbTzPn2UdG7tUHFFQo
	OdcjdWdJIPRjaPuk5L69W0Uf88gsjc/3wXHkaqbLve7zMDDoQBq3V0uMKF9BBlNzi+pdCH4DsFs
	xX3DqIZnxaqVsbu0dvgIvb+lsX0h9GFj8Rp3GAqdWvaCK714IJn+SnUo/34/E
X-Received: by 2002:a05:6102:f9c:b0:737:ba2e:8a29 with SMTP id ada2fe7eead31-744e0306830mr5071060137.27.1783613081904;
        Thu, 09 Jul 2026 09:04:41 -0700 (PDT)
Received: from ziepe.ca ([159.2.72.92])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8ffd7c1d9f6sm20470796d6.23.2026.07.09.09.04.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jul 2026 09:04:41 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1whrEu-000000058g9-24As;
	Thu, 09 Jul 2026 13:04:40 -0300
Date: Thu, 9 Jul 2026 13:04:40 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Robin Murphy <robin.murphy@arm.com>
Cc: will@kernel.org, joro@8bytes.org, jpb@kernel.org,
	catalin.marinas@arm.com, linux-arm-kernel@lists.infradead.org,
	iommu@lists.linux.dev, stable@vger.kernel.org
Subject: Re: [PATCH] iommu/arm-smmu-v3: Add HAFT support for SVA
Message-ID: <20260709160440.GL118978@ziepe.ca>
References: <878cd6bcbbe2d5677d2f63da13294c148268552c.1782927917.git.robin.murphy@arm.com>
 <20260703164914.GY7525@ziepe.ca>
 <6465c885-3a9d-4c0b-ab74-7665e274ae72@arm.com>
 <20260703192459.GB1978949@ziepe.ca>
 <f13b30cf-e885-44c6-8e61-7924937eb8ac@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f13b30cf-e885-44c6-8e61-7924937eb8ac@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260709_090443_993353_847C28C9 
X-CRM114-Status: GOOD (  15.31  )
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

On Mon, Jul 06, 2026 at 03:13:01PM +0100, Robin Murphy wrote:

> Indeed if anyone does want to use SVA on such mismatched hardware and are
> happy to use a custom kernel with CONFIG_ARM64_HAFT disabled then they can
> and will continue to be able to do so.

It seems like we have a chip that is impacted by this. I'm being told
that the necessary ARM IP is not available in time to properly match
SMMU and CPU for its particular application.d

The chip is embedded so those work arounds are possibly OK - but I
think this issue keeps coming up and ARM should have a better overall
solution for CPU/SMMU mismatch in the ecosystem since it seems like
this is going to keep happening..

Even if Linux could automatically limit the CPU features to the SMMU
it would be a big help.

Jason

