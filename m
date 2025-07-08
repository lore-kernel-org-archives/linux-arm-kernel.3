Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A290EC83F09
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Jul 2025 21:13:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:MIME-Version:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=WIAuhguJbjbIbOUTc3BpFRhCievia3W8jmk4iJLHgNI=; b=Ya75Mzg6U5KflVegGl0C0ZUxkP
	gOsJLC1OMcZ6rFwCkwd1c/lVlaQuVC4zPkEe94l79D/gaigWY59qoneCLT9hoyf6mdS2zjCGuoXc4
	h9LpnmJ4KEEX9VBtAgpgkKv2lX6SFlJzt7ZjUg5pzJ8u0PnSnldyBvmHvuq9EVYpZEwqVGN9rOl/P
	4i+6q5hntHPx0UPrh0iyWrxGkVMIoa3MozoENs0XODTgFyuZv7Y09keno/NSjjl2GxnyDMT9iNIYr
	CGor/v+DTPhYSVzXd3+uJ3b9kfeaYQow/Es/g+lpe4B7nUvqtf+XG2aqmGmSnGvG9Kt82jCnAnEV9
	YtHNTReg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZFcq-00000006cNc-2yY2;
	Tue, 08 Jul 2025 21:13:16 +0000
Received: from mail-lf1-x133.google.com ([2a00:1450:4864:20::133])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZEFO-00000006PiD-2Cqd
	for linux-arm-kernel@lists.infradead.org;
	Tue, 08 Jul 2025 19:45:00 +0000
Received: by mail-lf1-x133.google.com with SMTP id 2adb3069b0e04-553be4d2fbfso5254211e87.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 08 Jul 2025 12:44:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=wetterwald-eu.20230601.gappssmtp.com; s=20230601; t=1752003895; x=1752608695; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=WIAuhguJbjbIbOUTc3BpFRhCievia3W8jmk4iJLHgNI=;
        b=q/ltPiYZPTT7ziz30YITcjAsLXnIW1xgFO+4MUTNv4JMf9i7aRVGbZkkuMe0WxgsSZ
         CLtzTFVyAyhblGhHuqBIHgu9ujGvGburZpLE0MITkhn7O+sqDnJh+9//Oco3mZs4Mrsz
         jTVsTsDYF6RMrOyiCal1w5qIJbC58rTd+l/NuXcWyxhQr5cOQd/ehjU/OnV7wdkbGzEE
         woz6u9+LAhRrS7+FpgCJhU1o8H1UbgvReoAvj/GZ7uoLU+i7u+cXITu7FIY79GDSjD5A
         z8fLrZbxmRchMabjIsJcaJKsl6/xgUu7kiud4gARh9Iq07wv9UFVgdllKeNbWvppCBvW
         HUnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752003895; x=1752608695;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WIAuhguJbjbIbOUTc3BpFRhCievia3W8jmk4iJLHgNI=;
        b=MsZxFtznzGeQb7r5KWKkFzXdrTi7buPZ07wbNoIt6otRInQSOdl7kRwGr3Goh37mVs
         0FWycD4dSdDL+k/fVCuO0I0ve6GNTByb3DYuRL7qOA26m4fpDNr3vljqsO7Niot9xK8U
         hQ1gOUcW/RREPq1MLPnpI+USRkoktzdUw3cS7I4D5vzIBdUg7utpuXXPgDEfNsgk/g0e
         h0OZ4MZPC1nJ1c7BsuEGh4gSFTX7igPVouhw7rrbyAdulZJ0XgFOunwSPeGndqJrUGHl
         +ax5M7oWNVi2ziUoB9C9cJvm5GY6PDuc01Z80yei6ud293spzqFPdsSuugNehk/G0ny5
         FeBw==
X-Gm-Message-State: AOJu0YyYGmkMu2SXNiD3MQQVpPRLx+HZkQc3sOzLh7XUblmp1qM0sMvu
	7GHfdVgY0YYo/Lv+vHf9gcRf9fEovyXegWiSbq1bKNoTUtAjYtL+Mpy9K5V/VwN5x0B+wHeFZQP
	wH2M2SX2uRlbRG1wkqeAYnIQjhYObB0lLX8jaHa5lCw==
X-Gm-Gg: ASbGncutlgTS5Hrs9ccCEtrY2/pzD14hL1ka4xmfTLeXhu14m+lWilJlIx++RAqNuUv
	s0pQj88ZB1CTY6JP/kxrXgnN3b/uE2iIkrZrs47cW0m+8f+EoEIrxeQKJOcWOynQUOz1Jshwiye
	VcCVO5maqFDCg170ZtNPh6OR9CVIJE9CDmX/qGrtORzhn/AcwtJAUrY9EUWElcnfI7d+HbTb5iZ
	gk=
X-Google-Smtp-Source: AGHT+IH/OYi1zhVRzbLWoXiGDXL/pwIwshawu+yWzAP5+4Np+28rT/YVvWgXf9ePBLccE4OypTRTipSLI44R0xQmhvU=
X-Received: by 2002:a05:6512:31cf:b0:553:246f:d5cb with SMTP id
 2adb3069b0e04-557aa964099mr5151783e87.40.1752003895281; Tue, 08 Jul 2025
 12:44:55 -0700 (PDT)
MIME-Version: 1.0
From: Martin Wetterwald <martin@wetterwald.eu>
Date: Tue, 8 Jul 2025 21:44:44 +0200
X-Gm-Features: Ac12FXwxStEw7-ASRfno3Jq6d5Qa6fuSc5X61ioxY7IDp_eLCz6XHk1FLyE_E4I
Message-ID: <CAFERDQ0zPoya5ZQfpbeuKVZEo_fKsonLf6tJbp32QnSGAtbi+Q@mail.gmail.com>
Subject: Linux linking stage broken on ARM with binutils 2.33.1 (BFD)
To: linus.walleij@linaro.org, Nathan Chancellor <nathan@kernel.org>, linux@armlinux.org.uk
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250708_124458_716212_03627836 
X-CRM114-Status: GOOD (  16.73  )
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

Hello,

When I upgraded from 6.12.22 to 6.12.23 (without changing anything else), t=
he
linking stage of vmlinux broke (arch ARM).

> /home/.../linux-6.12.23/scripts/link-vmlinux.sh: line 49: 136961 Segmenta=
tion fault      (core dumped) ${ld} ${ldflags} -o ${output} ${wl}--whole-ar=
chive ${objs} ${wl}--no-whole-archive ${wl}--start-group ${libs} ${wl}--end=
-group ${kallsymso} ${btf_vmlinux_bin_o} ${ldlibs}
> make[2]: *** [/home/.../linux-6.12.23/scripts/Makefile.vmlinux:34: vmlinu=
x] Error 139
> make[1]: *** [/home/.../linux-6.12.23/Makefile:1179: vmlinux] Error 2
> make: *** [/home/.../linux-6.12.23/Makefile:224: __sub-make] Error 2

This patch seems related:

> commit 59fc42318305cb38efb4f5565408150419be8451
> Author: Nathan Chancellor <nathan@kernel.org>
> Date:   Thu Mar 20 22:33:49 2025 +0100
>
>     ARM: 9443/1: Require linker to support KEEP within OVERLAY for DCE
>
>     commit e7607f7d6d81af71dcc5171278aadccc94d277cd upstream.
>
>     ld.lld prior to 21.0.0 does not support using the KEEP keyword within=
 an
>     overlay description, which may be needed to avoid discarding necessar=
y
>     sections within an overlay with '--gc-sections', which can be enabled
>     for the kernel via CONFIG_LD_DEAD_CODE_DATA_ELIMINATION.
>
>     Disallow CONFIG_LD_DEAD_CODE_DATA_ELIMINATION without support for KEE=
P
>     within OVERLAY and introduce a macro, OVERLAY_KEEP, that can be used =
to
>     conditionally add KEEP when it is properly supported to avoid breakin=
g
>     old versions of ld.lld.
>
>     Cc: stable@vger.kernel.org
>     Link: https://github.com/llvm/llvm-project/commit/381599f1fe973afad30=
94e55ec99b1620dba7d8c
>     Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
>     Signed-off-by: Nathan Chancellor <nathan@kernel.org>
>     Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
>     [nathan: Fix conflict in init/Kconfig due to lack of RUSTC symbols]
>     Signed-off-by: Nathan Chancellor <nathan@kernel.org>
>     Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

I'm using BFD linker from GNU binutils 2.33.1 (built using musl-cross-make =
with
musl 1.2.5 and GCC 14).

> scripts/ld-version.sh /tmp/arm-linux-musleabihf-ld
> BFD 23301

I don't know if it was the intention of the patch, but it is not only chang=
ing
a behavior for LLD, but also for BFD:
- Before the patch, ld BFD 2.33.1 was not selecting
  HAVE_LD_DEAD_CODE_DATA_ELIMINATION, and my build worked.
- After the patch, ld BFD 2.33.1 is activating
  HAVE_LD_DEAD_CODE_DATA_ELIMINATION, and it is segfaulting.
Shouldn't we keep the previous behavior and only select this option when BF=
D is
>=3D 2.36.0 (and not just when we have a BFD linker) ?

The issue is the interaction between LD_CAN_USE_KEEP_IN_OVERLAY and
HAVE_LD_DEAD_CODE_DATA_ELIMINATION.

Nathan, I've seen your proposal here: https://lkml.org/lkml/2025/7/5/431.
I confirm it also fixes the issue on my side. Should I propose the patch?

Thanks!
Martin

