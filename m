Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E32BFE81A3B
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Feb 2026 15:33:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YcJklCdj+iuSWVZsmzfOlTt0HmcUV3JKhtJ9znekMoY=; b=bOhcXsDaU40pcODF1BLziCpUpQ
	3GvSVn7h96Brwr9tMimfpZACZRSmH1pTo2bhVCWoRZksj123KQWpr1pbWRf7Crfzjx9TSGiTi6AF7
	lvFsSP/Bb00FRk7wOgH7X68YS3Ijo+fKo6PWiEzf7eqaBArvs6pge/C3smot5oThprrB2VlzzchBB
	sWn26oW/7TinZGjItcf/tayVOmOueoidruZ/KkWDEkq/hmQtw1Mfj5erKG84pim8ol4U+xr4wTVPO
	VlRw/sLTwZAWQSAYiFoD1fWiIHP8K9vSRNfJ52sIglTspPEQ9FHVzsEsv0BiHGOFAI/hGYP0LbDas
	uChyHaRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vs0b9-00000006uUG-22ui;
	Mon, 16 Feb 2026 15:33:19 +0000
Received: from mail-ed1-x544.google.com ([2a00:1450:4864:20::544])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vs0b6-00000006uTN-0MFR
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Feb 2026 15:33:18 +0000
Received: by mail-ed1-x544.google.com with SMTP id 4fb4d7f45d1cf-658b6757f7fso6445302a12.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 16 Feb 2026 07:33:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1771255994; x=1771860794; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=YcJklCdj+iuSWVZsmzfOlTt0HmcUV3JKhtJ9znekMoY=;
        b=HMrZE05VzL8o59gjecA69HZUFE0KJiK5tMsv9KhvRLjfQt4qIUrClBgEI1dBiUAQQ9
         6awOZipT7VmKv0wYXYhWseJH17taWqxlQWQtqx0PnGmavUbxFE4clkhG+ebtPLSQnXsh
         f/rWMcyEK0Tr7krTxDu8cejjIenxA/GjZykQo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771255994; x=1771860794;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YcJklCdj+iuSWVZsmzfOlTt0HmcUV3JKhtJ9znekMoY=;
        b=ZBhE72cQu8DdhZl5UKVHF1+cFWK+eY3kc4LlDjzFvy/erVjH4dLr7MBA8O1BmdbW+A
         U2BBbiLCRmVAuOyuo/k/R++ecqNWDfRy068YW2jRVMiGXBsigqFjNOVOm7r7Y0uIspSa
         8DqzglDH1Qb715wyfUMGh8/su4yOtBcsqzA+L1w3WyR+6lUnRMVW/5h60PpeoutnyKZr
         ObMy3x/UN2KHUuSCgVwk47EN640doyUhh+Sav4xHovYDuDUKx6dCqBFltxN4zdtCds8R
         iVoVT4trnQOnqxHoR8eGIxaaKcSPe0Py7Cbm+lu1WNt9adWJslxjErkkLyQmfYzlzxKc
         UKJg==
X-Forwarded-Encrypted: i=1; AJvYcCV6braoU6bd9Vi/QiHIXZHrdLBtUlwZd5vKG2J1VFtoqA/ohjGo8W/RJWfkde5X+XpoXCEbLM1xeFkIzQBuQMra@lists.infradead.org
X-Gm-Message-State: AOJu0Yzmi65IbKratmt5CWISPH64iemFLzCUSzXokq4sBAhYrjzaTjP8
	Pzqq1nPYMqhURvaSBB4sP/dRx/k44Zyav60Zj6aHX7+w9V8iMzHzbUdpAC3HIBPe/lpBzXpzn+b
	DP1sDcCgXCg==
X-Gm-Gg: AZuq6aI2s/edWdFJQQ+mdQC2o5z/YnzqBS7z9YFdlC+NZgoTO2DCWTW2whrDZ4ve1iD
	c5ZlMUI/Y4jXMR36UYOF0mL2ml2X70PNsq+bWo0P5PkHF3Wf/dNJUBFoyhvdBD1bbvbz9rL6/8s
	gof6j6VULEknEG+EVSfMpQ8t0xVaVV7lX8CebYT5ZloWjA9rrGNAQ7zzk08UweUfOU1uCF9/8Na
	K1w0C851oaC3gt6XaPplLrcwX+9Pbc5JYVQCLBPQnL3Ag6KmcUxiZOARP+4p21HnxkJeiHqwjZB
	6G0Fg3tJEyhTDfoLOj85xOLmogsjRrRXppmHbb7NRQQlAcvRJg4exqo8nNPI22krH0o6UB/gpFk
	Y9/oMRYWnol23A2/w3c7PTxPq4UXsI44AAhT9nz/dLfsppnjntTrAPCf64CL5k3OZY6nZZ4v3vH
	RG6iMyZt+D+TixbKuJNED8i9xZWGK9eZq5GZnkVwJUacTNHau3KgnaYmbjbqYPQLEOOvOYzX/r
X-Received: by 2002:a17:907:2684:b0:b88:1e2:ed49 with SMTP id a640c23a62f3a-b8fc053d4a8mr462953766b.8.1771255993800;
        Mon, 16 Feb 2026 07:33:13 -0800 (PST)
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com. [209.85.208.41])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8fc76278b8sm266725866b.33.2026.02.16.07.33.11
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Feb 2026 07:33:11 -0800 (PST)
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-65a1970b912so9028658a12.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 16 Feb 2026 07:33:11 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCX9H79pL1wKcZb+SuiFKi65zOXNKtUBD3hP0WH3Eo30saEmxFPRQ17LhzIWg9aFAsSX2QyF/T+nPXdxpn8A6Kr6@lists.infradead.org
X-Received: by 2002:a17:907:6e86:b0:b8f:e98e:ff5d with SMTP id
 a640c23a62f3a-b8fe98f297emr298866966b.13.1771255990932; Mon, 16 Feb 2026
 07:33:10 -0800 (PST)
MIME-Version: 1.0
References: <20260130132951.2714396-1-elver@google.com> <20260130132951.2714396-4-elver@google.com>
 <aYDFOIskB20CbztD@willie-the-truck> <20260202192923.0707e463@pumpkin>
 <aYHgNSF5a3F7UGU_@willie-the-truck> <CANpmjNNzx-zc_-ZPgwe5DoWLmexw5irT2n+XMUqxTrfwxTxTmg@mail.gmail.com>
 <20260204131400.GI2995752@noisy.programming.kicks-ass.net>
 <aYNUmEfDzq7lTFFr@willie-the-truck> <CANpmjNPHnt6eY-OfkTr5TksHaOon2GyLUokvagcMRa23B6i6_Q@mail.gmail.com>
 <20260206182650.6c21b0ff@pumpkin> <CANpmjNNFXdMM6cL+HBsiXr2WUA=mttR1jDRMqNYD7+YZs6vRKg@mail.gmail.com>
 <20260215221656.68b2fc1d@pumpkin> <CANpmjNOnOqq2k41=iNsgZLXAzspVQhcTZ88Nvms_c_0M+7b7YQ@mail.gmail.com>
 <CAHk-=wioS+vB8aBxWBgdEfXqDq5Ynr9gyY=GhU7gxO9G_C+_6g@mail.gmail.com> <20260216110915.4f0d5490@pumpkin>
In-Reply-To: <20260216110915.4f0d5490@pumpkin>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Mon, 16 Feb 2026 07:32:53 -0800
X-Gmail-Original-Message-ID: <CAHk-=wjJQQfWpAxigafuyrgxg8CdQWSimVYMk16_j0vWwEkjag@mail.gmail.com>
X-Gm-Features: AaiRm51OTGvN2sCSlh8_Rn9ui_eyEBMKbWkgCuwNwrublXNq6jjEcgPmaKvEAvs
Message-ID: <CAHk-=wjJQQfWpAxigafuyrgxg8CdQWSimVYMk16_j0vWwEkjag@mail.gmail.com>
Subject: Re: [PATCH v3 3/3] arm64, compiler-context-analysis: Permit alias
 analysis through __READ_ONCE() with CONFIG_LTO=y
To: David Laight <david.laight.linux@gmail.com>
Cc: Marco Elver <elver@google.com>, Will Deacon <will@kernel.org>, 
	Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@kernel.org>, 
	Thomas Gleixner <tglx@linutronix.de>, Boqun Feng <boqun.feng@gmail.com>, 
	Waiman Long <longman@redhat.com>, Bart Van Assche <bvanassche@acm.org>, llvm@lists.linux.dev, 
	Catalin Marinas <catalin.marinas@arm.com>, Arnd Bergmann <arnd@arndb.de>, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	kernel test robot <lkp@intel.com>, Boqun Feng <boqun@kernel.org>, Al Viro <viro@zeniv.linux.org.uk>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260216_073316_145493_FD75BF81 
X-CRM114-Status: UNSURE (   9.70  )
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

On Mon, 16 Feb 2026 at 03:09, David Laight <david.laight.linux@gmail.com> wrote:
>
> volatile structure members are almost free

No, gcc does absolutely horrible things with volatiles. It disables a
lot of very basic stuff.

Try doing something as simple as a "var++" on a volatile, and cry.

We need to have explicit 'READ_ONCE()' etc atomic accesses, just to
make it very very clear that the compiler will generate shit code.

We do *not* hide them and make them implicit by marking data
structures volatile. I very much want those explicit
READ_ONCE/WRITE_ONCE cases.

           Linus

