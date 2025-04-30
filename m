Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3FB51C369D9
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Apr 2025 08:43:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hw1h6CkpVzZ1WBfBkzfAYu3EbWwU7nqNOd7qFsicdoU=; b=xJaIFtAbI6iXXu99F9Uhy1e4hN
	uY/dbYf/L5IQ0KyKS0/nVoawQX/2XpCjmYHAoAMJq/LfmRU+HANtXhGHbIqZOT+9yAfT9LNEKQl7v
	MX15xER4Fgt6HsEcVnQP/A9VviMBiRt15KALpAaHY8aRwD+B23Azz89re3chv28MEBLFDTIXHFtcM
	GQEcCD9O3zPVRk34TMqNxF0Svy2TuejefGDN4GSnO4A8Y4Laxj/viVcUitUm53g3WBBF7LgqJ+ksL
	Gliwy7flISoHOU/jFnT9uXzVHyUS8e0U8SLZcby7GWPtD42VXwJ8y4ar9vIE2pR2QKET69RMTK/w1
	Ph1C9S8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uA32h-0000000CC9t-0YRr;
	Wed, 30 Apr 2025 08:43:47 +0000
Received: from mail-ej1-x630.google.com ([2a00:1450:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uA2xP-0000000CBNx-2E5i
	for linux-arm-kernel@lists.infradead.org;
	Wed, 30 Apr 2025 08:38:21 +0000
Received: by mail-ej1-x630.google.com with SMTP id a640c23a62f3a-ac339f58631so85404566b.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 30 Apr 2025 01:38:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1746002297; x=1746607097; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hw1h6CkpVzZ1WBfBkzfAYu3EbWwU7nqNOd7qFsicdoU=;
        b=XtWyVS4frRa/4QsxmfwF13OrahM1CqLwoDAFODyRcjEG2lMcH9f5wGWCntIcxA3cHR
         ip8J4YY60m8+HT5WJrg3InKlP9qoYZA5wNeIWLeToVV3qyA9Etlr0rTuwQeFdtQVXGts
         XkGRqz18PC+45FMIb/SNtID7TfEbAa0dqfEkM/orij9JQ2fBDf++BgN3fuJoE3pcq27b
         ZR8jdeZMX0H5xl/dtLvvCWm1W6WNi7qQsEBaZrJ5nHd1sRUD1jV+th2Q+fqStrxzuSYj
         fPDdFIljWz3bX5NSARej/uBnGaMVv/DIGcGY15eqCMzhAe3Req+mXc9aHEjcutKGpfqr
         f8zQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746002297; x=1746607097;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hw1h6CkpVzZ1WBfBkzfAYu3EbWwU7nqNOd7qFsicdoU=;
        b=GTCDYUkTHueK71XIuOl1nGt2lttEkTzA8TM1xMF8hlhGsb+KS/0n6GRxIIxVHimT7H
         U9Y782dLfXbeLTlDzPj2vRMnhBVEm9fqEFaiRYZzYpkHYtxtBIM8C/uE8M/QFZErjVq1
         i0MX0pjMuACMNcMqmrgfd2+7BJMwIH99QO9la5QVnUxDhr6byUX0ArQr1TP4bNhTHQ2z
         D/zi3P+a6Zlq7Nj+17qjnnwDezUm7k+dlkjjX1cssOdqCuJEuGBWOkLMqifUE99+Ztdr
         89FGgUzYh8UXGfJ5AYNeQYNo3NcCcK8TuteJAOczNzotwNaBKN7fkY65JJU5L6fE0mG7
         66/Q==
X-Gm-Message-State: AOJu0YwS6C/y3F79w5yLqkkDJDE12pmBeGWjoV9sY2QaJVtQfTLLiaob
	Vm3cVUdYGfFlMZNuFCVu4X91iCqFBHVAjBb2j/OZXKDezlHxic/uc0px1Yvfcl0=
X-Gm-Gg: ASbGncsSMXRMxJma/+l1xZt2k8YuqEdpXKFJN13Tn/2m3NhfzpKF+zEPiBVwNNzdW50
	uVmuD10HYQoNI0OZ+bKLtlOK16Z1acw3hCff+MC/3jsRfJJs4jrdC0t058NJDy7oyvn/lWVS66N
	b5MsFqrsRw72CZcSMgLPNw55j+WN23oLo4tRF5lt3XBgebhBtctLBO7fFIqBg1V1BR93tECrpJu
	OME61PLAQfKXrGtPmUCCpBOB9ja+elcDQ5R8F0h9l0UO154Zan3vXGLCD/QA3TAhY33tRG7OaWd
	LRgb83KyO0c+MnUDtVAcUhVms6YeMmLJ8bWUZq7fnznuU1E+tsn+h/3sHXmWf4YbISu0LLK3iQ+
	HcyXm/1azcHo8viek9YfltwJnSXEIQw==
X-Google-Smtp-Source: AGHT+IFqkJthPFAOd6c/6owM9CGgAK4lDSph/qo6ciNRRRzE4a0sKhq9+GnkkHtvadbY0MtJiZLKgw==
X-Received: by 2002:a17:907:f497:b0:ac7:9237:60a8 with SMTP id a640c23a62f3a-acedc610398mr81783766b.9.1746002296958;
        Wed, 30 Apr 2025 01:38:16 -0700 (PDT)
Received: from mordecai (dynamic-2a00-1028-83b8-1e7a-3010-3bd6-8521-caf1.ipv6.o2.cz. [2a00:1028:83b8:1e7a:3010:3bd6:8521:caf1])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-acec668dd9csm245517466b.96.2025.04.30.01.38.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Apr 2025 01:38:16 -0700 (PDT)
Date: Wed, 30 Apr 2025 10:38:13 +0200
From: Petr Tesarik <ptesarik@suse.com>
To: Will Deacon <will@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-rt-users@vger.kernel.org, Valentin Schneider <vschneid@redhat.com>,
 catalin.marinas@arm.com, kernel-team@android.com, Mike Galbraith
 <efault@gmx.de>, Peter Collingbourne <pcc@google.com>, Mark Rutland
 <mark.rutland@arm.com>, Thomas Gleixner <tglx@linutronix.de>, Neeraj
 Upadhyay <neeraj.upadhyay@kernel.org>, Thiago Jung Bauermann
 <thiago.bauermann@linaro.org>, Mark Brown <broonie@kernel.org>, Kristina
 Martsenko <kristina.martsenko@arm.com>, Sebastian Andrzej Siewior
 <bigeasy@linutronix.de>, Jinjie Ruan <ruanjinjie@huawei.com>, Juri Lelli
 <juri.lelli@redhat.com>, Phil Auld <pauld@redhat.com>
Subject: Re: [PATCH 0/1] arm64: enable PREEMPT_LAZY
Message-ID: <20250430103813.5bea9f4a@mordecai>
In-Reply-To: <174593068821.431779.9112946165910138990.b4-ty@kernel.org>
References: <20250305104925.189198-1-vschneid@redhat.com>
	<174593068821.431779.9112946165910138990.b4-ty@kernel.org>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.48; x86_64-suse-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250430_013819_578311_6A656952 
X-CRM114-Status: GOOD (  15.83  )
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

On Tue, 29 Apr 2025 21:27:52 +0100
Will Deacon <will@kernel.org> wrote:

> On Wed, 05 Mar 2025 11:49:24 +0100, Valentin Schneider wrote:
> > Hey folks,
> > 
> > This is a resubmission of Mark's patch [1]. I didn't end up changing anything
> > other than fluffing up the changelog.
> > 
> > I ran this under an arm64 VM, added some trace_printk's and checked that
> > sched_switch's between runnable hackbench threads would occurr in the right
> > conditions:
> > o with TIF_NEED_RESCHED_LAZY set
> >   o at the tick
> >   o at do_notify_resume()
> > o with TIF_NEED_RESCHED set
> > 
> > [...]  
> 
> Applied to arm64 (for-next/entry), thanks!
> 
> [1/1] arm64: enable PREEMPT_LAZY
>       https://git.kernel.org/arm64/c/c8597e2dd8b6

Great news. Thank you!

Petr T

