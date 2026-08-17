Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5319C5DF70
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 Aug 2026 09:40:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cXNSYsF9vRwZXPBJJcxBVs1JLk+WZ0B+/fXzS8/IT3Y=; b=COXrG/8ZsSd/tscRr3SPdmj9k7
	F9LaLiY2bl2rvojh3NEFkgMyzF5bH81CmRuA1FGYUPyBVlkr9CDG1kvWwl96pF/dXJG8FRcnY6u22
	PoIQf9qw1cjZxR7T3aegQzRIgDMLHwivVHyWeeScORj/JJbRd4kDe4fAAMHNCkslndnhWuFDrSrM+
	lnYFWVa2WJgUr8eIr6IuE2agLdj6MGTlzXl8Hn4oqTMqKUO97Phi9pNLNdb5jibWvJeoyENH7r4Br
	QkNg29g2W5vmUun9BsCNoMD4rZnaz59wtw+keDvuSXFDlOhf+Qq47mMqZ1TRZFx4WX7DN/g4SlLCZ
	VEaLZNpA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wvtpQ-00000005pQn-2mZg;
	Mon, 17 Aug 2026 09:40:24 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wvtpN-00000005pPi-3dcv
	for linux-arm-kernel@lists.infradead.org;
	Mon, 17 Aug 2026 09:40:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1786959620;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=cXNSYsF9vRwZXPBJJcxBVs1JLk+WZ0B+/fXzS8/IT3Y=;
	b=Ulvmqe//i9B909NdqlMx6hwePmGfkFG8wYvvIXYN8M3NKjhuj621D8yzcQ/zT4yJdJsixc
	SwjU4xotBdZcGAGUcmQEfpx6kdXB5Yjtd2quGi80t8RG3sfhS8Rzkc8d5+4RdSCC5x7tRB
	C7jE4ejzqRP3vIP2VO+b93lXI4GGhgM=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-125-dXIY9mmAMZ22IskpETE7Sw-1; Mon, 17 Aug 2026 05:40:19 -0400
X-MC-Unique: dXIY9mmAMZ22IskpETE7Sw-1
X-Mimecast-MFC-AGG-ID: dXIY9mmAMZ22IskpETE7Sw_1786959618
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-4954a93c565so16445485e9.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 17 Aug 2026 02:40:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786959618; x=1787564418;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cXNSYsF9vRwZXPBJJcxBVs1JLk+WZ0B+/fXzS8/IT3Y=;
        b=DhDVKdpfhsHaQL8Jnn1hmBNtv2sNhAyL0LNoD1jH+zvJS9jhQ2ej23s2t3OolfMknq
         YJOfDkGeFUus+IEVTzY41D5YRrn+D9hZkBb+2j6/LezeoPLqMJ50TbdECOs/cTHjnGRs
         YmRveeAWOy6dNlNUr9F7fKIFZxRpu9M/rskDe8JY090vaWkQN2gFZIO96M/lQgqG64wE
         vzKlRMdt6rCyyw3wwbTClsEd8Zirf8KmJnjyislstvpKhmEtJdgC0PR/drAhajmWzREk
         5ipu+Dl+hsnVlkNjF2/IyUTI+Y8Mp+hXwys0ozHvMSwQqHt3DXBGlmC6lYIt++WB1Edp
         2zNQ==
X-Forwarded-Encrypted: i=1; AHgh+RqjvlBnYeXbPgXf86rc1UQE7xGZOV5gSulM7ryLWy+A6ZA1tHsBpMAw1g0ZZL7jsGcSSySY6r+Ol4GgDo6YeJmf@lists.infradead.org
X-Gm-Message-State: AOJu0YxQApuNgSgRd/XSWCr9FAjQ2gpw3sKLgSSNbrgwA59TRz3t+83H
	ymMeCIDLK1Ya+b7KPBtO5oU0qfFCJkcOkT4fzikYUPQa6ntgrVQM2DoM1APXUN/AaLfaE+TGSLy
	9IFLjCA8lvtkSyw8I2wz+1RU8+ase7kkQi2iTpbg615EU/p6HJlYfeZbsmJfgsO2NdkKMw8zujj
	vA
X-Gm-Gg: AR+sD11W60IpcMzLZfklaC85PeeEubgAPv5xvIBNT/s6rjznvgtoAnuNZqWy9eapApm
	lOzFl97n7reZteW092wH4gCMD6gSZL4EulurMBLXMkz0ZgwI4+7xtEj+I3vSl207nHJpb8Yr1eO
	JzMSSf6AYPVRMfUA0t4O3G9tPpCQUlpjMaS2iw69fEREoLHZww8lJwTL6AmuyV9X0QDH++hFzSX
	Op3pbCrlNaP++b8lDb+PvxR5D7d+2aBvNk8bYbWCeyt8M6PzOQlhSLHb4swsssRmmZynx2FSwta
	rVWSbk1is7+czIgIS/UkvbHdR0QAixnfVUaHtDQikqUpf4xErKRotdzA8PEa2WqlFf2q+aPS7wF
	MkITaBzIKCOrP29EKURX1yTOyRIbqRcT5cxfzeze5FtA=
X-Received: by 2002:a05:600c:46d4:b0:499:8aff:59b6 with SMTP id 5b1f17b1804b1-4998aff59d6mr271618535e9.14.1786959617860;
        Mon, 17 Aug 2026 02:40:17 -0700 (PDT)
X-Received: by 2002:a05:600c:46d4:b0:499:8aff:59b6 with SMTP id 5b1f17b1804b1-4998aff59d6mr271617765e9.14.1786959617249;
        Mon, 17 Aug 2026 02:40:17 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:f0e:9070:527b:9dff:feef:3874? ([2a01:e0a:f0e:9070:527b:9dff:feef:3874])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49996109652sm166024305e9.4.2026.08.17.02.40.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 17 Aug 2026 02:40:16 -0700 (PDT)
Message-ID: <99991405-f05d-48c9-9f5f-42871d0714cc@redhat.com>
Date: Mon, 17 Aug 2026 11:40:15 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] KVM: arm64: vgic-its: Reword the comment on a
 collection-less ITE
To: Fuad Tabba <fuad.tabba@linux.dev>, Marc Zyngier <maz@kernel.org>,
 Oliver Upton <oupton@kernel.org>
Cc: Joey Gouly <joey.gouly@arm.com>, Steffen Eiden <seiden@linux.ibm.com>,
 Suzuki K Poulose <suzuki.poulose@arm.com>, Zenghui Yu
 <yuzenghui@huawei.com>, Will Deacon <will@kernel.org>,
 Sascha Bischoff <sascha.bischoff@arm.com>,
 Sebastian Ene <sebastianene@google.com>, Fuad Tabba <tabba@google.com>,
 kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20260817092705.1112634-1-fuad.tabba@linux.dev>
From: Eric Auger <eauger@redhat.com>
In-Reply-To: <20260817092705.1112634-1-fuad.tabba@linux.dev>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: oV5qWrn-bqLqjkEYVWe5s355eMhTaVgACoQ8yt-NEi8_1786959618
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260817_024021_987587_ED3FEDD0 
X-CRM114-Status: GOOD (  17.99  )
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



On 8/17/26 11:27 AM, Fuad Tabba wrote:
> The comment above the NULL collection check in vgic_its_save_ite()
> names only MAPC with V=0, which is UNPREDICTABLE. The route that
> requires the check is clearing GITS_BASER<coll>.Valid on a disabled
> ITS, a legitimate operation that orphans every ITE at once. Name both
> routes.
> 
> No functional change intended.
> 
> Suggested-by: Eric Auger <eauger@redhat.com>
> Link: https://lore.kernel.org/all/0ce5e496-a067-48fd-80d2-94fe9981d505@redhat.com/
> Signed-off-by: Fuad Tabba <fuad.tabba@linux.dev>
Reviewed-by: Eric Auger <eric.auger@redhat.com>

Eric


> ---
> 
> Notes:
>     Based on kvmarm/next, since the comment this reworks was added by
>     c6c156d931c3 ("KVM: arm64: vgic-its: Don't dereference a NULL collection
>     on ITT save") and is not in a release yet.
> 
>  arch/arm64/kvm/vgic/vgic-its.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/arch/arm64/kvm/vgic/vgic-its.c b/arch/arm64/kvm/vgic/vgic-its.c
> index f6538b1976f9b..26c665e0a2386 100644
> --- a/arch/arm64/kvm/vgic/vgic-its.c
> +++ b/arch/arm64/kvm/vgic/vgic-its.c
> @@ -2112,9 +2112,9 @@ static int vgic_its_save_ite(struct vgic_its *its, struct its_device *dev,
>  	u64 val;
>  
>  	/*
> -	 * MAPC with V=0 keeps the ITEs mapped but drops their collection,
> -	 * and with it the ICID. Save a zeroed entry, which the restore path
> -	 * reads back as invalid.
> +	 * MAPC with V=0 and clearing GITS_BASER<coll>.Valid both keep the
> +	 * ITEs mapped while dropping their collection, and with it the ICID.
> +	 * Save a zeroed entry, which the restore path reads back as invalid.
>  	 */
>  	if (!ite->collection)
>  		return vgic_its_write_entry_lock(its, gpa, 0ULL, ite);
> 
> base-commit: 57e7cf13ac26bf1a3dba6cfa601f7b2481811575


