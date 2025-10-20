Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F648CCD193
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Oct 2025 06:56:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gjo/6Sjyy4wzQdCVDI4toDbmg3rq4WBazYvMUGXP+aM=; b=bj8RB1loWZVj39+KRw5VtWwp9C
	Q95tYOpaqjOWouzfR2zNmSl3xHOWI7Ib69dQwfhlKimob88d/7gTEGC4nE05+iv3OzuWxAwoYxBuY
	hynHcwxeFJ11bTaStgLKkVLZJsnRZt4WBORPa7I03exOH07tF35PYSCMKbb6GJUOpWuOEjZ2Ky9z9
	ZxBzdLH5iTd5iDt1TtiiQUur5KpPEKprJ8kQWYIFxKuPHAil7cv5g7Mptp8kdYENCj3If7OXispOz
	QKq4ThOCth2GBlP2J7ShmBgKe74e9oA4Tgecl/U4aPp/2V3ijUpcpg8m86xJ7aki4WThrhYm5cjIn
	PCLEOWCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAjoM-0000000C6Kb-0nw3;
	Mon, 20 Oct 2025 06:56:06 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAjoH-0000000C6Hp-2CR2
	for linux-arm-kernel@lists.infradead.org;
	Mon, 20 Oct 2025 06:56:02 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id CCE6245273
	for <linux-arm-kernel@lists.infradead.org>; Mon, 20 Oct 2025 06:56:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B0D9CC4CEFE
	for <linux-arm-kernel@lists.infradead.org>; Mon, 20 Oct 2025 06:56:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760943360;
	bh=gjo/6Sjyy4wzQdCVDI4toDbmg3rq4WBazYvMUGXP+aM=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=CdtgZxUDHqA2aG2niIUkozRqTfns5dsoCNeI5jiz0zWkdjP9k7J7ewWaMO8m+XKNT
	 zuEtqYS65zfSD0GX2zxkVJBSYAR3n9y3JlQMYKx2kvHJq2zFzVw/IH4YIIBL7Ik1DD
	 /d5420m7wiKxJOB3PnIFRRnn6j44dIecWPVCSBX/s+OndLN/lFYIkgLwJPTcF4CVxi
	 oekdb803Eg//VM7GtyIpjXTMV6w0kxQzizo+/se33MY5vjF6Tsjga7sxRh8HI29VDg
	 p+WuOYuSdB2YccObHd5SRnP83qU0B14HXM9lW7q75WqM6otBQ52pk9KLVCho5NHodS
	 vGSlNUB2Hxv/g==
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-63c09ff13aeso7331071a12.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 19 Oct 2025 23:56:00 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWLBNazfg4otT4pfIATopYkSL0fpPHEdE620yFUKqAFTmDtjIYXdfFt10NX9sc+rYD3YRljrURNxChmrLc2GPuF@lists.infradead.org
X-Gm-Message-State: AOJu0YyWoDccaTVpbLjITfQd5zeFXpOeq0bU2RQE5QdKE/XeS9WjskWd
	RoBxSFydsNVzLsw32WRN3SgnRgziqfAa0BCa1sOq8NJk98Y2hBFYWZdwQ9jQ9vIzMlqIPNZ2zPB
	oebnG8PQodCZ526ucB9frCT1kVbFU/34=
X-Google-Smtp-Source: AGHT+IFnfhUn8HN0p4pAoHDFb320UnHrLwc6eiuN03fPNFETWItVQO870cPTacL3OdFj5V/dRgq1RI8aSYi1eCsoLeg=
X-Received: by 2002:a05:6402:13ca:b0:634:5297:e3bc with SMTP id
 4fb4d7f45d1cf-63c1f629a40mr12798466a12.6.1760943359107; Sun, 19 Oct 2025
 23:55:59 -0700 (PDT)
MIME-Version: 1.0
References: <CAAhV-H7HN128du-b1Rk_9qbYBq7gMSwo0s31909N4pTou6wzew@mail.gmail.com>
 <CAMj1kXGvSnCMRVCW7eAxgLRWMEV3QRj3Dqg3PmZchZJNpnLK9w@mail.gmail.com>
 <CAAhV-H4UKdso0BokAqvjYeBLr-jbjFAaQX4z=1ztpBamqrOEEg@mail.gmail.com>
 <CAMj1kXEXDC_oq4aWbkR5dqYBix2d1xJEdaj-v747e1nOA0Q_Yg@mail.gmail.com>
 <rhnei6wovxmoqs36wdysomfsul3faxtmgde73wrrqdt3qo3b2j@akd7vzne76rq>
 <CAMj1kXF+hDJy0vRWNgwoijHxvA-scvhGODMj9A3dv19v3jf2yw@mail.gmail.com>
 <lgyzruqczm7uti2lfbhfhr5hyzpnm7wtvgffa2o7nigx76g6i3@wlffltvmhhez>
 <CAMj1kXFDquPxCYSBWgjikS=209pSJ_kth67M0RDeuetV9CPYAw@mail.gmail.com>
 <wlx6pt5crtfdwtop4w5vjznjfarrwitq44wdbufncjdvtsx647@tgobruak66yb>
 <CAMj1kXFfEBkcc-aiwGrRR-pKg4LBbS7weK0pEpZJsKOk5pbkuA@mail.gmail.com>
 <jxfb5a2c2qber623l2gwewirwod54bbgfnvt7t7f3jah2ea33g@2uyhy3auzmpx> <d9f3352a-1c1f-464a-a8fd-741cd96b5f8e@loongson.cn>
In-Reply-To: <d9f3352a-1c1f-464a-a8fd-741cd96b5f8e@loongson.cn>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Mon, 20 Oct 2025 14:55:48 +0800
X-Gmail-Original-Message-ID: <CAAhV-H6m5vszCyiF3qi94cpHBPVuqM2xH93D=gfsQqOSYvC-sA@mail.gmail.com>
X-Gm-Features: AS18NWDRalCHnTxlUVVh6Sc0-5BD00KgUctbRu4OmtnXD3m7UgQt5e4S4nAWM6E
Message-ID: <CAAhV-H6m5vszCyiF3qi94cpHBPVuqM2xH93D=gfsQqOSYvC-sA@mail.gmail.com>
Subject: Re: [PATCH v2] efistub: Only link libstub to final vmlinux
To: Tiezhu Yang <yangtiezhu@loongson.cn>
Cc: Josh Poimboeuf <jpoimboe@kernel.org>, Ard Biesheuvel <ardb@kernel.org>, loongarch@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-riscv@lists.infradead.org, 
	linux-efi@vger.kernel.org, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251019_235601_623301_C43A2C56 
X-CRM114-Status: GOOD (  16.01  )
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

On Mon, Oct 20, 2025 at 9:24=E2=80=AFAM Tiezhu Yang <yangtiezhu@loongson.cn=
> wrote:
>
> Hi Josh, Ard and Huacai,
>
> On 2025/10/18 =E4=B8=8A=E5=8D=881:05, Josh Poimboeuf wrote:
>
> ...
>
> > But IIUC, the libstub code runs *very* early, and wouldn't show up in a
> > stack trace anyway, because there are no traces of it on the stack once
> > it branches to head.S code (which doesn't save the link register).
>
> Thanks for your discussions.
>
> Are you OK with this current patch?
For me the current patch is just OK.


Huacai

> Or should I update this patch to remove the changes of arm64 and riscv?
> Or any other suggestions?
>
> Thanks,
> Tiezhu
>
>

