Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3ACEFEA4E09
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Mar 2026 15:00:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=q4zMSb5qjz8F6nv112ZBCKDpbCTjBKJ4SvU05iEczrk=; b=xTZytIAPRK1vrmNxzWBS/be0I0
	T3R38juvL8tRyMvGROh8gYygnZZWYc03ylEYWlqlpxCP2WokcEjsRcWOFwUaYh+ne5dki/a/x6Ovs
	hqfVd1kJB/2bFI0TmDyZh7Kkl4W4r88HqiZKRvHoCuvW0Mfc8yBNMxQJPEOmsUJcmikKh+SBmanHI
	cwi51B19jgqcFz+r2GyVLjk/dZ2EveYD14+VJGHUBzsaFCW04+ue8HERUZvF1bIWbfSoT8FZwdliP
	aHKUIUKYqBc2LBV5132e4gKc+S3Gjf9d7ELUUbVp5W9pT3mmSNdpIlh6PatClwQOagt0Tz5F8DQxh
	KsQV4GXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vx4lC-0000000DHzd-2HIE;
	Mon, 02 Mar 2026 15:00:38 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vx4lB-0000000DHyb-3ZJ4;
	Mon, 02 Mar 2026 15:00:38 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id ABF6860008;
	Mon,  2 Mar 2026 15:00:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AA09CC19423;
	Mon,  2 Mar 2026 15:00:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772463636;
	bh=/dXsG+Gxy5JBRVKTXL1t4+H7LplNFkPtMtazuyb9Z4c=;
	h=Date:Subject:To:References:From:In-Reply-To:From;
	b=t/XuPEjcr8X3uOYACZYvZgA4b7BKLVsffoI8URupZIUL6wLyHfy6eTrtyHXwVZZ0Q
	 udDxWmHLcZp8fTMKZfUDeE4Abyqh2gq+CLhN6251JXI52CsOe6TRIeK0ndgpOmJmok
	 Lvbs6IIeFWInCAK61GWP+T8Fpwh05W9L17QFZr3Hv2B5XQCYfFoFjgn5MBEMErSCXY
	 s1h7gHcYeanRH4K9WSyuHv7d2ZTdsE2Js2YEiB2tJ3IiIej1cyMOYeOddVucVmUC5p
	 M9sFcDuHaLau+k1KYKqoYeWPxp2cTakZI1/KYUEcutf2V23P0pV6hejtdZi6mgi3I4
	 WtpYhZ2wOqJuQ==
Message-ID: <e54368a9-9118-476d-b999-bcd60847f0ce@kernel.org>
Date: Mon, 2 Mar 2026 16:00:26 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/5] uaccess: Disable -Wshadow in
 __scoped_user_access()
To: david.laight.linux@gmail.com, Alexander Viro <viro@zeniv.linux.org.uk>,
 Andre Almeida <andrealmeid@igalia.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Christian Brauner <brauner@kernel.org>, Darren Hart <dvhart@infradead.org>,
 Davidlohr Bueso <dave@stgolabs.net>, Heiko Carstens <hca@linux.ibm.com>,
 Jan Kara <jack@suse.cz>, Julia Lawall <Julia.Lawall@inria.fr>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 linux-arm-kernel@lists.infradead.org, linux-fsdevel@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org,
 linux-s390@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>,
 Madhavan Srinivasan <maddy@linux.ibm.com>,
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>,
 Nicolas Palix <nicolas.palix@imag.fr>, Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <pjw@kernel.org>, Peter Zijlstra <peterz@infradead.org>,
 Russell King <linux@armlinux.org.uk>, Sven Schnelle <svens@linux.ibm.com>,
 Thomas Gleixner <tglx@linutronix.de>, x86@kernel.org,
 Kees Cook <kees@kernel.org>, akpm@linux-foundation.org
References: <20260302132755.1475451-1-david.laight.linux@gmail.com>
 <20260302132755.1475451-5-david.laight.linux@gmail.com>
Content-Language: fr-FR
From: "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>
In-Reply-To: <20260302132755.1475451-5-david.laight.linux@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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



Le 02/03/2026 à 14:27, david.laight.linux@gmail.com a écrit :
> From: David Laight <david.laight.linux@gmail.com>
> 
> -Wshadow is enabled by W=2 builds and __scoped_user_access() quite
> deliberately creates a 'const' shadow of the 'user' address that
> references a 'guard page' when the application passes a kernel pointer.
> 
> Signed-off-by: David Laight <david.laight.linux@gmail.com>

There is a problem with this patch:

   DESCEND objtool
   INSTALL libsubcmd_headers
   CALL    scripts/checksyscalls.sh
   CC      kernel/futex/core.o
In file included from ./include/asm-generic/div64.h:27,
                  from ./arch/powerpc/include/generated/asm/div64.h:1,
                  from ./include/linux/math.h:6,
                  from ./include/linux/math64.h:6,
                  from ./include/linux/time.h:6,
                  from ./include/linux/compat.h:10,
                  from kernel/futex/core.c:34:
kernel/futex/futex.h: In function 'futex_get_value_locked':
./include/linux/uaccess.h:740:20: warning: unused variable '_tmpptr' 
[-Wunused-variable]
   740 |         with (auto _tmpptr = __scoped_user_access_begin(mode, 
uptr, size, elbl))        \
       |                    ^~~~~~~
./include/linux/compiler.h:396:14: note: in definition of macro 'and_with'
   396 |         for (declaration; !_with_done; _with_done = true)
       |              ^~~~~~~~~~~
./include/linux/uaccess.h:740:9: note: in expansion of macro 'with'
   740 |         with (auto _tmpptr = __scoped_user_access_begin(mode, 
uptr, size, elbl))        \
       |         ^~~~
./include/linux/uaccess.h:755:9: note: in expansion of macro 
'__scoped_user_access'
   755 |         __scoped_user_access(read, usrc, size, elbl)
       |         ^~~~~~~~~~~~~~~~~~~~
./include/linux/uaccess.h:767:9: note: in expansion of macro 
'scoped_user_read_access_size'
   767 |         scoped_user_read_access_size(usrc, sizeof(*(usrc)), elbl)
       |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
./include/linux/uaccess.h:831:9: note: in expansion of macro 
'scoped_user_read_access'
   831 |         scoped_user_read_access(_tmpsrc, efault)                \
       |         ^~~~~~~~~~~~~~~~~~~~~~~
kernel/futex/futex.h:288:16: note: in expansion of macro 'get_user_inline'
   288 |         return get_user_inline(*dest, from);
       |                ^~~~~~~~~~~~~~~
./include/linux/compiler.h:396:9: warning: this 'for' clause does not 
guard... [-Wmisleading-indentation]
   396 |         for (declaration; !_with_done; _with_done = true)
       |         ^~~
./include/linux/compiler.h:394:17: note: in expansion of macro 'and_with'
   394 |                 and_with (declaration)
       |                 ^~~~~~~~
./include/linux/uaccess.h:740:9: note: in expansion of macro 'with'
   740 |         with (auto _tmpptr = __scoped_user_access_begin(mode, 
uptr, size, elbl))        \
       |         ^~~~
./include/linux/uaccess.h:755:9: note: in expansion of macro 
'__scoped_user_access'
   755 |         __scoped_user_access(read, usrc, size, elbl)
       |         ^~~~~~~~~~~~~~~~~~~~
./include/linux/uaccess.h:767:9: note: in expansion of macro 
'scoped_user_read_access_size'
   767 |         scoped_user_read_access_size(usrc, sizeof(*(usrc)), elbl)
       |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
./include/linux/uaccess.h:831:9: note: in expansion of macro 
'scoped_user_read_access'
   831 |         scoped_user_read_access(_tmpsrc, efault)                \
       |         ^~~~~~~~~~~~~~~~~~~~~~~
kernel/futex/futex.h:288:16: note: in expansion of macro 'get_user_inline'
   288 |         return get_user_inline(*dest, from);
       |                ^~~~~~~~~~~~~~~
In file included from ././include/linux/compiler_types.h:173,
                  from <command-line>:
./include/linux/compiler-gcc.h:118:33: note: ...this statement, but the 
latter is misleadingly indented as if it were guarded by the 'for'
   118 | #define __diag(s)               _Pragma(__diag_str(GCC 
diagnostic s))
       |                                 ^~~~~~~
./include/linux/compiler-gcc.h:129:9: note: in expansion of macro '__diag'
   129 |         __diag(__diag_GCC_ignore option)
       |         ^~~~~~
./include/linux/uaccess.h:742:31: note: in expansion of macro 
'__diag_ignore_all'
   742 |                 __diag_push() __diag_ignore_all("-Wshadow", 
"uptr is readonly copy")    \
       |                               ^~~~~~~~~~~~~~~~~
./include/linux/uaccess.h:755:9: note: in expansion of macro 
'__scoped_user_access'
   755 |         __scoped_user_access(read, usrc, size, elbl)
       |         ^~~~~~~~~~~~~~~~~~~~
./include/linux/uaccess.h:767:9: note: in expansion of macro 
'scoped_user_read_access_size'
   767 |         scoped_user_read_access_size(usrc, sizeof(*(usrc)), elbl)
       |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
./include/linux/uaccess.h:831:9: note: in expansion of macro 
'scoped_user_read_access'
   831 |         scoped_user_read_access(_tmpsrc, efault)                \
       |         ^~~~~~~~~~~~~~~~~~~~~~~
kernel/futex/futex.h:288:16: note: in expansion of macro 'get_user_inline'
   288 |         return get_user_inline(*dest, from);
       |                ^~~~~~~~~~~~~~~
In file included from ./include/asm-generic/div64.h:27,
                  from ./arch/powerpc/include/generated/asm/div64.h:1,
                  from ./include/linux/math.h:6,
                  from ./include/linux/math64.h:6,
                  from ./include/linux/time.h:6,
                  from ./include/linux/compat.h:10,
                  from kernel/futex/core.c:34:
./include/linux/uaccess.h:743:90: error: '_tmpptr' undeclared (first use 
in this function)
   743 |                 and_with (const auto uptr 
__cleanup(__scoped_user_##mode##_access_end) = _tmpptr) \
       | 
                          ^~~~~~~
./include/linux/compiler.h:396:14: note: in definition of macro 'and_with'
   396 |         for (declaration; !_with_done; _with_done = true)
       |              ^~~~~~~~~~~
./include/linux/uaccess.h:755:9: note: in expansion of macro 
'__scoped_user_access'
   755 |         __scoped_user_access(read, usrc, size, elbl)
       |         ^~~~~~~~~~~~~~~~~~~~
./include/linux/uaccess.h:767:9: note: in expansion of macro 
'scoped_user_read_access_size'
   767 |         scoped_user_read_access_size(usrc, sizeof(*(usrc)), elbl)
       |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
./include/linux/uaccess.h:831:9: note: in expansion of macro 
'scoped_user_read_access'
   831 |         scoped_user_read_access(_tmpsrc, efault)                \
       |         ^~~~~~~~~~~~~~~~~~~~~~~
kernel/futex/futex.h:288:16: note: in expansion of macro 'get_user_inline'
   288 |         return get_user_inline(*dest, from);
       |                ^~~~~~~~~~~~~~~
./include/linux/uaccess.h:743:90: note: each undeclared identifier is 
reported only once for each function it appears in
   743 |                 and_with (const auto uptr 
__cleanup(__scoped_user_##mode##_access_end) = _tmpptr) \
       | 
                          ^~~~~~~
./include/linux/compiler.h:396:14: note: in definition of macro 'and_with'
   396 |         for (declaration; !_with_done; _with_done = true)
       |              ^~~~~~~~~~~
./include/linux/uaccess.h:755:9: note: in expansion of macro 
'__scoped_user_access'
   755 |         __scoped_user_access(read, usrc, size, elbl)
       |         ^~~~~~~~~~~~~~~~~~~~
./include/linux/uaccess.h:767:9: note: in expansion of macro 
'scoped_user_read_access_size'
   767 |         scoped_user_read_access_size(usrc, sizeof(*(usrc)), elbl)
       |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
./include/linux/uaccess.h:831:9: note: in expansion of macro 
'scoped_user_read_access'
   831 |         scoped_user_read_access(_tmpsrc, efault)                \
       |         ^~~~~~~~~~~~~~~~~~~~~~~
kernel/futex/futex.h:288:16: note: in expansion of macro 'get_user_inline'
   288 |         return get_user_inline(*dest, from);
       |                ^~~~~~~~~~~~~~~
./include/linux/compiler.h:396:28: error: '_with_done' undeclared (first 
use in this function)
   396 |         for (declaration; !_with_done; _with_done = true)
       |                            ^~~~~~~~~~
./include/linux/uaccess.h:743:17: note: in expansion of macro 'and_with'
   743 |                 and_with (const auto uptr 
__cleanup(__scoped_user_##mode##_access_end) = _tmpptr) \
       |                 ^~~~~~~~
./include/linux/uaccess.h:755:9: note: in expansion of macro 
'__scoped_user_access'
   755 |         __scoped_user_access(read, usrc, size, elbl)
       |         ^~~~~~~~~~~~~~~~~~~~
./include/linux/uaccess.h:767:9: note: in expansion of macro 
'scoped_user_read_access_size'
   767 |         scoped_user_read_access_size(usrc, sizeof(*(usrc)), elbl)
       |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
./include/linux/uaccess.h:831:9: note: in expansion of macro 
'scoped_user_read_access'
   831 |         scoped_user_read_access(_tmpsrc, efault)                \
       |         ^~~~~~~~~~~~~~~~~~~~~~~
kernel/futex/futex.h:288:16: note: in expansion of macro 'get_user_inline'
   288 |         return get_user_inline(*dest, from);
       |                ^~~~~~~~~~~~~~~
kernel/futex/core.c: In function 'get_futex_key':
./include/linux/uaccess.h:740:20: warning: unused variable '_tmpptr' 
[-Wunused-variable]
   740 |         with (auto _tmpptr = __scoped_user_access_begin(mode, 
uptr, size, elbl))        \
       |                    ^~~~~~~
./include/linux/compiler.h:396:14: note: in definition of macro 'and_with'
   396 |         for (declaration; !_with_done; _with_done = true)
       |              ^~~~~~~~~~~
./include/linux/uaccess.h:740:9: note: in expansion of macro 'with'
   740 |         with (auto _tmpptr = __scoped_user_access_begin(mode, 
uptr, size, elbl))        \
       |         ^~~~
./include/linux/uaccess.h:755:9: note: in expansion of macro 
'__scoped_user_access'
   755 |         __scoped_user_access(read, usrc, size, elbl)
       |         ^~~~~~~~~~~~~~~~~~~~
./include/linux/uaccess.h:767:9: note: in expansion of macro 
'scoped_user_read_access_size'
   767 |         scoped_user_read_access_size(usrc, sizeof(*(usrc)), elbl)
       |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
./include/linux/uaccess.h:831:9: note: in expansion of macro 
'scoped_user_read_access'
   831 |         scoped_user_read_access(_tmpsrc, efault)                \
       |         ^~~~~~~~~~~~~~~~~~~~~~~
kernel/futex/core.c:584:21: note: in expansion of macro 'get_user_inline'
   584 |                 if (get_user_inline(node, naddr))
       |                     ^~~~~~~~~~~~~~~
./include/linux/compiler.h:396:9: warning: this 'for' clause does not 
guard... [-Wmisleading-indentation]
   396 |         for (declaration; !_with_done; _with_done = true)
       |         ^~~
./include/linux/compiler.h:394:17: note: in expansion of macro 'and_with'
   394 |                 and_with (declaration)
       |                 ^~~~~~~~
./include/linux/uaccess.h:740:9: note: in expansion of macro 'with'
   740 |         with (auto _tmpptr = __scoped_user_access_begin(mode, 
uptr, size, elbl))        \
       |         ^~~~
./include/linux/uaccess.h:755:9: note: in expansion of macro 
'__scoped_user_access'
   755 |         __scoped_user_access(read, usrc, size, elbl)
       |         ^~~~~~~~~~~~~~~~~~~~
./include/linux/uaccess.h:767:9: note: in expansion of macro 
'scoped_user_read_access_size'
   767 |         scoped_user_read_access_size(usrc, sizeof(*(usrc)), elbl)
       |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
./include/linux/uaccess.h:831:9: note: in expansion of macro 
'scoped_user_read_access'
   831 |         scoped_user_read_access(_tmpsrc, efault)                \
       |         ^~~~~~~~~~~~~~~~~~~~~~~
kernel/futex/core.c:584:21: note: in expansion of macro 'get_user_inline'
   584 |                 if (get_user_inline(node, naddr))
       |                     ^~~~~~~~~~~~~~~
In file included from ././include/linux/compiler_types.h:173,
                  from <command-line>:
./include/linux/compiler-gcc.h:118:33: note: ...this statement, but the 
latter is misleadingly indented as if it were guarded by the 'for'
   118 | #define __diag(s)               _Pragma(__diag_str(GCC 
diagnostic s))
       |                                 ^~~~~~~
./include/linux/compiler-gcc.h:129:9: note: in expansion of macro '__diag'
   129 |         __diag(__diag_GCC_ignore option)
       |         ^~~~~~
./include/linux/uaccess.h:742:31: note: in expansion of macro 
'__diag_ignore_all'
   742 |                 __diag_push() __diag_ignore_all("-Wshadow", 
"uptr is readonly copy")    \
       |                               ^~~~~~~~~~~~~~~~~
./include/linux/uaccess.h:755:9: note: in expansion of macro 
'__scoped_user_access'
   755 |         __scoped_user_access(read, usrc, size, elbl)
       |         ^~~~~~~~~~~~~~~~~~~~
./include/linux/uaccess.h:767:9: note: in expansion of macro 
'scoped_user_read_access_size'
   767 |         scoped_user_read_access_size(usrc, sizeof(*(usrc)), elbl)
       |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
./include/linux/uaccess.h:831:9: note: in expansion of macro 
'scoped_user_read_access'
   831 |         scoped_user_read_access(_tmpsrc, efault)                \
       |         ^~~~~~~~~~~~~~~~~~~~~~~
kernel/futex/core.c:584:21: note: in expansion of macro 'get_user_inline'
   584 |                 if (get_user_inline(node, naddr))
       |                     ^~~~~~~~~~~~~~~
In file included from ./include/asm-generic/div64.h:27,
                  from ./arch/powerpc/include/generated/asm/div64.h:1,
                  from ./include/linux/math.h:6,
                  from ./include/linux/math64.h:6,
                  from ./include/linux/time.h:6,
                  from ./include/linux/compat.h:10,
                  from kernel/futex/core.c:34:
./include/linux/uaccess.h:743:90: error: '_tmpptr' undeclared (first use 
in this function)
   743 |                 and_with (const auto uptr 
__cleanup(__scoped_user_##mode##_access_end) = _tmpptr) \
       | 
                          ^~~~~~~
./include/linux/compiler.h:396:14: note: in definition of macro 'and_with'
   396 |         for (declaration; !_with_done; _with_done = true)
       |              ^~~~~~~~~~~
./include/linux/uaccess.h:755:9: note: in expansion of macro 
'__scoped_user_access'
   755 |         __scoped_user_access(read, usrc, size, elbl)
       |         ^~~~~~~~~~~~~~~~~~~~
./include/linux/uaccess.h:767:9: note: in expansion of macro 
'scoped_user_read_access_size'
   767 |         scoped_user_read_access_size(usrc, sizeof(*(usrc)), elbl)
       |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
./include/linux/uaccess.h:831:9: note: in expansion of macro 
'scoped_user_read_access'
   831 |         scoped_user_read_access(_tmpsrc, efault)                \
       |         ^~~~~~~~~~~~~~~~~~~~~~~
kernel/futex/core.c:584:21: note: in expansion of macro 'get_user_inline'
   584 |                 if (get_user_inline(node, naddr))
       |                     ^~~~~~~~~~~~~~~
./include/linux/compiler.h:396:28: error: '_with_done' undeclared (first 
use in this function)
   396 |         for (declaration; !_with_done; _with_done = true)
       |                            ^~~~~~~~~~
./include/linux/uaccess.h:743:17: note: in expansion of macro 'and_with'
   743 |                 and_with (const auto uptr 
__cleanup(__scoped_user_##mode##_access_end) = _tmpptr) \
       |                 ^~~~~~~~
./include/linux/uaccess.h:755:9: note: in expansion of macro 
'__scoped_user_access'
   755 |         __scoped_user_access(read, usrc, size, elbl)
       |         ^~~~~~~~~~~~~~~~~~~~
./include/linux/uaccess.h:767:9: note: in expansion of macro 
'scoped_user_read_access_size'
   767 |         scoped_user_read_access_size(usrc, sizeof(*(usrc)), elbl)
       |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
./include/linux/uaccess.h:831:9: note: in expansion of macro 
'scoped_user_read_access'
   831 |         scoped_user_read_access(_tmpsrc, efault)                \
       |         ^~~~~~~~~~~~~~~~~~~~~~~
kernel/futex/core.c:584:21: note: in expansion of macro 'get_user_inline'
   584 |                 if (get_user_inline(node, naddr))
       |                     ^~~~~~~~~~~~~~~
./include/linux/uaccess.h:740:20: warning: unused variable '_tmpptr' 
[-Wunused-variable]
   740 |         with (auto _tmpptr = __scoped_user_access_begin(mode, 
uptr, size, elbl))        \
       |                    ^~~~~~~
./include/linux/compiler.h:396:14: note: in definition of macro 'and_with'
   396 |         for (declaration; !_with_done; _with_done = true)
       |              ^~~~~~~~~~~
./include/linux/uaccess.h:740:9: note: in expansion of macro 'with'
   740 |         with (auto _tmpptr = __scoped_user_access_begin(mode, 
uptr, size, elbl))        \
       |         ^~~~
./include/linux/uaccess.h:778:9: note: in expansion of macro 
'__scoped_user_access'
   778 |         __scoped_user_access(write, udst, size, elbl)
       |         ^~~~~~~~~~~~~~~~~~~~
./include/linux/uaccess.h:790:9: note: in expansion of macro 
'scoped_user_write_access_size'
   790 |         scoped_user_write_access_size(udst, sizeof(*(udst)), elbl)
       |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
./include/linux/uaccess.h:856:9: note: in expansion of macro 
'scoped_user_write_access'
   856 |         scoped_user_write_access(_tmpdst, efault)               \
       |         ^~~~~~~~~~~~~~~~~~~~~~~~
kernel/futex/core.c:604:37: note: in expansion of macro 'put_user_inline'
   604 |                 if (node_updated && put_user_inline(node, naddr))
       |                                     ^~~~~~~~~~~~~~~
./include/linux/compiler.h:396:9: warning: this 'for' clause does not 
guard... [-Wmisleading-indentation]
   396 |         for (declaration; !_with_done; _with_done = true)
       |         ^~~
./include/linux/compiler.h:394:17: note: in expansion of macro 'and_with'
   394 |                 and_with (declaration)
       |                 ^~~~~~~~
./include/linux/uaccess.h:740:9: note: in expansion of macro 'with'
   740 |         with (auto _tmpptr = __scoped_user_access_begin(mode, 
uptr, size, elbl))        \
       |         ^~~~
./include/linux/uaccess.h:778:9: note: in expansion of macro 
'__scoped_user_access'
   778 |         __scoped_user_access(write, udst, size, elbl)
       |         ^~~~~~~~~~~~~~~~~~~~
./include/linux/uaccess.h:790:9: note: in expansion of macro 
'scoped_user_write_access_size'
   790 |         scoped_user_write_access_size(udst, sizeof(*(udst)), elbl)
       |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
./include/linux/uaccess.h:856:9: note: in expansion of macro 
'scoped_user_write_access'
   856 |         scoped_user_write_access(_tmpdst, efault)               \
       |         ^~~~~~~~~~~~~~~~~~~~~~~~
kernel/futex/core.c:604:37: note: in expansion of macro 'put_user_inline'
   604 |                 if (node_updated && put_user_inline(node, naddr))
       |                                     ^~~~~~~~~~~~~~~
In file included from ././include/linux/compiler_types.h:173,
                  from <command-line>:
./include/linux/compiler-gcc.h:118:33: note: ...this statement, but the 
latter is misleadingly indented as if it were guarded by the 'for'
   118 | #define __diag(s)               _Pragma(__diag_str(GCC 
diagnostic s))
       |                                 ^~~~~~~
./include/linux/compiler-gcc.h:129:9: note: in expansion of macro '__diag'
   129 |         __diag(__diag_GCC_ignore option)
       |         ^~~~~~
./include/linux/uaccess.h:742:31: note: in expansion of macro 
'__diag_ignore_all'
   742 |                 __diag_push() __diag_ignore_all("-Wshadow", 
"uptr is readonly copy")    \
       |                               ^~~~~~~~~~~~~~~~~
./include/linux/uaccess.h:778:9: note: in expansion of macro 
'__scoped_user_access'
   778 |         __scoped_user_access(write, udst, size, elbl)
       |         ^~~~~~~~~~~~~~~~~~~~
./include/linux/uaccess.h:790:9: note: in expansion of macro 
'scoped_user_write_access_size'
   790 |         scoped_user_write_access_size(udst, sizeof(*(udst)), elbl)
       |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
./include/linux/uaccess.h:856:9: note: in expansion of macro 
'scoped_user_write_access'
   856 |         scoped_user_write_access(_tmpdst, efault)               \
       |         ^~~~~~~~~~~~~~~~~~~~~~~~
kernel/futex/core.c:604:37: note: in expansion of macro 'put_user_inline'
   604 |                 if (node_updated && put_user_inline(node, naddr))
       |                                     ^~~~~~~~~~~~~~~
make[4]: *** [scripts/Makefile.build:289: kernel/futex/core.o] Error 1
make[3]: *** [scripts/Makefile.build:546: kernel/futex] Error 2
make[2]: *** [scripts/Makefile.build:546: kernel] Error 2
make[1]: *** [/home/chleroy/linux-powerpc/Makefile:2101: .] Error 2
make: *** [Makefile:248: __sub-make] Error 2


> ---
>   include/linux/uaccess.h | 4 +++-
>   1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/include/linux/uaccess.h b/include/linux/uaccess.h
> index 64bc2492eb99..445391ec5a6d 100644
> --- a/include/linux/uaccess.h
> +++ b/include/linux/uaccess.h
> @@ -739,7 +739,9 @@ static __always_inline void __scoped_user_rw_access_end(const void *p)
>   #define __scoped_user_access(mode, uptr, size, elbl)					\
>   	with (auto _tmpptr = __scoped_user_access_begin(mode, uptr, size, elbl))	\
>   		/* Force modified pointer usage within the scope */			\
> -		and_with (const auto uptr __cleanup(__scoped_user_##mode##_access_end) = _tmpptr)
> +		__diag_push() __diag_ignore_all("-Wshadow", "uptr is readonly copy")	\
> +		and_with (const auto uptr __cleanup(__scoped_user_##mode##_access_end) = _tmpptr) \
> +		__diag_pop()
>   
>   /**
>    * scoped_user_read_access_size - Start a scoped user read access with given size


