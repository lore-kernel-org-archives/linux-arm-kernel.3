Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 903A7C9832A
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 26 Sep 2026 15:30:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=r93vo6YJEV/n1FD4tzzKSMKvC9BRqIXeipynuzwoWIM=; b=eM0OOxEbvE516AN3TXESgkxKBZ
	1skuxWJDrm/OkmOwSo2GGprETbR61hXX+ZDH8OvziKUuPhnjX7gm9OLeaIHRIdsGL4qL2/EZGM7rV
	61dStlufZd101/Tb0H1sAGbaD2Orn3WNI5cGmLnk2iT61zluHj1g7j5ZrdD2UjuQnX+uCkrmAvlsf
	CF3+RumTgdo4W+mwjUAkgoDYKzYfh7Vv7Xww0271n3tNE5hVRX3IhRzvtL3UkogF4xGKgQPRv+Kaw
	nMCdFG3VOUlW7e8bkA35Am30cyJhR7uLa2sbZHMJRc4/Ks6dN6N41Jfyr9QnvVMWjKxVm4NrWwepg
	6WuJWIBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xAUIr-0000000FZvu-1alV;
	Sat, 26 Sep 2026 15:27:05 +0000
Received: from mail-wm2-x11.google.com ([2a00:1450:4864:31::11])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xAUIn-0000000FZv2-3o65
	for linux-arm-kernel@lists.infradead.org;
	Sat, 26 Sep 2026 15:27:03 +0000
Received: by mail-wm2-x11.google.com with SMTP id 5b1f17b1804b1-49ffde3cec6so1733275e9.3
        for <linux-arm-kernel@lists.infradead.org>; Sat, 26 Sep 2026 08:27:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790436420; x=1791041220; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=r93vo6YJEV/n1FD4tzzKSMKvC9BRqIXeipynuzwoWIM=;
        b=aW8kFcbw+J5yk0DN/g9JJ8kei2VWx+oqFvTjum3U1NXGdoFcGdqC5XfDoBNwdJlIev
         On/LZCqcRqkZCrPg6YztlqEQ7KcC5oTPYAvIYAWg8WmnKyhh0NX0nu1mD+gpjN59t8mr
         qxNrVoALBRQk7DgLYArvJnsoLCeRY06d7YBiIunyCVlDxWH2HyfiMY3Mp4lgtCVX3Uv0
         phrRPHHTfhkcqvMjXmgmsUfo8IgA/J7KF1IWzaKGA89ILTecLkPAhbjJBPckSYmMZ9gq
         pN0KElz1M6dvXjqQh6qSseDIlRPVw4Syk9pcdm3iKv46Mm+KBOQVWbmNwkbE3G+IHzCe
         bWLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790436420; x=1791041220;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=r93vo6YJEV/n1FD4tzzKSMKvC9BRqIXeipynuzwoWIM=;
        b=ejRSNw6FsB5lYmKVkY4nnqu74F+e8YPSQD1ZcpZIMGFdo6kzAXR2K5dXOGI0GZwkjf
         cCVIek/0jzex6bFw4uRCuRTFaN4nDwky7WXzxX06ZlLs+DRhjNR/zaKJPL92buLRcwad
         pugR8wqrci0BeAGrcJ0evRfToPGZA1n9w0Bh4wgrGxsia81aO/j1vCnBzsQdlXstBG/N
         2JDJBWghgM/eQfwwLa34EToJHXz4SL4XtJejbVxu+L1MM3B0HrMCWdIhFePywtOjTGrA
         Gt64TvSVPJv14EnuuRiXNktI4DXCmB6LJNmvA1Q/Jixq+p1A+gMCh8KtzrccMgF8YlK1
         J2/w==
X-Forwarded-Encrypted: i=1; AKwUvBzK/T2WLaRTb3S2AOiWNkfRIJ/YIwIiGwsRv6y6KQ8l3JCmY95iUV/dM6CKIjj/Jw4uXdwnxuY3QImSgbKZxXzx@lists.infradead.org
X-Gm-Message-State: AFuF++lBp7bhyVqRTIO21KYJKGUsd8XfqTfP5SlmCFHtS/zsycfYHoii
	UZEtdce+LnIND2Mw2DD7UEnORKGNXDIwwkN5J8RSG+f1qp7aFIdlqjm3eNVKzX1z
X-Gm-Gg: AYBFou2tgc86srk7jfv2UpZfcDKQtoO3FuhwncoruOdqhbpYpB9sAoPo1Egajrk/Itt
	RXPgkhkjI8p4VvyIvfOGJl/Gmk5W01DlB4aJ46h4WSY3W5nUo745glT3WeIF9Gqu0YPJw9DHx5F
	2sCm7W13QD57nm2h2hQoAVNbuvAKiKDsSZpXwsz3jZWYvXMCQnGTFWWn0TCRGLTMgnOiQ6UVTLj
	tACTt52JnN17Qle9FIJuxRejpOhW5itqlbnWheeGGMvM7YDwrMsN+wjlEFJhuLdcjofFaft3Dx4
	L7moMTyOXPm9u9CicMwy5COFk+elkvnM2xiYTiO83FTH9h26Fp4mTqCZI5qkz+cAs6DyEglfBKK
	JPEaiiFBlpEt8Ujl2x6gECXioiERueEbLuY78StNg6D4oQVUf73FshZMVeUs1+gM6m1cHF5zA+e
	h6h4cLosCZy8yq3hqHvH28TGwU/qDBy1ZgPkMFT7Uu2bpIDMXV9xpLbPg17BCEehXU4dzpbVKIP
	BKKC0zSbRvLw1UKbVMqdo0frnDIY7aX48P7G/ugYVvk3LVPP+VYF4MTC9x0Iik54lV0tp72ds+/
	UwT9kyIpTpco3RR/5930MgEfXFR+vnk22lEijFqzioTP6+KAWdSKCAoZuqWRll8YjIM3pKbu53c
	=
X-Received: by 2002:a05:600c:8b31:b0:49f:fd66:5fec with SMTP id 5b1f17b1804b1-49ffd66616bmr28453225e9.0.1790436419906;
        Sat, 26 Sep 2026 08:26:59 -0700 (PDT)
Received: from unknown748F3CBA5068 (dynamic-2a02-3100-b162-c701-4960-a998-3de8-2fce.310.pool.telefonica.de. [2a02:3100:b162:c701:4960:a998:3de8:2fce])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fef5fe71csm94423665e9.2.2026.09.26.08.26.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Sep 2026 08:26:59 -0700 (PDT)
Date: Sat, 26 Sep 2026 17:26:58 +0200
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Linus Walleij <linusw@kernel.org>
Cc: Russell King <linux@armlinux.org.uk>, 
	Dmitry Baryshkov <lumag@kernel.org>, Sudeep Holla <sudeep.holla@kernel.org>, 
	Pierre Gondois <pierre.gondois@arm.com>, Radu Rendec <rrendec@redhat.com>, 
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>, Clark Williams <clrkwllms@kernel.org>, 
	Steven Rostedt <rostedt@goodmis.org>, linux-arm-kernel@lists.infradead.org, 
	linux-rt-devel@lists.linux.dev, linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH 0/4] ARM: allocate the cacheinfo early to fix the
 PREEMPT_RT boot warning
Message-ID: <arfjs5kQjQRb_Ep2@gmail.com>
References: <20260912195552.76673-1-kmehltretter@gmail.com>
 <CAD++jL=7OSrPMax9GRj3D7ehjmmG2uMyws53F8U0x7YGx+RNOQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAD++jL=7OSrPMax9GRj3D7ehjmmG2uMyws53F8U0x7YGx+RNOQ@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260926_082701_989018_D1D9CB4A 
X-CRM114-Status: GOOD (  13.96  )
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

On Mon, Sep 21, 2026 at 12:11:47AM +0100, Linus Walleij wrote:
> > The series applies unchanged to 7.2.6-rc1 and v6.18.
> 
> OK please rebase on v7.3-rc1 because that's what we're working
> on now.
> 
> After posting that I think you can put this into Russell's
> patch tracker.
> https://www.arm.linux.org.uk/developer/patches/

Hi Linus,

Thanks for the guidance. I rebased the series on v7.3-rc1 and
posted that as v2 [1].

And now all four patches are in Russell's tracker:

https://www.armlinux.org.uk/developer/patches/viewpatch.php?id=9520/1
https://www.armlinux.org.uk/developer/patches/viewpatch.php?id=9521/1
https://www.armlinux.org.uk/developer/patches/viewpatch.php?id=9522/1
https://www.armlinux.org.uk/developer/patches/viewpatch.php?id=9523/1

[1] https://lore.kernel.org/r/20260921-arm-cacheinfo-v2-5892c4531ad9-0@gmail.com/

Karl

