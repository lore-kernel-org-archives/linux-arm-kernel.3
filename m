Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39E96CCD195
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 17 Oct 2025 16:49:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:From:Subject:Message-ID:References:Mime-Version:
	In-Reply-To:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hOIrByP8ZUQuvgPySyDlm6fhYAgi3WQo8mV8b43qPRw=; b=FdCTYaqYs6BafK7V5jAkn5aa7A
	xL11+RDjSq9EeFz3I5VGL1giuCVN92XPZkbZPH/Ypve4EinqIDo93ZLiryRPgtX35tglEGcAz2qM/
	h9AlQzjyajmB91jmqoUv3y6jo85RueXY6ggSyEJH/N0p8ySOqBFN6kwIJQZOCicEezQJoH22bXFqs
	Dry8TUHPHmCkivOW38bbDsDyzeE8PAbnlKEw5mZ9yFyLkFKGnSpH+C0zbC4Yy1WGX3HEaY9L7ehWh
	AFw0ivIpHAFv9IVE899yVf/PwspTEkI9vOPbeurDxQs6S0d8zaaIf0TKjZFWY3oL33cmcRHBZ3FQj
	aLc4VhkA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9nds-00000008Uai-0kwJ;
	Fri, 17 Oct 2025 16:49:24 +0000
Received: from mail-pg1-x54a.google.com ([2607:f8b0:4864:20::54a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9ndp-00000008UZq-1k8J
	for linux-arm-kernel@lists.infradead.org;
	Fri, 17 Oct 2025 16:49:23 +0000
Received: by mail-pg1-x54a.google.com with SMTP id 41be03b00d2f7-b57c2371182so1953003a12.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 17 Oct 2025 09:49:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1760719760; x=1761324560; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hOIrByP8ZUQuvgPySyDlm6fhYAgi3WQo8mV8b43qPRw=;
        b=E+QE43J4lP+QBGmeuE1oFHn8uZKu08v6VElhcaaetoB0vU14eXtPARmZFr/u5y9oKS
         bLdGw1QtoQAQdppTOUzPAHMexaETbGDQzrIdaCWitKBqBrfvQoR4xkQDoHQ3bZTk6Q4O
         aGCsLqMRAGs15dp8aXxvzgWBvcZ6XOCRT+ELPN2pWw7YfEHkzPgVpImVBTAiOGuRaFY2
         urk7HlMm1Izfu6Zpg31645ouRg1M1WC9gsEPK9mdEwiQi1cuH4cpOBqH14mhZvZapB1C
         AAnddUEjRsOB8vfkb83Y7e8Utt6RTlwPgm7lyDljxHYwz33exf5bgr0rZ+ieiFua1Unj
         mTZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760719760; x=1761324560;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=hOIrByP8ZUQuvgPySyDlm6fhYAgi3WQo8mV8b43qPRw=;
        b=PnoFI84HdWtZaBxnK28vpBYozZcXa4UeyvTOpCd/ZuWLkgilQc3cNJxQYbyZ3e3Svf
         WyUOUtCgATCkuClpk93slN30/g0S3z5KiBngYJqI9VRde6R0EcSWsV4ASDvl1FeuxcF4
         Ud6OF7huN2qOHbn8B4q544msyIXhOy8cQJ+8ISjXe00PYklNfRtRdeP42kPWRLbOTQCs
         Dcm6vCRJvL0rX054TQVAm7tXA3/fn4/syYtmoFqz60uyG3MPaFJWmJx/jw+oPUd4dbhT
         fiJjw+9HXNNoOZZRq6jK3nIsXRZVvh+iztYTGGoDAb5yP0r777hyfSAoNSRW6fYBibC1
         PNVQ==
X-Forwarded-Encrypted: i=1; AJvYcCUQNVGGOTZ2ZbDNFUljoWD4W9hFgBqCmtd8ZeT+jojqKm0tlpO55Tb2f0Zo0DiKDGOf9sy/FV1g+5z5FH0x4RII@lists.infradead.org
X-Gm-Message-State: AOJu0YzO29nS09CzEeHau810RaUgTf1tO/zPIhcjuhS1inYkhJGoMw6L
	uv2Uzp6zTRoVxLUPf+mmjoH38ulH6kWAh4K9IIr+A3rDH8VcpStX+nOroVPv6OL+w4ZyqK2iYMo
	IHCFrjA==
X-Google-Smtp-Source: AGHT+IEuqhHVpbBVF4PRy6ZWRfMuRBmBaTfUEEN01d1cgDPtR7abw4umz8fmd13HoIYheHHmygdWMEDHdzI=
X-Received: from plbkg4.prod.google.com ([2002:a17:903:604:b0:290:be3d:aff6])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:903:40ca:b0:290:b928:cf3d
 with SMTP id d9443c01a7336-290cbd35d7dmr53537195ad.59.1760719759868; Fri, 17
 Oct 2025 09:49:19 -0700 (PDT)
Date: Fri, 17 Oct 2025 09:49:17 -0700
In-Reply-To: <CANiq72m0rNCaKandZgRa4dMhNOEN7ZanT5ht4kT8FLxYoWLVLQ@mail.gmail.com>
Mime-Version: 1.0
References: <20251016172853.52451-1-seanjc@google.com> <CANiq72ntKAeXRT_fEGJteUfuQuNUSjobmJCbQOuJWAcNFb1+9w@mail.gmail.com>
 <aPFVcMdfFlxhgGZh@google.com> <CANiq72m6vWc9K+TLYoToGOWXXFB5tbAdf-crdx6U1UrBifEEBA@mail.gmail.com>
 <diqzqzv2762z.fsf@google.com> <CANiq72m0rNCaKandZgRa4dMhNOEN7ZanT5ht4kT8FLxYoWLVLQ@mail.gmail.com>
Message-ID: <aPJzjWzL4EbwDM66@google.com>
Subject: Re: [PATCH v13 00/12] KVM: guest_memfd: Add NUMA mempolicy support
From: Sean Christopherson <seanjc@google.com>
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Ackerley Tng <ackerleytng@google.com>, Miguel Ojeda <ojeda@kernel.org>, 
	Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
	Paolo Bonzini <pbonzini@redhat.com>, linux-arm-kernel@lists.infradead.org, 
	kvmarm@lists.linux.dev, kvm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Shivank Garg <shivankg@amd.com>, David Hildenbrand <david@redhat.com>, Fuad Tabba <tabba@google.com>, 
	Ashish Kalra <ashish.kalra@amd.com>, Vlastimil Babka <vbabka@suse.cz>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251017_094921_452754_A2506238 
X-CRM114-Status: GOOD (  15.67  )
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

On Fri, Oct 17, 2025, Miguel Ojeda wrote:
> On Fri, Oct 17, 2025 at 1:57=E2=80=AFAM Ackerley Tng <ackerleytng@google.=
com> wrote:
> >
> > Using the command on virt/ would pick it up. Would it be better to add
> > "virt/" to the "automation" + update .clang-format while we're at it?
>=20
> Yeah, that is what I was suggesting if you rely on it (and if the
> maintainers of the relevant folders are OK with it).

Hmm, my vote would be to go all-or-nothing for KVM (x86), i.e. include ever=
ything
in KVM, or explicitly filter out KVM.  I don't see how auto-formatting can =
be
useful if it's wildly inconsistent, e.g. if it works for some KVM for-each =
macros,
but clobbers others.

And I'm leaning towards filtering out KVM, because I'm not sure I want to e=
ncourage
use of auto-formatting.  I can definitely see how it's useful, but so much =
of the
auto-formatting is just _awful_.

E.g. I ran it on a few KVM files and it generated changes like this

-       intel_pmu_enable_fixed_counter_bits(pmu, INTEL_FIXED_0_KERNEL |
-                                                INTEL_FIXED_0_USER |
-                                                INTEL_FIXED_0_ENABLE_PMI);
+       intel_pmu_enable_fixed_counter_bits(
+               pmu, INTEL_FIXED_0_KERNEL | INTEL_FIXED_0_USER |
+                            INTEL_FIXED_0_ENABLE_PMI);

and=20

-                       intel_pmu_enable_fixed_counter_bits(pmu, ICL_FIXED_=
0_ADAPTIVE);
+                       intel_pmu_enable_fixed_counter_bits(
+                               pmu, ICL_FIXED_0_ADAPTIVE);

There are definitely plenty of good changes as well, but overall I find the=
 results
to be very net negative.  That's obviously highly subjective, and maybe the=
re's
settings in clangd I can tweak to make things more to my liking, but my ini=
tial
reaction is that I don't want to actively encourage use of auto-formatting =
in KVM.

I think no matter what, any decision should be in a separate, dedicated pat=
ch/thread.
So for this series, I'll drop the .clang-format change when applying, assum=
ing
nothing else pops that requires a new version.

