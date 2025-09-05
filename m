Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5212CA1017
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  6 Sep 2025 00:10:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZaXyfPMqwoi89bLGQQm9R1wibinvU7q12XwB+QMftqw=; b=YQdEEZkxEPr53km50+GqsOeOwc
	ydgGpSFxLDj93QAvLrXKaqe0bDSTwpVpZ5bWqFl/ZKBx35YxwTJMlPrNpWvGyU5KVouW6hbCQ8Dmh
	bW7td9TyWsRu0TTXFgwQt6r7moJ6fPr37kmZGqp1toAKhdw+7+yKkLlo85rnrWDe1cWU/GfLlobLe
	N1VwUWuiR2HZtyMw1A4G9z5w/iMsFd82Gw1itZuzs7ibXCfKyvY7v7KlmzgSIBfDuhJy2MA9tF3UG
	SPSrA+CFb6Qo1UtO8MD9oJyytDEM02wOxOd6yWwhGvSQkwyN/7XjyFR8bMjtRbCSbQ2jP2KNssw6j
	iHMR80fg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uugVn-00000005S6r-47IZ;
	Sat, 06 Sep 2025 00:10:35 +0000
Received: from mail-lf1-x136.google.com ([2a00:1450:4864:20::136])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuaaV-00000003bBR-26EY
	for linux-arm-kernel@lists.infradead.org;
	Fri, 05 Sep 2025 17:51:04 +0000
Received: by mail-lf1-x136.google.com with SMTP id 2adb3069b0e04-55f720ffe34so3150183e87.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 05 Sep 2025 10:51:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1757094661; x=1757699461; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZaXyfPMqwoi89bLGQQm9R1wibinvU7q12XwB+QMftqw=;
        b=W2p4KBsvCCOdnA6J4A19ocVz5Rj9yEM6qOs3gk+Dcma7cgLTB7B/h9qNwJ7LbnmUys
         3a3myY65E5iw8aR9ONrSa1FpDqRMNWpFNkJktUFviiwi9yASIepfGrjJSwGwvgGWhCW8
         U6fxyZwc1xep5CVL4/TuSEOnop4WU0D/i8AE9ObwvRqfIBHiJ7Q7b+eEEpTFk/uaxoQ+
         TvJWPyDJPf1J7AqgkShaWBcMO6n2wnhIovB64MIOu1ZgMQqKdaDwflFzRd3CdvL+27AD
         kf2zeBHjpCMQ8ZD8jX4luiX5W17iSGb/zZ2vErgqK5pUaCILpMHai234R411THMPOaPV
         ES4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757094661; x=1757699461;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZaXyfPMqwoi89bLGQQm9R1wibinvU7q12XwB+QMftqw=;
        b=tkiEPymu92jgtkckOwpZzJiNLw9yPvxGJvG9ChZLj9rVkRy8KNgcvUm2X2IYf0NnCH
         fo8g69BGiT8Sk5TREVZmJVSRzngvb6bH62gy3UXbCLzBzv+eVYn33+6X0CjpKsjYUaXe
         +3Z5cJwlNvsD46lJlX33qAqw8hfK60P1LNcwJKqeTZQXB+3DzZDWDuMoM22Uciyhqgr2
         8zcSP3FKUagKdrxcKENbt/pDg0J60UTNSWcDhOxioI9ZNSFIBMkw/VG6my0nUDZckXWL
         75TZ27D2v8d9ukG7F9O0Iogj8shqVJZXy33JA7geE6qI9pKsHlM80SRHZLXTpNYp5mBZ
         f5kw==
X-Forwarded-Encrypted: i=1; AJvYcCXycM72dEHudPpxCAxxAYryXl4RUn81x2jJ2MLXRUlblb9ddjvAXvA9ALE/Rcx9px6yYALsKWedW+L57Ci0o4Nb@lists.infradead.org
X-Gm-Message-State: AOJu0YzhOk9v23vuPvJSndZWLeUcfO23itfe8cMMdTxgmzVkKmEA5Veq
	f7zGSJKLfZ8QF0apL9fD9c4YHSvav6JCFDwvlrut0U+yM+DZHu3ONP4cKQVBw/XtmljTVJHDTig
	vHsznn6W73agR3IJe9VNGR6YZSyoIAcDN6a5dxqg=
X-Gm-Gg: ASbGncutf2D4drh5+zm3blVBmrBP7CrmJNyugi7758k1qtGrfIO/IacjtKpBdZDRdqQ
	GdkQ4vqBRZP2+aQIPniot3cb1Z/6q1losmoc6EHfyUkuPqbNqgTTK0eKTw0VERcTiGMfPo8ilcB
	peui8YKym46gmG5/sc5HNu/ezXiwxcknKfXAH4vBtOq/UnLffJ/81H7R3ztYNb2h5Wu4GqwnElT
	x2WejalwndGe7zsonm6otXgwondclJIf0W/4UAm638=
X-Google-Smtp-Source: AGHT+IHovfJi9UxsADA1y41PVTn87JQTAj3Hx1c4SPMGqx4uQRvjNmPj9yRmM3NVbenXyWcNvhGxjH9edA0XcuveD74=
X-Received: by 2002:a05:6512:b8f:b0:55f:4ac2:a59a with SMTP id
 2adb3069b0e04-560995d4d53mr1317878e87.22.1757094660686; Fri, 05 Sep 2025
 10:51:00 -0700 (PDT)
MIME-Version: 1.0
References: <CA+G9fYv0mbEBVs0oTiM+H4X-y7ZCwYpfa0hGCQCeVkW2ufGD_w@mail.gmail.com>
In-Reply-To: <CA+G9fYv0mbEBVs0oTiM+H4X-y7ZCwYpfa0hGCQCeVkW2ufGD_w@mail.gmail.com>
From: John Stultz <jstultz@google.com>
Date: Fri, 5 Sep 2025 10:50:48 -0700
X-Gm-Features: Ac12FXzVJdbZI6etdAi_p7uTw8KZ7iah-8DwGxTzPcTMM_M3HAoZ1BASAyToy4g
Message-ID: <CANDhNCpWWNpBQfeGq_Bj1pEWTYULJGaubTuPJ2Yxjg4_ESzgBw@mail.gmail.com>
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
X-CRM114-CacheID: sfid-20250905_105103_538547_FF25054A 
X-CRM114-Status: GOOD (  13.52  )
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

On Fri, Sep 5, 2025 at 6:21=E2=80=AFAM Naresh Kamboju <naresh.kamboju@linar=
o.org> wrote:
>
> Kernel warnings and a panic were observed on Juno-r2 while running
> LTP controllers (cgroup_fj_stress.sh) on the Linux next-20250904 with
> SCHED_PROXY_EXEC=3Dy enabled build.
>
> Regression Analysis:
> - New regression? yes
> - Reproducibility? yes
>
> First seen on next-20250904
> Bad: next-20250904
> Good: next-20250822
>
> Test regression: next-20250904 juno-r2 cgroup_fj_stress.sh kernel panic
>
> Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>

Thank you for the testing and the report here!

> Juno-r2:
>  * LTP controllers
>    * cgroup_fj_stress.sh
>
> Test crash:
> cgroup_fj_stress_net_cls_1_200_one:
> [  365.917504] /usr/local/bin/kirk[402]: cgroup_fj_stress_net_cls_1_200_o=
ne:
> start (command: cgroup_fj_stress.sh net_cls 1 200 one)
> [  374.230110] ------------[ cut here ]------------
> [  374.230132] WARNING: lib/timerqueue.c:55 at
> timerqueue_del+0x68/0x70, CPU#5: swapper/5/0

This looks like we are removing a timer that was already removed from the q=
ueue.

I don't see anything obvious right away in the delta that would clue
me into what's going on, but I'll try to reproduce this.

thanks
-john

