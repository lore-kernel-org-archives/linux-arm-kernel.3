Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60D41C9830E
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Sep 2026 08:19:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=To3pmZtljGj4X5rJ/mnIJvMelKkwi9aYdQXapoWl02w=; b=W7cC2LbLSxdt5tAPb2YzlZyBlO
	vvbLb3UDE7fn2uXLM1LW597k/CPY2vK7gkh5XmiqoGHS+njZ0+K2QJqGHvCWB9RDbw1SWLoGMRnJJ
	B1YkngtMLdKnW48TXE183FLAL11aFjsUit8rMmoXdRjWUknW3NN77G7/LBvARJCFhlcw3gbvEmeHi
	KfAGaKJoBXI5tpj/B5D8l03uYVtdedPdJSWi4v2+uK3Ngr488gzK0hb9pbfqdTqIQP1o47s7G9VEf
	B17gjKTCUTWCbyOViJwgTFOxKnVvZoqactQ8dI5yfLq4brshf9H0dfz0/ji3zeaPUerQJtjDi/jcl
	8qB9EPnA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9efU-0000000APU5-1g9X;
	Thu, 24 Sep 2026 08:19:00 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9efR-0000000APTJ-3699
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Sep 2026 08:18:59 +0000
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-49e6425f96eso32045e9.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 24 Sep 2026 01:18:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790237936; x=1790842736; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=To3pmZtljGj4X5rJ/mnIJvMelKkwi9aYdQXapoWl02w=;
        b=mrvCLwCghgsJ5RODBJ9p2iL3ASEl/YzdlCe/LU5Yn8zgJFlyKoxMxQWvkBFXSjjQpp
         OoYugr9QBFR8/G9aOXUW7BQrI909zEB9strk0GImXzA/WQQ2wPM6z0OP57j6iahfc13+
         8qkoi9TRzboEXbYBS5oIs2HCUMxmditPEggXp8CIsRcV/dLoME63FNnL0fNDUYK2qQ76
         KYa7ndadrj2sZA5r5dfuf1Ojz+WMhHVwW7+cMsJCM0xJx47gsNk7ESkj5U0eNaLTCnQk
         p9hZ/lB6OG6/GbbtsA5oaxfYUEOU15wsd2GtlsAShArKheZoeprpHZDGuwV5aEkAOAIo
         0XHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790237936; x=1790842736;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=To3pmZtljGj4X5rJ/mnIJvMelKkwi9aYdQXapoWl02w=;
        b=tTRVDhcqw/hTksqkwXDF3cTWNdrg1M7Ag7JHpNrexTGTwzMTwmRvb5fcR9OxNt3s4o
         22AntceoVJVeQLRrm5+9/BXT5xAgixLSQRNDQkQPmkmWVsg3MtFUf//W5sNLPswvM091
         vukXXBD8rY6TGIUUlAqsghPbk0lWTOBOKedWQEeyGZvlDCtgwysZkaPB3WBdaFJv3anW
         WKPAn4cpAzkyQ0seY89Lkg+IN9UA+ggqjPotNW3z9VdkqnW2aZxsiVdQQfuf81i5HKzN
         lFk9z4hmpmDNEu+qQZBSah4aykRBlHrfmyZAj86mxNHPACix2duz2c/yxG/yi2Hr9tR5
         tNAw==
X-Forwarded-Encrypted: i=1; AKwUvBz36enN/scGj0P9UNlWFFQZzUH97ckp7GbRueschlH/wvSjSNBWioa4K0njlmaSo3Sd6XdUIakdWL32A3U6adC1@lists.infradead.org
X-Gm-Message-State: AFuF++lD3wQ5YIKOUEhEo+F/NWAQHH/HL5ZoAYaLXKAszIP6o74JNOmj
	fwNpgJMQBNNdL7ZN9SQhSe51iVRRTHJ/DvJvHy19UpRYxRox5AEQJ3Q1WnAxuoamYA==
X-Gm-Gg: AYBFou1fEhUkkoiCQkYLoHFVNFCzSR/TJUYXIULBpGhGrWv+s9pTIlMDlKtbcG6EizG
	ETXLnTvIoUMkml0B3qUgkxLx9kpLZi8cFxKsyr7UStoQOAGxcXeyLts9b6Khf0HM2ykwZMHX3qP
	WC/AAR+jZjXzkz/KFU2ceXRO+WJHxmJRVlg5sQ4VW7vMlUYP1WLfwbfRZEgoAWUcKxtIGGbu4tH
	ULpP/L99je0SlWznVGz0HlPTjp7TsBDrpfMUv39OWof2H/U/1ief6lPMfk67bBwhieG5276tdeH
	859/nS/swarmsM67s6ITfl7a4c0m65er5qRbmlsCpU9VEDrL4egp8DD/S7FHaJl4CrSsWkMysjM
	wRbP7dmffsdMzlsVomMpyE3VE/IQGg6YsUvoIhbwHYpVzgfF8JNDh+5i55Hxe57u6BdZ1Fory51
	Juj6NH7Zs1nxrHy3eE/ocfyuY9hfr6okxV0PpVVGeHDOQgcyV9KLSMmeWwbYAXIKrO0PgAXQusE
	j6M0WbO28XWmgKKQ5HfRfjCxxe+ChGPkYvSYd1MFA==
X-Received: by 2002:a05:600c:4aaa:b0:49f:ddcf:45b7 with SMTP id 5b1f17b1804b1-49fe5632713mr652925e9.10.1790237935405;
        Thu, 24 Sep 2026 01:18:55 -0700 (PDT)
Received: from google.com (250.192.189.35.bc.googleusercontent.com. [35.189.192.250])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fe5cd42f2sm47160755e9.15.2026.09.24.01.18.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 01:18:54 -0700 (PDT)
Date: Thu, 24 Sep 2026 08:18:50 +0000
From: Mostafa Saleh <smostafa@google.com>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: linux-kernel@vger.kernel.org, iommu@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, will@kernel.org,
	robin.murphy@arm.com, joro@8bytes.org, nicolinc@nvidia.com,
	praan@google.com
Subject: Re: [PATCH 0/7] iommu/arm-smmu-v3: Fixes reported by Sashiko
Message-ID: <arTc6smwFV3G2rSa@google.com>
References: <20260828125409.1921538-1-smostafa@google.com>
 <20260924000344.GA3560397@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260924000344.GA3560397@nvidia.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260924_011857_819509_F52D0997 
X-CRM114-Status: GOOD (  22.58  )
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

On Wed, Sep 23, 2026 at 09:03:44PM -0300, Jason Gunthorpe wrote:
> On Fri, Aug 28, 2026 at 12:53:35PM +0000, Mostafa Saleh wrote:
> > While running sashiko locally on the pKVM SMMUv3 driver patches, it
> > reported some pre-existing issues in the SMMUv3 driver (the RB tree
> > corruption and a missing NULL check) and given that this is not the
> > first time a pre-existing issue appears in the driver from sashiko,
> > I went ahead and passed the whole driver to Sashiko which reported a
> > dozen of other issues(except the last one in this series), I included
> > fixes for bugs I believe are true or worth fixing (others were mostly
> > missing NULL checks or bizarre HW/FW configs I don’t think are needed).
> > 
> > I also sorted the patches based on severity from the most critical to
> > the least, so it is easier to apply a prefix if some bugs are too
> > theoretical
> > 
> > Mostafa Saleh (7):
> >   iommu/arm-smmu-v3: Ensure L2 tables are visible before L1 ptrs
> >   iommu/arm-smmu-v3: Prevent rbtree corruption from duplicate streams
> >   iommu/arm-smmu-v3-iommufd: Fix error path in
> >     arm_vsmmu_cache_invalidate()
> >   iommu/arm-smmu-v3-test: Fix arm_smmu_v3_test_debug_print_used_bits()
> >   iommu/arm-smmu-v3-test: Add missing error checks for inv array
> >   iommu/arm-smmu-v3-test: Fix OOB in arm_smmu_v3_invs_test_verify()
> >   iommu/arm-smmu-v3-test: Fix UBSAN error
> 
> Does this need a respin? At least the 3rd patch there should no go
> as the iommufd tree has a different version of that fix now

Yes, I will respin shortly, I will also drop patch 2 as  Nicolin
posted a new version of his patch.

Thanks,
Mostafa

> 
> Jason

