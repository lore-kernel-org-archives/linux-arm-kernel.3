Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC1F2CA1013
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  5 Sep 2025 09:29:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LqrJFDIp3Qk8Daspity93aOZRCLtvYxKedurcvKPi2w=; b=W3QEvS+z6qE24NAojGFzRILdpw
	UeTBskk6plnROS70G7T97iv28Dt/EFmgwebGFX8U+TVM/RBLZqe3RNcaGVldFb64AOG5kuWMcnju3
	vGf9uF4CGRWCaRgFjIsJ0I1i+MyaPmzclD9y6EehyxW7JSJm41YhkWT2s+elIqb1Yb341BktOvVZ4
	7YNYU77zdPa51bE9aGA92A/JzGLnRR473FfCHzYPNSVcu58ZL4ElcVt3Q7kLaReXKezFREZtQdOs+
	kK3jWC5/LigMxlQzT2m+rmUrYrB1ZGQO20cjmDem4s4i3ItKT7BhM+5lywXScwBzbE8z2Q6wlpgIi
	RF9Xs7Ow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuSl3-00000000kNx-0eYo;
	Fri, 05 Sep 2025 09:29:25 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuRYC-00000000Gcp-0Z7h
	for linux-arm-kernel@lists.infradead.org;
	Fri, 05 Sep 2025 08:12:05 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 6B513442CA;
	Fri,  5 Sep 2025 08:12:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B0666C4CEF1;
	Fri,  5 Sep 2025 08:12:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757059923;
	bh=mNHu3Dq59LBMQxbgLxMaQI+8a9Nh6j71J6ILlJhwpkI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=rjBIK5wn6f7pd2b8kgpHsnktswpp0jsDZKR+mzoJkrpRqXsGOQ8Hq09cIY3lkFHJg
	 nzUh8vJeVvCdy9sg3kNocvcU8WKjE48Xzke8Ix1mGA+L6jOujXWlGqEKQiScJzXtiT
	 5hu0HdszSfr9/RVGP78AH7xeJ5J0/kP61EnA1qETBh7gigujUy74ck5aukJnDbbpdo
	 ceEGFRzCva4VFLytCgA8BZFa31Uh77McjxyDjNeh9C9WbrRs7irDuQZ2wO9B2dsW3q
	 R4hHdZ5RcHXuB6vVQasltt21cL+OyQihQpV+b/IXU6ogkDBDmcHSHfmCi11schly5c
	 SSVP5k2l+rypA==
Date: Fri, 5 Sep 2025 10:12:00 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Billy Tsai <billy_tsai@aspeedtech.com>
Cc: lee@kernel.org, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, joel@jms.id.au, andrew@codeconstruct.com.au, 
	linus.walleij@linaro.org, brgl@bgdev.pl, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org, 
	openbmc@lists.ozlabs.org, linux-gpio@vger.kernel.org, BMC-SW@aspeedtech.com
Subject: Re: [PATCH v2 0/4] Add pinctrl support for AST2700 SoC
Message-ID: <20250905-rough-notorious-leech-dd7a0d@kuoka>
References: <20250904103401.88287-1-billy_tsai@aspeedtech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250904103401.88287-1-billy_tsai@aspeedtech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250905_011204_196843_6369ED09 
X-CRM114-Status: UNSURE (   7.55  )
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

On Thu, Sep 04, 2025 at 06:33:57PM +0800, Billy Tsai wrote:
> Document and add the pinctrl driver for AST2700 SoC.
> 
> Changes since v1:
> - Update pinctrl aspeed binding files.

Anything is an update.

Really too vague and some time ago I am sure I complained about this to
Aspeed.

Best regards,
Krzysztof


