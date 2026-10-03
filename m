Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A61E0CA5FE3
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  3 Oct 2026 11:12:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZOkPI3tXRwTtIn8qocSrw0Y1LMVW42C4jrO7SmDiYa4=; b=yo9G882F8Rc2T4L6DIwEwdEHQV
	jY3JI8hTy/T945sYnT5uSfNL0Uxxf70psvQHPHtb1ZWrx5hHLBlBYKaSsJynEUDfIQzdh48mNuHuF
	5XzNRXmrJyPh1v6qEGS8vFtAuDbfB4ZslH7l79M9sMKM71bNaFNE2jVSWwkjHProuc8FsIeVeKUhS
	dD7trQ/+mkzBUWuAUKWfdj+1icnMBm1zwsZplkoseUwoVzKORvAjoq5zvUQsdHrmGE6y1oXQnTzK8
	2M1BF7GKl2g/RFA3Qjsda0DTXM2gaWtFPF0dNjb7cjqx6st7QUPaFQcZprVHrdpxsSkcVcxZYYwwJ
	Ddp49zKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCxex-0000000DPpj-3y85;
	Sat, 03 Oct 2026 11:12:07 +0000
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCxev-0000000DPpG-31PO
	for linux-arm-kernel@lists.infradead.org;
	Sat, 03 Oct 2026 11:12:06 +0000
Received: by mail-pl1-x62b.google.com with SMTP id d9443c01a7336-2e4ad94ccf0so2297585ad.1
        for <linux-arm-kernel@lists.infradead.org>; Sat, 03 Oct 2026 04:12:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791025924; cv=none;
        d=google.com; s=arc-20260327;
        b=eQ0vIYK4RWZSYtjXUyhwum3rqdWJ1lmSw6s+4nZZJADKAnsQw1f2nwyWg6bENXgDSC
         qchcH7TUH/kY4CFX6z4XH0SP6ZT3jkZIUnQYD0CI0Ay1XaytK/BCUK0wywDWqlV5KDsc
         CrZuVXskYWjDtkH/sIMZb0LfnMrKZftVT5F2KjxRyVXUs/raf3/g8bp8nVD7xmPuZVtw
         dgVrtO0F0OcckjPuHzomcDHhR3hSZfowRL+L0I7Sq6cGgy8UaWhyhM7rvq98EVfvNQtw
         FvsZfoYQ51IKwxlwG4OTxAZnO5XJZWTlotLOe5tHjhsCRQ9v5U9R0Hb17Gb4iY/dHQR7
         qWlQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=ZOkPI3tXRwTtIn8qocSrw0Y1LMVW42C4jrO7SmDiYa4=;
        fh=Qr0HoS0wRoSseHsOOi5UgIjUEbcmCE1JInJWJZcble8=;
        b=DxfsPo7PC6iidoXIqWAg1xtQHNRs9GtuuADx65SACrI5TyVFZArJC0k3/99wHhNxBu
         fqZFsTBn27LBRSJk77MApkosPjsenneY5P1dTnDxC3YQrL3vn3063M+pwrZrVqhGNVdY
         fhp9w/yvgN2e3SakTTQVu94pWkgR2U4Zvyjed8Llec2PnRpWOveq7QRIMDbADKOpxSR2
         93Wye8xWbi0HsaHhLs2TIh6A3cDOKeCGMaT02kLjrmr+X1Xd741D13MTcpbXbe7zq+xL
         XyBF8GnLY3P4PEMK10pkjy08AWPuHiiHoinaNbyNKQioIM24BUAz6fGEbXewyKB+q1A6
         gufg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791025924; x=1791630724; darn=lists.infradead.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZOkPI3tXRwTtIn8qocSrw0Y1LMVW42C4jrO7SmDiYa4=;
        b=WZVlQw0it3oe1QFzPc8qkb1fIpjriqVBf0j3gBEzUreTAzTn6TBQOtsioGqYTdboV3
         1ieoLr+08WJkerT2o0IQFmVz+Nlb248FTrM/TyK7LNk4/Vj2CP7hl9zwJwXcIRTs/SZU
         GngH+rpH59Ecc5oircLzgT1ai+P1yZx+eTnQEeVPUmMxDAiQI8OU1r0GCNQMyYQGJndo
         1Tz943TBU92NjKS3qEIlDfChIZnsmWzPC+Sw4dVhg7tCNWUuSRVIENgnEI3fIZ2gjyUR
         EFgwDXKiq8PZ0kiHEzJLXA3EC9ol7P0d2ZOEe/nXZAkcY0KczSzCz1yWD3PUht3OhAhu
         aV6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791025924; x=1791630724;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=ZOkPI3tXRwTtIn8qocSrw0Y1LMVW42C4jrO7SmDiYa4=;
        b=UKf1zm4M54e24jHP2w6tzbVpuYPxopY6k3f2e5LIJqbKi8TeggRg8Kw1bvp9dX3ZMo
         eH46sBN5pMI7qqozqu4zH4IiYzUyMVKpYyMwkFGm8VE19KmKxqU9iBZ/k7PLPt+4hVAT
         fowxDweH1Mfq3w2ZpqCGQOqKv1A1hMGNK4zDcsS1SUYz4SkFEerYvAjcASuJ83/L3GXa
         3lv1ivn5fgHPVIM5h4Mc8aVjrYyY9WOjxLXMwX28br7yRVIwvqnqTHcZ3DgZsGJrS7qb
         TzeAyQYKw71LGqGLCedfihbujJTedQd22Rdb7tIpC8PTPS5As4snmpfKqWh+g/iQnGYr
         b/nA==
X-Forwarded-Encrypted: i=1; AKwUvBzuz+z4yjjm0q6eSqs+REO9NjbQoTHzuWLvf5FKNwixfv/jQIDPxn7CE+eNQ47IiJD061NtPgbpdzE4J+8Hm9Eu@lists.infradead.org
X-Gm-Message-State: AFq9FYL50Vvz7Lo6FhL1vPA01iREY6/pri3SXSUj9OynR6UnKsKwZqgD
	qsByeR8AcrmMwkGm/vV2wp9bOJQa5DmoM1ulBSRqVHE8Thstx9r5ZHW+ToOqUFKVsODN8AjY32s
	vfwctQTLEy7v81tddsbr81xhrEY90UbM=
X-Gm-Gg: AYBFou0sAEuR8p03oCBW3R9hD9NIQbmPebM59gXuaAnzmy5WkodCTVH3QBbx3pTObsS
	h9+bTVsDnFghwVNTgI05iLT5scBKrbDSLxyUC3/5sH1Lg0i08hCYhHR/vdLIa9MKGQN5c/hOqYG
	Pxn0DbS083beFC4Z3L1+byfV5nNcGxUuPVmllKJLU1NcybM/Y5aTIn1r3Es9a+N2q1gH05dnspY
	+DmmqaGZ6vz3ANw9EDYiMMEeBqJArAoXC8aa+etNtlHzpG45XD2uN7W4htEq/h1PrWYrVp+dwgu
	CtcEoZzYW4jbf8qZ89QtRj0/cj2OVmtcN0TBAeM7EviQKUofc3liVF7cNAZ9mT4jTjnxeSQveQc
	GkRYrNZMPqJsisQy0q4WPc6wT2ghFhdzhp5jLQ8UDuDozPZXBk5NgiC/jjPu5EJH2XBNNDXw96+
	M6b4kJMONYFABx+Bm9erIY6OeriA==
X-Received: by 2002:a17:903:2406:b0:2d6:ff5f:eeda with SMTP id
 d9443c01a7336-2e4ea0db41amr21785615ad.6.1791025923705; Sat, 03 Oct 2026
 04:12:03 -0700 (PDT)
MIME-Version: 1.0
References: <20260811041934.7609-1-phucduc.bui@gmail.com> <ar_fLAeFU4rmrwiH@willie-the-truck>
 <CAABR9nGqwTGcrr6bKsV5+0GYwkQoP0s_Tu6aTJrhJJW_ZRqFYg@mail.gmail.com> <asCyI2_CNSoDJy1w@willie-the-truck>
In-Reply-To: <asCyI2_CNSoDJy1w@willie-the-truck>
From: Bui Duc Phuc <phucduc.bui@gmail.com>
Date: Sat, 3 Oct 2026 18:11:52 +0700
X-Gm-Features: AclHuK9Zi1mA9PZ0oSISuDkDrpCS_y9Tgcj6SbSA32DMxp-Ws9T5eeG0iizhVxU
Message-ID: <CAABR9nH3pkFB-htyrD-Z+iBBcYoVX4Z-hFa_binWCXg9_cHU6A@mail.gmail.com>
Subject: Re: [PATCH] perf/arm-smmuv3: Propagate errors from optional IRQ lookup
To: Will Deacon <will@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>, linux-perf-users@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261003_041205_769683_97B1EEB6 
X-CRM114-Status: GOOD (  20.03  )
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

> > > Not sure about this. If it's optional, why should we bail the probe if
> > > we don't manage to get an irq? Surely it's better to continue without
> > > the interrupt in that case?
> > >
> >
> > platform_get_irq_optional() returns -ENXIO when no IRQ is available.
> > Other negative return values indicate errors, including -EPROBE_DEFER.
> > In the case of -EPROBE_DEFER, we should propagate the error so that
> > the probe can be retried later.
>
> Thanks, The -EPROBE_DEFER case seems more compelling, so perhaps we should
> check for the expliitly (because it won't fail the probe altogether)?
>

The idea of the _optional getters is that only the "not present" case
is turned into a special value (-ENXIO here, NULL for
devm_clk_get_optional()), while real errors are still reported to the
caller.

Besides -EPROBE_DEFER, platform_get_irq_optional() can return other
negative error values depending on how the IRQ is obtained. These
indicate an actual error rather than the IRQ simply being absent.
Ignoring them would leave the device running without its interrupt
and no indication of what went wrong.

So I'd rather keep:

-----------------------------------------------------
irq = platform_get_irq_optional(pdev, 0);
if (irq < 0 && irq != -ENXIO)
        return irq;
-----------------------------------------------------

and continue without the IRQ only for -ENXIO. This is also the usual
pattern for platform_get_irq_optional() users.

Best regards,
Phuc

