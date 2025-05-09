Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CAB72C3ABC9
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  9 May 2025 21:31:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3ndxIwpqni0a6tDVrjZprOorINLiqY/weaUCp02laXM=; b=bc3dY7zxAhtu2fmzyUcRzXK4t+
	MuiPh8B2H2hzv0dkx1UP8+INsU4LiQ1qlg0IG3gwZ0wKTNV6hGpugEEx2psKuXHh+ld6rsmHuxbwx
	VLW3HijgcF+0LDPBufcPUYPKJazuGwomo6YwQesFF+nPjrbmY27E9aZiSOPfqcWBDT2FgP8qxMVdw
	0QRA6mTyZu6F+8Wsv23tSS+GARQcWM+DASelucRuXk7o4O0pDsNSH1oYntlv3qdJ3plmPtNOBtgRq
	wO6/B4J3odV5dW2LH6NLfHxOf3jWJcqzcvr5PFeGQ5hNsEdv3ny6xaYdMu7CJgryZFLEKIvJtF21t
	UpZOLZzQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDVJr-00000004y0E-3f3n;
	Fri, 09 May 2025 21:31:47 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDSgj-00000004bGB-2woz
	for linux-arm-kernel@lists.infradead.org;
	Fri, 09 May 2025 18:43:14 +0000
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-441c99459e9so16086185e9.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 09 May 2025 11:43:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746816192; x=1747420992; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3ndxIwpqni0a6tDVrjZprOorINLiqY/weaUCp02laXM=;
        b=JkFP7HOmLtWcLnzONX2R1Uo0SgVbOs9HZVg4+arUyRSRarqQXnHsZ1f6LKJAMUXrQ0
         HV0N8Q0Tv/S1/9DcRuLga0ADo9I63S5XKtwummVNDWkai6ZZi8OGfc1SFHJdHqR49AI5
         SovQXdJ8XASsjeseOY6C7j+YQHWJ62c+C0b8mGa4CLdSHvMmA7RfKwgDupSvysYD0MFO
         /cMrgt4mu8qDxglopoBE5RDpkmDntDmMoysp/xiG9WuNQyfiqn6hI/iXg3RKkHKN6OEd
         G51BVXrTFW81pqjsIJxR6TcWKBk+p9TgLrrWVN9io9jM24fwy6Eqnp5dAANfkrZC5zH4
         N4DA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746816192; x=1747420992;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3ndxIwpqni0a6tDVrjZprOorINLiqY/weaUCp02laXM=;
        b=NK1dH20xrAMDhy/VwzZNAGdLvQ19qbcklrGIKzIZ2GbNdy6aMoV1v88MzncHe1rbs/
         YoRMmjKOwcGYOTFoTNhn8rIWSstEZI8lJ2yymXGEYlAjZj78oO1SQIgE6gNspbJouREo
         4enMVnrZ7aDfdqJFzR5hAUsB1xKve35nBEhE7txKUrtA8iYmzPUIyX6dK3bBSBSFc2PZ
         VFAYSBFHz75YXn0giHXUHaKx890ftmQdcAJw/XfmCJbDmPLE2z72sye5eaebX+j3XzBS
         CeFSSshJTZ+8HjSsxxfCZ2wo3ETu+QlifFZMKoXdKcJFxGm2UrUWZFAYFo1wV286mqRR
         RaFw==
X-Forwarded-Encrypted: i=1; AJvYcCVVDDvkR8enNCuRge/SwXzPS/tB5+B4YAkpv1Tq+N8oZA/y/HJInuvKOe3zgFw8jmqVYkPIg/V/Gz0bkfM0zYA6@lists.infradead.org
X-Gm-Message-State: AOJu0Yy8fjo5/744/1sBV5FWC7hnXJEZ3i8JQt8LlN+/fQspHgSIwplD
	HLcqPjR645lsXrXVvNcWagYXPR6yiY/gS/CEUHkmNgAVrTrJP9rb+MYFl+RTDcAlkMCLCW0ohnm
	tLq8TgNUgaD2L9ybvvhHg4T9R1GA=
X-Gm-Gg: ASbGncu17py1MCQWmJ+Mp6RQh5LdVmfbUlJtYq30hPnkE2rBj0I7i6szixk4sidzu6l
	AIy4dw+5x2SAJnIAr/5i/sA0iU2LnslVPUj27LUD2XJisIGWo8Z8BqfwwZzALhyKxDF7hIPP5Q7
	Jg/s8MF4f3eR+tmuJn9SHb9nCjm1hhpldMiyaiSSnJgDYaCVt6
X-Google-Smtp-Source: AGHT+IFYnZD9y+hjO9CRH7JbZRqwYwFvCe82Ke5Lt/BeQLTVkbi1WQsCzGbxCZtrM0Gj1TEWNbFMvXBqV8FmzAVdtuA=
X-Received: by 2002:a05:6000:2506:b0:391:22a9:4408 with SMTP id
 ffacd0b85a97d-3a1f64386eemr3845245f8f.16.1746816191780; Fri, 09 May 2025
 11:43:11 -0700 (PDT)
MIME-Version: 1.0
References: <20250501073603.1402960-1-luis.gerhorst@fau.de> <174681603001.3715348.12288999798860158953.git-patchwork-notify@kernel.org>
In-Reply-To: <174681603001.3715348.12288999798860158953.git-patchwork-notify@kernel.org>
From: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Date: Fri, 9 May 2025 11:43:00 -0700
X-Gm-Features: AX0GCFvLVth5qvdC1z-BgTiCYbsMNaP7ne4n5tL7wLi4uocO_ruonz0SxGJeZGA
Message-ID: <CAADnVQJ+=Tip0ocob2aWe4G0BTs4F7veMtM-DD7f-zGKncAa_g@mail.gmail.com>
Subject: Re: [PATCH bpf-next v3 00/11] bpf: Mitigate Spectre v1 using barriers
To: patchwork-bot+netdevbpf@kernel.org
Cc: Luis Gerhorst <luis.gerhorst@fau.de>, Alexei Starovoitov <ast@kernel.org>, 
	Daniel Borkmann <daniel@iogearbox.net>, Andrii Nakryiko <andrii@kernel.org>, 
	Martin KaFai Lau <martin.lau@linux.dev>, Eduard <eddyz87@gmail.com>, Song Liu <song@kernel.org>, 
	Yonghong Song <yonghong.song@linux.dev>, John Fastabend <john.fastabend@gmail.com>, 
	KP Singh <kpsingh@kernel.org>, Stanislav Fomichev <sdf@fomichev.me>, Hao Luo <haoluo@google.com>, 
	Jiri Olsa <jolsa@kernel.org>, Puranjay Mohan <puranjay@kernel.org>, 
	Xu Kuohai <xukuohai@huaweicloud.com>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Hari Bathini <hbathini@linux.ibm.com>, 
	Christophe Leroy <christophe.leroy@csgroup.eu>, "Naveen N. Rao" <naveen@kernel.org>, 
	Madhavan Srinivasan <maddy@linux.ibm.com>, Michael Ellerman <mpe@ellerman.id.au>, 
	Nicholas Piggin <npiggin@gmail.com>, Mykola Lysenko <mykolal@fb.com>, Shuah Khan <shuah@kernel.org>, 
	Henriette Herzog <henriette.herzog@rub.de>, Saket Kumar Bhaskar <skb99@linux.ibm.com>, 
	Cupertino Miranda <cupertino.miranda@oracle.com>, Jiayuan Chen <mrpre@163.com>, 
	Matan Shachnai <m.shachnai@gmail.com>, Dimitar Kanaliev <dimitar.kanaliev@siteground.com>, 
	Shung-Hsi Yu <shung-hsi.yu@suse.com>, Daniel Xu <dxu@dxuuu.xyz>, bpf <bpf@vger.kernel.org>, 
	linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, LKML <linux-kernel@vger.kernel.org>, 
	ppc-dev <linuxppc-dev@lists.ozlabs.org>, 
	"open list:KERNEL SELFTEST FRAMEWORK" <linux-kselftest@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250509_114313_741256_80E86D33 
X-CRM114-Status: GOOD (  14.52  )
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

On Fri, May 9, 2025 at 11:39=E2=80=AFAM <patchwork-bot+netdevbpf@kernel.org=
> wrote:
>
> Hello:
>
> This series was applied to bpf/bpf-next.git (master)
> by Alexei Starovoitov <ast@kernel.org>:
>
> On Thu,  1 May 2025 09:35:51 +0200 you wrote:
> > This improves the expressiveness of unprivileged BPF by inserting
> > speculation barriers instead of rejecting the programs.
> >
> > The approach was previously presented at LPC'24 [1] and RAID'24 [2].
> >
> > To mitigate the Spectre v1 (PHT) vulnerability, the kernel rejects
> > potentially-dangerous unprivileged BPF programs as of
> > commit 9183671af6db ("bpf: Fix leakage under speculation on mispredicte=
d
> > branches"). In [2], we have analyzed 364 object files from open source
> > projects (Linux Samples and Selftests, BCC, Loxilb, Cilium, libbpf
> > Examples, Parca, and Prevail) and found that this affects 31% to 54% of
> > programs.
> >
> > [...]
>
> Here is the summary with links:
>   - [bpf-next,v3,01/11] selftests/bpf: Fix caps for __xlated/jited_unpriv
>     https://git.kernel.org/bpf/bpf-next/c/cf15cdc0f0f3
>   - [bpf-next,v3,02/11] bpf: Move insn if/else into do_check_insn()
>     (no matching commit)

Applied the first patch only.
Waiting for respin of the rest.

