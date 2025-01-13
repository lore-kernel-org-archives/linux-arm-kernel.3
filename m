Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E79C6E7719E
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Jan 2025 08:36:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To:Cc:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2M/xnJphBUzCcjZlLtKi3iA13j5DEXJ9BhN7BnaNhrk=; b=K3fEn/JrJ1YuRH6b6xjiqiXtPN
	N2sB28IsOubvDOks7xNtRNApEFlMwQBrSFDRY4qPr1bkjJ8wzSPBJEpYmsC5MKl/X8cwfEV4eDqN1
	lQ7KtOBRFOBEmLsNwuXMlEFfkxS5UEkavo8uy4bsNM9t2WK09Wpy/neCj+ZslEipeNd6eCRZFh0xi
	t9+eD/Q8llqauHfJVKfGCO4u97asAZCUFkDoh+1Fa71rzEqJDkajtKPUhVEVvoVE3GBYTdyWqiIqV
	mQgsiqiPkATMg2cP0mpcZteij56gLEjDkVvfOFUkW2sYZbtM3T7tnsCTCl5nRnK5jJHbxsJ2JfL1j
	JPpuppeg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tXFw7-00000004PsM-1hA7;
	Mon, 13 Jan 2025 08:36:39 +0000
Received: from relay5-d.mail.gandi.net ([217.70.183.197])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tXFus-00000004PY5-0xGp
	for linux-arm-kernel@lists.infradead.org;
	Mon, 13 Jan 2025 08:35:23 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id EBF7A1C0009;
	Mon, 13 Jan 2025 08:35:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1736757319;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=2M/xnJphBUzCcjZlLtKi3iA13j5DEXJ9BhN7BnaNhrk=;
	b=NwDC8x5ICmGvURqTj97rfvXYBQ216mS20T8xfQvMwMsToJeZtQ4coiFoqyeL5H3io1wULa
	yt2j8pq1retjB4JIx43HldsiClXWAruCWuJ2HqEu2jE1g6BfsWmfFSY6d7rpuYCsURqtde
	k2DvJk0gCa1IuX6tVEVkF9Jzty/dJr1e7Y33FNc5ClzdrvdKppQ0NzDUhC4v0OdHI7ReUD
	E4gFY0O0A7qDaWmTePOU7o2EHUtTz7J0HTjnqYGrGGGclPhSNF1tnbIzLHkFqP7NUr4Nd9
	W1oxdb9YLEsxRruqWMR2crGBMvib3k8Td/FJX3HCTbhW2pIzDB0SG8/XXGvtdQ==
Date: Mon, 13 Jan 2025 09:35:18 +0100
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	linux-rtc@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH] rtc: stm32: Use syscon_regmap_lookup_by_phandle_args
Message-ID: <173675730307.1496086.4868139037996576854.b4-ty@bootlin.com>
References: <20250111185405.183824-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250111185405.183824-1-krzysztof.kozlowski@linaro.org>
X-GND-Sasl: alexandre.belloni@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250113_003522_397365_CF3E632F 
X-CRM114-Status: GOOD (  10.50  )
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

On Sat, 11 Jan 2025 19:54:05 +0100, Krzysztof Kozlowski wrote:
> Use syscon_regmap_lookup_by_phandle_args() which is a wrapper over
> syscon_regmap_lookup_by_phandle() combined with getting the syscon
> argument.  Except simpler code this annotates within one line that given
> phandle has arguments, so grepping for code would be easier.
> 
> There is also no real benefit in printing errors on missing syscon
> argument, because this is done just too late: runtime check on
> static/build-time data.  Dtschema and Devicetree bindings offer the
> static/build-time check for this already.
> 
> [...]

Applied, thanks!

[1/1] rtc: stm32: Use syscon_regmap_lookup_by_phandle_args
      https://git.kernel.org/abelloni/c/3f76ba88c3fd

Best regards,

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

