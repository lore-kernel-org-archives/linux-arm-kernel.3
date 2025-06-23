Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1E12C7115B
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Jun 2025 08:59:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=r16EnTRqICp2s4o/VmEbqOJZDlq1jQbD4/5SrPKHiGk=; b=mYHZ6KZvV9EXul1uyGHpbYTm7n
	wCfqP7zEQ5ZlSM9o3PZYsdJHRlJQPGgYysjbyr5QctDkVgW9+ZYfsOGzvglQQoXI+mroBEWBGCVwC
	z0psXMgnDDhWT6AT3mmRAxKVR1hPeK2ZQLNFcLVYdlyES2oz7BofrjaJuX7FjlDCCgNOqnZfJA1rr
	wfhTBdcbfFNvnLurEnABqWva4p0/w4bL5ISR7aBznzUWU74ROnHHzt+ygEmnvWPWUVjGq2ITtoB3V
	N8LmOatLxbKzgA0VGL6IagtY9Kc/Iw5wBFYv+7wI/mJlDqJ5I1wM9GBOXSMyGRK1GyzlJbVD3dPol
	Qp2rYkRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTd13-000000025QU-0Mth;
	Mon, 23 Jun 2025 08:59:01 +0000
Received: from out-171.mta0.migadu.com ([2001:41d0:1004:224b::ab])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTcjf-000000021wP-210u
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Jun 2025 08:41:09 +0000
Date: Mon, 23 Jun 2025 01:40:46 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1750668060;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=r16EnTRqICp2s4o/VmEbqOJZDlq1jQbD4/5SrPKHiGk=;
	b=vXhgy8BI2eQT3nYZFNPvge0v3pNI+5OHueB5YbHaYwCW+TT9AQHY0yJHWTYeBTTKK+bXVc
	oi5EsbsszqVgdBVJtFUje6uy4RYpnmR43FqwM9HnWzxpkObe9VzrsPqZmevtpEJmO2Wy/Y
	zdyKSvNt+gzmZ8O3Ny3eRiR0q/supVI=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Oliver Upton <oliver.upton@linux.dev>
To: Marc Zyngier <maz@kernel.org>
Cc: Raghavendra Rao Ananta <rananta@google.com>,
	Mingwei Zhang <mizhang@google.com>,
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
	linux-kernel@vger.kernel.org, kvm@vger.kernel.org
Subject: Re: [PATCH v3 3/4] KVM: arm64: Introduce attribute to control
 GICD_TYPER2.nASSGIcap
Message-ID: <aFkTDmj9u1ERnvHO@linux.dev>
References: <20250613155239.2029059-1-rananta@google.com>
 <20250613155239.2029059-4-rananta@google.com>
 <87frftfpg7.wl-maz@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87frftfpg7.wl-maz@kernel.org>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250623_014106_180983_5D67092A 
X-CRM114-Status: GOOD (  15.43  )
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

On Sat, Jun 21, 2025 at 09:50:48AM +0100, Marc Zyngier wrote:
> On Fri, 13 Jun 2025 16:52:37 +0100, Raghavendra Rao Ananta <rananta@google.com> wrote:
> > @@ -683,8 +714,14 @@ static int vgic_v3_has_attr(struct kvm_device *dev,
> >  			return 0;
> >  		case KVM_DEV_ARM_VGIC_SAVE_PENDING_TABLES:
> >  			return 0;
> > +		default:
> > +			return -ENXIO;
> >  		}
> > +	case KVM_DEV_ARM_VGIC_GRP_FEATURES:
> > +		return attr->attr != KVM_DEV_ARM_VGIC_FEATURE_nASSGIcap ?
> > +		       -ENXIO : 0;
> 
> Do we really want to advertise KVM_DEV_ARM_VGIC_FEATURE_nASSGIcap even
> when we don't have GICv4.1? This seems rather odd. My take on this API
> is that this should report whether the feature is configurable, making
> it backward compatible with older versions of KVM.

So this was because of me, as I wanted nASSGIcap to behave exactly like
the ID registers. I do think exposing the capability unconditionally is
useful, as otherwise there's no way to definitively say whether or not
the underlying platform supports GICv4.1.

KVM_HAS_DEVICE_ATTR can't be used alone for probing since old kernels
use GICv4.1 but don't expose the attribute.

Does that make sense?

Thanks,
Oliver

