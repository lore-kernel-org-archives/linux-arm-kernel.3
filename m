Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 023E6C61DFD
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 31 Aug 2026 18:11:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kXN0jN3MnwKVM8KAifDf5fdFy6y48QrMJCG2ssDq6qc=; b=fifcRtxJEuneiHdo0wSl7FP4Fv
	7aMgmdqI/DVQ420we00vQCmNsxpijmUgnOPnhwXff63kzf4ZTToQ6nIYEYo7IP6rTXmEl+FRIzljn
	dM22PHAm9w35q1+MEUFDUvXYIg9x1r4wG2ggY3tEPGcEfJQjI3TamMZ4SPw9UBZ6UtphocoUgWkzz
	maFHfpGNizlIdM34DHRVNKmw0A0JsCfoRgdCqOzW8Pm5a2qMKQTkPb6AxzxyAFkS7NC2mVxnrTasR
	hGxzCxML4uv5P2RCH28BuNtSrEpoleomXdA+7LzkRSLCx2Ng8rhpoCIbawNdQRLOp8xwq4gfGW15E
	yVZjfiLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x16To-0000000AG0d-25L3;
	Mon, 31 Aug 2026 18:11:36 +0000
Received: from mail-pg1-x530.google.com ([2607:f8b0:4864:20::530])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x16Te-0000000AFwN-1ksC
	for linux-arm-kernel@lists.infradead.org;
	Mon, 31 Aug 2026 18:11:27 +0000
Received: by mail-pg1-x530.google.com with SMTP id 41be03b00d2f7-cc11a905ba5so51454a12.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 31 Aug 2026 11:11:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1788199885; x=1788804685; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kXN0jN3MnwKVM8KAifDf5fdFy6y48QrMJCG2ssDq6qc=;
        b=O+QZdNwR9z63CL5+hO8tG0ml+tFr0y4ocNr4eKNmRQWVldLZagUuiqrKiYw0sLwvUq
         73XSGaZ6nmxgYbGYzymFEHGHDVjO8YNVLs/DEfw2i8X88QwKWFnkR/xWmgrJU/N9gzeK
         dGsPHuiWiCxg57qyMyNWFg5+ImROt/Gk5Isfrw2QnbcJ+lx3u+OkIzs/GlKNPwE7e1uc
         r++EEl8kPJXNK1Wnkr5jK3gN+NX2LbFYxRK3WgDG4PjOW5iJoRyPcg82HZ9ZXEkooJxt
         N/l0aqcPyZ+qjHAEGCLg5Rm/1qwwb8pdVYen6lOm5XmY+nPgcUqpDX/Ia3WTWx67LWaD
         RYKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788199885; x=1788804685;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kXN0jN3MnwKVM8KAifDf5fdFy6y48QrMJCG2ssDq6qc=;
        b=D60jvIKdHhSeVnzG4UORU13QbK+YMoPdVgq3MUhKy8fCtkanWzKsIs3ElN23kcDvIL
         UaEzla0WeGt68/869vM0ef3bJ5MMjH2oCnW2XNqKH3nL4HpKSNbMVB1/nnRSGCRUU5k6
         Mjmkg/CWCZMKmxxEmdE6uW4d4jk4n6mRFd2ldZy81AefylMgSxFWNvzRzEgymuyZThYJ
         6BUTdcLuX+FzckRgBlnKzu5oqg5/Vk8pSVDZCYutseaFgvZtoGex6tnT7j2bVukZk7sc
         xQ64Wpfc4jQQy7UTo72xP2L3ns0Xp9ZfNhQwVnqc+btsQAaXV7CPOGF0IUdjGAs7t/Qd
         GLlQ==
X-Gm-Message-State: AFuF++ku4Sy2H9Ztl6HxZW7/MOXUlm4cdytDiuayaqBSQ0NmpBQ6UHO9
	a86jrRZpfJyEdqv3iLCHYaayk2x/mKcT7DUEvghn5Zh4tH3wc9qSUGNY2tlSSbOor0s=
X-Gm-Gg: AYBFou3Kr/B5kgorxYsikiU1phVOiK+VBu4umWSHZe9ckdtKOe+Oz8oJB6LMBxexjyQ
	FX3zHpyZzfLNAkjZgIIWHdbaigJLUv5RS7CNKQoKbo8CjpUKsu3dwZkwR7s0ILJG94JmLZK1QN7
	umDFFJUs3yU5eEUS4ghN28XQB9Y3tzrq6chq7zI9byanmLGgC6sD8ZcWyuMfJAMnzXLyTodOo4G
	SIoJfZptyXiN90KtR7xCyEQHoPSHFGMUlSJl9bsFW7raMhRw0CFoHgsvvNqFhfJYmCg7Jl0MaTv
	6FMkOuTTAUzJLy3hPI3FvXgYOgkDXFBPLH/KTm0q+u9Tu7m9JLmnItbebNQf48GaSfer5j57XCs
	LOkNULDA8ueGOKQJxcPZ+BsiELwignE4LF2ZjdtMI3yi9cu30QYpnM8VsoW/otAUgrhlE0gBcND
	veG8rNrrcuh5+FjOPdOY1Nq1D0qvKex4EpXbno+E1UmXH3DlSnhiWBAi2DbA==
X-Received: by 2002:a17:90b:5626:b0:398:9bd1:3216 with SMTP id 98e67ed59e1d1-3989bd135fcmr31021574a91.23.1788199885347;
        Mon, 31 Aug 2026 11:11:25 -0700 (PDT)
Received: from localhost ([71.212.197.238])
        by smtp.gmail.com with UTF8SMTPSA id 98e67ed59e1d1-3990d4ede7csm759296a91.13.2026.08.31.11.11.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 11:11:24 -0700 (PDT)
From: Kevin Hilman <khilman@baylibre.com>
To: Russell King <linux@armlinux.org.uk>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, 
 Arnd Bergmann <arnd@arndb.de>, Linus Walleij <linusw@kernel.org>, 
 Eric Biggers <ebiggers@kernel.org>, Takashi Iwai <tiwai@suse.de>, 
 Kory Maincent <kory.maincent@bootlin.com>, 
 Andreas Kemnade <andreas@kemnade.info>, Sen Wang <sen@ti.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260709203757.2401699-1-sen@ti.com>
References: <20260709203757.2401699-1-sen@ti.com>
Subject: Re: [PATCH] arm: multi_v7_defconfig: Enable SND_ALOOP
Message-Id: <178819988433.2869653.5088764257816495977.b4-ty@b4>
Date: Mon, 31 Aug 2026 11:11:24 -0700
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16-dev
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260831_111126_483592_C6EEDBE8 
X-CRM114-Status: UNSURE (   8.90  )
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


On Thu, 09 Jul 2026 15:37:57 -0500, Sen Wang wrote:
> Enable the generic PCM loopback driver for arm32, matching arm64 defconfig
> (commit 7235cdd9cc52 ("arm64: defconfig: Enable SND_ALOOP")).
> 
> snd-aloop provides a virtual, cross-connected soundcard useful for
> routing audio between applications, capturing playback on systems
> without physical audio hardware, and automated audio pipeline
> validation.
> 
> [...]

Applied, thanks!

[1/1] arm: multi_v7_defconfig: Enable SND_ALOOP
      commit: b45c06f362ee5ce9ef6402fcf57077a740cf1063

Best regards,
-- 
Kevin Hilman (TI) <khilman@baylibre.com>


