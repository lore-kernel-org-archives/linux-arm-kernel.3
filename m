Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA31EC36005
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 26 Mar 2025 00:50:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=u5j2ozUbV11p9cWhpwY3zzyLx6ZVzJzfckNa6v5g9gI=; b=WgyV0R8LfySy/AV5gqu5I9EyOH
	e69TPyFo4ZP9zD7jxLS6g0y/4Rn0rNrjCD9a54R1ztPvkrYg/MungEEBFKwetc0rXfTd+/lwSXA4J
	a7y+PqiwVOr8CZjxBfKv4OlukRXjhbjT2ZZquyqaJtgeq9wT03bELZTK2bqWPcC4kRQ79dTyn+GSo
	dNy763n8zNvJhVMVy343nRgojTJTJf1wlUnd4c4QCpuUvKXuPBd7gWKh3rp0pywdbLf1tDxNE29io
	s8KjFUK1QKzhMpkAkMgEvb9WpUuTzKvMbLwFBh9tCn0u3uVQ2xvhELMGtp2vOdLnp4Evp9Iwv8bQA
	3iyssHng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txEyJ-00000007Jbz-2vRp;
	Wed, 26 Mar 2025 00:50:19 +0000
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txEwa-00000007JWw-2OLg
	for linux-arm-kernel@lists.infradead.org;
	Wed, 26 Mar 2025 00:48:33 +0000
Received: by mail-ej1-x62a.google.com with SMTP id a640c23a62f3a-aaecf50578eso1134494566b.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 25 Mar 2025 17:48:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1742950111; x=1743554911; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=u5j2ozUbV11p9cWhpwY3zzyLx6ZVzJzfckNa6v5g9gI=;
        b=WB263JxGIzQzBvTuVdgaC35Ap/XU39zgO70yBgI6JLhkUhGLkIkK0ZgNjPHX0/shBv
         uzZI1T8m3sEeXKCLu6R0yGVX8bcVdVbOopzxWuU9fPFvS0PNbyi8axgdT/QfSgrHEL08
         AU36ZeBXqbeUazKXSguTSyX/3xA+we3bgHhJo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742950111; x=1743554911;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=u5j2ozUbV11p9cWhpwY3zzyLx6ZVzJzfckNa6v5g9gI=;
        b=a/wdj2L/i+7br7odP8g8qAjuglLcDRjED9l/auSbXzZZDym8OWDBeSsEneCrhOu0hj
         F+96hWLT13lUZaa7kFR/W66YNSObBtw/Tj0aN5/dXwWmNqCWEGpP7X51IRxbYzBXNc+P
         iXxBpErounilQI98G5RG8vZqJbYFUgOmEXIBzmTfv5Uui8PKHutpAHPfH5E1VSuUNM5/
         X+odGCMRk72v+/2nSjiZSN/rpPbtOHnEL3XWrGCAsQVrMHxktM03QuMZ6WXPdC2pWhhg
         xG06f5BHLNvOf2msBI66w5t8OGnv9bf8Y5doA0Z5noErOTPOqVXhWWaYuKGVYnz5aU6x
         Ok7Q==
X-Forwarded-Encrypted: i=1; AJvYcCXDBjsnERXe0q2PawPseaOO7waV+/9BC4gkV5oZhlRqrC/Y7osbD9jkQjTu7Lp9Cn3komSYUmNqjh6cabzNunlQ@lists.infradead.org
X-Gm-Message-State: AOJu0YwpIfVD0Z77pNENiYAY5t/hZhAsTtD0SM3j5fd87Yg3gFf2KMbr
	GOiPFp0rqsPoXNUEUftP1sUr16Ltra5Q2Mu2dCtB9+8OvyJdEW7lEsvsOgGFTd/hDkt58ZJrzVO
	leilGtw==
X-Gm-Gg: ASbGncuj69R3wa47UNQ9/bYvts484N3qRFzIvc7RuDhcDh+hzkF25dcW/hqZrf0dLQE
	F4/qh537KhmwIPAVwjbGHSt+qSqKj2yURoMA4GhMA4la2OZ7lKYw5crfRuoUqQTPzN1f2A36NIE
	o8RKNf3f7kqBmOSbn6Itt8fWqpJFOI5JNV2be3E3xSwnAobSoQ7NJc95ntChhKQT3SakBc6pRZS
	dSy3AHQHWBo6Zag4yrfIPE8wSKmCir9PWXireIiQXD4aNsK0q0l54w0lhSMntaxG0xCkuEjfLbg
	UdjJwzc4opP2A3vOou5BEmMF9NuAtutlMymlcvuvevKSqWWEqQcQ7vfdCqTnv9r3XvlZCJJRQqN
	qII//jq399F9dH+DoPAItrgsvKe+Nvg==
X-Google-Smtp-Source: AGHT+IG6P8A0S1qmsQU3xAMBAiDrtbucpYeJaKbXfhZTOh+UMXlNKOS9niwgrwN+0DKkGYbA1wZXAg==
X-Received: by 2002:a17:907:bc8b:b0:ac3:3e40:e181 with SMTP id a640c23a62f3a-ac3f1e04bfdmr1941562266b.0.1742950110607;
        Tue, 25 Mar 2025 17:48:30 -0700 (PDT)
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com. [209.85.208.43])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac3ef8d3cd3sm931338866b.40.2025.03.25.17.48.28
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 25 Mar 2025 17:48:29 -0700 (PDT)
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-5e5e34f4e89so11408260a12.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 25 Mar 2025 17:48:28 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCU1DlsINE0W+/tmc2/vpML1bm9KYKWEVuCeAIzUcBu9JqQbJFGyGsxvM7i6ErVem/H4MJQCT7HArcFSiVTVUJHx@lists.infradead.org
X-Received: by 2002:a17:907:d7c8:b0:ac4:2ad:44d9 with SMTP id
 a640c23a62f3a-ac402ad46bfmr1749200166b.24.1742950108550; Tue, 25 Mar 2025
 17:48:28 -0700 (PDT)
MIME-Version: 1.0
References: <20250325195322.3243734-1-catalin.marinas@arm.com>
 <CAADWXX-0hMgpyeQw_7Ko14hNMciqSnKJAROEWS5vwAdMKUt_zw@mail.gmail.com> <Z-NHugcLdLqkEHFR@arm.com>
In-Reply-To: <Z-NHugcLdLqkEHFR@arm.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Tue, 25 Mar 2025 17:48:12 -0700
X-Gmail-Original-Message-ID: <CAHk-=wg_HipugbtswxFnekQy2g_ksKKXj+yht8naj2FEMtRMgA@mail.gmail.com>
X-Gm-Features: AQ5f1JpHt1sfWI_grtQMmIWwYdef1dz8TrRcHr4XeG0IwjTtwajjR9Z5n6vqPg0
Message-ID: <CAHk-=wg_HipugbtswxFnekQy2g_ksKKXj+yht8naj2FEMtRMgA@mail.gmail.com>
Subject: Re: [GIT PULL] arm64 updates 6.15-rc1
To: Catalin Marinas <catalin.marinas@arm.com>
Cc: Will Deacon <will@kernel.org>, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250325_174832_772593_27E4686A 
X-CRM114-Status: GOOD (  12.71  )
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

On Tue, 25 Mar 2025 at 17:18, Catalin Marinas <catalin.marinas@arm.com> wrote:
>
> Hmm, I thought that setting "Return-Path: cmarinas@kernel.org" would be
> enough.

No, DKIM is designed to make forging emails hard, and that very much
means that it checks the "from" address, not some random header that
humans never look at.

> This header left my machine but seems to have disappeared in the
> lore archive. Not sure how much difference it would have made, IIUC
> that's more for SPF than DKIM.

I do see the

   Return-Path: <cmarinas@kernel.org>

but no, that shouldn't make any difference at all, because that's not
what dkim matches.

The spf is fine, but honestly, spf on its own is kind of useless.

> If the envelope sender doesn't work, I may have to switch to using
> cmarinas@kernel.org, at least for pull requests.

That's fine, and is probably the easiest thing to do.

            Linus

