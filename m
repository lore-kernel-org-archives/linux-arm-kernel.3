Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 253A5C44506
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 10 Jul 2026 07:53:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:References:
	In-Reply-To:Cc:To:From:Subject:Content-Transfer-Encoding:Content-Type:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hBmrtvJxIONdnfaPYnlm/oDBvJlVXO+AfljQowycHCs=; b=d5HMGeEsHHnPUxkomhhTkBZlZO
	S2Y8VwdGKGK853peX99IxawDWjVA+MLYOaUOjhzC+iGhtmIcFv9r+Gree+3x0GzUt8LwqWRUg70l+
	IncnOeLHtlXbz/Z6FgDgREAUB7ZT3ODOsA3NaakeRU6NGoITlPcSLBR4zNOo+w5DeXesfJYQ+ie4o
	7syNlCI70hJUvAyLCUaeY1BAuvBOVOyaAAHPNHZisF+Zo1h0WUXBh0plwehNrgr7Yslf76Ikbeclw
	w0vU1kuTmdFWOpjSKRlU4nmKqCD82PMi07EM8ZPG9Gtz1nD3IDykgNLztReybox678sYGe4YbxMIu
	4CU4YZBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wi62Y-00000004Nbi-0W0g;
	Fri, 10 Jul 2026 07:52:54 +0000
Received: from mail-pg1-x52d.google.com ([2607:f8b0:4864:20::52d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wi62T-00000004NY3-1McA
	for linux-arm-kernel@lists.infradead.org;
	Fri, 10 Jul 2026 07:52:50 +0000
Received: by mail-pg1-x52d.google.com with SMTP id 41be03b00d2f7-c9fe3c9bd5fso1285991a12.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 10 Jul 2026 00:52:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783669968; x=1784274768; darn=lists.infradead.org;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=hBmrtvJxIONdnfaPYnlm/oDBvJlVXO+AfljQowycHCs=;
        b=R0QkoXI6+PUL3AJlQ4TGd2S67FP35i+VY/hASp7lC+ISkVNKM6A54OkWkvN1QfvesU
         f9ElaIfroy2e5PXu8UVGwjhwtKwum81xYfzli96jTBjWAY2OozqUrMHXsMXms9J9kZ2Q
         G/D1peg2vJK56adcxNQysqAZlqBRn2tOCmKaY6AFQv/m5NxsyOgYeRCDxwwQ8oaiOhxS
         imACXxz7u7DR+6wqqzkdzMcgZPsPpiLSW4mOYou3FbJpbp8J0oGvPOOofv/JeGvD8BA1
         VR1fbnAgVZbxWyAzIdJ7C2FulvCFm0SPhQSEHA7/kjupniLw0w9OgNzwz4I3X+K52MTx
         5JPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783669968; x=1784274768;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hBmrtvJxIONdnfaPYnlm/oDBvJlVXO+AfljQowycHCs=;
        b=kSNLOCgCoXNeY53m/F3SbmEhRUTCt2jZdDd8y5xmAstfuV9UOLEzd4zVarlCOV3Flq
         HMR0gXy8yt5wlkRmcqyFy0fySvwte0tqjXoiGiJc9LV+9hYEVd7H5gpoAgg/oxX3S3Y0
         FvT3xmmf5fJjThVM63fZ22hqjhV3Iq0LavCy9ksSz5k82JG9NY76pEZt1VziWw+gXEw4
         AA/PRVY5Cm9nNeJbhjPxmHiFH0X3N9uvB3OY/uWJMfXuYaMV7xEuO30xxfW+dtYAD8IK
         wEvlt44E/KStEjw6IAPCmsdcDfA9IWCWtn2iTxldVwYrckKxl2bXB0XbDxOgcz8VwgW+
         zMrw==
X-Forwarded-Encrypted: i=1; AHgh+RrC2zKj4b1FKZCsxWWzOsOaLof192tGlEquQsIdD1fAy9KwAbLiN5C0qu41+JYpD0M2xcpg30povF6VTOyvPReN@lists.infradead.org
X-Gm-Message-State: AOJu0YxdQxI/9Ea1JJdDEMU405w3odXH80uoJ0TpLAb6be1VhrIA3xwv
	Iw4r6HWHaBAJp7RsOktGacPoeMS6hu5X5FV56f1+tuau/AYsl1fF28Tm
X-Gm-Gg: AfdE7clKoz4YFoV9TXYAIiYIpPx44TAtfmsRoPmucwETjS1vi8HQoUYCIJzFGuJlVBy
	bK9XL9r3bBV84Pcp5VAUZt8jW3C9Cw7zp1CNZqn4v8mqujb9uBjsCZQl5Trr5Jd35YQ/eKRIq62
	A+jvGJCTIxXNUbKP24THWsagM+vriA5zIyeRLtu/wd3wKWOzDrKKat00SFqCoOytj29PSmRQXuo
	fhFGHaQ9/0Wkf/0FgJysN/Yh9zA6SFcWYNH+de3E45DXXOC2oId3Va3kG6r2R7zQD5gS6pH6v4I
	Cl/GLqYzeamf6QjnT44W+o/X7bx+YObjcRN/+UXrnhU/bAFJNTnSzR5zW0LogdlmAY9rjPk/T3s
	gHzgky7OJIknjQsceM+vuiMhsdNN0KTnISV/Vu2sLHJ3ceFCHcDtF1yVSdkCrfV7gLQr/uyLRC+
	EAq0ZmsxVmWpft6dUUo6dFflj84dHJdPUtwA9KiWR0
X-Received: by 2002:a05:6300:6708:b0:3b5:445c:e483 with SMTP id adf61e73a8af0-3c0f085cde5mr3063429637.3.1783669968147;
        Fri, 10 Jul 2026 00:52:48 -0700 (PDT)
Received: from [10.0.0.65] ([2601:647:6700:64d0::94ac])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31174839f89sm38555369eec.10.2026.07.10.00.52.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jul 2026 00:52:47 -0700 (PDT)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v5 3/8] arm64/runtime-const: Introduce
 runtime_const_mask_32()
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
In-Reply-To: <20260630045531.3939-4-kprateek.nayak@amd.com>
References: <20260630045531.3939-1-kprateek.nayak@amd.com>
 <20260630045531.3939-4-kprateek.nayak@amd.com>
Date: Fri, 10 Jul 2026 00:52:39 -0700
Message-Id: <178366995929.1208691.6493654690059057340.b4-review@b4>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783669964; l=605;
 i=thecharlesjenkins@gmail.com; s=20260605; h=from:subject:message-id;
 bh=+O07iyphnPsMhbwdcZl/xEUDllR7WIMFNYTSmUuHDHk=;
 b=cz9XXDbkR0SqPbqmjDnlzBYAVi5QXign/r4fxPETsJQjHLuhqKNi1lidC/VVBt9XeNDUNYCm6
 hNQu7cyMBW+DNBsieROPBZ33ez+ffYUCmOSl5oGIFtaAneSomqGU4B7
X-Developer-Key: i=thecharlesjenkins@gmail.com; a=ed25519;
 pk=ajnnRQ98PIdwKp4HeMkq9U32okYbnh6Zb4G3o5XXvkg=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260710_005249_374672_D5EB64EE 
X-CRM114-Status: UNSURE (   9.68  )
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

On Tue, 30 Jun 2026 04:55:26 +0000, K Prateek Nayak <kprateek.nayak@amd.com> wrote:
> Futex hash computation requires a mask operation with read-only after
> init data that will be converted to a runtime constant in the subsequent
> commit.
> 
> Introduce runtime_const_mask_32 to further optimize the mask operation
> in the futex hash computation hot path. Since all the current use-cases
> are of the form GENMASK(n, 0), with n > 0, a single:
> 
> [...]

Reviewed-by: Charlie Jenkins <thecharlesjenkins@gmail.com>
Tested-by: Charlie Jenkins <thecharlesjenkins@gmail.com>

-- 
- Charlie


