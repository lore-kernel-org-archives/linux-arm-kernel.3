Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56C80C88E4A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Sep 2026 10:44:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DAU8c09i0MND0FioNPyWrJvbv9nWOMlKSYeYf/e2rk0=; b=GjbjxFT5POlN2z3mS9qhPnGNPI
	GKSGqZycepI8suMIZ+bfIv1oCeftSLSesIqOs1jkGrerHjLWrPHH7ajpTDr9LMt/8EMYKAfe/I+Y0
	All5CaQlbW32mms9GRDqL8lVHjli+K4nXrNQU3T5mvCoZNDesJg2bheQbOXIcGWuMoZVyi26/ISag
	laXYiJ99xHXtdbFQgnnln/mRGVG5pEE02S8Al1Hkc6uMX9pWbLlbLckia5F3V+jwCL0argFXQczem
	LINyIsk0HXrqxXkdGLoDHM6Fx9GX6PIPQDEODObg2KBBRGTSU3MDBtoqRSAITjdB4p8GySs8TLJAi
	8dIJ+mYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4yjl-0000000GPo4-1Dsg;
	Fri, 11 Sep 2026 10:44:05 +0000
Received: from out-46.mta0.migadu.com ([2001:41d0:1004:224b::2e] helo=mta0.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4yjj-0000000GPn6-0VeR
	for linux-arm-kernel@lists.infradead.org;
	Fri, 11 Sep 2026 10:44:04 +0000
X-Envelope-To: linux-arm-kernel@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=dt7W7qoqMvN/pTVmBCQfsmPq57WbDOVswaYdZJuMgEM=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1789123440; v=1; x=1789728240;
 b=xa1k9I+DfN0SqmpIw5H3Vy2xesXbE9F8aayK2c8zzZOEExKGvZDcckpmRVYCwdJslKh18USW
 lGOO9qCBXVxGygIcXA5bPGnZ891UBWYxT01XAiHjN88DtqDxIU5GGUw4TqslC8YNI1cOC7CxDzA
 2wMiVfQxuxlPkDV7mdso8ptM=
X-Envelope-To: linux-arm-kernel@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id 7fc3612439325f28;
	Fri, 11 Sep 2026 10:44:00 +0000
X-Mizu-Trace-ID: 7fc3612439325f28
X-Migadu-Flow: FLOW_OUT
Received: by mail-lf2-f12.google.com with SMTP id 2adb3069b0e04-5b4a0b384c4so3692e87.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 11 Sep 2026 03:43:59 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBydBmRN61XFBTeG50fQJcfsEE3IpsE0COax/TINWs5YZ/HeaWNiYtgi+az+Wyq/fXIHv942bWeRqY787LYAlUKh@lists.infradead.org
X-Gm-Message-State: AFuF++kzTSEvjH8XEFYexktncJEwJkBMcSL5izDlnPcHjS5MjStohI3t
	hNIJ0LE59CC5i4g8yJVY/+/8k70DXebBtZT9iANqgV3vdU/hTG7un4UhgeI89gkfbDVCWJHW/40
	nSOH9+28uR35blhIBpgt8+bq0k0viOt9M+lLMHZVj
X-Received: by 2002:a05:6512:6204:b0:5b2:a967:c0e1 with SMTP id
 2adb3069b0e04-5b8a05364c4mr124575e87.0.1789123438690; Fri, 11 Sep 2026
 03:43:58 -0700 (PDT)
MIME-Version: 1.0
References: <20260908145651.2828597-1-fuad.tabba@linux.dev> <86se3h748o.wl-maz@kernel.org>
In-Reply-To: <86se3h748o.wl-maz@kernel.org>
From: Fuad Tabba <fuad.tabba@linux.dev>
Date: Fri, 11 Sep 2026 11:43:22 +0100
X-Gmail-Original-Message-ID: <CA+EHjTzos572k==mryykXi98Z_Ok_WKy=1nyv_P=+TmQSbOzdA@mail.gmail.com>
X-Gm-Features: AcwNN1VahT4s9utKWdo2oybbVii_jsZIqb7Y0hgJ-TEx-cPBPTlX6iufnxeQGOQ
Message-ID: <CA+EHjTzos572k==mryykXi98Z_Ok_WKy=1nyv_P=+TmQSbOzdA@mail.gmail.com>
Subject: Re: [PATCH v2] KVM: arm64: Trap guest MPAM accesses whenever MPAM is implemented
To: Marc Zyngier <maz@kernel.org>
Cc: Oliver Upton <oupton@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, James Morse <james.morse@arm.com>, Ben Horgan <ben.horgan@arm.com>, 
	Xi Ruoyao <xry111@xry111.site>, Mark Rutland <mark.rutland@arm.com>, 
	Joey Gouly <joey.gouly@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Zenghui Yu <yuzenghui@huawei.com>, Steffen Eiden <seiden@linux.ibm.com>, 
	Gavin Shan <gshan@redhat.com>, Yuan Yao <yaoyuan@linux.alibaba.com>, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260911_034403_310135_72D1080E 
X-CRM114-Status: GOOD (  11.94  )
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

On Thu, 10 Sept 2026 at 12:08, Marc Zyngier <maz@kernel.org> wrote:
...
> > --- a/arch/arm64/include/asm/cpufeature.h
> > +++ b/arch/arm64/include/asm/cpufeature.h
> > @@ -873,6 +873,11 @@ static __always_inline bool system_supports_mpam_hcr(void)
> >       return alternative_has_cap_unlikely(ARM64_MPAM_HCR);
> >  }
> >
> > +static __always_inline bool system_supports_mpam_sysregs(void)
> > +{
> > +     return alternative_has_cap_unlikely(ARM64_MPAM_SYSREGS);
> > +}
> > +
>
> What is the rationale for choosing alternative_has_cap_unlikely()
> instead of cpus_have_final_cap(), which is more wildly used?

Not a good one to be honest, and it's gone in V3.

Cheers,
/fuad

>
>         M.
>
> --
> Without deviation from the norm, progress is not possible.

