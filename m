Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43D44C83F17
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Jul 2025 12:37:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5JO/Qlx6QEcthLvC0sGmt+qm/PZ0F4XLP2KPhYGX+AQ=; b=Hwot+fN0hnbym3ct17U+ZVnt49
	SaUCVtBoKT0XstLldZcUTuQhmHl0qsOvBvImI65ASKh54IKjRtt++wly47b3fs8u97CrYO56GcVIM
	b32nSA56DblM9isYo/JuA2Bv3fzyDit990j5NDmxykoWxX7n4vzcuLB+NygcLk6rjb0nEox72ja3U
	xWYJLpfZTSt2rUh2BiHeShYKSY1X0JnzfPadLC/AEj2SFkCg1xHjSEoxAggk03otUNxGsdzZmpSku
	gym2iaSXvrd0/dMFxj4c8xtPxVX/fs1yNWlzoNUVVBVo/3EPsyneRtHY9oNgNQrQ3xRLPFcKFWpG6
	1aMajJcQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZqX6-0000000BnbY-0oAW;
	Thu, 10 Jul 2025 12:37:48 +0000
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZp9l-0000000BafI-21pk
	for linux-arm-kernel@lists.infradead.org;
	Thu, 10 Jul 2025 11:09:38 +0000
Received: by mail-pl1-x62b.google.com with SMTP id d9443c01a7336-23dd9ae5aacso132815ad.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 10 Jul 2025 04:09:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1752145777; x=1752750577; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=5JO/Qlx6QEcthLvC0sGmt+qm/PZ0F4XLP2KPhYGX+AQ=;
        b=g5ROUfCtqmH/c3U1zabg+RRn7/3kHwf4363SgshadIbUdxQt60Ma0SeJB3F1g1iMB4
         iOqHPi1AErzA8AreiYOeuqvZppErwn7MYtJNoGH2i52AbTZteDmTbA0U0SKvnUfGbN/s
         DPAARX6+LVZf3qWI7HTjPSKXr1pRhDKhhIwQTJUg1ijci+QudUjKgy81uwz41U6mCG7I
         nLDoZklqGSGw9v5CWJEPZGzfSaYwXTIeK2GTkf8D1iJiZ413WAbqK1/Rfb/a6jYb/tCK
         EL6pkTCaRNw/3nZx+JYHg8nfDbSBt3Q9HBAcY1B2xnZpvez1oHd4Re+CbyUWINaCokRu
         h9og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752145777; x=1752750577;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5JO/Qlx6QEcthLvC0sGmt+qm/PZ0F4XLP2KPhYGX+AQ=;
        b=AoP5/CD7kZMrYV4NMKQ4e/zhzl4ZKo3pPNeCJgJle7Zb1u8O/6XiEbsmQOFtXkpp5d
         X2qIdcnyCIH3mPuX6b3Xze8BdtRVmF06WORNehUMnSi40W/fZISvA8MWkbsDm7zBnanu
         4vuzKWD2rwIRoJr8aJuX+0hiQ+uBe5KXBNAO9mA2/whyUw7eaPxVoRg1+a3PImmsqLEo
         s0/+idh8FIurlIgkK2fp3JVUBWPwcjrTcRyXIVGVmEv3p6pDE9uR58Aw9wCoeaGviH4/
         NHR0ZorGQgXuriGy8QualEc3D2tNpvO8VtlfEFH65+PwTkEim1SJIomXLTrStf5VQhmd
         i5Dw==
X-Forwarded-Encrypted: i=1; AJvYcCVVEPYrOwP0tx+DxNNLg8JPi+/1tVqgmGM2WS4e6y+ITsWNXajfsd5GNS6NDMNOaIckyG9WmHt1qDjNVnzg2r/9@lists.infradead.org
X-Gm-Message-State: AOJu0YwqGOdq1gGg3v0SjglxPARh4yY5Xj8vwYAtJNfWo47VYm7sR5bx
	x0714B9wlW40070BtI1hi9lr+rZfIPTWJef054NJPkM2KZFfSJcEFSJC6kn/I0G2Bg==
X-Gm-Gg: ASbGncssNsF0FXIrgtDMCp1KkwzLVIafHFB/aoYGBNkRj9mEIj4ZYdNjFYiJ/DMLkvq
	TX6E17t9ce53uUXNSyn+aar1BDzFWJL0vzw2V0IZVwke2Y8ADCaKYwikF4wV9Q1Km6xBH5niMex
	Gtftj2AlPNomtUjMf1aJO7eyNBsu6k+8K3XoswgFxUBsSUXp6CwbocA22EH+OxUWHVe+IZXuThE
	BOzGSkfpBpElSgIl8uBiGsKpbXk7/i4J7+vnlwVeX3tuw7iUoN/C5SCg+eeWG8K4Cs0bpo7qQLc
	EyhJo5sSFSmbsEK0hTFUB8z1ucft7IOSSTlGXTkKk0TKO79ysZuBbzcxsZqPylsRKrKZq8gJOOD
	BYw1T1aNKk8po1cUTDLT6
X-Google-Smtp-Source: AGHT+IFn1YIIoN9D12OH+6EFBum3x9hdmg0bQvNt4lFk/nH2gQNwHagVfZTJ5ra5fh+Eufg2l4KArw==
X-Received: by 2002:a17:903:120b:b0:237:e45b:4f45 with SMTP id d9443c01a7336-23de4314a3cmr2237805ad.1.1752145776361;
        Thu, 10 Jul 2025 04:09:36 -0700 (PDT)
Received: from google.com (232.98.126.34.bc.googleusercontent.com. [34.126.98.232])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-31c3007e53fsm4845325a91.19.2025.07.10.04.09.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Jul 2025 04:09:35 -0700 (PDT)
Date: Thu, 10 Jul 2025 11:09:26 +0000
From: Pranjal Shrivastava <praan@google.com>
To: Nicolin Chen <nicolinc@nvidia.com>
Cc: jgg@nvidia.com, kevin.tian@intel.com, corbet@lwn.net,
	bagasdotme@gmail.com, will@kernel.org, robin.murphy@arm.com,
	joro@8bytes.org, thierry.reding@gmail.com, vdumpa@nvidia.com,
	jonathanh@nvidia.com, shuah@kernel.org, jsnitsel@redhat.com,
	nathan@kernel.org, peterz@infradead.org, yi.l.liu@intel.com,
	mshavit@google.com, zhangzekun11@huawei.com, iommu@lists.linux.dev,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-tegra@vger.kernel.org,
	linux-kselftest@vger.kernel.org, patches@lists.linux.dev,
	mochs@nvidia.com, alok.a.tiwari@oracle.com, vasant.hegde@amd.com,
	dwmw2@infradead.org, baolu.lu@linux.intel.com
Subject: Re: [PATCH v9 22/29] iommufd/selftest: Update hw_info coverage for
 an input data_type
Message-ID: <aG-fZv39ci6yip3z@google.com>
References: <cover.1752126748.git.nicolinc@nvidia.com>
 <f01a1e50cd7366f217cbf192ad0b2b79e0eb89f0.1752126748.git.nicolinc@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <f01a1e50cd7366f217cbf192ad0b2b79e0eb89f0.1752126748.git.nicolinc@nvidia.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250710_040937_546710_48E94BFE 
X-CRM114-Status: GOOD (  14.60  )
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

On Wed, Jul 09, 2025 at 10:59:14PM -0700, Nicolin Chen wrote:
> Test both IOMMU_HW_INFO_TYPE_DEFAULT and IOMMU_HW_INFO_TYPE_SELFTEST, and
> add a negative test for an unsupported type.
> 
> Also drop the unused mask in test_cmd_get_hw_capabilities() as checkpatch
> is complaining.
> 
> Signed-off-by: Nicolin Chen <nicolinc@nvidia.com>

Reviewed-by: Pranjal Shrivastava <praan@google.com>

Note: I see a couple of warnings while building the selftests on Jason's
tree, but these seem unrelated to this series:

make -C tools/testing/selftests TARGETS=iommu
make: Entering directory '/usr/local/google/home/praan/master/iommufd/iommufd/tools/testing/selftests'
  CC       iommufd
In file included from iommufd.c:12:
In function ‘_test_ioctl_ioas_map_file’,
    inlined from ‘iommufd_mock_domain_all_aligns’ at iommufd.c:1789:5,
    inlined from ‘wrapper_iommufd_mock_domain_all_aligns’ at iommufd.c:1757:1:
iommufd_utils.h:679:36: warning: ‘mfd’ may be used uninitialized [-Wmaybe-uninitialized]
  679 |         struct iommu_ioas_map_file cmd = {
      |                                    ^~~
iommufd.c: In function ‘wrapper_iommufd_mock_domain_all_aligns’:
iommufd.c:1766:13: note: ‘mfd’ was declared here
 1766 |         int mfd;
      |             ^~~
In function ‘_test_ioctl_ioas_map_file’,
    inlined from ‘iommufd_mock_domain_all_aligns_copy’ at iommufd.c:1843:5,
    inlined from ‘wrapper_iommufd_mock_domain_all_aligns_copy’ at iommufd.c:1809:1:
iommufd_utils.h:679:36: warning: ‘mfd’ may be used uninitialized [-Wmaybe-uninitialized]
  679 |         struct iommu_ioas_map_file cmd = {
      |                                    ^~~
iommufd.c: In function ‘wrapper_iommufd_mock_domain_all_aligns_copy’:
iommufd.c:1818:13: note: ‘mfd’ was declared here
 1818 |         int mfd;
      |             ^~~
In file included from iommufd_utils.h:11:
In function ‘_test_cmd_get_hw_info’,
    inlined from ‘iommufd_ioas_get_hw_info’ at iommufd.c:792:3,
    inlined from ‘wrapper_iommufd_ioas_get_hw_info’ at iommufd.c:752:1:
iommufd_utils.h:812:37: warning: array subscript ‘struct iommu_test_hw_info[0]’ is partly outside array bounds of ‘struct iommu_test_hw_info_buffer_smaller[1]’ [-Warray-bounds=]
  812 |                         assert(!info->flags);
      |                                 ~~~~^~~~~~~
iommufd.c: In function ‘wrapper_iommufd_ioas_get_hw_info’:
iommufd.c:761:11: note: object ‘buffer_smaller’ of size 4
  761 |         } buffer_smaller;
      |           ^~~~~~~~~~~~~~
  CC       iommufd_fail_nth
make: Leaving directory '/usr/local/google/home/praan/master/iommufd/iommufd/tools/testing/selftests'

> ---
>  tools/testing/selftests/iommu/iommufd_utils.h | 33 +++++++++++--------
>  tools/testing/selftests/iommu/iommufd.c       | 32 +++++++++++++-----
>  .../selftests/iommu/iommufd_fail_nth.c        |  4 +--
>  3 files changed, 46 insertions(+), 23 deletions(-)
>

[...]

> -- 
> 2.43.0
> 

Thanks,
Praan

