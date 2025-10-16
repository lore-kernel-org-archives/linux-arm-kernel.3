Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C9DFCCD183
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 16 Oct 2025 23:57:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:From:Subject:Message-ID:References:Mime-Version:
	In-Reply-To:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=W+gFerwj7sc87prcy/GQMGpAh3zQW+FK7X8HO9E9Qn8=; b=Rxc7Yjp1b2iHbhSf8utsVgADmj
	Dv5TFkg8SODasvSI2KaWiTTbtQDOr/ctoM/nQOngjNW1v1GDm3rnRa7GQI4Lx5GZd6pIbijXiOld2
	scJvpAD1R1V7dYypFwtZbEFtxi/kTIkKVabHStEsfaVAP0mofatuy+Kx2NmMu7RPcYzutV7pLWf1H
	QpidCclevC7IMLjOSUejD8MY/IlVFf29R/GR4VvY94MQDAVq9L+sSKWR2RDnqW0sEvt0pMIucYqGm
	Bcse/82IgTVfEBcZXvJw89oJVEGcwdwIkJppFNOoHQqAgxMQ5OXpJ1eZ4LtD32F1ltY75ZPBM+V7w
	iRIlUtiw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9Xqs-00000006ANG-3baf;
	Thu, 16 Oct 2025 23:57:46 +0000
Received: from mail-pf1-x44a.google.com ([2607:f8b0:4864:20::44a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9Xqp-00000006AMp-1pad
	for linux-arm-kernel@lists.infradead.org;
	Thu, 16 Oct 2025 23:57:44 +0000
Received: by mail-pf1-x44a.google.com with SMTP id d2e1a72fcca58-78102ba5966so1349756b3a.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 16 Oct 2025 16:57:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1760659062; x=1761263862; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=W+gFerwj7sc87prcy/GQMGpAh3zQW+FK7X8HO9E9Qn8=;
        b=2Lw/KgvlHT1bG/WoItUmKf5oRNFVjZpCncomHQlB7f8m9s8AbjZGdOm2ygepQemNA9
         ZVsEh2ck5K/MXKFLYqzTbbOTn44WRZKCMTt/QmhaCFmq8fC/0Ohy+58vnJuKtU+TLrlK
         890dmR6fAFEmD7Fxky0Kgc9f8NO9B8GvGIGYC+lKQB8fNv5FbNkOPlOEsm3VjJzZXJF/
         ZdC7Xl7ANGXLVPH6TgpDCQDWYxGGCdWxRILkWjTY/hYxEQ4doSeuIXGcgXobJa0H1PaW
         BxSay5KcioP+wfuSrgnGgTlOBdl/LDYy4Ksy85E8V8U83uj7PaJw8BEJMMHbJkCJqhlW
         aDhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760659062; x=1761263862;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=W+gFerwj7sc87prcy/GQMGpAh3zQW+FK7X8HO9E9Qn8=;
        b=tVaJ5bm2ZGvSmQCTkgtzBY0vZueMKWchS75RVRNduqQ7KFDCaLrxO0fQM9J/+erAy/
         yeOpgpd/TcvqCtYO03U8Bog2sLdY7y9vas0KpkJ9uZSN8+6as7EFodqk8gKCWpwCPnoX
         C49E5RYwmIEK77Mbm0VsL5rIEt0pameWxJamxqGGh9G8Vyu+A0OEXkf4e1shm74hXfrN
         kSbgGBKTHd8nor1LX1lfMiY6LSo6of68Spr2pRbhza0yV8C3BPlrqKXQSL0Xc46IaH7E
         BApu0/172IXLNKBg6nCBAXfCyS0fEhhvUEfRSsCIq+XM1GmdoEBV1v6V5lrsGzwK1fOV
         Yk9w==
X-Forwarded-Encrypted: i=1; AJvYcCViOFKejHitd/Ono38GZ2cXXr+LYahRP/X8DQi3u5WEexoK/1F3ZyvXvnlFlHuTkA5T305odaR2wDVjmX6tZDoB@lists.infradead.org
X-Gm-Message-State: AOJu0Yx5aJSiv8Kjriu++AmHgytyqbgtdnTjBAfm9ijq5sSNy+ty7IL5
	ZdUXEnS8SKsn0upFf2oVAZ0nZmsOQ6hoQhoxNb05886nj9tu7Hvvy6Hfzv6rkkWBabVPDKtY3mo
	64QqY5SMcoH+b96J/LelLdLec7A==
X-Google-Smtp-Source: AGHT+IE2GZ6bYZtCSD13nlTnA7H2MPbbvOsHzo3LQjiehRmABnDXMBoSAsb+4L5uxVyy1gpfUlSoXNG9qcSb1xRc+Q==
X-Received: from pjyj8.prod.google.com ([2002:a17:90a:e608:b0:33b:9959:6452])
 (user=ackerleytng job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6a21:3992:b0:334:a99f:926 with SMTP id adf61e73a8af0-334a99f0c06mr1602497637.11.1760659061843;
 Thu, 16 Oct 2025 16:57:41 -0700 (PDT)
Date: Thu, 16 Oct 2025 16:57:40 -0700
In-Reply-To: <CANiq72m6vWc9K+TLYoToGOWXXFB5tbAdf-crdx6U1UrBifEEBA@mail.gmail.com>
Mime-Version: 1.0
References: <20251016172853.52451-1-seanjc@google.com> <CANiq72ntKAeXRT_fEGJteUfuQuNUSjobmJCbQOuJWAcNFb1+9w@mail.gmail.com>
 <aPFVcMdfFlxhgGZh@google.com> <CANiq72m6vWc9K+TLYoToGOWXXFB5tbAdf-crdx6U1UrBifEEBA@mail.gmail.com>
Message-ID: <diqzqzv2762z.fsf@google.com>
Subject: Re: [PATCH v13 00/12] KVM: guest_memfd: Add NUMA mempolicy support
From: Ackerley Tng <ackerleytng@google.com>
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>, 
	Sean Christopherson <seanjc@google.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Marc Zyngier <maz@kernel.org>, 
	Oliver Upton <oliver.upton@linux.dev>, Paolo Bonzini <pbonzini@redhat.com>, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	kvm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Shivank Garg <shivankg@amd.com>, David Hildenbrand <david@redhat.com>, Fuad Tabba <tabba@google.com>, 
	Ashish Kalra <ashish.kalra@amd.com>, Vlastimil Babka <vbabka@suse.cz>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251016_165743_481276_66F4D117 
X-CRM114-Status: GOOD (  28.50  )
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

Miguel Ojeda <miguel.ojeda.sandonis@gmail.com> writes:

> On Thu, Oct 16, 2025 at 10:28=E2=80=AFPM Sean Christopherson <seanjc@goog=
le.com> wrote:
>>
>> Oh, I take it .clang-format is auto-generated?  Is it a "formal" script,=
 or do
>> you literally just run the grep command in the comment?
>
> I just run it and copy-paste the results there from time to time.
> Yeah, a very low-tech solution :)
>

I assumed someone was doing this from time to time, and I ran the grep
command in .clang-format but IIUC it only reads tools/ and include/
(which doesn't cover this new macro) and so I thought the "automation"
would miss this new macro, hence I suggested to manually add the macro.

Using the command on virt/ would pick it up. Would it be better to add
"virt/" to the "automation" + update .clang-format while we're at it?

$ git grep -h '^#define [^[:space:]]*for_each[^[:space:]]*(' virt/ | sed "s=
,^#define \([^[:space:]]*for_each[^[:space:]]*\)(.*$,  - '\1'," | LC_ALL=3D=
C sort -u
- 'kvm_for_each_memslot_in_hva_range'
- 'kvm_gmem_for_each_file'

>> I don't think I care if it's in the list?  I honestly don't know for sur=
e, because
>> it's entirely possible I'm consuming .clang-format without knowing it.  =
I added
>> the entry based on someone else's request.
>>
>> Ackerley?
>
> If you are not relying on it, then please just skip it, yeah.
>

I'm using it, I believe clangd (my lsp server) uses it to reflow correctly.

>> Is it possible, and sensible, to have per-subsystem .clang-format files?=
  KVM
>> (virt/kvm) and KVM x86 (arch/x86/kvm) both have has several for_each mac=
ros,
>> pretty much all of which are more interesting than kvm_gmem_for_each_fil=
e().
>
> There is `InheritParentConfig` nowadays, but from a quick look I don't
> see it supports merging lists.
>
> So to do something fancier, we would do need something like we did for
> rust-analyzer, i.e. a `make` target or similar that would generate it.
>
> Otherwise, we can just add extra macros at the top meanwhile.
>
> What we did last time is just to add `tools/` to that command --
> increasing coverage is not an issue (I just started with `include/`
> originally to be a bit conservative and avoid a huge list until we
> knew the tool would be used).
>
> Cheers,
> Miguel

