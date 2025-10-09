Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D2F0CCD18A
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Oct 2025 22:17:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1ouGIZ18YYsl/9GqodU9OqB8J+uPEhuPrGCcLgx0Wyc=; b=KCArvOIVIYYFvghXC19l5jp84/
	Y2epjrnfgNbYfftOlUBnTZi7vhA2DRegPfQVYZjYTFOOwBdPiZjc/ltoe8239hJOHUnTaVXLtcnF7
	CC1YlIbBUPGsRpdSGLYS7GZhu302VTh7wefdzc8VONeVOGhMz8wFEXK2FlvcuHT905rjYnOWIihxi
	4DQP+8FnZ9rntlxEEWsDQYc8BdPUlnPm2HomGs46IjAXK3XhaxdqfZku1IT6y9qWG8PuBDRaDpSjx
	adHHlKqo/WDVRgoiCg/FBsDfJvK2JER+XqxliDdzIkE54GElPkVIoWvysDnE1Gr2NjQujrYncHfww
	20n/runQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6ywV-00000007Dbx-3HxC;
	Thu, 09 Oct 2025 22:16:59 +0000
Received: from mail-pg1-x549.google.com ([2607:f8b0:4864:20::549])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6ywT-00000007DbA-1eJ1
	for linux-arm-kernel@lists.infradead.org;
	Thu, 09 Oct 2025 22:16:58 +0000
Received: by mail-pg1-x549.google.com with SMTP id 41be03b00d2f7-b60992e3b27so2194770a12.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 09 Oct 2025 15:16:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1760048216; x=1760653016; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=1ouGIZ18YYsl/9GqodU9OqB8J+uPEhuPrGCcLgx0Wyc=;
        b=VPuBjw/AC6glKwhyyNSmOQ0ISpuDqF9henOUESzkSAgvv5JHRxDkWmj2HBy/v8Ip6o
         ObXTKoFtdVxCD7N74s2MNQFM8XiU+qenovp9lHqzRLfJgYZjs+EeTf6UbilYpRtqvDb5
         vj53SPioeHQXLu08qz/ror+DcRZqGWfl4vX66GQ0cTrWqe2LualssWaV0VGAJO2l/uzI
         lO+AKHqJhkNoHmobsmJHlp9QFsKrkIL6fRZaPPWK+XyV+KnN9p5oX3CU7TgbksJEfil5
         Wz+uDQKuxi5zTtCTiKiBLCYg22jp57KziAXU5a1lahXNqzPgtifNCZplVm2/UNp5uOlJ
         zWhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760048216; x=1760653016;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1ouGIZ18YYsl/9GqodU9OqB8J+uPEhuPrGCcLgx0Wyc=;
        b=PLa7elu8quTuPPqd8ACT2mU12MJoVIDfpPJKa8i1+3mrR9ryHYJ90jh03zZTw9GCgn
         U6mBGwD+GG6j3kc6Q0v7hB6Tgt7mB750OCNfGy5lnCLs5wJzUWo3d65foc/lA1c3S1ca
         ZM/17nu/9KnFDcsMuIgVsilzgOoR0U3MfOBvDKVohEkvS7+E1WWo6OnABD4fNNoCmd3r
         ZThrfWo1A/UT/sJXm4TL5hQeIsDSGvRk+K87ctsc1Cmz64WFBlDvGP2t/uXsrzkFHyA/
         77Kf+xhHfhJ6U6cQjjT0mNAq4m1kXfGhs0rd9kleTPMd+qLOcCFuhgo/odkAKcpPUn2J
         TuqA==
X-Gm-Message-State: AOJu0YynlBKrInbBIBOWcFA1jNivX1yw6ek+DmhCmh3mPkYawDf9yOVM
	BKNuvrvA0A5hTvjxxGqj11sehD1hg58Q6QdJyf37lW+eyAdRxUUpN7nKEHqzBZ6zsEtONc+iptf
	y3hD5PH42BPuoijJLGhX2z3Y/1g==
X-Google-Smtp-Source: AGHT+IEwKuAuCigrDNWiN+req1c5yFRzIFngZTOobnjj5hIhTotLZtUDLz/dT57kmfJHlodJGDgMWM9ut0fHatowOQ==
X-Received: from pjwd3.prod.google.com ([2002:a17:90a:d3c3:b0:327:c20a:364])
 (user=ackerleytng job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:90b:1e0d:b0:32e:a4d:41cb with SMTP id 98e67ed59e1d1-33b511174afmr11693801a91.1.1760048215831;
 Thu, 09 Oct 2025 15:16:55 -0700 (PDT)
Date: Thu, 09 Oct 2025 15:16:54 -0700
In-Reply-To: <20251007221420.344669-5-seanjc@google.com>
Mime-Version: 1.0
References: <20251007221420.344669-1-seanjc@google.com> <20251007221420.344669-5-seanjc@google.com>
Message-ID: <diqzldljhga1.fsf@google.com>
Subject: Re: [PATCH v12 04/12] KVM: guest_memfd: Add slab-allocated inode cache
From: Ackerley Tng <ackerleytng@google.com>
To: Sean Christopherson <seanjc@google.com>, Marc Zyngier <maz@kernel.org>, 
	Oliver Upton <oliver.upton@linux.dev>, Paolo Bonzini <pbonzini@redhat.com>
Cc: linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	kvm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	David Hildenbrand <david@redhat.com>, Fuad Tabba <tabba@google.com>, Shivank Garg <shivankg@amd.com>, 
	Ashish Kalra <ashish.kalra@amd.com>, Vlastimil Babka <vbabka@suse.cz>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251009_151657_429069_6D6BF869 
X-CRM114-Status: UNSURE (   9.42  )
X-CRM114-Notice: Please train this message.
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

Sean Christopherson <seanjc@google.com> writes:

> From: Shivank Garg <shivankg@amd.com>
>
> Add a dedicated gmem_inode structure and a slab-allocateda inode cache for

Stray 'a' in slab-allocateda here!

> guest memory backing, similar to how shmem handles inodes.
>
> This adds the necessary allocation/destruction functions and prepares
> for upcoming guest_memfd NUMA policy support changes.  Using a dedicated
> structure will also allow for additional cleanups, e.g. to track flags in
> gmem_inode instead of i_private.
>
> Signed-off-by: Shivank Garg <shivankg@amd.com>
> Tested-by: Ashish Kalra <ashish.kalra@amd.com>
> [sean: s/kvm_gmem_inode_info/gmem_inode, name init_once()]
> Signed-off-by: Sean Christopherson <seanjc@google.com>
> 
> [...snip...]
> 

