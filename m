Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2446FCD98EE
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 17 Jun 2026 07:41:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JTKHX6NCn7vn/+gvhr4Pc1ts3vNTjwaHvcnrlwVBhzs=; b=ZdJljpNNcR74KgAhvqV3N9d0ju
	N5XdoD8yj6OJBGH+DrTopHAp5P8tf6uSoebWCGO78UnaW8bFLtCdPJJZKKzNUo/UYcToFgcDrID+s
	JiYn5MpJdW2SqnICKE9uCMekrd+jzCISSumR+u+Fn4wwbeSpTK9ihyTj1CFs3gSOXGtNYo7oitjRg
	znBHFxfiD5IoV4SgVgQwUHlJVxT3Nvaxbi2dl8N3RrRFbK7J4oXlhBsF9ZAG8nxfaImDKhxjDxKfe
	TuL+GBUxxAYJZlEFomiUANB8t5W9ClJ9yPbQ+jg0i26AO71PhsmcCTbmAGGpvDPk4uscG8im0aE+E
	k6ohG3NQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZktv-0000000Gq2M-15sI;
	Wed, 17 Jun 2026 07:41:31 +0000
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZkts-0000000Gq1b-3Ybm
	for linux-arm-kernel@lists.infradead.org;
	Wed, 17 Jun 2026 07:41:29 +0000
Received: by mail-wr1-x432.google.com with SMTP id ffacd0b85a97d-460166910e6so2892465f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 17 Jun 2026 00:41:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=0sec.ai; s=google; t=1781682086; x=1782286886; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JTKHX6NCn7vn/+gvhr4Pc1ts3vNTjwaHvcnrlwVBhzs=;
        b=WPAwDyKj+i0O3Zt+7lzhpH+oMizxO94WTA1T6CuOJK83TC6UcJAG/FGyVvRcZg0040
         Cz4cPDKre4oC+NuYUmYrZw2cfQypHMnJGQ6WdBH9GhEOfn3OS5fn35PPnMA/f+d3M8Nt
         EubiIqz8cVK3LxreZvN8hZJ1HChMRZwb5m1HzrNuThobfC30qB2YdaWqoZaj8LGHVgGx
         bSoaaCzNwW1mUjeIW8lE5QbhcjS24VfQDztSKEJNAdCoey78D0yQyMX/jbx/U9oYu0pb
         HGwnC2uUFnga7HNqENgavPksKP784uokAjwhYctkFxQvZnBTymBQfKvPF2dwWnRTaMK+
         pCrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781682086; x=1782286886;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=JTKHX6NCn7vn/+gvhr4Pc1ts3vNTjwaHvcnrlwVBhzs=;
        b=m0iSyTHgPpIS6b1RtayJHfpq/Dx/zxmmuXOGKya3Pzkn31KP6zRjcgCL5UtblLupnq
         P+mymE7Re8ITqmE2ZmT/ezqysrAjaK6ZyQuLR1H/TvpiuTJV+pmD/LZ9A47ppFEOzCZ4
         zIm0It2ifGri05//qppTEcaPWhTDzsY050E1KCfLZmSUZfFcx48Pv6ejHs4uqNP3vRbM
         yc0oXMpI5JvoOOeck2VUKAafAlrAL3afzB9hjmR/4oYIYslkZZONYmficRjt/Cnw+iBC
         JXTHjFKjKSpLbHN/ld5DF468Jb9hP089NFpYi5mnf1hWDnIvzdY6gGDBlzrU9S7Lr0j/
         Zzag==
X-Forwarded-Encrypted: i=1; AFNElJ8vJ1JWJDGB1AZg9/jfLglxxxGRrLkaeGzCGaspVrgFakapBJvbOZDobhPsWah916BLWpMdYXvkRbPfuzoZ+JyD@lists.infradead.org
X-Gm-Message-State: AOJu0YxkDuav+Adwr5x7883S3GUG9CdAUPBXzDxuR5zgLiFcXHfHIY3J
	bGh/+BDkM6N/Cma1+F8hB9tR/IUbDoR9FRmcdj2h8Vl8O2E5uQUAl5XLkl83herYapTz
X-Gm-Gg: AfdE7ckrW+dA6ix1cFbGGiWVi4Xc1mj5Hjz6V7HECTkhWLM+p7zQbJo2su5HNdOoDDx
	4f3ifJcU4U9SMb8ioW5ZeWwLokCfY1uSPgn7FPdV5DhhWr9Toz6+tRhw67lD8UJFnY8rGT2znu2
	EgJkKw7ogxhzxTzSF+qc2SwFqwAWF0v0iPwr+rpgALFU0bKfONiR01KMdcc4wpgJea3bORBazGy
	tlJG8z/gA7vKSn33h5urjrp0Ty3FetNUnhbOad1BbNP53gwMw+BsL2i0hCLNZVpLXfOr3xpXNJ+
	yi6pG1Hk0uaH4rSRITebbyeAwSMoMmXcgeHm4HQsxjiwW7Pwg4cTNwnOQKKWll+YzILX/D8Pab2
	wDdaU2agdmkOQ+22bisoQ76R9nNsbshtfVH57yHYza4A7kyAS+ORK9c0Pl9l0x6JSM+bLc8z5Ky
	jxI45AVQ4J52IPOqWHHNT+b1fNTZKrC9tz45K2fbCOggbQMgFHLj0Y8GrMFU4peT9FmUgNNZ+sQ
	ehplwvtsZ/bP3GY3a3ixMYipAY1jqjKY2c=
X-Received: by 2002:a5d:6a87:0:b0:460:25f3:b25a with SMTP id ffacd0b85a97d-46238f980ccmr3573765f8f.34.1781682085876;
        Wed, 17 Jun 2026 00:41:25 -0700 (PDT)
Received: from PeakBook-Mini.tail8e484.ts.net ([178.197.218.209])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4606f26434dsm52677098f8f.1.2026.06.17.00.41.24
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 17 Jun 2026 00:41:24 -0700 (PDT)
From: Doruk Tan Ozturk <doruk@0sec.ai>
To: neil.armstrong@linaro.org
Cc: mchehab@kernel.org,
	gregkh@linuxfoundation.org,
	hverkuil@kernel.org,
	jbrunet@baylibre.com,
	martin.blumenstingl@googlemail.com,
	linux-media@vger.kernel.org,
	linux-amlogic@lists.infradead.org,
	linux-staging@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Doruk Tan Ozturk <doruk@0sec.ai>
Subject: Re: [PATCH v2] media: meson: vdec: fix use-after-free of decode work in stop/close path
Date: Wed, 17 Jun 2026 09:41:23 +0200
Message-ID: <20260617074123.32464-1-doruk@0sec.ai>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260616074952.93076-1-doruk@0sec.ai>
References: <20260616074952.93076-1-doruk@0sec.ai>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260617_004128_902786_45CD252D 
X-CRM114-Status: UNSURE (   8.13  )
X-CRM114-Notice: Please train this message.
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

Please drop v1 and v2 -- both are wrong, and the sashiko review was right
about the deadlock.

The underlying bug is real: vdec_close() does kfree(sess) (and
v4l2_m2m_ctx_release() frees sess->m2m_ctx) without cancelling
sess->esparser_queue_work, whose worker dereferences sess->lock and
sess->m2m_ctx -> UAF if it is pending/running at teardown.

But cancelling on the streamoff/poweroff path can't work:

1) Deadlock. The worker takes sess->lock. For an m2m fh the ioctl core
   takes m2m_ctx->q_lock (== sess->lock) for VIDIOC_STREAMOFF and holds it
   across the handler, so vdec_stop_streaming() -> vdec_poweroff() already
   runs under sess->lock; cancel_work_sync() there waits on a worker blocked
   on that same lock.

2) Use-after-power-down. v2 also cancelled after vdec_ops->stop(), which
   power-gates VDEC1 (__vdec_1_stop()), while the worker still reads a VDEC1
   register (vdec_1_vififo_level() -> VLD_MEM_VIFIFO_LEVEL).

The only deadlock-free point I see is vdec_close() (the ->release fop, not
under sess->lock), cancelling before v4l2_m2m_ctx_release() -- but that
still leaves the threaded VDEC ISR (amvdec_dst_buf_done() ->
schedule_work()) able to re-arm the worker, and there are adjacent teardown
issues (esparser_isr() vs the dos_parser_clk disable;
vdec_decoder_cmd()/esparser_queue_eos() without sess->lock).

I don't have Meson hardware to validate a corrected fix. Is a
vdec_close()-only cancel (plus quiescing the VDEC IRQ outside sess->lock)
the direction you'd want, or would you rather take it given the HW testing
and the surrounding teardown concerns?

Doruk

