Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C4B1C44501
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 16 Jul 2026 03:07:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=q1RuOVbbGHwBjAA7Tjq8tp/2Sf1Tzdn7z+0lxdME/f8=; b=IxSV1F4XQ60XBSJEpF6bVn4Wul
	Eo5dG7yPayUDS/9ESvIQ1BdEvocctLSCzv1+21G9qru4PCd3092ik52Trw9C/m0jXOV2vvgqr2IA3
	G5G//BCWZXlgz8+/sK/AHNVDttHk+k1XBmxvvuYHSwsuNUoVg1d7bb+1plrPuk3DdvYG5BxAs303f
	rlv9GLD0DvA6T/2wSILDNRwJjrn50AfFp6DLg8ajdHyvGn8+9GW4LGUbUFU4KPBH2bgbdzOu2+Or0
	A0HtQXAGGBRDOeHq6PEcmLGuBpXEYVWCax5PRJnpA4+IoCnV4CzzfqF4PFTTZlpZWJkpakOQ9NsXJ
	Gys56EuA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkCRy-0000000GK3B-2QfZ;
	Thu, 16 Jul 2026 03:07:50 +0000
Received: from mail-oo1-xc33.google.com ([2607:f8b0:4864:20::c33])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkCRw-0000000GK2m-226u
	for linux-arm-kernel@lists.infradead.org;
	Thu, 16 Jul 2026 03:07:49 +0000
Received: by mail-oo1-xc33.google.com with SMTP id 006d021491bc7-6a0e55e82d0so1766002eaf.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 15 Jul 2026 20:07:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784171267; cv=none;
        d=google.com; s=arc-20260327;
        b=L4FCQOQ7g2XcJUEyrMzgf9ZZ8isJU74zy7Vejhkjhkam9ANnPer+bo/Mouc1WVx6mH
         crF7stqDG/j5733M0+HpuKrbcQYOmGh8gHS72xizO61WZPpSFVDnEqt7CjyA9u97oA5R
         m0hmVh+dnuy6n2oQuuqhyVZzj8DaJTwghffKXf7Ny/hfSDmfLxCRP2TRjBzLp97ZLrzT
         +1pEGOg6tJ64ZYqEXyoUbnalDZHlmWAjr2sNYc1ACwe5xY4ZVJMuuKKfCjyuaEXlyKod
         s4Ex0/oDnu+8CuCEPLCd4j1TJu2DNP5zvori3ZkL0e/3+Lkiwu57QfAzspc0PRGYWGQh
         bnwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=q1RuOVbbGHwBjAA7Tjq8tp/2Sf1Tzdn7z+0lxdME/f8=;
        fh=OS07RYH0BWV7ouO2t9Gvlzxd0bXB3aVnJ+HgTmvbkSA=;
        b=M5Ok25S+l5ACgeVVJwp7RyBohY8o/+kaFVGmeEXhBb44DyzFesNjOmg3XAa9/C0KtA
         0SxJqmB4TpbE1p4zE2ox+C4R5t/9rYcREPRIF58SayqNrJaxOLxYAvkzcIeEvoB+RwqE
         AucwfvOJHbHwniwBTtGrD1sZArKA4vLuJuEamLQ83IDpqWZmuM+l1r1ZQkMpn7PRqRUE
         A/jxstD566R4oUUHEc3YXUmoOU2FZkS3dVs5161NobdLQFPNWklXTzZ93aTV5l65RxA3
         PToGu91t3eIayTKiViEGo1pt4MAwg96C5RIHfC++EiIIsFqITluHEqyXMCGu5v4KbJs3
         wlXA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784171267; x=1784776067; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=q1RuOVbbGHwBjAA7Tjq8tp/2Sf1Tzdn7z+0lxdME/f8=;
        b=WywBYPj1cy8aau1KKeTIdNBdY/kWZZeBrL+uU1BLfPXGf5ovFGjc8wrq0kGDpnSWG4
         XYoPOGPm1Icvn0Eju6od7YdYzJiHIsLZI0488v9KJPESrF484bmgQTG8ZJpKTe5x20u5
         enJ3mH2Nw46vji2SdXekRqIxHNvCl2LnwTyUgUtiZOYZtH8yJoR2mah3mj8K19fEhYSR
         Rb/34jnTE1nq1OuGjkD1hyThM6Uw4MqaqashGQaYXgao/kablReqm/iUGcMJ5nEt3pvr
         4nHlpFysWv8LrwnagV1fQvMNdPUwsPkSM0lMb4UzcnK9tkon1jFua0GC4IJkRMObwBBr
         I4/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784171267; x=1784776067;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=q1RuOVbbGHwBjAA7Tjq8tp/2Sf1Tzdn7z+0lxdME/f8=;
        b=YfM2Eanlp55bXf0MXyIWprwjRry1FpfEALb+D9FrRq7LBe8pqtYPaONM6JIasldmTt
         X58+EJ6zO41bhz8rGQaqQofrZd7hudfvNdh2pFfkfxbS7p+DH8QoQ/MSzPuKeTfm+kja
         XWR4PXjszbOMJa+HwTjCOu32eoXKiZc9oj6ibwhePjORku22qJ7CVgZreSgRU6+EZzsm
         zKXmFp0M3sA6runOQqZ27tG+AY9OHitAPKArPDT4JqNaizOOFDaHi02m1BinJRXiEzmP
         A+as6Pb+bshSIo38LeHYH33OjNeYh56ZKyPZB3lEv37JihHtq2/x5oWfvPgMqyRUMwp7
         vaDA==
X-Forwarded-Encrypted: i=1; AHgh+RotArimVYS1WyX5APpI8PqspexOaFXdJ4CoR+xOpyBotneyjU5DDiZ0QKRdh65wsOnl9ELW3lLOonxWPj/9I266@lists.infradead.org
X-Gm-Message-State: AOJu0Yxc89Td65gNfSH8iepEIjGL+Cc2c8+yqxEZgeLchkJCZCAqZ+R3
	lZ4WSYgfvUxBNTyGH6djj4ZCoUFLOMcBdQXb4Z9oVPImuwYWG9UFeMo2emkfk+cyvAdgwroxtDx
	oz11dmJmYUHBmKbk/AOT8gtaGhAv9DEqYL8x/MO4=
X-Gm-Gg: AfdE7cnMqtaEnBSOfQT7n/4kRsxqFHSgaukD1LW/Pcci64Jet0xl43cJqDfH9FSF34r
	KToAYBIlxfjgb3+CTLqsUpxM4oo7NDE8Oe296p1ONkV4P9QpeNbCt6qHHJKhQC9JSsXbbcmjJ28
	7M0s3aVWETDD2u+RRwoUO4Er+SOsLG6amwaN/EpnyqqOrLR4oeGTjgkimuCsvdoMp/yn63FuCCo
	Y0oyfZgNWm9gLcS5qi2Fsdi/MXu52tOsz0LKEVeqKN5gLd91Wm33Bfv4Sjy4OkSMekMvjE1ocGh
	C/1NyCurs+EVOj4Ggs8D
X-Received: by 2002:a05:6820:4dc4:b0:6a1:50eb:2118 with SMTP id
 006d021491bc7-6a39a71fd1amr11747988eaf.60.1784171266680; Wed, 15 Jul 2026
 20:07:46 -0700 (PDT)
MIME-Version: 1.0
References: <20260712210446.14290-1-mohamedaymanworkspace@gmail.com>
 <20260713230028.8046-1-mohamedaymanworkspace@gmail.com> <20260714104252.NuPnAQyJ@linutronix.de>
 <CABWZVho1=oJHU6U16Kc-Nh1bQbn07oz7PPkM9Diy=JS0beGjFQ@mail.gmail.com> <20260715065832.qI7c2Px5@linutronix.de>
In-Reply-To: <20260715065832.qI7c2Px5@linutronix.de>
From: MOHAMED AYMAN <mohamedaymanworkspace@gmail.com>
Date: Thu, 16 Jul 2026 06:07:35 +0300
X-Gm-Features: AUfX_mzInr4Bf6hg3MJSbiLXrCzek5Wv-Tac3ugtCjr0XQO0DlFi8b-yt8eOcyY
Message-ID: <CABWZVhq5yN6uP-YJC07EVt6+AqmGoUcXx8RTdrYssQ9coQ1Q5Q@mail.gmail.com>
Subject: Re: [PATCH v2] coresight: Fix scheduling while atomic in coresight_put_percpu_source_ref()
To: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>, Mike Leach <mike.leach@arm.com>, 
	James Clark <james.clark@linaro.org>, Leo Yan <leo.yan@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Clark Williams <clrkwllms@kernel.org>, 
	Steven Rostedt <rostedt@goodmis.org>, 
	"moderated list:ARM/CORESIGHT FRAMEWORK AND DRIVERS" <coresight@lists.linaro.org>, 
	"moderated list:ARM/CORESIGHT FRAMEWORK AND DRIVERS" <linux-arm-kernel@lists.infradead.org>, 
	open list <linux-kernel@vger.kernel.org>, 
	"open list:Real-time Linux (PREEMPT_RT):Keyword:PREEMPT_RT" <linux-rt-devel@lists.linux.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260715_200748_559791_52EDACAF 
X-CRM114-Status: GOOD (  37.34  )
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

Hi Sebastian,

First Thing WOOOOOOOW, This is a brilliant observation and entirely
changes the approach.

To answer your question regarding how the reference drops to 0 in the
PM notifier:
You are exactly right that the device should have a base reference.
The only way `put_device()` inside the CPU_PM notifier drops the lastt
reference (reaching 0) is if there is a race condition. If another CPU
concurrently calls `coresight_unregister()`, it drops the base
reference. That leaves our CPU's PM notifier holding the absolute last
reference. When our PM notifier calls `put_device()`, it inadvertently
triggers the release cascade from an atomic context.

As you correctly pointed out, `coresight_cpu_get_active_path()` is the
root cause. It lazily reuses `coresight_get_percpu_source_ref()`,
which takes a kobject reference (`get_device()`) intended for path
building.

Since `coresight_cpu_pm_notify()` runs with local IRQs disabled, we do
not need to manipulate the kobject refcount at all. We can simply read
the per-cpu pointer under `coresight_dev_lock`, check the mode, and
return the path.

If we avoid the `get_device()` / `put_device()` entirely in the PM
path, we completely eliminate the bug at its source. We can throw away
all the complex workqueue and pending counter logic from v1/v2.

The fix would simply be rewriting `coresight_cpu_get_active_path()` like th=
is:

static struct coresight_path *coresight_cpu_get_active_path(enum cs_mode mo=
de)
{
struct coresight_device *source;
struct coresight_path *path =3D NULL;

guard(raw_spinlock_irqsave)(&coresight_dev_lock);

source =3D per_cpu(csdev_source, smp_processor_id());
if (source && (coresight_get_mode(source) & mode))
path =3D source->path;

return path;
}

This means we don't need `coresight_put_percpu_source_ref()` inside
the PM path at all.

Does this align with your suggestion !??
If so, I will prepare a v3 patch that drops the workqueue architecture
entirely and just applies this much simpler fix..

Best regards,
Mohamed Ayman

On Wed, Jul 15, 2026 at 9:58=E2=80=AFAM Sebastian Andrzej Siewior
<bigeasy@linutronix.de> wrote:
>
> On 2026-07-14 22:42:12 [+0300], MOHAMED AYMAN wrote:
> > Hi Sebastian,
> Hi Mohamed,
>
> > Thank you for the review and the feedback.
> >
> > Regarding the commit message:
> > You are completely right. I will update the wording in the v4 patch to
> > explicitly state that it "uses a spinlock_t for locking which becomes
> > a sleeping lock on PREEMPT_RT" instead of calling it an rt_mutex
> > directly.
> >
> > Regarding the module-ref counter:
> > We don't explicitly bump the module reference count for each new
> > device. Instead, we rely on `destroy_workqueue(coresight_wq)` inside
> > `coresight_exit()`. `destroy_workqueue()` synchronously drains all
> > pending work items before returning, which ensures no deferred puts
> > are executed after the module is unmapped.
>
> But what stops the module unload before all devices are released?
>
> > Regarding deferring coresight_device_release() vs put_device():
> > My initial v1 patch did exactly what you suggested, it only deferred
> > the body of `coresight_device_release()`. However, it was pointed out
> > that `put_device()` synchronously recurses into `kobject_cleanup()`,
> > which invokes the child's release function and immediately afterwards
> > calls `kobject_put(parent)`.
> >
> > If we only defer the child's release callback, the `put_device()` call
> > itself will still execute in the atomic CPU_PM notifier context. If
> > the parent device's release path acquires any sleeping locks, we will
> > still hit a "scheduling while atomic" panic. Deferring `put_device()`
> > entirely protects against this parent cascade.
> >
> > If it is strictly guaranteed that Coresight parent devices (liike
> > AMBA) will never sleep during their release paths, I can happily
> > revert to the simpler approach of just deferring
> > `coresight_device_release()`.
> >
> > Would you prefer I revert to deferring just the release function, or
> > keep the current architecture to safeguard the parent put?
>
> Well deferring as I suggested if the kobj goes away is a not good.
> That I part I didn't get: You have the call chain:
> |  coresight_cpu_pm_notify() (IRQs off)
> |    -> coresight_put_percpu_source_ref()
> |      -> put_device()
> |        -> coresight_device_release()
> |          -> free_percpu()
>
>
> What you skipped is coresight_cpu_get_active_path() and this one has a
> get and a put. Your put has a irqlock on coresight_dev_lock which I am
> not sure you need. But more importantly, why is the reference going back
> to 0? There would have to be a coresight_clear_percpu_source() in
> between, right?
>
> If you could avoid grabbing a reference in the coresight_cpu_pm_notify()
> path then we wouldn't have that problem or is there more to it?
>
> > Best regards,,
> > Mohamed Ayman
>
> Sebastian

