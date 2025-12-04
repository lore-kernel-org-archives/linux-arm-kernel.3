Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3249BD1CDAE
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  4 Dec 2025 00:05:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Zd9WoFQTvNfYXS0FutJkOHLRDDNZG45Z8fkn2eFEtfA=; b=bj7bK6tQMRUHhCLJwZC7BECAhE
	xxU4tORj1dKwkAE6YiZdPoZwPtyoOk16EX1b7eODvaJjAQYMesbrR+pF3BlqFZggcJ5Dx4D4F3Z6i
	NIkwlTBmUCiuaaaQ9mr7GBApWvyINlJ66muzkBtltS6nYSfRt1ctMFdFB8ESj8mHp43uB9GfHl4vO
	XuHK9Dxl7hV4sle3VpRqthTwrK5jCcYxgmrSF9RDXnl57thtZIpTCq32wogj/gPwok1y1txBTDW8U
	McX1z+Gt/WmOqf3WdRdJ+R+z/LnmDej9fiwz5g4NzaOMThEWcp46wCCo9cxUayKfxIiBl+52mJ9b4
	mwnvbtBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQwqZ-00000007HSa-0mrv;
	Thu, 04 Dec 2025 00:05:23 +0000
Received: from mail-lf1-x136.google.com ([2a00:1450:4864:20::136])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQwqU-00000007HRS-1Gfq
	for linux-arm-kernel@lists.infradead.org;
	Thu, 04 Dec 2025 00:05:19 +0000
Received: by mail-lf1-x136.google.com with SMTP id 2adb3069b0e04-594270ec7f9so281064e87.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 03 Dec 2025 16:05:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1764806715; x=1765411515; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Zd9WoFQTvNfYXS0FutJkOHLRDDNZG45Z8fkn2eFEtfA=;
        b=1CXqANjYiFFlKp9ftWDR2yPyqTVXyegf1rwShRdeLWGH+JEYiYhN2b9xqZmnzEmrYd
         F5ZGkqPy7e3YFOA2Z26dImzGkWa3nH96T+1BFWnoWsxxbAbUsrIyFSHr69ekSprQR2k3
         0fGci5L4Z/7mXCLjPiJI0eRhv4aCANcfDA0CDFitCf1AhLP8zBDG/v+IAWM0s2Uvlzfa
         r4D0zJeixlGWR0MYUXvogMPL6jWsKwDVROKWiSl+5tLdjh7hYVku5E4EQB3FcGFIV8d0
         wrW8TiJpc4lejKZEBctzm3jqAUMpLrC37e3VCuylHh7ANssEMdh3uCn5E0QnCdmOKXSP
         eckg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764806715; x=1765411515;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Zd9WoFQTvNfYXS0FutJkOHLRDDNZG45Z8fkn2eFEtfA=;
        b=rJd7cPEo6l3sEu4yyafu78sbNLOmFLgxvSTISFxzN7Ef8nOk8LsTR0ddJ3chBa6aHz
         PBrRexA3OiTPWi3Dqqa4DSlzt7bM/X8THcflXqgfBYgD/7ratJBsR+48bXwTJqxPwxdU
         H86doWstouFNhf0HG6RtBAKHPU+X8AMHLxZO72zk72JhnD1Leuzs0Yd3HT6AYvZkOl9A
         aY1oNTDgBT5gX3x/rugu79/M2YO5RSy1Ll5U/HH1fD3/t70j8poaACkOUcK0Quuo6X9W
         sxl7Wr2AxxpbWRSb1PDxLZriT82GYkdHnJkvsLFAfry3+DVRMoBXAZ+LTRd42V0UzTMx
         6U4w==
X-Forwarded-Encrypted: i=1; AJvYcCW5HtIg3sV9lnuPz50uPC1aO7QVG10dL8LhCur+oYZCNNvTLABAQxXwWMCEbpiCoYECEZqKhK4yRIpaRiOobb/P@lists.infradead.org
X-Gm-Message-State: AOJu0YzZmwrAwdxNWxB98UQEjt1ASozkizDRa+DwmGJX8q/K5NzdSFSp
	bSpliRg7+IpHdtCNV/hXZ3j8HwLeQr3FswTfpCo5UDMJAWVigsXdFX7JXBhU6d7iF2XcZj7Wgex
	YbtcEj2YRn776bV9M6ACKMRyseyTNthsseEugL+C3
X-Gm-Gg: ASbGncvvL3Yn9kM0LBTgOh65iWrSnfqex7N9Av/z8isoVWPzoRFzN5KRNcOfKZzl5Jt
	yOquQTWrqkbVQapwJ6Iuw3EaSkoFYmSIBjf/lpMyTeZwh8NJCajyyJVBI5m5FSd54EN1GUsSb7k
	wOW3DQ9MGrf0lnZMi709G/HJ4dyNXDXQq81qm1afjBJ+lXDwb6MMDJxvTh0jSADf+6Bz+ruscrk
	4c8YO1EJFIOxcj5yTGlvuPoi3vmduV2dcjY/GK7QJKz8lILU+enJ483X1Ww0+GPSVagh9Ye
X-Google-Smtp-Source: AGHT+IF4CyNFKv3NT4Ky0XeOn1TQzX5YXD6kxpQuevTbiLqvfi0Z1H0r6mqBjI/VHgPS5RUsjZgaT368W08YU9UmgDU=
X-Received: by 2002:a05:6512:12c4:b0:578:ed03:7b5f with SMTP id
 2adb3069b0e04-597d3f7b821mr1673675e87.26.1764806715139; Wed, 03 Dec 2025
 16:05:15 -0800 (PST)
MIME-Version: 1.0
References: <20250501183304.2433192-1-dmatlack@google.com> <aBPhs39MJz-rt_Ob@google.com>
 <CALzav=eqv0Fh9pzaBgjZ-fehwFbD4YscoLQz0=o0TKQT_zLTwQ@mail.gmail.com> <aRZ9SQ_G2lsmXtur@google.com>
In-Reply-To: <aRZ9SQ_G2lsmXtur@google.com>
From: David Matlack <dmatlack@google.com>
Date: Wed, 3 Dec 2025 16:04:47 -0800
X-Gm-Features: AWmQ_blvUOA-vJuP7PArgXkGtxVwcyZaljS6okCvAjRlV-VnKxXpsCQN-Lg9GyA
Message-ID: <CALzav=fN4FpZsfzwbdLeNSj4nx4OpRkwHvKiZNVgP8S-zsUvJA@mail.gmail.com>
Subject: Re: [PATCH 00/10] KVM: selftests: Convert to kernel-style types
To: Sean Christopherson <seanjc@google.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, Marc Zyngier <maz@kernel.org>, 
	Oliver Upton <oliver.upton@linux.dev>, Joey Gouly <joey.gouly@arm.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Zenghui Yu <yuzenghui@huawei.com>, 
	Anup Patel <anup@brainfault.org>, Atish Patra <atishp@atishpatra.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
	Christian Borntraeger <borntraeger@linux.ibm.com>, Janosch Frank <frankja@linux.ibm.com>, 
	Claudio Imbrenda <imbrenda@linux.ibm.com>, David Hildenbrand <david@redhat.com>, 
	Andrew Jones <ajones@ventanamicro.com>, Isaku Yamahata <isaku.yamahata@intel.com>, 
	Reinette Chatre <reinette.chatre@intel.com>, Eric Auger <eric.auger@redhat.com>, 
	James Houghton <jthoughton@google.com>, Colin Ian King <colin.i.king@gmail.com>, kvm@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251203_160518_368376_3B40F0C0 
X-CRM114-Status: GOOD (  24.75  )
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

On Thu, Nov 13, 2025 at 4:52=E2=80=AFPM Sean Christopherson <seanjc@google.=
com> wrote:
>
> On Fri, Oct 17, 2025, David Matlack wrote:
> > On Thu, May 1, 2025 at 2:03=E2=80=AFPM Sean Christopherson <seanjc@goog=
le.com> wrote:
> > > On Thu, May 01, 2025, David Matlack wrote:
> > > > This series renames types across all KVM selftests to more align wi=
th
> > > > types used in the kernel:
> > > >
> > > >   vm_vaddr_t -> gva_t
> > > >   vm_paddr_t -> gpa_t
> > >
> > > 10000% on these.
> > >
> > > >   uint64_t -> u64
> > > >   uint32_t -> u32
> > > >   uint16_t -> u16
> > > >   uint8_t  -> u8
> > > >
> > > >   int64_t -> s64
> > > >   int32_t -> s32
> > > >   int16_t -> s16
> > > >   int8_t  -> s8
> > >
> > > I'm definitely in favor of these renames.  I thought I was the only o=
ne that
> > > tripped over the uintNN_t stuff; at this point, I've probably lost ho=
urs of my
> > > life trying to type those things out.
> >
> > What should the next step be here? I'd be happy to spin a new version
> > whenever on whatever base commit you prefer.
>
> Sorry for the slow reply, I've had this window sitting open for something=
 like
> two weeks.

No worries, thanks for taking a look :)

>
> My slowness is largely because I'm not sure how to land/approach this.  I=
'm 100%
> in favor of the renames, it's the timing and coordination I'm unsure of.
>
> In hindsight, it probably would have best to squeeze it into 6.18, so at =
least
> the most recent LTS wouldn't generate conflicts all over the place.  The =
next
> best option would probably be to spin a new version, bribe Paolo to apply=
 it at
> the end of the next merge window, and tag the whole thing for stable@ (ma=
ybe
> limited to 6.18+?) to minimize downstream pain.

With LPC coming up I won't have cycles to post a new version before
the 6.19 merge window closes.

I'm tempted to say let's just wait for the next LTS release and merge
it in then. This is low priorit, so I'm fine with waiting.

