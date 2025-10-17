Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A327ECCD183
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 17 Oct 2025 00:10:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=E1AC9iyyw2ScMA/Vd6Wp/4knwNlCQVVOev8xoskItFw=; b=EvCHzuD3KC9Ue7rNJTgL+c7dTO
	ANox7OYc4ayiZeihmEzKpqgB/Upba9BrqvsDXKKMne4WJphzDhVEE+SuMjR6jngoCUv47h0+APlt7
	GWKYBsC6RoHmLXPuHfSBNtIKZIgTmkPVXnqBvw4wcj18I07o5+0ask0dz/0Cy1RorFwHNQhIvtPfW
	oi17ZDcXpHAIHz3M/fnJVRriH82XA/ZG9VSzw6jE0GteM9InbddOvsW10RLoPxNMbf4bgaE6O9KeJ
	RjFHppBeTPGuxNoH9UNo6Gs5oNCr9Y00GQEYA8JFXa4/ijqqLy0JdodOGKfStr4Baf01bn+AF2qA4
	L3hy8PBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9Y2s-00000006B9p-0HB3;
	Fri, 17 Oct 2025 00:10:10 +0000
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9Y2p-00000006B9W-1euv
	for linux-arm-kernel@lists.infradead.org;
	Fri, 17 Oct 2025 00:10:08 +0000
Received: by mail-pl1-x62d.google.com with SMTP id d9443c01a7336-26816246a0aso1763285ad.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 16 Oct 2025 17:10:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760659806; x=1761264606; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=E1AC9iyyw2ScMA/Vd6Wp/4knwNlCQVVOev8xoskItFw=;
        b=fXeWHyTnTBvAic9542icE+HaW3r6YH/jjuNLkTl3BS8k0vJlv4yCO9KK+J8QTLiVOE
         qAJ37AzuGqKZQRS7NM1qu3P3jc7jH2EE3h5UwMGjagx8lPqq1otZeoj/kE0e6NlVZN4D
         cnVqvO6Q9blNFdGTPQICYiupVwIWvTN7a2HudWqsfLjV36CwO2Q3S2bm2t8gjaHMSmeG
         FNVPVVm6JSULTJ82KH/Zp24ZIAMolRN8fihzLWGArPH25kuKmkj1bqjhGdJ83zAop6vv
         qAxKVCgZ1VclzHbmKz0g4a6V/KNFqXajIYAAwmT4KVgMKR0CVqcVrZfa2dEfwU5I4+tX
         acWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760659806; x=1761264606;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=E1AC9iyyw2ScMA/Vd6Wp/4knwNlCQVVOev8xoskItFw=;
        b=ssxczyn0WbgTKFtnB8Ee8Otrt1/fOS+6/eKtfvcvouuhFYS3iy2a3ByHq+SegRgKY4
         TxI6n8PBunkonczR5pX3uHvNKp0g3v3VpB8FclVLmGoqMH/1TV2M9Bp+Yzs5wgqp6p7i
         wwP3NzHpjXBdywhgG4dYjFLFJImzJfPXXzxJVFRkSqNuEDEHGXLCfWUiGtbfbvNmHPEh
         hDprBGjyTI0NIslvxr445gS4/tgu773MsXPcvRBijI31lqbuRx1zv+Nww5aMd2f9WPPz
         ZMCu5qHKa4gCLTq8t2dhuWFgZgNfFTPI1K7u0z2UftHujigphhXy2AC9q+jSnuQmXbE6
         WRnQ==
X-Forwarded-Encrypted: i=1; AJvYcCVuZpdeXuCBGSyw62d508NXqw3CS/Zh+ozdFvfPWBwbmadRznanc8M9gf0Yq+GS6yHm6+7Y2SxKSykObdi3IWih@lists.infradead.org
X-Gm-Message-State: AOJu0YzF/0o7s5AxtMq7OqFZnmIFU/l0nsBMNnKj3CpfX4hscuZIh7an
	dEZV5B84LZQLMV9MVlHEvqXrgXy2F5bA2r4vZdoLybsgkHlDF2UrGNFC8GEQogPfL3aBovwdLLB
	kJzGFyk5snlCbTcCTK+j+WW53IcmEHhM=
X-Gm-Gg: ASbGncuWxlj2awHPgSrHmHGyZxOZUh46G5FGNwdMhzqBxJTJygNxLcXHYS1D8TtmC8h
	nG/wmiY37tTLIkjWbcnKF+4W9iEYBsi01cfpKrTMHm2SoU/a4dGAMR9oaJpI2OoMkAju8uhT0i5
	+E4ShKvqqcKbziHucGuJiATCRNdR/yZr/lAEXTgEWfcNOVh4XDU36wJHFkDPE1e532G8sCWL+oD
	KT6BvCKNnxKz1tcocgCIVxNZf1/8J0khsGQbBru7FXwBv2iJKCW50M5IHeQ4beqJXFbkkrmcSgF
	iK+g63Q4FlI2pV9g3cUgB4xzcdrjlt5F8NizfS/p8l9ggXC5cl3NzRSczO7gHBajsI1YvAZ9Wic
	dowiJ+FzXI42hWg==
X-Google-Smtp-Source: AGHT+IHyIQx0yThg9KT154kOAtD8f8239Y2M/cEMXBlvtxveyWdxtgQX335VASRAYK/45RIQjcQyHtpm998s6Nd9ll8=
X-Received: by 2002:a17:903:248:b0:275:c066:33dd with SMTP id
 d9443c01a7336-290cba529f3mr11403495ad.10.1760659806208; Thu, 16 Oct 2025
 17:10:06 -0700 (PDT)
MIME-Version: 1.0
References: <20251016172853.52451-1-seanjc@google.com> <CANiq72ntKAeXRT_fEGJteUfuQuNUSjobmJCbQOuJWAcNFb1+9w@mail.gmail.com>
 <aPFVcMdfFlxhgGZh@google.com> <CANiq72m6vWc9K+TLYoToGOWXXFB5tbAdf-crdx6U1UrBifEEBA@mail.gmail.com>
 <diqzqzv2762z.fsf@google.com>
In-Reply-To: <diqzqzv2762z.fsf@google.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Fri, 17 Oct 2025 02:09:52 +0200
X-Gm-Features: AS18NWCDoiITBSs67Uq2rZ6IBFom-AeoZUx_UgHO9S2h4SATYKwpJteeHcfF5xU
Message-ID: <CANiq72m0rNCaKandZgRa4dMhNOEN7ZanT5ht4kT8FLxYoWLVLQ@mail.gmail.com>
Subject: Re: [PATCH v13 00/12] KVM: guest_memfd: Add NUMA mempolicy support
To: Ackerley Tng <ackerleytng@google.com>
Cc: Sean Christopherson <seanjc@google.com>, Miguel Ojeda <ojeda@kernel.org>, Marc Zyngier <maz@kernel.org>, 
	Oliver Upton <oliver.upton@linux.dev>, Paolo Bonzini <pbonzini@redhat.com>, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	kvm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Shivank Garg <shivankg@amd.com>, David Hildenbrand <david@redhat.com>, Fuad Tabba <tabba@google.com>, 
	Ashish Kalra <ashish.kalra@amd.com>, Vlastimil Babka <vbabka@suse.cz>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251016_171007_462477_0F83D21F 
X-CRM114-Status: UNSURE (   9.24  )
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

On Fri, Oct 17, 2025 at 1:57=E2=80=AFAM Ackerley Tng <ackerleytng@google.co=
m> wrote:
>
> Using the command on virt/ would pick it up. Would it be better to add
> "virt/" to the "automation" + update .clang-format while we're at it?

Yeah, that is what I was suggesting if you rely on it (and if the
maintainers of the relevant folders are OK with it).

Cheers,
Miguel

