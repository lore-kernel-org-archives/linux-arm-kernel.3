Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D7A2C0219D
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Feb 2025 18:08:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lP512jh6/P7PyHlGLlEdyRyOeCzvFzG5Z4L3Sl7a2ok=; b=eNtzKN/qmTkp7T8IzCwHCtXRrF
	eSStXGeDNC1MROUC2ff1DKk91JeU9aowEriWQfClMI9ArqgBLECHSL/joSAOa5j3r+EN8Os3NGS9z
	wieOXqNKk7c9FIJ9qyamdE2snmn8ZkhoBPpRwYUWVVaYVHDmEfDQ1yj8Dpz4mo2CXnukuVD8Ud3Z9
	LNlb1KZRKDBGbfHRtqWs8wmj7VHh8JnIHJWc/Z8TNrd/Xqsr5pp4TE02IKiGKtZd0EfNKwfb569a+
	WFucKiNNxtPQjdl8Tp2/kydk/Z4a7jPvWZmbqifFndLarLFn2XzXWAiU8nxmTVitvI+UKm+aGpWMR
	M+oERZ8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tgSmS-0000000Acl1-3xo2;
	Fri, 07 Feb 2025 18:08:44 +0000
Received: from out-175.mta0.migadu.com ([2001:41d0:1004:224b::af])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tgSht-0000000Abrl-46W5
	for linux-arm-kernel@lists.infradead.org;
	Fri, 07 Feb 2025 18:04:03 +0000
Date: Fri, 7 Feb 2025 10:03:55 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1738951439;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=lP512jh6/P7PyHlGLlEdyRyOeCzvFzG5Z4L3Sl7a2ok=;
	b=Wys31ZvmlScsSgLLqTvRzMIEwOGGNl420jFLRlljNH2OyqIoPgKzp/bVDGhfXO5+6P1FLU
	tYJYlUxSTt3J18jRdITFGrDRc/VmmRb2IMIa73wundFbb9ltI4DgggzCQkbGEJ6L2VqmLG
	DPtbIPrLTciteCxbAsEDClpGQjm7Mh4=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Oliver Upton <oliver.upton@linux.dev>
To: Marc Zyngier <maz@kernel.org>
Cc: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	Alexander Potapenko <glider@google.com>,
	Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>
Subject: Re: [PATCH 0/3] KVM: arm64: Assorted vgic fixes for 6.14
Message-ID: <Z6ZLC1v5KU-zzbQR@linux.dev>
References: <20250206152100.1107909-1-maz@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250206152100.1107909-1-maz@kernel.org>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250207_100402_157853_4D962907 
X-CRM114-Status: GOOD (  12.84  )
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

On Thu, Feb 06, 2025 at 03:20:57PM +0000, Marc Zyngier wrote:
> Alexander, while fuzzing KVM/arm64, found an annoying set of problems,
> all stemming from the fact that the vgic can be destroyed in parallel
> with the rest of the guest still being live.
> 
> Yes, this is annoying.
> 
> Fixing this is not going to happen overnight (though I have some
> ideas), but we can make what we have today a bit more robust.
> 
> This is what patch #2 is doing. Patch #1 is just removing a loud
> WARN_ON() that serves little purpose, and patch #3 fixes the actual
> bug that Alex reported.
> 
> Hopefully, none of that is controversial...

I'm a bit grumbly about slapping bandaids on the problem, but given the
fact that glider reported all of this a while ago and we still haven't
fixed it is enough to justify these patches. So:

Reviewed-by: Oliver Upton <oliver.upton@linux.dev>

-- 
Thanks,
Oliver

