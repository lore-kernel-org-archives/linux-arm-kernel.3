Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2CE4FC02198
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Feb 2025 09:22:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=e9eawh0CQTC6B4XkVXKnBZTw+De/FpP0oA2+UhyUCeA=; b=Ika6jjqIjihCRFPH9Xnz7hdAPZ
	xPwXSNu4E3KLomz84eFmxYJZ1JyynYC4pwpM4We6KIoAhGLT9CFiO/xAZckvArvZbP9ChotrmBr37
	J8An8modxrE8IQ8LakAXmUtgK+AOWoAUL+JnhClLFddIkDplwSMfg7jOLgYWalNjpnE4Q4WsjtNyZ
	h2L/sPt99epccLSpc8PfbCkl+JtjoDM28EemofbkuDDpb+uPZsnj8jxDGBmCl88HuYFZCpN2Qc8Xb
	1UpD+VQBk7/G0emNAo/+zChNLmNWQKRUuGOwMY+k+0kpFFLL8gzTjQVJdXdrTP0kenIE0355Ple1W
	UE47Ml6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tkJoD-00000007UXW-0pdP;
	Tue, 18 Feb 2025 09:22:29 +0000
Received: from mail-pj1-x104a.google.com ([2607:f8b0:4864:20::104a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tkJjF-00000007T4z-2QRu
	for linux-arm-kernel@lists.infradead.org;
	Tue, 18 Feb 2025 09:17:22 +0000
Received: by mail-pj1-x104a.google.com with SMTP id 98e67ed59e1d1-2fc1e7efe00so9293174a91.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 18 Feb 2025 01:17:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1739870240; x=1740475040; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=e9eawh0CQTC6B4XkVXKnBZTw+De/FpP0oA2+UhyUCeA=;
        b=P/LSKq5oh7161q4m5cF0pPUQXgHLa4Na7C6vuCRChPHs2mWMnNQ8bnaFa4r17gW+oY
         UisuP379eVtgefoJLrrDY4vk3op3CmHfWk3PqsZksqnqvwPo6Th5wcPPW4Vo/PF7PUjq
         7xK81sowtEk880WQEa5TK1qmG2GheTZVZpJPhih+WTdSut34aqPVopfHiAaPdDti4yiX
         fFKupGahfQ2YS3r82yHfQ+q7xaFVLYJYz0mHerlMHuTnR/vCoqHdGAtmFCywI87BM/Jj
         LPVH2A/V+Pn0mOcxkxCAt/ABKylx872pOkha+xWaqXY7l2YRTzapLGvlJfJsKOgbo3dI
         sz1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739870240; x=1740475040;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=e9eawh0CQTC6B4XkVXKnBZTw+De/FpP0oA2+UhyUCeA=;
        b=BIU3p5gxq6JJrwhhC93+0PjHRjonUl8vdfXfvexK9T3HnCmmXRRtBCKqL7qLkghFmY
         kemvw4jIiCX2OLIo2IVW0xurb10+dDcgEw7fSXFwZNIeKZ0uFGk5Sk34+cemWolAXU14
         AjH+/VYPCkVkLM/lXMgHfvy9M2XLf9jAcgW3WTF0GNlypAI7tKSAKbZ+ZJJpS0CiL56x
         mPaYTTTRQ1PbxO3s65pzcl4rDFQ40nY8xuz897da2BLH5De3czyukB7gRkVsrJBe1DqJ
         qwHenYlARhdt0rB0VjnI9Y8ZKcAw6KIHA4s6zoBpS+C+8GfHdaRpu+KW272FYd8wXc5w
         uJ+g==
X-Forwarded-Encrypted: i=1; AJvYcCVFptydtw4c2F7PHggcwiZinTH9tCmQaF+wb+tFKBngPCxfk3MmIX/MXrLHeS3VQTGCRBpq5tJ1GNE3p1HrdhGL@lists.infradead.org
X-Gm-Message-State: AOJu0YwrITg2BN2cMIS+NZ/ERaELCO+FJIK6TkCOFZfrIDpE5HcRRr4G
	uiv/UAnOBZgMAB48qGkKVNNTlYcvdIh5rKqb3TgN3YroBSjq6HV6BwT5Zp2a/9Jvg3yhhA==
X-Google-Smtp-Source: AGHT+IGEUf1IAWU1YfH4BCxWMw3DbzclxHXWfJ0bKoh4oebNPcKR4H3sJDIdZaS1HGUEr9wC1aKrwoRL
X-Received: from pfbdn12.prod.google.com ([2002:a05:6a00:498c:b0:730:92d9:52e3])
 (user=keyz job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a00:124e:b0:732:23ed:9470
 with SMTP id d2e1a72fcca58-73261901144mr18452340b3a.23.1739870240161; Tue, 18
 Feb 2025 01:17:20 -0800 (PST)
Date: Tue, 18 Feb 2025 17:17:16 +0800
In-Reply-To: <CAPDyKFor_kP1hcNC1YwLBjH=eaLG9qSyvOYvj+FQrNu8Piu2Dg@mail.gmail.com>
Mime-Version: 1.0
References: <CAPDyKFor_kP1hcNC1YwLBjH=eaLG9qSyvOYvj+FQrNu8Piu2Dg@mail.gmail.com>
X-Mailer: git-send-email 2.48.1.601.g30ceb7b040-goog
Message-ID: <20250218091716.1450623-1-keyz@google.com>
Subject: Re: [PATCH v5 RESEND] cpuidle: psci: Add trace for PSCI domain idle
From: Keita Morisaki <keyz@google.com>
To: ulf.hansson@linaro.org
Cc: aarontian@google.com, d-gole@ti.com, daniel.lezcano@linaro.org, 
	keyz@google.com, khilman@baylibre.com, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org, 
	linux-trace-kernel@vger.kernel.org, lpieralisi@kernel.org, 
	mathieu.desnoyers@efficios.com, mhiramat@kernel.org, rafael@kernel.org, 
	rostedt@goodmis.org, sudeep.holla@arm.com, yimingtseng@google.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250218_011721_613369_BA7BCF7D 
X-CRM114-Status: UNSURE (   7.95  )
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

> Looks good to me. I left it to Ulf, FWIW:
>
> Acked-by: Sudeep Holla <sudeep.holla@arm.com>

> Applied for next, thanks!
>
> Kind regards
> Uffe

Thank you for all the review! Excited to see it in the next.

Best regards,
Keita

