Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48374C021B8
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 26 Feb 2025 19:17:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:
	Subject:Cc:To:From:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Message-ID:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=O/7HubgIS3yguXLFwagiKL0MIanaDsiXeL1ZcDJnpI0=; b=MUwkp7iRK12RFnXgnuS06FgZrQ
	P3mnuDfLH4idprMUHQNJ4JHJQtexiyBkKI/wkg6E2rogCXsA+mcQHJ/htJvcDpnQMZMFYOQNjnGpH
	kHmtsEHy7NX7Pgq7brwsiNflbAMmUU8Ayc8qqWCUuhMu4eti3Xkeeek8IyUcgjy+gUKb/8PP8JbIc
	C4TeWoIam0qJKGTw6A7o7+WcZCIsS7f2g/EiAtFVfWw1jU4/JxMCXiOfc/QI6hpTUtLgGZ3frKSTj
	LYE8EWD3lGRbGZVgCHTBHJBSReOeyVL5dC4WYnVKj+U+/gfbDBj8XzPVgOtPpQamIzRiVGJfy1MPS
	i3yaax6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnMuU-000000057ie-2McR;
	Wed, 26 Feb 2025 19:17:34 +0000
Received: from mail-qt1-x82a.google.com ([2607:f8b0:4864:20::82a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tnMr1-0000000576a-1PQy
	for linux-arm-kernel@lists.infradead.org;
	Wed, 26 Feb 2025 19:14:00 +0000
Received: by mail-qt1-x82a.google.com with SMTP id d75a77b69052e-4721325e3b5so1226121cf.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 26 Feb 2025 11:13:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=paul-moore.com; s=google; t=1740597238; x=1741202038; darn=lists.infradead.org;
        h=in-reply-to:references:subject:cc:to:from:content-transfer-encoding
         :mime-version:message-id:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=O/7HubgIS3yguXLFwagiKL0MIanaDsiXeL1ZcDJnpI0=;
        b=EK8Lb7DW8H+d7bRG5EjrmniL8rnKss9DkoFsGMdsAIe/qcSFAuu34pJ5LAaY/9Ldyz
         eXQV3lqfRIZ0Q7AKhaBzNogvri3qctIzUE7QT/AQ3QTucikjSImenasuYOjnVilTAKXv
         ZxzMSqI5FVrZ4mfpzXq82EqDZOzxGjM25wsVX6tx+qy9JnfIOd9Vy9JFkO2VCI+BkAym
         f5BQSSd5jmZk9hIiaVihXxSKzM7+xu/gyPuxZcE3NbFSfnXe++UbgaUPDviXBDFFVSj/
         qlEq1ZTftDJSZiRo2+9mlwyAg89Q3KlbBmDoSaHOFwgtJo+NUQfCJQmWxc8FI2LGwyG9
         Pokg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740597238; x=1741202038;
        h=in-reply-to:references:subject:cc:to:from:content-transfer-encoding
         :mime-version:message-id:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=O/7HubgIS3yguXLFwagiKL0MIanaDsiXeL1ZcDJnpI0=;
        b=RjLezEL2aNdg+GIWDKHerUcUsm4XLm4opFZVhW5datQN/PB4GSGkWNrkt1TFGqx3fn
         5x0sqz20vdYgxj2T5slx3mEQnISxiNH1AINtPpSYAgiVa2afGIDUy55bp4IdiGR9s0yD
         8cCVyiYVyjBw85j3M+1CJeSQ1mS98RLdOCBMSGRp5P1iL3g2apZ8gJ7Jpmgi7LUkROnz
         s9d0DSvOm+jG2Twl6/sryaSCC1naBVs+hRRq0cvatBoK+TwExKxmM8NOCIjHq2QfDxdJ
         hrPGtis6YtWt06dPStg3IU3XWoiMEJP3F8kVlAzwa+gZl5gUU0/S/63udcgK/pfnKRFP
         7MpQ==
X-Forwarded-Encrypted: i=1; AJvYcCV/2z7FeIHenYumHlcxyeVivuFJpK2ChKiOHMsF4xJEsN0s2G2QYEqYpIpaC9TuWiVJqQ/1tYWhF68P+acO5AMl@lists.infradead.org
X-Gm-Message-State: AOJu0Yy7oxcr1RMTBkR4AQNaiZOie/QlKfXdtK91rl1IM0zFMJ+ffthR
	TVamxf2ZqJoXF0nV4YB1TNkiuyKs2Y+QN0K6znPvYMCyH9meoMdg0skzfjXhEA==
X-Gm-Gg: ASbGncvdG/0yNlhNDY6jT9u1ms9WqAy9NSIWXn7e6Y2/whayRQ4ykzvo5DOtU3Ef0TB
	SvlCNqFQHjPwnuRliOLVLO2a5leKtDFP/IHCMLnUPldLu03MCQolLGIjAP1Juh5P6sLHfJeH+nl
	E66Cn3fAhbb/kiXRxDYKR1BxSPUTP8Y5M/4EcNjmMapd/mnegXnV1mlky4tR4MNChCsW83qFd/F
	827nMpP2Sd6sav+LJYRTDhLcsfo0BRoPiqCNNlKW3ycKJZzXZbZCFkNvVVYhrYxuLVnE7ohhGMt
	t2bPnmMScP84hrf/Ol8PUO/kguHJNYL78EPuMm/Oy3oDem/Zl/Ws2/bmSthUeMHq1KClKtw=
X-Google-Smtp-Source: AGHT+IGZKQ763FRka4tXmeqX9uwcpJ0v96pIEchafXYFD2cwhU7ih42tfW2HHRWzr2HQKaEkzBO+qA==
X-Received: by 2002:a05:622a:1a07:b0:472:201c:aa45 with SMTP id d75a77b69052e-47377116ed2mr109013401cf.9.1740597237709;
        Wed, 26 Feb 2025 11:13:57 -0800 (PST)
Received: from localhost (pool-71-126-255-178.bstnma.fios.verizon.net. [71.126.255.178])
        by smtp.gmail.com with UTF8SMTPSA id d75a77b69052e-47377e1543csm28407591cf.27.2025.02.26.11.13.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Feb 2025 11:13:57 -0800 (PST)
Date: Wed, 26 Feb 2025 14:13:56 -0500
Message-ID: <41cb98ddf724ade0fc529b8c952f3efc@paul-moore.com>
MIME-Version: 1.0 
Content-Type: text/plain; charset=UTF-8 
Content-Transfer-Encoding: 8bit 
X-Mailer: pstg-pwork:20250226_1339/pstg-lib:20250226_1339/pstg-pwork:20250226_1339
From: Paul Moore <paul@paul-moore.com>
To: Luo Gengkun <luogengkun@huaweicloud.com>, peterz@infradead.org
Cc: mingo@redhat.com, acme@kernel.org, namhyung@kernel.org, mark.rutland@arm.com, alexander.shishkin@linux.intel.com, jolsa@kernel.org, irogers@google.com, adrian.hunter@intel.com, kan.liang@linux.intel.com, tglx@linutronix.de, bp@alien8.de, dave.hansen@linux.intel.com, x86@kernel.org, hpa@zytor.com, will@kernel.org, jmorris@namei.org, serge@hallyn.com, rostedt@goodmis.org, mhiramat@kernel.org, mathieu.desnoyers@efficios.com, stephen.smalley.work@gmail.com, omosnace@redhat.com, linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-security-module@vger.kernel.org, linux-trace-kernel@vger.kernel.org, selinux@vger.kernel.org, luogengkun@huaweicloud.com
Subject: Re: [PATCH 1/2] perf: Remove unnecessary parameter of security check
References: <20241223070650.2810747-2-luogengkun@huaweicloud.com>
In-Reply-To: <20241223070650.2810747-2-luogengkun@huaweicloud.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250226_111359_373917_C3E48CBD 
X-CRM114-Status: GOOD (  11.43  )
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

On Dec 23, 2024 Luo Gengkun <luogengkun@huaweicloud.com> wrote:
> 
> It seems that the attr parameter was never been used in security
> checks since it was first introduced by:
> 
> commit da97e18458fb ("perf_event: Add support for LSM and SELinux checks")
> 
> so remove it.
> 
> Signed-off-by: Luo Gengkun <luogengkun@huaweicloud.com>
> Reviewed-by: Ingo Molnar <mingo@kernel.org>
> ---
>  arch/x86/events/intel/bts.c     |  2 +-
>  arch/x86/events/intel/core.c    |  2 +-
>  arch/x86/events/intel/p4.c      |  2 +-
>  drivers/perf/arm_spe_pmu.c      |  4 ++--
>  include/linux/lsm_hook_defs.h   |  2 +-
>  include/linux/perf_event.h      | 10 +++++-----
>  include/linux/security.h        |  5 ++---
>  kernel/events/core.c            | 14 +++++++-------
>  kernel/trace/trace_event_perf.c |  4 ++--
>  security/security.c             |  5 ++---
>  security/selinux/hooks.c        |  2 +-
>  11 files changed, 25 insertions(+), 27 deletions(-)

Now that we have Ingo's Reviewed-by, I've gone ahead and merged
patch 1/2 into lsm/dev, thanks everyone!

--
paul-moore.com

