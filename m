Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C741CFC501
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 21 Nov 2025 19:20:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DkiySot0JlTeM81NDSJaYwCGtmRwSko9cXTn9FLOklU=; b=ozU1wsNpluwMovWZivjhzXIvB4
	fK7t4RQ1KpWew+Y4crxKiH8QnuuqObcg1T6pGhL3d8BNG5P5qih8Y0ynn3ES7On6KUKLgfsnRIJCq
	swaShbqy8hlDlsu9EyD0kq9gWG2OZ6iljSdkgix0wf3FnFYLu+KCCNPINp8bPEEFtGWyr86WLRiwJ
	QF9waSQV2K73brqeHZ4pT//gae8yF1iyelZSIbsgTYeE7Ulp0Xq3sDgJ+w9KjrD4YOODjBxbY63iY
	9T/No+EyDQ/N4GxiIuAe7TaMCe4MY91AMi/ZTmTz17C58GMtZFXCJoGxWsvmEUVPBtPILqEa+NX29
	mboUGALw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vMWgZ-00000008tY4-4BFG;
	Fri, 21 Nov 2025 19:20:48 +0000
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vMWgW-00000008tXQ-05um
	for linux-arm-kernel@lists.infradead.org;
	Fri, 21 Nov 2025 19:20:45 +0000
Received: by mail-pl1-x62a.google.com with SMTP id d9443c01a7336-2984dfae0acso36290675ad.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 21 Nov 2025 11:20:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763752843; x=1764357643; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DkiySot0JlTeM81NDSJaYwCGtmRwSko9cXTn9FLOklU=;
        b=fsHcy72vIsG+XhzJ6lF6L567pvEh5BjB9SvrC8G3YiHOrsQGMc5IH4lXGKNwWdRrKV
         ityMQwwh9eU8Wyg0dKdfnzxWI1pQMWEWkcSaTtSuuk/kdrwTbIJz7SaEgyGJ+Y7nN+jy
         4b8p3OKN6vx1yLEHcibY1CwBSfWG4Rp35cJn7yfyqYYxiZWaLaDjYGdglqDrnOax7+W9
         m+J3z19nrcbQ/ft6TwA3oeBzYxEzzAdUn3rU4F/d8+auwRO1DBcgJ84KoK6jWosBk6B2
         O9fwEvuzE0fr/frsBuSLYTKrpK0KU1xS/wMZuDE0YEiz9mFxiemhTbJ/fKV/Fs1lWd5f
         mV/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763752843; x=1764357643;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=DkiySot0JlTeM81NDSJaYwCGtmRwSko9cXTn9FLOklU=;
        b=QvKQMQb1PcA/Lx6TO7jzPTg9y3rU8chMWifX9f6pDQBsB2scWVjOP1hZ2MqnHlnrMI
         nBBxC4oXzIf5lVbuXAJ9Bi3dxy2cXp8Ys8iQrJJLcZOwz0EWr6gtUpKQwKWRYsyJOdiq
         FhVNROJ7Q7HTjZ1tXpPw3180pbk9+NS+3qKxOGIpfGZbEPNimm+E5Jrv2H0yb6lYm8sS
         sPLbyKRBHysBmCmU7fzXN0NeJx+2LKHUYN4LuQLdG/I5wG4rZpZ7M3rp8H9cX5Yz3Q85
         llS/WpxhG29bYB9TOEyJ2qnb1c8G1rCKVIA7RHJ7dsVuVgTiOJ4G3T3PkI1cX67euaQW
         c7TA==
X-Forwarded-Encrypted: i=1; AJvYcCXllBvOfwA1Tga4C0rU9/lKhZ8bWur4QxSuzH6ToslCLRXbK3amm4fT0WeThJiggWkq7vQzqOAazcMGL7IyBAmZ@lists.infradead.org
X-Gm-Message-State: AOJu0Yz/o+lGHflUSbxCy1+m62d2SeRmus6M1M95X8N6IBxwDq9n4fZB
	+HDh7ImMa2GBKlBPAVzYu3u4A3bPDtdTdF5WLOnFgKcT+DMR/SDP2GaO
X-Gm-Gg: ASbGncu3PE0zUXoY/ml3+RuXOQqxBL8tQORFaj5LvC4e0rb6m4XGUR7DBt9fBhhnkR1
	mSVXqNyAj5XYf413UQpFccrDpqDRYNOqJ9WCABKfBlJrsiF34rBC6tLJsZ1Kj28KtQaLXPUlQwV
	V2JYQdAJugcLu1Vo6+sTsLvjp1KaIFWKGnCVsIZhe6OidtPKfiKIR3YnobH7C9xnfamzB/6ZJ/U
	iC6XxudLoO17cK0jtRDkQ499OOwKb2/WQBIxcTZkSSU+NmqW8vADv9Spem/tXrVGhP3qDeHtgUw
	PXIgcTst1NeQUSf961UoewyweRUgmCbo877efxmRBMkUcM9YPpE1ylaIhh5Mj1y8vSqbura0WAr
	3M6fgZMaGy0OXBQAXry38Y66kyQRrepSZLytb/mG5AVo2uj8iQwijvsGoMFdAS5lS37YIaznwxC
	vG++4WHDeIallP80M9uAkQy7o=
X-Google-Smtp-Source: AGHT+IFGSMhAaX0qmWupzfxH6SdMnBmmVUzXc6aFgY6Jd8H4M51kLSvwGWZdzl8zwzxLzIH4iUB1jQ==
X-Received: by 2002:a05:7022:793:b0:119:e56b:c746 with SMTP id a92af1059eb24-11c9d711aa6mr1429994c88.11.1763752842786;
        Fri, 21 Nov 2025 11:20:42 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-11c93de6d5csm18602216c88.4.2025.11.21.11.20.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Nov 2025 11:20:42 -0800 (PST)
Date: Fri, 21 Nov 2025 11:20:41 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: Billy Tsai <billy_tsai@aspeedtech.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org,
	linux-kernel@vger.kernel.org, BMC-SW@aspeedtech.com
Subject: Re: [PATCH v3 1/2] dt-bindings: hwmon: Add AST2700 compatible
Message-ID: <d47e02aa-5cb3-4ae9-b2c8-896534f27404@roeck-us.net>
References: <20251120-upstream_pwm_tach-v3-0-eaa2f9b300a2@aspeedtech.com>
 <20251120-upstream_pwm_tach-v3-1-eaa2f9b300a2@aspeedtech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251120-upstream_pwm_tach-v3-1-eaa2f9b300a2@aspeedtech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251121_112044_067521_D5C12575 
X-CRM114-Status: GOOD (  11.11  )
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

On Thu, Nov 20, 2025 at 07:12:31PM +0800, Billy Tsai wrote:
> Adds support for the AST2700 PWM/Tach controller by extending the
> compatible string enumeration in the device tree binding.
> 
> The AST2700 PWM/Tach hardware is compatible with the existing binding
> schema and requires no additional properties or modifications beyond
> the new compatible string.
> 
> Signed-off-by: Billy Tsai <billy_tsai@aspeedtech.com>
> Reviewed-by: Krzysztof Kozlowski <krzk@kernel.org>

Applied.

Thanks,
Guenter

