Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 846C2CD8CAB
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  8 Jun 2026 14:22:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NMlTDtSQVCRaIScLdU5LnPoxCDDHCuJqXKf3DYv7eY4=; b=ke96da+VzwNr/Ov9Achb3EpuIW
	tgIMq0CMMztBfA9p6Tljg1A0BMu34UJncaw4QwgdvKU7GnwqUlog4E7ew+smGBrjlLnaMfJLU0BkF
	w9CZbE4NDH+8iI7E+bea30X7nVi9nublL5MMTVK+W/y4MsupH4TMFloCxl5K9kOGDjwoekzKFqY+B
	DMWtueM1PhAa9fqEjqHyZSgV4spGmiAi0Q8GItOW1Ilre5th128GsnmptJ7WskOM0m8hmnatjgqZV
	S6goL4W9BK5gG+iVToYQlyXJ3A53yFjzfxTWLEp2n89+EDVfoKbPqoKPHgDDgcAyICq1tpmLFIi4B
	KJJwpccg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWas6-00000003jM5-43MY;
	Mon, 08 Jun 2026 14:22:34 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWas2-00000003jHD-2TK6
	for linux-arm-kernel@lists.infradead.org;
	Mon, 08 Jun 2026 14:22:32 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-490bb5ad3bdso202335e9.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 08 Jun 2026 07:22:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1780928548; x=1781533348; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=NMlTDtSQVCRaIScLdU5LnPoxCDDHCuJqXKf3DYv7eY4=;
        b=Ickqh3Po4wONy+z3pRCvXYBT1bvWJo4/zgfU/4A/QawmnY7JKPp9NJwIJZRN6WLL4A
         c0aZ3xVRcOrZ86/kSoQwQUgljemyObYF1A7K3g6HdmcESIpWCjcM6GWvaPL8iP9y2gqe
         0ucSwrRoJG8uh7SIjhV9GrOu4JTmECOkySNN581q7WhakGkCVw/MEugGb/dJE/inNCG+
         DqrYlmx7gWUrgVCCeHyIQIYGdt8EBIvXJkwiDMFlb4eD98QUZ+GlJ+CPLaGrTSnfl12s
         wQuzR9xTcFpYIBMwsspOuK2gRzS1V4CP73zEjpEXRwJbkNNHWMvxNtDvjlVh632Q347a
         QepA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780928548; x=1781533348;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NMlTDtSQVCRaIScLdU5LnPoxCDDHCuJqXKf3DYv7eY4=;
        b=m7g3my7Zc4YxZbA5kPuwKqu9uNgHCNISDmUXdYHe67V8lizhwZgtqgMBzwNRKp9nbA
         dWpYEbUIDpWmu8lBLmvUB67LjB8KG8NMJwBmji1p/Zkx5bcs1E4V+SBwaZwRzvSFr8o2
         S3R+5HBOyPhwXagh27Vs39HrhMtjcihkCfVidaIwzogQeLYFVFtd/bvLg/DIHR9OSarY
         FA9h1C1DuQzQzDClhDuDQ/vAfesfeZgbdVH2knYyHnhdlRh282iUwypKOwH5FTp/Y63p
         ixDYRYQAZEmQ4KZTj/ELxKDpKw6rsCT3UqVXmYZTMfNEcgbrbVa2McwV7C1HgJDZOOt4
         sGBQ==
X-Forwarded-Encrypted: i=1; AFNElJ+sZ7qBRGcVFSuBggO3i0Rs5nMwEOkGhlgscw/Hjy9UeEfwMDfojeG0VLH+iDoJ3ftS4gBFzq+cyqckRU+AtsFw@lists.infradead.org
X-Gm-Message-State: AOJu0Yx/ROrd0EHPZLbqwPqb1B+uoj0aRAVXrKOlh2hLleA2o5w/dsQ7
	LS92OpuHRgscNvjpVewWWpJOZViBJOI9TuyZfxusfXc0NdCcBoqEWDsZCjepoRDjdg==
X-Gm-Gg: Acq92OF2BQ2HMzPE6cfI4If3ZJTYllt6TL59IEOsHRC9QMsmE5drcQGCO6dxWuKFu8G
	0hosEdieWOLo9zBCNIVc88v8Uf7gsiPNGhJTrKfbN/Vl18WPs5CkagPuwMSjehV5lGaVfVCunYt
	s6/brLP2+zz1Pw1U4kb8aLNEKM0IJ45ekfqXdkC6TzE+PCNf4oXB7W2dMYkDqDP8MmWDy+de/4a
	rSHdTb9pZb8GDdfqvq93iOAeLllhgLZsCRIcHY/3uEspZtIAxOfYkrh80rbiUEjHGdMRUMWtwTw
	jn79awnOD7iYFF2Z26C7btLG5uHvGR+XlGrudUgEnJpFmYKjeQSTa+le1O57e0WfQGUrpuYDbx9
	oIv5Shd6puBIst6gcEl3Sv7JlXwDmClJYh8Tdh4Dn9DTlIEY0zZJLfKAiPINjIK9hpjq3TgfXJM
	Y2+/8aqE/jnGsRnUmLaYkO4ytuCWo7CQj/0wAOQ+pv8Xz70g2BMCZ76iHLI6LlvY/gP8PmPYn1q
	pcR1F26
X-Received: by 2002:a05:600c:3299:b0:490:c2b6:de6c with SMTP id 5b1f17b1804b1-490c2c96beemr2993835e9.13.1780928547315;
        Mon, 08 Jun 2026 07:22:27 -0700 (PDT)
Received: from google.com (143.11.148.146.bc.googleusercontent.com. [146.148.11.143])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4601f344541sm49486271f8f.22.2026.06.08.07.22.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jun 2026 07:22:26 -0700 (PDT)
Date: Mon, 8 Jun 2026 14:22:22 +0000
From: Sebastian Ene <sebastianene@google.com>
To: Will Deacon <will@kernel.org>
Cc: Marc Zyngier <maz@kernel.org>, catalin.marinas@arm.com,
	oupton@kernel.org, joey.gouly@arm.com, korneld@google.com,
	kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, android-kvm@google.com,
	mrigendra.chaubey@gmail.com, perlarsen@google.com,
	suzuki.poulose@arm.com, vdonnefort@google.com, yuzenghui@huawei.com,
	Sudeep Holla <sudeep.holla@kernel.org>
Subject: Re: [PATCH] KVM: arm64: Forward FFA_NOTIFICATION* calls to TrustZone
Message-ID: <aibQHiYimPP1ylk3@google.com>
References: <20260501114447.2389222-2-sebastianene@google.com>
 <86wlxgy00t.wl-maz@kernel.org>
 <afxuDpecPCVA56cL@google.com>
 <86se83xrwx.wl-maz@kernel.org>
 <afyd8u85L5XIl6dh@google.com>
 <86qznnxptx.wl-maz@kernel.org>
 <af3fW468-f1KXCrC@google.com>
 <ahmxiFXXTupafbXw@willie-the-truck>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ahmxiFXXTupafbXw@willie-the-truck>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260608_072230_647780_831E676F 
X-CRM114-Status: GOOD (  24.97  )
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

On Fri, May 29, 2026 at 04:32:24PM +0100, Will Deacon wrote:
> On Fri, May 08, 2026 at 01:04:27PM +0000, Sebastian Ene wrote:
> > While at it I discovered that none of the FF-A calls in the proxy
> > currently check for these SBZ registers. Would you be ok with a diff that
> > fixes this before the patch with the notifications ?

Hi Will,

> 
> I'd probably structure it as a separate patch per call, tbh. That way,
> the commit message can talk about the specific fields that are reserved
> for a given call. See below.
> 
> > Refactor the handling logic in pKVM FF-A proxy to support checking for
> > SBZ/MBZ values. While at it, drop the do_ffa_mem_xfer macro and replace
> > it with two functions that make it clear that we re-write the
> > function-id with a 64-bit variant, to keep the same behavior as before.
> > Keep each handler in an array of structures together with a mask that
> > corresponds to the SBZ registers the spec expects.
> 
> Although I agree that we should be enforcing SBZ/MBZ paramaters (because
> we have no idea what they might do in future versions of the spec), I
> also think that doing this at the register level is too coarse.
> 
> For example, the VM ID parameter to FFA_NOTIFICATION_BITMAP_CREATE has bits
> 31:16 as MBZ. So I think we probably need to do the checking on a
> per-function basis, like Per is doing in his series:
> 
> https://lore.kernel.org/r/20260501-host-direct-messages-v6-0-3f4af727ed85@google.com
> 

For the newly added calls like FFA_NOTIFICATION_* we can do that in a
separate functions, but what about the other existing calls that have
MBZ registers ? that was the reason for the inline proposal in :
https://lore.kernel.org/all/af3fW468-f1KXCrC@google.com/
(to avoid duplicate checks).

> Will

Thanks,
Sebastian

