Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E7BBC61DB9
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Aug 2026 14:47:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0TFZjKRxbYc4+FJR8PgySJ9w/WGb5uGwbC5pPWd/UW0=; b=ew+kkfx/n57AsXGLNiRVnbHZYs
	qtcbnLtL0B+pitO7FvAXjaIsilMy82FsN7Grolq3yp5GP4jsRFF+hpAR08SEuHOuYwxlIPirjeO+U
	jSU8+ojnHfQbViMU7vk04w4ZCuzi5imPD+bITV5vOXuAqxShV1YVGLiOVtsioxKXaLIlLhahRb221
	0hysbJbClqPZXzeBCI09BsLRthWUQIpeXiZjAb55ZumD+4gW3DxM4mSkut4YbHE/l2+xZYvNWoGWW
	qZnCzx52mFnFvDwtbeq4LZomEgeoXXLtbUFwGL/xk0LWz6lYWaNE9a+1VJr4QvGR/9zk0yLvCGZRn
	gdA7NRvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wysQY-00000000zH9-3Njt;
	Tue, 25 Aug 2026 14:47:02 +0000
Received: from out-39.mta0.migadu.com ([2001:41d0:1004:224b::27] helo=mta0.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wysQV-00000000zGM-16uO
	for linux-arm-kernel@lists.infradead.org;
	Tue, 25 Aug 2026 14:47:01 +0000
X-Envelope-To: linux-arm-kernel@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=0TFZjKRxbYc4+FJR8PgySJ9w/WGb5uGwbC5pPWd/UW0=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1787669217; v=1; x=1788274017;
 b=KxRsBMg25p938ZnsFmhgHGnPbHK6L4s6Gzg3u3+oL7/S7OqYN6ud6ubKAGv6mvtApvWqct14
 Sj+n++dkYib3bgvFqc02WWZuevuUBq58ADh1skLO7t1gHaYJLK0Wj1XjaI7XLz8tbvtuh30yWbL
 8fW3wyLfQ8iF5JmJYgWZ4A38=
X-Envelope-To: linux-arm-kernel@lists.infradead.org
Received: from mail-lf1-f44.google.com (209.85.167.44)
	by smtp.migadu.com with ESMTPS id acc2b70974c29dc7;
	Tue, 25 Aug 2026 14:46:57 +0000
X-Mizu-Trace-ID: acc2b70974c29dc7
X-Migadu-Flow: FLOW_OUT
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-5b2a73da7e1so4567e87.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 25 Aug 2026 07:46:52 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RrqvTJq3Ltva3DnPz+F1mavivmPcB07vDdK7mcZzC4TDh3OYucB24z7xC37os/YzYT2jAhwBaQK1cZTcPwn2Pow@lists.infradead.org
X-Gm-Message-State: AFuF++k2sKqvpiRi+hxp4hjmcnnk7mWsj24lvMxpAPzerv/XW3j/STki
	U/G9r5uTM97bpjkN9+ErGb+M4QFXuNUvB0lFJRdbCpdGQx1Lgl5YkgAXEZhaqYLw9308+WnCrxX
	PxJPhwbW4D0cfBx32mi7Qktl8GaadQ0OQd9yXOTZR
X-Received: by 2002:a05:6512:3049:b0:5ae:cf5f:4a88 with SMTP id
 2adb3069b0e04-5b49de6a523mr92553e87.8.1787669211662; Tue, 25 Aug 2026
 07:46:51 -0700 (PDT)
MIME-Version: 1.0
References: <20260824184155.2644646-1-fuad.tabba@linux.dev>
 <aoypji6EJ8zToWvh@arm.com> <CA+EHjTwueqEAVq-7_ioRN+1h3LNPAqHX3rTqbXODViJJM-D_pQ@mail.gmail.com>
 <ao2jNDv8tOjnimEH@willie-the-truck>
In-Reply-To: <ao2jNDv8tOjnimEH@willie-the-truck>
From: Fuad Tabba <fuad.tabba@linux.dev>
Date: Tue, 25 Aug 2026 15:46:15 +0100
X-Gmail-Original-Message-ID: <CA+EHjTx93ERXZV1visdfBOGtH7wHff6TAoeJe+pNtikPrRp8Qw@mail.gmail.com>
X-Gm-Features: AcwNN1UXT1Fu6A7fHijzE1Tq--IpkMbS8FLzylOjcibifcf5PlkAtmwgTVzAKGk
Message-ID: <CA+EHjTx93ERXZV1visdfBOGtH7wHff6TAoeJe+pNtikPrRp8Qw@mail.gmail.com>
Subject: Re: [PATCH v3] arm64: Don't read GMID_EL1 when MTE is disabled
To: Will Deacon <will@kernel.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>, linux-arm-kernel@lists.infradead.org, 
	Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Mark Brown <broonie@kernel.org>, kvmarm@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260825_074659_448961_D7526E40 
X-CRM114-Status: GOOD (  19.77  )
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

On Tue, 25 Aug 2026 at 15:14, Will Deacon <will@kernel.org> wrote:
...

> > Agreed it's separate, but v3 applies the override without checking
> > that the CPU has MTE2, so id_aa64pfr1.mte=2 on a CPU without it reads
> > a GMID_EL1 that isn't there. On the boot CPU that's before the
> > override is sanitised. Should I check the raw register before applying
> > the override, until the clamp lands?
>
> At which point, why don't we bite the bullet and implement Suzuki's
> idea so that __read_sysreg_by_encoding() does what you want more generally?
>
> https://lore.kernel.org/all/afc5bd00-28ca-413b-b047-ee53589c285d@arm.com/

v4 will be two patches: Suzuki's clamp first, then the GMID_EL1 gate
on __read_sysreg_by_encoding().

>
> > > If you are worried about additional trapping of the MRS, we should go
> > > for Will's improvement to always read the cached values in
> > > __read_sysreg_by_encoding().
> >
> > Not worried :) __cpuinfo_store_cpu() has already read ID_AA64PFR1_EL1
> > a few lines up.
>
> But if you go with __read_sysreg_by_encoding() then you'd still be
> reading it (and trapping) twice, no?

It would, and I'm fine with that on a CPU bring-up path.

Stay tuned!
/fuad
>
> Will

