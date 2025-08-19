Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80C36CA0EE6
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 19 Aug 2025 15:48:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=q/m1LY6xfwm2u+s4duiA5oQcykTMbM962zM/dxGBy3Y=; b=fAlZeUqyZuby95Bi1sT0u0zIvP
	0O4rW/LvLwSulx+PkE+N9YdIcUIqSZohi3Dk2G6HZa3XlFJOZadQ4uc4Ji3MijicftJ9wCF4Ar2Yi
	HPmJnunABDpdx9ttlMJTy4pEMRjVIZRItX0iBwYJ+38cekbp9IuO2snyTs0I3LHbHYXTHdsGJaOXm
	A9WBPvCW7I9F9Oh+hlZaOBDI8a8XuxPCh+O2+5/hVy0nRpNQvY7h9hFrXkwM1t6wugAW5OXLmfS20
	S8HoYeFMx5Upz+XbY6slVdVSg3hH+OJ8GYvtTkrPnpO6zbfBp3mzclsu0tE0tlW2gYAOvsGxtCPXH
	ZUmmcCFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoOZK-0000000Avia-22HU;
	Tue, 19 Aug 2025 15:48:14 +0000
Received: from mail-yb1-xb2e.google.com ([2607:f8b0:4864:20::b2e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoLmt-0000000AULC-0RA7
	for linux-arm-kernel@lists.infradead.org;
	Tue, 19 Aug 2025 12:50:04 +0000
Received: by mail-yb1-xb2e.google.com with SMTP id 3f1490d57ef6-e934c8f9751so2368952276.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 19 Aug 2025 05:50:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755607801; x=1756212601; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=q/m1LY6xfwm2u+s4duiA5oQcykTMbM962zM/dxGBy3Y=;
        b=ASmEVlbi6/g5AqoS1q5eujAsAsNvj4faiX3n435oGnvXU965Z80Jo+xLZxdDZlgdCM
         CwYuFynic278AMrP3v/zoASV8GzC25EFLJzeYSQcRlNvL+ld4KUztEbzIjZwC0xYEpCJ
         zsf55i7I+PAtGkKabPwKKNsZdXo0KbKGJNP0KG3IeJg22/0HNFf3xc2dlpiJcwH+ysOv
         VC4vmnI3Vbi+tEfd+t4yvin32XXV1NvExwWjFyA7pzyCXn7HnjVhDpeHdj+SM8+QMosK
         +qejs6jUaQboiqmy/CTjCfQziNPjpAg/vhtCUpdKbkMc0xSZ9IlqvwCTkZgYbS4TnkCc
         GrqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755607801; x=1756212601;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=q/m1LY6xfwm2u+s4duiA5oQcykTMbM962zM/dxGBy3Y=;
        b=HDU/NzxuM9+7U8CWBzHutuAoFlRKzc1Ql8zMLg9Rosz9nG/P1Aoeg/N7FKj8v7FOBq
         y73SK1jmI9tlQQtD/VWt8jyzqt9qKHzzaxOeSgARTtpURXjYhyN1D7Cq1FXaKMOi9qTk
         EyfbqpmhxX2bB5sjhlagvVM3IRgDKRZF46Pu0X8qf4kDJ4kro9fdIcr1sBznV+xw+NuP
         VWBmzx2QQdIfYYf5BHt2xiBoXYvVzWQAmb0cTUweAx2+kMq6zgPD1yvtmzz9xjsKSkH7
         xTnoETZfYUbAi2BKHd1EHpTPFSyvj2MV1CCUdLCeN5vOgtCMeyW1U+tH8zcmE1aA3P9N
         gkDA==
X-Forwarded-Encrypted: i=1; AJvYcCWALjMNe0cZKmwC3CS09xgL7vgRspXCZtHYhUypifB++3ksQtEEdHVKcICSYtotxzl22tvQoSwFAfEM2G0Jqll2@lists.infradead.org
X-Gm-Message-State: AOJu0YzR96++oI6XpDa39TLHaQ0V6CeFj3JOZqPvVxtIqNPZ3K2ZYkV4
	s0hKdHQ0kJne+Etqdj8Y9hX7jYI4Fgr6vWYKgOcgpVS8aQZJLduyKsS/xsnPfmWw7CPSeR2JS0/
	yoapiPlB/IxhQM7rELVqbKLSsm7rkbQU=
X-Gm-Gg: ASbGncu/992MOprfG0W3+qaqiCABToH230AH+sF6ZFiy5NiIyAoaPJt9mmwpRUjgdAq
	6EVc6B21ehcoYnY5sEeBSf6pff1wtSJ+d8sx/5HrOgXJ29UVrlylV5w/PieALjb5ybuqk6TmRqI
	q5ODXpJHPlhN/aYRADXFP8W6uGNwTheOkmLDiZ6LBMoVOSA10156in4dxDzJBzEldGFT7hQeei8
	8VUfkjQLJAbMqy63l0VE3d1ZDcu7w==
X-Google-Smtp-Source: AGHT+IH1h+BxKBN05pHvmSdWJ4xJ7m/5SogwxucTQGgwiqZY0kchIq341vqJ9PFqt91EW03TMyusPsdeBGu0IIfihnA=
X-Received: by 2002:a05:6902:330e:b0:e93:2cea:b3f6 with SMTP id
 3f1490d57ef6-e94e630dad3mr2829156276.43.1755607800721; Tue, 19 Aug 2025
 05:50:00 -0700 (PDT)
MIME-Version: 1.0
References: <20250819-macsmc-subdevs-v1-0-57df6c3e5f19@gmail.com>
 <20250819-macsmc-subdevs-v1-5-57df6c3e5f19@gmail.com> <20250819123505.GC7508@google.com>
In-Reply-To: <20250819123505.GC7508@google.com>
From: Sasha Finkelstein <fnkl.kernel@gmail.com>
Date: Tue, 19 Aug 2025 14:49:49 +0200
X-Gm-Features: Ac12FXzpOXpP5YWbSOcVjUpbhP2SuxCAjsf5aVyKzjKV0kcqir3rI2XCSKPBx60
Message-ID: <CAMT+MTQvMnv4Zj3A8hskU1JW3zys0diKxWUzK5ScerxeSmgPjw@mail.gmail.com>
Subject: Re: [PATCH 5/8] input: macsmc-hid: New driver to handle the Apple Mac
 SMC buttons/lid
To: Lee Jones <lee@kernel.org>
Cc: James Calligeros <jcalligeros99@gmail.com>, Sven Peter <sven@kernel.org>, 
	Janne Grunau <j@jannau.net>, Alyssa Rosenzweig <alyssa@rosenzweig.io>, Neal Gompa <neal@gompa.dev>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Jean Delvare <jdelvare@suse.com>, 
	Guenter Roeck <linux@roeck-us.net>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, asahi@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-rtc@vger.kernel.org, 
	linux-hwmon@vger.kernel.org, linux-input@vger.kernel.org, 
	Hector Martin <marcan@marcan.st>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250819_055003_137859_3A0CBDC9 
X-CRM114-Status: GOOD (  10.63  )
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

On Tue, 19 Aug 2025 at 14:39, Lee Jones <lee@kernel.org> wrote:
> Separate patch please.
>

Per the discussion in the thread linked from the cover letter, the dt
maintainers have requested the bindings for all subdevices to be added
together. Do you want a separate series with just the dt bindings and dts
changes and the actual drivers in separate series or how do you prefer it?

