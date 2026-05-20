Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D382ECD4F54
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 20 May 2026 23:38:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+XojcX+cBNMxauV3CDSL9gXTCmD6yueQSzdQP2DbJ+E=; b=hvixoiRIAbdbQ0jQVIrjmJURr+
	dU25w/cmwGLsXKFUL1Pcjd1DozryHHawju3nek42nZYOvvB6adjTqP5+dOQ33w7UTAqM1OWf0Id51
	Nxf33y7yxQXN0ydkFkbOFyfl3NWM6YB4lg3ark2nBvk/22Tn67XxwU/YBPUaM54+I3xJ5qBAH8iuj
	pbAWmkm3XI1p0MYjzTy19X8kqN8/WHELVLJ8mcBqvpKDyt2opErWdALiwmXfDzATzaTG6BIStwAJy
	CTvwMCGWjIzc2LRy0rzEdlCQQzBhCFkm45HxV84YA+GSQoqKWoR2BgHHDd6xYYe4V3lZSNHqyI1yG
	kEY5VLXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPqUS-00000006Afe-30QA;
	Wed, 20 May 2026 23:38:16 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPqUO-00000006AeB-2u5C
	for linux-arm-kernel@lists.infradead.org;
	Wed, 20 May 2026 23:38:15 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 2B3FE445E5
	for <linux-arm-kernel@lists.infradead.org>; Wed, 20 May 2026 23:38:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 129871F000E9
	for <linux-arm-kernel@lists.infradead.org>; Wed, 20 May 2026 23:38:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779320291;
	bh=+XojcX+cBNMxauV3CDSL9gXTCmD6yueQSzdQP2DbJ+E=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=ohUWzsQy12Lp2RUlEnBLUpIu54GIgmODDx+dWdarhAtmeIMNmwk6cNzdcGmgo4qIy
	 Yaxse71rD9idF+ShHyVaV8B0pHsH11PYbLqqfEkB9dNAR0UokviE7D6k10N3Z6WRem
	 IGHDaZzmoZwKnkhoquW1BSE0oowVqnkbFZQYLDdom4mO561qefmVCsJbTRHVN35kiv
	 5hfXjkPjvlQyXGVGO+RXBVSDUEbDPfAF4ii2XnvJHsz56+jMEHNQwX3fW/QMN8Kn8w
	 q+Xc2FMz78D+TRp/bAFobADWyZ4RPxaYocop4r+YdQN5Pwig7z9KRZfJjMDpHnQM70
	 BChD9ozPtWbug==
Received: by mail-qt1-f181.google.com with SMTP id d75a77b69052e-50faeb8317bso49938801cf.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 20 May 2026 16:38:11 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ/uUR72lFPkVNMQ80C/tMmvfH6E5wTryevogGpb1FjpwnCaheIKR1EhopIWMPxV8ktQQp42HXhZxMdgcSZx+0/R@lists.infradead.org
X-Gm-Message-State: AOJu0YzBUnOb5fUQvhSZ7zxNnOfIlmHQxrD6qM1QpTYn+o2OjvYMQ5MQ
	IhUICqahzWhXZpVeFuF60Xe7reWDO/Kvny6BTdIVTNx7e0Vl6PMaj+Teb+4grKIFdWdhknP0PUX
	nfJ8U73eMZ4uAgzIpmDSHrX4G5TAOz6A=
X-Received: by 2002:a05:622a:17c7:b0:50d:b0f9:1a66 with SMTP id
 d75a77b69052e-516c55ce180mr9639641cf.42.1779320290158; Wed, 20 May 2026
 16:38:10 -0700 (PDT)
MIME-Version: 1.0
References: <afTpoL3FklpQZNMM@casper.infradead.org> <CAGsJ_4ysMcrmDLSOwBkf7qwCQrcDWeEMXkHDajTJFMLKUk0bSQ@mail.gmail.com>
 <agrWuDNGddNmvMFD@lucifer> <CAGsJ_4zqLfdWoTH9s7FFaqWWj0mESfikYgr7=GcV64qcuXrPxA@mail.gmail.com>
 <CAJuCfpE0WQrB3zJp9qn3jvn5DthS=ttpX7gJJvyEhA_BJGrp5g@mail.gmail.com>
 <CAGsJ_4zgeE3ebEJ+j7GJFzWVoVYHeiOn4dOoOsmWCLA6s=oECQ@mail.gmail.com>
 <5zdaa5uv5oj27q3taopl3amops57ouxgyfsdveudz4ovmbdw7z@6lwrlyvmhcp2>
 <CAGsJ_4yKxg1QugcsJi3WD0KVGJKe-zXycgm5D6cRi9vWtNcpDQ@mail.gmail.com>
 <ag4h87CBd-gph9zX@casper.infradead.org> <CAGsJ_4zA8afu0xXy0WS+tMe-eesDX1W6UBmfAsuouUpcAgK8JQ@mail.gmail.com>
 <ag4kj84EcKqamdB-@casper.infradead.org> <3be9475b-0e8a-4df8-a130-4262f993973d@kernel.org>
In-Reply-To: <3be9475b-0e8a-4df8-a130-4262f993973d@kernel.org>
From: Barry Song <baohua@kernel.org>
Date: Thu, 21 May 2026 07:37:58 +0800
X-Gmail-Original-Message-ID: <CAGsJ_4xC5LdhuoWV1=tK-RZ5rkjc8aOKOkmb1L_8BG_3gtJhDg@mail.gmail.com>
X-Gm-Features: AVHnY4LEan2jPUL-UnPeql1qwutuRGUCiZMo1ZXEi3On484A8O-Avt_P3lSUuSE
Message-ID: <CAGsJ_4xC5LdhuoWV1=tK-RZ5rkjc8aOKOkmb1L_8BG_3gtJhDg@mail.gmail.com>
Subject: Re: [PATCH v2 0/5] mm: reduce mmap_lock contention and improve page
 fault performance
To: "David Hildenbrand (Arm)" <david@kernel.org>
Cc: Matthew Wilcox <willy@infradead.org>, "Liam R. Howlett" <liam@infradead.org>, 
	Suren Baghdasaryan <surenb@google.com>, Lorenzo Stoakes <ljs@kernel.org>, akpm@linux-foundation.org, 
	linux-mm@kvack.org, vbabka@kernel.org, rppt@kernel.org, mhocko@suse.com, 
	jack@suse.cz, pfalcato@suse.de, wanglian@kylinos.cn, chentao@kylinos.cn, 
	lianux.mm@gmail.com, kunwu.chan@gmail.com, liyangouwen1@oppo.com, 
	chrisl@kernel.org, kasong@tencent.com, shikemeng@huaweicloud.com, 
	nphamcs@gmail.com, bhe@redhat.com, youngjun.park@lge.com, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	loongarch@lists.linux.dev, linuxppc-dev@lists.ozlabs.org, 
	linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org, 
	Nanzhe Zhao <nzzhao@126.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260520_163812_771818_E406932A 
X-CRM114-Status: GOOD (  20.01  )
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

On Thu, May 21, 2026 at 5:35=E2=80=AFAM David Hildenbrand (Arm)
<david@kernel.org> wrote:
>
> On 5/20/26 23:15, Matthew Wilcox wrote:
> > On Thu, May 21, 2026 at 05:14:20AM +0800, Barry Song wrote:
> >> My understanding is that we should not blame applications here. This i=
s 2026:
> >> there are basically only two kinds of applications =E2=80=94 single-th=
readed and
> >> multi-threaded =E2=80=94 and single-threaded applications are nearly e=
xtinct.
> >
> > all of the applications i run are either single threaded or don't fork.
> > what multithreaded applications call fork?
>
> Traditionally the problem was random libraries using fork+execve to launc=
h other
> programs ... instead of using alternatives like posix_spwan (some use cas=
es
> require more work done before execve and cannot yet switch to that). I'd =
hope
> that that is less of a problem on Android.
>
> I assume Android zygote might be multi threaded? Maybe sshd as well? Syst=
emd?
> But I'd be surprised if there are really performance implications.

I am trying to answer the question above:

1. zygote, multi-threaded on my phone using Android13.
/ # ls /proc/`pidof zygote64`/task/
1359  22728  22729  22730  22731  22732

/proc/1359/task # cat 22728/comm
Jit thread pool
/proc/1359/task # cat 22730/comm
ReferenceQueueD
/proc/1359/task # cat 22731/comm
FinalizerDaemon
/proc/1359/task # cat 22732/comm
FinalizerWatchd
/proc/1359/task # cat 1359/comm
main

But on another phone of mine running Android 16, zygote64 is
single-threaded.
Not sure if it is due to the Android team making some changes
related to threads from Android 13 to Android 16.

2. sshd, multi-processes instead of multi-threads:
$ ps aux | grep sshd
root        1192  0.0  0.0  15444  9032 ?        Ss   09:42   0:00
sshd: /usr/sbin/sshd -D [listener] 0 of 10-100 startups
root        2465  0.0  0.0  17164 10760 ?        Ss   09:42   0:00
sshd: barry [priv]
barry       2632  0.0  0.0  17164  7852 ?        S    09:42   0:00
sshd: barry@pts/0
root        3305  2.5  0.0  17164 10772 ?        Ss   09:44   0:00
sshd: barry [priv]
barry       3406  0.0  0.0  17164  7940 ?        S    09:44   0:00
sshd: barry@pts/1

3. systemd, also multi-processes

$ ps ax | grep systemd
    350 ?        S<s    0:00 /lib/systemd/systemd-journald
    387 ?        Ss     0:00 /lib/systemd/systemd-udevd
    666 ?        Ss     0:00 /lib/systemd/systemd-oomd
    667 ?        Ss     0:00 /lib/systemd/systemd-resolved
    728 ?        Ss     0:00 @dbus-daemon --system --address=3Dsystemd:
--nofork --nopidfile --systemd-activation --syslog-only
    751 ?        Ss     0:00 /lib/systemd/systemd-logind
    753 ?        Ssl    0:00 /usr/sbin/thermald --systemd
--dbus-enable --adaptive
   1350 ?        Ss     0:00 /lib/systemd/systemd --user
   1428 ?        Ss     0:00 /usr/bin/dbus-daemon --session
--address=3Dsystemd: --nofork --nopidfile --systemd-activation
--syslog-only
   1900 ?        Ssl    0:00 /usr/libexec/gnome-session-binary
--systemd-service --session=3Dubuntu
   2141 ?        Ssl    0:00 /lib/systemd/systemd-timesyncd

>
> Not sure about webbroswers .... I think most of them switched to fork ser=
vers,
> where I would assume fork servers would be single-threaded.

On my phone, Chrome is multi-process, but its parent process
chrome_zygote (10774) is single-threaded:

 ps -A | grep chrome
u0_i15        9883 10774 321066464 119452 do_epoll_wait     0 S
com.android.chrome:sandboxed_process0:org.chromium.content.app.SandboxedPro=
cessService0:15
u0_a142      10164  1359 35110548 277640 do_epoll_wait      0 S
com.android.chrome
u0_a278      10724  1359 9779864 104988 do_epoll_wait       0 S
com.google.android.apps.chromecast.app
u0_a142      10774  1359 32803908 64076 do_sys_poll         0 S
com.android.chrome_zygote
u0_a142      11173  1359 34208592 142192 do_epoll_wait      0 S
com.android.chrome:privileged_process0

/proc/10774/task # ls
10774

>
> So, yeah, getting a clear understanding how this ends up being a problem =
on
> Android would be great.

I guess the real issue is that in the Android market, there
are so many applications that are out of our control=EF=BC=9F

Here are some trace examples from Nanzhe:

iQIYI plugin
vma reader thread:
PbMisc-0, pid=3D27183, tgid=3D26444

vma writer thread:
i.video:plugin1, pid=3D27298, tgid=3D26444
writer blocked: 440394938 ns (440 ms)

reader stack:
vma_start_read
lock_vma_under_rcu
do_page_fault
do_translation_fault
do_mem_abort
el0_da
el0t_64_sync_handler
el0t_64_sync

writer stack:
__vma_start_write
dup_mmap
copy_mm
copy_process
kernel_clone
__arm64_sys_clone
invoke_syscall
el0_svc_common
do_el0_svc
el0_svc


Baidu Tieba
vma reader thread:
elastic_pms_pro, pid=3D7731, tgid=3D7575

vma writer thread:
com.baidu.tieba, pid=3D8005, tgid=3D7575
writer blocked: 514975545 ns(515 ms)

reader stack:
vma_start_read
lock_vma_under_rcu
do_page_fault
do_translation_fault
do_mem_abort
el0_da
el0t_64_sync_handler
el0t_64_sync

writer stack:
__vma_start_write
dup_mmap
copy_mm
copy_process
kernel_clone
__arm64_sys_clone
invoke_syscall
el0_svc_common
do_el0_svc
el0_svc

Thanks
Barry

