Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01223C5CFCF
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Aug 2026 16:05:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=M45GqPAfaWkAxTNfkHv5H0q0VgCGytksnXS+eq9PrHc=; b=wbrt3Kplo3Fyrsjl7vHuHVbpaq
	1pQ3tRaHhWHEI6Vgq7mSTsbQwz+A6lYpKC7jGO0lzkmPRdjcIclCOwucOn1u6ewAqtC7hyzSEeir+
	8Y2wj6nczW/YakNuVi6j5KmGW6nXkknv2F6T/4boyExOH3/2XHXnGpq2LbKbA3vaF+eKEG0XQF2Ez
	Y4bnfIRJwNEAowtuzMlTn1GbBgsZeJFbv4DMQe3nbvRoXuo8+uwjrJRO7hfGp6skQh9HOFkc1HDCB
	xmXPfrBB4DFCASwKxkADta3vNFzutPeBSDiJKfsm7Zwo7E5d1tqIKaZ3Zn+fz8HoYiINYo95xCUF5
	epc7OYUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuuOp-00000002tjN-0cmh;
	Fri, 14 Aug 2026 16:04:51 +0000
Received: from mail-pg1-x546.google.com ([2607:f8b0:4864:20::546])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuuOn-00000002tiz-00Yp
	for linux-arm-kernel@lists.infradead.org;
	Fri, 14 Aug 2026 16:04:50 +0000
Received: by mail-pg1-x546.google.com with SMTP id 41be03b00d2f7-cb835525b10so1333071a12.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 14 Aug 2026 09:04:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1786723487; x=1787328287; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=M45GqPAfaWkAxTNfkHv5H0q0VgCGytksnXS+eq9PrHc=;
        b=K278eD1N1pVG8AYI2WtYoPOxb0TnQj03EmWGP9eNHRAk61U9XlHqUQBtYAN4Xjm8XP
         6fV8sX83HkUSoVpi57K2HSLnG80SMnxDKTWVA/K0lvSEqG5U3zRMMCJgjaiJAlG+IjD7
         Mu1j8F3eYS7rm1qryALTg613KW6i+rpqkaeJITpGc4zNNjPDDGrIqzqKm6SBSu+l3ax2
         vggOrILJZxN50TaTh/IaayDuJXdHBnctV/Uz9yn+KgkUIngKlzVtLHEaP1xDcaT3Bqmw
         rTnOG9xk5/UcDB77whVUbW6NTDGSeJ6SLdae3XXrHnftkfPIf54p4cPnAMOyKem4WRtw
         4q0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786723487; x=1787328287;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=M45GqPAfaWkAxTNfkHv5H0q0VgCGytksnXS+eq9PrHc=;
        b=YuTQFS1ZgPkehWhoaKcMUxI2IfHB4oZSgFH82fLPs7UGH4IPmLG6C0CSNuADtjl5hV
         bIcWS4Goo2z5taw9OoaUZv+b5mCVRpADfz8lzaCr0NNR6cpG6/Ngjq/VqllmSB3pjIZ1
         DGVkM02cWc+QkIBtMuspaDfNd8xFtF/fLJfNoeRhvuPoDj08gz5cAHmQKESMu8eiv0nZ
         aw06oDgzg7GQEKCXDjZeajbbc5pkmv/h4NK+dMt0DkmqjyfxIpZnx23TPBAjg/nGLtsX
         uZMtIaLXGVfomx7OoKUeNBstdxujp3xLjuN74yIwh7J0K7xWtx5TgUB+hA0P60IU4w4U
         W+sA==
X-Forwarded-Encrypted: i=1; AHgh+Rp8X1XOzhfPixwCrKchmhASwC0J8boD/IX5lnripwy14N/qY5k51KO0cm0TfUFSvPeaCYNIDGjYGgRJ0jVlTpo1@lists.infradead.org
X-Gm-Message-State: AOJu0YzX2SsZC4SToMAse3iPHVw7uZ4qOcJvpmNKhZdq3LChD/c0CIgd
	67Pkxn4bgnOk2kF/YpM08LrRnP+HeWpaZHp/hEQoiJeyNJSsjC7o85DJ6FVSS3fmxXvBvlB3OO+
	GQV8z1Q==
X-Received: from pgcc9.prod.google.com ([2002:a63:1c09:0:b0:c9b:2759:d240])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a20:6f8a:b0:3c4:1916:9d46
 with SMTP id adf61e73a8af0-3cc71f4a5famr9143644637.27.1786723487045; Fri, 14
 Aug 2026 09:04:47 -0700 (PDT)
Date: Fri, 14 Aug 2026 09:04:46 -0700
In-Reply-To: <an86rPn4P2dRO1RB@raptor>
Mime-Version: 1.0
References: <ak-EKSslAz1uqEtv@J2N7QTR9R3> <ak_wC4Q-mQe14DI8@google.com>
 <alDI1b8fC99SG4_a@J2N7QTR9R3> <a127176a-1722-460c-aa84-754e1d343f53@arm.com>
 <an3sEiQlIuGEjUur@raptor> <b6080c23-a2a8-4bc5-b3bd-982bd766c648@arm.com>
 <an5UJ4S_P1LUFmzD@google.com> <487aa57c-72ad-453b-971d-ca24a8380429@arm.com>
 <an8SOvLybeilzCEU@google.com> <an86rPn4P2dRO1RB@raptor>
Message-ID: <an88nuw0FKT87a-W@google.com>
Subject: Re: [RFC PATCH 0/3] KVM: Dirty page logging for guest_memfd-only memslots
From: Sean Christopherson <seanjc@google.com>
To: Alexandru Elisei <alexandru.elisei@arm.com>
Cc: David Hildenbrand <david.hildenbrand@arm.com>, Mark Rutland <mark.rutland@arm.com>, pbonzini@redhat.com, 
	kvm@vger.kernel.org, maz@kernel.org, oupton@kernel.org, joey.gouly@arm.com, 
	seiden@linux.ibm.com, suzuki.poulose@arm.com, yuzenghui@huawei.com, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	fuad.tabba@linux.dev
Content-Type: text/plain; charset="us-ascii"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260814_090449_045292_5BFF8B2A 
X-CRM114-Status: GOOD (  15.77  )
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

On Fri, Aug 14, 2026, Alexandru Elisei wrote:
> On Fri, Aug 14, 2026 at 06:03:54AM -0700, Sean Christopherson wrote:
> > > That would be in contrast to user space having to guess that page migration on
> > > the current hardware with the current guest_memfd implementation does not
> > > support page migration, to then disable exactly that.
> 
> If guest_memfd picks up support for another feature that might lead to
> memory being unmapped from stage 2 without userspace initiating it, would
> you be ok with that feature being gated by another guest_memfd flag?

Yes, absolutely.  FWIW, if I get my way and reclaim is driven by userspace, then
hopefully such a feature never comes along.  But if guest_memfd does gain some
feature that triggers invalidations, then yeah, at the very least it would need
to have some knowledge of whether or not the associated VM supports said feature.

> I get the feeling we're all on the same page, that guest_memfd will support
> a mode where memory isn't unmapped from stage 2, and right now the
> discussion is more about how that will be implemented.

Ya.

