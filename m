Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97143CD3445
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  9 May 2026 17:04:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=r8mn2kjAcaeBMh+gpou1r3QDxvcT8ZpaHOK5AzbQbeQ=; b=Z6jUxwWep33jr0KpjABJ5QGUfM
	1rMlfZsJbkA/TtYXYlRZyKaCVlmUIEsn68BBq1kLN1AIGXQlVxSiUg4+E0BPydcHu9jg/DGD65QrQ
	oVPROuyOy57mY2T8GORbxnnF5mIde9tLWxkq0JhjXR81o8tChj+nfufmnmKAWLSv5s0gT0aa7lEjf
	ojtUrATlOAbLWcI2sFAFH778k/ZfELhSX2DgASCPK2p+hHQeRMKGqkt3JNIRdwt8jfDxV4Y0qvdyp
	a5mD3bLeWN4F6/0KhCSMLjNvtJs5CoWLZqN2Mmy9k3xCO0ypYSoJoeYx7vIwXGXATxW1sac3d0E7f
	1uuvNIVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wLl5k-00000009J9Q-1zzl;
	Sat, 09 May 2026 17:03:52 +0000
Received: from mail-qv1-xf30.google.com ([2607:f8b0:4864:20::f30])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wLl5h-00000009J8g-0ouV
	for linux-arm-kernel@lists.infradead.org;
	Sat, 09 May 2026 17:03:50 +0000
Received: by mail-qv1-xf30.google.com with SMTP id 6a1803df08f44-8b6c9fdb68cso27290486d6.2
        for <linux-arm-kernel@lists.infradead.org>; Sat, 09 May 2026 10:03:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1778346227; x=1778951027; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=r8mn2kjAcaeBMh+gpou1r3QDxvcT8ZpaHOK5AzbQbeQ=;
        b=iTrXi/FPoam9NgLKv1aMArZA6q2VBUc0A87UdkbAXDrrulc0NBCukTClgdcHpAo2h/
         bDAljxQaSMQyEzxzoqf46qnj65gMw4+FPfwZQek6fBDJIPVmLjQHeTq5ZI0mW2biD30u
         Ds9W8DrndBphFO9cmIS/TOkxJAmuTPLEsVyF0pHwy4KbPq4/gXW03mlFk5jo9glxrd9R
         N0y4kxNeiLkleDdR78gLNQczkyGmqTDzN4AjRi8+zQEVdU2eQNGyC38Zt6K4QK6y3adQ
         deAXFbW0SYDst37qzzGYLKZNSmL0dLw8ITUnOuEgA+/1mPeqeiX+vxrZjJwRH8q4RSx3
         mqgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778346227; x=1778951027;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=r8mn2kjAcaeBMh+gpou1r3QDxvcT8ZpaHOK5AzbQbeQ=;
        b=Na09Kuo8pHiKCDzFyl2Re4MaK/yrLYNYS1YETbu7kGKBKdkfGL4Ao2EsCh+RENRyvS
         +qzKkjnmVbhaXtQfdk6uq11a+YX9sRXyIP3fpm1b1fN1UQDabXnpgJeo051Axkszi+9q
         YPJpf6SCpTQATC1xulvQ0GlZr89GwjSsc53d9GvrQ376dxwv3TrxJcZgRt/AeHjihUL+
         uc9KApgLemtSkh1ZwlQJ1vhgVzZ056zwWCJ8KMdgIARnPuERyOl5LldSIbXTzV+rs7Lc
         labj0+jojvULK56hFyyvVDYDNewJgtqhJD4S/rcXs/pksp7rb9QEyeR+jZbtinPHxoox
         cjCQ==
X-Forwarded-Encrypted: i=1; AFNElJ+Tj9xc/00erfdy5rS3bcy2evG5SYWxaPtvxuk6eKvXPW1W5o8uNwFA+MY18liyYOZ+VUYPnbiCAkOAZKefbopS@lists.infradead.org
X-Gm-Message-State: AOJu0Yz105BvXjzaunDRusJsWmdTDY29ue3MN39zCvNpSEWtjI8q1OPF
	AqE2857aKR8fsoVZLeKU+SPe8i0lz3zCiKIwbGVxRfT/YLLuHCDOXcHeAWLbKsqFeDg=
X-Gm-Gg: Acq92OH8JAXIIgapU9zJuujV1CP5DWxQz4ueeg1ujhIMyzF6I8wQywBQWREyF6MXLgW
	oujXH+YBn78Ohdya9RY4zbkpMbBx71+EUKz/KiDhgQdJQiJy2QSO4cQ/YrBcg4hYAzzttRvPhA9
	doakTUclJabRcTEickah2SHx8btEOMUb0+EGKCzUMs+CGHla3cqrC9Inf/rtlbhTkg4vYH+UL1S
	q+oBt9SBJ3zwFE4HqlWmyWTCOxBplufWXxRDZpUHJyblCHROJZc1PVWC4R3kw/lUmH5e188tKum
	4J60v9kazH83BBbz5/f/AO0EXIHdDMkrWrdOS/J5hNQar4ZvOPHWRnXUTUgVMVYJ6cWZqTLHa6L
	8imV1rDlzLUiTQXEUApwp4yyQq7mAwo1XqfxQoYrKnVoc24mpZtJtuynUKjS7dw1IgJDcdZHWZ4
	rALI5DG+trsVXJ5SiA5VTbtebb+sBDdNGYz4JxttltlsOBuiOzBq/lV5luUDqCf7q0t8n/fHl3T
	mMdew==
X-Received: by 2002:a05:6214:3986:b0:8bc:81:c1db with SMTP id 6a1803df08f44-8bc45e1e978mr276779406d6.43.1778346227366;
        Sat, 09 May 2026 10:03:47 -0700 (PDT)
Received: from ziepe.ca (crbknf0213w-47-54-130-67.pppoe-dynamic.high-speed.nl.bellaliant.net. [47.54.130.67])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8b53c6b8123sm262540686d6.35.2026.05.09.10.03.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 09 May 2026 10:03:46 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1wLl5d-00000001qDf-32X3;
	Sat, 09 May 2026 14:03:45 -0300
Date: Sat, 9 May 2026 14:03:45 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: "Tian, Kevin" <kevin.tian@intel.com>
Cc: Joonwon Kang <joonwonkang@google.com>,
	"will@kernel.org" <will@kernel.org>,
	"robin.murphy@arm.com" <robin.murphy@arm.com>,
	"joro@8bytes.org" <joro@8bytes.org>,
	"jpb@kernel.org" <jpb@kernel.org>,
	"nicolinc@nvidia.com" <nicolinc@nvidia.com>,
	"praan@google.com" <praan@google.com>,
	"kees@kernel.org" <kees@kernel.org>,
	"amhetre@nvidia.com" <amhetre@nvidia.com>,
	"Alexander.Grest@microsoft.com" <Alexander.Grest@microsoft.com>,
	"baolu.lu@linux.intel.com" <baolu.lu@linux.intel.com>,
	"smostafa@google.com" <smostafa@google.com>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"iommu@lists.linux.dev" <iommu@lists.linux.dev>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH RFC] iommu: Enable per-device SSID space for SVA
Message-ID: <20260509170345.GE9285@ziepe.ca>
References: <20260424085339.3503582-1-joonwonkang@google.com>
 <20260424133953.GY3611611@ziepe.ca>
 <BN9PR11MB5276E9D968D3738CCE7125248C3C2@BN9PR11MB5276.namprd11.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <BN9PR11MB5276E9D968D3738CCE7125248C3C2@BN9PR11MB5276.namprd11.prod.outlook.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260509_100349_237499_0D10A9C4 
X-CRM114-Status: GOOD (  11.26  )
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

On Thu, May 07, 2026 at 08:15:21AM +0000, Tian, Kevin wrote:
> if both arch and device support enqcmd-like insn...
> 
> I recalled this was discussed years ago. For devices like this, just
> let driver manage its own pasid space then have a new interface
> e.g. iommu_sva_bind_device_pasid(dev, mm, pasid) to use the
> specified pasid.

Yeah, that makes sense. If the driver knows it doesn't use an ENQCMD
like programming model at all then it can use this API and it should
also avoid programming the MSRs/etc.

Jason

