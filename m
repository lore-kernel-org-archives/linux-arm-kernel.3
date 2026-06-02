Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E62ACD6E4A
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  2 Jun 2026 12:04:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=H266dwNV8LtarXcbHsjzhwha05z9KRlXAu/EZP0ytiQ=; b=Mhd+MDVBzW3BoHLvGz84oULx74
	gsfjjfsOw+Am3C8G5w+3GQ0qOStTj2N+7nsQkMVUgXxAi63U9+YjRa2iueP9gJtKdg2/JfC0beF/8
	Rd1hWLglO8NrDVBf3U+HEypQ05KTAlp4R6ak/9JORwg60KJiDAwiBufgPNqaUoVCUWv3mSLZ8FAQe
	H2nuSx2aOorKP+G65jzm5OUshgTXOUUCx/xyFljMD5kyvI+5NI+GQ/4+JC5FLJvsSMb0Ta7byNgkH
	gsAOMxvBfG+c2ONHshND4MmhohhzzdB7QQFl3DSX+am3qfezD0Sx7c8S+E+Qzjl20RJAAJxS4r0bz
	mQ+CpA5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUNqz-0000000Cw7b-13W8;
	Tue, 02 Jun 2026 12:04:17 +0000
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUNqw-0000000Cw75-2Zuf
	for linux-arm-kernel@lists.infradead.org;
	Tue, 02 Jun 2026 12:04:15 +0000
Received: by mail-pl1-x636.google.com with SMTP id d9443c01a7336-2bf2911f93cso955ad.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 02 Jun 2026 05:04:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1780401854; x=1781006654; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=H266dwNV8LtarXcbHsjzhwha05z9KRlXAu/EZP0ytiQ=;
        b=MmKvXX7Lwt4zuKgB9W/VXJapNy3kx/JHHZ7afHjcf48RmktW6iT3ELfN0EUZX5shRo
         UdjqjB2za4mrdfRVsaQs3XdlZ882nGaeOMns3faFmWLZsVimd5dlBp7ETgQuJ12JbtIm
         jrTi6ZAoDRz92E8om6osuACQFOb+HmqD2RxJKEG48a2Kh0qiEoeDlaMoT0NEfLxntF1u
         yqjGsNatTm4Tds3027S5VnHFP4wBMe5DMfcf12UdZI9VafmUp5LsqzskCRuNmCnsX+2O
         OxwcQKxx9v4b9WuwuIcy5hOYcHKg11oqtFoh/cccJ2mEAym5V9N+KHMia4OrSEZ5HXtZ
         oKjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780401854; x=1781006654;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=H266dwNV8LtarXcbHsjzhwha05z9KRlXAu/EZP0ytiQ=;
        b=e7QzHmzCsTx/RCe1PT5TIqVhSsG5tCr9EN6BiwcaeSs5aBQYwW6Jf2ZuseBv+yyizP
         nLqYtHjnuejculTjseDU5b9G0usnve3ytsU3mVWWYKKL9tC4sP7eE3qReAmpdK/ph+a1
         5V/B3fuKySfeW8Bg687pwIPVMPlm3zRytoulay+0jHlF94LaycYvWlGrH3+jRry3+/Wp
         MjSq8yaPoDdRdGEsVEDgOe85fM8dSCQuljwYpiFDK5RORbU+iaNxw7Q0PHgqo7V+JO+E
         2UHIqiNkrR3hOIbpyQgqt+m/bhrhoV2P9gg14WfvLKIoXrR+oHjG+iOB7xl/5pp0Qfx5
         BmQQ==
X-Forwarded-Encrypted: i=1; AFNElJ9l1+XrG+JqQbBHz+V0sJH8vrIC4M0rPOdGfs0QDGuCYjSKlbxA2gQAnSCtbrQJJ2OM+f/XGuDBG3bsdenfyAKr@lists.infradead.org
X-Gm-Message-State: AOJu0YyB9/XyloiAwT3PiYavTBnovlHDQN5GVhfQ/pqFzuG7VmRBsJY7
	/PpBDOOf9Cv6xUhiPH7fIsbfHy0yJ//wkOEgourSZoWbx0G4qBIgizCeFvNdVv1BfQ==
X-Gm-Gg: Acq92OHSYAk0u6Ngz/gHb/grnW/A1+zxXG/gQKadiUB+6Cvt1tRGuJsDMU/9Odbiu8b
	gSqQKw3te7m/jew5+lmnFFGdF0La8JTLWuuWHho97agP7xtxOdjYGfRmuncYmOAzl8G6T5FNdHl
	Kb4qWA33nxnprtlg3yq43QecnZ23ZAgndJR+Y7nhjbx9OFTA1wDQ04uS7oC5rcKSoWchA/lW+IV
	pOo5GHpLi+yEn3Drtg+ACU6bvNcgHoBpBwQAW1dC/kggWRvKuY7iNuvZOZsHHROydlYRi+SvqLU
	jGhWml1Ubr4a5GCZv/Q4WTGsrXKR2adsDzrucRyDdncfuXvnoCQuECwCGoOe1P1oJU6VL3nw9fX
	XsilIGvdxrtepXzpEOQVl8cp8/5gCpbAi6yqATk1AZMa2HzuhMSUL9x7KyZ26oAErGR46407TV8
	tFlEH/K460aqpjpCeQcb8V2nJ3t3Es0akvK38W/Eh3XRvjmNjhhRpGchsOEjSyidJDvGYJbtI=
X-Received: by 2002:a17:903:2449:b0:2bd:6dad:3dfb with SMTP id d9443c01a7336-2c112c74871mr2048965ad.25.1780401853259;
        Tue, 02 Jun 2026 05:04:13 -0700 (PDT)
Received: from google.com (199.255.142.34.bc.googleusercontent.com. [34.142.255.199])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bf23c0842esm131835235ad.57.2026.06.02.05.04.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Jun 2026 05:04:12 -0700 (PDT)
Date: Tue, 2 Jun 2026 12:04:07 +0000
From: Pranjal Shrivastava <praan@google.com>
To: Nicolin Chen <nicolinc@nvidia.com>
Cc: iommu@lists.linux.dev, Will Deacon <will@kernel.org>,
	Joerg Roedel <joro@8bytes.org>, Robin Murphy <robin.murphy@arm.com>,
	Jason Gunthorpe <jgg@ziepe.ca>, Mostafa Saleh <smostafa@google.com>,
	Daniel Mentz <danielmentz@google.com>,
	Ashish Mhetre <amhetre@nvidia.com>,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v8 00/10] iommu/arm-smmu-v3: Implement Runtime/System
 Sleep ops
Message-ID: <ah7Gt8pZbMbbE45X@google.com>
References: <20260601215909.3958732-1-praan@google.com>
 <ah5yPciJTVTjkMfJ@Asurada-Nvidia>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ah5yPciJTVTjkMfJ@Asurada-Nvidia>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260602_050414_690336_3DBF6745 
X-CRM114-Status: GOOD (  16.96  )
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

On Mon, Jun 01, 2026 at 11:03:41PM -0700, Nicolin Chen wrote:
> On Mon, Jun 01, 2026 at 09:58:57PM +0000, Pranjal Shrivastava wrote:
> > [v8]
> >  - Centralized elision logic: dropped redundant checks from invalidation
> >    call-sites; elision is now authoritative within the CMDQ layer.
> >  - Renamed elision helper to arm_smmu_cmdq_can_elide() and preserved it
> >    only for diagnostic/safety paths (ATC, GERROR, Page Response).
> >  - Consolidated implementation-specific gating and draining into a 
> >    unified quiesce_and_drain_queues callback.
> >  - Updated tegra241-cmdqv to gate virtual queues before draining,
> >    addressing non-deterministic timeouts from guest-side submissions.
> >  - Re-ordered probe sequence to enable pm_runtime only at the end, 
> >    aligning with SMMUv2 and simplifying error paths.
> >  - Refactored KUnit tests for better, addressed Nicolin's comments & added
> >    a multi-threaded kthread race test.
> >  - Refactored RPM helpers to use early-return patterns for improved clarity.
> >  - Collected R-bs from Nicolin.
> 
> FWIW, v8 is still missing a base-commit and Sashiko fails to review:
> https://sashiko.dev/#/patchset/20260601215909.3958732-1-praan%40google.com
> 
> Please make sure v9 patches are formatted with "--base=" and a public
> commit.

Ah :/ that's a shame.. I gave --base=74fa4c177ad0 to format patch which
worked for a different series [1] but not this one for some reason?

I'll ensure to add it in v9.

[1] https://lore.kernel.org/all/20260601134204.2150602-1-praan@google.com/

Thanks,
Praan

