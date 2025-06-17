Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F824C71157
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Jun 2025 19:47:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9BlEsfucVc/RasLKZoG4B3LJbpSakOO/+DV6/Nb67hA=; b=sQkdR3vzYa5QfJ13hTjb/q0ArX
	uUUa0XVU1FDPCsPUPO+LYsw7NCJtw7P3MejX1U0dsUZRlK8hIvh0NrTCTdH7OHfhQbCJmj69SiEZZ
	6kQ6UZpulTWMju+UfC7RRtyU7uFTa3yMRc87lnFIFY/4Q3FaUSy7GFrIvLWFPSuYHeIeWhGXV+7Bi
	78kVAMW65z8JOTQd1KJhqlMa2Jpt4T9gw7sLBuxqhUhhGlVSF24TR2csUvoGlYHrRbkCRomKEp8CI
	BJEpbb9juvxDHDrpO4Pe9iN+YyTewZdf6zrW1FYLT5a+rA1BD9+T6G3v/9RRKNaprveeP5zaAZBoj
	/XI9x5Pw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRcH8-00000008Hbo-3S0d;
	Tue, 17 Jun 2025 19:47:18 +0000
Received: from mail-ed1-x52b.google.com ([2a00:1450:4864:20::52b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRcEB-00000008GuF-3Pfp
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Jun 2025 19:44:16 +0000
Received: by mail-ed1-x52b.google.com with SMTP id 4fb4d7f45d1cf-6088d856c6eso10846723a12.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 17 Jun 2025 12:44:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1750189454; x=1750794254; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=9BlEsfucVc/RasLKZoG4B3LJbpSakOO/+DV6/Nb67hA=;
        b=JUgYXTFjb530yEplMUspVWUVWxiUdSCggLPva4vqHz7IgUIISWBOkaiUepw0zGI9SU
         gX132tGgKgtlgYb2o0ugm4K2ItlUa1MrpjkDFUp7qzORhJeWTWkVrKVrGfvnlruYJ0hV
         NdaWgzhSV+HY/uAPNJA9pUUn0o6eHzt16nfQ4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750189454; x=1750794254;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9BlEsfucVc/RasLKZoG4B3LJbpSakOO/+DV6/Nb67hA=;
        b=c5GmeC61mZJz/z3Wh6gHA6+kcwKSJ11a9uLFmy+yUPJ2QwwYf+yVjTsB2aaWNro46D
         yGnjHD3te+t+mp2UaPmRYvM3MdsnWTGrK/UQ1fFhMktRZYpqmUP+VVybvlXMoGABsVUz
         FC4qoHDFudepHlu7KhqUQ3/rPtAarjTdmNH923eyRHdqRpAuRcQ98W8LL5dZR5/8cU4Z
         JsAU9nJL8w73uWUxzQXDUB+PTeHb2p8fbd0Tevj5now7C+lxL6Y1PyZ13IZjHRmKKnzI
         k5PPhf8Z9mfgFYFDW/Vru5EYlfZOCtWwkaCGFkF3NTzNwY5HtBqs/mTTV+9z1hiCD0ZR
         CEfQ==
X-Forwarded-Encrypted: i=1; AJvYcCXzBIFX8Hyz6x0gJqo/ljaJT9i/NR735pNfuwZC0XzyPvEdmwaDzin5hMkANF1C3PDxnzqaFw0Qes0DWFIGoGZt@lists.infradead.org
X-Gm-Message-State: AOJu0YyV/syqtnK3R2ejM6pFeEwRx44sOCuIiGa/xbIMUTZ4QgrxqUBw
	htREtiDrLgy+ws9NfvU1vAKjLTxll6caLYi9CnJmmIFHONFtjUpqZRlffC92T3XhrUa8WsIX7Ad
	dTgXq5Bk=
X-Gm-Gg: ASbGnct8QKiGYjwE9HXBcaXte62bZartbxxE1F7aiBYd+JKJtQcG6M1MhBG+qDIWmU/
	//gIv6iqt5lNVYOtloWx3rONbanDo6AwhrLHwSlZmI4CIg0Q/edaU2Ay9NMd+79fz9VBKLRtFIN
	uqz5BxIAQTVwq+hfkYvCOIBPHzInbJddvkc/dDZqngaQFbZm0cOsSWGSeGB7qFqHfKed7FuLe51
	OK8HTYie6RZzH3Y9UNY0LLB0Nm1M6ODy/6gwZHym2Xf70OE6CVggOG4yJ4O6dewm13pxlGrZ5uQ
	JMWGJGt2JsCAxDZ8rgaqra0Q7OeqHuSuq3iKzsGnFRPbljqpXrkfa1a58Mz0yEyMjO+r4uTwrt5
	NNUorq99huhmOZNGPI0IepaHrIa6fzZOfUDwKqidoCKNom7w=
X-Google-Smtp-Source: AGHT+IExKtYPT3uevuNJ0e87JyM+TC/X71ta5gHmR/L4wS9S10goSFIj8K01U5/fxH0QqmQCKH12Iw==
X-Received: by 2002:a05:6402:34d4:b0:606:a26c:6f46 with SMTP id 4fb4d7f45d1cf-608d09475dfmr13075531a12.19.1750189454061;
        Tue, 17 Jun 2025 12:44:14 -0700 (PDT)
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com. [209.85.208.46])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-608b4ae33fcsm8307318a12.78.2025.06.17.12.44.11
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Jun 2025 12:44:13 -0700 (PDT)
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-607ea238c37so12915972a12.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 17 Jun 2025 12:44:11 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVim+aVmnp4bIWVHNKSXGVLAG2x/95UgZAVYggms6X8ckiAG1ca/B7O58VzoK+TCgUfTCsSKxvpb4dQJc9i3bxk@lists.infradead.org
X-Received: by 2002:a05:6402:278e:b0:602:29e0:5e2f with SMTP id
 4fb4d7f45d1cf-608d086197cmr14681659a12.10.1750189450991; Tue, 17 Jun 2025
 12:44:10 -0700 (PDT)
MIME-Version: 1.0
References: <20250616014019.415791-1-ebiggers@kernel.org> <20250617060523.GH8289@sol>
 <CAHk-=wi5d4K+sF2L=tuRW6AopVxO1DDXzstMQaECmU2QHN13KA@mail.gmail.com> <20250617192212.GA1365424@google.com>
In-Reply-To: <20250617192212.GA1365424@google.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Tue, 17 Jun 2025 12:43:54 -0700
X-Gmail-Original-Message-ID: <CAHk-=wiB6XYBt81zpebysAoya4T-YiiZEmW_7+TtoA=FSCA4XQ@mail.gmail.com>
X-Gm-Features: AX0GCFszNgSlkg9Mnl9IREDvPmSYgcHDQLiQJ6pRqgmPlre4NTxTJm_9n0SX2DU
Message-ID: <CAHk-=wiB6XYBt81zpebysAoya4T-YiiZEmW_7+TtoA=FSCA4XQ@mail.gmail.com>
Subject: Re: [PATCH v2 00/17] SHA-512 library functions
To: Eric Biggers <ebiggers@kernel.org>
Cc: linux-crypto@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org, 
	sparclinux@vger.kernel.org, x86@kernel.org, Ard Biesheuvel <ardb@kernel.org>, 
	"Jason A . Donenfeld" <Jason@zx2c4.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250617_124415_844695_97212E98 
X-CRM114-Status: GOOD (  15.19  )
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

On Tue, 17 Jun 2025 at 12:22, Eric Biggers <ebiggers@kernel.org> wrote:
>>
> The tests are already in their own patches: patches 4 and 5.  Yes, this patchset
> has a negative diffstat once you subtract them.

Yes, the patches were separate, but my point stands.

Let me repeat that part of the email since you seem to have missed it:

> If I see a pull request that only adds new tests, it's a no-brainer.
>
> If I see a pull request that only re-organizes the code and the
> diffstat just just renames with some small updates for new locations,
> it's a no-brainer.
>
> If I see a pull request that does both, it's a pain in the arse,
> because then I need to start to look into individual commits and go
> "which does what".

IOW, I really prefer pull requests to do clearly separate things too
when we're talking re-organization. Or at the very least spell things
out *very* clearly.

Otherwise I have to waste time just to go split things out _anyway_.

            Linus

