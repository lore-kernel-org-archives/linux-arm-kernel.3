Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E4FACCD199
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 16 Oct 2025 21:07:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YqKLtcHyZtQvUCKV9AK34ygiWjcxKsGF+96gmD+h6kc=; b=N3y+3kMrLiQPCYrUwcogacYBsS
	w/CR+cwB4E9ueEYPmE8H6PEOf//xzPizt1houEWbGhBB6QEY6BGeQXxE+lHFBJNSkRHNbcFoHB2ik
	hOLU3DBUQpfQnMUeBkiW1P76mvmYLkOzND/SwhyBQhkbnioLO2e89bDWZMfHv6GBFlzZVYaSD835Q
	SJ38z2R+FdTs+zRvrLDXoTNuyUfAZeXzmqweURZXlkjmGC1Gd8qSDx2AXhJXQ4j+fxRwtKUpayApZ
	wbdSakHcmDEvf/DRhDAmIvDxjGDF/Moc+hUjrI5gtYXpcaMJq1YCeXOqF9BVnZnVdqHs3XC68CScP
	R6v0wcQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9VBv-00000005xHB-3ZaP;
	Thu, 16 Oct 2025 21:07:19 +0000
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9VBt-00000005xGg-3U39
	for linux-arm-kernel@lists.infradead.org;
	Thu, 16 Oct 2025 21:07:18 +0000
Received: by mail-pj1-x1030.google.com with SMTP id 98e67ed59e1d1-3352a28d28eso173356a91.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 16 Oct 2025 14:07:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760648837; x=1761253637; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YqKLtcHyZtQvUCKV9AK34ygiWjcxKsGF+96gmD+h6kc=;
        b=AEtcN2V7JwAAzjFn15tfP486qDM4toVGpQ8GAMJI+cRiXtu5sFgEpC9BzA7Kp0oLSI
         xVNp+FLaO5JHN4RWnTb1ZgXXErxd7RFNOygCa+1wRym4xgZBACjfOHEe5axsUu2kbKb7
         ZZD9nuGmz+UyEN1GztgXe6fQEFRQlS+QUroRlMoQNuMFOZed/ptCRF8MVLUS6ZST4QlX
         HKC6gn29QYVQlSirkDwehqBLH9e1yZuyzQOuGj8UMl6uyQVNQ08RDjwJaoEbNQLBj5Pu
         QGX3l4SrzKt/DQyXt2MGEQFmW43N+aP9xhsYlVrecy0+oBKV3FkP5OUtn32fv3FAE5x7
         dV7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760648837; x=1761253637;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YqKLtcHyZtQvUCKV9AK34ygiWjcxKsGF+96gmD+h6kc=;
        b=GSD0tdz/56Mo2rItawxuUg3hzVrTAN7BfRHoyZG13Oym9NvRzKrulyCSh7FHsKKTCp
         nha5jO70jl3HJSTyqqqJbRX5xrsE1kPRfsUYvw0mZ9i+AfjkSCcsnGL9RYqGAoesgdrk
         TclS7zOk9N/Secis4vHY4obHS4B++Oj6+7r+yZ4x7vh7srDX9moJPYTwhR6CanDbp09b
         KBuFpCxLoUuhnn6Iv0xIwiSSJjWrjJXuswwaj76lZ3I9Gkl6yuYirs0/xA0g+Ejt1wok
         yttwfFNA1/WQqjJaqbMk1EFWZYpvs2jGlHYcVe1wErj0aslOnp83stnoDu9vv0kuFfm8
         hyeg==
X-Forwarded-Encrypted: i=1; AJvYcCVcgSpdzqx7W6Ef3iNutYLrD1qyrrF1cKX/fKwsk3GHISHqv6xFkO/xeiHpm+bHm1yNJmXtbl+L/znp1ObV6ciT@lists.infradead.org
X-Gm-Message-State: AOJu0YzOdlEUl2a5TdOJKfidYmpT0gM2sJgdzIv3garRZtvnQS7m8aRg
	8GgCQj8rMKGZBpWtfkoKaCrWkyzrXITZmT8IUhugq/4fdtH1wKWi4mgaCNbhEk0bf9MFmNhMOMA
	7PeFBwoGj8Gupjk8q9ILMx2oHN29YCJddL2kD4dM=
X-Gm-Gg: ASbGncuer8krKbd+/qdWg2VXVmLtIpySU+VRzdqPTxllKImp/l1+/z4lqwmk5MpwDk8
	k9Hu1eZnNEEKtor3Xfrxa4uJtWqZ9M/uJ79gpDTNzkE2oLpqd4jqLL6JnA4svx9cI5sr2TVTjnq
	WfdBgXmh1TRun0Y0YDGwVi59vsCCeK9un1ZclKjZrfxEQA+AFM6ZrrqBrKryckM5rgHgjR09IRk
	6ftohJLxsxpqvfdOZ3IagI407p41FwmT31j52WfOsdXt0SdyJIXFfkrzcRR3txRr7Wn5xyvGz+Z
	XQPtZwnS8u51vjT95YXLjHh/N+Vc79ngw4+dLZ+oWFZwY+Um4+FNrqFTU/kWzBuW/161TGIVUii
	gDQlGDmbZCU1CknZL8e6onim+
X-Google-Smtp-Source: AGHT+IEIgAYtM+PkA8oLdH6dq6tTOHVM2SK/9pf6/KLEGFt0fs1UrG1QtsI18/3/wnm81TfvgNcSQoGgwMXacG4fjDo=
X-Received: by 2002:a17:903:40ca:b0:290:55ba:d70a with SMTP id
 d9443c01a7336-290c9cf3306mr8101005ad.2.1760648836981; Thu, 16 Oct 2025
 14:07:16 -0700 (PDT)
MIME-Version: 1.0
References: <20251016172853.52451-1-seanjc@google.com> <CANiq72ntKAeXRT_fEGJteUfuQuNUSjobmJCbQOuJWAcNFb1+9w@mail.gmail.com>
 <aPFVcMdfFlxhgGZh@google.com>
In-Reply-To: <aPFVcMdfFlxhgGZh@google.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Thu, 16 Oct 2025 23:07:02 +0200
X-Gm-Features: AS18NWCIqm_srauk6JXkuo1Nu5EkkFsJYyp4maKnlr0nVE8sbB1v3JnElr1TnCc
Message-ID: <CANiq72m6vWc9K+TLYoToGOWXXFB5tbAdf-crdx6U1UrBifEEBA@mail.gmail.com>
Subject: Re: [PATCH v13 00/12] KVM: guest_memfd: Add NUMA mempolicy support
To: Sean Christopherson <seanjc@google.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Marc Zyngier <maz@kernel.org>, 
	Oliver Upton <oliver.upton@linux.dev>, Paolo Bonzini <pbonzini@redhat.com>, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	kvm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Ackerley Tng <ackerleytng@google.com>, Shivank Garg <shivankg@amd.com>, 
	David Hildenbrand <david@redhat.com>, Fuad Tabba <tabba@google.com>, Ashish Kalra <ashish.kalra@amd.com>, 
	Vlastimil Babka <vbabka@suse.cz>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251016_140717_867942_89702D5F 
X-CRM114-Status: GOOD (  17.59  )
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

On Thu, Oct 16, 2025 at 10:28=E2=80=AFPM Sean Christopherson <seanjc@google=
.com> wrote:
>
> Oh, I take it .clang-format is auto-generated?  Is it a "formal" script, =
or do
> you literally just run the grep command in the comment?

I just run it and copy-paste the results there from time to time.
Yeah, a very low-tech solution :)

> I don't think I care if it's in the list?  I honestly don't know for sure=
, because
> it's entirely possible I'm consuming .clang-format without knowing it.  I=
 added
> the entry based on someone else's request.
>
> Ackerley?

If you are not relying on it, then please just skip it, yeah.

> Is it possible, and sensible, to have per-subsystem .clang-format files? =
 KVM
> (virt/kvm) and KVM x86 (arch/x86/kvm) both have has several for_each macr=
os,
> pretty much all of which are more interesting than kvm_gmem_for_each_file=
().

There is `InheritParentConfig` nowadays, but from a quick look I don't
see it supports merging lists.

So to do something fancier, we would do need something like we did for
rust-analyzer, i.e. a `make` target or similar that would generate it.

Otherwise, we can just add extra macros at the top meanwhile.

What we did last time is just to add `tools/` to that command --
increasing coverage is not an issue (I just started with `include/`
originally to be a bit conservative and avoid a huge list until we
knew the tool would be used).

Cheers,
Miguel

