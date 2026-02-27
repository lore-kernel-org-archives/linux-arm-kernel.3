Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C229AFEFB77
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Feb 2026 18:54:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3aruVbAaYvFcNbsyejeNigt2xHhLZnkjS0gZ6HiRHzU=; b=4PDsDskZ6q77fwx8+Va7GPEXBg
	i5gpzr22Aq1RqbRO3DJI1dNZVrY4I/4hVVQrp/DPzP72ljHmVBCAyrHZn8it8B16f7i4tWgNQgD9n
	XkhFpPdYqGFvyCBIT8A7JVgcq2vGO2WZpUkFZ9ICI3AlAt0/18bfJFm8OTxBPLXRPa+bzH6rGlvmQ
	uw8eLpOaN/E92JZnSTjJJatMNqOmSrmoWo2FUrRlBfPatD+K9kZX3YlsB3M9k8/bNSOZNjE2XUdyj
	RYvTlwsmFHNFpFTzT0x8FUzYyPzgsir5WaOcboGt8JpkndKK39BZ+eKV7aippZcrrN0j9PZ+KcIDP
	NZmPb4xw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vw2yF-00000008vg4-3J7e;
	Fri, 27 Feb 2026 18:53:51 +0000
Received: from mail-pg1-x52b.google.com ([2607:f8b0:4864:20::52b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vw2yD-00000008vfK-2B3V
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Feb 2026 18:53:50 +0000
Received: by mail-pg1-x52b.google.com with SMTP id 41be03b00d2f7-c70bfef17a4so1379075a12.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 27 Feb 2026 10:53:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772218428; x=1772823228; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3aruVbAaYvFcNbsyejeNigt2xHhLZnkjS0gZ6HiRHzU=;
        b=La9eoW4gnLS81IcLFI+6kIQa4tal2uSgHTJklrAC968bT+qTqCdwNVCXKWQuwj8Lxt
         Ysk4YGE83FSdaoqFF4EDeeo2rwgixliZqUkv+A8lWmMsi+v4qODMgWPqjE1LraPnOetu
         oR5PJjUccVo+idNH1xQG9E1ii3WuREsZFiwAimKbetuZkJQYYN/+u8EUyK7TFmyAgK9w
         VOlp307yWJ2B5aT8TFq2KiQs5R5lVBxUeyNF9WDOmYr5QLLjpucD0DLIEbRbN8d8psHX
         GVRjYZs/Rr0lxKKP/xNKL7MT//iGnXKQ8vQGB8cZpNtcgZMPA0esXI/C4ITOmFF8mkmp
         pSMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772218428; x=1772823228;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=3aruVbAaYvFcNbsyejeNigt2xHhLZnkjS0gZ6HiRHzU=;
        b=gNcVoNtAD5lGlC4SgC+QtPX3Rw+vuAX2EkcpG3JvfRLcXtvyXRVyIv6m/66iQ25bM2
         nEteNTG5BN8GI2a7ybLRmPc2WYryz2W00xlNDyMk6h5IzpFHKG2X0jmDcC23uvon2U0w
         koAaX5mIj6gyHsok8ET2UdPVmkr2e2ZRn41KXC/wc50JqFvjv+ktwJd/Mg5JOMj6QzQA
         qIgUD8rYWq1Su/WjaZtShYQrKMxlSws5+Mpb/UNQct/7F6yEg9iOXC3Ovqam12clBTAM
         ssXna2hGjPxzKu33KpVziBtuglgV3gIRxP6uhIeZ1sKyV04Kz3wbiLjU/1pSPq8/oISp
         yrYA==
X-Forwarded-Encrypted: i=1; AJvYcCXmHtVpfqB3kX8f+hsBrau2L+tLAvF0OSazhH3F7DGsmIgGmo9t/Mu2FSFCphRuVQSTOcakqL07vl8pR3DEDRAJ@lists.infradead.org
X-Gm-Message-State: AOJu0YxoMVEeJJ7iDt3IpxQM2UzmdL50iexYyx8OYt15hIj72h/dniub
	2yeo594vggFhw7bVvbh9n2va3X08g8BByzWJI9pN4uNVVMeY8MngX6PU
X-Gm-Gg: ATEYQzxKrde6OQ50hiWElifSodXh8GkWSaCyZK3jWVwFDB48TnkuWwbhp/jcSiBIRMz
	cdwxtFp8hDs99x18oD5rT4bjnc3CHxlj6PvtkiScfuba69IFK01+RyvJ1jJUqURmixypf7ktSps
	pnFBqZOY8k1WiqAWUJVCPtaY0JRnzjPv4CnlbOnT56dN8DOKxuKrI2P3ePMK6D/16oQ460UTSwz
	b07kZHqZ/eVQKS71GSec3UWQK6GCmOZHWZ4AaFJr3Z0uyZ9g7Wlkui3XOhUe7UWmgqwHSgLv7z6
	14TXFjZ0CQAl4vkeNNCtaAyYqGqHe/2abZeTbedyPBPelnxGWlWTj4z7MUo9WuJzwKJ/MjneIj8
	Qh3b4khG96avBNHUxgWlLhvsJkweM4PZDdu6QjPg3EAM059VwKD5l/SvM3okYNWA4ujqSq8BXoC
	Z9zH3t9zis3K8CLjZ+//vZARXjG/8/OdFa9a8hO2SdPRwWaIFPGWOSQjNmFUDeoxUSrCJASXsXN
	M4A97CRRX+mRnIj78VFQdNh4/jmqfVc
X-Received: by 2002:a17:903:2ad0:b0:2ad:b97b:be88 with SMTP id d9443c01a7336-2ae2e46bd32mr43854225ad.32.1772218427810;
        Fri, 27 Feb 2026 10:53:47 -0800 (PST)
Received: from nickhuang.. (2001-b400-e2da-fec3-c79c-b051-bf9d-6fb0.emome-ip6.hinet.net. [2001:b400:e2da:fec3:c79c:b051:bf9d:6fb0])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2adfb5dc944sm70010155ad.39.2026.02.27.10.53.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Feb 2026 10:53:47 -0800 (PST)
From: Nick Huang <sef1548@gmail.com>
To: macro@orcam.me.uk
Cc: davidgow@google.com,
	dongsheng.yang@linux.dev,
	dory85109@gmail.com,
	ebiggers@kernel.org,
	idryomov@gmail.com,
	jlayton@kernel.org,
	john.g.garry@oracle.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux@armlinux.org.uk,
	namhyung@kernel.org,
	robh@kernel.org,
	sef1548@gmail.com,
	wdhh6@aliyun.com,
	wqu@suse.com,
	yot4106@gmail.com,
	likerockman102@hotmail.com,
	squid@squidspirit.com
Subject: Re: [PATCH] arm: Replace __ASSEMBLY__ with __ASSEMBLER__ in uapi headers
Date: Fri, 27 Feb 2026 18:53:35 +0000
Message-ID: <20260227185339.4187-1-sef1548@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <alpine.DEB.2.21.2602190008470.57399@angie.orcam.me.uk>
References: <alpine.DEB.2.21.2602190008470.57399@angie.orcam.me.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=yes
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260227_105349_578539_58BCFB1A 
X-CRM114-Status: GOOD (  11.34  )
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

>    While not a regression, as this used not to work anyway with ASSEMBLY,
>   the use of ASSEMBLER requires sufficiently new a compiler and in principle
>   the userland may have old tools installed for whatever reason.  So perhaps
>   #error is in order if the compiler is not recent enough, for a complete
>   fix?

>    FWIW GCC 2.95.x didn't yet have it, it landed ultimately with GCC 3.0.
>    Do we care?  For instance the GNU C library still does for its installed
>   headers.
>
>     Maciej

Thanks, Maciej — good point about older toolchains. I'll send v2 of the patch that adds a compile-time check and an #error when the
  compiler is too old to provide ASSEMBLER, making the failure explicit.

--
Regards,
Nick Huang

