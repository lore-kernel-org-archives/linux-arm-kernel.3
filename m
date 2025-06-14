Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2D6DC71136
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 14 Jun 2025 02:38:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/4zSIPw19HlLUie6b0kgjQJHS7vidQhIk3Cd96brfSo=; b=tY/+5w6pFQGRq9uG5cG5HViwpD
	7RiH4FXKW8pQAJo9mLU1Np4WKqdSAG0JWQrYUdTgHlX+HQgi5JGrn6Q0aEOt3MVGX/yphyKPwUFTx
	cz9lPnTqq36TZ3o5SqEX1YEr0FeoC206ueI94YsVowGCumyQIryV0lmS4YwVsRjdjsPwoET3hpHT6
	81A1SrKkx8IPLcOPVfDfG/ha9u309i/SXZJ+WI+urprlCi3QUCDvB3f26gM9D5cq3qf5uvxU5lKcn
	5JU5sWglUz87FCj6+Nb11CXeuQ1AIbkVzu1lEkc92GLFjmOdEGHVwJzTSNeO2hwvhiwCZKR83Yt15
	a3qXKXhA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uQGmo-00000000Y1x-1BSM;
	Sat, 14 Jun 2025 02:38:26 +0000
Received: from mail-lf1-x12c.google.com ([2a00:1450:4864:20::12c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uQGke-00000000XvR-465n
	for linux-arm-kernel@lists.infradead.org;
	Sat, 14 Jun 2025 02:36:14 +0000
Received: by mail-lf1-x12c.google.com with SMTP id 2adb3069b0e04-54998f865b8so2486616e87.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 13 Jun 2025 19:36:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1749868570; x=1750473370; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/4zSIPw19HlLUie6b0kgjQJHS7vidQhIk3Cd96brfSo=;
        b=3x8Ikry+84sh/oYb+1u191TuViegfjTNSMxwXKg6WGi2YOSXAu0ytehfdClPTwRSTu
         EchHdh4/YbzhCw6M+aT7if0drOeAUZFMuDLCPuPA2BhU+CWSFJiV27X7cVvTgctP7wyo
         CbLviI6FSZulYAkfRhJHx4Bdb2LHGukNn6idq06mnoy8P0JrhSVruwZkneTqOxLLJk58
         bwwglr9vqCuWvdHlLtrpGfZOV1OQiwDiBR9BrtL5Oiz6i968sE1LPNga4ktS/kYkLBPH
         Voru1nY2Onjs9UbZdS7WmJVwT+IPX6/SknS/D5eOVTfp1PSjWzLxuSca355I0IGuwrl+
         5EDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749868570; x=1750473370;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/4zSIPw19HlLUie6b0kgjQJHS7vidQhIk3Cd96brfSo=;
        b=synMxjjThhk2STzBfN8GE0+YRcMySDXwo5+BInKb0nvXUl+sABJj/66ZFZJG5tDgSt
         ppbNgqKRS+ZBLZTAQdnu+XFUuvdBNDyq25SJsCrElNK42zJHuX4mjb71QdoX5A/II/kf
         bhnVMyPnn20S5dg+KY+QPIwdqmDyz/ezbLOmGn+Q8ZXi3Pc5Y8HdYyqER0awj3s9CiK1
         pzikculsgiseTpgidX9YbpHtxdDfRhLrHpPaL6CbkrwqxmwM98hJp0ww4+8ktt0Znail
         CGtbJ52fqG/T/ZU7CV6p/jDi00Jvq3AdG2V9bZptltqcYfqWfMIycglCgT4OManJzZ8/
         qJuw==
X-Forwarded-Encrypted: i=1; AJvYcCUSTpeeREP7tEfucnE3S/YcsJ6T1QA8xM1i39/LU92XGCy2lB4IMZPNY+EzYJDbZyZWi9sTDbHru7SweFeJoA0Y@lists.infradead.org
X-Gm-Message-State: AOJu0YyQad2PoqEku5MQuMMHyCeA3yL/E/SlX/ShjYjfORkd8mDYxxhp
	X28IHleeAvx4ms2/3YwhKDPIlgDgq8iKVIRoID7yr3/7KCQHaNtl7HoDG6zu7m8AAV6MlkDAJOG
	MdvIaaRjPRVYXjECPcDXZ1svLkOa9s5uPpdf9fK0=
X-Gm-Gg: ASbGnctsar0Qb+YzWB+QzYrMIPt0Ra6jdpRVBhkgZD1kSEqoCVjx/RIXc3BUsGjv87Y
	ArSQRS7YMWWujR4VYAuyqlVaiQVlHe5gLpUThQXrA0ISAakqgKhzalBgbih3zEbxJKK5mIbuw7J
	xdchnad6VoxIaZAEDTAmpz2TnteYX66uE0l56hkgIHrk6aOetsIVV7XzSfLN2RiBrKXKOqBI0=
X-Google-Smtp-Source: AGHT+IFxdd/eeA/jqO+ioIaQwggzyaJAKSp2npacWe2qm5ZmqZbGMbcXq9pAMDlbKaGfZHdE5uH6xTWQR5MyLSGGuXg=
X-Received: by 2002:a05:6512:3f12:b0:553:ae47:6856 with SMTP id
 2adb3069b0e04-553b6e7d3b4mr334265e87.10.1749868570161; Fri, 13 Jun 2025
 19:36:10 -0700 (PDT)
MIME-Version: 1.0
References: <20250614020524.631521-1-kuyo.chang@mediatek.com>
In-Reply-To: <20250614020524.631521-1-kuyo.chang@mediatek.com>
From: John Stultz <jstultz@google.com>
Date: Fri, 13 Jun 2025 19:35:58 -0700
X-Gm-Features: AX0GCFtDliQH_6brlg-dmQaZIRQh31WrUqfBwRgyCd0Z_gzAKUDVN86BzaEZjjk
Message-ID: <CANDhNCpoKUbQU590m-vBKhk96ZCKDsYWOHwP_LL2W84SPOnXww@mail.gmail.com>
Subject: Re: [PATCH 1/1] sched/deadline: Fix fair_server runtime calculation formula
To: Kuyo Chang <kuyo.chang@mediatek.com>
Cc: Ingo Molnar <mingo@redhat.com>, Peter Zijlstra <peterz@infradead.org>, 
	Juri Lelli <juri.lelli@redhat.com>, Vincent Guittot <vincent.guittot@linaro.org>, 
	Dietmar Eggemann <dietmar.eggemann@arm.com>, Steven Rostedt <rostedt@goodmis.org>, 
	Ben Segall <bsegall@google.com>, Mel Gorman <mgorman@suse.de>, 
	Valentin Schneider <vschneid@redhat.com>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250613_193613_015788_0D48DD5F 
X-CRM114-Status: GOOD (  19.29  )
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

On Fri, Jun 13, 2025 at 7:05=E2=80=AFPM Kuyo Chang <kuyo.chang@mediatek.com=
> wrote:
> From: kuyo chang <kuyo.chang@mediatek.com>
>
> [Symptom]
> The calculation formula for fair_server runtime is based on
> Frequency/CPU scale-invariance.
> This will cause excessive RT latency (expect absolute time).
>
> [Analysis]
> Consider the following case under a Big.LITTLE architecture:
>
> Assume the runtime is : 50,000,000 ns, and FIE/CIE as below
> FIE: 100
> CIE:50
> First by FIE, the runtime is scaled to 50,000,000 * 100 >> 10 =3D 4,882,8=
12
> Then by CIE, it is further scaled to 4,882,812 * 50 >> 10 =3D 238,418.
>
> So it will scaled to 238,418 ns.
>
> [Solution]
> The runtime for fair_server should be absolute time
> asis RT bandwidth control.
> Fix the runtime calculation formula for the fair_server.
>
> Signed-off-by: kuyo chang <kuyo.chang@mediatek.com>

While I've not quite gotten my head around the details in the
dl_server code, I've been able to reproduce the problem described here
with a 6.12 based kernel.

Running cyclictest (with arguments "-t -a -p99 -m") , and a randomized
input test on an Android device, its pretty easy to trip 100ms to
*multi-second* delays of the RT prio 99 threads.

Perfetto image:
https://github.com/johnstultz-work/misc/blob/main/images/2025-06-13_cyclict=
est-dl-server-latency.png

Link to the actual trace:
https://ui.perfetto.dev/#!/?s=3D9bbb9e539ac2bbbfe3cfa954409134662a9f624a

Using this patch, so far in my testing with the same workload, the max
cyclictest latencies stick around the single digit ms range.

The part that is a little confusing to me, is that prior to the long
stall, it doesn't appear that RT tasks are actually starving
SCHED_NORMAL tasks, so I'm conceptually surprised to see the dl_server
boosting the normal tasks, especially for so long, but I admittedly
haven't looked in detail at the code and have been going off my
understanding of how it was supposed to replace rt-throttling, so I
may be missing a subtlety.

thanks
-john

