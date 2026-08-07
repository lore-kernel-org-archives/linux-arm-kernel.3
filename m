Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9D74C2A09B
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Aug 2026 17:08:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iaOeMTZOYIaS16knxOG50vS1TNGyqbn7Zjc+qZ37u3k=; b=MIcSDeuOu0RALRigWa5BrrTKyD
	zIcgtl80WJeVv/2wXDgx9osUTTb7z/EPtFPZfFrvcHhc26CDPsMeUauGMTLpxfaDzGXrqB46ijZ1p
	0mnrMT/8JWvUKwJVYXheTgcM+vCHsjSZkXqQy4CvHE+qz0y4W1TMa+sBbyt1IwW+8QKUCUFIbm8MT
	YhPjJojaa2GxCOqgSZqsIZ7DAh+JTY3KFpwK+L/fjLSm75ZldD3C5YCBVn5oC+2P/zk2pjHyfR47V
	YvwakZNlfulncSn45pcaeUJtwl5ervJ6CwYGiozbWEBM8kLDpX3nmxve8KjAbM8I/Y9+ahOH2i8wf
	RHGED5Zw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsO3V-00000008V24-1BSa;
	Fri, 07 Aug 2026 17:08:25 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsO3T-00000008V1i-0YrK
	for linux-arm-kernel@lists.infradead.org;
	Fri, 07 Aug 2026 17:08:24 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-4954f5e8020so19410335e9.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 07 Aug 2026 10:08:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786122501; x=1786727301; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=iaOeMTZOYIaS16knxOG50vS1TNGyqbn7Zjc+qZ37u3k=;
        b=W0M8fHMFdR+xeKecpssjmCFgeDRZ/U4Mi+kJw9oDg9XvtCIydMLqSi/3kLsI0nOy0X
         l/9TNf0rj5VjEvNlbn29AlM3KIHgz8/H9tqLokzB4eqZRMf2fsSvGfhqC0eh6PDi33Tx
         /+aRtCN0TmxYl/ZOeB74Ldo9FYV3at5ivUFM9JTy6ASAu3R6HKzq2hEHSK6fR/yh/7sw
         mATqqgLjZCgvoiEteuXHLtY9ry0UUioIzayvNanHDCwJVGs0fJHAHhZS3vnOVRad57IR
         g3WCWvLiec/RV7kN9n4aDftWpUV/N6kTlCglF/sCXNiY3Q1kT6o39jM2VhvvncoA4g5W
         LmsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786122501; x=1786727301;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iaOeMTZOYIaS16knxOG50vS1TNGyqbn7Zjc+qZ37u3k=;
        b=ClvzT07fIb4jkJ7QXpMm6DXMN3N6zWYDKPuwg+qM2ej3QVFlsqDZoYNCF+VtdDrJMa
         GceOs9cavN84fiQbwjEqD0NOfc7k1izPLWxbhy6+hNwA45vOWjcXud3XGBHUHgRb3y7Z
         XUh1YaljF/BUjZyqpBlSN6ZbOK/qso9NWYaQ7nFgfmJRN4mQOOWTDDcbmrLIqPXMDmp+
         yTF7tg9trfPhJ0BFgTiiHkVBd93CmfQlweWVQ5+4UhJnIyaq1UgZcJunEkD9tfRUm0cw
         cSFbZ8rjNMazpXRZ9lM7oGBWHKEMI852lGZOOtXn7HqfYSa41ArYLAXMUdM23SrYrxuz
         iZCw==
X-Forwarded-Encrypted: i=1; AHgh+Rqc80w/Hch6nXFMCdsJNF7Hd67G4SKLQJjHjj+VLxXYOlgtShVL9qMBVlJJqFmnCbldq5IB+2arWmIa0gHwYZKm@lists.infradead.org
X-Gm-Message-State: AOJu0Yy58lVN+cUYpLyc3Cm3C0HhAhrxEKRRcswqiQNicZ45LedMV43b
	HACNbT71Pig/HB2c7c+nC9BuDRLZKdJMmHLZ0ZXHnv8KPHf+b2CsY0GV
X-Gm-Gg: AR+sD138p67uH6RDGqHy8/UwQYp9qCRPGzsbWu5GC5CQJttKpHaLWviRQtvRI6nsMYm
	J1BryomVu4U2BEFom1z+j1cgpyWIZZm0GXlMGImKe49XsXxmTOxi4t+MqcyWzBeywX0VbhScKmf
	8VoNhlxhpkHE18I3wmD3lTmqQoTRDMquX4EsR9j3E9SvACQLgbb/R5NWBnx2kmim2qo2ohp1aX6
	jKGfM9y2gIN7nEZLsQiWX2y4AyL8vj8WuF+EYdezMnSjDgCsc7N9f7pTo3yaCZ9KRBCK1HYXevs
	w4Pir6iMWXm5XTSG8EjcD9BOIC+iFpbaR8vWD8A7MyjN1MuosTprjFISzlAz5ntw+F15GUqXgT0
	I92j/EWDxCIyR0vco9gzD1nsAQIHvrXePo+PduWcJhkcPcFNStTa3HxvMTrUsepCHdj+OMwApI7
	60Od4kR9tyBPCtDpUVKo0xDESA1pQ+x3VpOJFJfWLo4GrvsSt5727PQ+220ErKTGQx04laK++Kx
	gjTyKbqkAaqh6dnk+k6ScsO6jVmLDAOt/KV4EhizRLWkbpULTMZXnoDAYyWHqwA8H/j1oj6NYGr
	xY8CS5nU5woYXozMX+EvUK80brFG63DOaltsS8Z8ly3Y2YKYFWtXHK8VxRD/sQMgeIONgBgO91i
	5hEd6SCuzApyNxX1LKEc=
X-Received: by 2002:a05:600c:b85:b0:496:c93d:e2f with SMTP id 5b1f17b1804b1-4995e0dff0amr73285775e9.15.1786122500534;
        Fri, 07 Aug 2026 10:08:20 -0700 (PDT)
Received: from MacBook-Pro-von-Karl.localdomain (dynamic-2a02-3100-b105-e101-a437-493a-4de9-ee3e.310.pool.telefonica.de. [2a02:3100:b105:e101:a437:493a:4de9:ee3e])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4995ea27ef0sm60747585e9.9.2026.08.07.10.08.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Aug 2026 10:08:19 -0700 (PDT)
Date: Fri, 7 Aug 2026 19:08:17 +0200
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Marc Zyngier <maz@kernel.org>
Cc: Oliver Upton <oupton@kernel.org>, Fuad Tabba <tabba@google.com>, 
	Joey Gouly <joey.gouly@arm.com>, Steffen Eiden <seiden@linux.ibm.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Zenghui Yu <yuzenghui@huawei.com>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org
Subject: Re: [PATCH 1/2] KVM: arm64: nv: Allocate the shadow S2 MMUs
 individually
Message-ID: <anYNTW2e3HalTqTk@gmail.com>
References: <20260803224405.41468-1-kmehltretter@gmail.com>
 <86mrv2arf2.wl-maz@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <86mrv2arf2.wl-maz@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260807_100823_184528_5ACFD6E6 
X-CRM114-Status: GOOD (  13.09  )
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

On Tue, Aug 04, 2026 at 03:31:13PM +0100, Marc Zyngier wrote:
> See the hack below that seems to work OK.
> 

Hi Marc,

Since error handling has come up again, I should clarify why
v2 did not use this sketch verbatim.

> -	kvm_init_nested(kvm);
> +	ret = kvm_init_nested(kvm);
> +	if (ret)
> +		return ret;
>  
>  	ret = kvm_share_hyp(kvm, kvm + 1);
>  	if (ret)

Once kvm_init_nested() has allocated the pointer table, failure in
kvm_share_hyp() or any subsequent VM initialisation step leaks that
table.

v2 therefore calls kvm_init_nested() after the earlier initialisation
steps have succeeded and frees the table if a later step in
kvm_arch_init_vm() fails.

> +		for (int i = 0; !ret && i < S2_MMU_PER_VCPU; i++)
> +			ret = init_nested_s2_mmu(kvm, &tmp[i]);

> +		if (ret) {
> +			for (int i = 0; i < S2_MMU_PER_VCPU; i++)
> +				kvm_free_stage2_pgd(&tmp[i]);

This cleanup includes the entry whose initialisation failed and any
entries whose initialisation was never attempted. An uninitialised
entry has no valid mmu->arch, but kvm_free_stage2_pgd() immediately
derives kvm from mmu->arch before checking mmu->pgt. It can therefore
dereference an invalid pointer.

This is why v2 tracks successfully initialised MMUs and frees only
those entries.

Thanks,
Karl

