Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DCBB5C44529
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Jul 2026 20:41:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6FyDVlIhYJarF3j5mg5Rdrj8kYPlrN1IEeGCY8y4YAw=; b=2EHnQHTsoPMSnSo1xylBhEHxeQ
	KnEZayIMXgT8+6HZLp48UEO7x/WixEdaAGnINttzXAt3PNYir/lcz9woUMlEEk9OdIJGZ2eEO2WnT
	xBnCekb5YMzMSQZ9N/AqBxdfFO3WaHx5NuNQsWt8VLvVdO6KJtaZY/g8TkGQYwwoOxFXBtl7gNrUn
	amRKeRODCYNW6eKyArdyDdyfmUHpbYsznYpsj39AWKM1YobcKO3JzdZBoGmRr97Bx4PqMmbrs1Ftp
	L/MI8JwB2s98E/zCqxKcCgzt8sckGiXVFe+s/R1ySYgoeK/DJsA19FKhWc3AvZOL4l3l33OpiQMCL
	H8YlS7Vw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wluni-00000007t4C-1Scg;
	Mon, 20 Jul 2026 20:41:22 +0000
Received: from mail-qt1-x832.google.com ([2607:f8b0:4864:20::832])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlunf-00000007t3a-3VuX
	for linux-arm-kernel@lists.infradead.org;
	Mon, 20 Jul 2026 20:41:21 +0000
Received: by mail-qt1-x832.google.com with SMTP id d75a77b69052e-51c15a5b265so850301cf.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 20 Jul 2026 13:41:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784580077; cv=none;
        d=google.com; s=arc-20260327;
        b=TA81t1B8iZUipQN18FKX5Zw476BcZV5SPaaQmBUIKdNw1ch2ECwcJXXAzDokOVz9J7
         NfnuoXn9Xcp5LOeDvV3pwyjKqWNE2bMYTZBOm95GF/MHB1FUMD8CQ+RuT1afumtUOuWT
         DvQSRO9w39YWK2ssdtj5zaiWGLzwYJr1EhMu/tvwv0PMvEkHnsfylL58qVdBy/rKGcyK
         DhBhUPr8xbHtC6zCF7QnLFFP0n49z5C795+nUYfoX7eKQjMEvWZKusjxYZInisrYWPyo
         VXRsvG1kxBP2ZuDPOAkiBSexfRrl2XS6p10nTbhdQgdL/enPMlxe6HKlonW8P+np8rAH
         9ryw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=6FyDVlIhYJarF3j5mg5Rdrj8kYPlrN1IEeGCY8y4YAw=;
        fh=/ce3783Pa3dvN3M8tDPTp/OdQMG8i95NdXHL1cjCEbA=;
        b=GU4wfg1Z6hl8gPMVA7ur/BKyvhWmdAptuVMw33PXC8gN6pleW3tqmRHnHR2rbWHV2U
         pVgKW2UAykxshHZbjXYybXeCpkbC7tOcu/afaWoZ0GpduyuM6AHzTf7AB2XLG3HYlJ6d
         wELJaRa6B6/sUOp1BmBRkTnR/aA6afCpoXjQZ56FLq4ZlnUMx2nu+rNo8rCecSCcLVIS
         YvXEvj/ul33yNFDg1/+fNwgF1Oway2ZVjjsNcEUO8SvNrAeXPVauWHBGQO/dGDKZtgSm
         bMCs+oXdVm5bZxwYId8mAL0dClhxBcsF9PxAwPspv/VoBUg99q1P6GBzTceWzJAC0r9n
         zR9g==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1784580077; x=1785184877; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=6FyDVlIhYJarF3j5mg5Rdrj8kYPlrN1IEeGCY8y4YAw=;
        b=r0kxK/IPBb8LfRhZft04adB1GVi+r7iixtQFZYHlY9MhyOFX/BQ34YMsqgCxgEUmf4
         2WoL8j6XuV7qef+sJrK6K0g4RBazB1T1hgZGreKMLHj84WUf1BoYtfph/BJjW93e8kld
         pLZlBiXpRBLC7THfsfsJ7coECo25zVolLSR+HPaT7hBAJFSzdc79jJFEs7y93wsAavRW
         twgu2GuYcDuLP4VfkakaAUWEpfTAgwh39Q2t2fyHLOoCO2EsNxRQZg7TpiJEHW4P4Pai
         HF8RNqfyuFm5qBjFsZNkHk1Skuwt0bbk+8O/uc3ZEupRUeBtXgPfL/x4rKXIeAzETu6l
         vPqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784580077; x=1785184877;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6FyDVlIhYJarF3j5mg5Rdrj8kYPlrN1IEeGCY8y4YAw=;
        b=Lzix2Gu9VnIcE1jrRcBGQyX5CswTnKnSZk48uWuGeRNXz7R3l/ZZn2z+A3hr49QaNI
         nK2/AZj6lk+0t4jnzLSWqiuvEfgeUTRZHxD41nlLdjKxFtMd4e7zk6eFvUaHMA4TTLGP
         q7ohbucvA4Gsd74YgGxZdwGqsi/7FHH5AdH3HNsieJBiXabRgkt6pf2Vz3tqn6sR9KsQ
         B6xar3mEEIiyBkOuzlmd2DCJPINPxlJliDSY2wYN3YiS2gw+dLSM/oalkBVKCWC/dqyP
         +rcc9F2bvJ/uO09HkJbkKyinhmk6rDDOztsrUEHQmK0LDQJfjF4RY8lWouCo1jhppaQF
         4lcg==
X-Forwarded-Encrypted: i=1; AHgh+RqDliQRhGFRcX8qSVPLkCmcXIqGFr/sUOfaZmP7QbauqeM6Gp7T0lAgt7GFbtPLao2N2Yh5KqXkhWJpCybUICC3@lists.infradead.org
X-Gm-Message-State: AOJu0Yxt6lxhr2eWIZaErudZfBBeYf3IuOWN0kKnUSXMZ+cdDGTd0rfN
	egZ54icAMkmI50vl9uvPyS/Wi628czt43pGpHSbWX8VKrYkqfDzXJWCf+JVdUwNQ4H6hoaqSlpN
	VnlrC6cuc80S9YolMCvaD/HhYoweC69DhPV6fLx7N
X-Gm-Gg: AfdE7clzMmWGUSrbEikXlfG9F2OhThSqunu/9M31rcw8rbuP8WVtx3oxm1AaUSH09G0
	1RypmQRoqSQFaKEqgaXY2hg69vmxOH3gjN2Ytp/JTTtxkCPbj1OvgWKjGW3osTKRzWxPym1tFed
	+nZkxtxasdjMrQ4EphtgWvY0GO20u7Mtc/1ubxyoFYqJmInzGZwy0WghEW5MmGc5aKvqQAsaHHj
	vv6ZSsKpCNyaL5fQ1rftySuWmlsiH58QVupmqI7yrIkvK5maDj9/XT+2c3Qq4XHJcSGlj5M6WSI
	cNZf1V6sFEfgTiwfsYs=
X-Received: by 2002:a05:622a:1818:b0:51c:ae6:a57 with SMTP id
 d75a77b69052e-52600a8412amr5684341cf.11.1784580076851; Mon, 20 Jul 2026
 13:41:16 -0700 (PDT)
MIME-Version: 1.0
References: <20260717130901.2239134-1-smostafa@google.com> <20260717130901.2239134-3-smostafa@google.com>
 <alqW49CH7eViDpAZ@kernel.org> <alvaEgJFJ5DaQaac@google.com>
In-Reply-To: <alvaEgJFJ5DaQaac@google.com>
From: Mostafa Saleh <smostafa@google.com>
Date: Mon, 20 Jul 2026 21:41:04 +0100
X-Gm-Features: AUfX_mwckn6GNC52bvXL7m2f_aD7LRnSayY1o19sXQxbCMxb4tBgy3W_t4EMWJY
Message-ID: <CAFgf54r0xYwUGgPMY=1aTRzcqX7jKp545Jb+p_yFW=JwAX0E4g@mail.gmail.com>
Subject: Re: [RFC PATCH 2/2] KVM: arm64: Support BBM level 3
To: Oliver Upton <oupton@kernel.org>
Cc: linux-kernel@vger.kernel.org, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, maz@kernel.org, seiden@linux.ibm.com, 
	joey.gouly@arm.com, suzuki.poulose@arm.com, yuzenghui@huawei.com, 
	catalin.marinas@arm.com, will@kernel.org, vdonnefort@google.com, 
	tabba@google.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260720_134119_890019_FC49BFE7 
X-CRM114-Status: GOOD (  26.86  )
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

On Sat, Jul 18, 2026 at 8:55=E2=80=AFPM Mostafa Saleh <smostafa@google.com>=
 wrote:
>
> Hi Oliver,
>
> On Fri, Jul 17, 2026 at 01:56:03PM -0700, Oliver Upton wrote:
> > Hi Mostafa,
> >
> > On Fri, Jul 17, 2026 at 01:09:00PM +0000, Mostafa Saleh wrote:
> > > If the system supports hardware Break-Before-Make (BBM) level 3, use =
it
> > > to replace stage-2 PTEs directly instead of falling back to the softw=
are
> > > break-before-make sequence.
> > >
> > > 1) Get a reference count on the containing table for the new PTE.
> > > 2) Atomically update the PTE with the new valid descriptor.
> > > 3) Invalidate the TLB for the old PTE.
> > > 4) Drop the reference count holding the old PTE.
> > >
> > > One interesting case, as BBML3 will update the PTE atomically, it
> > > can only know it raced with another core at the point of the cmpxchg
> > > failing, unlike the SW implementation which locks the PTE first.
> > > And as we must issue CMOs to the new mapped page before the update,
> > > that means with BBML3 racing cores will issue redundant CMOs,
> >
> > I'd rather we just predicate BBML3-style transformations on an
> > implementation having FEAT_S2FWB and DIC. You can definitely come along
> > later and enable it when using a stage-2 in an SMMU makes this
> > mandatory, possibly at the expense of some extra CMOs.
>
> Makes sense, I will do that in v2.
>

Looking into this, I see some existing inefficiencies (or maybe I do
not understand it well)
- pKVM still do some work for dcache with FWB I posted a patch for that:
https://lore.kernel.org/all/20260720203529.1276355-1-smostafa@google.com/

- KVM does not elide the icache maintainence with DIC, it seems we
should have something similar for the FWB check in
__clean_dcache_guest_page() as

diff --git a/arch/arm64/include/asm/kvm_mmu.h b/arch/arm64/include/asm/kvm_=
mmu.h
index 6eae7e7e2a68..d0a4ae66b069 100644
--- a/arch/arm64/include/asm/kvm_mmu.h
+++ b/arch/arm64/include/asm/kvm_mmu.h
@@ -247,6 +247,9 @@ static inline size_t __invalidate_icache_max_range(void=
)

 static inline void __invalidate_icache_guest_page(void *va, size_t size)
 {
+       if (cpus_have_final_cap(ARM64_HAS_CACHE_DIC))
+               return;
+
        /*
         * Blow the whole I-cache if it is aliasing (i.e. VIPT) or the
         * invalidation range exceeds our arbitrary limit on invadations by

or I am missing something?

Thanks,
Mostafa

