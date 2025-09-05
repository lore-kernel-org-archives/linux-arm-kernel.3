Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F11EFCA1017
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  6 Sep 2025 00:13:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ihoNevlLzJDBSuy8DxcqIRmMmQ3q65NAy+tYYX30mhs=; b=iEyuIlAEw+5uYEA7iGUrp+a5qx
	M6Xm6j6FcK5t8tycEU4qRI8XQD0RpWX3NlRLJkp+6EpbxL7xAYGxI6/K3WxPUyg+vF1uGLOsyllH3
	KpFqV8lYVNYf13wqPbLpI8wrxQZqzsVbWaew16SDXIV8VIYKoFYFEkwx4N7X3dVTN1G/qiy2S7BqK
	Wwz2BJggyu9C5zv/gbPuDs2JRPxd+cPG2e/f7G1Te0WflwI1GUSxMKqt9TpzFkAFaVNG6KuzcJqRr
	yyTAbKaq43nlpYis3a5rouAkmWWv6x4S5he0nXOV73fBmXDpGim9xZFVddqrlr6GN9mi4u3vSAQRG
	7srfqHrA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uugYn-00000005XWy-1wBn;
	Sat, 06 Sep 2025 00:13:41 +0000
Received: from mail-lf1-x135.google.com ([2a00:1450:4864:20::135])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uudr5-00000004gV3-1WsX
	for linux-arm-kernel@lists.infradead.org;
	Fri, 05 Sep 2025 21:20:24 +0000
Received: by mail-lf1-x135.google.com with SMTP id 2adb3069b0e04-55f6bb0a364so2760049e87.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 05 Sep 2025 14:20:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1757107221; x=1757712021; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ihoNevlLzJDBSuy8DxcqIRmMmQ3q65NAy+tYYX30mhs=;
        b=si88I4pvrHZZ/RiXyHCRRCOOUcEAfvqZBEdohLhtz28MCQnSfoK5f5QU4lv4lL6U2W
         7z4xROs+Bed8rFylSVNzGkm6LKfTAAFn2LlUyBi0jHrWVHsTgHUjuAS/m87ExMIMm8Vb
         KSfycUBdFfXxnytbCN4pDFWFibRSD33HEkUqsiq1ZjhiefWBrXrIP27arXIej6H62fWR
         E6yzhh+aDhZvzZyDagc/kGbBELoPVWtA47zRi9EtcfXdoLqd05iRNePW5+Mz8Ev2hvBT
         9E4cNjyV96FQaEGwDfx1Qw0223I7d3LOda9NvOlEIBIXf4CnZn0znL7Bh2FbPjJwTZU9
         xqVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757107221; x=1757712021;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ihoNevlLzJDBSuy8DxcqIRmMmQ3q65NAy+tYYX30mhs=;
        b=HtEFPM2TrffAnwBaAVShkkG+xbuGCVZ5WYAPG/21do368QVck4baE/oFjNRfe34AIk
         +3rIjmBMMdJ72L6ZdUOAQoNEs+SBy55XomPwoiSZhKMFEfW50lpk5QMF/9W9+44Zn+PT
         Gcft+FVu9lQJwwHLDqOWciej+XJPcXZgHe8YoR/YzJYUzerVy32KNB02vxLNQbCKFCO0
         dQhFZJBio0XS+vW5Q4cB/MaEaa5/zqInB0GOmCpVWZK45YjxpD6yT0a5wNVOq6HJI1WP
         g6bPQRMhaTsVIu6IP3585P/Hevktg8SvqOKo+42LcTONDva7s8CXaq0E8iJuRJKNYwiN
         NCVw==
X-Forwarded-Encrypted: i=1; AJvYcCXro8Q3JyF35V8PHdVILdkBLmu/R5VCNeVYJolEiEhWO08mBnPkwqHDRvrsLhxMhdJlBQEcxFaROuYFaF0/8DLz@lists.infradead.org
X-Gm-Message-State: AOJu0YzTY1T/iGHTJR5yRccwdu83xQ52Hi4KQ1qnwqd5CQdiEIRPImME
	iMSaenwj7qx0MLrgtnn0pVs+42l3GgRzECWdOdCRKjdhZIsfSasccYdfDChera+Zd7RziNZj9Y3
	iElc0VajOZcO8iz6GmwXqZuY3RwY6ruEtH2Icslk=
X-Gm-Gg: ASbGncsqM9STmUy56GowJRx918lAn6quWyJuDlz0MMsCPFAcQ7Y/W5tIb6hFCnc2EFD
	/ctXlXe/d1OjLLngdWv0ItqVbCBw87MEnEiySyw6upHCXLyq01MzcPrulL9FGEpFMP7L0V+6RMa
	5wOeVn5I/yag9wpMfKVe3/5MbtSgCh8HH7W1aisG/1XkMZCY+JmvW5KdTyfXC1UmhukLG44istR
	+FQOGYdMSDYrZ2e17xXpzFV6HsdZKYiAhtUTKCK2rUkoww1bSknOQ==
X-Google-Smtp-Source: AGHT+IGklKSxmgtyLJoi1vvHN7sLHpD+0Iy8PrXyLbJxGTq/1I6kUc4ziYI23n3kTAxDik0wCpIxXBb5i2BdIOMmD6k=
X-Received: by 2002:a05:6512:3b12:b0:55f:6831:6ee7 with SMTP id
 2adb3069b0e04-562601b5384mr78383e87.21.1757107221283; Fri, 05 Sep 2025
 14:20:21 -0700 (PDT)
MIME-Version: 1.0
References: <CA+G9fYv0mbEBVs0oTiM+H4X-y7ZCwYpfa0hGCQCeVkW2ufGD_w@mail.gmail.com>
 <CANDhNCpWWNpBQfeGq_Bj1pEWTYULJGaubTuPJ2Yxjg4_ESzgBw@mail.gmail.com>
In-Reply-To: <CANDhNCpWWNpBQfeGq_Bj1pEWTYULJGaubTuPJ2Yxjg4_ESzgBw@mail.gmail.com>
From: John Stultz <jstultz@google.com>
Date: Fri, 5 Sep 2025 14:20:09 -0700
X-Gm-Features: Ac12FXyJR8KmvN8T2fwKhwhjrwRXLtrixZllcL7-1u48pK2bWIjS9VPSJc01V20
Message-ID: <CANDhNCrJYMcK+dak8ASX6uoVFkNSHMf3Bn1kOXDtqNqFb7LkJQ@mail.gmail.com>
Subject: Re: arm64/juno-r2: Kernel panic in cgroup_fj_stress.sh on next-20250904
To: Naresh Kamboju <naresh.kamboju@linaro.org>
Cc: open list <linux-kernel@vger.kernel.org>, 
	Linux ARM <linux-arm-kernel@lists.infradead.org>, Cgroups <cgroups@vger.kernel.org>, 
	lkft-triage@lists.linaro.org, Linux Regressions <regressions@lists.linux.dev>, 
	Thomas Gleixner <tglx@linutronix.de>, Peter Zijlstra <peterz@infradead.org>, 
	Steven Rostedt <rostedt@goodmis.org>, Ingo Molnar <mingo@kernel.org>, 
	Ben Copeland <benjamin.copeland@linaro.org>, Anders Roxell <anders.roxell@linaro.org>, 
	Arnd Bergmann <arnd@arndb.de>, Dan Carpenter <dan.carpenter@linaro.org>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Tejun Heo <tj@kernel.org>, 
	Johannes Weiner <hannes@cmpxchg.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250905_142023_413374_C7BA657B 
X-CRM114-Status: GOOD (  17.72  )
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

On Fri, Sep 5, 2025 at 10:50=E2=80=AFAM John Stultz <jstultz@google.com> wr=
ote:
>
> On Fri, Sep 5, 2025 at 6:21=E2=80=AFAM Naresh Kamboju <naresh.kamboju@lin=
aro.org> wrote:
> >
> > Kernel warnings and a panic were observed on Juno-r2 while running
> > LTP controllers (cgroup_fj_stress.sh) on the Linux next-20250904 with
> > SCHED_PROXY_EXEC=3Dy enabled build.
> >
> > Regression Analysis:
> > - New regression? yes
> > - Reproducibility? yes
> >
> > First seen on next-20250904
> > Bad: next-20250904
> > Good: next-20250822
> >
> > Test regression: next-20250904 juno-r2 cgroup_fj_stress.sh kernel panic
> >
> > Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>
>
> Thank you for the testing and the report here!
>
> > Juno-r2:
> >  * LTP controllers
> >    * cgroup_fj_stress.sh
> >
> > Test crash:
> > cgroup_fj_stress_net_cls_1_200_one:
> > [  365.917504] /usr/local/bin/kirk[402]: cgroup_fj_stress_net_cls_1_200=
_one:
> > start (command: cgroup_fj_stress.sh net_cls 1 200 one)
> > [  374.230110] ------------[ cut here ]------------
> > [  374.230132] WARNING: lib/timerqueue.c:55 at
> > timerqueue_del+0x68/0x70, CPU#5: swapper/5/0
>
> This looks like we are removing a timer that was already removed from the=
 queue.
>
> I don't see anything obvious right away in the delta that would clue
> me into what's going on, but I'll try to reproduce this.

So far I've not been able to reproduce this in my environment.  If you
are able to reproduce this easily, could you try enabling
CONFIG_DEBUG_OBJECTS_TIMERS to see if it shows anything?

thanks
-john

