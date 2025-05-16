Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86474C3DA6D
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 16 May 2025 22:42:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lNFXjf3PJYlE1NzfCDo4tWQZwFVgZWyBO9vm1WZeiYI=; b=a6kdZ4TjMYrjCF2s0/jccNKbgd
	Ih51EpX1mk/0c5shRySEB4jsHJiUWOMy/Q/Sp4tD03nBifEv+Kfz0DQtQ93dssBIRZkzN/NACvFpy
	gN+TCwx+booS7Ai7OiPw6rUUNj8zs0hIX8XR+gkpPEUyTOEexzc0Ds/Dm8exhT0dGLSPdA4TwlvJX
	5q7b9dQTP8hOzTDPuEwMxHDTWaoDO5IVnscs9tV+4UYhMS0shLP5XdCFhTn2trJBLumcxJfmATZxB
	DrxrdQAVQQ+hVlhmIjDc7y6yxWkpZGjhhtmllZSkKjziAKFS8hup+0++5akQrQvRV7n06UqQjdMxB
	U/npgQTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uG3l8-00000004lkE-1AqA;
	Fri, 16 May 2025 22:42:30 +0000
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uG3j5-00000004leQ-3gwv
	for linux-arm-kernel@lists.infradead.org;
	Fri, 16 May 2025 22:40:25 +0000
Received: by mail-ej1-x636.google.com with SMTP id a640c23a62f3a-ad51ba0af48so377646266b.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 16 May 2025 15:40:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1747435221; x=1748040021; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lNFXjf3PJYlE1NzfCDo4tWQZwFVgZWyBO9vm1WZeiYI=;
        b=hfcBPCJEzPU8zxg3KGJIWY87Hh4nCeTJvni+SjHDZRqSX83zdwJ31vpoB0oRNgXvn5
         8y72lYTbadi8+pt6iYsu6xp+izxs9ylvHW+GncsGqw/Lb+l8/BakKN2arSovzlauQbDI
         IOZBDlwwrrkgWtm7BW2R2Q4eVpVj+ojvY+kIqclGpnaUXhByXJ5V0G7LxvysAs58Sr/F
         x4w+wjsSYBDlxf+v+ia7gDxBSMQYPYwvRRvTy18SjHuzPyWbbXr3oti6dgqBlL1PUV5h
         5TOyVyhaomtqLZ64Xf5WE4YRMcQ+s7TaQhUFR9yHs9VPds+PlCH6OLJNl1c+wK240uoN
         vXJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747435221; x=1748040021;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lNFXjf3PJYlE1NzfCDo4tWQZwFVgZWyBO9vm1WZeiYI=;
        b=qkJJ3iGwD3Y2uIhvtlkBZMKjK127OFGp4z6YOKkLxuDTrWRjjiyZ0Pswgq8uKgUf+0
         NzCOf/r4Mx/n+FFFCpH1hL3EDeAVrcYwyPpWuWUOwc1McEqTuddT4PdQ4mGwSmIE/x7A
         kUcamLuNBsblbnpXomDIVnNIyfOoIfIMTTrurweX5it+opevzfz0spWyYsxk22YyNgqF
         4fKLLKqZR95CLUlhdqGxbu3NdNsPDzflCzyPXoAm2HulBYQXf+jFIKsuBSov5crTAqtr
         lyyrDNkqiRhfW5nl6O7b7UDXui94If0EVa3hsoclK65+rr4KgChKW5ir7lPfH9A3dyno
         zshw==
X-Forwarded-Encrypted: i=1; AJvYcCVsnWsKyiJnV2pFT4uf9Q3aNQua3+TOVxE1tuHNvzdeumCq41x59DnvqtFMaRS0h2Shx9UM+rm27iCriQiI2sNJ@lists.infradead.org
X-Gm-Message-State: AOJu0YyQQ3KUVsgafeVH0fNSRsQAzHwk7Q64xfSiHm1447wi0ivAQeJw
	doA8eV7697QKH5pW2ReFYRTp9f5cLqJV8OGHh1/3mNB2xDRfDRAF1hvn2WSFWUoj7nvAIWHRB9P
	7oq32NsHHO5NT4BYEzIk6GxoNSZLaGCjNiHXsgDo=
X-Gm-Gg: ASbGncv7PG3W2MewtJfZP87fBDDENm/7nbDzOxzLMbne052eox4Vuk+9uU8V3r3SRu7
	cDK791M1qZPdUAct2DJZvEel3QQMaXAmYjRM4PkucuYlEQdsqLP5qwlr00t2wz+hu2q0dgvSa++
	0koVUYvJi4tKkdWSJnzs/TPBun4OmGTSxyZUGqdRgukjWILWPkpkDHTF4K2srYqg==
X-Google-Smtp-Source: AGHT+IExSig2ITwWjq6wQ0knuNN0Yajz3rRMrrxdSFU7Dg01oitJu42IpPHuoI577vLU2ocClK7n5eET0Q/H4hNID2I=
X-Received: by 2002:a17:907:da4:b0:ad2:1c66:27ff with SMTP id
 a640c23a62f3a-ad50f64958amr942672766b.8.1747435221087; Fri, 16 May 2025
 15:40:21 -0700 (PDT)
MIME-Version: 1.0
References: <20250516160742.1200904-1-leo.yan@arm.com>
In-Reply-To: <20250516160742.1200904-1-leo.yan@arm.com>
From: Yabin Cui <yabinc@google.com>
Date: Fri, 16 May 2025 15:40:09 -0700
X-Gm-Features: AX0GCFuP_wWXz7RnQLutcc_2ZsgoUcNn3AXaTWQ_LGfHREmd_nIl_20E3xvS4gw
Message-ID: <CALJ9ZPOk7j-Omz1C9hwsc+NZyE4OLrGOqRr-GhNHHepb9wZP1g@mail.gmail.com>
Subject: Re: [PATCH v1 00/11] CoreSight: Refactor CPU PM and hotplug
To: Leo Yan <leo.yan@arm.com>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>, Mike Leach <mike.leach@linaro.org>, 
	James Clark <james.clark@linaro.org>, coresight@lists.linaro.org, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250516_154023_938798_CBB84764 
X-CRM114-Status: GOOD (  27.10  )
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

Hi Leo,

Thanks for the patchset!

I have tested the patches by backporting them to Android 6.1 kernel and run=
ning
system wide ETM data collection on Pixel 9, using both ETR and TRBE.
I didn't see any cpu idle problems.

Tested-by: Yabin Cui <yabinc@google.com>




On Fri, May 16, 2025 at 9:07=E2=80=AFAM Leo Yan <leo.yan@arm.com> wrote:
>
> Besides managing tracers (ETM) in CPU PM and hotplug flows, the
> CoreSight framework is found the issues below:
>
> Firstly, on some hardware platforms, CoreSight links (e.g., funnels and
> replicators, etc) reside in a cluster power domain.  If the cluster is
> powered off, the link components also will lose their context.  In this
> case, Arm CoreSight drivers report errors when detect unpaired self-host
> claim tags.
>
> Secondly, if a path has been activated from per CPU's tracer (ETM) to
> links and a sink in Sysfs mode, then when the CPU is hot-plugged off,
> only the associated ETM will be disabled.  Afterwards, the links and the
> sink always keep on and no chance to be disabled.
>
> The last issue was reported by Yabin Cui (Google) that the TRBE driver
> misses to save and restore context during CPU low power states.  As a
> result, it may cause hardware lockup issue on some devices.
>
> To resolve the power management issues, this series extends CPU power
> management to cover the entire activated path, including links and
> sinks.  It moves CPU PM and hotplug notifiers from the ETMv4 driver to
> the CoreSight core layer.  The core layer has sufficient info to
> maintain activated paths and can traverse the entire path to manipulate
> CoreSight modules accordingly.
>
> Patch 01 is to fix a bug in ETMv4 save and restore callbacks.
>
> Patches 02 ~ 06 move CPU PM code from ETMv4 driver to the core layer, and
> extends to maintain activated paths and control links.
>
> Patches 07 and 08 support save and restore context for per-CPU sink
> (TRBE).  Note, for avoid long latency, system level's sinks in an
> activated path are not touched during CPU suspend and resume.
>
> Patches 09 ~ 11 move CPU hotplug notifier from ETMv4 driver to the core
> layer.  The entire path will be controlled if the corresponding CPU is
> hot-plugged on or off.
>
> This series has been verified on Hikey960 for CPUIdle and hotplug.  And
> it is tested on FVP for verifying TRBE with idle states.
>
>
> Leo Yan (10):
>   coresight: etm4x: Control the trace unit in CPU suspend
>   coresight: Set per CPU source pointer
>   coresight: Register CPU PM notifier in core layer
>   coresight: etm4x: Hook CPU PM callbacks
>   coresight: Save activated path into source device
>   coresight: Control path during CPU PM
>   coresight: Add PM callbacks in sink operation
>   coresight: Take hotplug lock in enable_source_store() for Sysfs mode
>   coresight: Move CPU hotplug callbacks to core layer
>   coresight: Manage activated paths during CPU hotplug
>
> Yabin Cui (1):
>   coresight: trbe: Save and restore state across CPU low power state
>
>  drivers/hwtracing/coresight/coresight-core.c       | 252 +++++++++++++++=
++++++++++++++++++++++++++
>  drivers/hwtracing/coresight/coresight-etm3x-core.c |   2 +
>  drivers/hwtracing/coresight/coresight-etm4x-core.c | 133 ++++++---------=
-------
>  drivers/hwtracing/coresight/coresight-priv.h       |   1 +
>  drivers/hwtracing/coresight/coresight-sysfs.c      |  12 +-
>  drivers/hwtracing/coresight/coresight-trbe.c       |  65 +++++++++++
>  include/linux/coresight.h                          |  11 ++
>  7 files changed, 375 insertions(+), 101 deletions(-)
>
> --
> 2.34.1
>

