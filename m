Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D920C5AD49
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 28 May 2025 14:35:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DzBWBIgcQZbh1kLxOi2N1jD2ieW0nbhwNKoeFP8JFog=; b=t9HTDkvAv6S0n6aeOhwOG1pe2/
	TT2T2tYNwsB34ips8IzHKTOH/2tmFkpnh8bPMZ3k3q+06T7iL8MR3a2lv6JlfKnfpxMpw3VR7OXGI
	f0Uq0PjaZUlBi4x13UucCrHaWJU4FUzpnMKdzUlThU/MQM9xKH8mx0nn754P3JTqcah2+eI3DfN/4
	pcyUcua9sPqbfLnV3vGVgkX2Sy4w5mJAFWKleqUYDNcfpFEwi0A325SM8MgNfhhj+cKso2zftHzwO
	+gU2KgYHu3bg4ask2Ktw/vEisD9RivL5+y7V3sEp3ouNTGGPy+UtQXek74vtRB7VVJMjlOwr0d0J8
	tazUuqvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKHsJ-0000000DQBI-2fQr;
	Wed, 28 May 2025 14:35:23 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKHnV-0000000DPAc-451N
	for linux-arm-kernel@lists.infradead.org;
	Wed, 28 May 2025 14:30:27 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 5C7E25C061F;
	Wed, 28 May 2025 14:28:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D1AF1C4CEE3;
	Wed, 28 May 2025 14:30:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748442625;
	bh=jRw483kLKF6vHdjKiRX9zkkws+EBqLZOZl2WRGzktK0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=OAHZ1WsQXlff4iqaAu5tKd8JOIXR5fjx+s868eTzXBOzHYeN3azGgI7++pyxeUlU+
	 vScL0aZzfhY015PrsVRJ0VCLHJuckAhC63a1YnpwqTMtKP9Ecyh7sfoY0KNnWJ66xv
	 uQLH/K2esf1gEm691fBWnbi0FR+9j6hhzvsWuwyfnYiPurPQBbBUKZKGLAIHz2g10/
	 GPByNjTT5pLzkvh0GRbknt5xOKG4OJs55y+UZoMFEbE5HH+XdMEgYEcLnUNLuQzCwZ
	 7DotAIGnRZcylqYb8b4xaHFFnTqie0OGCeL6Q09zR1FusUM+nsQ0XM4MuZOf28pBTi
	 Vs3l7WowTe1dg==
Date: Wed, 28 May 2025 16:30:16 +0200
From: Lorenzo Pieralisi <lpieralisi@kernel.org>
To: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Cc: Marc Zyngier <maz@kernel.org>, Thomas Gleixner <tglx@linutronix.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
	Sascha Bischoff <sascha.bischoff@arm.com>,
	Timothy Hayes <timothy.hayes@arm.com>,
	"Liam R. Howlett" <Liam.Howlett@oracle.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Jiri Slaby <jirislaby@kernel.org>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH v4 14/26] arm64/sysreg: Add ICH_HFGITR_EL2
Message-ID: <aDcd+CyDORzgkfXK@lpieralisi>
References: <20250513-gicv5-host-v4-0-b36e9b15a6c3@kernel.org>
 <20250513-gicv5-host-v4-14-b36e9b15a6c3@kernel.org>
 <20250528122826.0000566c@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250528122826.0000566c@huawei.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250528_073026_056293_0A80AEE1 
X-CRM114-Status: GOOD (  18.13  )
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

On Wed, May 28, 2025 at 12:28:26PM +0100, Jonathan Cameron wrote:
> On Tue, 13 May 2025 19:48:07 +0200
> Lorenzo Pieralisi <lpieralisi@kernel.org> wrote:
> 
> > Add ICH_HFGITR_EL2 register description to sysreg.
> > 
> > Signed-off-by: Lorenzo Pieralisi <lpieralisi@kernel.org>
> > Cc: Will Deacon <will@kernel.org>
> > Cc: Catalin Marinas <catalin.marinas@arm.com>
> > Cc: Marc Zyngier <maz@kernel.org>
> 
> Hi Lorenzo,
> 
> > ---
> >  arch/arm64/tools/sysreg | 15 +++++++++++++++
> >  1 file changed, 15 insertions(+)
> > 
> > diff --git a/arch/arm64/tools/sysreg b/arch/arm64/tools/sysreg
> > index 0927754d9fe2c5addbd9693d83b7324f1af66d3e..d2f53fb7929c69895fe8a21ba625d058a844d447 100644
> > --- a/arch/arm64/tools/sysreg
> > +++ b/arch/arm64/tools/sysreg
> > @@ -3616,6 +3616,21 @@ Res0	1
> >  Field	0	ICC_APR_EL1
> >  EndSysreg
> >  
> > +Sysreg	ICH_HFGITR_EL2	3	4	12	9	7
> > +Res0	63:11
> > +Field	10	GICRCDNMIA
> > +Field	9	GICRCDIA
> > +Field	8	GICCDDI
> > +Field	7	GICCDEOI
> > +Field	6	GICCDHM
> > +Field	5	GICCRDRCFG
> 
> GICCDRCFG in the spec. (you have a bonus R)

Bah. Good catch - I should move to autogeneration.

> Of course the real question was what am I avoiding that made checking these
> against the spec feel like a good idea? :)

:)

> FWIW with that fixed,
> Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
> for patches 2 to 14.

Thanks,
Lorenzo

> > +Field	4	GICCDPEND
> > +Field	3	GICCDAFF
> > +Field	2	GICCDPRI
> > +Field	1	GICCDDIS
> > +Field	0	GICCDEN
> > +EndSysreg
> > +
> >  Sysreg	ICH_HCR_EL2	3	4	12	11	0
> >  Res0	63:32
> >  Field	31:27	EOIcount
> > 
> 

