Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54E85CA5FA5
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Sep 2026 14:57:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Go9hn601ofYGhTbmTXvodFkeQSZutx3QY5olFYU9dfU=; b=L7Gp1KKbaMh44QJesgPJGUcYKi
	F9Uz18DlT1ByospLGpbR5t6pZw8iwwulaVGB7iKlUly+2FwGbv2qbf8dgAH2yv5zhd+2ckQctbgAI
	t+59vrxpL1OWAHnQ+zJMibkE3yaVaFsirySabVo8n/MRPJMJ5GjGplranjbyFxevcIHwSXlOQeKyo
	PFznmKzXOsQZsR3GGIsg47hzyma9nMwMm5gjFQRXmfYK6yexl2Sew6rYgFzRDq87My4FlYAS9l8Sb
	isnQEddcrNK8WSD/isYlIiKwcPPLxjB9uUvFQgWzeWMLkihGJCYNVNr56bGdp1dnr5X0qrf9zp9fi
	3u1QzY4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBCmy-00000000pru-2DG8;
	Mon, 28 Sep 2026 14:57:08 +0000
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBCmv-00000000pr9-31LG
	for linux-arm-kernel@lists.infradead.org;
	Mon, 28 Sep 2026 14:57:06 +0000
Received: by mail-pl1-x62d.google.com with SMTP id d9443c01a7336-2db33db4de9so92625ad.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 28 Sep 2026 07:57:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790607425; x=1791212225; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Go9hn601ofYGhTbmTXvodFkeQSZutx3QY5olFYU9dfU=;
        b=HZacsRluONOEpnYeLyaq7mD/v+qALnXfgjMKHDQxgdtWWl+HSncTVgUPoNgU9so9eY
         mvg3VvXZbncrWaWkNuX5lLQw7H4ZLNlN3tBinnu1hqlVinJEyAxp9P/FQy5hAi6tICRF
         GRlv40gyjNce+XoLPbC3/RzLVz3sPUSK6ey98RYY6N2TZ7aki8FnId2tJBp2uz+Nv9Ws
         SZLCs55YjsInetP4fB2BCSBrOLHYycQE2BcgrI7sHVOvvxORIrxuZ6FAJNNR5sIFSeUC
         SVk0MjXhz8lznoSd+A950CReq/h82Uf0VmDOBwG0MRk9wEUnIXlqjITB8trK6uUfYzI8
         YzSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790607425; x=1791212225;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Go9hn601ofYGhTbmTXvodFkeQSZutx3QY5olFYU9dfU=;
        b=geMC9Xpz7d/Ro98MRYnztfkWS7X1/vR+QaSoMSMz/6tR8JxebpAwinJB56GnqbbJ9q
         7yGpECK3NcIcDtoJjHHnVn00zB9SFvp7THtR/ZUdbYn8dZwXKmKRKdeQieJrm9TB8kNv
         5XEvbuL5GaCCEHdtJng2Fs32cqcEP3lnd9Ej+3TEPtmWW1NjMa1e5W/PbWZPxEljTGFk
         HshVroCSixH8+4345BJ2FAcxCJCbAIvJ4eHD6guxGmP00YlzlhHx6GCSEPGxbZq8n1JH
         QfhH8qWVDAQ6yfCsmpNuyBltOmFjqnPwuk/ye9QZqzeAgwCBLSQMiN1hGissJiCH2j1Y
         uPUQ==
X-Forwarded-Encrypted: i=1; AKwUvByQ6YbkupWNKQ0xU/XxzscYUD38VETXlDmfQqE0T2M3VZNQkgVqKQNhJpJX9MZE8OxSbfG27el3csGbDHq26KYW@lists.infradead.org
X-Gm-Message-State: AFq9FYJ/FHsVBcJd0B/DtVoDkwFwW4lvfdMHKYLapQeAqS1SNvKAQMAg
	8nl/gKkDTg5/DTpf+7NVtvyuMaS55QMj8F9uCNo8CSLOYofpdWb0O1sK/02azjU6ew==
X-Gm-Gg: AYBFou2z8vpsSAOZTXdpdysYWwJL70rr6kgZql3Q5ObSuqFFOTPXWehLhQ3pONQeyqT
	4BdjslbHCi6RFlCdFbQtqKcXE2L5a4nMQbbz7yj92vS4wDxKTsGBDIhyNCHeh6CRPDpeiufIs4O
	YEdb8ibKy4pSPGDL3Por9iZrZZ3gURPsA5ENqVRPo36NUUoQB0AOKasY/3xka9al1rJ6HP5LZaQ
	e0aslJWCGmtPbmi0xAUmJNdctRLFsIQ7DZJFwOgPqbOhM531fOfz5orJD85HiKM7Q3dA9ZkcUX7
	P3N8+7kp+WfiDaI8HgudJNKeNYTCRku6XoHy+DlShegH6NS+VqW2w7BcZBdAuicbA4S7+u0G+Ll
	CTm9eIqLZ2FUb+tQrrq8xWKVMdg3xxcJuQv2MCNm2EXNcrU0tyRfHIieaJosxU34izq5vvbI/eQ
	G47gsIqwyvHNqUn66qVr2S129kq9RU/mcVl8rJMO2EV6KPgeGjymso5XkYxGoXkc114iwUSwP7U
	sGm+KOQyghw+BO60lpFCM8qm5gqdVitmHPO
X-Received: by 2002:a17:902:d4d2:b0:2df:42af:2f9f with SMTP id d9443c01a7336-2dfa968ef1cmr5442355ad.1.1790607424172;
        Mon, 28 Sep 2026 07:57:04 -0700 (PDT)
Received: from google.com (105.211.142.34.bc.googleusercontent.com. [34.142.211.105])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a0b9feddd0sm7198628a91.2.2026.09.28.07.56.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2026 07:57:03 -0700 (PDT)
Date: Mon, 28 Sep 2026 14:56:54 +0000
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
Subject: Re: [PATCH v7 5/9] iommu/arm-smmu-v3: Keep track in arm_smmu_invs if
 range invalidation is used
Message-ID: <arqANvAwIz6GSXJp@google.com>
References: <0-v7-e84261bbe7cd+2ea80b-smmu_tlbi_jgg@nvidia.com>
 <5-v7-e84261bbe7cd+2ea80b-smmu_tlbi_jgg@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5-v7-e84261bbe7cd+2ea80b-smmu_tlbi_jgg@nvidia.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260928_075705_806783_62FCD530 
X-CRM114-Status: GOOD (  11.37  )
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

On Mon, Sep 21, 2026 at 08:55:13PM -0300, Jason Gunthorpe wrote:
> Summarize if any of the inv entries will use range invalidation and if any
> need ARM_SMMU_OPT_FULL_CONT_RANGE_INV. The next patch will use this to
> avoid range invalidation pre-calculations unless the range commands will
> be used.
> 
> Reviewed-by: Nicolin Chen <nicolinc@nvidia.com>
> Reviewed-by: Mostafa Saleh <smostafa@google.com>
> Tested-by: Nicolin Chen <nicolinc@nvidia.com>
> Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>

Reviewed-by: Pranjal Shrivastava <praan@google.com>

Thanks,
Praan

