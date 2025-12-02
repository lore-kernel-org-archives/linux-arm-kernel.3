Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03071D12675
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  2 Dec 2025 22:07:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=R+xUpa7tpcXlrKuK2TYMeoF7urpbvQwlpFTRmhMT/tQ=; b=eb28WzRMWYkEAwAAW7rUFne61Y
	guyjygIiol8bwv4jibM/FB2NjzZ1X8SjVX2c0r12JJqNBzVRbpCca6vPF+l94L+J2boazTm6k8UqB
	HyOn3IAZSw74tZJFl+xLtJHpeHK9qlYO3zDucIWRcl83KBvlo5lUkcQXzELOfOvB0Bo3Yz8rzYCh3
	DmCHUtTsTkGoXqFlksHrAE3PtEZUmgdjmqRdyt16UPRhor4Fimeq7NYagjnKvvek8uKqyRHOPBfnj
	UsLKNDEbBDVlZRBkt7gyW4mK9ePdTjM2mjey+qKgSpJMjghHd+8/u9cVI/EgWc0WRkT+ZA0fxz6hj
	5MNGuW8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQYXG-00000005sYx-35J9;
	Tue, 02 Dec 2025 22:07:50 +0000
Received: from mail-ej1-x634.google.com ([2a00:1450:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQYXE-00000005sYZ-0sTo
	for linux-arm-kernel@lists.infradead.org;
	Tue, 02 Dec 2025 22:07:49 +0000
Received: by mail-ej1-x634.google.com with SMTP id a640c23a62f3a-b79d6a70fc8so5837266b.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 02 Dec 2025 14:07:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1764713265; x=1765318065; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=R+xUpa7tpcXlrKuK2TYMeoF7urpbvQwlpFTRmhMT/tQ=;
        b=EbNujE/FI1xnlEsvw5i+wKK6EhkF9r3/1zEUtE43C9VAQEfFpYHgQbQyqvLIcgT+oN
         LuK77XAMMV+ST5fsAMzVw8xuOAFbLyLoWJt9rmNotZyh8+7xfFgPxJ1WCX2ECJXHXDhU
         012W2AxIxjRp9hoOtayMbz/Hd+c+YV9B541Dg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764713265; x=1765318065;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=R+xUpa7tpcXlrKuK2TYMeoF7urpbvQwlpFTRmhMT/tQ=;
        b=aFvW2SFVVEd2L6vmobz7bMA4i8olrGelHLe0/1A8qnQ4bZ2nwQ1i6VXemS4WwOnIf1
         Wp4EMJgbd6oICwO/RBIyP0EHACl+G030k21DsqtmdmTGA3MNY707eHbWWxKhmqjyEXp4
         GZhaBKBj/Rd6HX001fL/YmPugh7TMusADHwTyMSZwGz4Ja0NggdM9VCzDJfg9vmkJXTG
         kz8t6SzTvfh84bFffFrK7EExXv1+GDPC8Cus2Ynt749OZY+EouYHE8agbztEmPKQ0tcu
         Jj8G4RGIkktgiUKz5YvetUNfb+ezztVwhNuI+Vu3nV0I6GDpWb2m/KFePNmZHItQGEI3
         PYQg==
X-Forwarded-Encrypted: i=1; AJvYcCWtPmM8Y0CLYtM3o9JhBCyrK3BgW9GcJv2zwBFl04+B5IoqkFFvd3AcoAfPFlo23E6kvZoxbO4uuYQxumgD/FSM@lists.infradead.org
X-Gm-Message-State: AOJu0YyoxkuYTdqcFJJbcQWvnDJqZXo3iB/Yuuxx0vM/2YcSkUxll6SH
	cyuPsGsuC0kvJ/rE54FSJT2aIIp8uRm46dbjwzF7fdYKTMEhdK2YTHXlpZEqCl1UOtMREsn7lp2
	9cEzV3ro=
X-Gm-Gg: ASbGncuYb7cQpsWzJLu8Wd45to/UcHJ8XCxK53NrEVDBuzRVB0TleG9YWaTxpEaQ5yi
	cwA9k5c9kOXjEyP1KMz6wl4vfJSJ7wNAoNCl+d+fE8UuVNbTLryqe0BVLIylla7QYeejIg7A43A
	V2W9qad1W9A+l673OLq7ySQepEFwoNdUpb0vMPUacHqAwrmlsDyqs+w7FFNmXefBC8bxZyfg9ZD
	sRsE+e2BuVkngEkOOxh8T4Jai48aKBYbs+J4plU4f6VZaue6or5kW7eQZdQP/TxWkFvZTq/NFVX
	lWcmn8EgL1G5K1js3hdCKyfsSHvE5JcLepq7qv7DJZB6JU4OcjNlcmsqu1BeM3XPrd8MgUtLhBH
	IyuL7I144pb8e4avZAM2ntC8C6pMZd9ap46YFygdCaq3SLqdH5dMgmjN5qjJ8kVQ28RPutxEyZu
	uC0UztlQr3HwnYcqTHRtzLB9Fdz7VqRCTKWLlbu1sdV7fvwbPYnXj0DdIdsf1v
X-Google-Smtp-Source: AGHT+IGqmv9mYOaz39HbmO3YdTblkWr5MSmMApXtDshukbUEMS2TIl5Lz+2MK5DcSKW0nL5MsXvSCg==
X-Received: by 2002:a17:907:3cc5:b0:b71:51b:bd4c with SMTP id a640c23a62f3a-b767170c7dbmr4355773866b.50.1764713265526;
        Tue, 02 Dec 2025 14:07:45 -0800 (PST)
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com. [209.85.208.46])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b76f51c67e2sm1628745266b.27.2025.12.02.14.07.42
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 02 Dec 2025 14:07:42 -0800 (PST)
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-641677916b5so3614689a12.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 02 Dec 2025 14:07:42 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCW0SxiNu3ZTBibaDk/hHpgJkDIxL1PXDqssmLot7RHp1GJi6zFdPcWiMgZwcJfjPKt69kOYnvt4na9ZESeDf1va@lists.infradead.org
X-Received: by 2002:a05:6402:280e:b0:643:129f:9d74 with SMTP id
 4fb4d7f45d1cf-64554320e9emr44585697a12.7.1764713261899; Tue, 02 Dec 2025
 14:07:41 -0800 (PST)
MIME-Version: 1.0
References: <20251126090505.3057219-1-wozizhi@huaweicloud.com>
 <33ab4aef-020e-49e7-8539-31bf78dac61a@huaweicloud.com> <CAHk-=wh1Wfwt9OFB4AfBbjyeu4JVZuSWQ4A8OoT3W6x9btddfw@mail.gmail.com>
 <aSgut4QcBsbXDEo9@shell.armlinux.org.uk> <CAHk-=wh+cFLLi2x6u61pvL07phSyHPVBTo9Lac2uuqK4eRG_=w@mail.gmail.com>
 <aS7e9CbQXS27sGcd@shell.armlinux.org.uk>
In-Reply-To: <aS7e9CbQXS27sGcd@shell.armlinux.org.uk>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Tue, 2 Dec 2025 14:07:25 -0800
X-Gmail-Original-Message-ID: <CAHk-=wg4ZnsfpgXYL5qhjYDYo1Gnssz+VxnKZzHXMEmE7qrnQQ@mail.gmail.com>
X-Gm-Features: AWmQ_bndnZuSySd3c7NVIocYoeSzskkAStzH6Kc1-mQN9xQL8na8ufP2gzQ6Lfk
Message-ID: <CAHk-=wg4ZnsfpgXYL5qhjYDYo1Gnssz+VxnKZzHXMEmE7qrnQQ@mail.gmail.com>
Subject: Re: [Bug report] hash_name() may cross page boundary and trigger
 sleep in RCU context
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
Cc: Zizhi Wo <wozizhi@huaweicloud.com>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, jack@suse.com, brauner@kernel.org, hch@lst.de, 
	akpm@linux-foundation.org, linux-fsdevel@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-mm@kvack.org, 
	linux-arm-kernel@lists.infradead.org, yangerkun@huawei.com, 
	wangkefeng.wang@huawei.com, pangliyuan1@huawei.com, xieyuanbin1@huawei.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251202_140748_278186_C2047DA9 
X-CRM114-Status: UNSURE (   7.89  )
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

On Tue, 2 Dec 2025 at 04:43, Russell King (Oracle)
<linux@armlinux.org.uk> wrote:
>
> What I'm thinking is to address both of these by handling kernel space
> page faults (which will be permission or PTE-not-present) separately
> (not even build tested):

That patch looks sane to me.

But I also didn't build test it, just scanned it visually ;)

            Linus

