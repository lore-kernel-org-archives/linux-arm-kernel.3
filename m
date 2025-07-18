Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1521C83F17
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 18 Jul 2025 14:16:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=X2kw8wKIFchN7U6f3WRj7akA9iZyWVrco2+eQsNCM5c=; b=FUBf/hsqAoMx+44GW8yzNxIyLa
	5WANFp16eVb0M3TNLbf84wMu2kqyOyGPYW7qQSh5/fclmFPeVPlpM8eeKe2QBxjUad7VU9Dmd64CD
	uzC2bPNlYiofOe5ac/RZJTWg5pCuoRhoDu957WQ/ZgfE1VzDuzkRt5rwnC3OLbNmbzgU5NIwRKILy
	n8RnuRptI8RVx9f/0Uji7w28Nn1lB6evaHzV9zcwP7EmzDt9JCut7XWOKxlJCVsVDrwCVCIafiykA
	d0t7ARNTcRB+bHqOZbNK6F953wy46sYIvu+niKZSNYdXZr7W0Fgg0MKv2dPliwhegwZ9quMbz9L59
	zGvb65UA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uclt6-0000000Cmm8-3iyV;
	Fri, 18 Jul 2025 14:16:36 +0000
Received: from mail-qt1-x836.google.com ([2607:f8b0:4864:20::836])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uclqe-0000000CmWr-1Tdu
	for linux-arm-kernel@lists.infradead.org;
	Fri, 18 Jul 2025 14:14:05 +0000
Received: by mail-qt1-x836.google.com with SMTP id d75a77b69052e-4ab3802455eso27231601cf.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 18 Jul 2025 07:14:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1752848043; x=1753452843; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=X2kw8wKIFchN7U6f3WRj7akA9iZyWVrco2+eQsNCM5c=;
        b=nSGl2yFgFetw/kkFlBoAcbPLsMdP8P/CcC3pJ1ceN2mrhZI3hJaX3pzNd9NbhSxRRG
         RvIpdPQyzUAVkDldyLhtz5vVGVyz5OV7zGE8lgEYoyO6S32oTbcQf2scLzPcG8mrtrTA
         0dt+97yDQyhwLIQWD1AuqeSbOW8InWsFKWmq1kzLm2Wo/L5/pk44/u/iBd/Q8EZgityW
         92A3MewjZDJq+vhOF3wbh3lf5YzGkKWayNUmkwd/MhmruyaGwiPW1NCRZudUa18pM2/A
         LJC1EwSWRln37FvCkPlJ/4HXLTHhyKY5y+S5Zgk65FTegNs+sgzCV9PpPHZ4g6xsKFKA
         w4ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752848043; x=1753452843;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=X2kw8wKIFchN7U6f3WRj7akA9iZyWVrco2+eQsNCM5c=;
        b=X493M+MTdXV58PJUqElp1FQo/J5VfQFMePh0WdRgBUY3oGBd0k9v33nXVwOM2K+NVC
         1uzbbOAyeI2sx8x2t6BBR2GBUy78tSszLgGOA1AFHwLtfdoYYaN1FH9/Pr33+bpyCeB8
         RkwFQy/4cWyXbGVmGZ9kOG5vPs6chpgDkXh6ZysZmrnKc0/XcqxQbkT47fTuaH2SQMCB
         kzC/vvrtZoiUgGcJ+7tUHmA+RyXN0kiclz+A1B2LlqC6bG3E9gCK5A4PVGWKt7RfCKxL
         tXSY+BaCLx3RdVaYeFHHFgSyNUSSBe7QljhqGXj7KvFsLU6CzpLDETMT/sgd5zDZ2QnC
         URUw==
X-Forwarded-Encrypted: i=1; AJvYcCVn8Yzf1ExrHvqkO5prwWCgT0yXNEZwzUw9E+VmJRSx9Z3xkYMG0PxcOPoJPA2OjGhvt14LbfoEH58Z1zA1hYrD@lists.infradead.org
X-Gm-Message-State: AOJu0Yz0zECWiYhohhTYHKzEyYY0BKuZn661CFmvCPhs/j71Or4I3Kjo
	83J5B7onsvbhRjoMTH0WR06ZsFi61IKJqOZvcc0eK9IVn954cvhsJM/ruzEUBrK+2tU=
X-Gm-Gg: ASbGnctmJUDj/uEonTF/5zVz0mj0pYkZ0u/w4nSu8jw547Y0m5Qcg9W2E53o96GDEII
	O+HuMNZgmrBby0sKP+5ERw4eOXp474gTSRJmxR1w0muXvpnG49Cuhv/iRjfhs0OqNDFywrmlnJp
	ytqEMIWKGkN6xZjbuAMpBWcKcD5EYfGX8VMH6lY76UtVG4z59i3EgLqzoPXtYNiQ01dIbQ1PdHk
	7bh91svBpoa4p+XpLnF+HjfvWKeEeDf6LdmPNmsznSzI4N+Dd9w8CuWgnT59HVWHmmNfWwMy9sG
	y3XHUbAb35STfK13GgGJYPKYfYqIzG3Wm8mLI3L33tpehpodI1YcyTfJPUFS+smCMzgFZJ8T+po
	wPATsQEKK4BkHSM9zxwDIuxB3ElJCyBzphkkVw/dCIs0Bzaq9wc/XUCsxgweYByGahY2ts1zqGw
	==
X-Google-Smtp-Source: AGHT+IFxlNjnByJpGTyiiwdZo9i9Kku+QZgJ0vVJieheNkgXzQ9j9lwkrn0QWQUloNoVgHfjwg2tvg==
X-Received: by 2002:a05:622a:1a10:b0:4ab:95a7:71d5 with SMTP id d75a77b69052e-4aba3e9064amr110581641cf.55.1752848042697;
        Fri, 18 Jul 2025 07:14:02 -0700 (PDT)
Received: from ziepe.ca (hlfxns017vw-142-167-56-70.dhcp-dynamic.fibreop.ns.bellaliant.net. [142.167.56.70])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4abb49a0046sm7659811cf.25.2025.07.18.07.14.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Jul 2025 07:14:01 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1uclqb-00000009zAp-11e0;
	Fri, 18 Jul 2025 11:14:01 -0300
Date: Fri, 18 Jul 2025 11:14:01 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Will Deacon <will@kernel.org>
Cc: Robin Murphy <robin.murphy@arm.com>,
	Benjamin Gaignard <benjamin.gaignard@collabora.com>,
	joro@8bytes.org, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, heiko@sntech.de,
	nicolas.dufresne@collabora.com, iommu@lists.linux.dev,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org, kernel@collabora.com
Subject: Re: [PATCH v6 3/5] iommu: Add verisilicon IOMMU driver
Message-ID: <20250718141401.GD2206214@ziepe.ca>
References: <20250710082450.125585-1-benjamin.gaignard@collabora.com>
 <20250710082450.125585-4-benjamin.gaignard@collabora.com>
 <aHTzPwTob8_5rtBS@willie-the-truck>
 <baa1fcde-f167-4a1b-afca-0a2957a688cc@collabora.com>
 <aHozv0NG1OBlAH6c@willie-the-truck>
 <b4169471-fcd0-4415-8281-c5bd722e5f2b@arm.com>
 <aHpQXy-bnwW56rCn@willie-the-truck>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aHpQXy-bnwW56rCn@willie-the-truck>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250718_071404_390485_D699881A 
X-CRM114-Status: GOOD (  14.14  )
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

On Fri, Jul 18, 2025 at 02:47:11PM +0100, Will Deacon wrote:

> Just because the existing drivers are a mess doesn't mean we should
> proliferate it!

If you want to insist on something here it should be for this driver
to use the new generic page table code I've written.

Otherwise I don't see the point in trying to improve this in some
lesser way.

If this had come in a years time I would probably insist on that, but
right now it isn't merged yet and it will still be a little bit before
people have time to review it.

Perhaps a compromise where Benjamin comes with an iommupt format
header that works for this and we can progress this series and be
ready to swap it out down the road?

Jason

