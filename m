Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4A30C9833F
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Sep 2026 11:36:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2virUEPJU+T2t2fxsSozm2l7j+QFgng63b99urpUcvQ=; b=pj5JrdPhOZryfClUJ9Z9mOo7nA
	KWAWF7pWc7Y3QF4pcMlQF4vvzkVVZpN5aGDZUGd1Q5wnQ+E7d3jhRPVgRXodxHHXTKcf0GPXB3Dwy
	oLIWJ6iR6LXWUwZHSECY9BSsjQTeNmC/ptTiYXorU0tlDvhf62tg/ZQj8+5yny1wFBI25w6JCY/Lv
	Lpt1MMJaYTVwhm9VNRVF7cH33gf5nKtgQh2ebgcTU0lZdgtm81BDZ+lgWTemREolRJsdR17FN4NlR
	n0gvOVHt7f9uDWIPlJZo41E+ziUaRcZAySueVVtIINI78WEHyiMdLzcae9/WMhBt7CumGiPACtJI2
	kZ+RpZjw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xB9ed-00000000TiU-1x2T;
	Mon, 28 Sep 2026 11:36:19 +0000
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xB9eZ-00000000Tgu-2bFe
	for linux-arm-kernel@lists.infradead.org;
	Mon, 28 Sep 2026 11:36:17 +0000
Received: by mail-pl1-x62f.google.com with SMTP id d9443c01a7336-2db33db4de9so78445ad.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 28 Sep 2026 04:36:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790595375; x=1791200175; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=2virUEPJU+T2t2fxsSozm2l7j+QFgng63b99urpUcvQ=;
        b=Inxy05/lUkGHoWIUa0/PtbmtG7SX2nXd/kLJXAjBNmLpjg/t6rf7RBLq6JzIFw84zR
         6aWiF7msyz33XSfF0+7ywwQ9zJFte0H6UuZOdfiGJB8ibt8aWjEslFCzXfNG1AehNs0X
         ufVAtVvljpuYtfRtlznox82w9Q8eR3Fa3JvxINwzSPDVe20vcoz/vG7/7CMNTJjCWWts
         mtQKvBfxHCfA6mkNJGMIP5pW/RFqAZmqp4K0Y00OnbiggwjYR7toBqSqbuXYJ9ZJaaob
         HLhuKh7JzZIo58M/RY0PImfQnOQsqZVcW8HRl4M7hxITrxVseDiNY52mOpdJTKFIGStj
         A21g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790595375; x=1791200175;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2virUEPJU+T2t2fxsSozm2l7j+QFgng63b99urpUcvQ=;
        b=NlNmJh8FQqvzocg7Xduptv1LQILaHA9cMssEYnZtL7La7vi4Zuo5zpRCIfNhXnIyGw
         44UJyeyJ97O1Ok69e5kaDdrVoYnZiWuLJb3Z6Z1bgFh2iMRgs/FUnCaFsPpjGwZGdjn4
         kBV8igwj2PkJ4WLhTV0XhwehsAhKlqvHQzNoPCVEXRL2p7jLS51LWozJd//PGXP9KgG8
         sOt3Mzxg2XBkNSvCMC/MvOco58X/sLuiweYPRmn47D3O5pFMe5VcnLiVckgqqrzSCxeH
         lRT+v5c0dWNgm7vEyYtfHd2fal5G7VQztHQmo/zy2yThOqp37swmNkbul+bsxX92jGPD
         CKCw==
X-Forwarded-Encrypted: i=1; AKwUvByjgQSMtkFbvZXp1HODYp5cysIPMxutyefDzFf9RYEpRS5TI6y5TKdSNvAvzsOehTKttC9w6ekk6e89SAUv+4xd@lists.infradead.org
X-Gm-Message-State: AFq9FYK6IAO9zyzojmRkFKqOnlc+ZChlFS/FlObOAdED/QnqOw59qmc8
	+jnRFe1nQlWmA4REXWajq/7haUf+hwaRmnIDpNL1NWd3OvulozeN/kShpFgvG+FFLw==
X-Gm-Gg: AYBFou0kH/5h7BW60sMH7c+fM/gAHBZ5WWRFLyveNbTsdydA+8UhshNoS6Bqv+1L9Cb
	UlQ4aYJvUeqxb0/rWCazdb15yyQt9GDwM0/bKwP8CQ5WnFk6U2SBZkck7F7whxS9pvVst3AxPbB
	rEZNtfgQgbWmmk9T0FiIOQCdTVDia1kuynwbX8z9gJS/iKi+kQHpEf0uq3Z8g26nBLuCzHaIjCI
	J8+yDNFZe/peOmaufB+oRAgZFl4Cm2vsdB6GmlNRz31am4Da5d1Oacrc6WTvZFnO2L40Z6NzO58
	DumpBCQ1z3u7Y5GWUwR0mgsUxIlZXwNpMgHglWvhixK+igZ0TiMpQVYy9X0YL6dE+ZdzcQ4k7gN
	BJqT0xxEd4pGjBlplvdULBP4nppRQm2OfOksckJN9v/fvOQb0ONAxOBANkWUKKEu+x9dVmwtwmb
	aQZqB5uFKdnngAJ0zrrHkq1wTIgMJneI+PyrIAAC8YM+aWOG6AZTMxXWAB7YU8h8pSqxKf0u21G
	UAVvfxY2j8eVCk3P3TIHLVcKrKCdB6B0GiS
X-Received: by 2002:a17:902:fc8e:b0:2df:83ce:7271 with SMTP id d9443c01a7336-2dfa624aac2mr6638095ad.10.1790595374074;
        Mon, 28 Sep 2026 04:36:14 -0700 (PDT)
Received: from google.com (105.211.142.34.bc.googleusercontent.com. [34.142.211.105])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2df9142bafesm39086245ad.51.2026.09.28.04.36.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2026 04:36:13 -0700 (PDT)
Date: Mon, 28 Sep 2026 11:36:05 +0000
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
Subject: Re: [PATCH v7 3/9] iommu/arm-smmu-v3: Move pgsize out of arm_smmu_inv
Message-ID: <arpRJQHAKMKIcX-w@google.com>
References: <0-v7-e84261bbe7cd+2ea80b-smmu_tlbi_jgg@nvidia.com>
 <3-v7-e84261bbe7cd+2ea80b-smmu_tlbi_jgg@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3-v7-e84261bbe7cd+2ea80b-smmu_tlbi_jgg@nvidia.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260928_043616_530478_BE3330B7 
X-CRM114-Status: GOOD (  11.68  )
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

On Mon, Sep 21, 2026 at 08:55:11PM -0300, Jason Gunthorpe wrote:
> pgsize is a constant property of the domain, it is the base translation
> granule of the page table (4k, 16k, 64k) in log2.
> 
> Store it to the struct arm_smmu_domain based on how the page table was
> created.
> 
> Pass it around in the tlbi.
> 
> Reviewed-by: Nicolin Chen <nicolinc@nvidia.com>
> Reviewed-by: Mostafa Saleh <smostafa@google.com>
> Tested-by: Nicolin Chen <nicolinc@nvidia.com>
> Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>

Reviewed-by: Pranjal Shrivastava <praan@google.com>

Thanks,
Praan

