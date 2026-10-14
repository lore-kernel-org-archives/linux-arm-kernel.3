Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B11FACC6B1F
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 14 Oct 2026 02:16:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gi31zoe97UR+sBH6mAXdZUAvrWtZ1MPdxaEP7QKWXR0=; b=rqqJekh4Fj3dgqvyy+z3V4sDKB
	SfIODJb7Jm8taxxCL3jqu1sE40Q9zeLqDxIU2h0dA8KzaEOvK408f1eZvtxBbwRtdQKWF0KPxDRQi
	HqqtGoyhOmDQhgVYjpOoIft2SIuP1IpTstqk2NpW98AFTl8VKIYymU5+U1esGLCicJeZP+818fwkh
	LyNr14PGLbYJwL/ZUhnfsMkvxYxan2sETD1nOUYgl6opB9QdDOMSMfMJmhzD0Q64KIhM6wJHzEUMS
	TxCSDgQh2+nn9sQYIo8NBNcNozDeSlnr5n/JTpHvCvx4qUvFKdUiJ8twv5s0w/Su+uKA5Srmio7do
	WvYRQIAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGoXl-0000000EM7A-2LR2;
	Wed, 14 Oct 2026 02:16:37 +0000
Received: from esa8.hc1455-7.c3s2.iphmx.com ([139.138.61.253])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGoXg-0000000EM6Q-3O17
	for linux-arm-kernel@lists.infradead.org;
	Wed, 14 Oct 2026 02:16:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1791944192; x=1823480192;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=ValUy6NcJ7XWvyFZxFe0+oYX+hzVPfARyjSGuOAeXz0=;
  b=KK2tWUWfXCMEjd4jPV8CbOFOtO9033v2OuyFQ4R4tsE+oPlMa8pYY24V
   D9klndvMMyNIobFt3BXioLbYPmRH4MLnmBLVlpYR+DXam/uLR4fCGNf6M
   ZgePBGmgJtTZ0fHLJSXzhXfmADnwsWLxSFybFHMU5NgqZXjzJ06v0OyH+
   MiC5Fn41jhMMRE+f1Ls2St11k+CGjihrYzmPwpbcmEJnYL0i8ucOxac5C
   ywZQ5BNGlk0kv4Gi3O6IO0raSJgQ5iD0/S+gnAp/tt9aHIicThRf57SdU
   LAc9sE3NVuBWLMea3GL08wKvc44ZUTeW1EYXIYWQE9bxWwEfB9NPA/gu2
   Q==;
X-CSE-ConnectionGUID: E/550iUMQxeyHfJPL5vAjw==
X-CSE-MsgGUID: Q4WCGFbjRweQvdBNoCt5GQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11934"; a="246067472"
X-IronPort-AV: E=Sophos;i="6.27,156,1786978800"; 
   d="scan'208";a="246067472"
Received: from gmgwuk01.global.fujitsu.com ([172.187.114.235])
  by esa8.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Oct 2026 11:16:26 +0900
Received: from az2uksmgm3.o.css.fujitsu.com (unknown [10.151.22.200])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwuk01.global.fujitsu.com (Postfix) with ESMTPS id ECBE8C00225
	for <linux-arm-kernel@lists.infradead.org>; Wed, 14 Oct 2026 02:16:26 +0000 (UTC)
Received: from az2nlsmom2.o.css.fujitsu.com (unknown [10.150.26.200])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm3.o.css.fujitsu.com (Postfix) with ESMTPS id 9F811C00812
	for <linux-arm-kernel@lists.infradead.org>; Wed, 14 Oct 2026 02:16:26 +0000 (UTC)
Received: from FCCLS0092175.localdomain (unknown [10.8.5.209])
	by az2nlsmom2.o.css.fujitsu.com (Postfix) with SMTP id 4848F180059D;
	Wed, 14 Oct 2026 02:16:21 +0000 (UTC)
Date: Wed, 14 Oct 2026 11:16:19 +0900
From: Kohei Enju <enju.kohei@fujitsu.com>
To: Catalin Marinas <catalin.marinas@arm.com>
Cc: Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Suzuki K Poulose <Suzuki.Poulose@arm.com>, Sami Mujawar <sami.mujawar@arm.com>, 
	Steven Price <steven.price@arm.com>, "Aneesh Kumar K.V (Arm)" <aneesh.kumar@kernel.org>
Subject: Re: [PATCH] arm64: rsi: Correct type of realm_config::hash_algo
Message-ID: <as7jnnH0hAvYa0UM@FCCLS0092175.localdomain>
References: <20260929-cca-b4-rsi-fix-hash_algo-type-rebase-v1-1-6932cf0aa605@fujitsu.com>
 <as5ljILkGNxH0TTd@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <as5ljILkGNxH0TTd@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261013_191633_396531_B53C1CD4 
X-CRM114-Status: GOOD (  27.96  )
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

On 10/13 18:08, Catalin Marinas wrote:
> On Tue, Sep 29, 2026 at 08:36:00PM +0900, Kohei Enju wrote:
> > The RMM specification defines RsiHashAlgorithm as an 8-bit type, but
> > realm_config::hash_algo is currently declared as unsigned long.
> > 
> > There are currently no upstream users of this field, so the mismatch
> > does not cause an observable issue today. However, a proposed series
> > adding support for Realm measurement registers uses this field and
> > exposes a bug caused by the incorrect type.
> > 
> > Change hash_algo to u8 to match the RMM specification while preserving
> > the size and layout of struct realm_config.
> 
> Doesn't the RMM spec say that the unused bits must be zero? B5.5.19.

You're right. The RMM must zero the unused bits, but TF-RMM does not
appear to do so. I agree that this should be fixed in TF-RMM as well.

> That said, I'm ok with the explicit u8 here.

Thanks.

> 
> > Link: https://lore.kernel.org/all/20260413084957.327661-4-sami.mujawar@arm.com/
> > Signed-off-by: Kohei Enju <enju.kohei@fujitsu.com>
> > ---
> >  include/linux/arm-smccc-rsi.h | 5 ++++-
> >  1 file changed, 4 insertions(+), 1 deletion(-)
> > 
> > diff --git a/include/linux/arm-smccc-rsi.h b/include/linux/arm-smccc-rsi.h
> > index fddb77986f70..2fb6ec5e0298 100644
> > --- a/include/linux/arm-smccc-rsi.h
> > +++ b/include/linux/arm-smccc-rsi.h
> > @@ -128,7 +128,10 @@ struct realm_config {
> >  	union {
> >  		struct {
> >  			unsigned long ipa_bits; /* Width of IPA in bits */
> > -			unsigned long hash_algo; /* Hash algorithm */
> > +			union {
> > +				u8 hash_algo; /* Hash algorithm */
> > +				u8 pad_hash_algo[8];
> > +			};
> 
> I would skip the padding for now, we have one already. If we later add
> the next fields, I have a slight preference for a u8 reserved[7] field
> than another union.

Ack. I'll drop the inner union in v2.

Thanks,
Kohei

> 
> >  		};
> >  		u8 pad[0x200];
> >  	};
> 
> -- 
> Catalin

