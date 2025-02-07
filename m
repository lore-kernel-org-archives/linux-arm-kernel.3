Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C1D5C02194
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Feb 2025 18:13:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZolRaIlCgaZRdZ2y7P6BoM5Dq+0ObR3jHsmtYgVaSNI=; b=HdaIJmQlDYcQsCBlHusZPGmgkl
	l+/rzW04NT2sExLrvyHuEY8TsIazq4UfCXl0e3jhmmpqwWvj0hYC2rZ7pmtyqecln8eL54GK/6IUm
	WWQrYkv77Oiv3Ygwc3UIDBTwmSV+iCIFp9LMEw70aPNW8YUlu8qk3+JAZcSzsvQjCU8jLJwKOLhmU
	gYnmiARoq8BPAzSbpj8iSC8IVR8kBgnpmXhnrFjwqksgo3wxIhPtO8YxbVyOWAJWlDlPF6bnvJd5d
	EeWOBcejHQ5QzJw/v9TcosUHa5wD758UxI62OUDbTwaSUCziBWfW0TdnZvX305iTvvdsi7D+gwxir
	sdkQau4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tgSqf-0000000AdvC-07Ks;
	Fri, 07 Feb 2025 18:13:05 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tgSnx-0000000AdNj-22uE
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 07 Feb 2025 18:10:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=ZolRaIlCgaZRdZ2y7P6BoM5Dq+0ObR3jHsmtYgVaSNI=; b=SyqEht+hBOH5oNElya5qOsFAH8
	UHV4GxI8y96WmCpGi96mCwb9pzkqqaUZfC5I43MNOlmdNZ4CmOMQUylKD2vhEOmDmEbLBpOosGbAz
	RqcjQ5SoWCWgaCe2IQXv8CxbF1ZhQ1Ywrw8r3GtggJcIc50iuOBrgftQrZr3a6YcSyf7ZjqGkOwgJ
	5W+vPaPkwknddbX3QVB5NZbXw5WwBdKq84h6Ju75+EoPSvj8hUnBaSOOU/Q2U9+0qvVrEHYKztN1G
	PPsKt0JP8Cnzu/ztnfegrrQ8PWsAAL8rxMdrFiGRMdQ+7YKCWX4Boqg7oYzy9uz/ot/AM+cAvDUn4
	lIXyVApQ==;
Received: from out-172.mta0.migadu.com ([2001:41d0:1004:224b::ac])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tgSnu-0000000HHW1-25wQ
	for linux-arm-kernel@lists.infradead.org;
	Fri, 07 Feb 2025 18:10:16 +0000
Date: Fri, 7 Feb 2025 10:09:58 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1738951803;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ZolRaIlCgaZRdZ2y7P6BoM5Dq+0ObR3jHsmtYgVaSNI=;
	b=DBeVwjXjnPTYpQs6Lq9Mvygma9/LdKK5EEukS36yscCrnbkZZcopW5h0QH0FR9304mEJVg
	Xlr/eeKMf+3R0mb40Kic+82+T0Sp+HGlGTQFnlHe2KBXWxMaPSOoRxAfoJk472uVfK3Kh2
	TQvD3khEOYtwiOiOb/dYlH+PWd6e21k=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Oliver Upton <oliver.upton@linux.dev>
To: Marc Zyngier <maz@kernel.org>
Cc: Eric Auger <eauger@redhat.com>,
	Ganapatrao Kulkarni <gankulkarni@os.amperecomputing.com>,
	kvmarm <kvmarm@lists.linux.dev>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	christoffer.dall@arm.com, suzuki.poulose@arm.com, will@kernel.org,
	catalin.marinas@arm.com, coltonlewis@google.com, joey.gouly@arm.com,
	yuzenghui@huawei.com, darren@os.amperecomputing.com,
	vishnu@os.amperecomputing.com
Subject: Re: [PATCH] KVM: arm64: nv: Set ISTATUS for emulated timers, If
 timer expired
Message-ID: <Z6ZMdv8jJUvYwQzT@linux.dev>
References: <bcb4289b-507c-4ea1-afc7-6febd34d88db@redhat.com>
 <86y10osr19.wl-maz@kernel.org>
 <4d443db1-85b1-4071-acd5-3187deb9cb17@redhat.com>
 <2f6b2cb1-3d32-480a-9801-9b993ae74e2d@os.amperecomputing.com>
 <152d262e-641d-4bb1-9656-a13e049d62c4@redhat.com>
 <86h661wje4.wl-maz@kernel.org>
 <4a9fbdd9-ad23-44bc-8ba5-399f08068db4@redhat.com>
 <86cygpwfy0.wl-maz@kernel.org>
 <b22d5916-8b55-43bc-a256-2136d66ad25f@redhat.com>
 <86frkptzr6.wl-maz@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <86frkptzr6.wl-maz@kernel.org>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250207_181014_698460_132C1664 
X-CRM114-Status: GOOD (  13.57  )
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

Hey,

On Fri, Feb 07, 2025 at 05:45:33PM +0000, Marc Zyngier wrote:
> I found at least one issue that could fail the migration. Before the
> VM starts running, we limit the feature set to the subset we actually
> support with NV.
> 
> By doing this, we also change the value of IDreg fields that are not
> writable, because they describe features that we don't support.
> Obviously, that fails on restore.
> 
> I need to have a think...

We spoke about this a while ago (and I forgot til now), but I was
wondering if we could use vCPU feature flags to describe NV, including
the selection between FEAT_E2H0 and FEAT_VHE.

I think this might match userspace expectations a bit more closely where
the state of the ID registers after init gives the actual feature set
supported by the VM.

-- 
Thanks,
Oliver

