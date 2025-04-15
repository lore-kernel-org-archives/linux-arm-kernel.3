Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A40BC369B4
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Apr 2025 12:37:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Date:Cc:To:From:Subject:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LkceNR5/lCSVt4pQxsmouXTl6VRo7Zp08czA+HbnBAk=; b=FuXqHD6o8ZUV6b0WSEYDvRqyzs
	zJ0dYFEnHWRnWw2FpsCHCTMD4feMuinsJn4FisUmaUXF6l0Vt3gNxcUpv3t8clg65llrOtEgmo5jq
	MvI9fava+G4/TzsgjdY2N4zgnEXIh/3xHWLX+SBcq+f8rsY6ohg7r5hmtb0zU7qEd/Xfrid6cGaCI
	vvkv1BtmD5/c1j76B3mlx1VQNMT+vCfj66iH5UvmnamXi3pzD+18q9+uHPE3Pm2Ug6XeR/6MCWJbd
	EwilSOYYUeyHVDKrAfk4ZokHes1qZwfGuXV5TuuWwZvC9j8TS9BPFJiXvD/UOOOhdQuedmPTL7l/W
	meYaOx3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4fXt-00000005mWm-0BI5;
	Tue, 15 Apr 2025 12:37:45 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4fSA-00000005ke1-3KOq
	for linux-arm-kernel@lists.infradead.org;
	Tue, 15 Apr 2025 12:31:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1744720309;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=LkceNR5/lCSVt4pQxsmouXTl6VRo7Zp08czA+HbnBAk=;
	b=To5Cyu45miTRPMCobJWy1qvjPVlOSr0HEHlGN9BtXvN0EGr3d8PFBv4PPwQBCfWmnnBTiH
	2PJJjfVscAnKtI7pb8jPrQa2nhPnY80ONo3/dl9Pf8pxnmrx+JI87GqcGixHWZWh4d0G8G
	BYJIt/xnVT/Vffz+GQ5HeR7/u44dLX0=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-213-bkzL0PjTPBOS8UY7oGocaw-1; Tue, 15 Apr 2025 08:31:48 -0400
X-MC-Unique: bkzL0PjTPBOS8UY7oGocaw-1
X-Mimecast-MFC-AGG-ID: bkzL0PjTPBOS8UY7oGocaw_1744720307
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-43d51bd9b45so33287355e9.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 15 Apr 2025 05:31:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744720307; x=1745325107;
        h=mime-version:user-agent:content-transfer-encoding:autocrypt
         :references:in-reply-to:date:cc:to:from:subject:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=p1a73Sd3RAp1iqaDWI4nfw2gLoGkbnWXSdTgoGDBOvM=;
        b=Tzm2cRcEQRdLCY3/mXM8c76wNkavjb3auL23f5qy11JczoH9FAYUNLdIkuxYFROtSS
         faWIxmUBUO3gt2LnUMF2TPWK7HeWAJa6J2vWhnG5RViTF+n7VdyWKkrpUHHBwKYIcjfU
         CCzJ2XUcDZmZii4i7MXpxCYSPotBKFn2qwwFzs8VD+eKltYcjj3EqsCUVYs1BL8lu9oF
         WRzvellTCfwWiJxh2yH0XQ1aDxcPSSAEibGmpFPjDxGr54wG7NPFzdCKk/Vuw1pMLHr9
         BMaNpfYep/t6WVpZdp6f/E0enlYLD/vi88DCjJyyq21O6ZaC1S//kBowSueMJzM46opf
         HbSA==
X-Forwarded-Encrypted: i=1; AJvYcCWBPvd+tMcqaKXivRjw6j23kpHyAZXqwzEpptFdu5fyvahkPMBBpq38InyuNM/i72MnZ8s+PsBCJcKcM7DGifCd@lists.infradead.org
X-Gm-Message-State: AOJu0YxN5wL/5awUhXLD7W/kU6zZCv+kV2z0E3ufeT9fpA8Iim3cZOgU
	joNd2HaLhcs0BDB0IBBjMwV4G+xsH5a8BAPOzjfWYXp74dK4ti+uJqQ57qpIiBh3yDP7T7ilh/O
	ckyfmBJi1dEfWnU43iJUCxIetON7wqBKld0KJJFT/Q1DTOnDo4zD43TDCur1CABk5aDGbwTD8
X-Gm-Gg: ASbGncuvv90cJWcSsoPbl6jWajPKgwYUOgLMwxm3CFPIiZEncbhx31yhdk0lygn7nRf
	mcgn7FF3GkxVrKceManE/kEhFBjl3K2DYSXAh5jpz1rCO8hUNIgcmKh2RNn1rnN1bcPjaUBONZU
	WlV/W+/HWB0IIqtPo5pMZmCz3lLeN4sNjgSi9aA2i7CDDRbcmFSLs6qCp2hzAXpzZ7SIMHFIAdC
	ikmtqkrb+S70Z1npYsF7wLDLjQmjr2544BowUF/RCBSCkuSN53XWdgeL877dI47Zosqr4gA9OpX
	4JchPzx6ma+JmkD+hXSNJ5SrO+1LuVh5nv6Ox2o=
X-Received: by 2002:a05:6000:2d08:b0:391:2a9f:2fcb with SMTP id ffacd0b85a97d-39eaaecdc43mr11875104f8f.36.1744720307098;
        Tue, 15 Apr 2025 05:31:47 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF8ycg8O9xQhBfZzgNtXQZUfoHEE2cLc/SzULCS1q7QwNJkCHaR97D4J4FI533j3gfmzkHI7Q==
X-Received: by 2002:a05:6000:2d08:b0:391:2a9f:2fcb with SMTP id ffacd0b85a97d-39eaaecdc43mr11875079f8f.36.1744720306709;
        Tue, 15 Apr 2025 05:31:46 -0700 (PDT)
Received: from gmonaco-thinkpadt14gen3.rmtit.csb ([195.174.134.30])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39eae96407esm14219474f8f.17.2025.04.15.05.31.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Apr 2025 05:31:46 -0700 (PDT)
Message-ID: <4d5dd1b919aada32ddf4dbce895f19e558343ee9.camel@redhat.com>
Subject: Re: [PATCH v2 19/22] rv: Add rtapp_pagefault monitor
From: Gabriele Monaco <gmonaco@redhat.com>
To: Nam Cao <namcao@linutronix.de>, Steven Rostedt <rostedt@goodmis.org>, 
	linux-trace-kernel@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: john.ogness@linutronix.de, Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,  Albert Ou <aou@eecs.berkeley.edu>,
 Alexandre Ghiti <alex@ghiti.fr>, Thomas Gleixner <tglx@linutronix.de>, 
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, Dave Hansen
 <dave.hansen@linux.intel.com>, 	x86@kernel.org, "H . Peter Anvin"
 <hpa@zytor.com>, Andy Lutomirski	 <luto@kernel.org>, Peter Zijlstra
 <peterz@infradead.org>, 	linux-arm-kernel@lists.infradead.org,
 linux-riscv@lists.infradead.org
Date: Tue, 15 Apr 2025 14:31:43 +0200
In-Reply-To: <f57547af5e8c836f5c548f624e61f3e0002ce0b4.1744355018.git.namcao@linutronix.de>
References: <cover.1744355018.git.namcao@linutronix.de>
	 <f57547af5e8c836f5c548f624e61f3e0002ce0b4.1744355018.git.namcao@linutronix.de>
Autocrypt: addr=gmonaco@redhat.com; prefer-encrypt=mutual;
 keydata=mDMEZuK5YxYJKwYBBAHaRw8BAQdAmJ3dM9Sz6/Hodu33Qrf8QH2bNeNbOikqYtxWFLVm0
 1a0JEdhYnJpZWxlIE1vbmFjbyA8Z21vbmFjb0ByZWRoYXQuY29tPoiZBBMWCgBBFiEEysoR+AuB3R
 Zwp6j270psSVh4TfIFAmbiuWMCGwMFCQWjmoAFCwkIBwICIgIGFQoJCAsCBBYCAwECHgcCF4AACgk
 Q70psSVh4TfJzZgD/TXjnqCyqaZH/Y2w+YVbvm93WX2eqBqiVZ6VEjTuGNs8A/iPrKbzdWC7AicnK
 xyhmqeUWOzFx5P43S1E1dhsrLWgP
User-Agent: Evolution 3.54.3 (3.54.3-1.fc41)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: d0fl5lTM1c6uE0umjmGRIZC4F3gzesJ6_E4lRHVG8e4_1744720307
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250415_053150_906040_8BD1CCCA 
X-CRM114-Status: GOOD (  23.11  )
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



On Fri, 2025-04-11 at 09:37 +0200, Nam Cao wrote:
> Userspace real-time applications may have design flaws that they
> raise
> page faults in real-time threads, and thus have unexpected latencies.
>=20
> Add an linear temporal logic monitor to detect this scenario.
>=20
> Signed-off-by: Nam Cao <namcao@linutronix.de>
> ---
> Cc: Catalin Marinas <catalin.marinas@arm.com>
> Cc: Will Deacon <will@kernel.org>
> Cc: Paul Walmsley <paul.walmsley@sifive.com>
> Cc: Palmer Dabbelt <palmer@dabbelt.com>
> Cc: Albert Ou <aou@eecs.berkeley.edu>
> Cc: Alexandre Ghiti <alex@ghiti.fr>
> Cc: Thomas Gleixner <tglx@linutronix.de>
> Cc: Ingo Molnar <mingo@redhat.com>
> Cc: Borislav Petkov <bp@alien8.de>
> Cc: Dave Hansen <dave.hansen@linux.intel.com>
> Cc: x86@kernel.org
> Cc: H. Peter Anvin <hpa@zytor.com>
> Cc: Andy Lutomirski <luto@kernel.org>
> Cc: Peter Zijlstra <peterz@infradead.org>
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: linux-riscv@lists.infradead.org
> ---
> =C2=A0kernel/trace/rv/Kconfig=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 |=C2=A0 1 +
> =C2=A0kernel/trace/rv/Makefile=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 |=C2=A0 1 +
> =C2=A0kernel/trace/rv/monitors/pagefault/Kconfig=C2=A0=C2=A0=C2=A0 | 11 +=
++
> =C2=A0.../trace/rv/monitors/pagefault/pagefault.c=C2=A0=C2=A0 | 83
> +++++++++++++++++++
> =C2=A0.../trace/rv/monitors/pagefault/pagefault.h=C2=A0=C2=A0 | 57 ++++++=
+++++++
> =C2=A0.../rv/monitors/pagefault/pagefault_trace.h=C2=A0=C2=A0 | 14 ++++
> =C2=A0kernel/trace/rv/rv_trace.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 |=C2=A0 1 +
> =C2=A0tools/verification/models/rtapp/pagefault.ltl |=C2=A0 1 +
> =C2=A08 files changed, 169 insertions(+)
> =C2=A0create mode 100644 kernel/trace/rv/monitors/pagefault/Kconfig
> =C2=A0create mode 100644 kernel/trace/rv/monitors/pagefault/pagefault.c
> =C2=A0create mode 100644 kernel/trace/rv/monitors/pagefault/pagefault.h
> =C2=A0create mode 100644
> kernel/trace/rv/monitors/pagefault/pagefault_trace.h
> =C2=A0create mode 100644 tools/verification/models/rtapp/pagefault.ltl
>=20
> diff --git a/kernel/trace/rv/Kconfig b/kernel/trace/rv/Kconfig
> index 5c407d291661..6f86d8501e87 100644
> --- a/kernel/trace/rv/Kconfig
> +++ b/kernel/trace/rv/Kconfig
> @@ -42,6 +42,7 @@ source "kernel/trace/rv/monitors/scpd/Kconfig"
> =C2=A0source "kernel/trace/rv/monitors/snep/Kconfig"
> =C2=A0source "kernel/trace/rv/monitors/sncid/Kconfig"
> =C2=A0source "kernel/trace/rv/monitors/rtapp/Kconfig"
> +source "kernel/trace/rv/monitors/pagefault/Kconfig"
> =C2=A0# Add new monitors here
> =C2=A0
> =C2=A0config RV_REACTORS
> diff --git a/kernel/trace/rv/Makefile b/kernel/trace/rv/Makefile
> index 9b28c2419995..353ecf939d0e 100644
> --- a/kernel/trace/rv/Makefile
> +++ b/kernel/trace/rv/Makefile
> @@ -13,6 +13,7 @@ obj-$(CONFIG_RV_MON_SCPD) +=3D monitors/scpd/scpd.o
> =C2=A0obj-$(CONFIG_RV_MON_SNEP) +=3D monitors/snep/snep.o
> =C2=A0obj-$(CONFIG_RV_MON_SNCID) +=3D monitors/sncid/sncid.o
> =C2=A0obj-$(CONFIG_RV_MON_RTAPP) +=3D monitors/rtapp/rtapp.o
> +obj-$(CONFIG_RV_MON_PAGEFAULT) +=3D monitors/pagefault/pagefault.o
> =C2=A0# Add new monitors here
> =C2=A0obj-$(CONFIG_RV_REACTORS) +=3D rv_reactors.o
> =C2=A0obj-$(CONFIG_RV_REACT_PRINTK) +=3D reactor_printk.o
> diff --git a/kernel/trace/rv/monitors/pagefault/Kconfig
> b/kernel/trace/rv/monitors/pagefault/Kconfig
> new file mode 100644
> index 000000000000..b31dee208459
> --- /dev/null
> +++ b/kernel/trace/rv/monitors/pagefault/Kconfig
> @@ -0,0 +1,11 @@
> +# SPDX-License-Identifier: GPL-2.0-only
> +#
> +config RV_MON_PAGEFAULT
> +=09depends on RV
> +=09select RV_LTL_MONITOR
> +=09depends on RV_MON_RTAPP
> +=09default y
> +=09select LTL_MON_EVENTS_ID
> +=09bool "pagefault monitor"
> +=09help
> +=09=C2=A0 Monitor that real-time tasks do not raise page faults
> diff --git a/kernel/trace/rv/monitors/pagefault/pagefault.c
> b/kernel/trace/rv/monitors/pagefault/pagefault.c
> new file mode 100644
> index 000000000000..9f7a4cba39a1
> --- /dev/null
> +++ b/kernel/trace/rv/monitors/pagefault/pagefault.c
> @@ -0,0 +1,83 @@
> +// SPDX-License-Identifier: GPL-2.0
> +#include <linux/ftrace.h>
> +#include <linux/tracepoint.h>
> +#include <linux/kernel.h>
> +#include <linux/module.h>
> +#include <linux/init.h>
> +#include <linux/rv.h>
> +#include <rv/instrumentation.h>
> +
> +#define MODULE_NAME "pagefault"
> +
> +#include <rv_trace.h>
> +#include <trace/events/exceptions.h>
> +#include <monitors/rtapp/rtapp.h>
> +
> +#include "pagefault.h"
> +#include <rv/ltl_monitor.h>
> +
> +static void ltl_atoms_fetch(struct task_struct *task, struct
> ltl_monitor *mon)
> +{
> +=09ltl_atom_set(mon, LTL_RT, rt_task(task));
> +}
> +
> +static void ltl_atoms_init(struct task_struct *task, struct
> ltl_monitor *mon, bool task_creation)
> +{
> +=09if (task_creation)
> +=09=09ltl_atom_set(mon, LTL_PAGEFAULT, false);
> +}
> +
> +static void handle_page_fault(void *data, unsigned long address,
> struct pt_regs *regs,
> +=09=09=09=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 unsigned long error_code)
> +{
> +=09ltl_atom_pulse(current, LTL_PAGEFAULT, true);
> +}
> +
> +static int enable_pagefault(void)
> +{
> +=09int retval;
> +
> +=09retval =3D ltl_monitor_init();
> +=09if (retval)
> +=09=09return retval;
> +
> +=09rv_attach_trace_probe("pagefault", page_fault_kernel,
> handle_page_fault);
> +=09rv_attach_trace_probe("pagefault", page_fault_user,
> handle_page_fault);
> +
> +=09return 0;
> +}
> +
> +static void disable_pagefault(void)
> +{
> +=09rv_pagefault.enabled =3D 0;
> +
> +=09rv_detach_trace_probe("rtapp_pagefault", page_fault_kernel,
> handle_page_fault);
> +=09rv_detach_trace_probe("rtapp_pagefault", page_fault_user,
> handle_page_fault);
> +
> +=09ltl_monitor_destroy();
> +}
> +
> +static struct rv_monitor rv_pagefault =3D {
> +=09.name =3D "pagefault",
> +=09.description =3D "Monitor that RT tasks do not raise page
> faults",
> +=09.enable =3D enable_pagefault,
> +=09.disable =3D disable_pagefault,
> +};
> +
> +static int __init register_pagefault(void)
> +{
> +=09rv_register_monitor(&rv_pagefault, &rv_rtapp);
> +=09return 0;

Any reason why you aren't returning the error value from the monitor
registration?

Other than that, the monitor seems neat and reasonably easy to
generate.

May not be necessary in this series, but try to keep compatibility with
the userspace RV tool as well, you need to have some special case in
its tracing components because fields are not matching:
 # rv mon sleep -t
         rcuc/11-108      [011] event <CANT FIND FIELD final_state>  =20
(null) x (null)                   -> (null)                   Y
         rcuc/11-108      [011] event <CANT FIND FIELD final_state>  =20
(null) x (null)                   -> (null)                   Y
      ktimers/11-109      [011] event <CANT FIND FIELD final_state>  =20
(null) x (null)                   -> (null)                   Y
=20
Thanks,
Gabriele


