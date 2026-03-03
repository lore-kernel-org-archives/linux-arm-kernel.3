Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69D05EDA68D
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Mar 2026 16:10:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uZhefinet/rBeeE1EfXYvWsIsVUahRvR5lid/N+Qkvg=; b=fe3iZwp+rxm3ZeWLXoZ+Ll+nqe
	Q6CyofiHGBfk8Zef7dBPR9Rb4w3ZeZ8lXRvtUTuDUvrLYqh6BIGULKpNGK+VRaVWDp0/HR/dbGsjN
	8d5m9PlHxoZukww+8Z5Nwlld9zGukBRowmEDBOeQGNLmr63Z9rr7brMzb+YnlvfclfEnbrrMtW5bm
	Ta4WSNpbM0oqxEJuUrqpcFrJh+XT1exqb3UNn0Hz6zVB/4538Xfpa5+tXmPgfhcLhgm0ohpJfeDJY
	s98QF8OvgCshnelJre4gIbw2SygFxvQqZnZDtYda881ae73USf4BVmlidTnsJFGyuyF8j6sND+NJF
	rwMF4kDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxSKG-0000000FWyj-27tf;
	Tue, 03 Mar 2026 16:10:24 +0000
Received: from mail-pf1-x42e.google.com ([2607:f8b0:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxSKD-0000000FWxw-2PGM
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Mar 2026 16:10:23 +0000
Received: by mail-pf1-x42e.google.com with SMTP id d2e1a72fcca58-824ba8f0acaso2979579b3a.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 03 Mar 2026 08:10:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772554220; x=1773159020; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uZhefinet/rBeeE1EfXYvWsIsVUahRvR5lid/N+Qkvg=;
        b=JH5uX9B7nRDvRFoxVZjjDqHamWnXBzLd6jh/Et8dc4Zon709cvRnfX1ljPb35kO67g
         tQ8VvekkwPDuZd6RpvK5uZEQexOIcwj7LCUxvPRpzJOqn+1ikKgpfcalF+eL3jb3qcCf
         LSVuxAinG/6eM5dLPMv9qpBxTaiPzsGJkvZG/lmyMQ+NPlUtrg1S5a6lwNjYLvUh2nqq
         Uii1MoY1KCn3SG6qnl5O13yRx4p0R0ZQwwq4bNSvVeysXVkKtZvLo2+KyOzlbWSm4heY
         mqryLQ19cmyCTwLi2xA6xwt3WkzNWdWLIsjgUm/DK83IsTYHjJQf9Pz7XkThMaygS5c7
         SJQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772554220; x=1773159020;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=uZhefinet/rBeeE1EfXYvWsIsVUahRvR5lid/N+Qkvg=;
        b=PcqV6oB/OkjxfycIk2abwxz6B000M3DxwuQzQHyUMUnSb2bT0fctYRXohR9m4YXnop
         IjNmoEKV1wHsx2w/lU+REQsuK91x+ebRn//bN1gaVDSmsXqgVqP+Dxt+W0t9jPGduDh0
         i1jt0Z5fHH4+haio+WCLuWpKAnicH3eZ9V2R26MwX0kq1r7Ob/XgpRn/2Z2BS08NjOF1
         GhBWSwWgHT1QAhPPc1v2XWrLHf/9Uxlt3zylI6hDxGMPp/0uLn9dSTA8f3rHFXEb4Y4w
         NQbdZ1G+jk3IKYIyzctNPZoRkgbjxPvrv82aiqu9EL9akvc8E8j1dB7nip2YojAhnEPQ
         6AIQ==
X-Forwarded-Encrypted: i=1; AJvYcCVmzI6Il151/vsOARhSLqaSLbfmKehqHVDMwuJlQCAaR2gtEBQ8zEbGdG+zllQ9Iwn8QbfsBG4ljcIhANGJEfA7@lists.infradead.org
X-Gm-Message-State: AOJu0YzwPYhqidN7A9ULxM4ZyMQPk+REj5y5bgAv/yud2ENeGsUGOXb/
	QL+6YOMNlEYbmY5PB17PN9G1vlB/whBZtBdmIuMbvQ4IWzj439ehZCGE
X-Gm-Gg: ATEYQzyMSYyrrBXxINb4Ce5uj2yeVljhM+K7UlOB5t6S395vik3TG8MKUCm357ARPiD
	3J9uEbUWrIQzNh0hw6HuiqWFbVdljZ5zE7rPdp3jnhrCahI09F+krQ4jBO75u4/+kXpei0RqxUE
	BjZRga48iaVrMC3uEshFBqxouleI6qQPmVW2w6sTA9tTiKj5EeVEy/Yb8V7l9m/MDApoLHf8TNm
	casrCv/9SSjRSzXf6/35LbffyV8HJ/+yVJr8kBF73fH52m0/8Hh0k2AdiTRMJv4S4jfkxN2aMKg
	zbYIYlmgZb96n508N+9BI2I/LrSUvcnYvIgRt5xadzwZFvePYS2iDHWl9Q593hFDTAdWkiCv0hG
	a9ZoztL/Xw5kYiBqUdaWr20DjjiHOADcNxBz18iKVSK+FXjCUeL3mHiBygCcXRguwkLZ9PSdvqb
	5On4RfgwjOQ5BY0RFq8Xw3TpU6jVgX2VphjGaVrVPEvocUJwYkZ1p+lTky/Kmn1htdjCyJYEQYh
	hTPqkTzvogggGkA/f7B0Q==
X-Received: by 2002:a05:6a00:349b:b0:827:3ff6:fb81 with SMTP id d2e1a72fcca58-8274da0a64emr13677770b3a.52.1772554220355;
        Tue, 03 Mar 2026 08:10:20 -0800 (PST)
Received: from nickhuang.. (2001-b400-e257-9d22-3605-837f-cd5c-9967.emome-ip6.hinet.net. [2001:b400:e257:9d22:3605:837f:cd5c:9967])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82739ff372fsm16359886b3a.31.2026.03.03.08.10.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Mar 2026 08:10:19 -0800 (PST)
From: Nick Huang <sef1548@gmail.com>
To: "Maciej W. Rozycki" <macro@orcam.me.uk>
Cc: linux@armlinux.org.uk,
	davidgow@google.com,
	dongsheng.yang@linux.dev,
	dory85109@gmail.com,
	ebiggers@kernel.org,
	idryomov@gmail.com,
	jlayton@kernel.org,
	john.g.garry@oracle.com,
	namhyung@kernel.org,
	robh@kernel.org,
	kusogame68@gmail.com,
	wdhh6@aliyun.com,
	wqu@suse.com,
	yot4106@gmail.com,
	likerockman102@hotmail.com,
	squid@squidspirit.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] arm: Replace ASSEMBLY with ASSEMBLER in uapi headers
Date: Tue,  3 Mar 2026 16:10:08 +0000
Message-ID: <20260303161012.2983-1-sef1548@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <alpine.DEB.2.21.2603011816460.44093@angie.orcam.me.uk>
References: <alpine.DEB.2.21.2603011816460.44093@angie.orcam.me.uk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260303_081021_618699_5A105DF3 
X-CRM114-Status: GOOD (  10.69  )
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

On Sun, 1 Mar 2026, Maciej W. Rozycki wrote:

> It seems to whom?  Have you got a reference to a discussion with libc
> maintainers where the consensus has been that support for older compilers
> can be dropped?  Why does it remain in the GNU C library?

I have now consulted the glibc maintainers directly on this question.
The thread is available here:

  https://inbox.sourceware.org/libc-alpha/mvm342hx8tf.fsf@suse.de/

Andreas Schwab (SUSE Labs) responded:

  "Since the compiler will define __ASSEMBLER__ automatically when
   preprocessing assembler-with-cpp files, there is no need to change
   anything on the glibc side.  The places that define __ASSEMBLY__ for
   that purpose will just become redundant."

Best regards,
Nick Huang <sef1548@gmail.com>

