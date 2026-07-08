Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04C6EC43458
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  8 Jul 2026 21:56:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OUt8rJZ/0AQq1r05KhxBp9d1v78gt9AIlJqD+iFhvcE=; b=ac66YAVI3UKIMs+n4/flZYmliw
	SkJL1EiYNq/YOJnRwv7B4S/NJQRIUU7icQcy2XUW9g7d86Yl8y1emQh0MXiBDSGGdmsurmFVtuVra
	lrbpx29f/Ve0hq7PDAZC6rLYdQb9l6zrpqmefUk04NJx0DfSivHSwwgZYxgAi52HXDbf/Cn/paWCq
	aHhmZSw5CTku+IVLUnAE9oyOGFwF1zdVl69VtsTfXoetwLpT2fmvJrrsZCzQn8t27XOic+0O2iQrm
	pE+lbtmXle0Kt6Ri80vwWEfTEFYRXgYsycci6ctcvSe27EflyfPSNA5kSW1tZrbt+iUcm7L99foBp
	SBnACadQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whaFH-00000000Tlg-0mCW;
	Wed, 08 Jul 2026 21:55:55 +0000
Received: from mout-p-102.mailbox.org ([80.241.56.152])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whaFF-00000000Tkm-037W
	for linux-arm-kernel@lists.infradead.org;
	Wed, 08 Jul 2026 21:55:54 +0000
Received: from smtp102.mailbox.org (smtp102.mailbox.org [IPv6:2001:67c:2050:b231:465::102])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA512)
	(No client certificate requested)
	by mout-p-102.mailbox.org (Postfix) with ESMTPS id 4gwX385Sw4zKw3Y;
	Wed, 08 Jul 2026 23:55:48 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1783547748;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=OUt8rJZ/0AQq1r05KhxBp9d1v78gt9AIlJqD+iFhvcE=;
	b=vLvb3sDhhB6nPt89m4m8Uz15sXDTqI7whoSF1zVP9CNL2mH3EzfYRLOHY/O4UD0bB++5yZ
	omii7FWlBOpRA5FTGV9aH9DoVwsH4zQU9eN5pv8ZOl4Wf+BH9PiGxp58OzAfHaud+tCFf7
	Y3e2YgQ8ip13t/2HJ2k0fP+qnBzQ7ID/HV2V/y7ZvVJTXipJ7JqvKOBRt1OCB2NODce4Kz
	rY1U6+b25Vh0hxo1bsW/lBI3y8V2XUI+3kZoCTI5G+Zm2++0d+T4O1nFssZmCGqQpo9Vxw
	Bowl+WrgNZbssBRczd4H53E8eGCd0CsQRid6jCFeO+wFR17gaVqvMlsReSZW3w==
Authentication-Results: outgoing_mbo_mout;
	dkim=pass header.d=mailbox.org header.s=mail20150812 header.b=nYaqeC9A;
	spf=pass (outgoing_mbo_mout: domain of marek.vasut@mailbox.org designates 2001:67c:2050:b231:465::102 as permitted sender) smtp.mailfrom=marek.vasut@mailbox.org
Message-ID: <9c29915b-0b57-41b9-a6cf-5d970756527c@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1783547747;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=OUt8rJZ/0AQq1r05KhxBp9d1v78gt9AIlJqD+iFhvcE=;
	b=nYaqeC9ARNfKvDhiZffpXJQxY+Z+/gFn3LTQ+2FfP/4KjwAy0vs4L9K09YtlYcSgZRPeZA
	pJseT5WmLFAzE+ynTiyoXCK1pe98XaCHQskMCYmFbp2JTEHb9q+muRm2a/jpa0WtJ2aX5h
	xCsgQzeOdrSQhaDRynfr3zTk3PH2nD5VZs/9ECt65Hgq2MtE1yA59S2qmUr+qbMg6RWD4z
	/FfKx7oMhtOJMe/C5pOsOunw0SIDas7YPAxRukba7uiEKQiJUl4wfmzUqP4GuFdfeEeKqX
	Kd+s6+WBA5jV6cVpiWaM7Fa2GGZVFmZ9OnLKOfvPGk7o76Is+xIdthEEfvhJFg==
Date: Wed, 8 Jul 2026 14:38:06 +0200
MIME-Version: 1.0
Subject: Re: [PATCH v2 2/6] dt-bindings: power: Document Renesas R-Car X5H
 Module Controller
To: Geert Uytterhoeven <geert+renesas@glider.be>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
 Ulf Hansson <ulfh@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>,
 Wolfram Sang <wsa+renesas@sang-engineering.com>,
 Marek Vasut <marek.vasut+renesas@mailbox.org>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-pm@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <cover.1783505142.git.geert+renesas@glider.be>
 <1d79020a5eb2f269ea7ebb354cdfdf880049721c.1783505142.git.geert+renesas@glider.be>
Content-Language: en-US
From: Marek Vasut <marek.vasut@mailbox.org>
In-Reply-To: <1d79020a5eb2f269ea7ebb354cdfdf880049721c.1783505142.git.geert+renesas@glider.be>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-MBO-RS-ID: d9791c4cacc79975d9f
X-MBO-RS-META: owwmi4kprmaabd8g38rhbdeqr9d9i8uo
X-Rspamd-Queue-Id: 4gwX385Sw4zKw3Y
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260708_145553_213558_C1906D32 
X-CRM114-Status: UNSURE (   6.91  )
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

On 7/8/26 12:15 PM, Geert Uytterhoeven wrote:
> Document support for Renesas R-Car X5H Module Controllers, and add
> binding definitions for power domains not backed by registers.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
Reviewed-by: Marek Vasut <marek.vasut+renesas@mailbox.org>

