Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA2CDC5CFEB
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Aug 2026 12:47:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=HslpzYipd5w0ihr49lUzliJQ81tnrOcg0pHtnDU5NeU=; b=IRrywNmAp/Qb26Xc7nYLggeb2v
	tXHjsmau3JNT9GR1UTSEegGLaCG0LIdm091+/J+p+tyTAAFoQGiDDWrDhM18+0OPIbKzexs/gROgh
	PSsVReo7wipn4qyDCgvYTwatdJdU7vHlgT05gKxZZy52a1erkbcg0YVwV5ki41TuaN5FYjot10kbp
	hG2jZ4WgV7Sf2MlcD6iwDwYRk44d1yJRF+AiT4o60bmR0lllY9FffTL5Epi4T8E3A5sibVv06QoW0
	vMg+h/k0oPtYe4efxMtRo0tMCFPnvLhZX83x3Jk0XHEMX/pvzdwej9iAbV4PSx5JJdlZgI4h6ToZ4
	OVw4E9ww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuUq9-00000000g7T-2q3L;
	Thu, 13 Aug 2026 12:47:21 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuUq8-00000000g76-0mW5
	for linux-arm-kernel@lists.infradead.org;
	Thu, 13 Aug 2026 12:47:20 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 36018600AD;
	Thu, 13 Aug 2026 12:47:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id D320FC19425;
	Thu, 13 Aug 2026 12:47:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1786625238;
	bh=VpG4nwidpgDqllXzLatya6ZM559BrQia13sMRj/SAJg=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=Ej7xMUSkdsrv3rN1FW/I1G1+LpYjrMyJOoM4LJtNrrgIhuehsWLxYS2C5GLKM1pdD
	 GCDpY0v8AYj5XEgwuowg129R9QveG8hHi2K5SI0iecFseQfYJsyU2GXoj8i+8Sdx41
	 +Ki5hWJsieAbD3xBWue3wZCGpUMHjMNhO7trrjO7BRwMOg5e7urIKlnsuCRSD28OoR
	 OMto5MA01w97hcSQhK6yjDLgrej63hQT+GES6xFZwWMZOiMd2I1etqDFqdl5uswr6G
	 NZ5VdvQqezpBIM6/PLqZZ30tqvuhJ4hCmmc43h+u57w902i5g+4S7Sv0LosTUFXsyf
	 SKIkIKNyW4t3A==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AAD3EC5CFEB;
	Thu, 13 Aug 2026 12:47:18 +0000 (UTC)
From: Junrui Luo via B4 Relay <devnull+moonafterrain.outlook.com@kernel.org>
Subject: [PATCH 0/2] coresight: etm-perf: fix resume AUX leak and
 exclude_kernel bypass
Date: Thu, 13 Aug 2026 20:47:15 +0800
Message-Id: <20260813-coresight-fixes-v1-0-7411a73cd496@outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIANO8fWoC/x3LSwqAMAwA0atI1hZiFX9XERfSxDabKo2IULy7x
 eVjmAzKSVhhrjIkvkXliAVNXYELW/RshIrBou1xbFrjjsQqPlxml4fVDDQhoe2QaINynYn/UKZ
 lfd8PGvv9s2EAAAA=
X-Change-ID: 20260813-coresight-fixes-7d90d0240dda
To: Suzuki K Poulose <suzuki.poulose@arm.com>, 
 Mike Leach <mike.leach@arm.com>, James Clark <james.clark@linaro.org>, 
 Leo Yan <leo.yan@arm.com>, 
 Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
 Mathieu Poirier <mathieu.poirier@linaro.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Junrui Luo <moonafterrain@outlook.com>, 
 Yuhao Jiang <danisjiang@gmail.com>, stable@vger.kernel.org
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1493;
 i=moonafterrain@outlook.com; h=from:subject:message-id;
 bh=VpG4nwidpgDqllXzLatya6ZM559BrQia13sMRj/SAJg=;
 b=kA0DAAoWceg4UIuO8EAByyZiAGp9vNSjHQlEcb9EjdLpv+Fnx2ZHfkz4l9Q3T+XGlV9mSIcAh
 Yh1BAAWCgAdFiEEx3DS9jhNtC20TLRjceg4UIuO8EAFAmp9vNQACgkQceg4UIuO8EDvZwEAnaw5
 wS8HmZVvjl7Z/YhUflgIhG8lLALa73Cq983JJgIA/2r6v15+IanMe3rftVpzLwidlGuVhwgCozh
 ut7ZF6/kO
X-Developer-Key: i=moonafterrain@outlook.com; a=openpgp;
 fpr=C770D2F6384DB42DB44CB46371E838508B8EF040
X-Endpoint-Received: by B4 Relay for moonafterrain@outlook.com/default with
 auth_id=909
X-Original-From: Junrui Luo <moonafterrain@outlook.com>
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
Reply-To: moonafterrain@outlook.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

Two independent fixes for coresight-etm-perf.c, both tagged for stable.

Patch 1: etm_event_start() shares one error label between the initial
start and the PERF_EF_RESUME path. Taking it on resume skips
fail_end_stop, leaving the AUX transaction from the earlier successful
start outstanding while the event is marked PERF_HES_STOPPED.
etm_event_stop() then returns early, so the AUX handle, the sink, the
remaining path elements and the trace ID are all leaked.

Patch 2: etm_event_init() accepts events with both attr.exclude_kernel
and attr.exclude_user set. Neither config parser ORs the mode bits, so
ETM_MODE_EXCL_KERN is overwritten by ETM_MODE_EXCL_USER and the tracer
is programmed to trace the kernel instead. perf_event_open() skips
perf_allow_kernel() when attr.exclude_kernel is set, so an unprivileged
caller can reach this.

Build tested for arm64. I have no CoreSight hardware, so neither fix has
been exercised at runtime.

Signed-off-by: Junrui Luo <moonafterrain@outlook.com>
---
Junrui Luo (2):
      coresight: etm-perf: don't leak the AUX handle on failed resume
      coresight: etm-perf: reject events that exclude both kernel and user space

 drivers/hwtracing/coresight/coresight-etm-perf.c | 20 ++++++++++++++++++--
 1 file changed, 18 insertions(+), 2 deletions(-)
---
base-commit: f5bbbfec59b4e2fb7520a91de3df8a6174325d6a
change-id: 20260813-coresight-fixes-7d90d0240dda

Best regards,
-- 
Junrui Luo <moonafterrain@outlook.com>



