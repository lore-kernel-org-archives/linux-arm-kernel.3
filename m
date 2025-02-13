Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B25FDC02198
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Feb 2025 02:42:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=k3s//JceTAY3Zpon2LjpKfwKHPvJDyNxqt1PSKJ7V3w=; b=4qHZ30l+7tSX0ZW0ulowBOZavQ
	GTJ1U6PHxBx2b8QLtcAQpzgdZ+Rw/mxS2vkMFSIhBefenxD2PSFrTDFpCmWUWNSoOiN2fvm19BrrF
	jQOBib3N2YqytaQ130zlSkLUol4gqifLCWLSt2aq4TKVkOp5QT0QV3CXYGCiXN87md29H0TP1Plui
	rSfSFGpaZfGeQiTQfzKYqPWiqXe7KVg5MuOiqujUqvFojxhTiGWNAfhib/orhEBGEOh26yAPQxzNS
	eQZuu0vjSkbuJDRLZc+EFCU4RzGt+EFNgWgL61gKmbC2c6FIwkiGk0hYvn2XMi7PSvCPuX/s3oF2d
	MuriWipw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tiPB8-00000009WxH-22Td;
	Thu, 13 Feb 2025 02:42:14 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tiP9i-00000009Wn2-16uV
	for linux-arm-kernel@lists.infradead.org;
	Thu, 13 Feb 2025 02:40:47 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 123FB5C5F83
	for <linux-arm-kernel@lists.infradead.org>; Thu, 13 Feb 2025 02:40:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 43537C4CEE8
	for <linux-arm-kernel@lists.infradead.org>; Thu, 13 Feb 2025 02:40:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739414445;
	bh=9+J9A1tRdlpiZAuCMrDFjEHXNb2a6suCfw+XdHBTunA=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=cR6QRsE2QISausMky6hpqpB2ypd+N5qQwr5MBfdXrXhWG8cwpbsVqLmPYkb6oupwS
	 2pzRVD1M5AzmpUL3V8V4ry35BDOm1zY9IZ6EXRz64Oq0oEZnwY1qfULy9OYtHEFTpX
	 pD8ZTIDga4VFUwC+4MCpivFioZXqLicAfC4jD5XmI+YQHh6O6WBu8omDttEv9rCDlz
	 +SUb9zMc0lKTio9Eh/b4TSOyjQrKorvUSBBRckpI5a4hMwSxYu8tK9TxiLVeUPRVav
	 1jT3+qBN6c7aAN/zf+NyEgPn7t3bugETudrGS1AZ8duqqrz95VcrAHzOO0xHnBLuF9
	 hYMhtNFLa40qw==
Received: by mail-io1-f41.google.com with SMTP id ca18e2360f4ac-85525d58beaso29396939f.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 12 Feb 2025 18:40:45 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUnMezDWBIeTt7zNSPHjRr9Q6+RWB8GiepPxP+LqRj7FmE1R1bpfcdgBaLPBPwTpndAhxtyaC5k6ANc940v9XKs@lists.infradead.org
X-Gm-Message-State: AOJu0Ywxp3bZ2LZJpfkfW8DRjg56RPFqY5DNFWgxpgHjqOkUFbhTA4tE
	pKNPTr53FasZ9oNZcJHCXq9GWnpb4ktD3rDxh5ysBflt++aBMZaCYlNHhqc85a0Ezqr80P4GFDc
	Jt/Jd+RABvNoQHUvoK/GW2MNf47M=
X-Google-Smtp-Source: AGHT+IG9WVHruY+6TH77fSuZ307OK22ED1oLkMtB4PjP5hgJMrT0rljG2gvuZBGUwjypyUVUHA4mSX9EOmk/WrYfzow=
X-Received: by 2002:a05:6e02:3311:b0:3cf:c8bf:3b87 with SMTP id
 e9e14a558f8ab-3d18c210e0emr18520775ab.1.1739414444613; Wed, 12 Feb 2025
 18:40:44 -0800 (PST)
MIME-Version: 1.0
References: <20250127213310.2496133-1-wnliu@google.com> <CAPhsuW6S1JPn0Dp+bhJiSVs9iUv7v7HThBSE85iaDAvw=_2TUw@mail.gmail.com>
 <00fa304d-84bf-4fca-9b9a-f3b56cd97424@oracle.com>
In-Reply-To: <00fa304d-84bf-4fca-9b9a-f3b56cd97424@oracle.com>
From: Song Liu <song@kernel.org>
Date: Wed, 12 Feb 2025 18:40:33 -0800
X-Gmail-Original-Message-ID: <CAPhsuW4ct6W_4B0LFEjLePH1pAeNm4h8ePuQ3HcSoknXhQWN0w@mail.gmail.com>
X-Gm-Features: AWEUYZkI_0_wsZZ0OwuTA-kxxA-vmhY8DCcstBAWLmULwI5omzh3gtrXHTioD-8
Message-ID: <CAPhsuW4ct6W_4B0LFEjLePH1pAeNm4h8ePuQ3HcSoknXhQWN0w@mail.gmail.com>
Subject: Re: [PATCH 0/8] unwind, arm64: add sframe unwinder for kernel
To: Indu Bhagat <indu.bhagat@oracle.com>
Cc: Weinan Liu <wnliu@google.com>, Josh Poimboeuf <jpoimboe@kernel.org>, 
	Steven Rostedt <rostedt@goodmis.org>, Peter Zijlstra <peterz@infradead.org>, 
	Mark Rutland <mark.rutland@arm.com>, roman.gushchin@linux.dev, 
	Will Deacon <will@kernel.org>, Ian Rogers <irogers@google.com>, linux-toolchains@vger.kernel.org, 
	linux-kernel@vger.kernel.org, live-patching@vger.kernel.org, 
	joe.lawrence@redhat.com, linux-arm-kernel@lists.infradead.org, 
	Puranjay Mohan <puranjay@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250212_184046_417031_4783AD82 
X-CRM114-Status: GOOD (  19.69  )
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

On Wed, Feb 12, 2025 at 4:10=E2=80=AFPM Indu Bhagat <indu.bhagat@oracle.com=
> wrote:
>
> On 2/12/25 3:32 PM, Song Liu wrote:
> > I run some tests with this set and my RFC set [1]. Most of
> > the test is done with kpatch-build. I tested both Puranjay's
> > version [3] and my version [4].
> >
> > For gcc 14.2.1, I have seen the following issue with this
> > test [2]. This happens with both upstream and 6.13.2.
> > The livepatch loaded fine, but the system spilled out the
> > following warning quickly.
> >
>
> In presence of the issue
> https://sourceware.org/bugzilla/show_bug.cgi?id=3D32666, I'd expect bad
> data in SFrame section.  Which may be causing this symptom?
>
> To be clear, the issue affects loaded kernel modules.  I cannot tell for
> certain - is there module loading involved in your test ?

The KLP is a module, I guess that is also affected?

During kpatch-build, we added some logic to drop the .sframe section.
I guess this is wrong, as we need the .sframe section when we apply
the next KLP. However, I don't think the issue is caused by missing
.sframe section.

Thanks,
Song

