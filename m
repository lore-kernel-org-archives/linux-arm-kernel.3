Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24678C36011
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 26 Mar 2025 17:25:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YlX138X0XD6VY0/PSMsdwRSoZx6II/giCuqBLoh1aW4=; b=pXGLJpA+YD1cF14hYLBTbkI97j
	F1YPLDWZI4DGMHIN+uLiIJkyLYa8a2N2QfQV6Mug7PbekHTU0xma3A6vPCpjnZ66MDJVsxKs+lr+w
	X/EPF7fCKNyu4urOyL857EECeV54aZBiXdVspEIvhRI11Vc5D2DGQ7a9FE/mt/uJIFu2m0dhKNCTF
	qKrUbmwlaIQN1IUVebhNTDhpFKqwNfCudNCz6bPgL6XsFXRdaFN+p6KsKhaGxurZJl2+93CpfH81O
	H+6Wzxl6E17iefEmPygmiRDIWzvyUxcG7gptgo5S+i9JzDWg5zIykZs/27PuBdXbDjbCqGJVDnLhi
	AaDQ+ZUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txUVb-00000009ARR-48F4;
	Wed, 26 Mar 2025 17:25:43 +0000
Received: from mail-ed1-x536.google.com ([2a00:1450:4864:20::536])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txTyR-0000000949U-1EkM
	for linux-arm-kernel@lists.infradead.org;
	Wed, 26 Mar 2025 16:51:28 +0000
Received: by mail-ed1-x536.google.com with SMTP id 4fb4d7f45d1cf-5e673822f76so13199a12.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 26 Mar 2025 09:51:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1743007885; x=1743612685; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=YlX138X0XD6VY0/PSMsdwRSoZx6II/giCuqBLoh1aW4=;
        b=gLtWBb0nY5k4lONk+m2nQDwqFyyhA9SYbv/zetmSTayjL+rccKiR9a7nqee91NZHJ7
         BYEx14f1kl0MM8ozL9PLrWOOk8fE0qMVlStjEb632wMKVC3AqtsX/50CBWUMAlgB57VN
         w0vqxueZ9IT++GsmAzT5Z9ZptCc17208YFEXQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743007885; x=1743612685;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YlX138X0XD6VY0/PSMsdwRSoZx6II/giCuqBLoh1aW4=;
        b=ZtZ0PZfrPkXhi5kOx4thHVdOjYyoid/PpmVVnvmMUEdEPRkJDVRiGxxn7QIT77am5T
         rmsymENFd+UHZPUSCVQsh7N2zS2u11hzel76lsADpMlF6PxUTzPHMzZVqm2+idD8bCAO
         igdEZEiXoMsaYXimxEzV7MXeFgYdx9Kre0kInEzJlyp73YxBBdo8WEkdm5uZzKpSkPUa
         GqTx9TrnzOxX7e04hIQmpBzAhAiuk3li+aRWDS+S1G9Kymg3mk4cq0L2m1kquJQmz6EV
         /K7BZZQyXzuhTuzpNZuJrSsFlxFNkoWDGUJM9nFxsla/LBdJXERkuY8sxu/4Tw9W/Wlz
         bwlg==
X-Forwarded-Encrypted: i=1; AJvYcCWnMmAhw2d1egI1t0lulsFNZc0hX+z5wP9J0ttZIc4rOajDInMFX9q5QnZVPM8vNnfFhzz9rl9kkGb3fG0PRs6w@lists.infradead.org
X-Gm-Message-State: AOJu0YzQ23a23K/LK9Ys8fQHJG2WaS0AohnkZ2mz1kAq2bt2yPYrh4S3
	GQL6jvi0tVzr5jDU/c8OSp/lqzl4AUta+jV562tfwOf4xlYmC7DkJ9oaCA0YfGCyD9bTpBL7gOf
	o/piytw==
X-Gm-Gg: ASbGncuB5mBPyUzncH7OucM3gt9sxim+09/sRG3NUNtJ1bBzMWl9URW2jd2cNQMMRLh
	JU6hEkUM1K2ZcSgaNn+sxQtvZwHUzukmacGSTB9Ta38aLsdEOAfmBjunOQjoZlC3xdU/Y7IwIQ5
	kvHH/eTjEK/cANE8WkosfJw2Lx77hPFKlh97jD5U/GQwlxfKTvhWUh4LaWVdCi9D6DwzVWe7s5I
	xyf5+rvouxfNmgz7dzRFjNUfbihRYoJU8+MQbOKHAGJDtzBfd4mDGelX2dkIpJLsBBoYEupic0Q
	/7s1uSvXGUeEDYpADQGiTQEeFfH3eHLVzSxvPN/nAYazKcM2g137eNTxp/EvZeapswEOiY9xIjj
	OYFop8zne54eQShHzLoQ=
X-Google-Smtp-Source: AGHT+IFKofa3XwBcFkhEzS399E6FZoqZSEKP10K7Ewv7qDTkM5DmWYg7YzDe14c6/53Fdq5tlCdxYA==
X-Received: by 2002:a05:6402:3506:b0:5e5:c5f5:f5b with SMTP id 4fb4d7f45d1cf-5ed8f01bf3emr205713a12.26.1743007884732;
        Wed, 26 Mar 2025 09:51:24 -0700 (PDT)
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com. [209.85.208.45])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5ebccf84c22sm9471507a12.18.2025.03.26.09.51.24
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 26 Mar 2025 09:51:24 -0700 (PDT)
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-5e5bc066283so49903a12.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 26 Mar 2025 09:51:24 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVWAX+9WoWq0m4+rr0E4dWHHISyghYbJhxTI9t35xiGvtZpSjonfkDRrCscasycCKpw2nd0j5cXkApHJCu/6HFl@lists.infradead.org
X-Received: by 2002:a17:906:6a2a:b0:ac3:f35c:755a with SMTP id
 a640c23a62f3a-ac6faea0d57mr13698466b.15.1743007883744; Wed, 26 Mar 2025
 09:51:23 -0700 (PDT)
MIME-Version: 1.0
References: <20250325195322.3243734-1-catalin.marinas@arm.com>
 <CAADWXX-0hMgpyeQw_7Ko14hNMciqSnKJAROEWS5vwAdMKUt_zw@mail.gmail.com>
 <Z-NHugcLdLqkEHFR@arm.com> <CAHk-=wg_HipugbtswxFnekQy2g_ksKKXj+yht8naj2FEMtRMgA@mail.gmail.com>
 <20250326124025.1966bf8a@gandalf.local.home>
In-Reply-To: <20250326124025.1966bf8a@gandalf.local.home>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Wed, 26 Mar 2025 09:51:06 -0700
X-Gmail-Original-Message-ID: <CAHk-=whwmmU+hv1SyMoyr8yAGP2JiAAP+g5BZaMajzAukzrM9w@mail.gmail.com>
X-Gm-Features: AQ5f1JrHB7Lot0cInBUrRaxXLA6wQWz74bylkRNtBdz9wX2p3sbslySwH8F-I1o
Message-ID: <CAHk-=whwmmU+hv1SyMoyr8yAGP2JiAAP+g5BZaMajzAukzrM9w@mail.gmail.com>
Subject: Re: [GIT PULL] arm64 updates 6.15-rc1
To: Steven Rostedt <rostedt@kernel.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Konstantin Ryabitsev <mricon@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250326_095127_356305_618A07AD 
X-CRM114-Status: GOOD (  10.64  )
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

On Wed, 26 Mar 2025 at 09:39, Steven Rostedt <rostedt@kernel.org> wrote:
>
> Now I wonder if you see any of my emails that I have been sending?

Your emails are fine. You're using a kernel.org address, and you're
going through smtp.kernel.org, so they have a perfectly proper DKIM
signature:

   Received: by smtp.kernel.org (Postfix) with ESMTPSA id DF624C4CEE2;
Wed, 26 Mar 2025 16:39:38 +0000 (UTC)
   DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
s=k20201202; t=1743007179; [...]

> I have my own email server which is on a dynamic IP which most ISPs will
> simply drop because of that, so I route my email through kernel.org.
>
> I just sent myself a few test emails and there's no DKIM signature, unless
> I manually edit the From to use my kernel.org email (which I have never
> used before).

If you don't see a DKIM signature, it's probably because when you send
emails to yourself, they never actually go outside your own little
smtp setup, and never go through kernel.org at all.

               Linus

