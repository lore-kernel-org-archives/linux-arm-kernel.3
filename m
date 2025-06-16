Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ECBE5C71136
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Jun 2025 11:51:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DSwEm24W8SRcEPES+PVXY22yNP6CQO6R62uX0oZAWPE=; b=RnfCaeTTELfLglfikxDP4/A2G0
	c3XzGqqvUVoJCttgb8rBOIANwFENitXBSKHq1WPbPYPdohZ+zw7iJ+0VAqj6FevvX82VYGazYG4dG
	dzpFztHufZFzMoJwdWDwJod4U/wcC529hcVTsKbrnZtyHs1C9xgJ57/R1VgRdFUOP508xGIsAUyDN
	7Ton6YOaCJLqsleByNGqho0DP5v5tEPy18keaxqHxtwQCxF+0kU4I6nV1+yJMy4D32Hw3Ol5VAEM0
	7O5kTK145YW0ci1XR8HbJyR8Pm5nKAAK/KGdhSM1UL2Jmce7JblyXw9BjIyDJIbswgPbAFX7IzASX
	Ol6tQnZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uR8N6-00000004Foy-2YEo;
	Mon, 16 Jun 2025 11:51:28 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uR7HB-000000045xy-2wzD
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Jun 2025 10:41:18 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id E5920A518A7;
	Mon, 16 Jun 2025 10:41:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DEB6BC4CEEA;
	Mon, 16 Jun 2025 10:41:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750070476;
	bh=pg18VEj3ZOXpTjNRyCe0pJvFJwwasJGT6wPYPZGNhSU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=U8PzwpYAvDvaIa7H1kNw9v61ca9f8UyaoWqOiWCr14p/pj0VRYYDKk/NL7ypvwgWF
	 Hdjp9nIqIgTS1GDoKSo4mLh9wr/IncyFNGWVkBnnVmWsInaTdPwISrakcvJtlxQW8Z
	 FBHrt2KNsPgl9LM75hIMTnsXvakjUusHfNfrthp68AsBUOtNPJC4NXX+og9QpN8kC2
	 HAm//f+0EZ0ggJ6xKQEC+Q2j27G3ghCOGxLKay0gVPOG8Rvpvw756AwQZ0TWlL3MFw
	 vkUnzXCf+HHnYY/KjmtHGIrikcbbtkm888u/qAOMalZTORXYBBymwfPjlSthf9ovr+
	 wwnzsS1ShO3eA==
Date: Mon, 16 Jun 2025 11:41:09 +0100
From: Will Deacon <will@kernel.org>
To: Luo Jie <quic_luoj@quicinc.com>
Cc: Markus Elfring <Markus.Elfring@web.de>, cocci@inria.fr,
	LKML <linux-kernel@vger.kernel.org>,
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
	Andrew Lunn <andrew@lunn.ch>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Joey Gouly <joey.gouly@arm.com>,
	Julia Lawall <Julia.Lawall@inria.fr>,
	"Kiran Kumar C.S.K" <quic_kkumarcs@quicinc.com>,
	Lei Wei <quic_leiwei@quicinc.com>, Marc Zyngier <maz@kernel.org>,
	Nicolas Palix <nicolas.palix@imag.fr>,
	Oliver Upton <oliver.upton@linux.dev>,
	Pavithra R <quic_pavir@quicinc.com>,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	Suruchi Agarwal <quic_suruchia@quicinc.com>,
	Suzuki Poulose <suzuki.poulose@arm.com>,
	Yury Norov <yury.norov@gmail.com>,
	Zenghui Yu <yuzenghui@huawei.com>, quic_linchen@quicinc.com
Subject: Re: [cocci] [PATCH v4 2/5] arm64: tlb: Convert the opencoded field
 modify
Message-ID: <20250616104109.GA17500@willie-the-truck>
References: <20250612-field_modify-v4-0-ae4f74da45a6@quicinc.com>
 <20250612-field_modify-v4-2-ae4f74da45a6@quicinc.com>
 <3537a4ce-b5e8-44d5-a884-70a81562068d@web.de>
 <94b40ff2-9e9e-4eea-8a66-87d8976aeb70@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <94b40ff2-9e9e-4eea-8a66-87d8976aeb70@quicinc.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250616_034117_812591_69E64F18 
X-CRM114-Status: GOOD (  18.22  )
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

On Mon, Jun 16, 2025 at 06:37:41PM +0800, Luo Jie wrote:
> 
> 
> On 6/13/2025 4:15 AM, Markus Elfring wrote:
> > I see further refinement possibilities for such a change description.
> > 
> > 
> > > Replace below code with the wrapper FIELD_MODIFY(MASK, &reg, val)
> > > - reg &= ~MASK;
> > > - reg |= FIELD_PREP(MASK, val);
> > 
> > * How do you think about to omit leading minus characters?
> > 
> > * Subsequent blank line?
> > 
> > 
> > > More information about semantic patching is available at
> > > http://coccinelle.lip6.fr/
> > 
> > I suggest to omit this information here (and in similar patches).
> > 
> > Regards,
> > Markus
> 
> Thank you for your suggestions. The current commit message was generated
> by the following patch mode command:
> ```
> make coccicheck MODE=patch COCCI=scripts/coccinelle/misc/field_modify.cocci
> V=1
> ```
> However, as I understand, the discussion on the ARM patches (between
> Russel/Marc/Yury) has concluded that the ARM arch changes may not be
> adding value over the current code, so I will drop the ARM patches
> in the next version.

Well, hang on a second. From what I can tell, the objections haven't
been specific to arch/arm{,64}/. You haven't really explained why this
new helper is needed and what value it brings over the existing set of
functionality.

So maybe start there, rather than dropping the parts that attracted the
comments to start with?

Will

