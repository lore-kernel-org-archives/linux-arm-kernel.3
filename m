Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68C2DCD4F26
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 23 Jun 2026 05:26:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:References:
	In-Reply-To:Cc:To:From:Subject:Content-Transfer-Encoding:Content-Type:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=euxUr99gVRmTKzYrxOsYTZTBpKcYj3aY+Du6bnH69fU=; b=Uob1ZYtdUK+1Wu3doyh1t/RDGj
	+taXfn1auJOG6awyZ0XboNf1DU718cDQMSKAT76sP/cyiV2DV13+olUF41Fu3kip5p5Smx2VLWfAH
	L1B7ObHXCJUmlm8dnF73hNHnkZnwL+OwoXEB+eAJg217Yk4YT4erenRo9FDCQ9vs7bzOzonwWdp4Y
	ELPIaITd6+FTKlT/Wm67cXRWkWsi6yKSt7KCdjN/rZYGNcDgeQCNNn+C+1ml8N9UQofHhv25B+MlA
	XZQeeIpFihGiwQvgHMiF4kP4kJXLhFwEpaNmivydidQHmA/TZDARH+R+nHCW6n81/E21a4ezy6YYD
	65DW8rjw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wbteC-00000005iRm-2GZc;
	Tue, 23 Jun 2026 05:26:08 +0000
Received: from mail-dy1-x1335.google.com ([2607:f8b0:4864:20::1335])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wbteA-00000005iQK-3G5i
	for linux-arm-kernel@lists.infradead.org;
	Tue, 23 Jun 2026 05:26:07 +0000
Received: by mail-dy1-x1335.google.com with SMTP id 5a478bee46e88-3078e0dcd67so6170874eec.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 22 Jun 2026 22:26:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782192366; x=1782797166; darn=lists.infradead.org;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=euxUr99gVRmTKzYrxOsYTZTBpKcYj3aY+Du6bnH69fU=;
        b=oFbm8EECnXFpNnbS7qJPQu7NogfSCzFBpENsQd42ptH8hUZC0g+BEFkjgmF52iBxsu
         XJXkxEOgU4PTAWTNDXm2w4nXH3c/BB88U7xk48fPOHDavApiL/cw8+l2w90c1Ei2jNUn
         /IEP5UqBEwZoSthGK88I19MKCzFScGg4yfBxz3OQlH70Wy9/HSKLKdmf5piFp4MAIUct
         o8IRN0BmU9+DnvPoAIob7ucKe2inULCVjGtxErH9PL9fscjUbpjgMQBAma5qdybDnXux
         hPf2VCB4nGop82LGf3iH1jW8Oc8uWwY06TlSh3ggHVuuRR2ZagJ/IOqdTfEoLBJy0XR7
         fHqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782192366; x=1782797166;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=euxUr99gVRmTKzYrxOsYTZTBpKcYj3aY+Du6bnH69fU=;
        b=COZUAM+rWVpcvgj7QBjDhXqdgGBLQp+0y3Nx2Gwl+bLb4SnIWUf4+iH20xUQ9B65I8
         iwdX65o60I8pQaM3EcDOpWkCtwBQCXU27njDm1WEg5Guyw/PRzN5vaDMUEbT4ClOBXxA
         HlmSehAGhizT3mziE8YtSvzZAHYzTsTewl9FDnJ95dnQwCFZzmzFxby2sZEjpMV6zoxv
         fw1Ttg/XXXuK4Jg1NdEP7UvlEdCXCwRgh0aX3fHL3nyd40Ww/ct7uNovWsQvaeVj5o7A
         pjiGTxGOKfP1dGSlzsmr/m6EdPqjR4tPHQUUSJylo3RVY+naVelTMvLSWvydNb4+4lP+
         yQEA==
X-Forwarded-Encrypted: i=1; AHgh+RrzdviaoOK6Bwb92VI+jSupWovLytRxv1ZtrRBV4YFsfa/7TifaTkBmc8O+o+Bitc/FfEGJ6vrMsrXnk3PlL/IF@lists.infradead.org
X-Gm-Message-State: AOJu0YwI8Wr34sWa5f3v/HK00usM3g61BVt9V3OMBCtuHl6FMijl9/ST
	gVXPFjMCaMjgpIDtyzaqIiHMQAEy2c1FDn6l2clOOgM0aC79iHqKTyXN
X-Gm-Gg: AfdE7clM6C7fQC45h9sJEOwAe2efY5HFrYvr69DbtYfdBv5NxcpgwtX8nEL9+4hL1EE
	ye/vFhdK9tzeTofT8rzEY2/o9wjd7yUHvsoSAyIYceuvEBO3DQqGDhXsV+5ztQNezjKLvK8GhgF
	K8YR7qKK61czraTChPlm+aVuLjRK4T8jn4sYMNDMYHVLU2X3/XPqRa3ZGX3Enq07ftm+0AGElao
	Z2LOTuB8ilZuzrbCRQw6XC6wOuZoZm1lnVfQ52kMxuVcpQLjUz+Z35znHGnqwnI0OjBPgtkAc/s
	hNZPKLZV0SIU3+qDeh13y8u48ubDlwiGErIBAFBkZLS9MwGJt6pfbTt/c5CKkiafI9EH9wLkn5J
	JgwLZpcyiRFqHEpIFgNF1ezrBE2VumCcqSCKBjn+KWT29tzF1ZOKfY5S5UgDxhb1ktLnqJLrW1G
	xtbRwhrlU=
X-Received: by 2002:a05:7300:fd04:b0:2ea:c085:44b1 with SMTP id 5a478bee46e88-30c5b87a4c0mr708300eec.19.1782192366092;
        Mon, 22 Jun 2026 22:26:06 -0700 (PDT)
Received: from [10.0.0.65] ([2601:647:6700:64d0::92d1])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30c1be4967fsm13102455eec.26.2026.06.22.22.26.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Jun 2026 22:26:05 -0700 (PDT)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v4 4/8] riscv/runtime-const: Replace open-coded
 placeholder with RUNTIME_MAGIC
From: Charlie Jenkins <thecharlesjenkins@gmail.com>
To: K Prateek Nayak <kprateek.nayak@amd.com>
Cc: Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, 
 Peter Zijlstra <peterz@infradead.org>, 
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>, 
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Guo Ren <guoren@kernel.org>, 
 Darren Hart <dvhart@infradead.org>, Davidlohr Bueso <dave@stgolabs.net>, 
 =?utf-8?q?Andr=C3=A9_Almeida?= <andrealmeid@igalia.com>, 
 linux-arch@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-s390@vger.kernel.org, linux-riscv@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, Alexandre Ghiti <alex@ghiti.fr>, 
 Charlie Jenkins <charlie@rivosinc.com>, Jisheng Zhang <jszhang@kernel.org>, 
 Charles Mirabile <cmirabil@redhat.com>
In-Reply-To: <20260430094730.31624-5-kprateek.nayak@amd.com>
References: <20260430094730.31624-1-kprateek.nayak@amd.com>
 <20260430094730.31624-5-kprateek.nayak@amd.com>
Date: Mon, 22 Jun 2026 22:24:56 -0700
Message-Id: <178219229642.10927.5804159175321604816.b4-review@b4>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1782192362; l=610;
 i=thecharlesjenkins@gmail.com; s=20260605; h=from:subject:message-id;
 bh=n+I3lxePERllHyfwEWyDEAhZnniet1N62LffQ9iv1A4=;
 b=BbyI070isif1KhCepDopyZNJYOc01bHzD6A+jVT3UijnT3HrwXWLYOswSXorRMeV+HlI4Inun
 OKgODIqIXrUAHVTJFNoyMxYBsj+Slz8Acjz3vKWxwe3qbx4eUZs6N2L
X-Developer-Key: i=thecharlesjenkins@gmail.com; a=ed25519;
 pk=ajnnRQ98PIdwKp4HeMkq9U32okYbnh6Zb4G3o5XXvkg=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260622_222606_843468_F2C875E5 
X-CRM114-Status: UNSURE (   9.37  )
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

On Thu, 30 Apr 2026 09:47:26 +0000, K Prateek Nayak <kprateek.nayak@amd.com> wrote:
> Define the placeholder used for lui + addi[w] patching sequence as
> RUNTIME_MAGIC and use that instead of open coding the constants in the
> inline assembly.
> 
> No functional changes intended.
> 
> Suggested-by: Guo Ren <guoren@kernel.org>
> Signed-off-by: K Prateek Nayak <kprateek.nayak@amd.com>

This is a great addition, thank you!

Reviewed-by: Charlie Jenkins <thecharlesjenkins@gmail.com>
Tested-by: Charlie Jenkins <thecharlesjenkins@gmail.com>

-- 
Charlie Jenkins <thecharlesjenkins@gmail.com>

