Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8FB27CA0ED1
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 15 Aug 2025 07:54:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7m6KRZ644lLKsPQroVf0XIC4bXSKC2MeWxzfY2tyrfE=; b=JLmx2oLpPpAv+j/Y3Ywj1inVfT
	KhJNFq4ZObHOzttKRbsnXwbQLMJr0+P9LHeI3t8dU/xrFw2JbGENmv+34lqYnFFTt3SzKRE41sIbK
	YDmbiE2AZRssRhBxQQvF9VuH2SfSESL+lw+a4E/Z+PWPS+1AW9AuPbffB56Bw8wGF3tvwexVZvHYM
	s2kgyiF0pg7Y/LnwhenfhddIVEBxB1KkNldFmGDUG5Le6gN8iAmairZ3Yz+H8yVnXWsAHpcDQ8XQy
	BbKPNYlZ8BuBTxzfW2dWrvO82eB1585CVjsTclBBIJpXCKSFtgey7YsCs5i8xLVziYNZaGMMquhCw
	0JzomDnQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umpGX-00000001mnu-0W4W;
	Fri, 15 Aug 2025 07:54:21 +0000
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umpDy-00000001mcp-2gDm
	for linux-arm-kernel@lists.infradead.org;
	Fri, 15 Aug 2025 07:51:43 +0000
Received: by mail-wr1-x435.google.com with SMTP id ffacd0b85a97d-3b9edf4cf6cso1417121f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 15 Aug 2025 00:51:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755244300; x=1755849100; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=7m6KRZ644lLKsPQroVf0XIC4bXSKC2MeWxzfY2tyrfE=;
        b=q+EaHIll7+jwByzL3rqIXj2GtK32fTYxSWvJ/Su+syfvai0zwPayyNzzCULiuexJ8R
         IG0xsKrmihCkhv6TCvuGluL5F4V4LHl6APPLvghQX4/GY62T9w58GU1Ay65LhK5soQlN
         aIb+cKtrYhLEaGHWiFCDYZfnYyqh4p55rofnYS9+QTN2XzAg/b/aZRk7e3WR/o+Uxyz1
         sgoLgC0dfMfrsEXPjje22FGvRpgx1kJZRw0pjN3af+Ns1382kkPc+0wI2hqooyqg0B8K
         1neow0pxc7YXCeVZbcivgb0tmkVjROvnJwKak5o78kQYZrfmhp2J/OJsfCv2DjgAXdpj
         C/bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755244300; x=1755849100;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7m6KRZ644lLKsPQroVf0XIC4bXSKC2MeWxzfY2tyrfE=;
        b=oAtsULDso8yLAz9mSl5zbvXtqSvHQO7EcnMof3Cet8GOP4VAGR7BaTUoZjavi3hXFh
         k7QT7Fse5s1owGMXAsY66LDS9Up81PUZiZvbh62aQ+tTerhLMoXEYbH04HjHztp4EMhX
         QPc+eedOy33fSojvPASyF2EgSlnMaVc9S87G7dJH2QjaEMJ88ifuflJ0O9z66SyXBH61
         oRkYZJGiEBgbIBxh0JOo777E5q4ENyHk6qawqyA3WHumVkJ7jk2BsKVu4i0/PED7hON/
         7o92LJAH0gRgBACq0jcGvopvuyC33btpNmP+RISLoNI50QS7EDKItOV5awMdqEvHrFuV
         Vd/A==
X-Forwarded-Encrypted: i=1; AJvYcCVTnCDIeLaAZvuWnrl6j/bFubIPlqyO+6u/WUaT89Hdy7Y8xizvg0sPlvCD5sMkm2FNdZITO2RnaRPPRLmGu2zX@lists.infradead.org
X-Gm-Message-State: AOJu0Yz+bNTp2H5+LKBaFvCYmwz/f4alhwGErwf3rZ8GAvCBWa9hW670
	Mfs9cgWRg9xk71Q5V5ZnYX6S+GYdChFG5mrZ8YR6Twmen3fHd4GXVKM+y4WJTaPeSOk=
X-Gm-Gg: ASbGncshjifdIvQ6EaGyCcOww1NgOg2FG45qcDfV7OvoLxS0c1eXHaj9P6KrB9y5NJg
	H1FmtFwCJIdyls8wsSDItbbbXZexgIBrLcBuDcYAaFLX05Hpou6BuiyhNieXabXY3nBQHtrnqmZ
	bDx3K23VP5BAdr7KWbt5oSRRpJSYw7JH6JxIcQEg4CVrwQHsd8xrZImFSUdvaVL7x8EcAIAbhAX
	T0q0H/HeCNpWKbV6wZERMNvPUih1fXVM0ZeBVx3uS9TfOv1X4Q3tUV8goIxuKBntTwrE2GGZ36N
	vxJAeOwU6hhLFt9woZb9sI9lQbK4QK1P9AKa3HpymVX02YFqtLptx4kbxxnuPcAOSjI8Rp2HxMP
	oTctfLJFxc9rfSB5s0nGWfHvw45o=
X-Google-Smtp-Source: AGHT+IHGaYmTmAXRjZNxgrE/I/LGdmAsoAt1BCBaN3PbkpwZZAN5Rl0gISUa4t157xbfeVhA78qhSA==
X-Received: by 2002:a05:6000:430b:b0:3b7:9589:1fd1 with SMTP id ffacd0b85a97d-3bb68fdc587mr833175f8f.44.1755244300612;
        Fri, 15 Aug 2025 00:51:40 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3bb64758d27sm1004077f8f.9.2025.08.15.00.51.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Aug 2025 00:51:40 -0700 (PDT)
Date: Fri, 15 Aug 2025 10:51:36 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Peng Fan <peng.fan@oss.nxp.com>
Cc: Peng Fan <peng.fan@nxp.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Sudeep Holla <sudeep.holla@arm.com>,
	Cristian Marussi <cristian.marussi@arm.com>,
	Marco Felsch <m.felsch@pengutronix.de>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
	arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 2/3] clk: conf: Support assigned-clock-sscs
Message-ID: <aJ7nCL0PS0DX8rtk@stanley.mountain>
References: <20250812-clk-ssc-version1-v1-0-cef60f20d770@nxp.com>
 <20250812-clk-ssc-version1-v1-2-cef60f20d770@nxp.com>
 <aJwnH2mlRdqp1K1u@stanley.mountain>
 <20250815071249.GA20726@nxa18884-linux.ap.freescale.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250815071249.GA20726@nxa18884-linux.ap.freescale.net>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250815_005142_691148_AC5DE91A 
X-CRM114-Status: GOOD (  16.53  )
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

On Fri, Aug 15, 2025 at 04:50:42PM +0800, Peng Fan wrote:
> >> +		if (modfreq_hz || spread_bp || method) {
> >> +			rc = of_parse_phandle_with_args(node, "assigned-clocks",
> >> +					"#clock-cells",	index, &clkspec);
> >> +			if (rc < 0) {
> >> +				/* skip empty (null) phandles */
> >> +				if (rc == -ENOENT)
> >> +					continue;
> >> +				else
> >> +					return rc;
> >> +			}
> >> +
> >> +			if (clkspec.np == node && !clk_supplier) {
> >
> >Could you add a comment for this condition?  It's strange to me that we
> >don't iterate through the whole array.
> 
> I just follow the logic in __set_clk_parents and __set_clk_rates, nothing
> special here.
> 
> It is just like to phase out cases as below:
>   node-x {
> 	/* node-x is not a clk provider, but assigned-clocks uses node-x phandle */
> 	assigned-clocks = <&node-x   XYZ>;
>   }
> 

Ah.  Great.  Thanks.

regards,
dan carpenter


