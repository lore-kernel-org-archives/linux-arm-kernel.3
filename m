Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9589C02198
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Feb 2025 18:56:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qsZ3M7HjZdTjo5f5WrSVbOZM9SW596Y6SP7V0X9VgQ8=; b=JSnsSIX6W4athKE1zfnkvCL5wl
	x48ITBW2ubukeT7Ncadjn0lAtlWuWvegXhNbv5+6ln8Cfkis9E0nEbBbVxZyrGKMfT6qmgnYVzTkd
	jCcbGOmV2iH7RfPkNCd6k4CFoNC8ltnS9Mn5d1Zd1O6d0XNxlfKZEmL/psnlw6pTma8KjKF7l80xS
	e42lw21QNMUbMNGy153WI7sEcNa6dsJfwNJf8orz5E0l9yxZrQlSPt5pJMzB0A3DKU7joy4B+nnjH
	nqDFIQi1hVVoemcws10VjFkHMqak44q+6BhBFgJN2LpuvS3ATKeA9AjukP2BRoarb7CLl7XTpYIUR
	5wV2zwWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tj0r4-0000000Fwxf-1Qme;
	Fri, 14 Feb 2025 18:56:02 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tj09H-0000000FpSz-2zOR
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 14 Feb 2025 18:10:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=qsZ3M7HjZdTjo5f5WrSVbOZM9SW596Y6SP7V0X9VgQ8=; b=NyaaSqzhe4icAlewPTN/MjTYNO
	dVBrrB65KdE5im5iVNFzqNkUChB1T7yAGAWguzHj701vxhK1IYj+Bi16vFaAZOubl2dfhqHclPA8n
	DV/uEdDMM0ZWu7+0Q9Fyfga++8NsIPblnrqTsdumlF1cRSAA1exBB8dxcCD2koZs6l5TtPFwolZ0a
	J6rsxkQotAZEnAaI5KOr+P9CUEbCSFe2QHqaIh1/htXsBlDqt7bqyVaEntfEsTGF5yBODbi4q+Ifo
	bNcSwNwOwK4LF9OC8FB7TDDgTDHc6U7uQn+DVetjVFnkw+uwToDDj40CHpnTJaTtfEhhX+t7j6Tue
	jJLU4hBA==;
Received: from dfw.source.kernel.org ([139.178.84.217])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tj09E-00000001JB0-0B6z
	for linux-arm-kernel@lists.infradead.org;
	Fri, 14 Feb 2025 18:10:46 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id EEBF15C5B21
	for <linux-arm-kernel@lists.infradead.org>; Fri, 14 Feb 2025 18:10:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C728CC4CEE9
	for <linux-arm-kernel@lists.infradead.org>; Fri, 14 Feb 2025 18:10:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739556641;
	bh=qsZ3M7HjZdTjo5f5WrSVbOZM9SW596Y6SP7V0X9VgQ8=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=bZ4ckviDNzJRoX58jtuwMBbs3xQ14eqGG8zrnD5z2qhjAnWh7XAbqnv24/noOLgLu
	 olEqflJMzBqxLIEUyMVH3F4JxPU9p/38924gRExVw4lASKGNfh4Y0RKowlVmoMp+y9
	 WrNx86OLMB/QPjzgAASBK3Cbi/Pz21kAMqpUQNneKoJPJUQ4/2UWGhc/0tYX1Ms1zp
	 eB8cqCL00KIgU7sdFtDTngq0t2on1bw6LCWt1GzyeaCQkPVYQjfQv/nOu4ib+I40lY
	 neKX0TUZmlPfSyUhUPHyxMw+0W8iXRWqAGjUL7JJhuY6e8NptBhrP7LztciXGJRnoD
	 OdYj8zyXXbjPw==
Received: by mail-il1-f176.google.com with SMTP id e9e14a558f8ab-3ce886a2d5bso19986515ab.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 14 Feb 2025 10:10:41 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWscVZQpIRGoK3cj/E8Wo2rQR45+f6qsvOwAQD0S0bps/LUODVv1oCtqkHBeyCiX4DlS5iEOJPbc5Qth2DfE50w@lists.infradead.org
X-Gm-Message-State: AOJu0Yzymk0rJoCelrFVeMcD7e3RDKAsHjeuRKbdoX3AEpZ3+JkJ1bZ0
	p6XYsmFzS7iiUYA+IQXTCbkLfYQZtHCVBKVBJt7C3oSbT6+zYLu9X0F6yn6598BAmHenCseWNyC
	pj6d5qtrE5KtFoKDEAAxVxDFAzDk=
X-Google-Smtp-Source: AGHT+IG8JZIw5oJUYOuAL23YnIRiuk4cQKNQCcLNAYc2hmGsxchwTn9wwIBLREFhDO96qyScsuyGb1CQAAe2KZkUZEM=
X-Received: by 2002:a05:6e02:3103:b0:3d0:4e0c:2c96 with SMTP id
 e9e14a558f8ab-3d280771b4cmr3760875ab.2.1739556641173; Fri, 14 Feb 2025
 10:10:41 -0800 (PST)
MIME-Version: 1.0
References: <20250127213310.2496133-1-wnliu@google.com> <CAPhsuW6S1JPn0Dp+bhJiSVs9iUv7v7HThBSE85iaDAvw=_2TUw@mail.gmail.com>
 <00fa304d-84bf-4fca-9b9a-f3b56cd97424@oracle.com> <CAPhsuW4ct6W_4B0LFEjLePH1pAeNm4h8ePuQ3HcSoknXhQWN0w@mail.gmail.com>
 <mb61p1pw21f0v.fsf@kernel.org> <CAPhsuW5VCmuPLd8wwzBp_Divnu=uaZQcrRLsjsEOJ9GmA0TR5A@mail.gmail.com>
 <mb61pseoiz1cq.fsf@kernel.org> <CAPhsuW7bo4efVYb8uPkQ1v9TE95_CQ6+G3q4kVyt-8g-3JD6Cw@mail.gmail.com>
 <mb61pr0411o57.fsf@kernel.org> <CAPhsuW7fBkZaKQzLvBqsrxTvpJsfJfUBfco4i=-=C_on+GdpKg@mail.gmail.com>
 <mb61p7c5sdhv6.fsf@kernel.org>
In-Reply-To: <mb61p7c5sdhv6.fsf@kernel.org>
From: Song Liu <song@kernel.org>
Date: Fri, 14 Feb 2025 10:10:29 -0800
X-Gmail-Original-Message-ID: <CAPhsuW6vDYjiy1_tOhy--ULC8UWtpu4E_nd8uY8qg98eLuygQw@mail.gmail.com>
X-Gm-Features: AWEUYZlpNf1avV1LJZl1tk2itoEk1uL2WdB4o2NSm5faGZWiZiU7f7T7DB78KCg
Message-ID: <CAPhsuW6vDYjiy1_tOhy--ULC8UWtpu4E_nd8uY8qg98eLuygQw@mail.gmail.com>
Subject: Re: [PATCH 0/8] unwind, arm64: add sframe unwinder for kernel
To: Puranjay Mohan <puranjay@kernel.org>
Cc: Indu Bhagat <indu.bhagat@oracle.com>, Weinan Liu <wnliu@google.com>, 
	Josh Poimboeuf <jpoimboe@kernel.org>, Steven Rostedt <rostedt@goodmis.org>, 
	Peter Zijlstra <peterz@infradead.org>, Mark Rutland <mark.rutland@arm.com>, roman.gushchin@linux.dev, 
	Will Deacon <will@kernel.org>, Ian Rogers <irogers@google.com>, linux-toolchains@vger.kernel.org, 
	linux-kernel@vger.kernel.org, live-patching@vger.kernel.org, 
	joe.lawrence@redhat.com, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250214_181044_413485_4384861B 
X-CRM114-Status: GOOD (  16.79  )
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

Hi Puranjay,

Thanks for running the tests.

On Fri, Feb 14, 2025 at 12:56=E2=80=AFAM Puranjay Mohan <puranjay@kernel.or=
g> wrote:
[...]
> >
> > I am really curious whether you have the same problem in your
> > setup.
>
> Hi Song,
>
> I did this test and found the same issue as you (gdb assembly broken),
> but I can see this issue even without the inlining. I think GDB tried to
> load the debuginfo and that is somehow broken therefore it fails to
> disassemblt properly.

Yes, this matches my observations: gcc-11 generates the .ko that
confuses gdb.

I tested with two versions of gdb (10.2 and 14.2), both have the
problem. OTOH, lldb is able to disassemble copy_process from a
gcc-compiled .ko file properly.

> But even with inlining, I couldn't see the warning about the refcount
> with my setup.

This also matches my observations. gcc-11 compiled livepatch
works fine.

Thanks,
Song

