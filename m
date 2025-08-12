Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1425BC87FCB
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 12 Aug 2025 12:40:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wL7oMuxzuq77ZJtUvDZifXFtmHYOVxGq8Ts3DyGKcJ8=; b=GbQe/6URb1bvGKk3Lj7OEHJazl
	DyWTfMbS+IAxSYz7qHtlcTwe+3t224dfACRo3SWpgGqNWHsHltWzWczEV8CgcrOmUddSRIVO5ZA1X
	EbbOUdXp6dUkLZjB6decXGev41GFZH70pxlb7nmXEsMA1zOeIhyd9zE1M07Vq98yRvBNaOtFyWtmB
	HQxtbyKYb3JndAxq5i09jaw1ZylCXpxRhcuPESkUMFU8OSloU787m4tXj3cAtNkn31BGPY+pvOPjR
	v4h+wR1qlYmsW8ARXdMNj4wq4xzkM7PasfsQKTiuItUPWmofa+HZJl229Hu/NlpbjxNJKIq0Rn23V
	5ojifQCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uloIR-0000000AmgL-1LBP;
	Tue, 12 Aug 2025 12:40:07 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ull3m-0000000ALBu-1dm0
	for linux-arm-kernel@lists.infradead.org;
	Tue, 12 Aug 2025 09:12:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1754989963;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=wL7oMuxzuq77ZJtUvDZifXFtmHYOVxGq8Ts3DyGKcJ8=;
	b=do7/SSMQTncDIP1FiyoDAddlHXSn+iPt6PuwIAxr+R7P4QTY4H5tOK1xkX9kvgH8KSUuEq
	dTbF7KMNWelV32SSOASE10iKGJBzWh8Ok/13GuZT81TX5za2rvF0yV5g5hbh2rQpd55tR4
	JN/JDxY+7g/8psdd+vXks3zHifIjswU=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-583-CvFAT5kQMcmvSzRHF-icHw-1; Tue,
 12 Aug 2025 05:12:37 -0400
X-MC-Unique: CvFAT5kQMcmvSzRHF-icHw-1
X-Mimecast-MFC-AGG-ID: CvFAT5kQMcmvSzRHF-icHw_1754989956
Received: from mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.111])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id A85BF1800371;
	Tue, 12 Aug 2025 09:12:35 +0000 (UTC)
Received: from localhost (dhcp-192-236.str.redhat.com [10.33.192.236])
	by mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 4C4901800291;
	Tue, 12 Aug 2025 09:12:34 +0000 (UTC)
From: Cornelia Huck <cohuck@redhat.com>
To: Marc Zyngier <maz@kernel.org>, Joey Gouly <joey.gouly@arm.com>
Cc: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 kvm@vger.kernel.org, Suzuki K Poulose <suzuki.poulose@arm.com>, Oliver
 Upton <oliver.upton@linux.dev>, Zenghui Yu <yuzenghui@huawei.com>, Will
 Deacon <will@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>
Subject: Re: [PATCH v2 4/5] KVM: arm64: Expose FEAT_RASv1p1 in a canonical
 manner
In-Reply-To: <874iugtfib.wl-maz@kernel.org>
Organization: "Red Hat GmbH, Sitz: Werner-von-Siemens-Ring 12, D-85630
 Grasbrunn, Handelsregister: Amtsgericht =?utf-8?Q?M=C3=BCnchen=2C?= HRB
 153243,
 =?utf-8?Q?Gesch=C3=A4ftsf=C3=BChrer=3A?= Ryan Barnhart, Charles Cachera,
 Avril Crosse O'Flaherty"
References: <20250806165615.1513164-1-maz@kernel.org>
 <20250806165615.1513164-5-maz@kernel.org>
 <20250807125531.GB2351327@e124191.cambridge.arm.com>
 <874iugtfib.wl-maz@kernel.org>
User-Agent: Notmuch/0.38.3 (https://notmuchmail.org)
Date: Tue, 12 Aug 2025 11:12:31 +0200
Message-ID: <878qjogayo.fsf@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.111
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250812_021246_503065_BDAF46C8 
X-CRM114-Status: GOOD (  25.50  )
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

On Sat, Aug 09 2025, Marc Zyngier <maz@kernel.org> wrote:

> On Thu, 07 Aug 2025 13:55:31 +0100,
> Joey Gouly <joey.gouly@arm.com> wrote:
>> 
>> On Wed, Aug 06, 2025 at 05:56:14PM +0100, Marc Zyngier wrote:
>> > If we have RASv1p1 on the host, advertise it to the guest in the
>> > "canonical way", by setting ID_AA64PFR0_EL1 to V1P1, rather than
>> > the convoluted RAS+RAS_frac method.
>> > 
>> > Note that this also advertises FEAT_DoubleFault, which doesn't
>> > affect the guest at all, as only EL3 is concerned by this.
>> > 
>> > Signed-off-by: Marc Zyngier <maz@kernel.org>
>> > ---
>> >  arch/arm64/kvm/sys_regs.c | 12 ++++++++++++
>> >  1 file changed, 12 insertions(+)
>> > 
>> > diff --git a/arch/arm64/kvm/sys_regs.c b/arch/arm64/kvm/sys_regs.c
>> > index 1b4114790024e..66e5a733e9628 100644
>> > --- a/arch/arm64/kvm/sys_regs.c
>> > +++ b/arch/arm64/kvm/sys_regs.c
>> > @@ -1800,6 +1800,18 @@ static u64 sanitise_id_aa64pfr0_el1(const struct kvm_vcpu *vcpu, u64 val)
>> >  	if (!vcpu_has_sve(vcpu))
>> >  		val &= ~ID_AA64PFR0_EL1_SVE_MASK;
>> >  
>> > +	/*
>> > +	 * Describe RASv1p1 in a canonical way -- ID_AA64PFR1_EL1.RAS_frac
>> > +	 * is cleared separately. Note that by advertising RASv1p1 here, we
>> 
>> Where is it cleared? __kvm_read_sanitised_id_reg() is where I would have
>> expected to see it:
>> 
>>     case SYS_ID_AA64PFR1_EL1:
>
> [...]
>
> Ah crap, it is the nested code that we get rid of it, nowhere else.
> Which means that non-nested VMs have already observed RAS_frac. What a
> mess. Then RAS_frac must be exposed as writable.
>
> The question is whether we want to allow migration between one flavour
> of RASv1p1 and the other.

I guess that boils down to which kind of observable changes we want to
allow: bit-for-bit register contents, or only features? If only feature
stability is needed, then a cross-flavour migration would be fine; OTOH,
we do not know how a guest deduces feature availability, and it might
check for one flavour, but not the other (which is mostly a problem if
it re-checks during the lifetime.)

Only looking at strictly matching register contents would probably be
easier to implement for the VMM (well, it looks easier for QEMU :)


