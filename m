Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C35FCCF2DA
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 19 Oct 2026 08:50:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=smuPfukUTEhnLlad9GsBi0MdMFhYsr8EsSBrkOpeT54=; b=otp2ClM/7R73nqBRyCcZ+c7cCn
	BtDHR4EZE2ULyLR8XwcPRiPBQ8kMgv9HdKJHMALgmYlSzGoExjsWKv1G+hw0TkQBZbIFlQKpoWf5N
	FJHvo7u0JFSNsAK915AA/gynB/XN9NqRnADO376nQsYPqpKfpD4l+A0dz2boygcuEMm+sNyxka+Xf
	YjWaSCwyqUVA+vVLZOx4j4zOWh9t2ApbnqPN+tBnNXhuiZv+rP4yiLyvr/lrqjUgnIEiONF/omUcd
	YfYMqIJE0K0zJlKdgpe20CI8in4eRaLp+pT0mW0+W1YG+nthkh5R9v648Ie+TKHQETtp49koFKD2C
	JJ4e0z/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIj4t-00000006u6A-1P0e;
	Mon, 19 Oct 2026 08:50:43 +0000
Received: from out-226.mta0.migadu.com ([2001:41d0:1004:224b::e2] helo=mta0.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIj4p-00000006u5V-1FYM
	for linux-arm-kernel@lists.infradead.org;
	Mon, 19 Oct 2026 08:50:41 +0000
X-Envelope-To: linux-arm-kernel@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=smuPfukUTEhnLlad9GsBi0MdMFhYsr8EsSBrkOpeT54=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1792399835; v=1; x=1793004635;
 b=nQtSM5hJDilCN2C3nr+nHu2ITvicnygacSv5OmoqyusSx74ZA/CKV8J+wAR5w1tNH72QQw1Z
 j5SXLNa1RxjH6s5Bfu4xj3LceJcwT/qPuDg06rTfuaa7KCR7b8v4jpIAGVmdV4ich0YEU5lUWXT
 Vs0AUVDxfgrWq4qgNY18rqkw=
X-Envelope-To: linux-arm-kernel@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id f380d157883809a6;
	Mon, 19 Oct 2026 08:50:30 +0000
X-Mizu-Trace-ID: f380d157883809a6
X-Migadu-Flow: FLOW_OUT
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-5be3b2f17c1so6736e87.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 19 Oct 2026 01:50:30 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvByf0sGPjoPMNdr+x3JRmRxSGZTgHh86ahRdsXEWKz3FR0yTbi6wyKzlN1m7Lw16LFYDzwFhJ77dJvEpYHZz7r+3@lists.infradead.org
X-Gm-Message-State: AFq9FYKs5Yf3ZDSX4rGjoTWIBqTST50aU1dnKOjHoM6nceP4zQD1fN+y
	yD2NV3TjKWFXtKj0QYh+GRA9PLMrnpHfAYH9neCuurs/UgyIK1XXf/qVW0nu3XMpQDo2U09Gok9
	SZoyCigBQbOAKhdzIbHUQo4rifk1VZi8KiuGF64Gq
X-Received: by 2002:a05:6512:ace:b0:5ba:3602:4343 with SMTP id
 2adb3069b0e04-5be51d51c40mr121150e87.16.1792399829578; Mon, 19 Oct 2026
 01:50:29 -0700 (PDT)
MIME-Version: 1.0
References: <20261018080921.3942517-1-fuad.tabba@linux.dev>
 <8633u229lq.wl-maz@kernel.org> <CA+EHjTwHP7h_=e1s-iCDekMNvHGAQA3K1zv5v_4=PXQw9ueiFg@mail.gmail.com>
 <861p9m1709.wl-maz@kernel.org>
In-Reply-To: <861p9m1709.wl-maz@kernel.org>
From: Fuad Tabba <fuad.tabba@linux.dev>
Date: Mon, 19 Oct 2026 09:49:53 +0100
X-Gmail-Original-Message-ID: <CA+EHjTyDJ87A3e7tr6Q2UEvi9BRuuu5HQ90A_3VWaOFKnRmZkw@mail.gmail.com>
X-Gm-Features: AclHuK_GC1ojwYomVv0QIMlxdcqQYksqozcLWRejxdRqCJ0NJlVWgmqtZaSv6zY
Message-ID: <CA+EHjTyDJ87A3e7tr6Q2UEvi9BRuuu5HQ90A_3VWaOFKnRmZkw@mail.gmail.com>
Subject: Re: [PATCH v2] KVM: arm64: Only enable S1PIE and S1POE with the
 features they imply
To: Marc Zyngier <maz@kernel.org>
Cc: Oliver Upton <oupton@kernel.org>, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, Joey Gouly <joey.gouly@arm.com>, 
	Steffen Eiden <seiden@linux.ibm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Zenghui Yu <yuzenghui@huawei.com>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Mark Brown <broonie@kernel.org>, 
	Lorenzo Stoakes <ljs@kernel.org>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261019_015040_121429_24812AB0 
X-CRM114-Status: GOOD (  16.79  )
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

On Mon, 19 Oct 2026 08:31:18 +0100, Marc Zyngier <maz@kernel.org> wrote:
[...]
> > I'll send your patch as v3, rebased on -rc3 with you as the author,
>
> Please at least add yourself as a co-author.

Will do, thanks.

> > once I've tested it. I'm dropping v2's trap table changes, since
> > they're redundant once the ID registers are sanitised. I made two
> > changes to your patch. The sanitisation now runs before
> > kvm_init_nv_sysregs(), so the nested RESx masks are computed from the
> > sanitised values.
>
> Isn't that already the case? At least with kvmarm-7.4,
> kvm_vm_finalize_sys_regs() is called before kvm_init_nv_sysregs().

It is. -rc3 doesn't have Mark's split of kvm_finalize_sys_regs(), so
kvm_init_nv_sysregs() still runs there first. I'll rebase v3 on
kvmarm-7.4 and keep the call where you had it.

> > I dropped the res1 half, which isn't set by anything.
>
> I'd like to keep this, as it will eventually get used, just like the
> recompute loop is a bit useless for now, but will become useful in the
> future as dependencies get recomputed.

Ack.

Cheers,
/fuad

