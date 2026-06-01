Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 557BACD6E4C
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  1 Jun 2026 05:40:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=++Hez6BcFzhV60mZuduDVLo3yt8bc2DYA37KVaO+BJI=; b=ibg28qQoNEkUpSYjHljQGOhn/s
	h8H3KRf0sF3iJGy5uk9TvX7mafHw3/cN4+clYDyfpctVZrdhEHHAsNKffnzC502D1x7UcpYANPzXR
	l3CJYwlkDbhy8ufjXWnFPVL6EcbGl0TM131lNMrv9IIZu3k6k1oT9LZB8+9y/q6XqjvNLxZ+d1XcS
	WhP2Vsf+e9fPdQps6W5GZf8BxEbohTwG6qRZnZLfcQdr3zZ03qWFhysgBsHwudo6oumWPsxEXGMdQ
	hHT113gMJR8nw5Ss2LDY5EGvElCPObz9ZqC6+AQx/RK1ZggKRnb6QUaP9lK2nFkm984BzU2XAfS8H
	AjiR0B/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wTvNS-0000000A9fY-0xf6;
	Mon, 01 Jun 2026 05:39:54 +0000
Received: from mail-pf1-x430.google.com ([2607:f8b0:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wTvNQ-0000000A9es-05Hx
	for linux-arm-kernel@lists.infradead.org;
	Mon, 01 Jun 2026 05:39:53 +0000
Received: by mail-pf1-x430.google.com with SMTP id d2e1a72fcca58-8422f395a4aso689389b3a.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 31 May 2026 22:39:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780292391; cv=none;
        d=google.com; s=arc-20240605;
        b=Obnh6MzZJYEe1V8A6Dp0olSaShs+QRdVHFXOyFYkKJ376yisgD+T1m+Mp60icfRo84
         PvO8CcUHXzzSo8L1HcdUua+5r4Sr09DmTrQuycmSenNI8pzd8DIBR5VnRs+f6kmbWP0e
         6DHL/JNVYWtA+YJ0k3GPuORUqiGcH/ycviIDxkmjqQWayrf5aq/umH+h5JNaQEpQ6Nm5
         jkW4riUS5c3+j33T9nRLRpo8Ko/wMUoW5ngYU7HShThB0aOt+qQ2TNqxbETHD/Msyhxk
         Rp2OvdPx5vbrxgcyTUy6cTb39u+zDuIfzpeptio5TbZS7Zmx6U9AUlZmkDm+BdFz2asd
         Mg+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=++Hez6BcFzhV60mZuduDVLo3yt8bc2DYA37KVaO+BJI=;
        fh=ENcpaKdeXHSH7mk2TJcqHcKDCjNXFq1uRJ8qphEUJug=;
        b=EwPF6naWy15XTyQGFeB+A0DZn5RUMTxJRSAyRUMMqxvssRCz484A9ROWlU0a1gy2iW
         NPWc+QEIZGRKugh5GKxHGJ2MgOChjiw3kgaF7w2yZz/iO4kYUddqv3JPjDjKRfsN/NFx
         VxK4RZDssL0ex3n+CBfPdaOPULBkh6sfVs9UaExFKSSAkh4j7oLZC5NsiZpKLycax4mI
         58i0gb55qBy5nYSHySuiO8j0cWUwLhwOtYiwmmtB+X7Yy0dNGBB17N9JLJNW6GfjHTZt
         7b5JtjUmsC0Fti5kDLjHnyrotTFlVFybXklO2IuqBQkgIwd09lLL80F5aUa1FSWabLqk
         JYJA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780292391; x=1780897191; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=++Hez6BcFzhV60mZuduDVLo3yt8bc2DYA37KVaO+BJI=;
        b=aWPsoiBhxrjZR+uV6IrCWjjanWeUVPyuD2F1LOi2fkD4kXlY0HW8dz/ULUYMYFqcOA
         rx21sWPnt6cfkug2Zj1+mOfhrtYmUzuoa+4J2wh++tvEoSA6ss84WdYQcC+cJEX9CIvz
         Zpyk3bw8UuDyvYmg5+uQ/YzQJKW6oOxXd2DEiPhovJdKf1tz2nQogk41D+c8fezXtqKq
         a2mAOuWai7PzbtM6jkAK96wMlH3sk+6dHLLMbum7egc0l68xGnyORbAxymfuThthvqLy
         Hfi9ECcF/mIjgptjv81uxgQYasr4z51SnCad1p3SNINahVvDA8ERwbKqOXhf4/zXTzDG
         dUiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780292391; x=1780897191;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=++Hez6BcFzhV60mZuduDVLo3yt8bc2DYA37KVaO+BJI=;
        b=Ljgy6nD9JDTOu5D6DbOWB6JwSKgxxFAKu62KFvKfzw/xOWQHWBO2r8iC1UHQ5YketB
         3MVmNOiu6oc2gDW1qK51uL5EAYA3cDN9dDVq2c5LQJfVQs30idGQBM9u2T0SSWHDh4sL
         GgjqedcV5dbdKtgnFfESuzI8//ak45UQZ6f+sWmKI3v1AFoicStyiARiu4M0Fwxj0+xM
         s+ReonUvt2EjCnMrmpQp0C1WBCmcf5aW7akVqPXk33Wx7rtD7sSjKb7/7CZc41q/aPrx
         TgUx+lwSIoGxyhCZ6f3nMTKigO73SlwPumEMc29yVQGXPa0ldVk25/TzgqKXiTpxk3EL
         1/9w==
X-Forwarded-Encrypted: i=1; AFNElJ/+nXRp34gLvRImxmfUvLcF15jhx6lZhb6rEcntmlT5Vi1gVWqG9RFmywQLkUfDCYdU5wEF+E7zUtWGZSz1gFDp@lists.infradead.org
X-Gm-Message-State: AOJu0Yxh9VkKrlY/x42exza7aFG1cjI+QRae+HjTSz8yOUCgy5Q4MnsT
	kaz9+5SJ0yKNn1LeG9ACClvdESaN4Jk2UVMWg4RT6sz7+BrK87ZcTakITG6Nm22vRj0SBRIWH6o
	Chcff3nOMQ1U5UwUSmtAPCnnWHnp/lj8=
X-Gm-Gg: Acq92OGQOza9skSJx/zK2EujJZGPdCVhJmtk1zpGmPJ0SbWs3t+Vr6zSQtGPDk9Wc+u
	kF2nJFVlHDHwTmjzFYNRVVzZz13SLcRCb5MQ+MRP8aZOjAAiA+E+gQZmge8hBb9Wsw72Joi9qEQ
	Ze/mnt2kTl3bghUbIbEOSQPxIiGyVUgrwTUsR8+LMvJv8CLa2L+qv5vnWupKsI6zSJD1StoKcRj
	93rMkGZJYtslf2c8Dhxia7ipc/5zlP3qKtPo9IsidJGLXM9J45tvdBliaQCs4IMyK1A9SD/lXC0
	iIaMrTR5DZEPl5AaC3lyyHHOZ10CTQ==
X-Received: by 2002:a05:6a00:aa8c:b0:829:b08f:7353 with SMTP id
 d2e1a72fcca58-84225806185mr7434867b3a.7.1780292391030; Sun, 31 May 2026
 22:39:51 -0700 (PDT)
MIME-Version: 1.0
References: <CAD03fjaBJGtNATBxaYO-PAxdKC=HxYgE+M7HQ_a0O+3Sp9Mruw@mail.gmail.com>
 <2026053145-bungee-flyover-840a@gregkh>
In-Reply-To: <2026053145-bungee-flyover-840a@gregkh>
From: Grewstad <dogestad24@gmail.com>
Date: Mon, 1 Jun 2026 11:09:36 +0530
X-Gm-Features: AVHnY4KL0P2TgGuqwzNPsVxgOuqCoiWIuNNwDFufUXPHqDJofsznfpXWQubqhvg
Message-ID: <CAD03fjaxcS0rfZbNPNQjg7HxAhhTvOBxH=p-Rj_ngaGBPmpXMA@mail.gmail.com>
Subject: Re: [RFC] drivers/staging/axis-fifo: TODO file and subsystem direction
To: Greg KH <gregkh@linuxfoundation.org>
Cc: jic23@kernel.org, jacobsfeder@gmail.com, linux-staging@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	hjk@hansjkoch.de, davem@davemloft.net, netdev@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260531_223952_084973_7A8814F8 
X-CRM114-Status: GOOD (  16.74  )
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

On Sun, May 31, 2026 at 8:56=E2=80=AFPM Greg KH <gregkh@linuxfoundation.org=
> wrote:
> There really is no difference between a miscdevice and a character
> device, the interaction from user/kernel is the same.

> UIO provides a mmap of a device to userspace where it is controlled
> directly.  Probably not what you want to do here right?

Yeah, on second thought, UIO is probably not a great fit here. This device =
is
expected to handle streaming workloads, so having a kernel driver manage
the data path seems like the better approach. Thanks.

> Is that what this device is?
> WHat really is this device for?  What is the goal of this hardware and
> how is it used today?  Do you have the hardware to test with it?  Who
> uses it?

Well the hardware is programmable and meant for hobbyists and researchers. =
It
could do anything, but SDR/DAQ and low-end networking are common uses. But =
since
It is a programmable prototyping board, making it hard to cleanly
categorize it into any
one subsystem.

I don't have the hardware, but I plan on testing it using QEMU.

I was looking for guidance on whether the current miscdevice based ABI
is already the
best fit, or whether it could integrate into an existing subsystem.

Thanks,
Arihan Bhor

