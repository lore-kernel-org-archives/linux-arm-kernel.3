Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B1E3CCF9E0
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Oct 2025 05:33:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=978k93bL9MxlYRkaTWrSvPo0X/ixK1lZJ0FCxsOFego=; b=w58GAggTizaXGTZ9rDVicfCH6l
	RnrEEl7zmkwFAjerQvDHKLMI3QweDOCbC4PioCl7u6dv4O3mRYy2yRDYy0X1+dr9JKB7bSdR8fH7x
	aW7KDEywuaDzJtRaTK5bFJ1rjKVIx6ktxG7QzIbgUfZvShqoBRBQX1VMxohvIQdrjHKdzizGL1YyT
	TX9ZG0C49GpuYYnb3upaRoS2KJF7aci5H8U6ZMgB+OJWhR9MfsJlGrJkxJLcS3kTo9SLjDekGIYM2
	MSbT2HkKlz2Sf3XFGcl8itE4phZDv6QMrb//6p5rxpySgAO72aGJg39C7X2mj+2cdEUi1Yl5xOfbs
	KwD1z8vQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDcKu-0000000FGpH-20yB;
	Tue, 28 Oct 2025 05:33:36 +0000
Received: from mail-pj1-x104a.google.com ([2607:f8b0:4864:20::104a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDcKr-0000000FGnb-3BOP
	for linux-arm-kernel@lists.infradead.org;
	Tue, 28 Oct 2025 05:33:35 +0000
Received: by mail-pj1-x104a.google.com with SMTP id 98e67ed59e1d1-33d75897745so13025641a91.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 27 Oct 2025 22:33:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1761629612; x=1762234412; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=978k93bL9MxlYRkaTWrSvPo0X/ixK1lZJ0FCxsOFego=;
        b=A47tz3i//SGCwR/+cn4MJsiMi6DCjluk4i/88FJ/DhF731qpUeW6PAejde6gw8fb/h
         rCbsXah7q5N7HMoalTcgXbYl4jiLKTlLn380//eDQ3CCgTlOzRBWW9M0xCR1Oxg1mttb
         EqHe9galdFygNKrLyYPeuTJJyUKWKL/goT58iFO3iKjSpeXiZkaTODEbWANh8h6QAZ6U
         AhVVChJNDkBKwf+rackHjMxiLXLNfohKqZ3hBwi2JlYxfImE7n6PgjcM92W4DY2FalHZ
         +GXz+U5XicCcPVIQFZaVLFRuDRCMYGkgAuAXebVFXxdyXD2m/h7ELhJrk/9XlfbsFuaR
         pI9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761629612; x=1762234412;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=978k93bL9MxlYRkaTWrSvPo0X/ixK1lZJ0FCxsOFego=;
        b=nxqiZfymeknTILsUxcicWS4g/MKn6tlZWJjuzqfyM0bjVC2xrikSkxbD0fUQfzO1sz
         BlJ5Wofp1AZD2kubxim+Xff5Sp3UupWn0TIIZJHkRDI7SS+K70ZNvcIQmzlud6GVrScB
         4urbNVa//nDVzKtGI8twfipyEmkTb2z0HI6SCsxHlhdOfqW3g/u86n78lYdlN8KIolTA
         kyEz1FntLUhA4zptrmr4VlSDb0UkvzRj6CHW80NYsW/+83mIO7OqiJJjx2CPDOoWad0w
         ff0JoCTY3JaWy+TcxE4dLxW2ET29bJiOjLjOOgLTa0JRCd8rEk43Vv/MNzmWjJa1O9XI
         f7gg==
X-Forwarded-Encrypted: i=1; AJvYcCX43BKMe2c7QVkWLlpU5q4dQ2ljAMNk+Twfkqfg/HzbbYDCZzJx2C2Me6JnieF6GEZzFrLSweLFU1LMzMcC+iUt@lists.infradead.org
X-Gm-Message-State: AOJu0YyR+PYanUaHhRywQz2pTgGR2ZeyX0bPxzWMOEL+DSEJClM1lWJy
	B+7t5FVCvVqBn8FstAg4CZERfnLndfMKvV7V67YRjAqMHjzBHvEYgezcNWAZNvZYQbp2e394b7P
	CFssZMA==
X-Google-Smtp-Source: AGHT+IEgPd1Vro8jar4YuvbY14ALahZ9RGAW96D7MCTDGrIDbCO1GDP/qete02Qehy0msaJmFvHad1jiwWY=
X-Received: from pjxx4.prod.google.com ([2002:a17:90b:58c4:b0:33d:98cb:883b])
 (user=kuniyu job=prod-delivery.src-stubby-dispatcher) by 2002:a17:903:2290:b0:273:ab5f:a507
 with SMTP id d9443c01a7336-294cb394740mr35360685ad.21.1761629612502; Mon, 27
 Oct 2025 22:33:32 -0700 (PDT)
Date: Tue, 28 Oct 2025 05:32:13 +0000
In-Reply-To: <ea7552f1-842c-4bb8-b19e-0410bf18c305@intel.com>
Mime-Version: 1.0
References: <ea7552f1-842c-4bb8-b19e-0410bf18c305@intel.com>
X-Mailer: git-send-email 2.51.1.838.g19442a804e-goog
Message-ID: <20251028053330.2391078-1-kuniyu@google.com>
Subject: Re: [PATCH v1 2/2] epoll: Use __user_write_access_begin() and
 unsafe_put_user() in epoll_put_uevent().
From: Kuniyuki Iwashima <kuniyu@google.com>
To: dave.hansen@intel.com
Cc: alex@ghiti.fr, aou@eecs.berkeley.edu, axboe@kernel.dk, bp@alien8.de, 
	brauner@kernel.org, catalin.marinas@arm.com, christophe.leroy@csgroup.eu, 
	dave.hansen@linux.intel.com, edumazet@google.com, hpa@zytor.com, 
	kuni1840@gmail.com, kuniyu@google.com, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linuxppc-dev@lists.ozlabs.org, maddy@linux.ibm.com, mingo@redhat.com, 
	mpe@ellerman.id.au, npiggin@gmail.com, palmer@dabbelt.com, pjw@kernel.org, 
	tglx@linutronix.de, torvalds@linux-foundation.org, will@kernel.org, 
	x86@kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251027_223333_825351_B6E27A4A 
X-CRM114-Status: GOOD (  19.30  )
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

From: Dave Hansen <dave.hansen@intel.com>
Date: Fri, 24 Oct 2025 07:05:50 -0700
> On 10/23/25 22:16, Kuniyuki Iwashima wrote:
> >> This makes me nervous. The access_ok() check is quite a distance away.
> >> I'd kinda want to see some performance numbers before doing this. Is
> >> removing a single access_ok() even measurable?
> > I noticed I made a typo in commit message, s/tcp_rr/udp_rr/.
> > 
> > epoll_put_uevent() can be called multiple times in a single
> > epoll_wait(), and we can see 1.7% more pps on UDP even when
> > 1 thread has 1000 sockets only:
> > 
> > server: $ udp_rr --nolog -6 -F 1000 -T 1 -l 3600
> > client: $ udp_rr --nolog -6 -F 1000 -T 256 -l 3600 -c -H $SERVER
> > server: $ nstat > /dev/null; sleep 10; nstat | grep -i udp
> > 
> > Without patch (2 stac/clac):
> > Udp6InDatagrams                 2205209            0.0
> > 
> > With patch (1 stac/clac):
> > Udp6InDatagrams                 2242602            0.0
> 
> I'm totally with you about removing a stac/clac:
> 
> 	https://lore.kernel.org/lkml/20250228203722.CAEB63AC@davehans-spike.ostc.intel.com/
> 
> The thing I'm worried about is having the access_ok() so distant
> from the unsafe_put_user(). I'm wondering if this:
> 
> -	__user_write_access_begin(uevent, sizeof(*uevent));
> +	if (!user_write_access_begin(uevent, sizeof(*uevent))
> +		return NULL;
> 	unsafe_put_user(revents, &uevent->events, efault);
> 	unsafe_put_user(data, &uevent->data, efault);
> 	user_access_end();
> 
> is measurably slower than what was in your series. If it is
> not measurably slower, then the series gets simpler because it
> does not need to refactor user_write_access_begin(). It also ends
> up more obviously correct because the access check is closer to
> the unsafe_put_user() calls.
> 
> Also, the extra access_ok() is *much* cheaper than stac/clac.

Sorry for the late!

I rebased on 19ab0a22efbd and tested 4 versions on
AMD EPYC 7B12 machine:

 1) Base 19ab0a22efbd

 2) masked_user_access_begin()
    -> 97% pps and 96% calls of ep_try_send_events()

 3) user_write_access_begin() (Dave's diff above) (NEW)
    -> 102.2% pps and 103% calls of ep_try_send_events()

 4) __user_write_access_begin() (This patch)
    -> 102.4% pps and 103% calls of ep_try_send_events().

Interestingly user_write_access_begin() was as fast as
__user_write_access_begin() !

Also, as with the previous result, masked_user_access_begin()
was the worst somehow.

So, I'll drop patch 1 and post v2 with user_write_access_begin().

Thank you!


1) Base (19ab0a22efbd)

# nstat > /dev/null; sleep 10; nstat | grep -i udp
Udp6InDatagrams                 2184011            0.0

@ep_try_send_events_ns:
[256, 512)       2796601 |@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@|
[512, 1K)         627863 |@@@@@@@@@@@                                         |
[1K, 2K)          166403 |@@@                                                 |
[2K, 4K)           10437 |                                                    |
[4K, 8K)            1396 |                                                    |
[8K, 16K)            116 |                                                    |


2) masked_user_access_begin() + masked_user_access_begin()
97% pps compared to 1).
96% calls of ep_try_send_events().

# nstat > /dev/null; sleep 10; nstat | grep -i udp
Udp6InDatagrams                 2120498            0.0

@ep_try_send_events_ns:
[256, 512)       2690803 |@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@|
[512, 1K)         533750 |@@@@@@@@@@                                          |
[1K, 2K)          225969 |@@@@                                                |
[2K, 4K)           35176 |                                                    |
[4K, 8K)            2428 |                                                    |
[8K, 16K)            199 |                                                    |


3) user_write_access_begin()
102.2% pps compared to 1).
103% calls of ep_try_send_events().

# nstat > /dev/null; sleep 10; nstat | grep -i udp
Udp6InDatagrams                 2232730            0.0

@ep_try_send_events_ns:
[256, 512)       2900655 |@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@|
[512, 1K)         622045 |@@@@@@@@@@@                                         |
[1K, 2K)          172831 |@@@                                                 |
[2K, 4K)           17687 |                                                    |
[4K, 8K)            1103 |                                                    |
[8K, 16K)            174 |                                                    |


4) __user_write_access_begin()
102.4% pps compared to 1).
103% calls of ep_try_send_events().

# nstat > /dev/null; sleep 10; nstat | grep -i udp
Udp6InDatagrams                 2238524            0.0

@ep_try_send_events_ns:
[256, 512)       2906752 |@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@|
[512, 1K)         630199 |@@@@@@@@@@@                                         |
[1K, 2K)          161741 |@@                                                  |
[2K, 4K)           17141 |                                                    |
[4K, 8K)            1041 |                                                    |
[8K, 16K)             61 |                                                    |


