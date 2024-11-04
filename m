Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA376D1BDE3
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  4 Nov 2024 19:07:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NA8fP/yMJX4YrX/4tkNWkXd8CoB5Q4SliEG8XZe06KY=; b=aeiioeMkGrOU+i0JEIPj11dOBB
	P4YwkR8nR7Xz6E7UnUOVDuqdYtmQFjDmloPEeRLT9ZpXUUJNMh5bVSkYAdNunbLhxA6IiEb2lo12F
	aXAD9giFIoTnbxrm9IzBWdJIEozoHa0Y4tOSbBUHcM/tGFC84OTvmnhXh88vC0y+Ia/G0n8aRfo57
	vorzGWHjQP77jebz7Dx3remS4XERMEY+jA3Kwf7Xr48Z6tqcNQmhdlIfeXlj0z2KIbxmQvBYDFUYi
	uIywxr/SiDod4eztYpISqbwVfosNNzve8DJPQoCXAbLgvn5uljUYUGNAFgsRYsqIvT0y9sCYgW1z1
	s5xLQjFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t82PX-0000000EqmH-3Cd6;
	Mon, 04 Nov 2024 19:06:47 +0000
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t82Mf-0000000EqJJ-09ux
	for linux-arm-kernel@lists.infradead.org;
	Mon, 04 Nov 2024 19:03:50 +0000
Received: by mail-pl1-x634.google.com with SMTP id d9443c01a7336-20cdbe608b3so45393625ad.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 04 Nov 2024 11:03:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1730747027; x=1731351827; darn=lists.infradead.org;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=NA8fP/yMJX4YrX/4tkNWkXd8CoB5Q4SliEG8XZe06KY=;
        b=ci+bitvY2bc3C84BrnrIBhizMR7VWHK2ZQuU6w8vxDt36w++8qysZkgG7aviZApBSs
         wq51ZTaFvBy2dMKadPak/2+R2T1bQpF24LRZNEdOzOh22z1BCbYz4CAoMgx8VWsrGtfz
         ZWi+MqLtUP7Eea14j8j58Siw/IE4ssOLekcezDjKRVG3cE6L3N3Mhs7wLrSdVoVFnWcV
         hBH781HsGlwQrJf6RkUEcOiGXiIKEbaE3tnfJNMTbSWR8ur79A6qFPGR/qbDXdQWJgbY
         l3tp7exzYGjMzKq8PO+XYjQWp30MiovA68G0cG2ZNNCKifZJHSLmcyOyw6M9Uvue7b7V
         06Dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730747027; x=1731351827;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=NA8fP/yMJX4YrX/4tkNWkXd8CoB5Q4SliEG8XZe06KY=;
        b=fziWDZE+rFoVI7NlAANs9q40N+EQZIWOxlC/lSfNHXKQOVg6ZnwXAyrzAB3GJ1xw1S
         vrTi5vJOoiIOsL7MRwlGgrozcKmQ9eU7PfRdeD8XO/tX13iHwo0gGY4fsQ28gLXqerUX
         SJAtXSx/df7mHi3cn8dqx/VHrw/XvKVVRfGHpe7DVnaoHRHMJND1wYf3OsSm8mBCNHTw
         UHib4IJE94eIvWmviEq5jfnWE/V+Gss84qEgwm13Gm40B8d2HTCRwQGu0S6p5S9Pt6uQ
         pJ13c+JOTZHW6dnooT8hR3AmXCHQp+7TPyG+eDWbRQWLFVNbSlwShnZO/V5ijgoltdea
         6m1Q==
X-Forwarded-Encrypted: i=1; AJvYcCWtQ4FJXXlomqv7LlObpCHEQpktldCm4rGM3Gd2BI35MXZZLY4ZyeObuQNmieTXFiZ5iX6+3hCxHed6WgXW+LhU@lists.infradead.org
X-Gm-Message-State: AOJu0YzvPxRMsCPSbi238AsHxG72GK1jDV6pk4BXih2gRwIUDttpPC7v
	p91M73j+CntnBOVo2thiwsGXX2UruOSheN3jxpc9MSkIB6Knl7mSdSjXD98nfss=
X-Google-Smtp-Source: AGHT+IHCn+jwQGkArcOzaPbcwgPSYj2Q9cK06QQu8ytXtnA4Uxk3VIEJ5QKuxauHvt2qnIwQYyPqwg==
X-Received: by 2002:a17:902:cf12:b0:20d:2e83:6995 with SMTP id d9443c01a7336-210f76d6750mr286890785ad.47.1730747027167;
        Mon, 04 Nov 2024 11:03:47 -0800 (PST)
Received: from localhost ([97.126.177.194])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-211318b562fsm41688915ad.169.2024.11.04.11.03.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Nov 2024 11:03:46 -0800 (PST)
From: Kevin Hilman <khilman@baylibre.com>
To: soc@kernel.org
Cc: linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [GIT PULL] ARM: dts: OMAP updates for v6.13
In-Reply-To: <7hmsieomrt.fsf@baylibre.com>
References: <7hmsieomrt.fsf@baylibre.com>
Date: Mon, 04 Nov 2024 11:03:46 -0800
Message-ID: <7hikt2om7h.fsf@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241104_110349_094792_E51696C2 
X-CRM114-Status: GOOD (  10.12  )
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

Kevin Hilman <khilman@baylibre.com> writes:

> The following changes since commit 9852d85ec9d492ebef56dc5f229416c925758edc:
>
>   Linux 6.12-rc1 (2024-09-29 15:06:19 -0700)
>
> are available in the Git repository at:
>
>   git://git.kernel.org/pub/scm/linux/kernel/git/khilman/linux-omap.git tags/omap-for-v6.13/dt-signed
>
> for you to fetch changes up to 13746595a1581e09289adf9b5202e237c5e0814b:
>
>   ARM: dts: omap4-kc1: fix twl6030 power node (2024-11-04 10:42:22 -0800)

Oops, ignore this one.  I got an email from linux-next that one of these
patches is missing an SoB.  Will fixup and resend.

I deleted this tag to avoid pulling the wrong one.

Kevin

