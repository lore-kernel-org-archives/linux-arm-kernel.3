Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D4F9C44507
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Jul 2026 19:42:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zxVjA6Wf03JWIhHpDHaN7R3Ti8g+kay7fZlb8zOdmF0=; b=gRFdgxLH8TSsqcsRvOmQiHyLJt
	kHJrF+AfryUB4grs6TKtsd5d2KWHiArFXodnbU5KSPYNnFYj2JA4Skx3+2nXtilq62eLHZaviGGgs
	6yE1EuuU/Ffk8qMOoh8Cu6OSdrIN92rA01VBUh/0u4H+5c94zsgsCe2qSESStktGteFaEcsSiv+Az
	sApvR5QdtSrMr7+235u2kY1ZdN9aPxone2S52xOU5K30fBWxtEtujGUaS6/G+3x5mosdYQcnPJlWH
	lmSMqmJgwtQSAmzUOp/3NKU++G1qm4clt5qJPCbP4qD9xsc6iBzDN6c8dw1/ZCj9XBFQY7zTfcWCM
	yLaQzXyQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjj1Q-0000000D9Pf-0IoU;
	Tue, 14 Jul 2026 19:42:28 +0000
Received: from mail-oa1-x2e.google.com ([2001:4860:4864:20::2e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjj1N-0000000D9PC-00KU
	for linux-arm-kernel@lists.infradead.org;
	Tue, 14 Jul 2026 19:42:26 +0000
Received: by mail-oa1-x2e.google.com with SMTP id 586e51a60fabf-448b89f700fso2851196fac.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 14 Jul 2026 12:42:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784058144; cv=none;
        d=google.com; s=arc-20260327;
        b=JFISEXCLeDl7Vfahdg5l3irnDb2/RcQv4LYBccr1rLOTBmbn2OUk5mFOjfEXzhswv4
         NS3IuSjPddSU+wccbFO+chHwPabyBoxvy4MYBy8s/nhC8Yjwm87QUWQOSJfwyWs3VckU
         w6Eg68kwXfjn4N9tD8R6oLwCxF53hi9nldQeuOuAaY6hvQrRMKvVCX4QfD1qtVfLCOMN
         x6vaoUqp8YrmNzqhvTRDsCZDI84eLuajxG0rRyvnu93PbudMt1eJVKy5bGOwrWuAu6Hp
         KbjrXzB08IDNjtsKRi9fd8XSL9NFmE0DDHCYlQ2RkMfzWMSTxToy5VeV+vsXuJZUwiHg
         PE2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=zxVjA6Wf03JWIhHpDHaN7R3Ti8g+kay7fZlb8zOdmF0=;
        fh=8chFepA+eRDgS/Z+x/7h0Jz6vhnWkiEKN9wlvoGoYiM=;
        b=n1n1EdTcLEIAQIQxHabaKjSlpun0ENUjwhlHVDLF81ONyKVQFXlu+zhJNmL/jZKYA2
         9gudH2nH53A1uQwRiGMe/x+XaGYDnZ5SdRQH3IBEdgZaqtZ4AZxepJecnfpbx7YSwcht
         6hbLeS18jeQLf4Ix3U4lf+Dt8ESLirACWPITJZpxe/bipdeabYS8xR8SY+4pkemi+59w
         DQm+SoBmiJ0P2h6DQI88+mP/pqA162OfdhDidhocLxJ84R0/5X6J3RNV7MyBJJA9Zz1k
         /QL5JhxYw3BX5NKD0wPsfj0p8murEzv+4fJER/b6RntGUk36lVb91xiCKK87UkqevDdc
         2bOg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784058144; x=1784662944; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=zxVjA6Wf03JWIhHpDHaN7R3Ti8g+kay7fZlb8zOdmF0=;
        b=EBOTFfCZ1DVgTEej27AnX83WwleZWV4+LKQbaqJnHBuD3OOXhTWUbfsBhz43s+Aq0N
         HqQayoEZ6kjaBdyBUPyVDGvZ/82fd9SyWV0dCvOlM0JvhsQdUs6U1sIiKaKLAJ0drwuK
         uWSBt7LdG2S6XdIFVoe/dXHO15osPTq3w8EscWk0Ql2lpHnVgMpCD7xrN6GFaZwkJ03w
         oos3dzcaBSAPOkxuan9JpS/gsylor496XcKh8LTKqa6H5yQmGArZ9RaYecf8InLYJpJm
         53bwVoq6uHCWwdDy2vAucVhSwsB5ZLF8sPhX35rkSAie7rqipLyjk3afQ8gUJej4vD8U
         3dkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784058144; x=1784662944;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zxVjA6Wf03JWIhHpDHaN7R3Ti8g+kay7fZlb8zOdmF0=;
        b=hU/FgaiGsjv3DZbgusaLQeuEGnpCXpvJFm60tWJHZSzQ2/XoOYaHbvvzehktv50vcZ
         m3CwB4hkKPBcQ4+R4v3/asWqINZN6MkvmmkMJR+/TNIZK6Fif9RNBJQMRI3tL2+8XIV0
         o/msE9bTRtJQykjqaT5GHLA17C2tPm30z5ModJIuVsjWFwSarM6A7orQL7QIkARybIrJ
         n4cnCoJDlT/fxYz5WO6UUbxOV5q+MEOd60lpjVQqW++tgxkyiP0jGdtFZ8xP555jiJ5Z
         u1wzf5flA7rTAWEo6ObODxJHAH56s60TAG4VRZP2MuBUj1WQUnNgm+PxtU2/BRQ0+D2Q
         1dRw==
X-Forwarded-Encrypted: i=1; AFNElJ/xMZRqnFg7LOo9u5FnSv2+/4l1UgbDHLSooWLF6L9G680PWBcKnJc2s6nxAPHDhYT553xo0vzciE9v4zxfhlBL@lists.infradead.org
X-Gm-Message-State: AOJu0Yz/jaU3iq/JPv79p0e9yWkwhDb8dKlZldRtFgm3PFcNWib6ES+2
	a06+a7sTpn9Pd3O774+kJwcYTMFnkk+Mnyc/QaVhKYdnfJdaENBcdiR5K2BuPYlv0KQoBYbPQ6O
	b8SR8DTX8X2t6cEVg97SzUWgz4eD/4u4=
X-Gm-Gg: AfdE7cl8EhCdOz/6Ps8ScPRjdJliR9IIPD3gFg6Qd1oLbvZAua2aesnMpon9t7xMMjI
	sHDhF0qBxHmk0NVcRQCSsAlOMMjgAiWjprk6Ekdk5nte6J5xwUPw+W157cJpjGr3FvkWSIwYp0A
	vRddsAtiwPB9XR7lca3Tl+yA0PuSNLlsDIAN+PDdVZFoweXeUjwRjTBV9mObSYu5gG1n0HmmKb4
	yW/HJ9sUo6nFJumV3kE98WPu/rRDGleivvzSryN3axfPYtxwbV4p9sM2Wf9DTG72orm/x226Gcd
	Tchim+ohxHWssDmWWj0NIS8XFFYsQUQ=
X-Received: by 2002:a05:6871:54c:b0:447:7ad3:329b with SMTP id
 586e51a60fabf-4562b2d1908mr102271fac.6.1784058143884; Tue, 14 Jul 2026
 12:42:23 -0700 (PDT)
MIME-Version: 1.0
References: <20260712210446.14290-1-mohamedaymanworkspace@gmail.com>
 <20260713230028.8046-1-mohamedaymanworkspace@gmail.com> <20260714104252.NuPnAQyJ@linutronix.de>
In-Reply-To: <20260714104252.NuPnAQyJ@linutronix.de>
From: MOHAMED AYMAN <mohamedaymanworkspace@gmail.com>
Date: Tue, 14 Jul 2026 22:42:12 +0300
X-Gm-Features: AUfX_mw9n5xrRjUjg8K5isFflq9MeU31PnE9r0_YUAnoBatRP-2yXpKQ2cbGW5Q
Message-ID: <CABWZVho1=oJHU6U16Kc-Nh1bQbn07oz7PPkM9Diy=JS0beGjFQ@mail.gmail.com>
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
X-CRM114-CacheID: sfid-20260714_124225_077879_95BDB605 
X-CRM114-Status: GOOD (  32.05  )
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

Thank you for the review and the feedback.

Regarding the commit message:
You are completely right. I will update the wording in the v4 patch to
explicitly state that it "uses a spinlock_t for locking which becomes
a sleeping lock on PREEMPT_RT" instead of calling it an rt_mutex
directly.

Regarding the module-ref counter:
We don't explicitly bump the module reference count for each new
device. Instead, we rely on `destroy_workqueue(coresight_wq)` inside
`coresight_exit()`. `destroy_workqueue()` synchronously drains all
pending work items before returning, which ensures no deferred puts
are executed after the module is unmapped.

Regarding deferring coresight_device_release() vs put_device():
My initial v1 patch did exactly what you suggested, it only deferred
the body of `coresight_device_release()`. However, it was pointed out
that `put_device()` synchronously recurses into `kobject_cleanup()`,
which invokes the child's release function and immediately afterwards
calls `kobject_put(parent)`.

If we only defer the child's release callback, the `put_device()` call
itself will still execute in the atomic CPU_PM notifier context. If
the parent device's release path acquires any sleeping locks, we will
still hit a "scheduling while atomic" panic. Deferring `put_device()`
entirely protects against this parent cascade.

If it is strictly guaranteed that Coresight parent devices (liike
AMBA) will never sleep during their release paths, I can happily
revert to the simpler approach of just deferring
`coresight_device_release()`.

Would you prefer I revert to deferring just the release function, or
keep the current architecture to safeguard the parent put?

Best regards,,
Mohamed Ayman

On Tue, Jul 14, 2026 at 1:42=E2=80=AFPM Sebastian Andrzej Siewior
<bigeasy@linutronix.de> wrote:
>
> On 2026-07-14 02:00:27 [+0300], Mohamed Ayman wrote:
> > Dropping the last reference to a coresight_device triggers a kernel pan=
ic
> > on PREEMPT_RT builds due to a "scheduling while atomic" violation.
> >
> > During CPU idle transitions, coresight_cpu_pm_notify() runs with
> > interrupts disabled. It eventually calls put_device(), which can
> > synchronously trigger the device's release callback and drop the parent
> > device's reference. On PREEMPT_RT, free_percpu() takes a sleeping lock
> > (rt-mutex), and the parent's release callback might also sleep. Sleepin=
g
>
> It is a spinlock_t which we refer as a sleeping lock. There is "struct
> rt_mutex" which is somehow different.
> I would suggest to word it like "uses a spinlock_t for locking which
> becomes a sleeping lock on PREEMPT_RT".
>
> > in this atomic PM context crashes the system.
> >
> > A previous patch tried deferring just the coresight_device_release() bo=
dy,
> > but this still left the synchronous put_device() call dangerously expos=
ed
> > to sleeping parent release functions.
> >
> > Fix this by entirely deferring the put_device() call to process context=
.
> > We add a pending counter (put_pending) and a work_struct to the coresig=
ht
> > device. When releasing a reference, we increment the counter and queue
> > the work. A worker thread then safely drains the counter and calls
> > put_device(). The counter prevents leaking references if multiple puts
> > are queued before the worker even has a chance to run.
> >
> > To prevent a use-after-free race condition during module unload, the wo=
rk
> > is queued on a dedicated coresight_wq which is safely drained and
> > destroyed in coresight_exit().
>
> Do you have anything that keeps the module-ref counter up with each new
> device?
>
> > Finally, remove the unnecessary raw_spinlock_irqsave in the put path,
> > as dropping a reference doesn't require protecting the per-CPU table.
> >
> > Signed-off-by: Mohamed Ayman <mohamedaymanworkspace@gmail.com>
> > ---
> =E2=80=A6
> > @@ -163,16 +175,9 @@ void coresight_put_percpu_source_ref(struct coresi=
ght_device *csdev)
> >       if (!csdev || !coresight_is_percpu_source(csdev))
> >               return;
> >
> > -     guard(raw_spinlock_irqsave)(&coresight_dev_lock);
> > +     atomic_inc(&csdev->put_pending);
> >
> > -     /*
> > -      * TODO: coresight_device_release() is invoked to release resourc=
es when
> > -      * the device's refcount reaches zero. It then calls free_percpu(=
),
> > -      * which acquires pcpu_lock =E2=80=94 a sleepable lock when PREEM=
PT_RT is
> > -      * enabled. Since the raw spinlock coresight_dev_lock is held, th=
is can
> > -      * lead to a potential "scheduling while atomic" issue.
> > -      */
> > -     put_device(&csdev->dev);
> > +     queue_work(coresight_wq, &csdev->put_work);
>
> What about you keep this as-is and just delay coresight_device_release()
> instead?
>
> >  }
> >
> >  struct coresight_device *coresight_get_source(struct coresight_path *p=
ath)
>
> Sebastian

