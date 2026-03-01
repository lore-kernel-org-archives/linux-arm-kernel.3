Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99906FD0078
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  1 Mar 2026 21:56:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VIacLwhje9cL0wv5CnP9VaDZyNaAAbXizVI9qFdiSd8=; b=wgog1yf0L2iJZuapgNAoNG4qY/
	eNpVy4pecwUAxmAYX3TLiZ3/jXTRzeLx/312RdGKNA8OHfRShAjuaAKhUzchQt5fctt6hdH6/yIuc
	FUZ3QZsU9kjjoNQ15aEm35cb3nn7aPzmHBaNXPT6GMhPARF9MIXZR5zCDhfDZc3TpbbHOR2dbUKQ2
	QNMBBKzsJb/zE0TbawyvFJnWy9qV/5gZNYmMDdMVKq6Gq1tEwEnlKVnu655lHYygCp6LkGrGCUuca
	guwY51HNvG8EBK2D0XiA6kiqB9N8iCvIlqT3ct775lhcOCcgCz4BM8hwc0kk5Z9hI8tcFLH1anhq6
	mJENpBEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vwoln-0000000BvRV-0H2U;
	Sun, 01 Mar 2026 21:56:11 +0000
Received: from mail-dl1-x122d.google.com ([2607:f8b0:4864:20::122d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vwoll-0000000BvQk-0ITL
	for linux-arm-kernel@lists.infradead.org;
	Sun, 01 Mar 2026 21:56:10 +0000
Received: by mail-dl1-x122d.google.com with SMTP id a92af1059eb24-126ea4b77adso4817714c88.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 01 Mar 2026 13:56:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772402168; x=1773006968; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=VIacLwhje9cL0wv5CnP9VaDZyNaAAbXizVI9qFdiSd8=;
        b=dq++NgL2aGi923Kyh9Y5u6SGZtxR7/kJ8tzMjG3jGQixNINFZ5+m7svbdKUL38s2yt
         ZK4r05bGq3TEP+36h24gnUsGI6uW/eeZiGZNch+mmPpT+cDXFUO37rT+WiCQ4IZzWhI/
         9I6V0rLbtZ0uIJlB13T9CFvguoaPI9/uyCCT+XU50t4ogcyKLGNwB+0W6d1k1GzhpBJm
         0r1sPufMjefYP18jd3oIi4NO/z1+Ob9VRA0gxMtwfQ6P8NKKYWYjgEhJvwjk3tgQNjhP
         VTGhDSPRNC7x8gWgACwQCLnP71XOaPnAVQSqCQT5ZDMczkFoPJQ9ctfBAx/MJwn6EhX+
         ODuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772402168; x=1773006968;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VIacLwhje9cL0wv5CnP9VaDZyNaAAbXizVI9qFdiSd8=;
        b=wOnu1eK0dso7plCgZ6JNrYUCLwXJa2jKmAOeBMCWKmBCCK13ixr5WROdBDS2EJGlyd
         6lOuil8eGmTOsGNc2zZzpzmnJJl9L85WO1KOsO1ExLOFTc5wf4Q9FleW1Ey4VBMmJl/a
         keRtc4980Om7XXMb/mY7+LrOj9Q8BTVzOsasKUVJ9lHqsJjqbSfia7RW2Tzw23NEs2P9
         QlkUAKEIB4XbPgqjqKEQ4W4MU3TxrkPisMgcCD0ZyHday5LP9vlmCmbpGLAg4l5tUvMM
         /5jRlj+yg7swRJMCzIGMVFSaAlOPrr0olFl+poAtbjd4dwh3jtQFnEuYfkr/xyZLyDtM
         m/Uw==
X-Forwarded-Encrypted: i=1; AJvYcCWnFr1ySQ0d4MNfpRjHQzVF2J304gyBAGQP8WuRpIcQHjnGsX4p1p+1McOxYQ0zEEpYJ06WPix2hqX5ARKPNc5q@lists.infradead.org
X-Gm-Message-State: AOJu0YwH4WMrckO2GRmvkO19tl6c8IVeYZiAfpnZJ/D2aP+/5X0DW9T5
	meoVQaqNAp4f8oj5OfXB9DZJVr22rJ5tsyQ9wMqQHiggzy5v4fHUBUcq
X-Gm-Gg: ATEYQzxNwad7gvJx+gnq5JXNRPHoZXN5agxn4bc44WrnD3tjTb2x9R67DhdKCXi63Rc
	5bzGVE5m0K5f1c9cRP6UQ1q9sGNJ/nI5DrbYsb0EO0ajBvHa23lLQFyPukZvVq7ovn/OybuWXjW
	RnOMc1GOtv/pW8HHC8G36b3SjmZsWL9TVfXSDAEP1bJdqNwnbKWY1WQs/+hRpEISxLPNxcZB7uG
	o/ovjbRwXShPuoLiuVAPft2DhvbviYsWL4KSLoGf/RKsUT4/+RotbWyQ/HHZ3KNpSgXGHllbL8T
	eSpjuL3OMFTe448VCeMhZ+ivRIAZ0hKvXWwWxqsYe68s7ib6dpZ8tRR0qPfGQeZJwrYsgEA1E95
	KLNQDmPiaDaO5nHwZZiRme8BNz3LTHQ6SbFR25zXLHCKOnidOh6nyKr37JMj7UlFFQhboQgQ7ri
	yWyOkJotB6GLe4eNsJqvba6pEbtabfYsu8GRn5uBwy3Y/aDw+QkCiL/Tz1fTedGqOH
X-Received: by 2002:a05:7022:1a81:b0:11b:d561:bc10 with SMTP id a92af1059eb24-1278fc95345mr3745869c88.41.1772402167752;
        Sun, 01 Mar 2026 13:56:07 -0800 (PST)
Received: from google.com ([2a00:79e0:2ebe:8:864f:8513:57d0:4064])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2bdf662eb6dsm4048586eec.2.2026.03.01.13.56.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Mar 2026 13:56:07 -0800 (PST)
Date: Sun, 1 Mar 2026 13:56:04 -0800
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Marc Dietrich <marvin24@gmx.de>
Cc: Thierry Reding <thierry.reding@gmail.com>, 
	Arnd Bergmann <arnd@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jonathan Hunter <jonathanh@nvidia.com>, devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] ARM: tegra: paz00: configure WiFi rfkill switch through
 device tree
Message-ID: <aaSsgDqmTLEQQqK0@google.com>
References: <aY_BpRQmLdqOOW2K@google.com>
 <82f24afb-1fd2-bfc9-2215-4526aff372ba@gmx.de>
 <07c024a6-d2f9-5805-4ae7-cbc89cda53bf@gmx.de>
 <aZvdDIYlCjg8sVGT@google.com>
 <99ddd816-f19f-cda8-15a9-6273e26e9e8b@gmx.de>
 <4a1bcdfd-e308-e357-2409-8bc82f115928@gmx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4a1bcdfd-e308-e357-2409-8bc82f115928@gmx.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260301_135609_109044_C9A85ADC 
X-CRM114-Status: GOOD (  15.00  )
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

Hi Marc,

On Sun, Mar 01, 2026 at 09:55:45PM +0100, Marc Dietrich wrote:
> 
> thinking about all this a bit more, I guess your approach to just convert
> the driver to device-tree and not change any functionally beside it, is the
> best solution for now (and good pratice in general).
> Maybe I can get access to a machine with bluetooth (or some other user steps
> up), so we can try to find a better solution, if required at all.

Thank you. I believe your tested-by is applicable to the current version
of the patch as well, so maybe Thierry can simply pick it up.

Thanks.

-- 
Dmitry

