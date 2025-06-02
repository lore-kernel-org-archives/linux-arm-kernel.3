Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B6ABC5AD49
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Jun 2025 14:49:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Cg0dwJvYfbYUNtSY86lpjPZ26U71B5eHF51TBSSqPe4=; b=ZOlrK84RX5OS30Mi6DvL+vVkgk
	S2vJqipsFLBUkJat0Ru9+5ooTZ/ZYQFK4NGOgmJ8kIx3tQPbBAlpA1/mbBmVORlist1IJ7AcAU3kD
	w5WbICk7PZEbPAW2Ew4xRV/WZiaw8/nN7t+zVMML7GFcuDD3TGMa9ljPGBR/ZhMb3lmJqU/2+tUKY
	AR60Zdw69MBJJLV9QwdCeXiMAbF0lbvnWg9mggKGEqYEXFdGEalDE8ci0PAZ0mixZFv50ZBuhZHW0
	UdVh8R4Bt+XFqoC3qgl0weTn+kgRm9n5nUonfUk/4V4QrZWSw5x9MgTwR6q0QDCMDApq+y/HXUUoS
	azuvwOXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uM6Tc-00000007fWD-2I1J;
	Mon, 02 Jun 2025 14:49:24 +0000
Received: from mail-ed1-x536.google.com ([2a00:1450:4864:20::536])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uM6Qb-00000007f4o-3Ury
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Jun 2025 14:46:19 +0000
Received: by mail-ed1-x536.google.com with SMTP id 4fb4d7f45d1cf-606741e8e7cso1355743a12.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 02 Jun 2025 07:46:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1748875576; x=1749480376; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Cg0dwJvYfbYUNtSY86lpjPZ26U71B5eHF51TBSSqPe4=;
        b=REJLp6cVmf4iFzmKsV8HGYQEusOev8WKph4/PXrFfyzyZRaSTNOUW9eAJvt9J1AMqU
         5P05vWgTU0PVVi6xhsYheZOtgeoSCG+0TQHd4R6hQloigxAgHZG/1OUGeC1u+inMBsq4
         /tPVqEx0Ue7xD4nZmVOnH4CgdLxUIILhzHEdI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748875576; x=1749480376;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Cg0dwJvYfbYUNtSY86lpjPZ26U71B5eHF51TBSSqPe4=;
        b=Ht2uc6CBhOuXAuqOoiSgcv1vCoR8rbLaZqnysDBCFyeH3smWSTJZVpihuqB8DSvlLn
         uHAEvv7CVUiouFrHehH4omfcII2LgDkgbxtP9r1q8Qh4/J0nWdzFHBp4jgGH9DzaRFxx
         uIJCnFb3k/MSbVjogGJG0ZPzl9UNUOrkFKFOTnHx1VwuxmviCbw0oIxOTx9Owe5VWNga
         Ox7fViU8LIZwDaZfqgUheCgoq3Q1OiQFQCrgxmn6VnfgJZ+x0qk3TQId8NViMhg3hOZv
         bLz6KqXAhbaxHUNsIyUTPj2198O8JExa7VRhwYrwUaFRFL8EyrvBvTmo96yaLPhlu0YY
         8I4A==
X-Forwarded-Encrypted: i=1; AJvYcCWOCUEoFUvuSyy8HRD8cE5ED+izFaDcw9EjLTcp6P0/HSwT4FzYaSHYJScuA/xwRjaLo9xSqsCII0f//4xWMpnA@lists.infradead.org
X-Gm-Message-State: AOJu0Yza7dZqJ2cZcn/o0GIhvc8Ug+eVof2ge/Hc7fRhlfthwXKDuLAJ
	E1EoCp6qhq1GWtgpQzWfVFMcVAXi/sKCY8BDgbCrgrCRaF0Fs8DXdSN52a9eR/7mL9ar5qvsLrz
	y3Gjdi68=
X-Gm-Gg: ASbGncuo3CsAHJtHZtVTYNwxL10XDITFY05f21YrzqT3Bxu09yrUKgpt4cPdhtJiu/Z
	E18jPsCfbqOexyWFqloSxibsqFrQ0XZDvh9Wov/GeKBbLhgUoYX6BYn/J3vh1NIoGwWt/vM+Wlm
	3zeNdlj5pXdwlNS3t/yQLCwMblbixxfoCRafZ6uBkVr/lz2D3L+49ntj4Nt49j1SO9opVsVVBQ5
	RHKd6ioqgngCS7l7pEQzb1XjcmAgBY1sV445gVyxIGtU7Pu/p3uGgAOXtgxLs60G/noH0GYluP2
	Lud3jNZhIxvAirtJf6w3Tyx/67Cl5HkwQAXwfvC5ldtdWWJhns2csQMEHmZ2S3Y2shfV8CZn/zn
	w5BMg1q0mMFG2H50PiSBdcN5fEKlbdDMxiSOntIzGfjM/99w=
X-Google-Smtp-Source: AGHT+IGkY9uz2bZWsFeuapJKswfsp7Yuxe2SQW3BAIwUeE/3t22oZ1RYpJY8Tjc8Srbms18LcCXc9A==
X-Received: by 2002:a17:907:d7c2:b0:ad8:8efe:31fa with SMTP id a640c23a62f3a-adb32599e63mr1323957066b.58.1748875575952;
        Mon, 02 Jun 2025 07:46:15 -0700 (PDT)
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com. [209.85.208.52])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ada6ad3acf4sm805397566b.150.2025.06.02.07.46.13
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Jun 2025 07:46:13 -0700 (PDT)
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-606741e8e7cso1355623a12.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 02 Jun 2025 07:46:13 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUOan2s3HjepoV9aNSv0n01EcBzAQfK0PmwRlbSY6cejSWqfJcdfwtr2PRDMhmuEWAG+dTqKUh3hWv/iGKOAvZi@lists.infradead.org
X-Received: by 2002:a05:6402:5205:b0:606:3146:4e85 with SMTP id
 4fb4d7f45d1cf-60631464feemr3563572a12.4.1748875572780; Mon, 02 Jun 2025
 07:46:12 -0700 (PDT)
MIME-Version: 1.0
References: <20250428170040.423825-1-ebiggers@kernel.org> <20250428170040.423825-9-ebiggers@kernel.org>
 <20250529110526.6d2959a9.alex.williamson@redhat.com> <20250529173702.GA3840196@google.com>
 <CAHk-=whCp-nMWyLxAot4e6yVMCGANTUCWErGfvmwqNkEfTQ=Sw@mail.gmail.com>
 <20250529211639.GD23614@sol> <CAHk-=wh+H-9649NHK5cayNKn0pmReH41rvG6hWee+oposb3EUg@mail.gmail.com>
 <20250530001858.GD3840196@google.com> <20250601230014.GB1228@sol>
In-Reply-To: <20250601230014.GB1228@sol>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Mon, 2 Jun 2025 07:45:56 -0700
X-Gmail-Original-Message-ID: <CAHk-=wjO+t0FBrg=bHkbnXVsZ_U0TPgT9ZWUzu12-5NurCaWCA@mail.gmail.com>
X-Gm-Features: AX0GCFuodXM8SKmhJCuuDQhW2iq8pjrSnsjy_QXiBCm4TA9D0azfhocKT2KWhmk
Message-ID: <CAHk-=wjO+t0FBrg=bHkbnXVsZ_U0TPgT9ZWUzu12-5NurCaWCA@mail.gmail.com>
Subject: Re: [PATCH v4 08/13] crypto: s390/sha256 - implement library instead
 of shash
To: Eric Biggers <ebiggers@kernel.org>
Cc: Alex Williamson <alex.williamson@redhat.com>, linux-crypto@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arch@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org, 
	sparclinux@vger.kernel.org, linux-s390@vger.kernel.org, x86@kernel.org, 
	Ard Biesheuvel <ardb@kernel.org>, "Jason A . Donenfeld" <Jason@zx2c4.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250602_074617_864582_AE6F7540 
X-CRM114-Status: UNSURE (   8.93  )
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

On Sun, 1 Jun 2025 at 16:00, Eric Biggers <ebiggers@kernel.org> wrote:
>
> I implemented my proposal, for lib/crc first,

Ok, I scanned through that series, and it looks good to me. A clear improvement.

         Linus

