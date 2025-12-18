Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F6F8D6E2AE
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 18 Dec 2025 22:20:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DHi2VHdVHFCMJr3d7N3lZkt4cAkpVU0QksLG1hGqfO8=; b=Zj353N9+uk7joyHS9rh6uN0vtv
	Yf9y6UO75Fpw0EVdj85wjm9oxTGhVqrvsWGztiH04wq+2xz49RlWv8OTm2UmcvPFFDlXcWJYNaKjM
	9CH3WJu4nSVgVTj+dEI/0elADGCuQ81F33at8g2FQ5vOa0L0ZyKrIqPY8/Gg5lHsYlrLiYYnStPtb
	qYOHEJxpXWu2v9bJawCy5bfnMQkKYjYmPOtFMymFwz0CMQTAAa7boJeFmUxnE9bUVJ3xRVSbw423N
	zme0z164uudrf0yVkg4B6zqisb4tfCSRolQiNx1kPcO+Y7Yjcsz5IEb7lCe59qXrGh7lNMJ/OAVUf
	g/tvLwKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWMLs-00000009FqW-1L4X;
	Thu, 18 Dec 2025 22:20:04 +0000
Received: from mail-pf1-x42e.google.com ([2607:f8b0:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWMLo-00000009Fps-3gP4
	for linux-arm-kernel@lists.infradead.org;
	Thu, 18 Dec 2025 22:20:02 +0000
Received: by mail-pf1-x42e.google.com with SMTP id d2e1a72fcca58-7b9215e55e6so769040b3a.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 18 Dec 2025 14:19:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766096399; x=1766701199; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=DHi2VHdVHFCMJr3d7N3lZkt4cAkpVU0QksLG1hGqfO8=;
        b=b4mZoZlYJdLoEKbh/RSvuY6Dbul01328qboJYVa3I3J1cnKgFAMY59AqiltPpiWjkS
         IWrRjzcHaRpcih0/JVdwGWe1QDZBahZwNS7+M1wb+ayl6ZVhSTKa67faXd51qMQ1WHZo
         h7mKGHJonaWVSv9fDCagYeVuuWZadEoNYUjLRRJIqWe6H5TY6218TmuWWJxust+rr1zE
         O48XheGkYugKVRvagoXrTL/dQblVEGesWnDcfWAMtzyxCERLaHqTeFNiU6pp52iC3fK3
         c8sUYjVkLpCOd0bOx/8ysAHCne8kjAz/vmQuvFjo43YPOUDrk4/kj3koym4eZDVPx6Le
         6MMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766096399; x=1766701199;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DHi2VHdVHFCMJr3d7N3lZkt4cAkpVU0QksLG1hGqfO8=;
        b=dE1p+S58h7mvQtdykaHL/WCgqSZqhUroaNK4MuZxHC9SkLXqSL+dECfMi+n4UhwtgL
         ag++cKprKX6ZDAmkPWYnslfZ45KzOJelvq7/61W/7VbUtXVaSmO+3BIkQ/cFSYo2gjns
         wl31Uo1t7sQHOJML9aCcbEyYuFjSjnwovISUUUyBapCsWxmMd1Qm9EC8/T3WKr7o60wG
         l0o9xpIUA4IcGymDQbUam+tyLUe9k+rm5SqQv4fx+MbjGWMwKVaGQVbAxbXBeire7saT
         xEz4/STWmIC1aQ/un5d1b40u8CvRgGgxEFrjhQPBhgmGX6h4eCtwon9oTvt3L7l9c8TG
         IHxQ==
X-Forwarded-Encrypted: i=1; AJvYcCXl65M6rz6FwAIVdkRlafVjRxL1l6pLwO9NLTXjXavj3PmaMRG9SThnuYjxNIoVdTOZGgzQn4QL7KAj0nqG7SiW@lists.infradead.org
X-Gm-Message-State: AOJu0Yw4EYWwZEKY2Wtb7hWY1WPh2vWAySDo8ip4olpC9kjsuDw5nXLf
	iYyFZ0IZ6a7Pa0yIYjeZjRQejrr3WSkkTtpTt5wANUNcRx/1y7jIt/yNz3Rhjg==
X-Gm-Gg: AY/fxX6D4sBFG/vC00fLkBlhDB83zRN0CbFvmmaTQEncFoStIHZJ5vcGQxOfqZzs8Lg
	XVDbZlq3k8znIknfxy7HRVNxOeQaQV6MhwpN5pixka2X/imZtDizpav9RANELNyeBAvf/YjOdqN
	uSHjZR7BB+cH1TjNsWCRSWfBmcPdIXZ4m3iF3cG5NpUlRHGuOFRD61r2dIccd3GqsyBYC+8EhU+
	O2pB+GyV5hvx1nCRMvCiWXRnqSAcPPSiHInPiYA8McU9/FvC7rfKuL7UD6hhN25RiU/y+fzmSCM
	P4jFREpba7QVUA+Z/fx7hUn5H8XEt4KX40cgIgUU8GO/u/5zwVXn1y7QxQG3njkYCUp9ao8oPbj
	5hqc7ea3oEiQJvZyiHzE7duOvqaIA3ftVKhbzC4BbI6irOVqwIkIfGKwVl6TESMh6A3/5uErWN1
	o6LH+8SpQdjzaAvPhoDJfIxSEQW5ZJjSznwUx8aPzg+KvwLSO/A4U=
X-Google-Smtp-Source: AGHT+IEJ6Dza5e+TAlnoSNxkhL516y4Cp3K+eoLm8K4vH3URG1EJpjMsZlCqp1ChQbxfdNHgZFOu0g==
X-Received: by 2002:a05:7022:4190:b0:119:e56b:98b8 with SMTP id a92af1059eb24-121722ebb6cmr841995c88.31.1766096399117;
        Thu, 18 Dec 2025 14:19:59 -0800 (PST)
Received: from google.com ([2a00:79e0:2ebe:8:c00:cda0:e722:e1ee])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1217254c734sm1678256c88.13.2025.12.18.14.19.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Dec 2025 14:19:58 -0800 (PST)
Date: Thu, 18 Dec 2025 14:19:55 -0800
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: fnkl.kernel@gmail.com
Cc: Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>, 
	Neal Gompa <neal@gompa.dev>, asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-input@vger.kernel.org, linux-kernel@vger.kernel.org, pitust <piotr@stelmaszek.com>
Subject: Re: [PATCH] Input: apple_z2: Fix reading incorrect reports after
 exiting sleep
Message-ID: <snwkpf4esyxxhyo2yzq5xepgoh6nkvvqldbiqpj6zm3bbc43zn@gdsxdsza564a>
References: <20251218-z2-init-fix-v1-1-48e3aa239caf@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251218-z2-init-fix-v1-1-48e3aa239caf@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251218_142000_929235_2FB2AA95 
X-CRM114-Status: GOOD (  11.45  )
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

On Thu, Dec 18, 2025 at 09:11:26AM +0100, Sasha Finkelstein via B4 Relay wrote:
> From: Sasha Finkelstein <fnkl.kernel@gmail.com>
> 
> Under certain conditions (more prevalent after a suspend/resume cycle),
> the touchscreen controller can send the "boot complete" interrupt before
> it actually finished booting. In those cases, attempting to read touch
> data resuls in a stream of "not ready" messages being read and
> interpreted as a touch report. Check that the response is in fact a
> touch report and discard it otherwise.
> 
> Reported-by: pitust <piotr@stelmaszek.com>
> Closes: https://oftc.catirclogs.org/asahi/2025-12-17#34878715;
> Fixes: 471a92f8a21a ("Input: apple_z2 - add a driver for Apple Z2 touchscreens")
> Signed-off-by: Sasha Finkelstein <fnkl.kernel@gmail.com>

Applied, thank you.

-- 
Dmitry

