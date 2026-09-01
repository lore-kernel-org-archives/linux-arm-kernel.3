Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94BB7C61DD3
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  1 Sep 2026 13:11:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Subject:Cc:To:From:Date:Message-ID:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=W4WQe8WxOJvjm3sLRvwhf9J7T9KlfMScAPN+0OUz8OY=; b=mtT7J3dT4qT6pWIUkcqxESNCkB
	gRlMW0zSa6AiUkv89A241Lf5GdJDUcMr6DrSyJCpt0hGPoptpN8S9dR0xWHPIcMkpxEsWhAgqSKpe
	fXAc/XhY6FgQpgg/wK4PkV4YQY+TqN1kWZBD5/Orau3dkugZDUbqOgd+GFVFZWPdmjOjRoHKFfT7E
	GqqSOsOw/Tn0ymUW/4d4wQjMw6ogfrWE83U+A9MODK20EhYjUa0VEGWJIxPm4dQOpd7/wvI7Osi94
	qqgjoO5h5wAX24k8/Ed3K9jsOCFR936ZkrqGu2GBL+rSeEy9dS7Lg80l2G3KGS2swhzd7O7Q+8rF4
	sbn6ZPkA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1OGs-0000000CA7v-1LIy;
	Tue, 01 Sep 2026 13:11:26 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1OGq-0000000CA6l-0IJu
	for linux-arm-kernel@lists.infradead.org;
	Tue, 01 Sep 2026 13:11:25 +0000
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-49cd77e0f95so9847155e9.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 01 Sep 2026 06:11:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788268282; x=1788873082; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:subject:cc:to:from:date:message-id:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=W4WQe8WxOJvjm3sLRvwhf9J7T9KlfMScAPN+0OUz8OY=;
        b=QMs2afNqZFhvOXQSZU6JD6UQaUDGquohitJxk1VRa2VcmAZqjyVo1OrW2/hHQDmO+H
         hERytUBokb5UXkAUbhQjMrrTHRqFx94zob6f3LTO9ClACoZw8+DqCLSR9VG8Sr3jWnOd
         jhY7QrQwrm8/hIJF9zHACkMgtmeSiHO+BzE/SGMeMvCLzAfbJO5+0MP2s9ZrdwoXEHum
         f23RI/ihOcvjeR+qGEc5Wk3nlKcFzmhlbU1wjsz0/YhUBBTTyoXx7vQr/nL6shRb5qwy
         0cKmqHWMVnLV0TvKhV/oY5JmcVlDlQwBWRv1pi58TJXiI6c/Mp5Hhgk9oMhHC35+knDe
         0+0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788268282; x=1788873082;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:subject:cc:to:from:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=W4WQe8WxOJvjm3sLRvwhf9J7T9KlfMScAPN+0OUz8OY=;
        b=GW13nqDQ6X2v0tOezTkTzWi3CTXZWTGEhVWpZaJOe5u62A59RbvafXnU8seTzu4BvE
         hki1sgp3+qpKjmLdDcee+I9REgsWW3es0lhxI9pazfvB1q6+9i7NvZ51XSeUywx6jtRI
         ph2nJ7U1wXUc+P/weUx5hKxpKS+okomPtgoejecoqIwRt7TeSbVLYqE8VoaIS6muLb6D
         cX4bvbp/iBN3NgAYnEI1d3BoIuBsuJsQxvTvFzYMHaV7mrGrGgtejC05JDMWwgrRrqou
         iBBbm0tBuEtK2x8W3uc5IdhYs2/ijLQtWMim5ZHkvVqeB1TzA7jO5rXh8CkFEYX80B+a
         HmqQ==
X-Forwarded-Encrypted: i=1; AHgh+RoUrDwV3EQTQh2fatf46v2dHT74yV9hrk1VJ7sWzeB3bO4SnvslLw13j6dqfm+Zr9RJ5qiou9wY7go5TayXNQQv@lists.infradead.org
X-Gm-Message-State: AFuF++kRkcyDjTkEEpffX+xaJrrv5lAtJFFqCZ9rC/IFkA+tS5ejHGB6
	kEoViNfu0q5yb3MKfQhU90KWX6V1gNn17LHwNGnVNS43zcyPcIc7bSUN
X-Gm-Gg: AR+sD11U4HpuR5zwnkt5GSaQnBuxitSsQUdDwXfAQoUPUSrzY5DZ9dPTGF+UW/6WTyO
	HuWLBp4uewv2eA5ia7PKHKd09n9yZSmizP8FGOzIglqvLeTE/IUfrfN3Fu1hxkr7PMBezds81zX
	QrXAlvTam0H0w6IrxxBUIZf+gbBpcxCoiyusDyyVDBauOizf/ZiaKEEj7usEemvE94t4LIWfP7V
	06xS91XOOm6XqlfPpLMjumD1gcfeYeW0arNLIsRt6IprN8qiJVvqA/FibEn7hUVTBKUbr7jVMcu
	NOVs2w6Rlqgl9ZI2Ff3HtRGortizicC6htqkgnBBkdD0Ek8LBA96ZimAXRH3YVRA8HvWDb82Ri3
	dafwoK/cloilTtrJA1X56DC3KY2SwXgUtMcTAydBR5MgXJ3+4v3vBwUDa7/c7Qz/3Xh9MQWUXAC
	Db6yEmEn3gop64IybScL9HR3pxc30ymrAdZpS49rvwNKSKUppQmZIwQrAJkVGiXbb+RA1aH9jcU
	PjeOSgGyBZaE3BIHfzWe694mppc+trlMRxN1Pc2sti8Qw==
X-Received: by 2002:a05:600c:3511:b0:499:adb4:a922 with SMTP id 5b1f17b1804b1-49b91c4bab5mr387735445e9.12.1788268282047;
        Tue, 01 Sep 2026 06:11:22 -0700 (PDT)
Received: from Ansuel-XPS. (host-79-26-252-140.retail.telecomitalia.it. [79.26.252.140])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cdce1a3fesm70391065e9.12.2026.09.01.06.11.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 06:11:21 -0700 (PDT)
Message-ID: <6a96cef9.1f1211b9.23c693.9e1e@mx.google.com>
X-Google-Original-Message-ID: <apbO8hHBw7bMvVxL@Ansuel-XPS.>
Date: Tue, 1 Sep 2026 15:11:14 +0200
From: Christian Marangi <ansuelsmth@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org, linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/2] dt-bindings: phy: airoha: Document support for
 AN7583 Gen3 PCIe PHY
References: <20260827122127.18874-1-ansuelsmth@gmail.com>
 <20260827122127.18874-2-ansuelsmth@gmail.com>
 <20260831-elastic-turquoise-puma-f032fc@quoll>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260831-elastic-turquoise-puma-f032fc@quoll>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260901_061124_126871_C23F4401 
X-CRM114-Status: GOOD (  18.48  )
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

On Mon, Aug 31, 2026 at 08:51:46AM +0200, Krzysztof Kozlowski wrote:
> On Thu, Aug 27, 2026 at 02:21:20PM +0200, Christian Marangi wrote:
> > +
> > +examples:
> > +  - |
> > +    #include <dt-bindings/phy/phy.h>
> > +
> > +    phy@1fc7f000 {
> > +        compatible = "airoha,an7583-pcie-gen3-phy";
> > +        reg = <0x1fc7f000 0xfff>,
> > +              <0x1fc7e000 0xfff>,
> 
> Sashiko has a valid point here.
> 
> This should reflect real hardware, not current driver. It is very, very
> unlikely that hardware designers designed a block of 0xfff size or 0x4
>

Hi for 0xfff yes the block is 0x1000 but I was reporting how it was defined
in the original DTS. For the 0x4 is for real a single register for that
usage. Documentation is scarce for that single block but this also reflect
the same implementation used on EN7581. I updated the example to address
the strange block of 0xfff.
 
> > +              <0x1fc30044 0x4>,
> > +              <0x1fc35030 0x4>;
> 

-- 
	Ansuel

