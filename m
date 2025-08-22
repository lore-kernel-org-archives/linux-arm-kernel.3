Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9AA0DCA0FEC
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 22 Aug 2025 11:22:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uHOsZL5h3AOX8Ev+qfsTMnxg8y5sgs76/JGMQGQVcN8=; b=OTz5vytN4ic3k8TqgONNc1+1Sp
	C1Hh5ecCQDv2FqR9OuJM1CKAhmF5UjImMPh886No1BGS/UkD/p+8z6/pXmGN/hgORSUx2htTsgODX
	OTxXjW5iZIFyA8qFp9p1CALhwbjG6ivZtYFC9gxqkcNKyTNIU3TNV3IVi+wOYgc6MZbRKKuISJ8Yk
	NxvDhT31hUzpAC9qMb5J9KxLo72dxhvmwbYssHUZcR5NTKAVscfDrxcBwfTeCiNpHhT2rh6RKs/A8
	+S2FDIl5Jwe6tzaSCFxmie5iUs/yQnHGQfh5QUeBx9icO/uKim3E1DVMCJA56U2j2qGvHUgE2WRrR
	WwofwqvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upPqo-00000002I5G-0ZZR;
	Fri, 22 Aug 2025 11:22:30 +0000
Received: from mail-pg1-x534.google.com ([2607:f8b0:4864:20::534])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upHlw-00000001J7u-0BLI
	for linux-arm-kernel@lists.infradead.org;
	Fri, 22 Aug 2025 02:44:57 +0000
Received: by mail-pg1-x534.google.com with SMTP id 41be03b00d2f7-b476c67c5easo1143207a12.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 21 Aug 2025 19:44:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755830695; x=1756435495; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=uHOsZL5h3AOX8Ev+qfsTMnxg8y5sgs76/JGMQGQVcN8=;
        b=VHsQ3z4/uMihfloBVwa7WuNl5rers8cnD2/RDVY5FdQLUUm0uaouWRrAwgU8Tr2Msb
         01dSlGghGP3HVz/8dhZzzG76ldga2JElDjVMa93ndJIXehVVgezbGv309sUgTln0aRbo
         pVgRCjw8/D7gBk3RL3GmyZ+bdixbdLZvqczv4xVQwReLnI986Q2lhZQljUM/nObW99gv
         cvxuY+wkOtiU3I/i441X4qN154z86+m5TNxtBGyKC9trgqb0RRK0Hfr7pU1uVKKVBF/Y
         sBviWsUcj5ifWuxbVCVbuNzZ6pwdli2J7dUlq0zPyFZD+3405qKd7ZfNuI2NjLIHi1rM
         Va3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755830695; x=1756435495;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uHOsZL5h3AOX8Ev+qfsTMnxg8y5sgs76/JGMQGQVcN8=;
        b=m/SYDUrUh1bylah8zTGoMa0C0BduFKhWBIVx/zFkk3EQNDtRib+ZBCO8cT7wiYYCZH
         gxtIcVIHCVl6Hv60EJM3xsw4c+4WXE1nwQTBnBG2p72GJD8p+FiyeJOhtMPAyCrcgOPe
         c+ixc2nY3rSEyHx+ok8WIsNnhU3BzVBNSZjJvKvqxLHEILeUcjYa9zyaVL+WwfvQmpNb
         32D8ksR7S+1Scm/Ens2BO+yHb3WI1FLfAcUhTf5dPVRI7S9+bzltlxdcrt+ahZ+0tvOY
         kgyAvRzCCteLY49kx5TEMfGE0WP2zSexupevZyXS2GCu1QdPUHPyuBt0fvuWYlLxQPml
         Eang==
X-Forwarded-Encrypted: i=1; AJvYcCXs0NaskvFaIPQPaf+eZNlUxGuSNJ7ONje4R8g+c0awFLrgv3qHYygn0eGvo/Xr+XKEFPzOd+M3N+hbzQZhHydx@lists.infradead.org
X-Gm-Message-State: AOJu0Yx8DohfQxsPTPqUx+uCMrrlq8ag/FcMMazFOQHt70iuqt86DcLC
	EqZCy4wVhgaYARdOeh4Mv6OD9QfeMe5pWRReEBHxIgfaVeVd5X9ePYIh
X-Gm-Gg: ASbGncs1nhWioOMCuodIrToWQP6TwERy0SHcVW1GsRjlZFNScATCdmYeKyrtJXc3Y6U
	jXE2l8z8P4WNWbABKudi4ZAtFHFyOy/95rRYDpjLUVFgLUnlYq6uiBibdEys0Ammfr61c5DTFNI
	XadLD0M6jvREsJp44HMXk9+i3YiEUorcimlMdtGziivtMKdhX6WGHv0sL7KKVc7H5m90W40YLls
	UlMQpqNbis9PmtdAe/dTQNj8DiwNJ21M0eUR3d/emlbbFaauFYZ9NY+oq3959NRO4Oi7Bj/L3PF
	w8FwbQHO7n4TF4c8dAQMx4ynJI06OAL/kY9I6OsXazyG8zHtE3ZYAQ/wqxh4uD+3u+XSmcIvyvH
	UrHQLFV4ZtBmJaFYY51Tm6HIii/TuJP86
X-Google-Smtp-Source: AGHT+IG/bG+rHH6H4KxhjjaxQycZZAweGpYfTMuCllHKApJ6KI6vKWQZMMacqTWR/3qipm3upk4BaQ==
X-Received: by 2002:a05:6a20:2450:b0:243:78a:82d2 with SMTP id adf61e73a8af0-24340e2aeddmr1948063637.31.1755830694893;
        Thu, 21 Aug 2025 19:44:54 -0700 (PDT)
Received: from google.com ([2620:15c:9d:2:9cb2:179:b04b:be48])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-77033785903sm262094b3a.66.2025.08.21.19.44.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Aug 2025 19:44:54 -0700 (PDT)
Date: Thu, 21 Aug 2025 19:44:51 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Frank Li <Frank.Li@nxp.com>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Vladimir Zapolskiy <vz@mleia.com>, Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>, 
	"open list:INPUT (KEYBOARD, MOUSE, JOYSTICK, TOUCHSCREEN)..." <linux-input@vger.kernel.org>, 
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, 
	"moderated list:ARM/LPC32XX SOC SUPPORT" <linux-arm-kernel@lists.infradead.org>, open list <linux-kernel@vger.kernel.org>, imx@lists.linux.dev
Subject: Re: [RESEND v2 1/1] dt-bindings: input: convert lpc32xx-key.txt to
 yaml format
Message-ID: <x43o5o4pcmhoudaeoklzanvivvwgytyrubvfwjfigcplaizgzm@ll5mq3nzsgnb>
References: <20250818183814.3603308-1-Frank.Li@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250818183814.3603308-1-Frank.Li@nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250821_194456_081989_44ED95BE 
X-CRM114-Status: GOOD (  10.28  )
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

On Mon, Aug 18, 2025 at 02:38:13PM -0400, Frank Li wrote:
> Convert lpc32xx-key.txt to yaml format.
> 
> Additional changes:
> - set maximum of key-row(column) to 4.
> - add ref to matrix-keymap.yaml.
> 
> Reviewed-by: Vladimir Zapolskiy <vz@mleia.com>
> Signed-off-by: Frank Li <Frank.Li@nxp.com>

Applied, thank you.

-- 
Dmitry

