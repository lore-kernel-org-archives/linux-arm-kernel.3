Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75438CD4F26
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 19 Jun 2026 15:07:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:References:In-Reply-To:Message-Id:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oPZXOE7HzbZRwhQ2roKChVh+HemRaSM3x5c/6x3sjjk=; b=30Ztkr5xjV1GoTFq4fztE5JKX1
	oOB+SX2jvDQY86RK6XxLp6fL/CUMO/Vf5fgJZZOkIBdiKTP/kHIYhr2qWyXMHDnZJlkvlKhrZDztY
	0cmaaKoADE3PE/+4SYvgpk7OIZCcyoLyfHYdlOsCY1uQYoX8i5g6qRYpTkWVDb+8lfO55hLTje0Hz
	prpyk/GTR/WLZn1yCMVOA55SDlhsSMcpjJmHgEz1XWsmDCiqhNBHoco85eL6Ap/ioVmeJHQY8kSms
	Dv1HdY+DyFCGVl9BGLYB+ypzguOkDdg3Lk8tavRgws1VJRE+/z+VT6ahYryCZTX46MASM2uoXRWgL
	ZLmKWk5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1waaoN-00000002ca8-3ng3;
	Fri, 19 Jun 2026 15:07:15 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1waaoM-00000002cZz-2hXZ
	for linux-arm-kernel@lists.infradead.org;
	Fri, 19 Jun 2026 15:07:14 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 409A743667;
	Fri, 19 Jun 2026 15:07:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A65881F000E9;
	Fri, 19 Jun 2026 15:07:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781881634;
	bh=oPZXOE7HzbZRwhQ2roKChVh+HemRaSM3x5c/6x3sjjk=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject;
	b=hZreIN0qAZbeamh+IPnH+oMIKpqMOTche9q9y0F6w/txfy85p4tRw4m3zjb3x812D
	 mxwL15/3VYsi+RfmeOjykLsVftc3dL3ewp6ud6G3oro8OVTuXPF1v/kPcSgwBnhbYz
	 6FBJsDsBdrfB3BzfVuSnGNE4gHefiDivI6MuPgDQsjZa0z4GRGwKLMY0Yj9eayy+NA
	 CZjEJMhAiCz00ZPhUWrII1Vy7n5cVDI/MqmCIVyAdQslh/K0TMTgjLRCPxYgtboZjZ
	 IDSn6Fshof7OaG+0mbuJKXUz2bgJYzK+D8wXQALAKdZT5h7aIVCsbUCaOX+BljLHhF
	 LPoWj8xXCKuSA==
Received: from phl-compute-01.internal (phl-compute-01.internal [10.202.2.41])
	by mailfauth.phl.internal (Postfix) with ESMTP id EDBD9F40078;
	Fri, 19 Jun 2026 11:07:12 -0400 (EDT)
Received: from phl-imap-05 ([10.202.2.95])
  by phl-compute-01.internal (MEProxy); Fri, 19 Jun 2026 11:07:12 -0400
X-ME-Sender: <xms:IFs1anToSlkVBylIBo2noDIwOgXD-SCppugy85cFON2V8Nzgv5I4Ow>
    <xme:IFs1ajkFPBCnlSddF2y2P3_-RGtnXgui4Xh8UjJaljPR7CZsmqIfsN8sp9v74tn9z
    iyrl4mDOJ680lokbkbGGCgEmUxTcKIkuGWOu6yUlklA28wwKDB9Q9U>
X-ME-Proxy-Cause: dmFkZTEie/9IPWkt41SsD8vNaHU0dLO84ItaelyjcUQEGa9wATz2GRPwGg1umeGjcJfPgt
    HuKJsuM4mBkAkrgl2QTpcvtbjZ0MYMjWvn73wrF5pvH+WV+bvho8UIywoddQoGLttZYW4R
    nntx4gR1sBA4UjMZ3vAq6jhg9ieCy/H1DMVs2tM1xxvS4mtY+PPAgOHFx/2jx0gKi4Oz/T
    GHjE3KC8QFwDCF7ykYQoudjz8jrkaZXhUqYrFH0mACf4eONgkjiFoKOKzMz6AzglOL0Hxa
    rXdo7QUnxyE7yYUIfc00rq3vDGW5PyP2XGUNixZYM7K+uH9J+IaQugnZ3LX0MWjIL16kbM
    OK4tYE0e6KeuxhzSriO/6uqZ6jv9fQilDoDFw+0zq4Mel5zdTCBQFiBYYvyf4hcRkpb3Gv
    VtzIA2dk7FvC+aphUX4nbc9zyjKnFU5/MlaOrFyLUHIM+Botkyqj1Cd1l4TBxkPbG4wRuR
    48dyea7nsrLXYGPg6OOsgSFNUtqI7leFGGUf67lPoS+1QWFMYDBhYAKcjo5GtBBXwSsjAG
    J5F2JNATmfEfRObiksWRbnd7uLO432+Q8OgghDHMHy6hOWKUqanHdn/Hh6n1clE/wk0823
    ACamduzYYuuDd/LTQHjPFoCJUwUnnTnbIVroUuHHhH6Vnf4xqOl25N5dtZqw
X-ME-Proxy: <xmx:IFs1atksMec-xvAheA6qUTKdO2qyDDaWKoZPlrCVqKE9ynA2eMg-cA>
    <xmx:IFs1ai0sMJmTjI5ZP8TW4nJRdFNVVgRuTd4zBju77COEpm17owocJA>
    <xmx:IFs1aqTL7WjWgidaotJvTFDy83hV3e3KDSF913EtL8VBs9xQNe45kg>
    <xmx:IFs1arwKHSbh3Hz7lKq2r74bSLF5XZqQq6BYVktInYgZONbPlcXHKg>
    <xmx:IFs1aqDKFcJ78ibMxOLEWF7hc4AYfxymdTUAZbiTChte02fm_jowrFRA>
Feedback-ID: ice86485a:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id CC742182007E; Fri, 19 Jun 2026 11:07:12 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
Date: Fri, 19 Jun 2026 17:06:52 +0200
From: "Ard Biesheuvel" <ardb@kernel.org>
To: "Fuad Tabba" <fuad.tabba@linux.dev>, "Will Deacon" <will@kernel.org>
Cc: "Marc Zyngier" <maz@kernel.org>, "Mark Brown" <broonie@kernel.org>,
 "Catalin Marinas" <catalin.marinas@arm.com>,
 "Oliver Upton" <oupton@kernel.org>, Aishwarya.TCV@arm.com,
 linux-arm-kernel@lists.infradead.org
Message-Id: <5b8a6848-f65e-4595-9926-fada16629ed2@app.fastmail.com>
In-Reply-To: <CA+EHjTwymmZqNM9Yf+PQc+7GgmesDFL8UPj-eA2vdrGqrdAufA@mail.gmail.com>
References: <aicVyebkEMs6w6UV@sirena.co.uk> <87tsrc946i.wl-maz@kernel.org>
 <8eac5e73-282d-4c72-b726-0c5c82fc81f0@app.fastmail.com>
 <aik_oVrNHUrh21MB@willie-the-truck>
 <CA+EHjTwymmZqNM9Yf+PQc+7GgmesDFL8UPj-eA2vdrGqrdAufA@mail.gmail.com>
Subject: Re: -next boot failures during KVM setup
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
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

Hi Fuad,

On Fri, 19 Jun 2026, at 17:01, Fuad Tabba wrote:
> Hi,
>
> On Wed, 10 Jun 2026 at 11:42, Will Deacon <will@kernel.org> wrote:
>>
>> On Mon, Jun 08, 2026 at 10:56:12PM +0200, Ard Biesheuvel wrote:
>> > Given we're at -rc7, I'd lean towards dropping the whole branch for now, or
>> > alternatively, only drop/revert "arm64: mm: Unmap kernel data/bss entirely from the
>> > linear map" (and its followup fix "arm64: mm: Defer remap of linear alias of
>> > data/bss") so that the region always remains readable via the linear map.
>>
>> I've reverted those two locally, thanks! I'll push some new branches
>> shortly.
>
> I hit an nVHE boot regression on v7.2 while testing Will's kvmtool
> protected-VM series [1]. I found this thread while debugging, and
> thought this might help. Note that Gemini helped me debug this (it's
> pretty good at debugging).
>
> f2ba877 (the read-only mapping you kept) still breaks nVHE, but only with
> CONFIG_NVHE_EL2_DEBUG / CONFIG_NVHE_EL2_TRACING:
>
>   Unable to handle kernel write to read-only memory ... (ESR 0x9600004f)
>   pc : kvm_apply_hyp_relocations+0x80/0x8c
>
> kvm_apply_hyp_relocations() writes the .hyp.reloc fixups via lm_alias().
> Most are in .hyp.rodata (whose alias isn't made read-only until
> mark_linear_text_alias_ro(), after the relocs), but five land in .hyp.data
> and now fault. They're all debug-only: __kvm_nvhe_selftest_vm/_vcpu
> (NVHE_EL2_DEBUG) and __kvm_nvhe_trace_buffer (NVHE_EL2_TRACING). A default
> config has none in .hyp.data and boots, which is why this didn't show up
> earlier. VHE skips the relocations entirely.
>
> [1] https://lore.kernel.org/all/20260619115415.5475-1-will@kernel.org/
>

Thanks for the report - I'll investigate. I imagine deferring the R/O remap
should help, but I'll try to reproduce locally and see what we can do about
this.


