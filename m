Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76A61C36018
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  1 Apr 2025 12:33:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KzsCJ2IGyxdKIiqjLYd73ZTqGRLCVNxlPOpt9uwfCs8=; b=0h+eYWQvfq7dzMGYWGWOnRjgz5
	EVjygvLcrw7eTeY2zm+6qJo+MW/cfL6J3TmshnpbXblm3orZzEE9FL2s9jTaPmKhS6t3dD1ZSxuGK
	0YUjeoYYrZe9wbdNIsezAlIZpuxjfdzSSu26JcnFY5nbEhdLj1k7ASEB4ZnKGedr1wHcxw4UFRJ7p
	M2JcgcE/YxxzKBEkI+lOvpJ8DcJO/s6tyi8g2cotWHk2qpaXVWZWXufUTP3EbFsVsdqpLDrqVUJQ/
	XL2hcKvUKzlLHDkbvmPyOrEsHrT+vTZOtNoP+xdVMbC7CVpCrhvowHh2nYNubddrut14//y4zlY6K
	CMkV4etA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzao3-00000003HQ8-2vyv;
	Tue, 01 Apr 2025 12:33:27 +0000
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzaIQ-00000002sac-0OAd
	for linux-arm-kernel@lists.infradead.org;
	Tue, 01 Apr 2025 12:00:48 +0000
Received: by mail-ej1-x633.google.com with SMTP id a640c23a62f3a-ac6e8cf9132so967656766b.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 01 Apr 2025 05:00:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1743508843; x=1744113643; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=KzsCJ2IGyxdKIiqjLYd73ZTqGRLCVNxlPOpt9uwfCs8=;
        b=APVQ/zzqqpgGBKxgV08toK245csuwiFA/3zIgZa6Lkd4P9sVXh1HRgShuXj+rPPTwl
         k172kvI7Ye+Lx8UmtQ7id5/F9hVY93P4fMlWSEexOM5gozrShOhfyEzezUwFKhU8rhMS
         vzjVSkYQtfb8u8EtwL0UH9nW0UJAdQtLiTA6Ypb9J7qN7IJd+XqAKbWXlk1bMXq7DaTu
         /3yNS/wFDHVmJm27i8i4vCQZdoKpUC2hD7KJ6mE3DsJA4AsXit+wuTg7igPUIlsC2t07
         i8wCMQxeGnNQtV1LHx26ObVZ+LjYCBLPBrmwXTXwjAo0VP9AJnx4XP8k7A/tu5mjHPqd
         hO3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743508843; x=1744113643;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KzsCJ2IGyxdKIiqjLYd73ZTqGRLCVNxlPOpt9uwfCs8=;
        b=G36rhsN17p7b03+TEN5Ur5pcWw3hx8SwocI68hb/hexn/fiRDYLs3oLrT62tJkejON
         Y01J+8QBHHjch27HIj3FcNEcWhiQrtFfKD5kLM/xDJcWkJRsKP/oamYYyGjZv5G+MC2Z
         0Hic1X/VsMLs6aOU+Vgz11K8trBJ6OHZbYEy0uSMaKw5ruYam6D1RUq20Qe7Asfr1XKz
         BQq5u26LdE0cNmYHOBfFkOJiU9YuRba02OcBU09MxfAxHFxbIdFSx8OQfAK0IMTh9wLm
         EgSa76kcq/K8vNoYkoUPy9ara2B9rMMQ/WJM982Gp+iEbVYROG/8fdFbwN42lhle8+GG
         epOQ==
X-Forwarded-Encrypted: i=1; AJvYcCWhqMyEh+YADkywoaiAUJcqsW7WBI6J8VK1zeojc74bdVxh9I5A5d8wwXEo+qd1waYOquGIJQ5Lfr5GVzjogONu@lists.infradead.org
X-Gm-Message-State: AOJu0YxeB5UTdKxyhfnW08NIkwX5DU1bR61eUqwDJIHQvx1CGLd2UGdL
	K9FoKi/lAYveXWqbGwrG0rJG1WdROfokuJPiL5QKx+mzTXlbZNmsIHI0cAYvHw==
X-Gm-Gg: ASbGncsAoGpPVY8T6/N8JoKOYnU6kRGcFfdYUUvjJUlyvJsTwrh+7ILR0T22LRxCzCC
	peEATP9inPMP/dR1x5YwHvovpHqXjXZVCuPaBpDQVCI6suhk8tnfsnOKNFlrdQZnGFX+RZISsgv
	z2nkxYNgeFOlc0nAd1zD4jYbeOll1pL4ZlyZmx9SJLzQYi2/xNvazpJOS8pVavJsP1BLz66JSDy
	DoMWqF74J7L1y8TQ3f/PUfChq4IFWDELIqz0IvfRoaq1Hj0VQfv9DxMNIAl6agwHZcSqTP9z6PF
	8Z+UMAK2O8VwLjU7xy+1fv3MfGYlwz4zCYxfu2r902TOpNHUQdtKowCiwli8M+I47ZgxdEg4FCN
	DPQI=
X-Google-Smtp-Source: AGHT+IGj2qpmOUX6m4RgNmmkTS5ejyDLKLtEkj+uK3UkSRN7gepeVjiCJ8Ox8oxGWF/rBKjo18fJBw==
X-Received: by 2002:a17:907:d1a:b0:ac3:8aa0:9d70 with SMTP id a640c23a62f3a-ac782e939femr247151766b.51.1743508843143;
        Tue, 01 Apr 2025 05:00:43 -0700 (PDT)
Received: from google.com (140.20.91.34.bc.googleusercontent.com. [34.91.20.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac71922baeasm753744866b.33.2025.04.01.05.00.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Apr 2025 05:00:42 -0700 (PDT)
Date: Tue, 1 Apr 2025 12:00:38 +0000
From: Quentin Perret <qperret@google.com>
To: Sebastian Ene <sebastianene@google.com>
Cc: catalin.marinas@arm.com, joey.gouly@arm.com, maz@kernel.org,
	oliver.upton@linux.dev, snehalreddy@google.com,
	sudeep.holla@arm.com, suzuki.poulose@arm.com, vdonnefort@google.com,
	will@kernel.org, yuzenghui@huawei.com, kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	kernel-team@android.com, Andrei Homescu <ahomescu@google.com>
Subject: Re: [PATCH v4 3/3] KVM: arm64: Release the ownership of the hyp rx
 buffer to Trustzone
Message-ID: <Z-vVZt6RTNX90uEw@google.com>
References: <20250326113901.3308804-1-sebastianene@google.com>
 <20250326113901.3308804-4-sebastianene@google.com>
 <Z-Qv4b0vgVql2yOb@google.com>
 <Z-UcW32Hk6f_cuxc@google.com>
 <Z-aKgXVjp4nNJcLd@google.com>
 <Z-avzxyyOiaIk3-C@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z-avzxyyOiaIk3-C@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250401_050046_213506_D1BAB80E 
X-CRM114-Status: GOOD (  73.22  )
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

On Friday 28 Mar 2025 at 14:18:55 (+0000), Sebastian Ene wrote:
> On Fri, Mar 28, 2025 at 11:39:45AM +0000, Quentin Perret wrote:
> > On Thursday 27 Mar 2025 at 09:37:31 (+0000), Sebastian Ene wrote:
> > > On Wed, Mar 26, 2025 at 04:48:33PM +0000, Quentin Perret wrote:
> > > > On Wednesday 26 Mar 2025 at 11:39:01 (+0000), Sebastian Ene wrote:
> > > > > Introduce the release FF-A call to notify Trustzone that the hypervisor
> > > > > has finished copying the data from the buffer shared with Trustzone to
> > > > > the non-secure partition.
> > > > >
> > > > > Reported-by: Andrei Homescu <ahomescu@google.com>
> > > > > Signed-off-by: Sebastian Ene <sebastianene@google.com>
> > > > > ---
> > > > >  arch/arm64/kvm/hyp/nvhe/ffa.c | 9 ++++++---
> > > > >  1 file changed, 6 insertions(+), 3 deletions(-)
> > > > > 
> > > > > diff --git a/arch/arm64/kvm/hyp/nvhe/ffa.c b/arch/arm64/kvm/hyp/nvhe/ffa.c
> > > > > index 6df6131f1107..ac898ea6274a 100644
> > > > > --- a/arch/arm64/kvm/hyp/nvhe/ffa.c
> > > > > +++ b/arch/arm64/kvm/hyp/nvhe/ffa.c
> > > > > @@ -749,6 +749,7 @@ static void do_ffa_part_get(struct arm_smccc_res *res,
> > > > >  	DECLARE_REG(u32, uuid3, ctxt, 4);
> > > > >  	DECLARE_REG(u32, flags, ctxt, 5);
> > > > >  	u32 count, partition_sz, copy_sz;
> > > > > +	struct arm_smccc_res _res;
> > > > >  
> > > > >  	hyp_spin_lock(&host_buffers.lock);
> > > > >  	if (!host_buffers.rx) {
> > > > > @@ -765,11 +766,11 @@ static void do_ffa_part_get(struct arm_smccc_res *res,
> > > > >  
> > > > >  	count = res->a2;
> > > > >  	if (!count)
> > > > > -		goto out_unlock;
> > > > > +		goto release_rx;
> > > > >  
> > > > >  	if (hyp_ffa_version > FFA_VERSION_1_0) {
> > > > >  		/* Get the number of partitions deployed in the system */
> > > > > -		if (flags & 0x1)
> > > > > +		if (flags & PARTITION_INFO_GET_RETURN_COUNT_ONLY)
> > > > >  			goto out_unlock;
> > > > >  
> > > > >  		partition_sz  = res->a3;
> > > > > @@ -781,10 +782,12 @@ static void do_ffa_part_get(struct arm_smccc_res *res,
> > > > >  	copy_sz = partition_sz * count;
> > > > >  	if (copy_sz > KVM_FFA_MBOX_NR_PAGES * PAGE_SIZE) {
> > > > >  		ffa_to_smccc_res(res, FFA_RET_ABORTED);
> > > > > -		goto out_unlock;
> > > > > +		goto release_rx;
> > > > >  	}
> > > > >  
> > > > >  	memcpy(host_buffers.rx, hyp_buffers.rx, copy_sz);
> > > > > +release_rx:
> > > > > +	ffa_rx_release(&_res);
> > > 
> > > Hi,
> > > 
> > > > 
> > > > I'm a bit confused about this release call here. In the pKVM FF-A proxy
> > > > model, the hypervisor is essentially 'transparent', so do we not expect
> > > > EL1 to issue that instead?
> > > 
> > > I think the EL1 should also issue this call irrespective of what the
> > > hypervisor is doing. Sudeep can correct me here if I am wrong, but this
> > > is my take on this.
> 
> > 
> > Agreed, but with the code as it is implemented in this patch, I think
> > that from the host perspective there is a difference in semantic for
> > the release call. W/o pKVM the buffer is essentially 'locked' until
> > the host issues the release call. With pKVM, the buffer is effectively
> > unlocked immediately upon return from the PARTITION_INFO_GET call
> > because the hypervisor happened to have issued the release call
> > behind our back. And there is no way the host to know the difference.
> 
> I understand your point that you are trying to make the hypervisor
> transparent, but it is not behaving in this way. One example is that we still
> enforce a limit on the size of the ffa_descr_buffer for reclaiming memory.
> Letting this aside, I am curios (maybe on another thread) what do we
> gain by trying to keep the same behaviour w/o pkvm ?

The idea was to avoid as much as possible needing driver-side changes
depending on pKVM being present or not, to allow code re-use as much as
possible.

> > 
> > I understand that we can argue the hypervisor-issued call is for the
> > EL2-TZ buffers while the EL1-issued call is for the EL1-EL2 buffers,
> > but that's not quite working that way since pKVM just blindly forwards
> > the release calls coming from EL1 w/o implementing the expected
> > semantic.
> >
> 
> I think blindly-forwarding the release call is problematic and we should
> prevent this from happening. It is wrong from multipple pov: the host is not
> the owner of the hyp_rx buffer and you are asking TZ to release the
> hypervisor RX buffer by forwarding it. Do you agree on that ? I think
> like this patch should include this.
> 
> > > I am looking at this as a way of signaling the availability of the rx
> > > buffer across partitions. There are some calls that when invoked, they
> > > place the buffer in a 'locked state'.
> > > 
> > > 
> > > > How is EL1 supposed to know that the
> > > > hypervisor has already sent the release call?
> > > 
> > > It doesn't need to know, it issues the call as there is no hypervisor
> > > in-between, why would it need to know ?
> > 
> > As per the comment above, there is a host-visible difference in semantic
> > with or without pKVM which IMO is problematic.
> 
> If we apply what I suggested earlier we won't have an issue with the
> semantic for this call but it would make the code a mess. I don't think
> for this particular call keeping semantics really makes a difference.

Right, if we implemented the release call properly in pKVM I'd be happy
with this patch, but I just don't think we should only do one half. We
either do it properly in pKVM or leave it with to the host -- the latter
feels simpler to me, but no strong opinions.

> 
> > 
> > For example, if the host issues two PARTITION_INFO_GET calls back to
> > back w/o a release call in between, IIUC the expectation from the
> > FF-A spec is for the second one to fail. With this patch applied, the
> > second call would succeed thanks to the implicit release-call issued by
> > pKVM. But it would fail as it is supposed to do w/o pKVM.
> > 
> > I'm not entirely sure if that's gonna cause real-world problem, but it
> > does feel unecessary at best. Are we trying to fix an EL1 bug in the
> > hypervisor here?
> >
> 
> This was most likely observed from an issue from the EL1 driver (by not
> calling release explicitly), it was reported by Andrei Homescu
> <ahomescu@google.com>. it appears that we also have to do something
> in the hyp about it and we agreed with Will and Sudeep in the previous version of
> the patch:
> https://lore.kernel.org/all/20250313121559.GB7356@willie-the-truck/

Thanks for the context. I'm still not convinced issueing the release
call in that way is fully correct, but happy to be corrected on my
understanding of the spec.

Thanks,
Quentin

> > > > And isn't EL1 going to be
> > > > confused if the content of the buffer is overridden before is has issued
> > > > the release call itself?
> > > 
> > > The hypervisor should prevent changes to the buffer mapped between the
> > > host and itself until the release_rx call is issued from the host.
> > > If another call that wants to make use of the rx buffer sneaks in, we
> > > would have to revoke it with BUSY until rx_release is sent.
> > 
> > Right, exactly, but that's not implemented at the moment. IMO it is much
> > simpler to rely on the host to issue the release call and just not do it
> > from the PARTITION_INFO_GET path in pKVM. And if we're scared about a
> > release call racing with PARTITION_INFO_GET at pKVM level, all we should
> > need to do is forward the release call with the host_buffers.lock held I
> > think. Wdyt?
> >
> 
> 
> > Thanks,
> > Quentin

