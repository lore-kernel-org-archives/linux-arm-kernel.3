Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 738A2CA5FA5
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Sep 2026 14:47:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PaHoAXPcrpcqQeGw4Tb6R83pqd8LYLw0tH22EeiqQ8E=; b=i2Iv76URumh6EsFvo1iOxRN9ep
	rnzy4Cctcr6IwzUoWS0ebz3z1+bwMUDF2Ii60niKRQXk9I5LaJY2m42OAIR39FGzXiwiz6+Hw9Tu1
	fYY19Cl4Pc9opez0PEO9XgkCYPm8IyVP0OTl4o/Qd+BoykldUBofPcJwoBEnJM5TjwkiA5PFCGQlL
	1xWf7jSQUByHNkzj62qVxvGD78Uann/6asBC7TKl5qExegz4PdOiwRdxHUOXjKUy/HrrbCVXaLxNA
	P3WvMxDZ0VK0k08FpyXq5ixCpgj7gn04ahrerLEzT4t55V/AmKPXIOvLC/EuwFTDDUaaNBSrtpFB7
	UgBs7sAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBZ76-00000003pvM-18uH;
	Tue, 29 Sep 2026 14:47:24 +0000
Received: from out-249.mta1.migadu.com ([95.215.58.249] helo=mta1.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBZ70-00000003pt6-2CHi
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Sep 2026 14:47:22 +0000
X-Envelope-To: linux-arm-kernel@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=PaHoAXPcrpcqQeGw4Tb6R83pqd8LYLw0tH22EeiqQ8E=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1790693236; v=1; x=1791298036;
 b=Nr9eG/tBnA6IIuORUPI+mgplgEfTQv47TqtFfyvbHUzoVzEPAJzpI2/7cS84HNhjbZbeuRlh
 FgxRfDxjd685WffdFRangeHIK5v4iX5U+z5wqILpi0wzrce3amN9Yv8rJFdBTYIwqNjt5xvU2PL
 FQZywHjWvOEXcVKn/e8uXOJ4=
X-Envelope-To: linux-arm-kernel@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id aed3d115a5819b02;
	Tue, 29 Sep 2026 14:47:16 +0000
X-Mizu-Trace-ID: aed3d115a5819b02
X-Migadu-Flow: FLOW_OUT
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-5b8ea0ca5baso8721e87.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 29 Sep 2026 07:47:11 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvByhiz2fs9fwvxC0uLzsGuF6ERnKPlfD8NnQRIhCqVIZ17IyW8v20BPuQ+ahTaXqMuf61hHan+osfY34ZyHd53Xt@lists.infradead.org
X-Gm-Message-State: AFq9FYLurXxhF422fMV/qIzJxZ6RyZVK/4FbSWACcZfEyMaGDnicDfmN
	pSEl9ce0KobRZgpn7RYtxZUdbuk+pkNP96mlNNyRHPXc2632p/sDsU4n/5h15njkaIwKIGXPCHt
	VLXmzfFZlwn3/dfhJvhZLHncWCP3cwvFkZ9g0HJmD
X-Received: by 2002:a05:6512:4015:b0:5ba:3797:2359 with SMTP id
 2adb3069b0e04-5ba37972460mr33642e87.2.1790693229297; Tue, 29 Sep 2026
 07:47:09 -0700 (PDT)
MIME-Version: 1.0
References: <20260929093548.3598547-1-maz@kernel.org> <20260929093548.3598547-2-maz@kernel.org>
 <CA+EHjTwZSFUZmavbB4tE-eFxHg9WF80CA230EwvynuNcZQ0prg@mail.gmail.com> <86a4p0403b.wl-maz@kernel.org>
In-Reply-To: <86a4p0403b.wl-maz@kernel.org>
From: Fuad Tabba <fuad.tabba@linux.dev>
Date: Tue, 29 Sep 2026 15:46:33 +0100
X-Gmail-Original-Message-ID: <CA+EHjTyuXSLw8kfRu4QB5+UdrTzc=LVQdWs+SHPvGA1NS-wySQ@mail.gmail.com>
X-Gm-Features: AclHuK-PJma5Gz1v-jtnuLZMTzpONJmBik9WyxHWow9PmByLldd07rhmiNwGARY
Message-ID: <CA+EHjTyuXSLw8kfRu4QB5+UdrTzc=LVQdWs+SHPvGA1NS-wySQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/7] KVM: arm64: Move OUTSIDE_GUEST_MODE publication
 past context being saved
To: Marc Zyngier <maz@kernel.org>
Cc: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	Steffen Eiden <seiden@linux.ibm.com>, Joey Gouly <joey.gouly@arm.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Oliver Upton <oupton@kernel.org>, 
	Zenghui Yu <yuzenghui@huawei.com>, Yuchao Zhang <ndaugoing@gmail.com>, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260929_074719_067307_612C6192 
X-CRM114-Status: GOOD (  18.08  )
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

On Tue, 29 Sep 2026 15:13:28 +0100, Marc Zyngier <maz@kernel.org> wrote:
[...]
> However, there is a problem if cmpxchg() fails, as there is no
> ordering in that case, and I'm not sure the smp_mb__before_atomic()
> saves the bacon in that case. It feels we'd need an acquire
> somewhere, a bit like this:

It doesn't save the bacon. I ran it through herd7 with the LKMM, the
fold walk in vgic_v3_fold_lr_state() against the list_del() in
vgic_flush_pending_lpis(): with smp_mb__before_atomic() and a failing
cmpxchg(), the walk can see the list_del(). With your
smp_load_acquire() it can't.

[...]
> We need a release so that we know for sure that any state stored
> before is visible by the time we can observe OUTSIDE_GUEST_MODE, and
> WRITE_ONCE() doesn't provide that (it can be reordered).
>
> I don't see what taking a lock changes to the ordering requirement.

The fold walk takes no lock, so the locks on the halt side don't order
it against the list_del(). herd7 agrees: WRITE_ONCE() with your
acquire can see the list_del() again.

[...]
> I don't understand what sashiko is trying to say, but this is clearly
> missing from the patch, see below. Not sure how I missed that one.

I don't understand Sashiko half of the time either :) That said, the
diff looks right to me.

Cheers,
/fuad

