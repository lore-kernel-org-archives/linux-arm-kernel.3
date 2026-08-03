Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DAE10C55182
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Aug 2026 22:30:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3yTl9Y/o436Zlv2Vup2MQ3FRSTw8xGxoHxInk9rGis4=; b=bFkQVLB8DQ34qlezKaWFQMNBK4
	ucv4JAX5rozXCMOzuZYKwOFMaGAkdfRV00TBJCsMvq96/cpNuTOOE2dDFkHzEovVhsG8i/G2JsMJ8
	ml3jfYMy+XE+GMQPYUpxipxTkmGQp7hD/Jgnp8rrsP/Ucc+0iZd9PAIwBQhHJmvsKFa8KlxZrthXk
	bfl5ltO/vcghddsPQuCMJy8pbYU+Z/wcLOYGdN4aQN1mDMA/lyiS/H4dUzGNN/AND1So3G2p/GYIs
	HFRgHKs7EpmpIvVh8GZM4F9Wp0QnM+zANA5AGr209c/47imDLX3XTJXXNwqO78LmPDn6tF9uOWsFl
	6Nbd6Ghw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wr1Ah-00000000bVa-2Z6X;
	Mon, 03 Aug 2026 22:30:11 +0000
Received: from mail-qk1-x72b.google.com ([2607:f8b0:4864:20::72b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wr1Ae-00000000bTS-1dTX
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Aug 2026 22:30:10 +0000
Received: by mail-qk1-x72b.google.com with SMTP id af79cd13be357-92e50979c71so354985285a.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 03 Aug 2026 15:30:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785796206; cv=none;
        d=google.com; s=arc-20260327;
        b=W20pDPdwBoU+glLMMeTybre8xuSBcQ9mO0fiNk3uDRZR1PphOhjvGb/kWWn4S5Ztc8
         OQGHcmRprTXxLSvEA/ggkfIZIkLkg0pTMHalnneET0m0V4Z7lWeUAf+YSyF31QVW65Dy
         MajkxQJNUZ+L91SmfgDiGZLqYRNU8Oz+EoTT0i5oT9Q0z093gR0AzJgkUGTXqlOpbJs2
         J0yaGHJIUSAIfTrzDaEjbBwuQiNSVi0leKOv0GR5gfzPoNF9U3v6UIcFhnlcPSx/oxxx
         QqA1MaD64anoWuGegf2iMrAr5fYmYm8YSz0qX5K1ucAraYa+V2GLAIG8D1NGR8iSwumb
         Vy3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=3yTl9Y/o436Zlv2Vup2MQ3FRSTw8xGxoHxInk9rGis4=;
        fh=gUvJb5Y0OYzay82Xa6J/zE8AeaiJh6ZiRjbd92rAN+U=;
        b=luOKUuTuzbHhYDsYdKk8ZUUGlmAclyGkKWRRQthV8waKswWYy4npvJ5Fs/dhLcL9Oa
         RLmSfoZWGmo4/u2aI+SfvwqKtQs9lsbbSdKVAnG5nmlEVPlCCaYrquN8cx8kCHtxAX40
         OnTC+EQsq4rRQk8J9AUPKyfA2Qw2nhxRdL6D8FVd3fqQi+g05gw3Et5lg31C47BKd5Kt
         eeEdTAx7E0n5kw8d53R4zhBNcceYHY98+G1yK0F5mPofnsm6fUCVKMzcucom/Q5xY/H4
         FYmjLD2mIbUSfev/ndK+wlLOm9ra3JW4J25lVCs2hMuyesOPPM+poEBN/fFyatiC3zTP
         wgxQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1785796206; x=1786401006; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=3yTl9Y/o436Zlv2Vup2MQ3FRSTw8xGxoHxInk9rGis4=;
        b=GxRMRNBc/aE9qoG6anQ2VP6nnru7g0GJCCdK41DyTdXVBqxOtq0if2eCsNj2f3bqha
         UyO4n9oiHACyoHTtmGvlcVvjjryKRUIhO8netePbaqUZMcTlUmwqVDm/fzIgua7tyjV+
         VbXM7ArzQE0vYoAj85BAVmMiLpauc/3RTaKj1023HvnkLLIGqSYH4yMphtSnAzPQCDB2
         Z4Qx4coXvFLLk7DkN6I7SEj1xsyzXI49vJbKkXaGQrJ5zyWYBfsalyIXOE5W496HaVt9
         Czh24Uvw1QA0SShnRXcxK/oLnkdprLuCOvA+qhFJFJondP3GmRrhXMPcnIMh7+PjsjdY
         9FDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785796206; x=1786401006;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3yTl9Y/o436Zlv2Vup2MQ3FRSTw8xGxoHxInk9rGis4=;
        b=dox9Th+4SWW2qDfHd4tnOBQzU8WwyrtKQ2M5lszbkyFZ0HCNBD2OpoCfdBvT/tCJzu
         GcjMNt+7VA0uvx8yAlKsPhHDomjjVHOOTu7i+RzOZCCKxBHx60T0u9D3YqjiCFrxXM0X
         7AIAdZaIJK2nzxCNTBphwmGILJFeGt6/ksw/WA8Z+ZfwTUIXQ+pSNHOCGKkY9QNQ9Lop
         8mSsMT4FZcPLQwdKN5pUm0+kvnw9/0b6J5vSpNlgBMBcWMA4RE+/N34koBQ1SDTQkLu5
         egdinrENvN8cmE/qNmUI/eGRDdiJR5ZeWqEGhi0hMVVHndo/VC8K3etw37uVUyiSOEH8
         audw==
X-Forwarded-Encrypted: i=1; AHgh+Rr8Su8HUj/QIUuQcQryG2OOD8RgKZNXLRkCPjNQw8qRei3RIfKDaX5yJCQCTX21l88Bu+OWjUB0qrmeeBbQ8MmN@lists.infradead.org
X-Gm-Message-State: AOJu0YyCP2/sOnVTH36/hxOUQfn7KmwsiHy6cCgVQVDlTCLE9FS7jSN4
	Ttj0B9pv26dzA3yFwfdFde0Q6ZXr0ql8kTQHIuIC5Bq8gwWESh2FedsLWE892XJk/cfdZ8BCEk7
	SJMuIuLRLrd/Cax9xLbTp20WQ7QzoOHCyfmte956S
X-Gm-Gg: AR+sD10WrMJ+mFpu9kWmR8cljn5K7AuubRCNc4HrbDAJ10g48awGIHWUzdZ3Ga1MXPr
	k84Nkk075hJky7Au5lgsOu1CntpM7ir97UAxJt/oGi5VNHEZypgzv8ivKFzAV1cwbkpLhgeS6dp
	Tz6YOXKLmdNw2yInSCsX78ySLYih5cizrbO9i3zGpnQf+rZFAxeJS5m+UsOroiCHmMUHXybmXC+
	B04krEBFVlvEDL3G59ImKAzvMRnyitol1FXfhBzdPHQ+kLVSH+C8OGkhktU5wxpjNOIMV6H6M24
	+rh+DNyo6U9ePWgwQJflRI5Fob9pLkrr92CfC0VI7KZUPkKc2eO9SqhuyYfSy5tmo2aL0mmE/TL
	Dmg==
X-Received: by 2002:a05:620a:1788:b0:932:d92c:1604 with SMTP id
 af79cd13be357-934a093ee41mr1858091985a.23.1785796205213; Mon, 03 Aug 2026
 15:30:05 -0700 (PDT)
MIME-Version: 1.0
References: <20260803134403.80630-1-steven.price@arm.com> <20260803134403.80630-18-steven.price@arm.com>
In-Reply-To: <20260803134403.80630-18-steven.price@arm.com>
From: Alper Gun <alpergun@google.com>
Date: Mon, 3 Aug 2026 15:29:53 -0700
X-Gm-Features: AUfX_mzgu7kD5xmIyUYZ_YnVZsQj0adTFpMJoMddiEH4UKglz6_2Lo8CDB6wxAY
Message-ID: <CABpDEun3NPr7Na85pmOvdfYQ1DB-2nCcocsyDESXM15bzJU1og@mail.gmail.com>
Subject: Re: [PATCH v16 17/45] KVM: arm64: CCA: Tear down RTTs
To: Steven Price <steven.price@arm.com>
Cc: kvm@vger.kernel.org, kvmarm@lists.linux.dev, 
	Catalin Marinas <catalin.marinas@arm.com>, Marc Zyngier <maz@kernel.org>, Will Deacon <will@kernel.org>, 
	James Morse <james.morse@arm.com>, Oliver Upton <oliver.upton@linux.dev>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Zenghui Yu <yuzenghui@huawei.com>, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Joey Gouly <joey.gouly@arm.com>, Alexandru Elisei <alexandru.elisei@arm.com>, 
	Christoffer Dall <christoffer.dall@arm.com>, Fuad Tabba <tabba@google.com>, linux-coco@lists.linux.dev, 
	Ganapatrao Kulkarni <gankulkarni@os.amperecomputing.com>, Gavin Shan <gshan@redhat.com>, 
	Shanker Donthineni <sdonthineni@nvidia.com>, "Aneesh Kumar K . V" <aneesh.kumar@kernel.org>, 
	Emi Kisanuki <fj0570is@fujitsu.com>, Vishal Annapurve <vannapurve@google.com>, WeiLin.Chang@arm.com, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260803_153008_452938_9AA2F4BF 
X-CRM114-Status: GOOD (  15.39  )
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

On Mon, Aug 3, 2026 at 6:45=E2=80=AFAM Steven Price <steven.price@arm.com> =
wrote:
> [...]
> +static void realm_unmap_stage2(struct kvm *kvm)
> +{
> +       struct realm *realm =3D &kvm->arch.realm;
> +
> +       lockdep_assert_held(&kvm->arch.config_lock);
> +
> +       if (realm->stage2_unmapped)
> +               return;
> +
> +       write_lock(&kvm->mmu_lock);
> +       kvm_stage2_unmap_range(&kvm->arch.mmu, 0,
> +                              BIT(realm->ia_bits - 1), true);
> +       write_unlock(&kvm->mmu_lock);
> +
> +       realm->stage2_unmapped =3D true;
> +}
> +
> +int kvm_realm_teardown_stage2(struct kvm *kvm)
> +{
> +       lockdep_assert_held(&kvm->arch.config_lock);
> +
> +       realm_unmap_stage2(kvm);
> +       return realm_destroy_rtts(kvm);
> +}

Hi Steven,

I noticed a warning in dmesg when destroying a realm:

  [  158.533495] Call trace:
  [  158.535927]  kvm_destroy_realm+0x208/0x218
  [  158.540356]  kvm_arch_destroy_vm+0xc8/0xd8
  [  158.544439]  kvm_put_kvm+0x324/0x4b0
  [  158.548002]  kvm_vm_stats_release+0x1c/0x38

I traced this and found the following:

At this point, calling realm_destroy_rtts() may fail destroying the RTTs
because RECs are still active and the Realm is not terminated, but the
walk finishes and still sets realm->rtts_destroyed =3D true.

Later, kvm_destroy_realm() calls rmi_realm_terminate() and then calls
realm_destroy_rtts(kvm) again. But because realm->rtts_destroyed is already
set to true, it exits early without tearing down the RTTs.

Consequently, rmi_realm_destroy() is invoked while the RTT tables still
exist in RMM, which fails and triggers WARN_ON(rmi_realm_destroy).

The fix I used was to remove realm_destroy_rtts() from
kvm_realm_teardown_stage2():
--- a/arch/arm64/kvm/rmi.c
+++ b/arch/arm64/kvm/rmi.c
@@ -434,7 +434,7 @@ int kvm_realm_teardown_stage2(struct kvm *kvm)
  lockdep_assert_held(&kvm->arch.config_lock);

  realm_unmap_stage2(kvm);
- return realm_destroy_rtts(kvm);
+ return 0;
 }

I think we don't need RTT destruction here as it will be handled cleanly in
kvm_destroy_realm() later.

Thanks,
Alper

