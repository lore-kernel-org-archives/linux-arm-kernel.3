Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 340B7C282CD
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Mar 2025 20:03:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DVlIeIIYEUcXVpBH0ZR2aYcLcX0jlCTjHLmqUh5GcV4=; b=YjM+kQJMvYL9Cig5Dl98gSpWS7
	WwRrv8Sk2HS4aSqmbcTu4HuQ0Szqk/OIqXDa2fUmq8XqbY4se7xt1BGNwSz6V4SIOu+p8xzd0l9Bx
	VtGg9mlgzoS9gSaOwH3FYDGbCXWJbpfNtPhpfWosSaez/q2GukoEV753r3bmvdqY8cHDI0MdPhtBd
	+GwqodOLVAT/R6wiaJRe8mJhpq09yjJIMwI3LYZLWezWdq9hnDzfu3iatV4vAoXoWyB8dMytjjm/0
	NEccyAYiqp/kFeBMJyreQEyutnLMijbQpzk1skdG3L/GnYHfc31MveoxvmTrrQJytjXIwUGdT2YVg
	wzAx5Zbg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpC0R-000000028gv-0DGx;
	Mon, 03 Mar 2025 20:03:15 +0000
Received: from mail-pl1-f174.google.com ([209.85.214.174])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpByF-0000000289K-0Q0W
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Mar 2025 20:01:00 +0000
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-223a7065ff8so41433975ad.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 03 Mar 2025 12:00:58 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741032058; x=1741636858;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DVlIeIIYEUcXVpBH0ZR2aYcLcX0jlCTjHLmqUh5GcV4=;
        b=OKJJEqNlxqJE2Jx/oj3VZnwUm7wiqZQ+/N1OZMdQQu3Oh7p7n73HplP+QtzPDu4+rM
         /g/Et0fdOKyfPGne+qsl67kgTXGzy+U2tuv6Gt1NVI3m9towc9fVZA3W3X5yHSwTc/h1
         3gu49e5bT+H/4aAOVsCvTVyve8nNnbjyNRMPg/dFv+04LW6HVGwa0xBz0DPMiAgcnf7f
         VdhPr90S/s1nGjGLT5qCKRXO7by5i+GuJ2Yh5UohAyyGNKbVlqX7REhW5CnPSce9cvIX
         P6nYLpoj7qGjo/bxHHpXvPtyDQYv4uxVmLG947CRrDYpSUs3Yww8zytIpCJCjTnal5wd
         /kBg==
X-Forwarded-Encrypted: i=1; AJvYcCVicWR0MCNiCkRpRKyjSRttZAXcKk505UMYDunRE4XjniyuoUJwTArUwe/zN/ScXPjqIQ/vQJi9k4pS9ULOkv6x@lists.infradead.org
X-Gm-Message-State: AOJu0YyQScAGjp2AHAFmf0VS/CV6QLdKsmE4m7H2VRCNB2Q/ldl/2MvU
	6BPiAGsertRCE3qD7MLRNJmwRgbmGWBxLS55qjh+TcTwM4mTSchU
X-Gm-Gg: ASbGncuMjcnyLUVn4hFySzTMkmC/wQ9vb6oLJ/YwmyvKtFaySg/lPYJ6niISf/+wRoC
	+5Wn0u+N7OFeCd12/D5mgWhOeB6eHazwrIDgbNmgUTu6KLRwF+lMcYM+RvoyQO9Y6BTgPV7Sqxy
	1amF0vu2pbYhlmxF0oZmqdTCaqyZTq9+ImqqpTO4GCkpfEtnPbizaJwEJsZttq1WhfAjjNsoQVr
	gc/ixr/uHk9j5u4SU1JyYypidm3x+R+l4eIViRUOH2/bhwc8rIQAzqmeBoqyTexirFK8tDAkxWX
	cs168cuutegeuSVDpU+BkBsZTbR0r9ugZFrnzcNSlbFQLED6ZF1cYXb4k+OneNIOUeF2kcLof1M
	vyXo=
X-Google-Smtp-Source: AGHT+IGknxLLIXBeT5c31Vvl+cZh8b06bZmuGqUJWYc+uYhvP7flXlsd/7jPzf+IyTyzNISceBSJ8Q==
X-Received: by 2002:a05:6a00:2d1d:b0:736:4536:26cc with SMTP id d2e1a72fcca58-73645362c6fmr10629091b3a.23.1741032058394;
        Mon, 03 Mar 2025 12:00:58 -0800 (PST)
Received: from localhost (fpd11144dd.ap.nuro.jp. [209.17.68.221])
        by smtp.gmail.com with UTF8SMTPSA id d2e1a72fcca58-7363f2e8a34sm4076852b3a.168.2025.03.03.12.00.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Mar 2025 12:00:57 -0800 (PST)
Date: Tue, 4 Mar 2025 05:00:55 +0900
From: Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>
To: Hrishikesh Deleep <hrishikesh.d@samsung.com>
Cc: shradha.t@samsung.com, 18255117159@163.com, Jonathan.Cameron@huawei.com,
	a.manzanares@samsung.com, bhelgaas@google.com, cassel@kernel.org,
	fan.ni@samsung.com, jingoohan1@gmail.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-pci@vger.kernel.org, linux-perf-users@vger.kernel.org,
	lpieralisi@kernel.org, manivannan.sadhasivam@linaro.org,
	mark.rutland@arm.com, nifan.cxl@gmail.com, pankaj.dubey@samsung.com,
	renyu.zj@linux.alibaba.com, robh@kernel.org, will@kernel.org,
	xueshuai@linux.alibaba.com
Subject: Re: [PATCH v7 0/5] Add support for debugfs based RAS DES feature in
 PCIe DW
Message-ID: <20250303200055.GA1881771@rocinante>
References: <20250221131548.59616-1-shradha.t@samsung.com>
 <CGME20250228114813epcas5p32127b99d3a0adf6900a104468b48768d@epcas5p3.samsung.com>
 <20250228114301.31739-1-hrishikesh.d@samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250228114301.31739-1-hrishikesh.d@samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250303_120059_134669_22F570FA 
X-CRM114-Status: GOOD (  10.44  )
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

Hello,

> Thanks for adding the support!
> 
> Tested the patch in one of our internal SoC with DesginWare PCIe controller. The patch works fine.

I assume this was for an entire series, not any specific patch.

> Tested-by: Hrishikesh Deleep <hrishikesh.d@samsung.com>

Thank you for testing!  I will add your tag to the current branch.

	Krzysztof

