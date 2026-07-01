Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF0ADC43327
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  1 Jul 2026 18:30:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=r5j8jAU52xCxPnc3K4cdDtHFT9hkocfdMqu7pwNKuyc=; b=xQoYvmjthNl0yejgFN/fyGx2cH
	Eadi9PWwXSy3TEA/z4G7d/P3w2DBv0r49RBFvxkmnOnTq4m2tQGeSCC9OobQXcNP6Vj0gcIlRtE77
	3njzACyaagmbnV/brKYPMjfzA9xOWCT9unxLuAmF2Yh2Mya77NQUfou8GHnHpe46FLTOqSP3QuJId
	Y5hXTkEXJWOYoqJS7Ie2n5fhM9lKYJx/kvJ9NPLoosh67Y9vQCpN8SHQKdTXDpMaBhbRM4S4H8bxl
	+8DKBaLfQUGLHF3brkpcHSJIIm/EN4Nu+R7tJlIg6d+phRovAr295htRnvtXtg3NYyVQGo3iSuRoy
	XuoEO+9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weyWs-00000002ghr-3qGr;
	Wed, 01 Jul 2026 17:15:18 +0000
Received: from mail-pg1-x529.google.com ([2607:f8b0:4864:20::529])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weyWq-00000002gh9-290C
	for linux-arm-kernel@lists.infradead.org;
	Wed, 01 Jul 2026 17:15:17 +0000
Received: by mail-pg1-x529.google.com with SMTP id 41be03b00d2f7-c89636920a3so325743a12.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 01 Jul 2026 10:15:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782926115; x=1783530915; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=r5j8jAU52xCxPnc3K4cdDtHFT9hkocfdMqu7pwNKuyc=;
        b=UptEcPrEHHk+cPAZ03OPFUnSrvX+PRLT0etB2DKY5yCT7TXs4B77tpdaU+arA2ur//
         U0hjMu80xPWSNCjW0mPmkGCbZYvectA5c07Kgdm4qYBTUXkzdH3/sQWG8s000+jE1gDw
         hqixE0cNFv3T3Saonbl1tw7cjKkbgp/cpENqh+EWKaN/iuPZaIZWLcHtBF4sGdvIq4nj
         e+faP5dzblZy3G4qG7orLKVv0jAmQap3vsdJerLXFISSCIH8/faQpuR2r28H50q49jna
         22smAXvqUoAQljsCkLZMvbTh3mQAH0DSmNxFrwJbRcEuHmDvUEcYIWXaxaIrY1+KWu49
         lDJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782926115; x=1783530915;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=r5j8jAU52xCxPnc3K4cdDtHFT9hkocfdMqu7pwNKuyc=;
        b=idqwIAN3M9m/O2IJGz8X4YIIOc3F55UsYgAvUOK0IvWontVpd5W+2Gwtz7+gRcthnP
         psf4HQEzb1IX6d8rcKrnaqSkufGQ70LBvAu/9vwAdxtIrxzb3ixN4voOcHuO738YMEoz
         jzlgfen7oysRAPW/EDkD9qcrgB+cCYjC5sE69a7yvJCv/yvBMNgo4F1NIz4MTD2YMYZu
         VvJJnMLKe0yqc/uuxSUJtSy1nw7sPSurorMRGsa0sENfQ62gxq2qiXb8gZAvij2vOLvw
         7dnqrj/CaojZDBiD0hF0RbzOmKwsAIKjPhEcQ5pg3TQPsket3noUWj7wcNhGATp6nByo
         AuAQ==
X-Forwarded-Encrypted: i=1; AFNElJ/iWI9mc4kFpCwypXmBRsdvbdLI02pjd3w2kizCUkhuKGW7xFQAkB2fzR2GlOiT/qoVQXcbZC3Kcjmh7zaDZjSC@lists.infradead.org
X-Gm-Message-State: AOJu0YxAh0ma7uWSZxTGFPgoZTNI8IQJeXOlOSGsACMON1neWQ2s6ag0
	KHbZzADgGHEgFuLORlXE+QijEuKV085AqH5xlja4jXNM4mvH/ijwF+Dw
X-Gm-Gg: AfdE7ck7gKmgyAwb3QoO1i7lyLUwReF6m1SMJvrAErlyUnZ36nL1d97HyXtN0ZVQSo6
	4gxJPdRuQXnhdz2g0776r2ds4oIpXaGtm82VgJCLW0tl0HhZcfe3xGqu6RXu5o0ew+bZWIqEM2f
	MC9hUb80SazXtcbE/n7RkryKSZmg/QyqFzY5dtOFiGIrlFDMZY+sSSwJMIOD5Z2n4fqSa14IP0p
	krd3VGH1FeAtyCO3ppzZn0qcrDN+nwP8/V0wglZYvTq0CCfNu9CcVVF+TtyVi/Y6OPYNe2f1t1u
	1uC01MR/eXM72b+yqJ/Py8enur5jnrxr/Ebt5LVM3PP9y1fy28FWn3Sbgu8XN0acHjcGoJ6L4Zg
	JsahPQs01w6g1MpP6e0j0uQhT69tMhy5mOH6d0MnGcn1ZwvGbRTUGWJaesfbA4JCuD7Zuljux8S
	MLgrQ7Jf0cU0UcbRtrp4ewUfVeBEIwzrl9XXCuOajuu8fo6bh6dHqA8Uk=
X-Received: by 2002:a05:6300:6702:b0:3bf:b49f:53fd with SMTP id adf61e73a8af0-3bff402b5a9mr1914162637.3.1782926115066;
        Wed, 01 Jul 2026 10:15:15 -0700 (PDT)
Received: from LAPTOP-97G9G880.domain.name ([106.222.201.11])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30ee300e4a7sm21777940eec.13.2026.07.01.10.15.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Jul 2026 10:15:14 -0700 (PDT)
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
Date: Wed,  1 Jul 2026 17:15:06 +0000
Message-ID: <20260701171506.338614-1-karthiproffesional@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <033f2657ae6a94ad13d22f717a2900afb75d892d.camel@codeconstruct.com.au>
References: <033f2657ae6a94ad13d22f717a2900afb75d892d.camel@codeconstruct.com.au>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260701_101516_550123_77804422 
X-CRM114-Status: UNSURE (   8.40  )
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

Hi Andrew,

Just following up, it's been about two weeks since I shared the
hardware validation results. I believe I've addressed the questions
raised in the thread, but please let me know if there's anything
else you'd like me to do.

Thanks,
Karthikeyan

