Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91BA9FAD3F0
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 23 Apr 2026 03:02:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/5nrVUEisrdFvdhbKV6CkO0NTyBn09hOKHVIHlVzjGE=; b=FDHkz8o1o4dItF4m2TuYy/+QiQ
	PTMUTayL8FbIAeb0enqCpT4FnHYYFiTbQvRD2Y7hKpWNPkCU4fZau/34eKgMSOWyE4fX0nEhI0SYw
	7qU2IINPZCebiEUz0X3jLAwgEqlFebVrAfgy36CJJAU/1DaqkSmVqDrTpLy2sNlXsw97yTEEjnaSv
	92hJhWt03SK9Dsb1ZKzWHGg+MUsWlYEQWkuv+S7neZKeFDNDw94nHIsn5ArVIwLUX1WEZJ3Gq/kF/
	n5HsNwvl7xkit1UrNCHvs2mPbekeYvLUGyhBG2mv3KbSK9IvYf74F/74oFGh6xxG1kIRPuMXh0LQ1
	ubuPhJqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFkKq-0000000AwKM-0JpS;
	Thu, 23 Apr 2026 03:02:36 +0000
Received: from mout-p-101.mailbox.org ([80.241.56.151])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFkKn-0000000AwJA-2e1G
	for linux-arm-kernel@lists.infradead.org;
	Thu, 23 Apr 2026 03:02:34 +0000
Received: from smtp1.mailbox.org (smtp1.mailbox.org [IPv6:2001:67c:2050:b231:465::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-101.mailbox.org (Postfix) with ESMTPS id 4g1LVW4745z9tkP;
	Thu, 23 Apr 2026 05:02:27 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1776913347;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/5nrVUEisrdFvdhbKV6CkO0NTyBn09hOKHVIHlVzjGE=;
	b=DPutjH9MQYYO5ATse/UEF28ucYfgakB2kWu4c9xRmx35gIPQnQLsJeZt/Cwky43mPUl5ve
	0y4dhQRLuvY0D4BcBFQbOuRbTyZv5oQnqkRzTKZxnDxXPPzLUA3bECh8qHQTLkO+72eZqF
	bkC2rlH/vYiDCiZfNXyE/cYB1X/FKiMF47BpkXss0v66JVIpX5fMU2ToX7dTpBhhiEfEML
	lshXWUGBLNGrJe9g4ULXtMK/YMCl8gQzX+rNLxvhKdJBd3bhzEW6Yrt3cQNYoIX9w2ybTh
	/virglpGrKZO56UmDZAgafy0M77NxAqMuuEGlxcvOGjKaBr34RTUygt4hcSDAw==
Authentication-Results: outgoing_mbo_mout;
	dkim=pass header.d=mailbox.org header.s=mail20150812 header.b=FUIbgGXM;
	spf=pass (outgoing_mbo_mout: domain of marek.vasut@mailbox.org designates 2001:67c:2050:b231:465::1 as permitted sender) smtp.mailfrom=marek.vasut@mailbox.org
Message-ID: <0f933506-c196-4503-844f-2a375e2cf690@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1776913345;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/5nrVUEisrdFvdhbKV6CkO0NTyBn09hOKHVIHlVzjGE=;
	b=FUIbgGXMsv1sill9OPNXBYLB4NOUVzzMVBDSstCCOyKvP2wG7IxvSD/tIH1PcFfOiWMgO1
	pFXITu8yWV5lsIYqOuHAm7zVw8ZG55s1E0sqja+Hjdo4wYthVPQgKb2gk7mo78x9xo77z6
	11N0GZKAaQmHjjjKmKTy/pPw9R5v05XU0OpQfmD7sh+JxeWnvaAtAyMNzUsP70qa/+GD+l
	2QS4SO8nlvM+f7J0MDUr+IPPWPbzMgWTmqmAcWTCS5s9MfgRmZsH/zQrn7itA7jot11Nwi
	aXQcQJfcpvZvdCdEdGIMgIwLlK/yTgXIEliOEvUM+BUAV3g57WV5AHNiDj5YEw==
Date: Thu, 23 Apr 2026 01:33:33 +0200
MIME-Version: 1.0
Subject: Re: [PATCH v2 3/4] ARM: dts: renesas: r8a7740: Add ZT/ZTR trace clock
 on R-Mobile A1
To: Krzysztof Kozlowski <krzk@kernel.org>,
 Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: linux-arm-kernel@lists.infradead.org, Conor Dooley <conor+dt@kernel.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Magnus Damm
 <magnus.damm@gmail.com>, Michael Turquette <mturquette@baylibre.com>,
 Rob Herring <robh@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
 devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org
References: <20260415233300.457892-1-marek.vasut+renesas@mailbox.org>
 <20260415233300.457892-4-marek.vasut+renesas@mailbox.org>
 <20260421-cherubic-urban-beluga-49ee00@quoll>
Content-Language: en-US
From: Marek Vasut <marek.vasut@mailbox.org>
In-Reply-To: <20260421-cherubic-urban-beluga-49ee00@quoll>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-MBO-RS-META: 54kwxq1tnha1mex66tf4qrwip4irbwrn
X-MBO-RS-ID: e40272b9ab78651b54b
X-Rspamd-Queue-Id: 4g1LVW4745z9tkP
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260422_200233_846915_85934BA8 
X-CRM114-Status: GOOD (  12.09  )
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

On 4/21/26 10:02 AM, Krzysztof Kozlowski wrote:
> On Thu, Apr 16, 2026 at 01:31:40AM +0200, Marek Vasut wrote:
>> Add ZT trace bus and ZTR trace clock on the R-Mobile A1.
>>
>> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
>> ---
>> Cc: Conor Dooley <conor+dt@kernel.org>
>> Cc: Geert Uytterhoeven <geert+renesas@glider.be>
>> Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
>> Cc: Magnus Damm <magnus.damm@gmail.com>
>> Cc: Michael Turquette <mturquette@baylibre.com>
>> Cc: Rob Herring <robh@kernel.org>
>> Cc: Stephen Boyd <sboyd@kernel.org>
>> Cc: devicetree@vger.kernel.org
>> Cc: linux-clk@vger.kernel.org
>> Cc: linux-kernel@vger.kernel.org
>> Cc: linux-renesas-soc@vger.kernel.org
>> ---
>> V2: Add ztr/zt clock at the end of the list to match bindings
>> ---
>>   arch/arm/boot/dts/renesas/r8a7740.dtsi    | 2 +-
> 
>>   include/dt-bindings/clock/r8a7740-clock.h | 2 ++
> 
> This goes to the binding patch.
> 
> Didn't you have also a checkpatch warning?
I only got this warning, but the docs 1/4 and includes 3/4 are a 
separate patch in this series:

"
WARNING: DT binding docs and includes should be a separate patch. See: 
Documentation/devicetree/bindings/submitting-patches.rst
"

