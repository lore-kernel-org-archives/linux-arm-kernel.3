Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E860EB597B
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Feb 2026 02:25:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:In-Reply-To:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BW+Mgpaq6SwF9hkVhCNywA9aCMpLFaTHrW15uFZTbFY=; b=ZB8yCI0kZxXnlFrnebSNe5RinT
	5SrdhceXxUccvOZpOzToJjD71qCTzDvEnKn2ohbBj2Mun1xkDXJS61OKpUe8BQIKeoLfEgUt0xr3C
	Hneac6B7GRYp8WBynYPaaBQ9lMagWlqpwqxlaRb7p4w8HX50W6+nZoKK4+6QARYJWDSUHYdVkdimN
	czVkEZ9ensveAK6xFqfkuz1vf6vP3Zwa05GbymQlT0MBkH+gVzUqon3iLPcRg1ZgjGF9vHpIJdkxS
	1Lm890lQAHEJNxq8D57/U5rG+3SuQ9K4rddryWQCEGDT1iVhGV7hVcUgN7ZcdH5wHI1UNAvgfupA3
	SfnNFWaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqMOY-00000001JMh-1FpG;
	Thu, 12 Feb 2026 02:25:30 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqMOU-00000001JLs-347U
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Feb 2026 02:25:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1770863125;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=BW+Mgpaq6SwF9hkVhCNywA9aCMpLFaTHrW15uFZTbFY=;
	b=K5DoyXpPysvfVRTPxJtxGLMC8QdvDKiI1awH0JfD+qpxgQI4WUKX04/Y/GpIAP8y+gfu9Z
	6eax6tD1013cF+NsClhFI9taXsZJzAGD0dBLW3Ad3Z3Cxn2sG4oB4NMTVDia5xpLG0dGei
	a/cUcNCrQeNYIcYCLDHkaQd6AvSXjmM=
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com
 [209.85.210.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-649-my0dVWt9NyeRdR8VEIFoeQ-1; Wed, 11 Feb 2026 21:25:23 -0500
X-MC-Unique: my0dVWt9NyeRdR8VEIFoeQ-1
X-Mimecast-MFC-AGG-ID: my0dVWt9NyeRdR8VEIFoeQ_1770863122
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-81d9b88caf2so2596262b3a.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 11 Feb 2026 18:25:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770863122; x=1771467922;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BW+Mgpaq6SwF9hkVhCNywA9aCMpLFaTHrW15uFZTbFY=;
        b=kufhFVksktWNI1UU89FNpb7+4u7SnpsnCPJPWwOVGB4MgF+zhtAkH3Rq6srVhzCgGC
         Lh8cqyzqqKnln++xPXe/NYKe6STto57APXkYt3c5CGAr+OPiekK/uZYrpLO7CkS/Tvyk
         P5ysCnudyqFXsydAhokUju0PdYRwEByk45ipbiXlya9J42AxgMzteREkekcV43IhYwz8
         ApOyYjy+kIxqy6ASo5d2TWSwpoUFxXd5cL5v2Qn0RCy4IOUxKf0t7Ntrt5dm4sk9xgFf
         LRXxw8nmyTcx9HUVbpR6a+vz11al5PG0fjl1BK+NkMDu3s7K5YnuUChkTsTsNaS50GTW
         vi/w==
X-Forwarded-Encrypted: i=1; AJvYcCUsDzlXiM3wK5bh1kkdLUk4vYZl+QPzZgUax3N1NedPxIzoj/vtWePxR3cVJq6qCVj2U6IIoMps46dGB1KM4vLG@lists.infradead.org
X-Gm-Message-State: AOJu0YzY25XZaq5i32YimTJvbZa+sBigJESUTmsmHIfVIaMC+Bp5BIMB
	cdUFvM0LhG03uS9Xdu2XPkKQIXlQbK6VhTELFXPSZ1rK017dleC97j99GM0dfVvHGEu1/7LOKJv
	J1ULTfSxegcYlcU/vLedREvr+JDD26hmkrO8MYjuYDnWkUWdkUg10gzQxq+kY27zXjbSfhvl3p+
	je
X-Gm-Gg: AZuq6aLEHZ6CsVRzz4o9PMj+yLuTv7dxvmm9YLkt1UHHeGdNnZ+ZxwsYjjMo05QkSMa
	ynLmTJ/8w84D4nqR3bi5r7VImY5FsYATi9pzLlJNAoP994c4cveWVkn1McIMjWkUSRgpNx8Agit
	zsPYJaue9M3UbogY5YNGG3zxkIfvxrXu3nhXyHSpWdGmFmnNsosSwi0oNwSFSjfkWR2OhIhJT7q
	JtlM09hvsUyM2UsdXUPba1lmjTJKCK/vrFReboO/qxc8fJ8EuB7Vh0MisBJ37bk2izqwkl2Mqdv
	VO3QNJo0N50sqRXQ8J7Bxyo3cW9ygRQWKp/gbfvFkhgys2RQB7ewl663bD5vRnFK5wawh1doKWT
	3/UG+po+kZH6Y
X-Received: by 2002:a05:6a00:1d84:b0:824:9451:c1ee with SMTP id d2e1a72fcca58-824b3068659mr493733b3a.55.1770863122245;
        Wed, 11 Feb 2026 18:25:22 -0800 (PST)
X-Received: by 2002:a05:6a00:1d84:b0:824:9451:c1ee with SMTP id d2e1a72fcca58-824b3068659mr493667b3a.55.1770863121385;
        Wed, 11 Feb 2026 18:25:21 -0800 (PST)
Received: from localhost ([209.132.188.88])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8249e8198a6sm3984873b3a.50.2026.02.11.18.25.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Feb 2026 18:25:20 -0800 (PST)
Date: Thu, 12 Feb 2026 10:22:10 +0800
From: Coiby Xu <coxu@redhat.com>
To: kernel test robot <lkp@intel.com>
Cc: kexec@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linuxppc-dev@lists.ozlabs.org, devicetree@vger.kernel.org, oe-kbuild-all@lists.linux.dev, 
	Arnaud Lefebvre <arnaud.lefebvre@clever-cloud.com>, Baoquan he <bhe@redhat.com>, Dave Young <dyoung@redhat.com>, 
	Kairui Song <ryncsn@gmail.com>, Pingfan Liu <kernelfans@gmail.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Linux Memory Management List <linux-mm@kvack.org>, 
	Krzysztof Kozlowski <krzk@kernel.org>, Rob Herring <robh@kernel.org>, 
	Thomas Staudt <tstaudt@de.ibm.com>, Sourabh Jain <sourabhjain@linux.ibm.com>, 
	Will Deacon <will@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, 
	Madhavan Srinivasan <maddy@linux.ibm.com>, Michael Ellerman <mpe@ellerman.id.au>, 
	Nicholas Piggin <npiggin@gmail.com>, "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>, 
	Saravana Kannan <saravanak@kernel.org>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 2/2] arm64,ppc64le/kdump: pass dm-crypt keys to kdump
 kernel
Message-ID: <aY05DpHN6QL8xQQ4@Rk>
References: <20260211082401.2407853-3-coxu@redhat.com>
 <202602120648.RgQALnnI-lkp@intel.com>
MIME-Version: 1.0
In-Reply-To: <202602120648.RgQALnnI-lkp@intel.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: C2XyhuevpUqVyMZSS2QkTiFqCpKA2p-zOVtkdlg_RVc_1770863122
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260211_182526_845473_CEE3DBB2 
X-CRM114-Status: GOOD (  15.45  )
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

On Thu, Feb 12, 2026 at 06:35:52AM +0800, kernel test robot wrote:
>Hi Coiby,
>
>kernel test robot noticed the following build errors:
>
>[auto build test ERROR on 2619c62b7ef2f463bcbbb34af122689c09855c23]
>
>url:    https://github.com/intel-lab-lkp/linux/commits/Coiby-Xu/crash_dump-dm-crypt-Don-t-print-in-arch-specific-code/20260211-162729
>base:   2619c62b7ef2f463bcbbb34af122689c09855c23
>patch link:    https://lore.kernel.org/r/20260211082401.2407853-3-coxu%40redhat.com
>patch subject: [PATCH v4 2/2] arm64,ppc64le/kdump: pass dm-crypt keys to kdump kernel
>config: powerpc64-randconfig-r111-20260212 (https://download.01.org/0day-ci/archive/20260212/202602120648.RgQALnnI-lkp@intel.com/config)
>compiler: powerpc64-linux-gcc (GCC) 11.5.0
>reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260212/202602120648.RgQALnnI-lkp@intel.com/reproduce)
>
>If you fix the issue in a separate patch/commit (i.e. not just a new version of
>the same patch/commit), kindly add following tags
>| Reported-by: kernel test robot <lkp@intel.com>
>| Closes: https://lore.kernel.org/oe-kbuild-all/202602120648.RgQALnnI-lkp@intel.com/
>
>All errors (new ones prefixed by >>):
>
>   arch/powerpc/kexec/elf_64.c: In function 'elf64_load':
>>> arch/powerpc/kexec/elf_64.c:82:23: error: implicit declaration of function 'crash_load_dm_crypt_keys' [-Werror=implicit-function-declaration]
>      82 |                 ret = crash_load_dm_crypt_keys(image);
>         |                       ^~~~~~~~~~~~~~~~~~~~~~~~
>   cc1: some warnings being treated as errors

Thanks for reporting this issue. I'll fix this issue in new patch set.

-- 
Best regards,
Coiby


