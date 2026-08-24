Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68456C5DF94
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 24 Aug 2026 15:15:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2Lsvwk0HBXGTqj9EpGbXJ4HAkyrmqgCdWFetUf5pmqk=; b=ilPhQHPFKVych8DqIjFMIWUf4n
	0AYnrI57J0UPjYcdrteO4SZYn7NQpayaJngMKEl7Q02I6As/Q4B9KWFeQwDv+DUMPvsC5WPiI3NC8
	TM72zWzYDYl5tatcXVEh56RZ6naV4dSbRs61JMVvvlZN+GzZ0AN4xrDeTeE+dpCsILoTbxelxQzMy
	pPZfWjEm/7KBBxz56KMAtKEVEcnxFPGYObXD4XuytyXs3bHKHLRBYGDHKPAN1hwyTyT1gerN2BGtf
	hKVkx3atzpKx1mwDzudHZn3q6nxitpgD5BMijBQvhsndTruJe1btGGShJdPuNI3JN+ss1FaRBWB6i
	2+f00lkw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyWOc-0000000GtM6-2CCf;
	Mon, 24 Aug 2026 15:15:37 +0000
Received: from out-33.mta1.migadu.com ([2001:41d0:203:375::21] helo=mta1.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyWOV-0000000GtL2-3pdH
	for linux-arm-kernel@lists.infradead.org;
	Mon, 24 Aug 2026 15:15:30 +0000
X-Envelope-To: linux-arm-kernel@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=c06Gx503jxl6pcEkyyFWb7rMuvr9i6fZ7D0GH9SHlCw=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1787584523; v=1; x=1788189323;
 b=Ry7Yu3ZYXmvAejDifO6nVNevgszyvptiW0V9Z9BNV9Y9iCVxneQtvygxoUKz5aMw+JIbXcYf
 Osxzsh9UQFHzvfxcAjgsrjqh8n3YGsbziWnHsPCFG72RXdo0YGLAQMRQIzcw2b3bqkkeAQqAxpo
 xrYbwpWA5WISZXJV5/rISklk=
X-Envelope-To: linux-arm-kernel@lists.infradead.org
Received: from mail-lf1-f46.google.com (209.85.167.46)
	by smtp.migadu.com with ESMTPS id 348971528b6b59f6;
	Mon, 24 Aug 2026 15:15:23 +0000
X-Mizu-Trace-ID: 348971528b6b59f6
X-Migadu-Flow: FLOW_OUT
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-5b2a73da7e1so13027e87.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 24 Aug 2026 08:15:19 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+Rolm4HjulO2govvjUOAR1Se9UwYgVLICPhZ7Ue77S2p/bJTF7Po7gK2kPOiSZd6kG9P3HXsmpriIK9gGwb/RJPh@lists.infradead.org
X-Gm-Message-State: AFuF++ki+HlOQMxiJ/AfhIIwpeFTboJnX1/2asV7eWymte27ZkZSs+Ty
	VCHVYt2v+DaYGMdzSfNSOKiO88GvSuwS8WYLtMQWRe5XuS0UvIeeNmNBfB1+0FUQa6D/CxojsWJ
	9j5lOeFurB8v3D1Zjg1uqrkuw1INdJbItGAfvO6Qw
X-Received: by 2002:a05:6512:ad5:b0:5b2:8963:e5d4 with SMTP id
 2adb3069b0e04-5b48c308b7fmr281232e87.5.1787584518113; Mon, 24 Aug 2026
 08:15:18 -0700 (PDT)
MIME-Version: 1.0
References: <20260824071004.504894-1-fuad.tabba@linux.dev> <aoxCk5lFQv6lFwHQ@willie-the-truck>
In-Reply-To: <aoxCk5lFQv6lFwHQ@willie-the-truck>
From: Fuad Tabba <fuad.tabba@linux.dev>
Date: Mon, 24 Aug 2026 16:14:41 +0100
X-Gmail-Original-Message-ID: <CA+EHjTy6Xh=eNg22fBdjPzZOZitzvcDX2L5zbSUFCsX1n6XobQ@mail.gmail.com>
X-Gm-Features: AcwNN1XvpxGBrD3A5SrELJ33c_fc3D2mqO8UzqmTV8IHCn1exQF3tnUOLYiOz8g
Message-ID: <CA+EHjTy6Xh=eNg22fBdjPzZOZitzvcDX2L5zbSUFCsX1n6XobQ@mail.gmail.com>
Subject: Re: [PATCH v2] arm64: Defer the GMID_EL1 read to {init,update}_cpu_features()
To: Will Deacon <will@kernel.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>, linux-arm-kernel@lists.infradead.org, 
	Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Mark Brown <broonie@kernel.org>, kvmarm@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260824_081528_442950_61380F5B 
X-CRM114-Status: GOOD (  20.02  )
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

Hi Will,

On Mon, 24 Aug 2026 at 14:09, Will Deacon <will@kernel.org> wrote:

> > +     /*
> > +      * info->reg_gmid deferred to {init,update}_cpu_features because
> > +      * reading it traps to EL2 when MTE is disabled.
> > +      */
>
> I don't think we should defer this, as I've been actively doing the
> opposite for parallel CPU onlining (where the ID registers can be read
> concurrently by incoming CPUs to amortise the cost of a trap) and also
> for the RNG traps during early boot:
>
> https://lore.kernel.org/all/annJ0oDB2HObQC5j@willie-the-truck/
>
> If you look at the diff I sent in the thread above (I didn't get a
> reply), the idea is that __read_sysreg_by_encoding() reads from the ID
> register values stashed by cpuinfo_store_cpu(). So you could use that
> to check id_aa64pfr1 before reading gmid, as it will give you the
> sanitised view.

I just did, but I don't think it'll work. The thing is,
__read_sysreg_by_encoding() gives the override-applied local value,
not the folded sys_val.

arm64.nomte is a command-line override, so that works. But
CONFIG_ARM64_MTE=n sets none. Any gate would still need an explicit
IS_ENABLED(CONFIG_ARM64_MTE).

That said, I don't have to defer it. I can keep the info->reg_gmid
read in __cpuinfo_store_cpu() and gate that read on the state that
arms the trap:

        static inline bool gmid_el1_accessible(u64 pfr1)
        {
                if (!IS_ENABLED(CONFIG_ARM64_MTE))
                        return false;
                if (system_capabilities_finalized())
                        return system_supports_mte();
                return id_aa64pfr1_mte(pfr1);
        }


TID5 is set from system_supports_mte() and only once capabilities are
finalised, so the local check is still correct before that. Gating on
system_supports_mte() keeps the different-physical-CPU case you want
to preserve working: if one re-onlines with MTE while the system view
has it folded off, the gate stays false and it won't read GMID_EL1.

If you agree, I'll respin with that.

Cheers,
/fuad





>
> The only snag is that I didn't convert all the registers over, so
> there's some work there.
>
> WDYT?
>
> Will

