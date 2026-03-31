Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF97410F92E3
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 31 Mar 2026 17:44:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DfoeEFvtZcN/vD2OkIhN1RR2rBv2unDxcoeXhDGEM9o=; b=SLNQVOi+UnQqGX/uF6Y8p+H2z7
	1PunmqwnMC/iU9OHKN6/y2b1d5TRcnYWaFJ0Mr0L/vCar1zmDpLDPxsAsEtaLV5QTqZN4rBkIh98K
	SsIDBz0hH6/9bdEvYVkJ3jPgp/7LAlLS2PFQy02kHf2FliUFZ6pY/pUOT/6iqmdFXrKNeiX0yxk7d
	BMD6Nb8fgoBjN0BKgyIRmXvJM7f6GhqO+YtC21oRBRHPQZLAvd951jz8DYL//OVI7R8NGytloVl0Y
	s9Ok6FzSwvuY5Hf5X7Ubf2SWaBOmFJEjMUhyMMbfGH96eeKVRN0DsPFEeT2Ae1P57uAGzKePfFnES
	SkiQ/LvA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7d8F-0000000DMV8-2xql;
	Tue, 31 Mar 2026 17:44:03 +0000
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7d8C-0000000DMUT-2tQo
	for linux-arm-kernel@lists.infradead.org;
	Tue, 31 Mar 2026 17:44:01 +0000
Received: by mail-pj1-x102c.google.com with SMTP id 98e67ed59e1d1-35d99031e4eso2103499a91.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 31 Mar 2026 10:43:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1774979039; x=1775583839; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=DfoeEFvtZcN/vD2OkIhN1RR2rBv2unDxcoeXhDGEM9o=;
        b=y3EEkHwWPHPe3SohqyVifibsDGftPZyIciEprHNEkgHZqk77W9O9wgVpoTBm736kOl
         spzRf9twWpqk1KAfcumHj1rcUc0z4SRGIxEfZFOHmHgCZxb+GNujUmDf0c/JkwX2D5cg
         KtWCIAeZ5muG5UnSoZCPkKrq2HOYo/1vT5+1PSBqXrkeZiC12mfi6tCmkQZJU791HV28
         dWILwCXM2ZL7WsDwDAzRLRZ0kgjIHqRsBBDIH+zrohXv7Fb96FE/NTcGbQ13YX5aueLP
         10muFIvgi4OAuRB5YoMCcUGinN7rdLFfhTXJiEzdy6OxriMA7eIhlOcRKIAI7jnpSJ8A
         sZXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774979039; x=1775583839;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DfoeEFvtZcN/vD2OkIhN1RR2rBv2unDxcoeXhDGEM9o=;
        b=eLtc+G+vbIyv+zi/SIoWeXFVGDAP3a8LA/kHsZyGA4wDeZgjljHP3XuUtwPm/Df+DF
         edKkF6Ajy5GNuXIDJzkxmQHur+gERzzb9RoOGmU+rkJYKk8UmEhYcbxvfFwudCezDM6I
         W3AuRfeV6xhdRgzn0YQMyCu6+lSOpUOWsJ2dwx6xeGpnSM2akkJE0vkGTGODJyEfABg8
         XPzhgTb5BtTIlYGvS91eT42QZYlcqrC1UYGkGphLwBwNg1T+S6e8A9uEXMDlWkl2SJSq
         LAgd0aFYzbhjkDSqE7Npf4FGqJxSzkRNH2NPSc8q9gkby0T4k2tkjLNdzLWOiBmZ0LtV
         RuTA==
X-Forwarded-Encrypted: i=1; AJvYcCXBqytcP1Ynl3oGay4tVC3uis6FYkqGyXD3ACj+nnWk5/iBI/RsF/RZUW2KuLJWSkFYR27mcq42SOwZVOkcjEWa@lists.infradead.org
X-Gm-Message-State: AOJu0Yy4zIwm2f8YnLP8YhowBB4tdU/7IbMOek7nTlWYi6Rk3kUFPXcc
	0uI0OJm/sQBJAwsHsh18kVc0zJ6lOFIqjTl+Q8+cXibSprB8jUtNupuIex/b66T1KKtVozaCNeA
	d/qUW
X-Gm-Gg: ATEYQzxLSf9Icyg0xycjFVdYDeoV6EDKozLHsNzK12YNWufrRai8lP032ax9tXZNnpJ
	chtgPNh+aJZj5TKXP7AH4/e4tqSiBxcLqKZWUgt2ej+crXjl9FNDkfz8hNGTb/IZBLQpZaA/yqK
	qAGPs+6SE93Abc7X1VjbzWXq/rt/ceBIXSWR3HOiQsgPMoc9/zrZtfLV3mYmxbb78LhtT3gLisk
	Su7Z+NA433NUkZanliTcSNGMF6N8rDzpU37reIwaqBj/UfcFRCgxTeYei9p/YEkER5a99ozOSoa
	3mvBtmJguYfIvJfrVP+C8yt+zyhQzJGCmVSaldWU/R41woDxvmLilx5JNMQ5Lh4dzIRn0AbEy3z
	Gi5nwCm1H5SHD2CWIuRz3U/Xo1RI0a+sOTHyxOZ1l8YiziU1nXsTWmzaP2Io+zHyyZhELFjrTZ4
	mL00kb8GqK981plmVPYIXAZ8zrUg==
X-Received: by 2002:a17:90b:3f8b:b0:35d:a2d3:5c2f with SMTP id 98e67ed59e1d1-35dc701f81amr175346a91.24.1774979039033;
        Tue, 31 Mar 2026 10:43:59 -0700 (PDT)
Received: from p14s ([2604:3d09:148c:c800:3147:ec27:349:39db])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35dbe9377b7sm3173953a91.10.2026.03.31.10.43.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 Mar 2026 10:43:58 -0700 (PDT)
Date: Tue, 31 Mar 2026 11:43:55 -0600
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Suzuki K Poulose <suzuki.poulose@arm.com>
Cc: Steven Price <steven.price@arm.com>, kvm@vger.kernel.org,
	kvmarm@lists.linux.dev, Catalin Marinas <catalin.marinas@arm.com>,
	Marc Zyngier <maz@kernel.org>, Will Deacon <will@kernel.org>,
	James Morse <james.morse@arm.com>,
	Oliver Upton <oliver.upton@linux.dev>,
	Zenghui Yu <yuzenghui@huawei.com>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Joey Gouly <joey.gouly@arm.com>,
	Alexandru Elisei <alexandru.elisei@arm.com>,
	Christoffer Dall <christoffer.dall@arm.com>,
	Fuad Tabba <tabba@google.com>, linux-coco@lists.linux.dev,
	Ganapatrao Kulkarni <gankulkarni@os.amperecomputing.com>,
	Gavin Shan <gshan@redhat.com>,
	Shanker Donthineni <sdonthineni@nvidia.com>,
	Alper Gun <alpergun@google.com>,
	"Aneesh Kumar K . V" <aneesh.kumar@kernel.org>,
	Emi Kisanuki <fj0570is@fujitsu.com>,
	Vishal Annapurve <vannapurve@google.com>
Subject: Re: [PATCH v13 10/48] arm64: RMI: Ensure that the RMM has GPT
 entries for memory
Message-ID: <acwH2_2b7bdOSsOd@p14s>
References: <20260318155413.793430-1-steven.price@arm.com>
 <20260318155413.793430-11-steven.price@arm.com>
 <acrj-cKphy4hJsEG@p14s>
 <152f5070-fda6-4381-bc40-4a70908c27c1@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <152f5070-fda6-4381-bc40-4a70908c27c1@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260331_104400_759377_C24C7703 
X-CRM114-Status: GOOD (  45.02  )
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

On Tue, Mar 31, 2026 at 12:05:47PM +0100, Suzuki K Poulose wrote:
> Hi Mathieu,
> 
> On 30/03/2026 21:58, Mathieu Poirier wrote:
> > Hi,
> > 
> > On Wed, Mar 18, 2026 at 03:53:34PM +0000, Steven Price wrote:
> > > The RMM may not be tracking all the memory of the system at boot. Create
> > > the necessary tracking state and GPTs within the RMM so that all boot
> > > memory can be delegated to the RMM as needed during runtime.
> > > 
> > > Note: support is currently missing for SROs which means that if the RMM
> > > needs memory donating this will fail (and render CCA unusable in Linux).
> > > 
> > > Signed-off-by: Steven Price <steven.price@arm.com>
> > > ---
> > > New patch for v13
> > > ---
> > >   arch/arm64/kvm/rmi.c | 89 ++++++++++++++++++++++++++++++++++++++++++++
> > >   1 file changed, 89 insertions(+)
> > > 
> > > diff --git a/arch/arm64/kvm/rmi.c b/arch/arm64/kvm/rmi.c
> > > index 9590dff9a2c1..80aedc85e94a 100644
> > > --- a/arch/arm64/kvm/rmi.c
> > > +++ b/arch/arm64/kvm/rmi.c
> > > @@ -4,6 +4,7 @@
> > >    */
> > >   #include <linux/kvm_host.h>
> > > +#include <linux/memblock.h>
> > >   #include <asm/kvm_pgtable.h>
> > >   #include <asm/rmi_cmds.h>
> > > @@ -56,6 +57,18 @@ static int rmi_check_version(void)
> > >   	return 0;
> > >   }
> > > +/*
> > > + * These are the 'default' sizes when passing 0 as the tracking_region_size.
> > > + * TODO: Support other granule sizes
> > > + */
> > > +#ifdef CONFIG_PAGE_SIZE_4KB
> > > +#define RMM_GRANULE_TRACKING_SIZE	SZ_1G
> > > +#elif defined(CONFIG_PAGE_SIZE_16KB)
> > > +#define RMM_GRANULE_TRACKING_SIZE	SZ_32M
> > > +#elif defined(CONFIG_PAGE_SIZE_64KB)
> > > +#define RMM_GRANULE_TRACKING_SIZE	SZ_512M
> > > +#endif
> > > +
> > >   static int rmi_configure(void)
> > >   {
> > >   	struct rmm_config *config __free(free_page) = NULL;
> > > @@ -95,6 +108,80 @@ static int rmi_configure(void)
> > >   	return 0;
> > >   }
> > > +static int rmi_verify_memory_tracking(phys_addr_t start, phys_addr_t end)
> > > +{
> > > +	start = ALIGN_DOWN(start, RMM_GRANULE_TRACKING_SIZE);
> > 
> > This will produce an error on systems where the start of system memory is not
> > aligned to RMM_GRANULE_TRACKING_SIZE.  For instance, on QEMU-SBSA the system
> > memory starts at 0x100_4300_0000.  With the above and RMM_GRANULE_TRACKING_SIZE
> > set to SZ_1G, @start becomes 0x100_4000_0000, which falls outside the memory map
> > known to the TF-A.  I fixed it with these modifications:
> 
> Thanks for raising this. This would need to be addressed in the RMM
> spec, I have raised it with the team and will be addressed soon.
> 
> > 
> > LINUX:
> > 
> > diff --git a/arch/arm64/kvm/rmi.c b/arch/arm64/kvm/rmi.c
> > index 10ff1c3bddaf..21bfbbe2f047 100644
> > --- a/arch/arm64/kvm/rmi.c
> > +++ b/arch/arm64/kvm/rmi.c
> > @@ -424,7 +424,9 @@ static int rmi_configure(void)
> >   static int rmi_verify_memory_tracking(phys_addr_t start, phys_addr_t end)
> >   {
> > -       start = ALIGN_DOWN(start, RMM_GRANULE_TRACKING_SIZE);
> > +       phys_addr_t offset;
> > +
> > +       offset = start - ALIGN_DOWN(start, RMM_GRANULE_TRACKING_SIZE);
> >          end = ALIGN(end, RMM_GRANULE_TRACKING_SIZE);
> >          while (start < end) {
> > @@ -439,7 +441,13 @@ static int rmi_verify_memory_tracking(phys_addr_t start, phys_addr_t end)
> >                                  start);
> >                          return -ENODEV;
> >                  }
> > -               start += RMM_GRANULE_TRACKING_SIZE;
> > +
> > +               if (offset) {
> > +                       start += (RMM_GRANULE_TRACKING_SIZE - offset);
> > +                       offset = 0;
> > +               } else {
> > +                       start += RMM_GRANULE_TRACKING_SIZE;
> > +               }
> >          }
> >          return 0;
> > 
> > RMM:
> > 
> > diff --git a/runtime/rmi/granule.c b/runtime/rmi/granule.c
> > index cef521fc0869..60358d9ee81e 100644
> > --- a/runtime/rmi/granule.c
> > +++ b/runtime/rmi/granule.c
> > @@ -209,9 +209,11 @@ void smc_granule_tracking_get(unsigned long addr,
> >                  return;
> >          }
> > +#if 0
> >          if (!ALIGNED(addr, RMM_INTERNAL_TRACKING_REGION_SIZE)) {
> >                  return;
> >          }
> > +#endif
> >          g = find_granule(addr);
> >          if (g != NULL) {
> > 
> > This is likely not the right fix but hopefully provides some guidance.  Send me
> > your patches when you have an idea and I'll test them.
> 
> We will send you the update once it is fixed in the RMM spec. The rough idea
> is to remove the ALIGNMENT restrictions and return a Range that
> the host can iterate over to find "regions" with the same type of
> memory.
>

Ok, thanks for looking into this.
 
> 
> Cheers
> Suzuki
> 
> 
> > 
> > Thanks,
> > Mathieu
> > 
> > 
> > > +	end = ALIGN(end, RMM_GRANULE_TRACKING_SIZE);
> > > +
> > > +	while (start < end) {
> > > +		unsigned long ret, category, state;
> > > +
> > > +		ret = rmi_granule_tracking_get(start, &category, &state);
> > > +		if (ret != RMI_SUCCESS ||
> > > +		    state != RMI_TRACKING_FINE ||
> > > +		    category != RMI_MEM_CATEGORY_CONVENTIONAL) {
> > > +			/* TODO: Set granule tracking in this case */
> > > +			kvm_err("Granule tracking for region isn't fine/conventional: %llx",
> > > +				start);
> > > +			return -ENODEV;
> > > +		}
> > > +		start += RMM_GRANULE_TRACKING_SIZE;
> > > +	}
> > > +
> > > +	return 0;
> > > +}
> > > +
> > > +static unsigned long rmi_l0gpt_size(void)
> > > +{
> > > +	return 1UL << (30 + FIELD_GET(RMI_FEATURE_REGISTER_1_L0GPTSZ,
> > > +				      rmm_feat_reg1));
> > > +}
> > > +
> > > +static int rmi_create_gpts(phys_addr_t start, phys_addr_t end)
> > > +{
> > > +	unsigned long l0gpt_sz = rmi_l0gpt_size();
> > > +
> > > +	start = ALIGN_DOWN(start, l0gpt_sz);
> > > +	end = ALIGN(end, l0gpt_sz);
> > > +
> > > +	while (start < end) {
> > > +		int ret = rmi_gpt_l1_create(start);
> > > +
> > > +		if (ret && ret != RMI_ERROR_GPT) {
> > > +			/*
> > > +			 * FIXME: Handle SRO so that memory can be donated for
> > > +			 * the tables.
> > > +			 */
> > > +			kvm_err("GPT Level1 table missing for %llx\n", start);
> > > +			return -ENOMEM;
> > > +		}
> > > +		start += l0gpt_sz;
> > > +	}
> > > +
> > > +	return 0;
> > > +}
> > > +
> > > +static int rmi_init_metadata(void)
> > > +{
> > > +	phys_addr_t start, end;
> > > +	const struct memblock_region *r;
> > > +
> > > +	for_each_mem_region(r) {
> > > +		int ret;
> > > +
> > > +		start = memblock_region_memory_base_pfn(r) << PAGE_SHIFT;
> > > +		end = memblock_region_memory_end_pfn(r) << PAGE_SHIFT;
> > > +		ret = rmi_verify_memory_tracking(start, end);
> > > +		if (ret)
> > > +			return ret;
> > > +		ret = rmi_create_gpts(start, end);
> > > +		if (ret)
> > > +			return ret;
> > > +	}
> > > +
> > > +	return 0;
> > > +}
> > > +
> > >   static int rmm_check_features(void)
> > >   {
> > >   	if (kvm_lpa2_is_enabled() && !rmi_has_feature(RMI_FEATURE_REGISTER_0_LPA2)) {
> > > @@ -120,6 +207,8 @@ void kvm_init_rmi(void)
> > >   		return;
> > >   	if (rmi_configure())
> > >   		return;
> > > +	if (rmi_init_metadata())
> > > +		return;
> > >   	/* Future patch will enable static branch kvm_rmi_is_available */
> > >   }
> > > -- 
> > > 2.43.0
> > > 
> > > 
> 

