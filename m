Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 575FAC43458
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 10 Jul 2026 07:52:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:References:
	In-Reply-To:Cc:To:From:Subject:Content-Transfer-Encoding:Content-Type:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ihT/2aOY8wGTL01WDNL3ZSISpn356Jmov1yxoJ5Q2Is=; b=LtvJ0r/qBdYzIFyzX9ItbOFgqk
	CX0Q9bAKpeuaq+txoyi4VcXcjF3GDC8w/beDkb176evlQLZrgus5xYZ4tb+gfaYTOHztwIESmN+W3
	zS9yRgsqAx1DsIyG5288yWgLls5mfdsHOxlqQrxWg912PgdMNiP9VPfUc+1NR3bXP2yQaRejvDOIH
	qRVXdxvOkqAkbj+4oTUgN2r783qlVXcGQtsqKJ1ds+viVL3N5TOY/QMrzleQl7LcT9Mvl1f0iU3Cu
	KCBjvuz71eFZ1Hbe8gf+3e6xPKBeHdhFQuP9JEXNay9q0wHIj/wj499flzblW5e3p5vSgqv/PoXSo
	P9Gia69A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wi62T-00000004NYk-3iPi;
	Fri, 10 Jul 2026 07:52:49 +0000
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wi62S-00000004NXR-00iy
	for linux-arm-kernel@lists.infradead.org;
	Fri, 10 Jul 2026 07:52:49 +0000
Received: by mail-pj1-x1034.google.com with SMTP id 98e67ed59e1d1-3811f512167so898592a91.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 10 Jul 2026 00:52:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783669967; x=1784274767; darn=lists.infradead.org;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=ihT/2aOY8wGTL01WDNL3ZSISpn356Jmov1yxoJ5Q2Is=;
        b=o2/OeIJwAduWZozbURAfY5sS2wMlzfFGLQfsJRzbcQ5eQX49+sr9OamSHDKlhIuHW7
         fC+QgWU8CMGFS7lET98lGV2TIegQMPohb91Y3nxVzYO/jw2CvyMV5SOGSjnYmmUVrD12
         Ut/AnrOU9w1QTdr27q/nojaT4lRm7+yJnVmvDLPEqjEwmRbzRGvq1ObX1/ZxInYiU+vd
         I9s/n9enovUverUJJCfTrU5tEGLl2En/sVlhZEsDz5+tiP3q4GjCtIAME+bqiDMICB+/
         QhnlDfjV+H3hfrfTQleVppm3tMRO34j7DtrUBfzXPe70F5YWNL1AZYr3CJtvfrsqYR8S
         3RMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783669967; x=1784274767;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ihT/2aOY8wGTL01WDNL3ZSISpn356Jmov1yxoJ5Q2Is=;
        b=ojJ4GMBhnHo6tuGvcdTEtn/Eah3smIKMlo44yV4zEcraiPR+24ZeswX5pLZU/qpbRs
         oIoj3w7EXOR6PNqof6RAA5s3KuPZzRoe3QFYTEOlYmcQpEtBPY4CGiynhC7inoBIQQLN
         GKHmAsdfANuKuaT/dd9aIGDXgsRBlV6tftsvafY3mhQ3eJ3uYnXop6p3zJrWFfWkl4Ng
         NYjgW9yIEkMNJiLC5lAyKByaFmTb8HXC9jq29YA3fRXuoTZ6L3lbOaLRwaIYZ/cUUBdr
         XziizepTdh9KJaqodhpsRl6GEyQpHIFJzHGmnX2wePqBmlvKFHXMRNGgQWJHMVUxmSOI
         jFdA==
X-Forwarded-Encrypted: i=1; AHgh+Rqb4D3g6xUguC4T0Nc3vvb4uEEsnC1h8fqLoJ/cdpDppWwBQT1Rfdo34OKAe1ULnYuVQuOs2+mIplpWZKlyu1mA@lists.infradead.org
X-Gm-Message-State: AOJu0Yxcplw67kJRnGYb/jDLXeWJM9lRYzUxOb/lkSYVTmcMFFOtxs9G
	Yvg9Vfw3MfoIvXG/dlrYtxBliaerGms+lCBAgAGp0LQk/5BUIJ9pfrsW
X-Gm-Gg: AfdE7cmNGDJM8Espnv2P1eUEI7ta94mDPM0sscUVux/EtoAZCVt6BZxMpdYZ97QEaMI
	R5HU4lrPgOKEkkmyFJulG70xSxLHr3x5TBt0CCxleS8BPKXf0h/sor4kZ0e0gvBpVVVlccXI2QR
	C1IQ/oDRTv+JtNPWDOKW80QL/PP5kPvKFKp0S8+0tV4UeEfJDR1QrbRv3fENwrVaNqZp2a9pxoP
	MxJHfgrYriUI2jvJI6BNos5FGmJ1XLwOWa7SGzlJC8MDzkKUJBXojDLzDZftgV6fR4YmCMlKM2U
	/h0plT118cAU3s9Hj5h0MJjtXGzqlQnbJwYzlUOlwtRJR07X5zouKY2NBUf5e5C5Zi0U3P8COv8
	bauMmk69vCryz50xmKbdipPS5OwRjqH65VoK4ZTcXs3B1YYCYy6XXJ/qVMRFPsSMZCVrl1n8ZWU
	5dPgUj3KGzkLN/iQB1Z9nV2grct4uG7+kpLIdRmEAu
X-Received: by 2002:a17:90b:254b:b0:381:e73:3c2e with SMTP id 98e67ed59e1d1-389416e7dd1mr11435912a91.24.1783669966472;
        Fri, 10 Jul 2026 00:52:46 -0700 (PDT)
Received: from [10.0.0.65] ([2601:647:6700:64d0::94ac])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31174839f89sm38555369eec.10.2026.07.10.00.52.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jul 2026 00:52:45 -0700 (PDT)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v5 2/8] arm64/runtime-const: Use
 aarch64_insn_patch_text_nosync() for patching
From: Charlie Jenkins <thecharlesjenkins@gmail.com>
To: K Prateek Nayak <kprateek.nayak@amd.com>
Cc: Arnd Bergmann <arnd@arndb.de>, Thomas Gleixner <tglx@kernel.org>, 
 Ingo Molnar <mingo@redhat.com>, Peter Zijlstra <peterz@infradead.org>, 
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 Darren Hart <dvhart@infradead.org>, Davidlohr Bueso <dave@stgolabs.net>, 
 =?utf-8?q?Andr=C3=A9_Almeida?= <andrealmeid@igalia.com>, 
 linux-arch@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Samuel Holland <samuel.holland@sifive.com>, 
 Charlie Jenkins <thecharlesjenkins@gmail.com>, 
 linux-arm-kernel@lists.infradead.org, linux-riscv@lists.infradead.org, 
 linux-s390@vger.kernel.org, Jisheng Zhang <jszhang@kernel.org>
In-Reply-To: <20260630045531.3939-3-kprateek.nayak@amd.com>
References: <20260630045531.3939-1-kprateek.nayak@amd.com>
 <20260630045531.3939-3-kprateek.nayak@amd.com>
Date: Fri, 10 Jul 2026 00:52:39 -0700
Message-Id: <178366995928.1208691.248201589452077852.b4-review@b4>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783669964; l=559;
 i=thecharlesjenkins@gmail.com; s=20260605; h=from:subject:message-id;
 bh=D9CFIdORg3KDPUuWXmjAR2RsP8Zpq9G9I7JzBgl41j4=;
 b=UkmRaKA4A5laoVQOHeU6g+5KHEhNh4nXv7y+97IHAPLwPizJjZc9yUiwBeTb07rPCZ5L7YjhV
 y/FrmXvAxlqDOKl91ohFaIJIf6Y3Z+PQbXebeX3Uf8dsWUwOiN5UCOq
X-Developer-Key: i=thecharlesjenkins@gmail.com; a=ed25519;
 pk=ajnnRQ98PIdwKp4HeMkq9U32okYbnh6Zb4G3o5XXvkg=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260710_005248_046530_76A05272 
X-CRM114-Status: GOOD (  11.02  )
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

On Tue, 30 Jun 2026 04:55:25 +0000, K Prateek Nayak <kprateek.nayak@amd.com> wrote:
> The current scheme to directly patch the kernel text for runtime
> constants runs into the following issue with futex adapted to using
> runtime constants on arm64:
> 
>   Unable to handle kernel write to read-only memory at virtual address ...
> 
> The pc points to the *p assignment in the following call chain:
> 
> [...]

Reviewed-by: Charlie Jenkins <thecharlesjenkins@gmail.com>
Tested-by: Charlie Jenkins <thecharlesjenkins@gmail.com>

-- 
- Charlie


