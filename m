Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2038810A3D80
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Mar 2026 12:18:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/azvFG1nnUlhxSiJLaoTFukeNHF4vMpB+fiAo39JynM=; b=X52XF/E7lYaLuKdiYE7CZaFwUV
	HdYupRLOIlY9MJXlgq7f4ik7/49x3aYZXPG2hq/jRBRaT/S4/XOJMoFVkoz0us2oc7UwF/ZYP4z3E
	WOus+mLi9+Yb0+T2W7DxIYmXTsFD61FF1fXHpm1PxcfvynoUwQSgoMnNszXxabMN+kDyo1v4QR4S/
	T+Fj8HUaa4UUuc4H1vRebYMcF2lEzGhg/IkvQzedNAPo+hA6RH9j/2Q7ZXCMsLUuPQnCeLO7R5PDZ
	tuYZGlTOieidFyvi7uPuPGjat9rA1LULnbh1/zE6HvV6h84NXRUjuxgzvLZgXPnzTqgMeNyy/3Cq6
	90paVChw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5jev-00000005QNG-48q3;
	Thu, 26 Mar 2026 12:17:58 +0000
Received: from mail-lj1-x230.google.com ([2a00:1450:4864:20::230])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5jet-00000005QLu-1j1Z
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Mar 2026 12:17:56 +0000
Received: by mail-lj1-x230.google.com with SMTP id 38308e7fff4ca-38a01c80c34so8404111fa.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 26 Mar 2026 05:17:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774527473; x=1775132273; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=/azvFG1nnUlhxSiJLaoTFukeNHF4vMpB+fiAo39JynM=;
        b=gBir9IQBM001mpmG6sSigv/I8hel+uS38p4twzZsdUsdA9/vvENd0A7+n6QMAskxJb
         2rTWOv2Bdn7D77H6DQoXJBljJ3fLZQCaqR5ionMbpcMqy0VbFqvTbQeO/6JOie3LmzS9
         p6J8EFWU4W7mNItDobs3fyc60H6gIeCTdNS+xr8EmyJjlvcmxHnXI6MlOnOlUFNaW6bN
         jZbYUl9fm2vIytGq8ZAGpSl/xnO1nVTsx7LvGnM9qRmmHSYvuz5XDoHRO/3SrqQ6lcrN
         NO0JLqE+frl0xptlR3/TBFeqamaUuO3gI30oq/jP2iAxx4r4OGOc8vvBmzcFxc57OJbF
         sD2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774527473; x=1775132273;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/azvFG1nnUlhxSiJLaoTFukeNHF4vMpB+fiAo39JynM=;
        b=h2WXr8HMJxluq+uqQ3Kh5YJ82XznNVqmOVscWVPv/d2f1xg9u3UYSa+jpXIUF6svJf
         dJdO60ftz17PA4QR8mXfhb/CTRb14kFuXTGdCPts2smTEws2PskH4rVz/fJBrNQVxbb3
         VRjZ7xNu/iMqU631t1eabKMlVEDwApKhFqilOXUOfVoLfQ96lNfO5oLd4SJ2rgDv0E76
         bVP0itNuo1eBO5E5OgMV5d3X9BmwMBl4/I1qO43BsVaVjnVUqNlV0wl8KVEb3vvZ7Icx
         B9znEwW5QNXtF8KQorj/01pZpTlPkW2twGomEdIKqyAW48JhkZdS2W0sQit9w5wHYD1j
         cbow==
X-Forwarded-Encrypted: i=1; AJvYcCXjSt/cRs7A81UhP0W55JEHqfSsfNJeO4GkuEBi3TZ3l+Ml/Bz7pQTq/Q3DW6/holIr3xY461ZVCHWjUefrJ8xP@lists.infradead.org
X-Gm-Message-State: AOJu0YzcXovl7fr6oMxFMT8wwRzr4JzngdjZ9Xm8oOAmEIAULJLPMQgi
	BW3Flh+zNp//KR5fX4ieinBiyI4DFs/V+fXH4jPjVgV4Zclx1xgabxIG
X-Gm-Gg: ATEYQzzpsrrV99YuedoYt8CqA/dxXFk6OJdeLAMtXgk1YrJPy53YGk4rvofK8rV38cs
	/74jtZjZq7YwDqa3+0ikhpHdFnohRyf4mMQNLACP0Zdi0VbzRnBX0XcU2LG3J1FjZYwkxJuvUzW
	uRL3e2wmoadWbVttVggs3FO50n4Jh3Parix0HQiDdFeMCI0hU4mJtJQ4Tjr6D7FR2wuBKHaZ9Vf
	0v25RIAm5ESCcuN6qJ1QBJidlY7iQlbjyzI7bhtBhGN+arQcDu/dbNNBkQgSeWc+7yeZE7qY3Am
	/INW+T+Yo0GNl+oWSI1FqZo8kLBDkfC35PVGgQos9w5eoR/bTulNwc6rJcJnhz9PcppzmYCPskG
	tJfdDxL/nzANRQFlHQkRtYamxlbqOz1eEiuOsVHsIKOegXHPHMips6dabQZsGmSLRt0hcn6FUwC
	mhyMuQ9MuJxRXvpqeJvjkJ7FqoWemlxtoU1+eLkv0zrTGF1qNCI9yiaWP8ZZJ7
X-Received: by 2002:a05:651c:1114:b0:383:18fb:fdf0 with SMTP id 38308e7fff4ca-38c431f2536mr24521661fa.22.1774527472629;
        Thu, 26 Mar 2026 05:17:52 -0700 (PDT)
Received: from gmail.com (83-233-6-197.cust.bredband2.com. [83.233.6.197])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38c6a848cddsm520711fa.13.2026.03.26.05.17.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Mar 2026 05:17:52 -0700 (PDT)
Date: Thu, 26 Mar 2026 13:17:50 +0100
From: Marcus Folkesson <marcus.folkesson@gmail.com>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Peter Rosin <peda@axentia.se>,
	Michael Hennerich <michael.hennerich@analog.com>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Andi Shyti <andi.shyti@kernel.org>,
	Andy Shevchenko <andriy.shevchenko@intel.com>,
	Bartosz Golaszewski <brgl@kernel.org>
Cc: linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v9 0/5] I2C Mux per channel bus speed
Message-ID: <acUj7u5o0Pch260w@gmail.com>
References: <20260324-i2c-mux-v9-0-5292b0608243@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260324-i2c-mux-v9-0-5292b0608243@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260326_051755_473930_7CD97CF5 
X-CRM114-Status: GOOD (  24.31  )
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

On Tue, Mar 24, 2026 at 02:54:14PM +0100, Marcus Folkesson wrote:
> This was a RFC on how to implement a feature to have different bus
> speeds on different channels with an I2C multiplexer/switch.
> As no major complaints on the design came up during the review, I
> decided to submit the series without the RFC tag.
> 
> The benefit with this feature is that you may group devices after
> the fastest bus speed they can handle.
> A real-world example is that you could have e.g. a display running @400kHz
> and a smart battery running @100kHz using the same I2C controller.
> 
> There are many corner cases where this may cause a problem for some
> hardware topologies. I've tried to describe those I could think of
> in the documentation, see Patch #5.
> 
> E.g. one risk is that if the mux driver does not disconnect channels
> when Idle, this may cause a higher frequency to "leak" through to
> devices that are supposed to run at lower bus speed.
> This is not only a "problem" for changing bus speed but could also be
> an issue for potential address conflicts.
> 
> This patchset has been used and tested heavily the last months
> on a custom board based on a da850 (DaVinci) platform.
> 
> The implementation is split up into several patches:
> 
> Patch #1 Introduce a callback for the i2c controller to set bus speed
> Patch #2 Introduce functionality to adjust bus speed depending on mux
>          channel.
> Patch #3 Cleanup i2c-davinci driver a bit to prepare it for set_clk_freq
> Parch #4 Implement set_clk_freq for the i2c-davinci driver
> Parch #5 Update documentation with this feature
> 
> Signed-off-by: Marcus Folkesson <marcus.folkesson@gmail.com>
> ---

Peter,
Do you have any feedback on this new approach?

Thanks in advance,
Marcus

