Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9900106F30A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Mar 2026 09:06:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+Xlwh2nloblz8DH/N1OHqaA32fAZ3UK1+Bg0PjnWip8=; b=tSSRbOHUSwdX+VqeKcfyTIj7Ng
	93FzSfs18H9shrkSS1O1/U/SO51o4CAMgI8k57YTxNP2NwO5EAEP7XenAsKVsJqmQV6XxQSa2Pd7a
	G6pZ7X9f7SRVS5LlQsfStmXUxWSC3crexwV1ktfWCQJD2oROShxMkmpw1X+v6dOHdgOjgpVVTEfoh
	3CjKbCv4qo8OWCJltasbw4r+vHsd6I/wwe8f49ug/sBLZspUf+VaaMrWu3dyz9pL/pGVAGtB+2B4Q
	BX3PhdbzPlpXgmugYhTpkd/xsKVqxZEJ/drl3ANY+lGK6vWCNqZpTGafyQfJSuYdk9OfHFda3rP31
	UbsXJT3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5gfn-000000056EI-2aoa;
	Thu, 26 Mar 2026 09:06:39 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5gfl-000000056Cg-0l6M
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Mar 2026 09:06:38 +0000
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-486ff3a0fc1so6634725e9.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 26 Mar 2026 02:06:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1774515995; x=1775120795; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+Xlwh2nloblz8DH/N1OHqaA32fAZ3UK1+Bg0PjnWip8=;
        b=GaVGJZu2fq5/T0tBF2voZJ1wKd67jNWxcRaxcw/0LWN96q8iCBptO5BONfuwanboEi
         bB1IK451xaO1PGKCnYN01rhpynpDuJV2brZsQlvmPDAF1v/6JoAfSI6tht6TP2Ii6nrs
         sBGzcqwr+aYv66wrUtUTidjUlAZ+/5YhefBEozMldCtD7JIQqUQpL230NOyQjEdZ1an8
         VMspNczjESiWPacQaH9KZsu184pgWaIOMIk+zVCBcctlMXWUn6sMuZjoxf0JgoUshVab
         wJ23yLDFQqNAkZQc9ICxuiiqMbzpEsFW8tioBVLGXygcSDqbo5errnSi5sVEZgmGCVoK
         o2iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774515995; x=1775120795;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=+Xlwh2nloblz8DH/N1OHqaA32fAZ3UK1+Bg0PjnWip8=;
        b=qi9/exwGm9D+1lGjGmmESNW4neezsDvo2KJgoZryWS4K+GWuJ71XPGHUbND71J0kDC
         IvcpUy0IyZUsidA27hhag3JeiGPvhVpjXOMFkHZSnpiV26JwPqP2JLkhisYOGeIszrkj
         yai0lTGMUsDhTESVv41sCOm3t3Src9jEStI1MssR2hg0AL47vV4KyIwBe/LwirBvErLb
         Nfd3zPAg4zTLvSXhVBjqDpsEEehyKOnmQxemO4sEn+/06HFLx1c19xHpcY7IamOyN4U5
         3BK6vJbAi7JYbQj1WojSnnyaJRN6sGQJYVpVIrOWHOyC2jDU+xuXKRRxUMgAymLc9pbp
         a6iw==
X-Forwarded-Encrypted: i=1; AJvYcCXtZ8ATVb8hnk4xmgL/PfoFbo7PKO52yRJTGrTTx3y38SyWoXRxu7eDSFWNHVW//EdCnZzzgzmEyqZGnAISJZhp@lists.infradead.org
X-Gm-Message-State: AOJu0Yy8wIMokgOtRCvgw/GrOidFP0AIUm5p38eJIJOVXDpEstA1qHxi
	mq0WwuZYt2BWQ2SqVofQ2Mj8cOJDRWV+Q/0NvfzcWyHlCxKjOBpck2NcnQW0cEY8q8f7t7h+NB1
	wHW2l
X-Gm-Gg: ATEYQzzkJSdmAHyCz5Oe2MjpL/vMvkSDNXDjqJNuF0E3tFEKvyLM/VgPcLfxDPkfOeM
	9pBFzu2zu7D23soYeLA3JRmRSkISByBQOeEhIBYvQNyHUDLbD1abkbRqUJefL0iR7KqJQ6PLHBR
	0aDB+OEuzuw0lCSSPwLx5TIWmsBWGSlnF8aajk006vl8goqUz1I/jUG7BZh+vclRjJQfr5iST/w
	Jev9ByL5Tx9e6wyp3ogKmakJYgXr4qIbC4IFo1TAHynZI3HM+KO0YOxnvd+xjESOa77RCyMBEDX
	4xcedwi+jEXufA++ZLeTPEseNZyZob9Dscao7Lxrzqjbmb2fD78adqXK260yh5MpioH1JK3uith
	5aTLRea06ePjh0xJNzcxdsc/vXJRVLSmbL+HGBN3s5Hpf3DPaoAzA0nadtrc03s37E9lKChJ+Xw
	Zzhbq+eQKckNIh8j5D7nt+VLxL/Zb1PD4QLk8rU2ErhVz8KCRs+2dWEIk=
X-Received: by 2002:a05:600c:4baa:b0:47e:e2ec:9947 with SMTP id 5b1f17b1804b1-4871607ac9dmr52495635e9.33.1774515995000;
        Thu, 26 Mar 2026 02:06:35 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:106d:1080:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4872090368dsm14726905e9.5.2026.03.26.02.06.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Mar 2026 02:06:34 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: khilman@baylibre.com, martin.blumenstingl@googlemail.com, 
 jbrunet@baylibre.com, Nick Xie <nick@khadas.com>
Cc: krzk+dt@kernel.org, robh@kernel.org, conor+dt@kernel.org, 
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260306030756.2421841-1-nick@khadas.com>
References: <20260306030756.2421841-1-nick@khadas.com>
Subject: Re: [PATCH] arm64: dts: amlogic: t7: khadas-vim4: fix board model
 name
Message-Id: <177451599416.122020.7359168833224163139.b4-ty@linaro.org>
Date: Thu, 26 Mar 2026 10:06:34 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260326_020637_243183_74DF664F 
X-CRM114-Status: GOOD (  11.89  )
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

Hi,

On Fri, 06 Mar 2026 11:07:56 +0800, Nick Xie wrote:
> Update the model property to "Khadas VIM4" to match the official
> product branding and maintain consistency with other Khadas boards
> (e.g., VIM1, VIM2, VIM3) in the kernel tree.
> 
> 

Thanks, Applied to https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git (v7.1/arm64-dt)

[1/1] arm64: dts: amlogic: t7: khadas-vim4: fix board model name
      https://git.kernel.org/amlogic/c/771d092af02a11ec565494052d18ddfb5e2f1428

These changes has been applied on the intermediate git tree [1].

The v7.1/arm64-dt branch will then be sent via a formal Pull Request to the Linux SoC maintainers
for inclusion in their intermediate git branches in order to be sent to Linus during
the next merge window, or sooner if it's a set of fixes.

In the cases of fixes, those will be merged in the current release candidate
kernel and as soon they appear on the Linux master branch they will be
backported to the previous Stable and Long-Stable kernels [2].

The intermediate git branches are merged daily in the linux-next tree [3],
people are encouraged testing these pre-release kernels and report issues on the
relevant mailing-lists.

If problems are discovered on those changes, please submit a signed-off-by revert
patch followed by a corrective changeset.

[1] https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git
[2] https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git
[3] https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git

-- 
Neil


