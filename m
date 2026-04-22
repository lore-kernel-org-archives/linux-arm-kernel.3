Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9DA04F94CB2
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Apr 2026 03:52:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:To:Subject:Message-ID:Date:From:MIME-Version:Reply-To:Cc:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=jOdndvNOr5tk2o0VEu1kSKqEFvkiiCDk4VA7lkVUu3w=; b=tIGava4CLPMe9ycTjmEaycSAJ+
	sE2EuFdyp+3lFmGatMuTlPk5oZftZwPHr92E6XI4pLcgW4lMxd3YsjxYB+TY+wD+/6UeELDp3AUKj
	xIofDpmWBvNJ4mIZKN/tA9o1zpU8+jmLReZYM1Hixy+dyHQOata+gQ42UnbSJxziuETR4XtALucf8
	UHIa7foSY0fFRAnKhFmVVlF+0tmhJUdbo56p1rc+0VBBym6B8+lYuBgn2WmxW9TuSTOR6JQOr+NGQ
	Z9+DVWs4NNhL0cnVJ2pfWfaFLH7X2pEbLvc9wczW4TarkIbX37zZjRotKSvvfqyLfSHMpfeH8b0s2
	O4CfxRtQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFOdA-00000009Yqe-32Ng;
	Wed, 22 Apr 2026 03:52:04 +0000
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFOd8-00000009YqG-0pes
	for linux-arm-kernel@lists.infradead.org;
	Wed, 22 Apr 2026 03:52:03 +0000
Received: by mail-ej1-x635.google.com with SMTP id a640c23a62f3a-ba51e69988aso616649666b.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 21 Apr 2026 20:52:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1776829919; x=1777434719; darn=lists.infradead.org;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=jOdndvNOr5tk2o0VEu1kSKqEFvkiiCDk4VA7lkVUu3w=;
        b=fREAGX2tky/JlxXv1o4rPmOoxmoselw3JGSokIZiqpJBeQ4GBmFLESwprGH+ovjZ42
         x860/a1fNQBl/OiK9Cduiw7TIUCCSEkwj1NFvFWDDJa+TIxcb8jnZcZYK8LieaeKn19u
         E1iQHYrnL/q8BBQyii1Egm585RWsdcp93emeI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776829919; x=1777434719;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jOdndvNOr5tk2o0VEu1kSKqEFvkiiCDk4VA7lkVUu3w=;
        b=moeRdO7bYdq0flWvKy/gQZHz03ohTIV/GJPr9UYDUO8n0dsAJcb+tp7rzqPU8y628a
         Zy4aXz/yCS4p4s1oqBMZiLATIX+2gIsLmRFEF2FE71yK8O3Co5iDXTH3qmfhOniy1XvB
         kQ3nJ54UBZefs7dpzJ1OFiVv2dTfFJsw326bVHo6gebaDwDNsDi+ZCOkLRYrZkAQClfC
         +OKPloX52ixMJQONDBwGivJkDffasTnqSY90QN3TDf97YhCsx9ZtjRipStUZgJSw22N8
         iS54sYZtc7JCaGogZ7lKMPqht5o1BbGWVjX6FytIJjXPlMZJYT0qE1gaqoxsL1smNybW
         VjUg==
X-Forwarded-Encrypted: i=1; AFNElJ/L39QP3CYZ9KV3wERKQgmjVJqY9t8+mtw475tIqyjUytvsSV2MeTYyYLBtUp8m9rkcpuV1DoWobdd+BIuqj+tt@lists.infradead.org
X-Gm-Message-State: AOJu0YzseRPw2bkZ20i99rpXeoFa2dCN6QLc0D8ShzJ8HV6wWM+e5Uz7
	h2I4i3o4DusNafQTE2G3eq7wA5iklxCoNGX9Uk212humkOaTO8aLcUif4E5VqprT7SFlkFxRWC+
	Tzn/pLw==
X-Gm-Gg: AeBDievR/h79+WG/cuXJcOV+gx4gzJDOfI8k2Vf4LI4FGNmEkODeTbRiagxq9MSQVh6
	tlGY04TloRMfJnhDqZqTeJOctzEKegjEERw7If/NtqmdfslLytZaN3tgpXrOyFQtXl0+I60CG9f
	U3jInlw7+lpSyLaUQq+iSek/mpXwlHUbuTY8OR/AybWcBBI8m+EZ1ksRpe2qLazfahz6z68JwZJ
	IE67ibLSUm7LJPc+qCB976fKV+F8yFMcNwNeRfHZF1TZC3a7X9LsZLOMD9p/AdR7UKt5ZZNnDnQ
	wNPKR403OcRzETpg319VW18nhFQTR/ctNXlzUBJo7pNzgrJoxQhYrBvC+Q5tAa2lNdFzteL4w2j
	lVTTCXXWiWHOrQC9hrBoXgP0YOAdQHE98e+1cX4Fh0ey65fu/wru1MhnWQEPG5asSOWhm7wkEz1
	fm4lsqWJybm61PZtQT32F+rDTZ/kQ/jclvojStpD0FIr3DW7TdSjMYPDBUthPh9wgFRO5T2iI=
X-Received: by 2002:a17:907:9413:b0:b97:a1ca:e100 with SMTP id a640c23a62f3a-ba41ac02533mr992299566b.32.1776829919187;
        Tue, 21 Apr 2026 20:51:59 -0700 (PDT)
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com. [209.85.218.50])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ba451be2c9bsm509812666b.23.2026.04.21.20.51.58
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Apr 2026 20:51:58 -0700 (PDT)
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-ba61a0a2d26so527114566b.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 21 Apr 2026 20:51:58 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ8u5LnRgOJbeocCI7VkLpGP9UuUXXj7XAZq1x7vDmmkf5wvyzfAM7pAeLhEo+cxO8xVhUeeu3yZjStmiQgrOfkH@lists.infradead.org
X-Received: by 2002:a17:907:7b9a:b0:ba6:5855:1cc0 with SMTP id
 a640c23a62f3a-ba65855318bmr671250466b.2.1776829917526; Tue, 21 Apr 2026
 20:51:57 -0700 (PDT)
MIME-Version: 1.0
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Wed, 22 Apr 2026 11:51:45 +0800
X-Gmail-Original-Message-ID: <CANiDSCsOy0P1if-gJZqOM5pTJ0RDcwVfru1B7KFbTOEMqjPKJw@mail.gmail.com>
X-Gm-Features: AQROBzAUxpvtmmUfT9SytqZ_vnzE8JQsTm61nRrGtQURGtsgH0JZ_vzze_Uz4hk
Message-ID: <CANiDSCsOy0P1if-gJZqOM5pTJ0RDcwVfru1B7KFbTOEMqjPKJw@mail.gmail.com>
Subject: New warning in linus/master
To: =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>, 
	linux-arm-kernel@lists.infradead.org, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, linuxppc-dev@lists.ozlabs.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260421_205202_425142_BDD44758 
X-CRM114-Status: GOOD (  12.53  )
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

Hi Thomas

Media-CI has found a couple of new warnings in the latest kernel
version for aarch64 and powerpc. They get fixed with this patch and
before moving I wanted to know if this was under your radar.



diff --git a/arch/arm64/kernel/vdso/Makefile b/arch/arm64/kernel/vdso/Makef=
ile
index 7dec05dd33b7..65914842fae0 100644
--- a/arch/arm64/kernel/vdso/Makefile
+++ b/arch/arm64/kernel/vdso/Makefile
@@ -50,7 +50,7 @@ CFLAGS_vgettimeofday.o =3D $(CC_FLAGS_ADD_VDSO)
 CFLAGS_vgetrandom.o =3D $(CC_FLAGS_ADD_VDSO)

 ifneq ($(c-gettimeofday-y),)
-  CFLAGS_vgettimeofday.o +=3D -include $(c-gettimeofday-y)
+  CFLAGS_vgettimeofday.o +=3D -include $(c-gettimeofday-y)
-Wno-maybe-uninitialized
 endif

 ifneq ($(c-getrandom-y),)
diff --git a/arch/powerpc/kernel/vdso/Makefile
b/arch/powerpc/kernel/vdso/Makefile
index 8834dfe9d727..4b8d40b1dfeb 100644
--- a/arch/powerpc/kernel/vdso/Makefile
+++ b/arch/powerpc/kernel/vdso/Makefile
@@ -12,12 +12,12 @@ obj-vdso32 +=3D getrandom-32.o vgetrandom-chacha-32.o
 obj-vdso64 +=3D getrandom-64.o vgetrandom-chacha-64.o

 ifneq ($(c-gettimeofday-y),)
-  CFLAGS_vgettimeofday-32.o +=3D -include $(c-gettimeofday-y)
+  CFLAGS_vgettimeofday-32.o +=3D -include $(c-gettimeofday-y)
-Wno-maybe-uninitialized
 # Go prior to 1.16.x assumes r30 is not clobbered by any VDSO code.
That used to be true
 # by accident when the VDSO was hand-written asm code, but may not be
now that the VDSO is
 # compiler generated. To avoid breaking Go tell GCC not to use r30.
Impact on code
 # generation is minimal, it will just use r29 instead.
-  CFLAGS_vgettimeofday-64.o +=3D -include $(c-gettimeofday-y) $(call
cc-option, -ffixed-r30)
+  CFLAGS_vgettimeofday-64.o +=3D -include $(c-gettimeofday-y) $(call
cc-option, -ffixed-r30) -Wno-maybe-uninitialized
 endif

 ifneq ($(c-getrandom-y),)


https://gitlab.freedesktop.org/linux-media/users/ribalda/-/pipelines/164914=
4/test_report?job_name=3Dcross-gcc


CONFIG_CC_VERSION_TEXT=3D"aarch64-linux-gnu-gcc (Debian 15.2.0-16) 15.2.0"
  SYNC    include/config/auto.conf
  CC      arch/arm64/kernel/vdso/vgettimeofday.o
In file included from <command-line>:
In function =E2=80=98vdso_set_timespec=E2=80=99,
    inlined from =E2=80=98do_aux=E2=80=99 at /workdir/lib/vdso/gettimeofday=
.c:266:2,
    inlined from =E2=80=98__cvdso_clock_gettime_common=E2=80=99 at
/workdir/lib/vdso/gettimeofday.c:293:10,
    inlined from =E2=80=98__cvdso_clock_gettime_data.constprop=E2=80=99 at
/workdir/lib/vdso/gettimeofday.c:306:7:
/workdir/lib/vdso/gettimeofday.c:104:26: warning: =E2=80=98sec=E2=80=99 may=
 be used
uninitialized [-Wmaybe-uninitialized]
  104 |         ts->tv_sec =3D sec + __iter_div_u64_rem(ns, NSEC_PER_SEC, &=
ns);
      |                      ~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~
/workdir/lib/vdso/gettimeofday.c: In function
=E2=80=98__cvdso_clock_gettime_data.constprop=E2=80=99:
/workdir/lib/vdso/gettimeofday.c:242:13: note: =E2=80=98sec=E2=80=99 was de=
clared here
  242 |         u64 sec, ns;
      |             ^~~
In file included from /workdir/lib/vdso/gettimeofday.c:11:
In function =E2=80=98__iter_div_u64_rem=E2=80=99,
    inlined from =E2=80=98vdso_set_timespec=E2=80=99 at /workdir/lib/vdso/g=
ettimeofday.c:104:21,
    inlined from =E2=80=98do_aux=E2=80=99 at /workdir/lib/vdso/gettimeofday=
.c:266:2,
    inlined from =E2=80=98__cvdso_clock_gettime_common=E2=80=99 at
/workdir/lib/vdso/gettimeofday.c:293:10,
    inlined from =E2=80=98__cvdso_clock_gettime_data.constprop=E2=80=99 at
/workdir/lib/vdso/gettimeofday.c:306:7:
./include/vdso/math64.h:10:25: warning: =E2=80=98ns=E2=80=99 may be used un=
initialized
[-Wmaybe-uninitialized]
   10 |         while (dividend >=3D divisor) {
      |                ~~~~~~~~~^~~~~~~~~~
/workdir/lib/vdso/gettimeofday.c: In function
=E2=80=98__cvdso_clock_gettime_data.constprop=E2=80=99:
/workdir/lib/vdso/gettimeofday.c:242:18: note: =E2=80=98ns=E2=80=99 was dec=
lared here
  242 |         u64 sec, ns;
      |                  ^~
  LD      arch/arm64/kernel/vdso/vdso.so.dbg
  VDSOSYM include/generated/vdso-offsets.h
  OBJCOPY arch/arm64/kernel/vdso/vdso.so
/workdir/lib/vdso/gettimeofday.c:104:26: warning: =E2=80=98sec=E2=80=99 may=
 be used
uninitialized [-Wmaybe-uninitialized]
./include/vdso/math64.h:10:25: warning: =E2=80=98ns=E2=80=99 may be used un=
initialized
[-Wmaybe-uninitialized]

CONFIG_CC_VERSION_TEXT=3D"powerpc64-linux-gnu-gcc (Debian 15.2.0-15) 15.2.0=
"
  SYNC    include/config/auto.conf
  VDSO32C arch/powerpc/kernel/vdso/vgettimeofday-32.o
In file included from <command-line>:
In function =E2=80=98vdso_set_timespec=E2=80=99,
    inlined from =E2=80=98do_aux=E2=80=99 at /workdir/lib/vdso/gettimeofday=
.c:266:2,
    inlined from =E2=80=98__cvdso_clock_gettime_common=E2=80=99 at
/workdir/lib/vdso/gettimeofday.c:293:10,
    inlined from =E2=80=98__cvdso_clock_gettime32_data=E2=80=99 at
/workdir/lib/vdso/gettimeofday.c:327:7:
/workdir/lib/vdso/gettimeofday.c:104:26: warning: =E2=80=98sec=E2=80=99 may=
 be used
uninitialized [-Wmaybe-uninitialized]
  104 |         ts->tv_sec =3D sec + __iter_div_u64_rem(ns, NSEC_PER_SEC, &=
ns);
      |                      ~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~
/workdir/lib/vdso/gettimeofday.c: In function =E2=80=98__cvdso_clock_gettim=
e32_data=E2=80=99:
/workdir/lib/vdso/gettimeofday.c:242:13: note: =E2=80=98sec=E2=80=99 was de=
clared here
  242 |         u64 sec, ns;
      |             ^~~
In file included from /workdir/lib/vdso/gettimeofday.c:11:
In function =E2=80=98__iter_div_u64_rem=E2=80=99,
    inlined from =E2=80=98vdso_set_timespec=E2=80=99 at /workdir/lib/vdso/g=
ettimeofday.c:104:21,
    inlined from =E2=80=98do_aux=E2=80=99 at /workdir/lib/vdso/gettimeofday=
.c:266:2,
    inlined from =E2=80=98__cvdso_clock_gettime_common=E2=80=99 at
/workdir/lib/vdso/gettimeofday.c:293:10,
    inlined from =E2=80=98__cvdso_clock_gettime32_data=E2=80=99 at
/workdir/lib/vdso/gettimeofday.c:327:7:
./include/vdso/math64.h:10:25: warning: =E2=80=98ns=E2=80=99 may be used un=
initialized
[-Wmaybe-uninitialized]
   10 |         while (dividend >=3D divisor) {
      |                ~~~~~~~~~^~~~~~~~~~
/workdir/lib/vdso/gettimeofday.c: In function =E2=80=98__cvdso_clock_gettim=
e32_data=E2=80=99:
/workdir/lib/vdso/gettimeofday.c:242:18: note: =E2=80=98ns=E2=80=99 was dec=
lared here
  242 |         u64 sec, ns;
      |                  ^~
In function =E2=80=98vdso_set_timespec=E2=80=99,
    inlined from =E2=80=98do_aux=E2=80=99 at /workdir/lib/vdso/gettimeofday=
.c:266:2,
    inlined from =E2=80=98__cvdso_clock_gettime_common=E2=80=99 at
/workdir/lib/vdso/gettimeofday.c:293:10,
    inlined from =E2=80=98__cvdso_clock_gettime_data=E2=80=99 at
/workdir/lib/vdso/gettimeofday.c:306:7:
/workdir/lib/vdso/gettimeofday.c:104:26: warning: =E2=80=98sec=E2=80=99 may=
 be used
uninitialized [-Wmaybe-uninitialized]
  104 |         ts->tv_sec =3D sec + __iter_div_u64_rem(ns, NSEC_PER_SEC, &=
ns);
      |                      ~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~
/workdir/lib/vdso/gettimeofday.c: In function =E2=80=98__cvdso_clock_gettim=
e_data=E2=80=99:
/workdir/lib/vdso/gettimeofday.c:242:13: note: =E2=80=98sec=E2=80=99 was de=
clared here
  242 |         u64 sec, ns;
      |             ^~~
In function =E2=80=98__iter_div_u64_rem=E2=80=99,
    inlined from =E2=80=98vdso_set_timespec=E2=80=99 at /workdir/lib/vdso/g=
ettimeofday.c:104:21,
    inlined from =E2=80=98do_aux=E2=80=99 at /workdir/lib/vdso/gettimeofday=
.c:266:2,
    inlined from =E2=80=98__cvdso_clock_gettime_common=E2=80=99 at
/workdir/lib/vdso/gettimeofday.c:293:10,
    inlined from =E2=80=98__cvdso_clock_gettime_data=E2=80=99 at
/workdir/lib/vdso/gettimeofday.c:306:7:
./include/vdso/math64.h:10:25: warning: =E2=80=98ns=E2=80=99 may be used un=
initialized
[-Wmaybe-uninitialized]
   10 |         while (dividend >=3D divisor) {
      |                ~~~~~~~~~^~~~~~~~~~
/workdir/lib/vdso/gettimeofday.c: In function =E2=80=98__cvdso_clock_gettim=
e_data=E2=80=99:
/workdir/lib/vdso/gettimeofday.c:242:18: note: =E2=80=98ns=E2=80=99 was dec=
lared here
  242 |         u64 sec, ns;
      |                  ^~
  VDSO32L arch/powerpc/kernel/vdso/vdso32.so.dbg
  VDSO32SYM include/generated/vdso32-offsets.h
  CC      arch/powerpc/kernel/vdso/vgettimeofday-64.o
  VDSO64L arch/powerpc/kernel/vdso/vdso64.so.dbg
  VDSO64SYM include/generated/vdso64-offsets.h
/workdir/lib/vdso/gettimeofday.c:104:26: warning: =E2=80=98sec=E2=80=99 may=
 be used
uninitialized [-Wmaybe-uninitialized]
./include/vdso/math64.h:10:25: warning: =E2=80=98ns=E2=80=99 may be used un=
initialized
[-Wmaybe-uninitialized]
/workdir/lib/vdso/gettimeofday.c:104:26: warning: =E2=80=98sec=E2=80=99 may=
 be used
uninitialized [-Wmaybe-uninitialized]
./include/vdso/math64.h:10:25: warning: =E2=80=98ns=E2=80=99 may be used un=
initialized
[-Wmaybe-uninitialized]

Thanks

--=20
Ricardo Ribalda

