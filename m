Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8345C9830E
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Sep 2026 10:28:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=l8wslZqsYjoUhW8BVyXUXs6u/mOGOCtbqiMACO0PwU0=; b=CxZdEQUlj4u5AyMyAtyh3Qy0bP
	VaD5UDC3Zj65hUbVl/p552PvMA/QtpbWG5sSdKIaQ9421fHcG40D+o3+uMqUSbpkKoMgzqSpPZLrO
	Hgp2ZTuUY+OOtLMXA8qD3250RhJ+BC9fjCs4KwBz9lAHfNS42fWfILhFVGYqCMZtPjVPQOJP9L8JV
	7kaNMVSzZIMFopMUjgZ0RfJ9AJDBseeJQrjk8qKH7snxCmctwKvsDICgpxcjqrirEXb3QpG1PZIDF
	B/NpYiQCpbGOtkZghrceBRtw65r1aLu0EnwTK9H/7Ra1IyKn7VJ/ESYh9GTavAM65MSglc+Frv7bL
	+lKuHFlA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9ggr-0000000AjU7-3Ju1;
	Thu, 24 Sep 2026 10:28:33 +0000
Received: from out-60.mta0.migadu.com ([2001:41d0:1004:224b::3c] helo=mta0.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9ggo-0000000AjTI-3CJs
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Sep 2026 10:28:32 +0000
X-Envelope-To: linux-arm-kernel@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=l8wslZqsYjoUhW8BVyXUXs6u/mOGOCtbqiMACO0PwU0=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1790245708; v=1; x=1790850508;
 b=xbdjO9LLfLhqUeiVlIg/TLsrreUWEE9thGYkLsmaevmpAp4LwWYiJcCujVjAnrmkKmhmxcQp
 K2q83jUcHDEcXCcV7i4aLio/xzwZv6PDKm8OoW2BNyqGUyq/aQAgUkKdsX1TROocMWPgo0U6rLb
 ccvGnHkrIIfHg/BYG3MrXWnk=
X-Envelope-To: linux-arm-kernel@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id f31ef528903e6d0b;
	Thu, 24 Sep 2026 10:28:28 +0000
X-Mizu-Trace-ID: f31ef528903e6d0b
X-Migadu-Flow: FLOW_OUT
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-5b778bdb5b8so5176e87.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 24 Sep 2026 03:28:28 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvByrbUiN98HaKpbbYoHlgP3zanbkQqVwP9KxhtImNXMh3z5jahN0nJQmfFqcvCHMsLtB4gxAJQT0kuA85RPxzNhd@lists.infradead.org
X-Gm-Message-State: AFuF++lQY5L94HjqkDZwc/UOI0eSONVb659dVOvBKJn5vpvloiJtfK4H
	fWGNKzzew4A8VNVQqPzEzslwCpq0pYODsEpbOZxEwtMUBNaALz+4i/5D/IzjOiFacz92NHzqux7
	tLXnoc6Fd1RTADgNt0mavJVY8TTRffz/sMjE+gLW6
X-Received: by 2002:a05:6512:2249:b0:5b8:c95d:529c with SMTP id
 2adb3069b0e04-5b8dd6d373cmr194835e87.0.1790245707622; Thu, 24 Sep 2026
 03:28:27 -0700 (PDT)
MIME-Version: 1.0
References: <20260911104715.307500-1-fuad.tabba@linux.dev> <868q5579ol.wl-maz@kernel.org>
 <CA+EHjTw0U0d91Cv4NYEJvUuT=JabwZeeYwpZ2P1xyVeOVX46Ew@mail.gmail.com> <arT5r6Tqg9PnSYLz@willie-the-truck>
In-Reply-To: <arT5r6Tqg9PnSYLz@willie-the-truck>
From: Fuad Tabba <fuad.tabba@linux.dev>
Date: Thu, 24 Sep 2026 11:27:51 +0100
X-Gmail-Original-Message-ID: <CA+EHjTwKd=0kY1vxmZZ3Wk3iDcVnrdz9fPXekzr=y7eRwUYKaQ@mail.gmail.com>
X-Gm-Features: AclHuK9f1UKfVBh-sHVCnHRjsiBkOb4-h4MYma9pM03DKGJaXn8h00-d7nViPT4
Message-ID: <CA+EHjTwKd=0kY1vxmZZ3Wk3iDcVnrdz9fPXekzr=y7eRwUYKaQ@mail.gmail.com>
Subject: Re: [PATCH v3] KVM: arm64: Trap guest MPAM accesses whenever MPAM is implemented
To: Will Deacon <will@kernel.org>
Cc: Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>, 
	Catalin Marinas <catalin.marinas@arm.com>, James Morse <james.morse@arm.com>, 
	Ben Horgan <ben.horgan@arm.com>, Xi Ruoyao <xry111@xry111.site>, 
	Mark Rutland <mark.rutland@arm.com>, Joey Gouly <joey.gouly@arm.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Zenghui Yu <yuzenghui@huawei.com>, 
	Steffen Eiden <seiden@linux.ibm.com>, Gavin Shan <gshan@redhat.com>, 
	Yuan Yao <yaoyuan@linux.alibaba.com>, linux-arm-kernel@lists.infradead.org, 
	kvmarm@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260924_032830_949608_4CC4B65C 
X-CRM114-Status: GOOD (  13.40  )
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

On Thu, 24 Sept 2026 at 11:21, Will Deacon <will@kernel.org> wrote:
[...]
> > I'll probe MPAMIDR_EL1.HAS_HCR once in cpu_hyp_init_context(), next to
> > HAS_MPAM, and test the flag in both trap functions instead.
> >
> > I'll hold off on v4 until Will has had a chance to comment as well.
>
> I'm planning to generalise the logic you added recently in
> gmid_el1_accessible() so that __cpuinfo_store_cpu() stores the values
> in 'struct cpuinfo_arm64' with the overrides already applied. I don't
> think that directly impacts this patch, but it should make the general
> shape of things easier to reason about. I also need it for the parallel
> hotplug work.

In that case, I'll respin this as Marc suggested.

> If you fancy helping with that, please let me know.

Sure! Just let me know how I could help.

Cheers,
/fuad

> Will

