Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2784C79FA1
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Sep 2026 07:02:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yvrOhNqKEXmlczC/9PcodG1C54m4foYIbc/IZxP/4KM=; b=FDlETcEmKbtyarEVxDVr3fHdYL
	KhKToCRCk65ybSzLy9+pB9ZH0ltxjybHEMqu8P/CPJhfNpE3Hp4VbBw9ZAuVklyaLm6h1gskRhvhl
	nbpBQH4ucem7G/Kfk0sfbrXp0v26gjkKJ9j4DX56b7V7gXXW/Oa9W3W6/462I9n8m9+clF0qDoSTg
	LwtuuH29IxF9PoYrDF2VfCRQnLzzmrxI6TvKYvNQveWu/doVGShE2+x8FaYeUONWYEQSXTikwehTg
	QLJcLwAj+etQDjpyDmvt3EzCHhl6ZJvCjkZ1DjFMiwW5Z+7hrLantAwBi3rYQrrBdukEBL7gECetM
	GqBEZODw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4vHO-0000000Fz7n-1gqO;
	Fri, 11 Sep 2026 07:02:34 +0000
Received: from out-221.mta0.migadu.com ([2001:41d0:1004:224b::dd] helo=mta0.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4vHL-0000000Fz74-2xjX
	for linux-arm-kernel@lists.infradead.org;
	Fri, 11 Sep 2026 07:02:32 +0000
X-Envelope-To: linux-arm-kernel@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=+g+42iif6IVcRrIokUZrLgCvAoBdHhejpcI6IQl7UoA=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1789110149; v=1; x=1789714949;
 b=UVUoSvUHvCjp5lltDZlsBd45mYyHe3XdcvFas3zqWScUzFBi/xMo3xjPLlCu/LmYD7NXe6Ve
 BUVF2a57jsBcT+jRs2D26OTg7pNCEWY4iFXxL9txnkmcFlrhzSUJ5ZmorGMLbk2+70P7XQt7wL/
 hHAzvsGzILTkR2KW0WEbKRyA=
X-Envelope-To: linux-arm-kernel@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id 8527057069da3e82;
	Fri, 11 Sep 2026 07:02:29 +0000
X-Mizu-Trace-ID: 8527057069da3e82
X-Migadu-Flow: FLOW_OUT
Received: by mail-lf2-f12.google.com with SMTP id 2adb3069b0e04-5b4a0b384c4so2494e87.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 11 Sep 2026 00:02:24 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvByAJl8xanTVTFxKRDXFgsQne7y3SOUV922AMNVcmz3LnQmfhf0mSvG8SuMqc8LrCMUfH4eK13Unw21Pxr/PJWYz@lists.infradead.org
X-Gm-Message-State: AFuF++mNntAVWSfBAnhO4/r7CmEZOmxJ5m5PUuCcojG88O6WbAc/a6u2
	xgZkdcV2G9hemNp0blBDkQGQI6izUgLi1w7Ds5Wt2PtGQJP7TSivSlJOsPRumLjxwJ0X8RKPthj
	eGGoR1TBOmqpy6NVXrSHPAOL9p3AcqbpeFvzN+l++
X-Received: by 2002:a05:6512:460f:b0:5ae:b9c5:f29f with SMTP id
 2adb3069b0e04-5b8a05a180fmr90471e87.2.1789110143622; Fri, 11 Sep 2026
 00:02:23 -0700 (PDT)
MIME-Version: 1.0
References: <20260908145651.2828597-1-fuad.tabba@linux.dev> <aqKJM3CF-i3VyJk2@willie-the-truck>
In-Reply-To: <aqKJM3CF-i3VyJk2@willie-the-truck>
From: Fuad Tabba <fuad.tabba@linux.dev>
Date: Fri, 11 Sep 2026 08:01:47 +0100
X-Gmail-Original-Message-ID: <CA+EHjTwxm1BxDq2Aqy2tfF0sXRZvfRLiSn5jaHYf=g1S2ARHRA@mail.gmail.com>
X-Gm-Features: AcwNN1XCuogT4WkezybFayrxqhUNrhZMDnWGz-WkLBJOTExg2uTnRtgxv1nD4YU
Message-ID: <CA+EHjTwxm1BxDq2Aqy2tfF0sXRZvfRLiSn5jaHYf=g1S2ARHRA@mail.gmail.com>
Subject: Re: [PATCH v2] KVM: arm64: Trap guest MPAM accesses whenever MPAM is implemented
To: Will Deacon <will@kernel.org>
Cc: Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>, 
	Catalin Marinas <catalin.marinas@arm.com>, James Morse <james.morse@arm.com>, 
	Ben Horgan <ben.horgan@arm.com>, Xi Ruoyao <xry111@xry111.site>, 
	Mark Rutland <mark.rutland@arm.com>, Joey Gouly <joey.gouly@arm.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Zenghui Yu <yuzenghui@huawei.com>, 
	Steffen Eiden <seiden@linux.ibm.com>, Gavin Shan <gshan@redhat.com>, 
	Yuan Yao <yaoyuan@linux.alibaba.com>, linux-arm-kernel@lists.infradead.org, 
	kvmarm@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260911_000231_888966_D2733BA9 
X-CRM114-Status: GOOD (  20.31  )
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

On Thu, 10 Sept 2026 at 11:40, Will Deacon <will@kernel.org> wrote:
...
> > +static bool
> > +test_has_mpam_sysregs(const struct arm64_cpu_capabilities *entry, int __unused)
> > +{
> > +     /* The registers exist whether or not firmware enabled MPAM. */
> > +     return detect_ftr_has_mpam();
> > +}
> > +
> >  static void
> >  cpu_enable_mpam(const struct arm64_cpu_capabilities *entry)
> >  {
> > @@ -3116,6 +3123,12 @@ static const struct arm64_cpu_capabilities arm64_features[] = {
> >               .matches = test_has_mpam,
> >               .cpu_enable = cpu_enable_mpam,
> >       },
> > +     {
> > +             .desc = "Memory Partitioning And Monitoring system registers",
> > +             .type = ARM64_CPUCAP_SYSTEM_FEATURE,
> > +             .capability = ARM64_MPAM_SYSREGS,
> > +             .matches = test_has_mpam_sysregs,
> > +     },
>
> We already have two system capabilities for MPAM so I'm not overly keen
> to add a third, especially as the MPAM code is largely confined to the
> resctrl driver. In fact, this feels a bit similar to things like TRBE
> and SPE in the sense that (a) we have to probe it per-cpu (b) it can
> be disabled by a higher EL and (c) most of the code is in a driver, but
> KVM needs to know how to switch it.
>
> Neither TRBE nor SPE need entries in arm64_features[] at all, so something
> isn't right here...

I think I've overthunk it. The problem isn't in what the host is
doing, but that KVM is basing its traps on whether MPAM support exists
and whether that support is enabled.

V3 should be more in line with what you're suggesting...

Cheers,
/fuad

>
> Will

