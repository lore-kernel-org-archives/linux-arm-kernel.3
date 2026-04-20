Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32B6EF588C3
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Apr 2026 12:40:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9++LeQrcwEH0Gt4SV/wFhWstBdymLBpMFcQFo0yngto=; b=ueyi5pP7rQe4PJy+YBrQS/TeNs
	499QNNcqnhAABk5HU/hj1ZLalOJh2BSRQod+e/SvOvct+ll1K1vTE7NULmXHpwycdA9nBvc/pn0/F
	c4/UnmQW0xLBQcsWjK2qu4JHFju14XKG8lftMfa2KAynJdIyVBNB1d91r2GkPeL9fDSnUEmLBllsK
	a1ZSppu3pt1zs1rhZh7/iv5xmylzxQQBmgKNWXWrvqEZPeXBpd6ybPgCL7JoSbQePkikxRpCHuByi
	9RkKzH1TXmFSRBa0Wci+K7M/ByGbAVI/cUYsIOU83J+/fuZBEF7brw/+O1Cd9zAxrqL/SNm/EIaq+
	xb2ezLVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wEnve-00000006tfy-0Tl7;
	Mon, 20 Apr 2026 12:40:42 +0000
Received: from mail-qk1-x72a.google.com ([2607:f8b0:4864:20::72a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wEnvb-00000006tfc-1c22
	for linux-arm-kernel@lists.infradead.org;
	Mon, 20 Apr 2026 12:40:40 +0000
Received: by mail-qk1-x72a.google.com with SMTP id af79cd13be357-8ec9f099fc6so42427185a.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 20 Apr 2026 05:40:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1776688834; x=1777293634; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=9++LeQrcwEH0Gt4SV/wFhWstBdymLBpMFcQFo0yngto=;
        b=FPK5oDkTsLCSjpvVkOK5maoBqeifNkVY5ahzxMMzh62AnSPUfKh7Fh42eHQtRHlGfb
         sucgnLrG+4xJsfKIsmmlQoz2BSRa+r1wQGzucrMpVfGMUY1ScxoDu0txSrKInNtZaJMv
         Q5TQa/5fQuupyn1LBJYk6Ka4Xq5+NdJ6Hhg4nPd7lqiioVqK+sICz3MXj0q5OaLeEG2f
         q0nW7RGhQASHskeFIeflMB0JCnIUVRGMaazTtH75SjusZfc2HebcacGnh4+NYx1t/Ae7
         podnti4+B+lzzAy+GbRSMOTpVpJYIJuCL12kjJBs/DvS4B9bnnLOAtcBU+qF1Y/la44n
         TJYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776688834; x=1777293634;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9++LeQrcwEH0Gt4SV/wFhWstBdymLBpMFcQFo0yngto=;
        b=rMfAGqvYWyjwJwuElGO/tX/qwa3H7n8Zwra+iadDLxuw/kb65R6A7TcekMWsuFSix6
         PqhFnhrlnEBX1F4/MEkJpZAIrgg53XEzXmhOTtCrUl3tc0kpVQh8He/2Yb275XdTirSN
         Bxdy5PJveU0++kUKAxOmG8+PubaoI8ReUS0n3AzqJfZbt6Vp3KHcaKmkegp+UZgSNfEd
         ZzIhHvsMocYkTmZxMSvxiP8+hlCVSWs1ryIiStFdvf5SWrUViwgcmpSUIHq7KT9ZcTdc
         jeZ9W50XuNJrxBp2dzUN9HC1beEyyVmviW44dGgqKmzcrFfxMk5XWqgokctxoLuUVX+2
         ifcQ==
X-Forwarded-Encrypted: i=1; AFNElJ9GfuUzfgrOQaZKI4gek+c7meqAquWbJWX0lTUZzvf5Uman1VZV9W04D+qY1tzer2fqc5V4QZvSFCnCmVEfqCM3@lists.infradead.org
X-Gm-Message-State: AOJu0YyP5wJ/MPlsX62zYgTgfQ5+pVD7GSm0MpWCTJ3nFHZ2Cp0DQN7s
	azzuPL73FfgkRLyILHA1zmAU588Ein6j2b1vkgClmZu63Ol0XPeTgxkq5uX90UTubEw=
X-Gm-Gg: AeBDiesbjycgXp0gke41C+sEAGRjet/YoGsgkSrO7IuLPvhsZh5f9X8K9BuFfbawVmr
	L9oAjV7kWmEyWFrI+tZcM5eyp44nlqJBvCX7j36LZPAxYz2wIdJe0fnq7gc3JPqFR5NMwVmPSHs
	144/VxoTaJ26Am3NvWhpUjfPEROhmf6JeTNqTh4Zo57abd6MYSnWxFyGWz9rvTMSYgunnRaUODB
	uTtaaj5flB5O4ZKLpwqSkIlrLeayBTWw71CX+9q4GQC6FD8K1cddy+60cYV0rgN2qZuqv6J+gda
	ssrxBoGGrr0Lya7fdOBHA8WemjpQvJKESEYrBat4Gq28akL7z5oGRBlD6pl9Hwae/u1Vw99lVNJ
	03BOUupJsPlFFqV/0ahfJzT9tIcWptCNaHRTdEU/Ah69wy0qX4xMF/QME2iV9N2O6+zYihul2Zj
	jbqMLzQ1krysIXHd+pP+tDU6NbWVzf5P/Cl9yrKxOvsaS4BWTYWKzfNqaxPHKlvF9DM7PBjaFE2
	KfKC3c+zOT02su6
X-Received: by 2002:a05:620a:489b:b0:8cf:d804:4569 with SMTP id af79cd13be357-8e7900157dbmr1922464985a.23.1776688834482;
        Mon, 20 Apr 2026 05:40:34 -0700 (PDT)
Received: from ziepe.ca (crbknf0213w-47-54-130-67.pppoe-dynamic.high-speed.nl.bellaliant.net. [47.54.130.67])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8ed54eb91a0sm52800285a.47.2026.04.20.05.40.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Apr 2026 05:40:33 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1wEnvU-0000000CImY-0bzn;
	Mon, 20 Apr 2026 09:40:32 -0300
Date: Mon, 20 Apr 2026 09:40:32 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Evangelos Petrongonas <epetron@amazon.de>
Cc: Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
	Joerg Roedel <joro@8bytes.org>, Nicolin Chen <nicolinc@nvidia.com>,
	Pranjal Shrivastava <praan@google.com>,
	Lu Baolu <baolu.lu@linux.intel.com>,
	linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
	linux-kernel@vger.kernel.org, nh-open-source@amazon.com,
	Zeev Zilberman <zeev@amazon.com>
Subject: Re: [PATCH] iommu/arm-smmu-v3: Allow disabling Stage 1 translation
Message-ID: <20260420124032.GO2577880@ziepe.ca>
References: <20260420123221.20801-1-epetron@amazon.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260420123221.20801-1-epetron@amazon.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260420_054039_426935_93BDAE8A 
X-CRM114-Status: GOOD (  11.92  )
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

On Mon, Apr 20, 2026 at 12:32:01PM +0000, Evangelos Petrongonas wrote:
> When the hardware advertises both Stage 1 and Stage 2 translation, the
> driver prefers Stage 1 for DMA domain allocation and only falls back to
> Stage 2 if Stage 1 is not supported.
> 
> Some configurations may want to force Stage 2 translation even when the
> hardware supports Stage 1. 

Why? You really need to explain why for a patch like this.

If there really is some HW issue I think it is more appropriate to get
an IORT flag or IDR detection that the HW has a problem.

Jason

