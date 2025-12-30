Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59187E95A89
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 30 Dec 2025 12:35:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=j7LQ4Z5ZkwPvAbsa2/UWNXa90SfNitYOY4QhXcR+eXs=; b=ScBsbbxTdnF3V/MsO7UcgjW6ig
	iBEcGsG8IwYXLiWnZVINC0kY/XVKEHEHp3u8L3gjuUeRC2tS1ooNO0nlkezEHgvLsFbrHz9SKePxe
	MFMHAN5FoQytJtMFU9QY4tr9jRZjNG8Z3+reOdKlKWnzyVGUinv0Fs0A3Ws6JkYHVBF29iGIhZKxX
	vcvPNQr3yJzjyVom59M63IEbgcpxI8oW7if7aZrQaetZdJ7Zbe6MuUyHVTBx2O3gYs/MMtyp+A2t9
	8ZxfKR6GylHyv5GQggH9itrK5ToUnFx+jXx8bpg2kab/xaWkLqNpWeYAWkblyuaLNgdWD8bWT+EtE
	eNCdbiKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vaYwn-00000004oGX-3kiZ;
	Tue, 30 Dec 2025 12:35:33 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vaYwj-00000004oFx-1QZC
	for linux-arm-kernel@lists.infradead.org;
	Tue, 30 Dec 2025 12:35:32 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 288934401F;
	Tue, 30 Dec 2025 12:35:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 786ACC4CEFB;
	Tue, 30 Dec 2025 12:35:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767098128;
	bh=SwXASAmQsuqXGdIcB4eRnI5om/oEaYAfTTSnerxLjyw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=iy2zL7cG8hPx+Unpu0jiQyHR689YJWOIYrXyIpxfjqgQAr14gqwuqn7yov1TYySzs
	 5buxKOemldUeDUEYWnlhpZQzM2Zq9hk010n5K5p1wPeCuQ5ADXR3yjVTLd29wpG2hc
	 GgHiZZcOWzOKgGhoFfHqlU0k+jyo88NguhGUChys+yzE3rO7vOH2Nsnoy8kd0AsBBS
	 zVhvmX/Qf7Sg9juDQFEQ9X6XOFmyx+UlHe+d+VORUWumY0QKPXKSIZLLIJUNGCJWgI
	 b4CEr77XJo+VOQ+ucBZB28tw1TEARb1H2Mt9jjN+5E7TOvVQiaH7l7/a937CSCEeNR
	 ulYUZZoul5aAg==
Date: Tue, 30 Dec 2025 13:35:25 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Nandor Han <nandor.han@gehealthcare.com>
Cc: wim@linux-watchdog.org, linux@roeck-us.net, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, shawnguo@kernel.org, s.hauer@pengutronix.de, 
	kernel@pengutronix.de, festevam@gmail.com, linux-watchdog@vger.kernel.org, 
	devicetree@vger.kernel.org, imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] watchdog: imx2_wdt: Allow to continue in low power
 mode
Message-ID: <20251230-pastoral-enigmatic-chamois-b65343@quoll>
References: <20251229145000.421426-1-nandor.han@gehealthcare.com>
 <20251229145000.421426-2-nandor.han@gehealthcare.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20251229145000.421426-2-nandor.han@gehealthcare.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251230_043529_408325_A405D3B5 
X-CRM114-Status: GOOD (  12.78  )
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

On Mon, Dec 29, 2025 at 04:49:59PM +0200, Nandor Han wrote:
> By default, the driver suspends the watchdog in low power modes (STOP
> and DOZE). In some situations this is not desired.
> 
> Add the possibility to configure the continuation of the watchdog timer
> in the above mentioned low power modes.
> 
> Note:
> Please be advised that the difference between the variable name and the
> device tree option has been intentionally selected to uphold the
> prevailing driver functionality. This ensures that the watchdog remains
> suspended by default in low power mode, while also facilitating a clear
> and intelligible device tree option name.
>

Please organize the patch documenting the compatible (DT bindings)
before the patch using that compatible.
See also: https://elixir.bootlin.com/linux/v6.14-rc6/source/Documentation/devicetree/bindings/submitting-patches.rst#L46

Best regards,
Krzysztof


