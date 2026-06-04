Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A0EACD6E4A
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  4 Jun 2026 14:48:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QSjd1U/70yhpLCdfTmik43TR68lZDDCtC2Km+f9O/NM=; b=ynJ7PyPvlwHdX4SKVLSsR8QrZk
	AENb/WUmZGp6Jk+KU9c+1gXtbqhPD4zfjz+i4l8P3S9jS50jzKOs3Nh5o1ZHbFkyFkFbmORq5pMXC
	Pid0HEjQdkzC8CYx7gEPSAU0amORPTtJcFvpolWSH3XBZxW92Q4+Wah7023aWsWrAY1lQmlUiO8/G
	6T5Wg6aQ5Gt37y+rWyywew+RciJdgUERGwmqlFwlCY9UbYuFMfHa35546eoFiRLCvkKwTZTs7H1Eu
	Ew3DWLf5LxkeitOnOtdcFo8/dcHwXboPY/P0j5X33zZ2U1M1ZPRrBQ41U+VPeXgTNyyjnNBK7WmQm
	ReTOsA1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wV9MQ-0000000Gw9c-2JgU;
	Thu, 04 Jun 2026 14:47:54 +0000
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wV9MN-0000000Gw8K-34rn
	for linux-arm-kernel@lists.infradead.org;
	Thu, 04 Jun 2026 14:47:53 +0000
Received: by mail-ed1-x52a.google.com with SMTP id 4fb4d7f45d1cf-68bac6e24fdso1120959a12.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 04 Jun 2026 07:47:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780584469; cv=none;
        d=google.com; s=arc-20240605;
        b=JCjEILVSYbEzsQaM0a8msD/AJIfGLJO6AfYEx1DyTvKyr1aEQaQkd6qPwsOXuV+Lzl
         cYsCN2FukEhiV/hwZnf0iT+AzM1RXEtc2FA6enKutQcqTbTjPXqlh/a0rkgNsUL36gbp
         kzTW2byYWBZsefd9ivmqmBJY5VP8Bb3NJFjLJQG3enB1OsPS6Nod44fsftBpQiJUbBF5
         ckIv7aJbnsj3d+nF/MNfNWhgHRo4t+kHOWuqL2ANJ8QReUlIw/8EhYqyxGYfPHSDMyit
         UtB645vIMXTBJ6GnHHY5uLYi9Igr70Io86nJ2v2zlCzJJzgh5AkVC1LWlTtgaS7ovri9
         vBXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=QSjd1U/70yhpLCdfTmik43TR68lZDDCtC2Km+f9O/NM=;
        fh=a1+jYYUBVoTXI3JEgkAdli1NQbV7PBIxUO/Dw5DmO9U=;
        b=IvyKY1Bhv/XsPHksxFiHZkAlvS23ODOzdm4/stoSPS5OCa80wMSlV8vuFN/mXsuIk9
         9KpbcC8SSL1yu80tXt9TxkV4EvXit0JiNX18tjceeVRa22NzHeCv3KbMtiojDBFKV8yI
         mSE9aCGCUwAhtYLLMwRRTmi2ayUCT51bcKp98L2A9xt192kFVTU5/s480Tj2d0djt1mD
         1NVKl0ttXTCeJ/P2jX8ywvtJwQy1YVqTa0T+6qWr/Yujhj4DYG1MhqtWk4/7v4lleZ9c
         5c85HY1yQbsX+BOmiWF5kXUjDGjKVQ2/X9oqckeUvTATn2W4no1rovuzpBLvlFEfZo8N
         Nc8w==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1780584469; x=1781189269; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=QSjd1U/70yhpLCdfTmik43TR68lZDDCtC2Km+f9O/NM=;
        b=Vf0EJ3Kifi1xoSAg+KtMor5/+9io6u348EId4z23BzORWG+n6ZiyKWVQ2tvHP0mRFv
         plMBNYyb89QwSbdtGwUy9Cd7UuBpl7dTVA4GGzMx9Xmg3isRKMsfVF5ZxrpeA+MMYhBf
         NXW7x9UcsuWkdYjGZ2eIWu05/d4DpBM8Mn+KJTVpJhGXNNNoaK0fsqMFJkq/3XD8fwyY
         5RqfdjDp3UyikN4JheUeqdiVl44akELwsoaM1YhHzMb9fFawc3AwdUkBZQLjAUkCOXpz
         ZTv4cIepimLHGa03aKnYfFUxASez5zwBjrrcg5N7G6U25EC9gnxxAGE83B1PiPj7m6Ea
         5lTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780584469; x=1781189269;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QSjd1U/70yhpLCdfTmik43TR68lZDDCtC2Km+f9O/NM=;
        b=O71d/y0EMq09Lja+tKyNovOpubAF4nnQEuT1qe7wS3bXluf4Aam2ocMoHdddArxYxf
         4tqRXjOHVMo+cCwWgW1NI8If+wDlcKDyahetx4IK2tICPKWS/hefoDQfrYtWcVoMo9s5
         hCjFqvYbj2zWhiRPQAtGzJAFzBWqm0XjDTYO9W/k/lFOUIc85KLNWjgDnQEF4/PwZBat
         VALzkbMdcP/McNvdN+ZGmTRJZQW4nxhILurbLnqIKBv66MX2eVz53BnU6McMp8zNp54t
         sddE833fYkp8NvWAtS+hGcn3DZSbn7OOnJRGh81E7pixy/YT9vNl8g0oXremnFoV2HGg
         M5Hg==
X-Forwarded-Encrypted: i=1; AFNElJ/xrGS//XSFe/cosBcOLlFnDn6cTdcjcBLnQekQvRmojte/xj0Vaatv+sUo8ehDOAaH5IC9MygitFkHLq2f05Wz@lists.infradead.org
X-Gm-Message-State: AOJu0Yx1g1tQqGfonQHdSwrcb+kaPgi7jol/TKmqleW0/pWQDzET1LLQ
	2VNl0N0TL3/3r/QISSxzk/WY8Z1K8hjRB4uprsroGea7XactlIjVYWhBEythQdWXKUgAnqfhVEL
	jcvURXuXUchSrlvsxzzXDIFZGvC19npZCQyN+6yDB
X-Gm-Gg: Acq92OEd8X6PInqt3PHMITu8c8J7rw6zBSM74/cuAPQcUzcWMiz+BvDw0ZD7vlm0DKa
	EfvdJ4AXEgKI0OSQfDJGfWp98uyUXV5YlpbQvFla5mwyG99iMUyA4Dakjm35BXp+qNG3sWt9cWF
	t5pGaqe69+8kZ7/lvIsxFdk/UPf+w6ZcwVNUSzX8aXxds2iVMVfelOEymjndnMaPsddWrqYLJXA
	CxU7LzVcuqQecPeQ2JAMH7z35/oe3hU4Qya79zhQU0RuZAb5eullZHyFOgvSakTq3aKRh3GZmr1
	rMoLxHL7o9N/bRhETBOvvYHw+UKXVVqsKMiEbR7m1qus0LH+6EGKkV32uiPMQzLyd1ruZxqa+42
	/amkFpYA=
X-Received: by 2002:a17:907:6d26:b0:bb7:eb68:514e with SMTP id
 a640c23a62f3a-bf0aed0cafemr433224366b.36.1780584468249; Thu, 04 Jun 2026
 07:47:48 -0700 (PDT)
MIME-Version: 1.0
References: <69a2d58c.050a0220.3a55be.003b.GAE@google.com> <874in0ex49.wl-maz@kernel.org>
 <CACT4Y+bbQ3qfoy0kuXgTk5H2k=Wrg2t0Ghhc6U6fT-28ter7iA@mail.gmail.com> <86wlzu8ird.wl-maz@kernel.org>
In-Reply-To: <86wlzu8ird.wl-maz@kernel.org>
From: Dmitry Vyukov <dvyukov@google.com>
Date: Thu, 4 Jun 2026 16:47:36 +0200
X-Gm-Features: AVHnY4ICfNLxavuIrQN2iJIGM7Z0iBfnUYdb7BfndwNYy6T9AkyY1h7EA6y1Ohw
Message-ID: <CACT4Y+ZKV6Lq0uBv7ob1cKnVcD7XUvV2srUMDR5R9gxAE_Yxww@mail.gmail.com>
Subject: Re: [syzbot] [kvmarm?] [kvm?] BUG: unable to handle kernel paging
 request in kvm_vgic_destroy
To: Marc Zyngier <maz@kernel.org>
Cc: syzbot <syzbot+f6a46b038fc243ac0175@syzkaller.appspotmail.com>, 
	syzkaller@googlegroups.com, catalin.marinas@arm.com, joey.gouly@arm.com, 
	kvm@vger.kernel.org, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	oupton@kernel.org, suzuki.poulose@arm.com, syzkaller-bugs@googlegroups.com, 
	will@kernel.org, yuzenghui@huawei.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260604_074751_788080_687D59AD 
X-CRM114-Status: GOOD (  18.79  )
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

On Mon, 2 Mar 2026 at 14:26, 'Marc Zyngier' via syzkaller
<syzkaller@googlegroups.com> wrote:
>
> Hi Dmitry,
>
> On Mon, 02 Mar 2026 12:59:41 +0000,
> Dmitry Vyukov <dvyukov@google.com> wrote:
> >
> > Hi Marc,
> >
> > The reproducer should print at the start specifically to address this concern:
> >
> > the reproducer may not work as expected: fault injection setup failed:
> > failed to write fault injection file
> >
> > Isn't it enough?
>
> Ah, I totally missed that, because things scroll really
> quickly... Apologies.
>
> I think it'd be a bit better to just stop the test if the
> preconditions are not met, as nothing useful will happen.

FTR filed https://github.com/google/syzkaller/issues/7450 for this.

> Thanks,
>
>         M.
>
> --
> Without deviation from the norm, progress is not possible.
>
> --
> You received this message because you are subscribed to the Google Groups "syzkaller" group.
> To unsubscribe from this group and stop receiving emails from it, send an email to syzkaller+unsubscribe@googlegroups.com.
> To view this discussion visit https://groups.google.com/d/msgid/syzkaller/86wlzu8ird.wl-maz%40kernel.org.

