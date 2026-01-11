Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED2AFD2502E
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 11 Jan 2026 22:17:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=k0jthX/pgS8ZjvRs/R3MR1T2/Oj+cEFGRf/f2kZmeGU=; b=sickP7vX6KpNTCXiIgal8Sh6+D
	LT67qivoRVzs5Ck2MCxJ6FLlLxyH+HB2r9s1F1ZYaTJY/m5CHgh++xfn0obtMbmpOY+tM74uVvJV3
	uU425sii0/0Fh++pVpoaANItNV156NpPTUWWDJ6xh5ylG7re3354F2PwxyKg2jTuqQVwq3Ot9ZMXq
	8K5LIVj3yWUxrWw4j4qL/PWbj0cuEF13iyoLJGtImGMCAyEzQdcW24zzXwjQKdmOly9DgX3xBugIQ
	mJCCQK919q9QWu7PWb3YaiJVjUH6GojY+HWcZ+/Z/uKvfv4M4N1qKKPQtkr3c61Goc2nFmNu7DgoA
	WjaAuIjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vf3kY-00000004XMB-3hq3;
	Sun, 11 Jan 2026 22:17:30 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vf3kY-00000004XM2-0fPq
	for linux-arm-kernel@lists.infradead.org;
	Sun, 11 Jan 2026 22:17:30 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 38E4960165;
	Sun, 11 Jan 2026 22:17:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 286EAC16AAE;
	Sun, 11 Jan 2026 22:17:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768169848;
	bh=HFLeW/vQfxRwcse0UIhkONJ7hnsbKhsrcLUlRf4DUq0=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=WEaD5sMSwJO4QJ7OgjeLfpjHFCWIPJf74sDoVp0oG+DNQ9zYDhByYJqwHtVs6Ycfy
	 G498QHUvej7cZaj0yMrWOdT6mRxgawZz3BI7gPzvyeUdX+dblNQ7rVF7WxxFhQ9hs9
	 TjbO0gAxvnrLx9Epc6+QwbhHerP52FriUo5t6gNEgeDsO0uEhZ4+yio76jNiss+Qwp
	 eiuQZ68x0rh+7AvIpDUM0Ja5mJXFUi4U3/WLmDsasqcSfTnRI31J+R1DjCbjyomH1/
	 8wEZL3FdNfrjbBHREWRBdbWhoXzgD6jGBROsoULPiVq34WLWYNjWu16LGl7ileUsUJ
	 aWeVkEmVTYbdA==
Message-ID: <b0da2a50-2b4a-40e7-ae0f-3f1100ca2adb@kernel.org>
Date: Sun, 11 Jan 2026 23:17:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] pinctrl: apple: Use unsigned int instead of unsigned
To: Linus Walleij <linusw@kernel.org>, Janne Grunau <j@jannau.net>,
 Neal Gompa <neal@gompa.dev>, Bartosz Golaszewski <brgl@kernel.org>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-gpio@vger.kernel.org
References: <20260111-apple-req-gpio-func-v1-0-6deb1b695371@kernel.org>
 <20260111-apple-req-gpio-func-v1-1-6deb1b695371@kernel.org>
Content-Language: en-US
From: Sven Peter <sven@kernel.org>
In-Reply-To: <20260111-apple-req-gpio-func-v1-1-6deb1b695371@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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

On 11.01.26 21:29, Linus Walleij wrote:
> It is discouraged to use the ambiguous "unsigned" type, use
> explicit unsigned int in the driver.
> 
> Signed-off-by: Linus Walleij <linusw@kernel.org>
> ---

Reviewed-by: Sven Peter <sven@kernel.org>


Thanks,


Sven



