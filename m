Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8DEACA6004
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 10 Oct 2026 10:54:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=khKL+0SYs5dkK1+NiD4FsLQAnzmLgGQHJt1q1DjIuc8=; b=P53OJGCyxXwr7vbo8yysOHSDpi
	KaowtWq+gGbp4HCDWLz56IaEKclnBQ8sulEiBAYnU3s7lOJvD66p/injyAbNQFETJTjQUKXQoWTC3
	hIXsEE2lT2izr0KOf/y5QZCd8p/DqZximHS36v88MMM1ttMBWCtpXmCIvfHw8G1tdrcnI4OEIfm4K
	I93Cp2tgWzTFU5eIKhE45CCfrxUgA2QoPU9SzoFRkji3Q9nLzeih1pEfx9EaH81cLIdMJ4O7+vIOb
	er7T+co9yVK8K0h+VXuEks+P2S3TQHrtpC6/1+3Pmnd+zoDifqYYf5MtFlbFoPY2tRmjNA339/d+w
	P7mgDxTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFUij-00000007rZ9-1jjx;
	Sat, 10 Oct 2026 10:54:29 +0000
Received: from mail-pf1-x42d.google.com ([2607:f8b0:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFUig-00000007rYl-2r9n
	for linux-arm-kernel@lists.infradead.org;
	Sat, 10 Oct 2026 10:54:27 +0000
Received: by mail-pf1-x42d.google.com with SMTP id d2e1a72fcca58-887beafb714so208553b3a.1
        for <linux-arm-kernel@lists.infradead.org>; Sat, 10 Oct 2026 03:54:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791629665; x=1792234465; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=khKL+0SYs5dkK1+NiD4FsLQAnzmLgGQHJt1q1DjIuc8=;
        b=mv2qt3WkELc/a8dvon3drsLfdcxMkmQiUQ+fgCeA1/OSQ/lm7hLFR0FkH8M6DZlnWH
         MgsXgquM+Ah7hCIKWl9KzzUGXJSHnFawRfPoaKwoRlMnZPjCBtSUvMpEEfskATQXi67o
         4IdaA4guNOQmlMjS9Fbikkvm+ghQ1eh2fJZCKmoitI3cStN1/0XGKGFclLOfxFfEwHXH
         9Y6bI791Bjld8FMWU7wbQjVwo1On4LetWdyq9vcluuvp4VOzKqua3fnkOyDIrgFUSNEp
         P1p3zUPrpvcsttoYfnIJJGtR3mu6U61r57qgwkBPgQyI26b6iyQM0TxkLDdsNlCJqsvS
         pVWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791629665; x=1792234465;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=khKL+0SYs5dkK1+NiD4FsLQAnzmLgGQHJt1q1DjIuc8=;
        b=jBj0u4jqNEbnxJatzVy1sv3PIe42xa0yjopBtkaUgqIC+PWEvqzEJdzaiMyaQXQvZp
         W5ns1cyeN9xU65liySQiDSVTLkLiRyIq0bTYR4+/0Oqb/T4XVoAf9VfSAK2T1r7fbVUi
         ScTvf55DPPAktK2MAefPlNerh2Fh/0FdC5WcXLVJc4DfUvHrZchRKav/X8gDSK8O/ggX
         lq5+BWRV8/BbOxHo7UCbKkW5htKRt8K4hmT+1TXDDhrguxYiYpqixqD8U7AFRVcKDyXY
         6B3kn3bSlYbEXdwFau3inseJM3xFI+s49rXv3DJVcCgYsG4v17lcBN72+4fnDWtFIPUD
         Ye/w==
X-Forwarded-Encrypted: i=1; AKwUvBxt6S/XSj2xINbs08+fBSR0d383ypyXWb7ZT4I+Sei6dpcLItsViNRQX+adZM1eNiy+/tRwSOIV38V6LAJSOxNQ@lists.infradead.org
X-Gm-Message-State: AFq9FYI2eEWS7q8nTIAZWm9CmA7uxSGYc+47Ak85qWlfbAFqo40wowHN
	PYS/+lCygqoPG2z5wkR1p8gWqZpUZG+lpsCOIuy2h2RCOAuxd0mqe5hp
X-Gm-Gg: AYBFou1RueTj8ZaOo7k7NiV/XI3d3C2FU3eCiDfrolpErc8q56E+8H5W2DkVyZtG6u8
	5Anq1kLTTpW+D0kKnkub+qul7G+qLG15Q4MQ31apu8aadBVqRn4HBRORzrFmu5oKCQo4zFGEUG5
	yrjZJ/NXEHzkCbrEg3YSRpzip3Dsa5oGMnBJ18tbgh66uGvNVuAQOWE8/TwvYbVT2zV5KrhQ722
	WgBZ6XYu5Nnnu9uCCmV/mcelUmk8dr1Ix6fzfk9+JaQk0njVOJNUC3f9kXSRqawIa6LuAfjtMAA
	fzxAnT4wDKJ2Jzf6jZfFzjfxxw/fL5YFYlZ9lkaSw1rMm39im8gA0rMNLxUOMscrCeBhxkPvcu3
	oJckxJRVHtv16Fn3YKuVhjXUfs5GAApFDddxu2lhwvggp0gqVwZLA0+b8HOSaYVPCexo27lJHrm
	mEQj4F62sQRQ22f48WIrRBKKaN8hLsYkz61uhpLTRZFFFUnTYoMr1V+FWKRvkVrUFIHpCaABaVf
	UUzbj6nA5KeOIXGxZyzqgh+FvOsIWlVtwgZ676sgBDYGg==
X-Received: by 2002:a05:6a21:485:b0:3e0:de4c:71ef with SMTP id adf61e73a8af0-3e16bfcd468mr3602361637.58.1791629665376;
        Sat, 10 Oct 2026 03:54:25 -0700 (PDT)
Received: from macbookair (n114-72-148-25.mit21.act.optusnet.com.au. [114.72.148.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-896c4996be6sm2203965b3a.58.2026.10.10.03.54.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 Oct 2026 03:54:24 -0700 (PDT)
Date: Sat, 10 Oct 2026 21:54:16 +1100
From: Myria Sarvay <myrialsarvay@gmail.com>
To: Marc Zyngier <maz@kernel.org>
Cc: Michael Reeves <michael.reeves077@gmail.com>,
	Oliver Upton <oupton@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
	Yureka Lilian <yureka@cyberchaos.dev>,
	Fuad Tabba <fuad.tabba@linux.dev>, Joey Gouly <joey.gouly@arm.com>,
	Steffen Eiden <seiden@linux.ibm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
	Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>,
	Neal Gompa <neal@gompa.dev>, asahi@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] arm64: Apply existing Apple CPU workarounds to M3
 and M4
Message-ID: <asoZWBEEEsFD5Qrn@macbookair>
References: <20261008-apple-m3-m4-kvm-v1-0-7bb4cbf3d63b@gmail.com>
 <20261008-apple-m3-m4-kvm-v1-2-7bb4cbf3d63b@gmail.com>
 <86cxtk2utm.wl-maz@kernel.org>
 <CANpmGNv4uYRLALMLKZn-HJwTiqJO90Fx23DOO7K7d-PfSWn=2w@mail.gmail.com>
 <86bj932ssc.wl-maz@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <86bj932ssc.wl-maz@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261010_035426_760614_1961AAE1 
X-CRM114-Status: GOOD (  19.38  )
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

Hi Marc,

(Resending because I forgot to reply all, sorry Marc)

On Fri, Oct 09, 2026 at 09:16:03AM +0100, Marc Zyngier wrote:
> On Fri, 09 Oct 2026 01:03:57 +0100,
> Michael Reeves <michael.reeves077@gmail.com> wrote:
> > 
> > > I can provide the binary (and a few scripts) to test this easily.
> > > Should they have been fixed, we can always create a second
> > > implementation list to cover the PMU.
> > 
> > Can you please send that so we can try? That would be much
> > appreciated, thank you.
> 
> I've sent you (and Yureka) details over IRC. If you need help with
> setting things up, let me know directly.
> 
> Thanks,
> 
> 	M.
> 
> -- 
> Without deviation from the norm, progress is not possible.

I've tested the patches on my M3 Max (t6031-j514c), and without these
patches, it SErrors, and with them (and including the M3/M4 MIDRs in
the has_vgic_v3 list in arch/arm64/kernel/cpufeature.c) it doesn't
SError, and the iso boots correctly to a login getty.


