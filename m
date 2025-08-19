Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17942CA0EED
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 19 Aug 2025 08:24:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+ht79aZIMlN7H9jxDjI1MTRwr0PcN1XBiR81e8sSRJw=; b=dRJRK6j5pHVR/lHs6J7IQrXTvZ
	0PzW8/IafZ2pQoEyZsE52e6wgvkT2TzVVvMJemKfOf/qKoJq0dh8aNCQq2x7JEH9gNQV8TUmcmcV6
	1UDbYFeyZeqE0LlbHnSD6JcaT0jylJh9HNq5e/VzfNXjdJxf1kQzQw5x06Sxh4/OnbVZHlyKEh6Hi
	rlkxaap3of3ZvLQsgujjBgZQf6Xvh7nTGrpF/yTqciwMa5afdoY7Ef1mlrDKR5yFfhoP4524R7lgd
	tXMy6XzoV+oUG3Raxm/T3WW/rvfC37r1TJB0gW0T0ReTWlDNQUnFRrK88nyD/15FcOiK8P4BWJfg9
	m8VnKlvg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoHdn-00000009nMH-2PS5;
	Tue, 19 Aug 2025 08:24:23 +0000
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoH5U-00000009is1-1YYq;
	Tue, 19 Aug 2025 07:48:57 +0000
Received: by mail-pf1-x42c.google.com with SMTP id d2e1a72fcca58-76e2e60433eso3752144b3a.0;
        Tue, 19 Aug 2025 00:48:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755589735; x=1756194535; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=+ht79aZIMlN7H9jxDjI1MTRwr0PcN1XBiR81e8sSRJw=;
        b=jqG8tPyIHbxHTUn4322CtCZdH/NhlRq88DzR1fRPLB2XKHKmbtOuwOujql/0DPEWSL
         ipeXKnSPpaxWTUHdeZPvGRcoQ4HrHavcCWyVo4AN2zIdSCPMSMnZBb8OQuIOGkMXuuAq
         NepWPeFDragi3aF020PEh1UWcA/wSq7OfI70W5stXs82Z5kRb7HRjYFm5W9QyPk/UT9W
         hU9aboqdeVqL1MskXD87TUjKE6W07O65rlZhjQmDXy5HhcGB2WW0oJKH0uwvOOxKtBra
         XA4nHsiizt6VHANSYewm8qX5PjjHv8kPA/aoVpPwPfNex3BC6/ClSjIQ0nI+IbnF082J
         wu9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755589735; x=1756194535;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+ht79aZIMlN7H9jxDjI1MTRwr0PcN1XBiR81e8sSRJw=;
        b=tc9OFJebvwp/jvK3Dy4yfoTYrOOJ1WXD4ZHg6j57pu08tYwohq24t7UucJWiIaz3YI
         TxieIh7teOlHyQjV7s9fA0gAqsAOV8IMrpicGNEXsso/tXtm3DCYqJRscPNma81uXIHn
         7QAD2zFVz5qA+GgbkG3menpA0pa1eZuGOo48S7A75kO6EmLJ8kNGzgR8UF3gyJWfLFgx
         9PZTD8BuD1JNzNA2cPQlAAlNPMAK8j1RdsszgTCrK21sr92Rf1esbA1/SKCDnKpG2qYr
         w48aYb4UYKZKlJYv3Ee+CbnEUl8krITnc8ZuN0ABojTSZSP2KqKKsVmZrYzqfLdJXsnQ
         SL6Q==
X-Forwarded-Encrypted: i=1; AJvYcCUMdCGc8a7pjBaLy4n49VyKi+cBMsOpiLVlzyH/H59HQZz0AkyAVdzTiZUU5Yh3+4sYBdYO428WzkmG0pxlcZVP@lists.infradead.org, AJvYcCX7/OJEaAWDNDrUv3CqFOPkrtFoEKxz69lq45R9MXKfh1zjMhmK+ZKtcMyMi09q2+iMwNrz4bJ6jwgPGOCOzgo=@lists.infradead.org
X-Gm-Message-State: AOJu0YyI9Ux32yTsLdLeAOWfVB6uWTxp/OgFdFeKJFZxcNqRYbwZfsPW
	mqhOVoZuSNYV7DDN8CpablFkhgg2rI7XEINGh/hizE/AwYrOJewSKF3E
X-Gm-Gg: ASbGncswCzJzI1B0HcGVYl7dVoLigErC4iaQJiOIJkeEPIOq7gzHDOkz5F/m0Xk38lY
	lb/3jtkkLgUDCKnYJZwuSUNR2/hp57cU0AycH5VR9BUK4ZegFlxHpIkeIAl1gY7WKzF4l2n0XbY
	TFZWSSZL7MJzxMTS8UJPyHJJ0fuwda6FcnLClMfhQX2/qnG2f1RXXWzyIKTMjjtVUc2knaUDKTZ
	jgFof9ZNIJPmlbSxKc0S9eJ6KKNkubRZhAneME/9idJDDBfAVLt8KmZ+b0eFuHfYN9YLZNL6T6L
	lsHKEfZqMwAZzPaYRnz7Z+AbXcarzwBN0I/T+HrQJP21mfQYFxVX97cstxUuTprMZWRQ+3GODHG
	x2cWpcIEJqCT80s4=
X-Google-Smtp-Source: AGHT+IFyS1pRC/nilFKVPJJNIWYZ8E/oqWs0FiyBi5MrOvkqeJATfICeqlfkAYPlPjxjgr2XEtay5g==
X-Received: by 2002:a05:6a20:3d89:b0:23d:e568:e5ad with SMTP id adf61e73a8af0-2430d4753c4mr2069420637.28.1755589735214;
        Tue, 19 Aug 2025 00:48:55 -0700 (PDT)
Received: from anyang ([106.250.177.234])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-76e7d122ad7sm1684649b3a.36.2025.08.19.00.48.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Aug 2025 00:48:54 -0700 (PDT)
Date: Tue, 19 Aug 2025 16:48:50 +0900
From: Dongjin Kim <tobetter@gmail.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Heiko Stuebner <heiko@sntech.de>, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: rockchip: Change ethernet TXD timing delay
 value
Message-ID: <aKQsYndrYStGTfoL@anyang>
References: <20250819045018.2094282-1-tobetter@gmail.com>
 <380246b7-7e7a-4843-b82b-2e8d74e01ad5@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <380246b7-7e7a-4843-b82b-2e8d74e01ad5@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250819_004856_428537_45F29F49 
X-CRM114-Status: GOOD (  21.65  )
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

On Tue, Aug 19, 2025 at 08:42:55AM +0200, Krzysztof Kozlowski wrote:
> On 19/08/2025 06:50, Dongjin Kim wrote:
> > Very poor network performance is observed on the ODROID-M1 Board
> > (REV 1.0 20220613) when running iperf3 (under 200Mbits/sec), and
> > this problem can be resolved after changing the value of TXD
> > timing to 0x35 from 0x4f.
> > 
> > Signed-off-by: Dongjin Kim <tobetter@gmail.com>
> > Change-Id: Idecd246e3fe93447b6e3e9b165d077d2050bbd75
> 
> 
> Please run scripts/checkpatch.pl on the patches and fix reported
> warnings. After that, run also 'scripts/checkpatch.pl --strict' on the
> patches and (probably) fix more warnings. Some warnings can be ignored,
> especially from --strict run, but the code here looks like it needs a
> fix. Feel free to get in touch if the warning is not clear.

Thanks. I realized that I sent unmodified file that includes
"Change-Id:".

> 
> You CC-ed an address, which suggests you do not work on mainline kernel
> or you do not use get_maintainers.pl/b4/patman. Please rebase and always
> work on mainline or start using mentioned tools, so correct addresses
> will be used.

I've rebased to the master branch, so let me send the patch again.

> 
> Best regards,
> Krzysztof

