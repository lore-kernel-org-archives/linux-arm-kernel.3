Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9DD6BC71136
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Jun 2025 18:32:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BpmH32X+ubnFGRkDpBaCqaiio/3lQgXW15x6m1ucLKk=; b=IqeXfdAgRaqe7nE/GPfTxuXp2J
	Mm1g/jsU9VsEfY85eU11l0cF+oJImAS4rNZS88cqXCbqKl7IUe3wmkNAcqbvDxxhzHWrW61+OvR1M
	MtqAHpWryxnjh3v4aHfgV3kdlGYQcm3Ko3nr/aibxXgIE9LDvzr80BtT4B3tn1LekH1oQc9YWOa4P
	mLV3xvdA4Fc4v20NUfGN9khaBTXb+iKfAZ/jKfCzzqfJ9YhAap+c+g+qDRuPhiTYsPupRn5FEqC0y
	E8gH+qCg2IdYquII7GHlbVfb19DrIz3LLr/FY1iFlWNcKqhs3g8WClpywjkclEVJm4NYNNbtRkzZK
	FckOkw+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRb69-000000088rn-0nX5;
	Tue, 17 Jun 2025 18:31:53 +0000
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRb3w-000000088i0-0Ain
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Jun 2025 18:29:37 +0000
Received: by mail-ed1-x52e.google.com with SMTP id 4fb4d7f45d1cf-6077d0b9bbeso11158531a12.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 17 Jun 2025 11:29:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1750184973; x=1750789773; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=BpmH32X+ubnFGRkDpBaCqaiio/3lQgXW15x6m1ucLKk=;
        b=DQ9xVzil757vQMpuPnfh3t64SU1L9Gjr5A3dke6352fsxYoS60V+YVcLhZbAYjmBrq
         SrqlBRy4wfc85XDYG4j7fbB1UVoPLvfEQ8RcuBWW7/2NDEv+nTmGd2Vf5htvheEjxns9
         j2X+GMfCcCR9rmbT/bwfOZmIyS0FXvCTTmGek=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750184973; x=1750789773;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BpmH32X+ubnFGRkDpBaCqaiio/3lQgXW15x6m1ucLKk=;
        b=qL4jOHOWKiHBE07hq01GnKz2I+uLlCXepXus+eptzNStS0QVbFuniZmN57aI43+8w3
         umHCnAzd4uqmXaAZCQtQ9ktPEszxRRLuEXrK+EIFQntt5M3/AZESaJufyypF8QGA1K3+
         hLtsZZ2DC8D8GLM8PDe1oMO5klaRIRzvl1wDD/RfMQah/oGu3wgG1nbPtjEFqsQaC6Jk
         K4zThusZ2HLk2H2GfrqKB5CSV9Iuggww46+SQp8SDcKdxC3WIRJ8MI2gglzLZr4zec8U
         sfXrPzO0vlX5tx9/7NG678KOostB5o9KE1ABqsKM+RZTVRJJUrrvMUnOfiAoysEG+EYu
         sCtA==
X-Forwarded-Encrypted: i=1; AJvYcCWlZsScHNPtnrqWFzeGqlmj440pk/j8JgdnVnSBGZlnTkTKZDx24jraqb/+g6U8k8FcTcGJBPAxmP4XH9I30R1z@lists.infradead.org
X-Gm-Message-State: AOJu0YzKvFjW/xSwoV9TsVNG+9ClFCREmIztf/aJWCJMBLmCLyRXvGWe
	d0k2B3hFt+kiqweqy1ebrdJILvxsK3jUjUdZT61P+wHaD4fP16fbCmnGJvirva/M0OOpchc3fbb
	ROtKj3fo=
X-Gm-Gg: ASbGncvD95ogsHT156fpwLwExZnsFqddZ237wTiWZwg+OBhz3OdddJZfvQVzhhgyv/R
	QkO0iD80Lg8vt+5FzX7vu9jAXmNFB16AsUheYxOjGk4OscscF09QnI+gzUr7Mr/BgG+UjpxoyvC
	JNKKn/Qh/xCR/bI2RVzjPQwohC9fqOYXbMijjg60/+168fRiWSaHhOrDZUpmOHf25mZKb1EPfgD
	yUmMYwDkWcTGpM3XGEKReuvLKrrZetL0oBPaJVHzIl7P5S1tDuWzQ7mtg9rR7qNOZptqFUJuA7M
	XJq+j5DQMdiGqALDRsM9qM0gxPrTI2FuDjy5xTBQOCggRVOJLwDgl+ct7Ur1dYvfGH10Fl3+EoH
	jms9V6l5ICYAZPCQ1qohd7aqcMnVzZeFCiM0P
X-Google-Smtp-Source: AGHT+IEAo/1vhefWn+3/WHfNoaR0uTuhQluIFmNNjHusNL35ATzQdrY6cLeI66G+mEYZWbU5ws1R3Q==
X-Received: by 2002:a05:6402:510c:b0:607:2b27:7f41 with SMTP id 4fb4d7f45d1cf-608d0836702mr13256967a12.4.1750184973518;
        Tue, 17 Jun 2025 11:29:33 -0700 (PDT)
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com. [209.85.208.41])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-608b4a93024sm8489883a12.62.2025.06.17.11.29.32
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Jun 2025 11:29:32 -0700 (PDT)
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-6077d0b9bbeso11158457a12.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 17 Jun 2025 11:29:32 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWJFxhBlZSVD4ZrglzyVbfiBcyy7ClmdQUKPbY8d30HJOqmcEBn8yDSOD5Dw9D6zjp1a8YAAlFZAVMeC6/kd0DQ@lists.infradead.org
X-Received: by 2002:a05:6402:40ce:b0:5ff:f72e:f494 with SMTP id
 4fb4d7f45d1cf-608d099f37bmr12876236a12.31.1750184971733; Tue, 17 Jun 2025
 11:29:31 -0700 (PDT)
MIME-Version: 1.0
References: <20250616014019.415791-1-ebiggers@kernel.org> <20250617060523.GH8289@sol>
In-Reply-To: <20250617060523.GH8289@sol>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Tue, 17 Jun 2025 11:29:15 -0700
X-Gmail-Original-Message-ID: <CAHk-=wi5d4K+sF2L=tuRW6AopVxO1DDXzstMQaECmU2QHN13KA@mail.gmail.com>
X-Gm-Features: AX0GCFsDpDEWkWJGZUHtM58JGRAX5cSPaq4yB3fqNYhO8hMv3GVq-qz3C44LzlI
Message-ID: <CAHk-=wi5d4K+sF2L=tuRW6AopVxO1DDXzstMQaECmU2QHN13KA@mail.gmail.com>
Subject: Re: [PATCH v2 00/17] SHA-512 library functions
To: Eric Biggers <ebiggers@kernel.org>
Cc: linux-crypto@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org, 
	sparclinux@vger.kernel.org, x86@kernel.org, Ard Biesheuvel <ardb@kernel.org>, 
	"Jason A . Donenfeld" <Jason@zx2c4.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250617_112936_303763_39A03909 
X-CRM114-Status: GOOD (  14.68  )
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

On Mon, 16 Jun 2025 at 23:05, Eric Biggers <ebiggers@kernel.org> wrote:
>
> An additional note on testing: [..]

Talking about testing - when adding test scripts, can you do it as a
separate thing entirely - either before or after?

As it is, this code movement is hard to judge just because the stats
are all messed up with new tests:

 77 files changed, 4012 insertions(+), 1756 deletions(-)

that's 2k+ new lines of code that pretty much entirely hides the
question of "did this code movement result in a simpler / same / more
complex end result".

So in general, I'd really prefer big re-organizations to be *separate*
from new code changes.

It's just a pain to review renaming when it's mixed up with other
changes - whether renaming variables or whole files.

And that's as true on an individual commit level (we try to avoid
renaming things *and* making other changes in one go) as it is on a
pull request level.

If I see a pull request that only adds new tests, it's a no-brainer.

If I see a pull request that only re-organizes the code and the
diffstat just just renames with some small updates for new locations,
it's a no-brainer.

If I see a pull request that does both, it's a pain in the arse,
because then I need to start to look into individual commits and go
"which does what".

            Linus

