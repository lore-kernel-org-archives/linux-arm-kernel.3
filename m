Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4BCCBCD98E4
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 17 Jun 2026 13:10:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=t59PWFHJyhJPrhG4yxJtzulsV5BlqsFtV0EzJW4vR/E=; b=n4z9nLnvR+6TTGrYbtEVFUb1NS
	DZodgf7Dc3fbjUHGbWLLYQnpbyqQ/N7KLpz+ZDSCzWWCTh1BlhrHsy0wEgiXz0wHudFJEG/+jLM1U
	TtkVf1QX+8q3MVCz2+esI8RO69MjL2b1xp1XmjJEsmqcX6adPx/bDGDD+ibTcdtvRrXhkZiSFWjtG
	DVvVQN4ydIcCzblIrslmlLCStp/o/bU2YB16CF41pZoH1BpPv0IvDlhcTg1gHS5MAdK+HQ0eyxjNV
	J9OpEYmmr9wS/qOCj04Aqu3rFjakWvdaBe/f9NMhIWqnuuhFUmIooKOFDawupMELgYDytUZ5oTC9A
	PakdYMvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZq2F-0000000HOmD-0iU6;
	Wed, 17 Jun 2026 13:10:27 +0000
Received: from mail-pf1-x42d.google.com ([2607:f8b0:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZq2C-0000000HOlt-2QOI
	for linux-arm-kernel@lists.infradead.org;
	Wed, 17 Jun 2026 13:10:25 +0000
Received: by mail-pf1-x42d.google.com with SMTP id d2e1a72fcca58-84230ab8857so2679147b3a.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 17 Jun 2026 06:10:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781701822; x=1782306622; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=t59PWFHJyhJPrhG4yxJtzulsV5BlqsFtV0EzJW4vR/E=;
        b=lnBUjqEj+4O3iU1Z/A2mSTKb8kgeHoKnAMurGcyVLFH/XIhPxBTFJmexME6W47bnpt
         xuacdnjTjvs/1Qpt+YhOPVXOt2qhCf0zdDRRjYny0RbOab4eFeSRH0SgHECl4qXJwNxE
         efz/Ndd8sJciD/S9D6XaSbbVh94uveZyT4czjjLZhoAeKutPuGqhxdLN7hbbKmky2Pf1
         OG5qZUT15ONP9yoh4WeUXmKvdxSbQhZhc5JEJhUsNJbssS4IkOEzcPz5fmne2oBSQIl1
         C94nqzNughstiENpRyYqG0f0TDCqUZ+6Xk3Waoiin+xQ8AqMaRdnObcPEfqnf+KQme9r
         nYGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781701822; x=1782306622;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=t59PWFHJyhJPrhG4yxJtzulsV5BlqsFtV0EzJW4vR/E=;
        b=HukirdRyW7tMoNpRqLEAaS4v4C/3eN7MgKwcc8rXKKGpUVxPDonAilAYSvO6FWYedW
         RG7tWkym3rxC1ggLoyPbZHtj8m0p9DNU8sknfO4aFv7fzulnKq025L4o1CurRVGXq7ar
         TVBdOEdZmXHbpn8tZ34q48zJSbY0V/my/Z7JQYWtJSrT7jL3hqKIjr2d8rUKmCGXaBgV
         1yDNgkpDtU8CyVxH2iyk9wEYCgEcSBOm9MkcmMh1Hm+SUO22FS8LEPbD8dIa6kxlMZlw
         PUGf2XFZTxsTA8/uIcmwqjNptuww7D7eMQN6o1+IlMJwtW4okJfT6OKAarpQY9vw1zEG
         tCKA==
X-Forwarded-Encrypted: i=1; AFNElJ/Bk/lOVdpwfgx5lc77Pb8Dony4yWNHpUs4iV+jXEX/tRCaWQTtXEjxgzNvaglP8ZHQaSLWljV+qQJx82IJMWz1@lists.infradead.org
X-Gm-Message-State: AOJu0Yw6tsCaI1Z4lgYOj0Pq0n0zcL2OepmZ0CVpF7tbVfn11r9HK5Xk
	kFfRYEQH2TlxoHVleZxBiP/tYAY05tQLPgTfZ/tsI4LS3reU2lFXf1JL
X-Gm-Gg: Acq92OEEwLV6D8CEKrWgZmNtrhRkxgTW1oCBg+lrUMN8Djy0TwQ4Pk1uo284bcvB2qu
	ZqeZH5NfftEKYZHOylS9HZhEowBe4AwEPl7B8dYYztsLc+GkVlcOegG9liih3tWe04+gxsKzlad
	2ScnM+w9l9wXyax1AbbQ0vw4tX4Ij7VjvvQgV9vc1Go3Z9qaOt1avUmsq8J3QhNvUnxyU0WsiJi
	IVqQop2FIlke4IikL9eXEUq2FjUeF/uY73JRkz34tnB53Gd1OlHlWKGV4DNEGwl/7dokeHPywbb
	XKTEvvQHOCgBxqXupCXyFVfpDZE7+czchWNyJFyGbn1VEF9uTZ4vpgYm67gaBf0Wfz5K0GZguYS
	NqdrFq/aqsPwpieUROglB6VoVxlfZ7HTsCZ9bWT3vzU6+vZvYxXz/ezz0I6gahVjYtQ94mHW81k
	ZG1fE+CkEktgUp+XMawDwsTXfBOlZBXZhA9emmqKU=
X-Received: by 2002:a05:6a21:a81:b0:3b4:bdd5:2f8 with SMTP id adf61e73a8af0-3b8b7cd6681mr4444974637.38.1781701822431;
        Wed, 17 Jun 2026 06:10:22 -0700 (PDT)
Received: from LAPTOP-97G9G880.bbrouter ([106.51.148.76])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c8893894debsm1085376a12.7.2026.06.17.06.10.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Jun 2026 06:10:21 -0700 (PDT)
From: Karthikeyan KS <karthiproffesional@gmail.com>
To: andrew@codeconstruct.com.au
Cc: joel@jms.id.au,
	andrew@aj.id.au,
	Kees Cook <kees@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	linux-hardening@vger.kernel.org
Subject: Re: [PATCH v6] soc: aspeed: lpc-snoop: Fix usercopy overflow in snoop_file_read
Date: Wed, 17 Jun 2026 13:10:13 +0000
Message-ID: <20260617131013.64188-1-karthiproffesional@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <033f2657ae6a94ad13d22f717a2900afb75d892d.camel@codeconstruct.com.au>
References: <033f2657ae6a94ad13d22f717a2900afb75d892d.camel@codeconstruct.com.au>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260617_061024_640398_F4EE561C 
X-CRM114-Status: GOOD (  14.00  )
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

This looks like a lot of heavily LLM-assisted effort. Please review the
relevant documentation, starting here:
   https://docs.kernel.org/process/submitting-patches.html#using-assisted-by

==> I partly agree. The code and bug analysis are done manually.
LLM use was the out of tree test harness and lightly polishing
the commit message. None of the submitted code is generated.
If you'd prefer, I can reword the changelog in my own words or
add an Assisted-by tag ?

V1         was a simple clamp
v2/V3      was a simple locking mechanism which is pretty straight forward.
V4         bounce buffer, modelled on gpiolib-cdev (acknowledged in patch)
V5 and V6  entirely your review comments (__free, scoped_guard,
           kfifo_out_spinlocked, __guarded_by, context analysis)


I feel the testing strategy is pretty questionable. Any invariant
violation is possible with that type of meddling.

==> The underlying bug is a kfifo SPSC contract violation. My intent with the
test wasn't to simulate the race itself, but to reconstruct the post race state
specifically where (in - out) exceeds the buffer size and show it causes a
usercopy overflow in the unpatched code, handled safely after the fix.

==> I take your point that forcing that state can itself produce violations that
wouldn't occur naturally. Since the bug is provable from the source but hard to
trigger on demand, I'd rather ask what validation you'd accept here?

I was interested in whether you drove the interrupt sequence via
emulated hardware. I asked because upstream qemu doesn't currently
support the snoop device.

==> My apologies for the confusion, I mixed up things. I have not driven the
interrupt sequence in emulation; as you noted, upstream QEMU doesn't model the
snoop device. I've described the actual hardware context below.

In v3 you said:
   The issue was observed on physical AST2600 (dual-core Cortex-A7)
   in production under heavy POST code traffic during concurrent
   userspace reads.
   https://lore.kernel.org/all/20260527175939.2939714-1-karthiproffesional@gmail.com/
Is this true? What platform did you test with?

==> Yes, the underlying failure is real. It was observed on an AST2600-based
production BMC running a vendor BSP kernel under continuous host reboot
cycles. Because that platform can't currently be brought up on pure
mainline without substantial out-of-tree board support, I have not run
this exact mainline patch on the physical silicon, observed under the
BSP kernel, not yet verified as the mainline patch. I should have made
that distinction clear earlier in the thread.

==> If there's a way you'd consider valid for validating a fix like this
without a full mainline bring up on the SoC, such as a targeted kfifo unit
test, or something else you'd accept.I'd appreciate the pointer and I'll
do that.

