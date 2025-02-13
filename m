Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E16DC021A4
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Feb 2025 07:28:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hez88kgHU9eUIJtD/8CfWWTkT7cgATL4mccFo5fmuIs=; b=4o3QAZc7nU8vY2q7SH4J6bsthV
	A75qkntvmtMUmPPlFqOg6T3olhmNd2x4R3o6nvpgu3HjSM/MMyLANGSJ8KCvSjnhxOeBwhzzsj2Xc
	CADTf+mQ+wUivx+59So0lrOfWKf+lp/Db0CjLdu0zpUsWCOKLaBakNDgTgZENXc9dSbunnp+bP7Zk
	P+a17weVuxIa3wHdYSC/XK5FdKbREpkbGyWV/NkA/wPAgWzhym4JVro5lBxJj9s5QXyJKUrn9jYKd
	w/xMI17a6ECvdgrSls/qiQrPGhM8iUdLS8GTpOlojJYXK2enKdjAEyKP9y2vE2gIyTu1h4Rkw/d0/
	tivNTlRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tiTeF-0000000A5na-1dPy;
	Thu, 13 Feb 2025 07:28:35 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tiTce-0000000A5LC-453Q
	for linux-arm-kernel@lists.infradead.org;
	Thu, 13 Feb 2025 07:26:58 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 3E1EC5C4D1D;
	Thu, 13 Feb 2025 07:26:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 41550C4CED1;
	Thu, 13 Feb 2025 07:26:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739431615;
	bh=6+6SjTJ5zbBWxWy5yIkCvwaE38nvcNBxMZbRUBc8RBA=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=Qx7v7ygtKrp5rSxpDmVmUIHnSzBbeYd8tFVfNhPCmnc0laghy1eF9UUW+hkp4axZI
	 p+pkZQDVegMD0xm3EHURlq8KHEETkRi4ZQSmg2LGRy02CIxK4QTvgYjVG7OYGgSAUM
	 wDn64yV+nIYRD0E3wkknwkG9WffPbzMxPvrRKhV1hnQUu12ZoEt9fZoTM55TA3RHfi
	 k8oALO0XKrJs0K60AF3Kw677L0zcjITQDN1gQ/pNOPQV7teP9EGhnWtL1ubMEcQNaO
	 4VePFaZzNZrk2k0ywsV8S9ceu3hzuiDC3V/XFtRqQsNzzt7raO65NF3Fj8nlVh+SGw
	 ATXFLwjyl6NEg==
From: Puranjay Mohan <puranjay@kernel.org>
To: Song Liu <song@kernel.org>, Indu Bhagat <indu.bhagat@oracle.com>
Cc: Weinan Liu <wnliu@google.com>, Josh Poimboeuf <jpoimboe@kernel.org>,
 Steven Rostedt <rostedt@goodmis.org>, Peter Zijlstra
 <peterz@infradead.org>, Mark Rutland <mark.rutland@arm.com>,
 roman.gushchin@linux.dev, Will Deacon <will@kernel.org>, Ian Rogers
 <irogers@google.com>, linux-toolchains@vger.kernel.org,
 linux-kernel@vger.kernel.org, live-patching@vger.kernel.org,
 joe.lawrence@redhat.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 0/8] unwind, arm64: add sframe unwinder for kernel
In-Reply-To: <CAPhsuW4ct6W_4B0LFEjLePH1pAeNm4h8ePuQ3HcSoknXhQWN0w@mail.gmail.com>
References: <20250127213310.2496133-1-wnliu@google.com>
 <CAPhsuW6S1JPn0Dp+bhJiSVs9iUv7v7HThBSE85iaDAvw=_2TUw@mail.gmail.com>
 <00fa304d-84bf-4fca-9b9a-f3b56cd97424@oracle.com>
 <CAPhsuW4ct6W_4B0LFEjLePH1pAeNm4h8ePuQ3HcSoknXhQWN0w@mail.gmail.com>
Date: Thu, 13 Feb 2025 07:26:40 +0000
Message-ID: <mb61p1pw21f0v.fsf@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-=";
	micalg=pgp-sha512; protocol="application/pgp-signature"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250212_232657_124008_BF31440C 
X-CRM114-Status: GOOD (  25.79  )
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

--=-=-=
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Song Liu <song@kernel.org> writes:

> On Wed, Feb 12, 2025 at 4:10=E2=80=AFPM Indu Bhagat <indu.bhagat@oracle.c=
om> wrote:
>>
>> On 2/12/25 3:32 PM, Song Liu wrote:
>> > I run some tests with this set and my RFC set [1]. Most of
>> > the test is done with kpatch-build. I tested both Puranjay's
>> > version [3] and my version [4].
>> >
>> > For gcc 14.2.1, I have seen the following issue with this
>> > test [2]. This happens with both upstream and 6.13.2.
>> > The livepatch loaded fine, but the system spilled out the
>> > following warning quickly.
>> >
>>
>> In presence of the issue
>> https://sourceware.org/bugzilla/show_bug.cgi?id=3D32666, I'd expect bad
>> data in SFrame section.  Which may be causing this symptom?
>>
>> To be clear, the issue affects loaded kernel modules.  I cannot tell for
>> certain - is there module loading involved in your test ?
>
> The KLP is a module, I guess that is also affected?
>
> During kpatch-build, we added some logic to drop the .sframe section.
> I guess this is wrong, as we need the .sframe section when we apply
> the next KLP. However, I don't think the issue is caused by missing
> .sframe section.

Hi, I did the same testing and did not get the Warning.

I am testing on the 6.12.11 kernel with GCC 11.4.1.

Just to verify, the patch we are testing is:

=2D-- >8 ---

diff -Nupr src.orig/kernel/fork.c src/kernel/fork.c
=2D-- src.orig/kernel/fork.c      2023-01-12 11:20:05.408700033 -0500
+++ src/kernel/fork.c   2023-01-12 11:21:19.186137466 -0500
@@ -1700,10 +1700,18 @@ static void posix_cpu_timers_init_group(
        posix_cputimers_group_init(pct, cpu_limit);
 }

+void kpatch_foo(void)
+{
+       if (!jiffies)
+               printk("kpatch copy signal\n");
+}
+
 static int copy_signal(unsigned long clone_flags, struct task_struct *tsk)
 {
        struct signal_struct *sig;

+       kpatch_foo();
+
        if (clone_flags & CLONE_THREAD)
                return 0;
=2D-- 8< ---

P.S. - I have a downstream patch for create-diff-object to generate .sframe=
 sections for
livepatch module, will add it to the PR after some cleanups.

Thanks,
Puranjay

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iIoEARYKADIWIQQ3wHGvVs/5bdl78BKwwPkjG3B2nQUCZ62esRQccHVyYW5qYXlA
a2VybmVsLm9yZwAKCRCwwPkjG3B2nX0gAP9n3xA9wW2ZSrjqoyai0Z+h7Z03vgV0
y4f2blTpucfZtQEA7lPQavqv8zaPQ1pd3nsRfki49/OkrgrXQxoA1aAalAY=
=crNj
-----END PGP SIGNATURE-----
--=-=-=--

