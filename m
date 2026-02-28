Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6DC88FEE4C9
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 28 Feb 2026 14:59:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wj/z/1ALfyURMPvXqloOriysSWApzMEbtihIaWqfcXY=; b=ECi+4Ss0UwdgPc+A4kIpH72AvV
	wRCbyCo3sFmiOkFaNLMYEML+HGQrLcdetjI/DUYUoTgbANK+fkTajT7mnd3luCEOBOogBhy5KExlQ
	cT8dH9ozxn3imSDo2BgK364BUDKUZI660qmNwlLEa8yABcxjeFqbcRO/YiMSorW1sBhC4piRdVBDF
	C3mHy8ct9ixW9fowJ6RtU3PS4qKMuhARjoxNWChCpnxTDzoUYhYnlzTiBNGzb2PN0BAnb6x9XPXHO
	EI9jTB3IdEQTwZAPhSFNPqwS5YHUXR1Oe8xBwI9/r1hSOD4fUPhs+PwPQOYb/QCqmK6MQdZ8XikPf
	G5N8y8PQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vwLmU-00000009y1P-1BFj;
	Sat, 28 Feb 2026 14:58:58 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vwLmR-00000009y11-3gnU
	for linux-arm-kernel@lists.infradead.org;
	Sat, 28 Feb 2026 14:58:57 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 7194B423BF;
	Sat, 28 Feb 2026 14:58:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8EE81C19421;
	Sat, 28 Feb 2026 14:58:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772290734;
	bh=0OyJcWNteWiTO58j6Le8ba8Qir8zEk0kOYFEoDW4tXk=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=W56Lrb+47NZ+p+mBAUphKa58Oxz8ePjhF0kTbndR+xz0Vy3I6WAlMjicTc/GmLIPv
	 99F6qwsxRi4WUzzTFlfzQDJlioC6/dApQj9gpL6TPZcVWOFeduSty3Y22bpBzLokCO
	 YRXfO7lRoKJnODF8DaIb4M/89rt+e8WjTtjqb5TFIq9U9qLi9onishF/VMGeJ3wjB9
	 rnNdXz3x0l0ReLau2+rV4M0mRxaPUa5F+ZCjMqLkknAKvly43cCvrsfmwhGzS/8CWR
	 08d8T2kt7EfiRrmM75cuimPxPbHDDrofMZk3z35kndaglOVunQckq4eXmFCKjLFYo+
	 NkiyUN3NlUZTQ==
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Chanwoo Choi <cw00.choi@samsung.com>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
 Lee Jones <lee@kernel.org>, linux-kernel@vger.kernel.org, 
 linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: stable@vger.kernel.org
In-Reply-To: <20260224104203.42950-2-krzysztof.kozlowski@oss.qualcomm.com>
References: <20260224104203.42950-2-krzysztof.kozlowski@oss.qualcomm.com>
Subject: Re: [PATCH v2] firmware: exynos-acpm: Drop fake 'const' on handle
 pointer
Message-Id: <177229073130.58647.11987139126675596860.b4-ty@kernel.org>
Date: Sat, 28 Feb 2026 15:58:51 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260228_065855_970404_0FF0AC9F 
X-CRM114-Status: UNSURE (   7.70  )
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


On Tue, 24 Feb 2026 11:42:04 +0100, Krzysztof Kozlowski wrote:
> All the functions operating on the 'handle' pointer are claiming it is a
> pointer to const thus they should not modify the handle.  In fact that's
> a false statement, because first thing these functions do is drop the
> cast to const with container_of:
> 
>   struct acpm_info *acpm = handle_to_acpm_info(handle);
> 
> [...]

Applied, thanks!

[1/1] firmware: exynos-acpm: Drop fake 'const' on handle pointer
      https://git.kernel.org/krzk/linux/c/a2be37eedb52ea26938fa4cc9de1ff84963c57ad

Best regards,
-- 
Krzysztof Kozlowski <krzk@kernel.org>


