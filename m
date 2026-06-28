Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C54B1C43458
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 28 Jun 2026 23:50:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=w9ASwZXxOhuIEA88U9uqvxx2ThgVPLf9gDKq6x0EUXg=; b=rxP60fBEPy3C33b0Va0FZ5//40
	XvPd5bVzSkEJDXNRIhCSRu2yym0Ok0ny0KS/hcNn3oGeDSHCzHLrEj2cvq4wzRw1Cz2pd4Lh8W9WP
	DEtnwY+krD54KgBbTYu9EwdQajBSK9WQdtEiGiP5GyUa/LqRdAQXUbXcCSd365vAZz7NK/yKtfDLe
	Xsvxt8FSZxa6oMXyn/FybUGFDl4q11zyr2pJrZksBtLBaBtsoowdizaNBJ3uZ5S8rf8yOCoySoqP7
	BAWXKK+emtk5KbZCZ2qx+QsM1aE4J/buliNKjaorkHYw7EOyVsLc0AX75/Onrcy2iK2r8AUfagO23
	6MqxQI9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wdyZt-0000000DUEK-46L7;
	Sun, 28 Jun 2026 23:06:18 +0000
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wdyZs-0000000DUDz-0big
	for linux-arm-kernel@lists.infradead.org;
	Sun, 28 Jun 2026 23:06:17 +0000
Received: by mail-pl1-x62c.google.com with SMTP id d9443c01a7336-2c81db32393so47835ad.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 28 Jun 2026 16:06:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1782687975; x=1783292775; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=w9ASwZXxOhuIEA88U9uqvxx2ThgVPLf9gDKq6x0EUXg=;
        b=iXJd+v8OyWOUUHjH4lfsqqYgzyLJKt8AQIxCSifRwcldppBUkzKYRTH2SWF+ugyvye
         09Myjb7XEFF414sCN912EPv2DCEXkwbiIQXCJyTVRVOczSw9yxWHdqxt44DJMEL/ERdM
         fs/ysFjZf12pkxuyTeH9uc1aUjXSIYJPQNNTGdBizUDOsi47GRoPkpjAfN0hv6dKn+sd
         nqUYvtfKL5gxb1hcbBSJyVqAhvawiqBICbwsCzdub0eform3TZElRMwXxJ0+UbL3vv/J
         y6Uelozb4ZuK2rOTz+kAMSTH1FEbdpb2voEpmSU5oqmlhhiuCfe0wk5TFaPGSIcoeaBi
         gLTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782687975; x=1783292775;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=w9ASwZXxOhuIEA88U9uqvxx2ThgVPLf9gDKq6x0EUXg=;
        b=DxRXxtOeOfeBp1OcT+iSjBW7W+amu3Oamy2rJtbNr+jYeH9V2tE+w1vKZfWRlavw9h
         h3YWc+VaCZShwwgXUSLnsggCoUtaKHc715xb+loyRSNhfwtP4z0mfxbPy5vYefN3+1NT
         2lBmCDSAG/aqADHXrNiTv5JXa8a2PBD1cIZyxnpyON3ChJZupeuVhLOKe0OrVRfm46PR
         bpMWdR7NRzcoVS1YSFAaxGdt7rlk1cr4J7FYEcH9H7bItxKUGGKkO2I6KSo5bmm+tTee
         VeOoI6GMe2TaX4UIl9BQNQgSsTCZOXoxpZ/NNWsgOrjGWE7Y4jYr7uiDhAlga8flOJSS
         5JQA==
X-Forwarded-Encrypted: i=1; AHgh+RrSdNNBMAD1OKSkX02lkyKKu9H8dPpyzHLGQrnr9oGV1t96hXIxMDWEqGsaSQjAtLFzruUkJ/mUBbhwbnKk7J+H@lists.infradead.org
X-Gm-Message-State: AOJu0YzreJURMSBffJuzyDEI7zDNAlwxGmiY0fxm33B/kRDjR5ZgXrmw
	ScJXLECPZQxra3RWK4ZwNFU5VfS59+5xXT5SQQ5joqmV0eTyRlLKGMbSuPUOelPS+w==
X-Gm-Gg: AfdE7ckTD0NkyHzl0pKp9Eb09A0s33hz/6ClKpHqWlsHGJIe3IkcRuRUU4F35tsyXcb
	UkEuYLrLtcyS1ceZcsb8JOg2UsRtU0U+VRIyrrpM0MTlZ7jr1Gx/sSnrzCzIcYj3LuEy3b/2/Qr
	dHbCZlGd9J94rjckpse3lbG2tk+xjru54QsZ4E0k57gA6H3pa42QP6Lr+1zmzodcalAe26142lr
	7ayIg05WJNKhYOogYnVT9I6Pb16VUIGr56VMHr575CXjy6R8a6zRZh88wN7rmxKn/KV3yDpash6
	Opbn/42FtT/p3I0SjLMC4qgdPoDEwDwgnyaYDPl+7ZQfPGmgz6GMlGfjtEq59uMf9NPcISIkeWo
	FvR8PpCM2fsxnaDXD5Mh9STWXlU+zeeNvOOCxd1OYZBvGETevfpUCP/u4Uh6KVixIFfIIDHkqjy
	zkGKAlNwDE6ZgqBiCpI1fqHm+BN+pjqAgfqizimNJd3BYDUazoOU4z8LHDYg==
X-Received: by 2002:a17:902:fd87:b0:2c1:ee6e:be1c with SMTP id d9443c01a7336-2c9a27fbf39mr2722965ad.26.1782687974705;
        Sun, 28 Jun 2026 16:06:14 -0700 (PDT)
Received: from google.com (10.129.124.34.bc.googleusercontent.com. [34.124.129.10])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ca0b454815sm3400655ad.2.2026.06.28.16.06.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Jun 2026 16:06:14 -0700 (PDT)
Date: Sun, 28 Jun 2026 23:06:07 +0000
From: Pranjal Shrivastava <praan@google.com>
To: Nicolin Chen <nicolinc@nvidia.com>
Cc: will@kernel.org, robin.murphy@arm.com, jgg@nvidia.com, joro@8bytes.org,
	kees@kernel.org, baolu.lu@linux.intel.com, kevin.tian@intel.com,
	miko.lenczewski@arm.com, smostafa@google.com,
	linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
	linux-kernel@vger.kernel.org, stable@vger.kernel.org,
	jamien@nvidia.com
Subject: Re: [PATCH rc v6 2/7] iommu/arm-smmu-v3: Implement
 is_attach_deferred() for kdump
Message-ID: <akGo30h_EZCUJCkJ@google.com>
References: <cover.1779265413.git.nicolinc@nvidia.com>
 <89cbd3760a13f11cf63f6ead12f44974511f308a.1779265413.git.nicolinc@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <89cbd3760a13f11cf63f6ead12f44974511f308a.1779265413.git.nicolinc@nvidia.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260628_160616_183215_8E2E5BE6 
X-CRM114-Status: GOOD (  12.00  )
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

On Wed, May 20, 2026 at 10:03:19AM -0700, Nicolin Chen wrote:
> Though the kdump kernel adopts the crashed kernel's stream table, the iommu
> core will still try to attach each probed device to a default domain, which
> overwrites the adopted STE and breaks in-flight DMA from that device.
> 
> Implement an is_attach_deferred() callback to prevent this. For each device
> that has STE.V=1 and STE.Cfg!=Abort in the adopted table, defer the default
> domain attachment, until the device driver explicitly requests it.
> 
> Fixes: b63b3439b856 ("iommu/arm-smmu-v3: Abort all transactions if SMMU is enabled in kdump kernel")
> Cc: stable@vger.kernel.org # v6.12+
> Reviewed-by: Kevin Tian <kevin.tian@intel.com>
> Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>
> Signed-off-by: Nicolin Chen <nicolinc@nvidia.com>

Reviewed-by: Pranjal Shrivastava <praan@google.com>

Thanks,
Praan

