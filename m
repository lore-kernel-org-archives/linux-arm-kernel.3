Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C56BCA5FA1
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Sep 2026 16:39:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=39N4SJ5sD0wjIsHC5a7NtN6vI6BvpcPPu/06LAjzoVM=; b=oHnVAu4U6MC3vVxkC0G7QcIHvb
	khtfr6DIbMCIGtYSTNTUwwcgBLMXQrIR7/h1AMMCqVqrXIVPulSoNHypuS28wQsWzlQf0uD/gTkEs
	Go2yWJBzPsfKVNnVirj37tztmST1oknxbXY36apy4sHqrhhbyynnk0PX5/d8D3OzvSfKw1ZQZdmlZ
	E1K7bYGStu7PHhGd6+TFiZUflxCwXTlALlsOjKtb6zJAHhT+fbBOoOeGigb1TpAOELlVDsG/ctDCy
	LZiTOlmrMJ4NlJk/FNxFsK3pQBkVKsnSQr4pHTq+EPx+lpuGiLVOoRIVBap7y/f0S80sqZPgeAZmX
	P3UIfqlg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBENm-000000013Rg-0tUM;
	Mon, 28 Sep 2026 16:39:14 +0000
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBENj-000000013RD-4C4h
	for linux-arm-kernel@lists.infradead.org;
	Mon, 28 Sep 2026 16:39:13 +0000
Received: by mail-pl1-x62e.google.com with SMTP id d9443c01a7336-2d3b445a84fso35ad.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 28 Sep 2026 09:39:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790613551; x=1791218351; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=39N4SJ5sD0wjIsHC5a7NtN6vI6BvpcPPu/06LAjzoVM=;
        b=hrRQLTkVvUCgUWn9P/0JrTy1OvUrLsxp9DDOhMj6NX6Qy4bj7gXfgV5nEcTaNK7M7+
         cgR/ntahiaZSpDIzv9BMWmz1Tg9Jk7n8egMsYxF7l+b9ppKByaw5tUa/5uCE6RB5LsQf
         YdEUsxAS8bOATNQ+UlQgdF9oIEd9IzBC8v6aNH97lNb0sc2m4RpkXKy13RyC1SRGZ61e
         s1qH/3DtOY4qdaVFdDXFifXe1TjX0KywBt/JdemEpPbi5wVVSYHLBbh3ivudVcern8Ep
         SJ9i3bFP/Xznps3V9CvSEwWMUB3INqtc7CC/s5C7sNiVGHxH9WVrsnOxvTals5OmJ43q
         BzRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790613551; x=1791218351;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=39N4SJ5sD0wjIsHC5a7NtN6vI6BvpcPPu/06LAjzoVM=;
        b=CQuCPKY6wFIWkuP15Wx9dkYGXIRxcaBKxc2rWLfp84sSgRrxAPVEzt425KuoIESL+9
         CFTVB70fId2epZOYKP2X94R/ppQ6gvBnBtwNtVkTMfB+DkNcaocjUSLQpe/+is3p6axw
         puR+6CplLtUcDGO5c0X7AKf0yXEpxLeJr019uOp0inXeW6q4xPwpUyKDxpqHxdN7UZ4q
         4eDSp1BmTMAu52Lrltyui//5lGrnbEhIGg2Jl6+RciP8ykpDF3qxDs/cSp6JBduP/tq0
         RWmI7kiD2WXhKZPTCc4bOMlaA5+KqqF2V6fZjCKGeb86zh4BcyaZLsThxcqOTWkEPoi8
         G8nQ==
X-Forwarded-Encrypted: i=1; AKwUvBxxk1hxQ29baDBHAeReNTdWkbcbNeyITKqUHbROTzcQIsKlRtHEVkTV+RD3+X1tZ3SfMU9f6fcjGr9efm0745wG@lists.infradead.org
X-Gm-Message-State: AFq9FYLOCBrz9nhtAsvc8ypQ2htxOntzjR+tQbsFR4OODjBZkIJNxmPr
	QaB1JtI0E7bGUzfM+WeOMrRQpt2GCPOMC9pE/Xj/g4Hs+wRuITJyDUbXFEQLmdvINg==
X-Gm-Gg: AYBFou3gR8WCa52WhDnxD37f2jVSDnCSqm86/twCN3GipSvx4X0Qzu0NW19KgQVTrVI
	Q01w3v2O7igbs62qKvBUBBbBYFtgiK9nbi8Sc0iy6SARHlQGqubJ3DYlf63V/VXyyIuY6B/8acX
	McITJ/VbuGsdBVhcSHg9hbA5hwl9BIIZ7Cvy3nUyBhO+dSGaa97dwnhoFsHUriEpbzKowPTURSR
	9aC5ct38PFefwxdmUvnt4iAqV0hRuvkUqMHCB18wf+JX2Yw8qGp7H1CG/x4ucFOtBLWMZoTVuKR
	k335p9wr2OznIQhzPqvtniMogS8tqk88B5MPS4KbY0W7gMI8FNKLaO8XtjXPcK+NcHYaAC7l8Cg
	gZGDkdq5wbWDasATr+0oPPElGQWKBz+KzYo7qGwNkGI9tWz/W+Jo+gg3CpQ+d99L30ygDTgZXVF
	Fkwhn1NXqqGWw6eSXcw+FJwlLbyQnVYMVh9OFNzQYXGGlk8UHM82L5SiaBT6oBlnZJIj3B5NT4G
	ibMVgNK+OZX9GhtRzm1ciI7L+zXFMPnOyhXosEiBDB0hUA=
X-Received: by 2002:a17:903:4b0c:b0:2d5:db3d:1a42 with SMTP id d9443c01a7336-2dfa9773f0fmr7086335ad.15.1790613550389;
        Mon, 28 Sep 2026 09:39:10 -0700 (PDT)
Received: from google.com (105.211.142.34.bc.googleusercontent.com. [34.142.211.105])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a498057a62sm330376a91.13.2026.09.28.09.39.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2026 09:39:09 -0700 (PDT)
Date: Mon, 28 Sep 2026 16:39:02 +0000
From: Pranjal Shrivastava <praan@google.com>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	Jonathan Corbet <corbet@lwn.net>, iommu@lists.linux.dev,
	"Joerg Roedel (AMD)" <joro@8bytes.org>,
	Jean-Philippe Brucker <jpb@kernel.org>,
	linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org,
	Mark Rutland <mark.rutland@arm.com>,
	Randy Dunlap <rdunlap@infradead.org>,
	Robin Murphy <robin.murphy@arm.com>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Will Deacon <will@kernel.org>, David Matlack <dmatlack@google.com>,
	Jean-Philippe Brucker <jean-philippe@linaro.org>,
	Jonathan Cameron <Jonathan.Cameron@huawei.com>,
	Nicolin Chen <nicolinc@nvidia.com>,
	Pasha Tatashin <pasha.tatashin@soleen.com>, patches@lists.linux.dev,
	Samiullah Khawaja <skhawaja@google.com>,
	Mostafa Saleh <smostafa@google.com>, stable@vger.kernel.org,
	Vijayanand Jitta <vijayanand.jitta@oss.qualcomm.com>
Subject: Re: [PATCH v7 6/9] iommu/arm-smmu-v3: Precompute the invalidation
 commands
Message-ID: <arqYJgFdbcyAn__v@google.com>
References: <0-v7-e84261bbe7cd+2ea80b-smmu_tlbi_jgg@nvidia.com>
 <6-v7-e84261bbe7cd+2ea80b-smmu_tlbi_jgg@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6-v7-e84261bbe7cd+2ea80b-smmu_tlbi_jgg@nvidia.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260928_093912_040839_A6A40335 
X-CRM114-Status: GOOD (  12.21  )
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

On Mon, Sep 21, 2026 at 08:55:14PM -0300, Jason Gunthorpe wrote:
> Store the required cmd data in the tlbi and just copy it out when
> processing each item in the invs list. The cmd form only depends on if the
> instance supports range invalidation or not, otherwise it is always the
> same.
> 
> This avoids redundant calculations for each invs entry.
> 
> Reviewed-by: Nicolin Chen <nicolinc@nvidia.com>
> Tested-by: Nicolin Chen <nicolinc@nvidia.com>
> Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>

Reviewed-by: Pranjal Shrivastava <praan@google.com>

Thanks,
Praan

