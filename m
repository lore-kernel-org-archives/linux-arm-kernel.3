Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37E72C83F17
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 18 Jul 2025 14:58:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=N/TCALKPJKMHZD91lUzJU6dW6O+HUemIHHtXfTjzh2o=; b=0uYqgQYK4hT+NBuVepXJUk32pj
	eaAvbWJEXVIx5w3Ygbcjt9ccX80Fs6yo7/VqzTo/3ag26bujoY5ZzgZ03vCHHe9rGLkeRbh0EM7oU
	jsqUOGAqmQ70m0LdRIED1lgC8hgr11GmsAjep90qgiQkOSF9ioF9mC1wIXOyX2YX1a+lk2/KC7Epo
	fiIteVdGSUakOAqYNzVOMP5XklgrlBOKVvMdeg6qmj5JMmThU1+EklRihKLIzqv5kdW+c2idq5BgH
	WyXeYpYV1whcuqf5D28m0c4v8G3XIgOlueCS7oO0GOCWmdDz/FDWxuvvavqnSopAIkatCyqwhSELJ
	lS4m0zHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucmY0-0000000CsLD-3fcv;
	Fri, 18 Jul 2025 14:58:52 +0000
Received: from mail-pj1-x104a.google.com ([2607:f8b0:4864:20::104a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucmTy-0000000Crhf-1Ove
	for linux-arm-kernel@lists.infradead.org;
	Fri, 18 Jul 2025 14:54:43 +0000
Received: by mail-pj1-x104a.google.com with SMTP id 98e67ed59e1d1-31315427249so2127681a91.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 18 Jul 2025 07:54:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1752850480; x=1753455280; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=N/TCALKPJKMHZD91lUzJU6dW6O+HUemIHHtXfTjzh2o=;
        b=M68WSK+GRGp9tgfvKrcwdoS5Gzpep32g+RaILRzQbSWA0klBlYWzdN6dDHNublVUII
         JtbcO2LbDELgoOn61bHu+v5o8VFbC+XJqktr1WyhX0E+bt2tntqrxSss+1w3TlsqI6Ep
         chlUQw8WZ+mZTb/kgQw19Fzqs0DXSVu1Lex1HF2MUuF7mfqrg+E92IyD+Ez6Qvh0OdkM
         XeqH3jvsr96Cdn9Vn7F9c2LmRo3Kl3vyf1PZ/Muw+HMMJ7GbhwV6fV8X9pLStO4bUJEo
         SJDa9wpT0cyLjwP0OKRm6xgpRPOcOV0VtG58DPUL6PMq6/O9wLbKYbSUVKdNksvp7RJ+
         INeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752850480; x=1753455280;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=N/TCALKPJKMHZD91lUzJU6dW6O+HUemIHHtXfTjzh2o=;
        b=nrcU2QntKINXr36Z1V6tKs0Dnfh/XnLSGyjFekUbcz99tLBczNq83akURFF6qJJRf8
         X+paxwyXYnvnCQiww7XRWt5+F2+PQBQyqqAKfS0ybxXPxmMq0zWyAfDvnqREtXeyfYa7
         x1Hj6Rk7lsXHXq5yT1xwn0IK3iVy9WK0kjyneQS5sD7czhE391zjHpHxBkAnDJd0URiy
         kAGaMtAWBVhs3rQbvif7S4hUSTO1uHpdhMglMF4Bj7KfimY8TUo6pRKkyAGEAliJnfaU
         fMtQelMr6TwCIGdL0/MNYeyBJ44u7t8cpJP2xVlO98GYqDdO6Ki6yaKq7If3CeeLFmS3
         ej5g==
X-Forwarded-Encrypted: i=1; AJvYcCXglT1Kp1UO33JJ3A4Skq+9LyPi5921geExfeUpb4nRS2GXNjj+rdE/JqlGq7AOpLfp10gEThmjvqGxJ/7IyO0J@lists.infradead.org
X-Gm-Message-State: AOJu0YzkqH/M87iZa0kD21A/AaA7o+xuPyhyfNi7f7ZHO57h+eDBGK5F
	rl9VziAIG/JDEMXuNFl1xiG7LlCbmPAJCNRXY1wUvm/Z6VdBLXTKJ6geNqpijFNlS48kXFtj+NR
	D78Fblg==
X-Google-Smtp-Source: AGHT+IHg7OQ4Sa3hUw44fFRrqCCRNCdoEM6sGbznGmflFsSooOxKsLp700fJMAwy7HaVB0l9Tq8sTcWYBQ4=
X-Received: from pjxx3.prod.google.com ([2002:a17:90b:58c3:b0:313:2d44:397b])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:3d08:b0:311:c93b:3ca2
 with SMTP id 98e67ed59e1d1-31c9e6e96fdmr15276081a91.6.1752850480100; Fri, 18
 Jul 2025 07:54:40 -0700 (PDT)
Date: Fri, 18 Jul 2025 07:54:38 -0700
In-Reply-To: <ndwhwg4lmy22vnqy3yqnpdqj7o366crbrhgj5py5fm3g3l2ow3@5s24dzpkswa2>
Mime-Version: 1.0
References: <20250716110737.2513665-1-keirf@google.com> <20250716110737.2513665-4-keirf@google.com>
 <ndwhwg4lmy22vnqy3yqnpdqj7o366crbrhgj5py5fm3g3l2ow3@5s24dzpkswa2>
Message-ID: <aHpgLnfQjp3qdZOL@google.com>
Subject: Re: [PATCH v2 3/4] KVM: Implement barriers before accessing
 kvm->buses[] on SRCU read paths
From: Sean Christopherson <seanjc@google.com>
To: Yao Yuan <yaoyuan@linux.alibaba.com>
Cc: Keir Fraser <keirf@google.com>, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, kvm@vger.kernel.org, 
	Eric Auger <eric.auger@redhat.com>, Oliver Upton <oliver.upton@linux.dev>, 
	Marc Zyngier <maz@kernel.org>, Will Deacon <will@kernel.org>, Paolo Bonzini <pbonzini@redhat.com>
Content-Type: text/plain; charset="us-ascii"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250718_075442_374776_AB85C8D0 
X-CRM114-Status: GOOD (  16.06  )
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

On Thu, Jul 17, 2025, Yao Yuan wrote:
> On Wed, Jul 16, 2025 at 11:07:36AM +0800, Keir Fraser wrote:
> > diff --git a/include/linux/kvm_host.h b/include/linux/kvm_host.h
> > index 3bde4fb5c6aa..9132148fb467 100644
> > --- a/include/linux/kvm_host.h
> > +++ b/include/linux/kvm_host.h
> > @@ -965,11 +965,15 @@ static inline bool kvm_dirty_log_manual_protect_and_init_set(struct kvm *kvm)
> >  	return !!(kvm->manual_dirty_log_protect & KVM_DIRTY_LOG_INITIALLY_SET);
> >  }
> >
> > +/*
> > + * Get a bus reference under the update-side lock. No long-term SRCU reader
> > + * references are permitted, to avoid stale reads vs concurrent IO
> > + * registrations.
> > + */
> >  static inline struct kvm_io_bus *kvm_get_bus(struct kvm *kvm, enum kvm_bus idx)
> >  {
> > -	return srcu_dereference_check(kvm->buses[idx], &kvm->srcu,
> > -				      lockdep_is_held(&kvm->slots_lock) ||
> > -				      !refcount_read(&kvm->users_count));
> > +	return rcu_dereference_protected(kvm->buses[idx],
> > +					 lockdep_is_held(&kvm->slots_lock));
> 
> I want to consult the true reason for using protected version here,
> save unnecessary READ_ONCE() ?

Avoiding the READ_ONCE() is a happy bonus.  The main goal is to help document
and enforce that kvm_get_bus() can only be used if slots_lock is held.  Keeping
this as srcu_dereference_check() would result in PROVE_RCU getting a false negative
if the caller held kvm->srcu but not slots_lock.

From a documentation perspective, rcu_dereference_protected() (hopefully) helps
highlight that there's something "special" about this helper, e.g. gives the reader
a hint that they probably shouldn't be using kvm_get_bus().

