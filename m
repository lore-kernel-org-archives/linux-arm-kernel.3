Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 742BFC3601E
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Apr 2025 16:02:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Subject:cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=EXKgyYog58kyfqHQcoNTtvL08JiFX/6XLrBhO7Ve8ts=; b=tD5CiV0KAruMu/ccClxYEWH9PP
	Imtd+knuNSZtR8k2jKPGMy1/QSoX3FQarNcJajKgH83NGTZEY7KTGWKII+34t1lbS32jjsfq3Ddot
	nRoyrzf0wMdrG0QpRirKc8ied5k1ISr+kiIYB4BXOHrClaCYiaV+SKInSJjKw0DE+PfA8sBXSQ9M9
	cnAqxEKEzj/+lHp38WO/p+8bDRYjxv8K4h/m4e1X02F+qayFmh3bw7fmLw2sf68PZcOXx0Prf5mmk
	0kTDlriq0qtoPs3jBfbjYrt3ZwrK07F9tuXw1guMeziiAqmWN4HU0Eud2zrmrJgP8yKc3P+WLY4fx
	fIN3pWpw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2uM0-0000000B7Ou-1mEG;
	Thu, 10 Apr 2025 16:02:12 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2tYL-0000000Axyw-1Rae
	for linux-arm-kernel@lists.infradead.org;
	Thu, 10 Apr 2025 15:10:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1744297850;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
	bh=EXKgyYog58kyfqHQcoNTtvL08JiFX/6XLrBhO7Ve8ts=;
	b=fnPHS0bFdGfNjzoLss57CtLVjoQbDjhbl8B/Ua34oqfvilT26vgaB5oJM/3vWnM8TZgBGh
	mQpClRz/crcrqa8nEWADMxJa2cuffH9qnqwcBvwM5hyeQr52T4dpbYh4CHJ/msPInUGQsK
	5JWZHV4GLSPOEMDUBMsmcp98jydqhQo=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-386-_xLHAlg5Ojytjufyl9znqw-1; Thu, 10 Apr 2025 11:10:47 -0400
X-MC-Unique: _xLHAlg5Ojytjufyl9znqw-1
X-Mimecast-MFC-AGG-ID: _xLHAlg5Ojytjufyl9znqw_1744297846
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-43cf3168b87so5440165e9.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 10 Apr 2025 08:10:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744297846; x=1744902646;
        h=mime-version:message-id:subject:cc:to:from:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=EXKgyYog58kyfqHQcoNTtvL08JiFX/6XLrBhO7Ve8ts=;
        b=gPscfmKQj9HUMVMTa7gX+4tS3E6jtq44RoU41TtK969Sbrwp+aimXADa2r04+9i1es
         wnFIoM2GME5FM22W2Rdb2psi6JIHluAlWvaz1oWNtubsr6F+IBzp7df5rWD89kxhWRRv
         dsVd3Y4lD74KvaWRgfxDoYCgv86mndrFR3/JKMcOUDyWqeHegEOVQCZV99DmHKvnC1nX
         rZYrm8k2NiGNlYP6ohXGv1f+FfrB7TmMBQDjnEe44hP2Mm2HTpRKD9rVFyEsJHCBl9nT
         9zGqtog5JyfPzHgR5xw8s7C/RRrSO3K/x7WJ3Ym7Y3TJZBypXd86pqz/HaSxCDs0ZEf5
         /mlQ==
X-Gm-Message-State: AOJu0YxMFfKdc441ZaoFSeqoaBWvOpirlFdaDK20jxtH+dTKwrDJ5ulZ
	24+vhSqCc2biXK3aaJKKMJFSLuhNlK9E/24T49hfp1gqbsrRGx8Yk+fNFE0EzUXhnlAid1yaQO2
	zZtEX9DsOsAXSO2fAti99sAfCQ+6sGPzVA5vz5T7oIlCWvLXqwZjAeOiD4eDCH7lukhv59LL3
X-Gm-Gg: ASbGncuF+PuCG5FxR/65o3BRZbhgYq5HP+B0yvB1z92sCOFdW0KHTVKatWhV/1w0RI1
	kefjMoJ5r/IF7I8It7koEQz976H6GEvZrTi/lm5CMTHBXhuEW8l7wkvedPTMcYqwToPX11Ym1J7
	aTyk5QJY5mQC66dL4LlcwwJjbU1iudXQVWwV6qjKqJ/uUdDZHuJkFZDmrgjlWw2wBW5F16K3fB+
	6d5fT9+HOBd2zn3rOhtsQhq092Bx3kXwk/I6oWTa6wP0wHylU30yby2Y/UWylUuZ3WgoDJBT9oF
	aPZXZpdKsrGXcoBD64BXU9VfZRKh/PJ1rISaUrSj96ecPVEUBblWHzAgNFCh
X-Received: by 2002:a05:600c:c19:b0:43c:f050:fee8 with SMTP id 5b1f17b1804b1-43f2d96d12bmr27394495e9.20.1744297846039;
        Thu, 10 Apr 2025 08:10:46 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFxwdlqvMr0+eJqJHcy2sApkT2sXjxRivRro1I+Xe8jUjWmS3HlK9o9rH1isaEbTm3IHTMmxg==
X-Received: by 2002:a05:600c:c19:b0:43c:f050:fee8 with SMTP id 5b1f17b1804b1-43f2d96d12bmr27394165e9.20.1744297845618;
        Thu, 10 Apr 2025 08:10:45 -0700 (PDT)
Received: from rh (p200300f6af1bce00e6fe5f11c0a7f4a1.dip0.t-ipconnect.de. [2003:f6:af1b:ce00:e6fe:5f11:c0a7:f4a1])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39d8938a860sm5156906f8f.54.2025.04.10.08.10.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Apr 2025 08:10:45 -0700 (PDT)
Date: Thu, 10 Apr 2025 17:10:43 +0200 (CEST)
From: Sebastian Ott <sebott@redhat.com>
To: Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
    Joey Gouly <joey.gouly@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
    Zenghui Yu <yuzenghui@huawei.com>, 
    Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>
cc: linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
    kvm@vger.kernel.org, linux-kselftest@vger.kernel.org
Subject: arch_timer_edge_cases failures on ampere-one
Message-ID: <ac1de1d2-ef2b-d439-dc48-8615e121b07b@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: Tg98KJP3KtXPJ22cEzykJc0X4hEX8vQtQRGTR-06jiY_1744297846
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; format=flowed; charset=US-ASCII
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250410_081053_454442_A73C40C4 
X-CRM114-Status: GOOD (  11.16  )
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

Hey,

I'm seeing consistent failures for the arch_timer_edge_cases
selftest one ampere-one(x):
==== Test Assertion Failure ====
   arm64/arch_timer_edge_cases.c:170: timer_condition == istatus
   pid=6277 tid=6277 errno=4 - Interrupted system call
      1  0x0000000000403bcf: test_run at arch_timer_edge_cases.c:962
      2  0x0000000000401f1f: main at arch_timer_edge_cases.c:1083
      3  0x0000ffffa8b2625b: ?? ??:0
      4  0x0000ffffa8b2633b: ?? ??:0
      5  0x000000000040202f: _start at ??:?
   0x1 != 0x0 (timer_condition != istatus)

The (first) test that's failing is from test_timers_in_the_past():
     /* Set a timer to counter=0 (in the past) */
     test_timer_cval(timer, 0, wm, true, DEF_CNT);

If I understand this correctly then the timer condition is met, an
irq should be raised with the istatus bit from SYS_CNTV_CTL_EL0 set.

What the guest gets for SYS_CNTV_CTL_EL0 is 1 (only the enable bit
set). KVM also reads 1 in timer_save_state() via
read_sysreg_el0(SYS_CNTV_CTL). Is this a HW/FW issue?

These machines have FEAT_ECV (as a test I disabled that in the kernel
but with the same result).

As a hack I set ARCH_TIMER_CTRL_IT_STAT in timer_save_state() when
the timer condition is met and set up traps for the register - this
lets the testcase succeed.

All with the current upstream kernel - but this is not new, I saw
this a couple of months ago but lost access to the machine before
I could debug..

Any hints what to do here?

Sebastian


