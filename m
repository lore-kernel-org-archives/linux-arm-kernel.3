Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF013C5DF66
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 Aug 2026 12:53:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=U/HO5352xrmxomcN/usyEVXCVrY50VpsMFDwsFMZfKc=; b=RSQw6nz+2GZBfBesE9DHyyyCwi
	DcA6iwY/Q+KjsiRBZBbxGN/igyOdK5QEpLBlebOhDoseohuGAjA+gUIaopTANRhQiOe2C839FLNMz
	pIYg5cEQqqkNcJdGCR17O/YfN5xHHt6Vwk6J/jz2FFfM79GAFHGEsq3x9NAnLT61/FVOfuwYQz2YI
	/s8/5txJGjiUf/Extpp+fCloGMkGFmHExQh0q/nFHoA7/LqfnTdwTrr4Iv+Q0QyfuJkNU9AjjOWyj
	TyXF2no7xhIPxmlwDIb6E3gg6jkK/DCo/BJ9dNUWMaqnTAsgwLuwdUJK39eOyhSJ715pst48PNi80
	60aS8u5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wvwqZ-000000069xa-1pBx;
	Mon, 17 Aug 2026 12:53:47 +0000
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wvwqW-000000069x4-3Njz
	for linux-arm-kernel@lists.infradead.org;
	Mon, 17 Aug 2026 12:53:45 +0000
Received: by mail-pl1-x636.google.com with SMTP id d9443c01a7336-2cede6375caso261825ad.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 17 Aug 2026 05:53:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1786971224; x=1787576024; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=U/HO5352xrmxomcN/usyEVXCVrY50VpsMFDwsFMZfKc=;
        b=aFHTsHToaYo2ZK2RI8jMRVJKeaQth/irWcGxtWgDjobodBpfRUHddZy2nwEkcsx5yh
         MUbK49ONznWi3I3hOfNMapT79JNzncM5taIfGflnILxwdXrLnlfgn2KfJFMAbgPTku+c
         XKK/gom1eyrslYQlFA3sb3YkDoqwNO32pHaZ4F+hB47s4B+3EK7UkJ0lpp2Cy6fU8zqs
         gn6auweJ0+oYIkQfB/AEHr8gSuzMPUM2sGcDlW5BsOjFo8VLt+wc4IAR9ckwlPGU7XDE
         WpevaxLHnHnRD9/ObnK8xaKj3gfbnw2QjdUAWeztLVP0iXFApFjOkgk2A8zHBC09IHHy
         bBfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786971224; x=1787576024;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=U/HO5352xrmxomcN/usyEVXCVrY50VpsMFDwsFMZfKc=;
        b=tKSJ3C29BRyENSdsYrv5clPxrv+rRROI6rfD0ZLT5U6YDMqxVhZ/Sblsi1Fy6Baw/W
         LDOXkCDkQzl20cAmJhJTku/JlmcJUKTCIAry4ZUIZoZ6gPy/OvlrBg0DYrlipCc+624U
         xRGJuIhojWOpHf6qTaWUW0jM0ZoN9NV2UA5qH8UP2dUmep2HMSz/NVwfVLtbcXVYUeEC
         gFLvQtTyPEfTG3xrGGgRCh7uoURX0W2YEseHmluiqMggM3e29M2oRfW08s1RlttaB+kN
         zxsCx8CfAzTQuxKRZ1nnnN9ncVyecE66vKH1OTnz5ALzg92NA3syRN2/BJuKvPqiZ8/F
         Xn/g==
X-Forwarded-Encrypted: i=1; AHgh+RpuC7iSBVPNOiJtVrcyyIutFDb3GYQ7iK3+zzKfdp9Mm0EhG0GHjGaJxxUrk9W3F0vcefRmexz4+adtrEH+NiJJ@lists.infradead.org
X-Gm-Message-State: AOJu0YxpDU8eSVDJAlw4cxfGqWob4w+BBIPvEGhiQxIpKHIvT4XXrmuZ
	uynn5c5jWDX/lFHAaGf6pUWKG6MRJdWcjv4p+UFGpjYl23AfNwUhZWxsh5VPgZyaXw==
X-Gm-Gg: AR+sD11SZHPsJCh/xUt2P8KyXx2qm6BWmcAYrjH9Xqcl0MbPI1UPSERmOqutOJPgG9A
	Fac6UxcZQx69Ih8QPk12DaD1dJ2QHj5IHR8W1KpxUORkXbo4J5+AilC8WPOMQTu6VICjkipXQkp
	Sw1qh+Q4JDYShlsG+CUKj/G4qUTUDrYjqg3Cn/WVqhVzcp2TuS6JHQdfNmP+8RrkBRMKhqsoezE
	RUyNrH9+rk1uSGwkAkXhXTHY3AwrFx0/T0XpLVJKlUWR8SNIySfZt/GElDKHJP4uk9KuhQFZZqG
	/3hGAB4WTm7/ja2S56z1eSfasDjPNV+dY8m1IXJXhPBeGP+l2LYRpUO2lcEsyOZGIXIzymj3wvO
	zE/2/mw95WAFqig8yH0tD37Udo81FD9O7nkGRP8CgCpfTKHCzY6ICAaI00sfoRXeIitpI5MqAN2
	tzZ6iaRdkn2btD6sEGSFCbYRjaJhiOO7LlIB0yQrPq2HLeZmBATM0Yhprntb2mt7JwYXVL0J5A/
	7NmAAMIZyFSTdtVt9yPo08=
X-Received: by 2002:a17:902:d983:b0:2cf:41ba:96b8 with SMTP id d9443c01a7336-2d590bad516mr5207305ad.6.1786971223287;
        Mon, 17 Aug 2026 05:53:43 -0700 (PDT)
Received: from google.com (21.168.124.34.bc.googleusercontent.com. [34.124.168.21])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d5bb499d4bsm5258655ad.4.2026.08.17.05.53.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Aug 2026 05:53:42 -0700 (PDT)
Date: Mon, 17 Aug 2026 12:53:36 +0000
From: Pranjal Shrivastava <praan@google.com>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: Dmitry Malkin <dma@nebius.com>, Will Deacon <will@kernel.org>,
	Robin Murphy <robin.murphy@arm.com>, Joerg Roedel <joro@8bytes.org>,
	Nicolin Chen <nicolinc@nvidia.com>,
	"iommu@lists.linux.dev" <iommu@lists.linux.dev>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"regressions@lists.linux.dev" <regressions@lists.linux.dev>,
	"stable@vger.kernel.org" <stable@vger.kernel.org>,
	NB-Core Team <NB-CoreTeam@nebius.com>
Subject: Re: [RFC PATCH] iommu/arm-smmu-v3: Allow nested attach for PCI
 bridges without vDEVICE
Message-ID: <aoMEUDQKlaWzvE8n@google.com>
References: <PA1P190MB25578C482C8A3B06A4DCC6FDDBDA2@PA1P190MB2557.EURP190.PROD.OUTLOOK.COM>
 <20260814174825.GC510472@nvidia.com>
 <PA1P190MB25573D7CFE42EF7DD2A8CDE8DBDA2@PA1P190MB2557.EURP190.PROD.OUTLOOK.COM>
 <20260814221103.GE510472@nvidia.com>
 <PA1P190MB2557D53CB7FCB70EB8F79D09DBA72@PA1P190MB2557.EURP190.PROD.OUTLOOK.COM>
 <aoLtgeYLpYobpyKN@google.com>
 <20260817114407.GB1175472@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260817114407.GB1175472@nvidia.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260817_055344_846597_36E5B7F2 
X-CRM114-Status: GOOD (  13.15  )
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

On Mon, Aug 17, 2026 at 08:44:07AM -0300, Jason Gunthorpe wrote:
> On Mon, Aug 17, 2026 at 11:16:17AM +0000, Pranjal Shrivastava wrote:
> > But, regarding PCI P2PDMA, you can still enable it with ACS enabled in
> > the upstream kernel *IF* your hardware supports TLP forwarding between
> > root ports.
> > 
> > When ACS is enabled, all TLPs get forwarded to the host's Root Ports
> > instead of getting routed directly through the switch.
> 
> Generally nobody wants to run like that, the performance is
> terrible. The reason these systems have a PCI switch is because of
> performance of the P2P path.

Ack. I was assuming the enablement was the major challenge. For perf we
definitly need to hairpin at the switch. 

> 
> Jason

Thanks,
Praan

