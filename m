Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00F62CEBF61
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 Nov 2025 12:54:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=j0PeYkxx4r+5jJsF9hbC2hTxYP/y6FVcRV15IQ6oSzc=; b=QUHXix7Xm72AUomqi9TFR7C0l5
	wAdCkB0ufgYtm0SV/keNOFL97mgNLWOKPTiSCpoOPhcgDPavNjqUJybxQxLxOHkcD1VU9/eHqXchP
	Rt7CO39HXZxSeffXHLayXjW3985v/Tc6NRHKas8aFlZArGsMHHKfk19Ehm6Fr5W1MJxYOoX5ufg1M
	HCgM+NE4we9E9tiCRCqDqxQe9sHdeYNfBGy59VaFcTZ53UBYgoA75nud7lB5vpX6F/WDTakAHPrK7
	bcVWrWBt7hDfZjJCET6BlaVXHwvZ8EInLZZS52KUNsVUC17TGDwDttHwKyH6kmUd436/QIwFehpws
	gB+Yb8FA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vKykn-0000000G8Lw-15iu;
	Mon, 17 Nov 2025 12:54:45 +0000
Received: from mail-qt1-x82b.google.com ([2607:f8b0:4864:20::82b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vKykk-0000000G8LX-1y44
	for linux-arm-kernel@lists.infradead.org;
	Mon, 17 Nov 2025 12:54:43 +0000
Received: by mail-qt1-x82b.google.com with SMTP id d75a77b69052e-4ee243b98caso206011cf.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 17 Nov 2025 04:54:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1763384081; x=1763988881; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=j0PeYkxx4r+5jJsF9hbC2hTxYP/y6FVcRV15IQ6oSzc=;
        b=dPRAM+v8exAp5v++B2uXokKd1ogfleSXFx8ASQVVz7apF1K33DYpo45VQdJt7sYiVo
         PpVOJ8y7UZRf/UB70SKZTm2iCRQJK1YXEFjC6iWMjoKivwPT7rbLTbtMvg/vwlEr7Kwg
         SGy+cWizTxWZIKV6A1qX3cuc1dLIadjkTYdzlsV7RxKi5q69QuoYklkx2dtOqH+dtvUG
         IQ6jmL5vscgY3Xr/G3LlqKTrrQ6DC0+g/25mCJTq9KK3ZOLBxr4rknEw5zT96jNO2U6q
         zz3GxotsCmFLT8Sh9xvzz3uGn3CotEBA5NqA/BrVfsOr29LGb7EypFxD07hRfGixr+j0
         5NaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763384081; x=1763988881;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=j0PeYkxx4r+5jJsF9hbC2hTxYP/y6FVcRV15IQ6oSzc=;
        b=hH5hr+7mdBuubMoZ5Wzz/X2P1GK1iph103YymlCLw/zZT8gGRB2BA0tjMUS3uGOfxJ
         uAOBf6S2RIUf8Sco6rb3HPFhFPxRbO5KrgKI7wF93RLOEWxQ+82+gbHxytbRSPEARBrt
         6D/WWValEVaG0muWnzcID9/gNj3EqhtVhv7T5owHivMrB1pC+jRORyRGW/5iqwgTkpEu
         br0gif0rlQOqYY4z/YtkkqTY8bjUHn4SiRgXRssqsrcPTTGzGsSVUD2hV+n7hYGRHoi0
         thEtuYIIEoJSZVQHcRUYEDLYVUKeCK8lvGxLm8QYSthxz7qs/81nAstusjjaapjv8GeH
         b4zw==
X-Forwarded-Encrypted: i=1; AJvYcCW7zTE6PmONv6xs3Lyj/xIa9kslHnqGUqprlwUoWbUyXR0eom8bjfGeHmEKNMNFuqIBvVdDgxiTVguS9Yd2utHv@lists.infradead.org
X-Gm-Message-State: AOJu0YzbOOJQUHk7SIHA9uPhYQSu9hzbZ39pqjNCwXydR5QqnHoSGDSi
	JXfNnzigYIGDDViXvLkBlLc0mU0faNlNA7z+W3A0bq7MbHjWfjeDskMY9CmDhdEQjBnyy2QSd7V
	HKSqStBFrB4toez03y0UjkMl8pkjCWecYgRhtt8Nw
X-Gm-Gg: ASbGncuBzEAaJeS/CafUEUf8oJ6/ypzW1UDIl+RiQJ7FGn81dSUJmng1j8MvXY1zoK4
	q3IuSjgwkJu/rpa1cu+O+Ya+a4IBFfzppQnZkRvXbKezLhZWJdNXjjV9pPUwXhHCY5aFnEbrUZB
	KWm5MOmDErSEHlkAExZwn3I9L2Ob2acYgRWjD1g8aUb6+gyXTP1Z1VYHhq/zK3U18/5Ed+DRcby
	uHW4Pffid8RzQ47Z/P1DSzWIVaejrtDk3uTx53faeGlPkrowC/xBtHBvStHDZ3RwvVUi9lySKxj
	6jRlZQ==
X-Google-Smtp-Source: AGHT+IGyUPT3wn6gNyvpaQ2io1rn1H6hCVd0hgtsdhKIadTArqZSFCNMUbFtSog8erGv//K0RpdAaxu0Wib8dQEX/+I=
X-Received: by 2002:a05:622a:1a23:b0:4e6:eaea:af3f with SMTP id
 d75a77b69052e-4ee029e00ddmr10626351cf.3.1763384080849; Mon, 17 Nov 2025
 04:54:40 -0800 (PST)
MIME-Version: 1.0
References: <20251117091527.1119213-1-maz@kernel.org> <CA+EHjTzudrep2hEno4RPwh8H88txiVYFoU7AyJYVWG9SFSk87Q@mail.gmail.com>
 <867bvpt25u.wl-maz@kernel.org> <CA+EHjTyLGFUDbyr_B1uj5ZpxQA9ypCBy0ZUNRQ8M8VdLmXimnw@mail.gmail.com>
In-Reply-To: <CA+EHjTyLGFUDbyr_B1uj5ZpxQA9ypCBy0ZUNRQ8M8VdLmXimnw@mail.gmail.com>
From: Fuad Tabba <tabba@google.com>
Date: Mon, 17 Nov 2025 12:54:04 +0000
X-Gm-Features: AWmQ_bmjMm1Pn-peAzaMdg9UHlblAmHGoqWm7U5eN4zTrXFoNWlFVMWvJb4f2Ww
Message-ID: <CA+EHjTx=sqkOfvoXO-gtAP9oZ+HJnfqFWzeughu+sTv9uJx7zw@mail.gmail.com>
Subject: Re: [PATCH v3 0/5] KVM: arm64: Add LR overflow infrastructure (the
 dregs, the bad and the ugly)
To: Marc Zyngier <maz@kernel.org>
Cc: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	kvm@vger.kernel.org, Joey Gouly <joey.gouly@arm.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Oliver Upton <oupton@kernel.org>, 
	Zenghui Yu <yuzenghui@huawei.com>, Christoffer Dall <christoffer.dall@arm.com>, 
	Mark Brown <broonie@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251117_045442_516187_C47B5370 
X-CRM114-Status: GOOD (  22.06  )
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

Hi Marc,

On Mon, 17 Nov 2025 at 10:18, Fuad Tabba <tabba@google.com> wrote:
>
> Hi Marc,
>
> On Mon, 17 Nov 2025 at 09:54, Marc Zyngier <maz@kernel.org> wrote:
> >
> > Hi Fuad,
> >
> > On Mon, 17 Nov 2025 09:40:47 +0000,
> > Fuad Tabba <tabba@google.com> wrote:
> > >
> > > Hi Marc,
> > >
> > > On Mon, 17 Nov 2025 at 09:15, Marc Zyngier <maz@kernel.org> wrote:
> > > >
> > > > This is a follow-up to the original series [1] (and fixes [2][3])
> > > > with a bunch of bug-fixes and improvements. At least one patch has
> > > > already been posted, but I thought I might repost it as part of a
> > > > series, since I accumulated more stuff:
> > >
> > > I'd like to test this series as well. Do you have it applied in one of
> > > your branches at
> > > https://git.kernel.org/pub/scm/linux/kernel/git/maz/arm-platforms.git
> > > , or which commit is it based on?
> >
> > I just pushed a new branch
> >
> > https://git.kernel.org/pub/scm/linux/kernel/git/maz/arm-platforms.git/log/?h=kvm-arm64/vgic-lr-overflow-fixes
> >
> > that is based on -rc5, kvmarm/next, kvmarm-fixes-6.18-rc3 plus these
> > patches. Let me know how this fares for you.
>
> Great! I've applied the pKVM patches on top of it. So far so good.
> I'll test this series more thoroughly and review it as well. Stay tuned...

For this series, and the series that it sits on top of (i.e.,
https://git.kernel.org/pub/scm/linux/kernel/git/maz/arm-platforms.git/log/?h=kvm-arm64/vgic-lr-overflow-fixes):

Tested-by: Fuad Tabba <tabba@google.com>

On QEMU, nVHE, hVHE protected mode, and protected VMs (with the latest
Android pKVM patches applied on top).

Thanks,
/fuad

> Cheers,
> /fuad
>
> >
> > Thanks,
> >
> >         M.
> >
> > --
> > Without deviation from the norm, progress is not possible.

