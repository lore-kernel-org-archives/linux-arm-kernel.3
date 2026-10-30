Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF440606A325
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 30 Oct 2026 14:16:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=qAOtqeUx;
	dkim=pass (1024-bit key, unprotected) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=dutMwEYA
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=U3mh0uWcEKmF6rz6g3nv0SX0Dkn3wPP6PAyrpn5THiI=; b=qAOtqeUxVGtaUf
	pWHKolpgwr8Ty8SpEYfWh/Kq3V2cSFzYCzLBcTuXqV3Wibt0I7O3Xq8lrWGSurKlJ2pl5ZY/FAv4j
	TlIwUxxKqIA0h2YNfz5x/QOLLasLNB8uR+ivYCu7MllDd5wTAps3kWc1pIvHJG3fKQhaXQNwxLtYK
	F/uQp7fVq8alI28A8UlnnyFyYxhqNZl7xaxDzuy0tUBemG1x8OYWHUEHLaxtPpLMWTtbsSzUtHdXv
	VJ7HyaAAbETmNbrXbcj3qYopnrJPbzcDBTM83ZsIVGlv4Sf+CU4IsYYx67Yk+70xVb42X+1U6VVgB
	UntjEDCq+0kt/SsuDkGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMnOo-0000000Br5M-0e85;
	Fri, 30 Oct 2026 14:16:06 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMnOl-0000000Br4f-14Dy
	for linux-arm-kernel@lists.infradead.org;
	Fri, 30 Oct 2026 14:16:05 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D02F71F60;
	Fri, 30 Oct 2026 07:15:57 -0700 (PDT)
Received: from LeoBrasDK.cambridge.arm.com (LeoBrasDK.cambridge.arm.com [10.2.212.21])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 7681D3F673;
	Fri, 30 Oct 2026 07:15:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1793369761; bh=GgEd+PH/jbq28UuYqcwDbQX/UOZkQ32m5RYqOej8J8E=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=dutMwEYAFpbCr/3XewPMFmB38iOS8ovV+p3UxpXzOGWbjtVHG7Al4HMwOz+NFMXD6
	 /aaaD3oKAX2aT2ycObpBXr5+dBEcYMgzJBnPS2YuS/IDD/LhqDW+hN3V+rSuTryn9i
	 bi+6s+GHCIUINFW1E+zM80eCwXTT1rVCtofpGbmg=
From: Leonardo Bras <leo.bras@arm.com>
To: Tian Zheng <zhengtian10@huawei.com>
Cc: Leonardo Bras <leo.bras@arm.com>,
	maz@kernel.org,
	oupton@kernel.org,
	catalin.marinas@arm.com,
	will@kernel.org,
	corbet@lwn.net,
	pbonzini@redhat.com,
	yuzenghui@huawei.com,
	wangzhou1@hisilicon.com,
	yangjinqian1@huawei.com,
	caijian11@h-partners.com,
	liuyonglong@huawei.com,
	tangchengchang@huawei.com,
	yezhenyu2@huawei.com,
	yubihong@huawei.com,
	linuxarm@huawei.com,
	joey.gouly@arm.com,
	kvmarm@lists.linux.dev,
	kvm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	seiden@linux.ibm.com,
	suzuki.poulose@arm.com,
	fuad.tabba@linux.dev,
	mark.rutland@arm.com,
	seanjc@google.com,
	rdunlap@infradead.org,
	linux-doc@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	skhan@linuxfoundation.org
Subject: Re: [PATCH v5 06/15] KVM: arm64: Add support for FEAT_HDBSS
Date: Fri, 30 Oct 2026 14:15:51 +0000
Message-ID: <auSml6yTVYIQe7NZ@LeoBrasDK>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <a301e884-f6d1-4082-8551-8d8a17276dc3@huawei.com>
References: <20260929103655.85107-1-zhengtian10@huawei.com> <20260929103655.85107-7-zhengtian10@huawei.com> <at-X_hFbsBU_Dsgr@LeoBrasDK> <a301e884-f6d1-4082-8551-8d8a17276dc3@huawei.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261030_071603_453310_5C726259 
X-CRM114-Status: GOOD (  29.68  )
X-Spam-Score: -4.4 (----)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Fri, Oct 30, 2026 at 10:53:57AM +0800, Tian Zheng wrote:
> 
> 
> On 10/27/2026 2:12 AM, Leonardo Bras wrote:
> > On Tue, Sep 29, 2026 at 06:36:46PM +0800, Tian Zheng wrote:
> > > diff --git a/arch/arm64/kernel/cpufeature.c b/arch/arm64/kernel/cpufeature.c
> > > index 32102c3912fa..12fa37328dd2 100644
> > > --- a/arch/arm64/kernel/cpufeature.c
> > > +++ b/arch/arm64/kernel/cpufeature.c
> > > @@ -2158,6 +2158,11 @@ static bool hvhe_possible(const struct arm64_cpu_capabilities *entry,
> > >   	return arm64_test_sw_feature_override(ARM64_SW_FEATURE_OVERRIDE_HVHE);
> > >   }
> > > 
> > > +static bool has_vhe_hdbss(const struct arm64_cpu_capabilities *entry, int scope)
> > > +{
> > > +	return is_kernel_in_hyp_mode() && has_cpuid_feature(entry, scope);
> > > +}
> > > +
> > 
> 
> Hi leo,
> 
> > IIUC you run this on every cpu in the system, to make sure it's matching
> > the feature. Is there any chance the kernel is in EL2 only on some of the
> > cpus here?
> > 
> 
> It's impossible for the system to have only some CPUs in EL2 and others
>  not.
> 
> > If not, maybe we can run it on system_supports_hdbss() instead, which would
> > be easier for the user to understand it only runs in EL2, on top of not
> > needing the above.
> > 
> 
> However, The question is whether a cap should mean "this system can use
> the feature" or "this hardware supports the feature". If the cap only
> tracks hardware support, users may be confused when the hardware
> supports HDBSS but the system runs in nVHE mode — they would mistakenly
> believe they can use the feature.
> 
> So I think we should keep is_kernel_in_hyp_mode() in has_vhe_hdbss(),
> and add a comment in system_supports_hdbss() explaining this.
> 
> Does that work for you? Looking forward to your reply.

Well, 
That's just my personal view of this:

If we have a function called "has_hdbss" it should only report if the 
system has the feature available.

On the "system_supports_*" we have to figure out if the system itself 
supports the feature, which checks the feature bits itself and could mean 
checking for other features being there, such as hyp_mode.  

What do you think?

Thx,
Leo

