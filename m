Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0B1FC55184
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Aug 2026 15:44:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=brpCBQVGbNrDVt7cTfK+56VzO28aZ7jJCm8ldakLLGM=; b=R/6Xk3C9WpuwEvSd8jFBZqMrNb
	0Mpl1IpwUvFrzQdDbK5cmHY3SdP2jsERpb1G/1mgOyfzgtEj3atIO54m/EhXVvcokzpL+6zI6iDAW
	+vEbKsuHcLB92kycfHJrl3nh6cq+ucmjBTHfkNvWgB1wTkhBlLHCFip9/Y7L/IQMGo50s23AiyeIx
	ECDZGRmIsYnbQ+mTx43+JPEBVCOOLENWUp9w+dGWe49kmKbt+YLAtV4jmloIdT7ejQRrV/4yPkRXV
	SPwg4BFtAWGmEYXKBPe0sJksrFlAW6Qt6WuTn8Y0j1m3n3fj4tuFL91yv5G9vbC+rqcuGr5hFE+j1
	UJiN7yIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wquqS-0000000HZ61-0rIg;
	Mon, 03 Aug 2026 15:44:52 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wquqO-0000000HZ4E-1v3i
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Aug 2026 15:44:50 +0000
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-49544f26c43so2420755e9.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 03 Aug 2026 08:44:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785771886; x=1786376686; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=brpCBQVGbNrDVt7cTfK+56VzO28aZ7jJCm8ldakLLGM=;
        b=lHd+EQ5OO0i6M9mJvxSUV4mGGVZN0Vq8MojJgme+UL/Lcq52GlldqTAxM22vi4MitI
         uFY/BXZN+fg3zUzAa5TQSYqtsE2gLoluObUeBpMS28TPE+GNh7T0WhAFbzM4EMgQLuXF
         R+Fn8ICjKreTFciivpsZo52tlaB71cIYLt0eakv+MX52ImhlY5Thp3F1rj9n6bjOZyx7
         wxEpf3V0lvdmRAVfB8HWrHwwNwlCKB6Iez129wcybdA7KCLEm7Bkmiul3vtIB7dDM1T3
         z+rQx67h709ZlFjlUX9qXdtK1Q7HBpAK8tw/Nt/TtJHUMGx/HNBdmDKNzFyrxrMmUxAY
         R47g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785771886; x=1786376686;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=brpCBQVGbNrDVt7cTfK+56VzO28aZ7jJCm8ldakLLGM=;
        b=AtamAGQNaZwii+fCxPV+T+moxuWbK4A58ztBgEQlf2CByN6Dpsdw+1KteSGB7KW3RT
         LqHETAheE0e050jHo7C9EZR3OOEq449O/nFQ74X6P52hGopWwbCLsTKIo7g01JsBwkD3
         l9oZLDfp2aj1obUzX5Xf6pETLKNy+IQC5FD9pKeZfr6K1XrtA7HhVGskMDEUDond4paH
         34mmYmO/zF2yUt8k7JZQkEKAqaGiuuegbmJHin8HCIBZ7mJiEtNDlcBOouOXWBB1A+tE
         Xhrrmc9h6ru0CaVcPQLJzXeWQpi4Q0ZGaj7dFjEuC6FbHjzMi9OqtmpJI5v1tVhDG7/4
         NxHQ==
X-Forwarded-Encrypted: i=1; AHgh+Rr1pJ9zNt4qLhRaCs5RrBpmWJ/l0ODJdsgvPMyFdd0qTLogBvmazNjDIVOHflmOaBRk6xDhcqFBErOypI8qmjqx@lists.infradead.org
X-Gm-Message-State: AOJu0YyYKAlnD3WLPAJZR0F2b0WXUEm0ostrwcX+HRs1yd2VHzo1Jibd
	VylwVylM1G5rQGWE8pzSdZ/pn4CPUsF05oY7JiEwDq0FqDboOnjiRjhAJ0tpMoDw
X-Gm-Gg: AR+sD10gs6hEWxotU+niM7KXHjRTJqDXoToPSo//PQLg/JGTflc9GSbVES7VUAcDXpk
	a8g16SAykUS+0wHzAkg1o7e5LoncEJd8Fn5Z6OZaWfDcrPxLv5jXY87qqa8YEK9N0P+11sAtsHT
	kJwCF7p9gUkiQXm/9uhXOvcyrtmyoz8T5+Wovt6tv37vPWT4slJPcueVBHPb/UZjmZYjIJS5d9n
	CPMJ+WVbKUiqPQucocqW9DU+mmrmQvVlA2rWWRWs72ZAZv/6w08dX+Fz5x8IZIZ48t7K9SSMjM+
	wtJIjb7kSGKTV3lRqMUgRszpGytxwS8tTrBJZm0DobJcIl2KPmBwXuhADCM+6mdTB31qLhPgyGC
	Yh4oTseI25FqC4Q8X7xUmuDd0u/xHjpU5lumwAm/2fTUqu0c2j5JBIPmJtfjAldEIIIlc2YgHip
	y3aEe6qJkisude//1+XuJnZe1l9LYDkDlygt7NtdT/gBYb4SdD/52qU8aJMTirpaxwrSe+uahWR
	EHImQWg9zkUCFDtXS2FhpyIq3eBOgVifMgGubcfQ/C7af/+7eY/TC/dEdxfO8r332X0
X-Received: by 2002:a05:600c:1c11:b0:495:7561:a9cc with SMTP id 5b1f17b1804b1-4980c6aa664mr130391355e9.4.1785771885581;
        Mon, 03 Aug 2026 08:44:45 -0700 (PDT)
Received: from OrangePi5-Plus.BB-HOME (20014C4E1B85F300A5CC0DBDABDC4661.dsl.pool.telekom.hu. [2001:4c4e:1b85:f300:a5cc:dbd:abdc:4661])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49807b9441csm233512265e9.4.2026.08.03.08.44.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Aug 2026 08:44:45 -0700 (PDT)
From: Igor Paunovic <royalnet026@gmail.com>
To: Jiaxing Hu <gahing@gahingwoo.com>
Cc: tomeu@tomeuvizoso.net,
	heiko@sntech.de,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	ulfh@kernel.org,
	p.zabel@pengutronix.de,
	ogabbay@kernel.org,
	alchark@gmail.com,
	chaoyi.chen@rock-chips.com,
	krzk@kernel.org,
	will@kernel.org,
	dri-devel@lists.freedesktop.org,
	linux-rockchip@lists.infradead.org,
	linux-pm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH v4 4/6] accel/rocket: add RK3576 NPU (RKNN) support
Date: Mon,  3 Aug 2026 17:44:23 +0200
Message-ID: <20260803154423.12175-1-royalnet026@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260803094125.3285895-5-gahing@gahingwoo.com>
References: <20260803094125.3285895-1-gahing@gahingwoo.com> <20260803094125.3285895-5-gahing@gahingwoo.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260803_084448_517510_E2FC1A53 
X-CRM114-Status: GOOD (  18.82  )
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

Hi Jiaxing,

Thanks for the re-spin, and thanks for asking about the tag rather than
carrying it over. I went to re-test on RK3588 and stopped at the diff,
because patch 4/6 is not the fixes-only patch the cover describes: it
carries your debugging tree with it.

Diffing v3 4/6 against v4 4/6, rocket_job.c goes from +55 to +306 lines,
and 202 of those added lines are the ping-pong experiment. It brings in
five module parameters that were not in v3:

  state_init  (rocket_core.c)  - default 1, i.e. ON
  sptr_alt    (rocket_job.c)
  snap        (rocket_job.c)
  pp_clear    (rocket_job.c)
  sptr_dbg    (rocket_job.c)

plus rocket_snap_take() with its ioremap() of a hardcoded
ROCKET_SNAP_DPU_PHYS and two kmalloc_array() buffers that are never
freed, and rocket_sptr_patch_regcmd() doing phys_to_virt() on the
IOMMU-mapped regcmd and a hand-rolled dma_sync_sg_for_device(). The
comment above the block says it itself:

  /*
   * EXPERIMENT (not for upstream), 2026-08-01, following Tomeu's
   * suggestion that the block is stuck on ping-pong bank 0.

So I think the trim simply did not catch this hunk.

The part that matters for the tag you asked me about:

  rocket_core_state_init() is called unconditionally from
  rocket_device_runtime_resume(), not behind core->soc->poll_completion
  or any RK3576 check, and rocket_state_init defaults to 1.

So on RK3588 every runtime resume now writes PC BASE_ADDRESS = 0x1 and
the CNA S_POINTER 0 / DATA_SIZE1 / S_POINTER 1 / DATA_SIZE1 / S_POINTER
0x1e sequence, i.e. the RK3576 vendor init replayed on RK3588 silicon.
That is a third change to my board that the cover does not list, and it
is the one I would have to characterise before I could put my name on
anything. "RK3588 never reaches either" is true of the two fixes you
name, but not of this patch as it stands.

The two fixes themselves look right to me, and both are correctly gated:

  * rocket_job_fini() cancelling poll_timer and poll_work under
    soc->poll_completion - RK3588 has poll_completion = false, so it
    cannot regress here.

  * poll_work_seq / poll_seq in rocket_poll_work_fn() - same gate, and
    the stale-work window it closes is real.

So: send a v5 with 4/6 trimmed back to the fixes, and I will re-run the
RK3588 bench and give you the Tested-by on that. It is a mechanical
respin, no new debugging needed from your side.

Two smaller things while I am in there, for whenever the experiment code
does come out anyway:

  * rocket_state_init is not static, so it lands in the global namespace.
  * The two snap buffers and the ioremap are never released, so with
    snap=1 that leaks per module load.

On the real problem: I do not have an RK3576 to poke at, but the shape
you describe - one configuration byte exact forever, a second one
computing nothing, the pointer reading back 1 no matter what we write,
and the 20 KB snapshot differing only in OPERATION_ENABLE - reads to me
less like a register we are failing to write and more like something the
block never re-fetches. The regcmd is DMA'd, so the interesting question
might be whether the second configuration's regcmd is actually being
read by the block at all on the second submit, rather than whether the
bank flipped. If you can get at it, an IOMMU fault trace or a read-side
counter over the regcmd buffer across the two submits would separate
"fetched and ignored" from "never fetched". If it is never fetched, the
bank is a red herring and the ping-pong work has been ruling out the
wrong half of the path.

Happy to run anything you want tried on RK3588 as a control.

Thanks,
Igor

