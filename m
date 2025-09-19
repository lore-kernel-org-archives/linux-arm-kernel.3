Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1CA48CAC59A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 19 Sep 2025 21:31:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:Content-Type:
	Content-Transfer-Encoding:In-Reply-To:From:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+STulwrmmd/a02dJorxWTifa22lKeFoCcq1z9zgYcYk=; b=MzdBc8+it0pw04hf/Rl7ff0QDt
	FGfTmk87Ojbh2lilJuHyr04ICGYVUdocva6g5DERt/emuXijsd5GP/c965g+vvx8Xm3RAVnVSej0p
	6kimYVpsZz+qNHdQDRuuYP4TVcx7PwkLyQJ8u2fZ6piyRn3KsXjXte8Sh9JkrJJ3Km2fWGxKXpPke
	gYB6xinVUFtNdzzV82tltQr/6Pb1l0MM2jepkF8BP2hNstHnL0S09cS6HdjEu9I/WdlmLBHpOkDut
	60GaN6NVYroweMudQEH+UA8O+9DIyEwbZNfgnka2qm4dmQHI2ieITZ2rMcVhg4geCAkHFX8e8uUQ4
	//HHni9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzihb-000000045nI-3gwD;
	Fri, 19 Sep 2025 21:31:35 +0000
Received: from mailout2.w1.samsung.com ([210.118.77.12])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzihY-000000045mq-3Jzf
	for linux-arm-kernel@lists.infradead.org;
	Fri, 19 Sep 2025 21:31:34 +0000
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
	by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id 20250919213127euoutp022f5847e8ea07d3c68612bd4669609ad0~mzHBY9-0r0543805438euoutp02K
	for <linux-arm-kernel@lists.infradead.org>; Fri, 19 Sep 2025 21:31:27 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com 20250919213127euoutp022f5847e8ea07d3c68612bd4669609ad0~mzHBY9-0r0543805438euoutp02K
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1758317487;
	bh=+STulwrmmd/a02dJorxWTifa22lKeFoCcq1z9zgYcYk=;
	h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
	b=VH8EUVUjfnAlG7FLTyq4QOSc+IRmEuJl++0eR4hg2IGBhY3n+S+jckvdRf94Pb4F/
	 KVc2wlS+nbKFAxMeBWCBeyIOoTTOqjequ0GGU/ERkDm2A8vDkE9tDCwCs3EPIiH9JX
	 Kah2OOM+wkJpIDY/TCblxn7aprcr5JqtnkrNQfEU=
Received: from eusmtip2.samsung.com (unknown [203.254.199.222]) by
	eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
	20250919213126eucas1p29bc2ab799cf2891457f4ff3353e96116~mzHAcqcd42589425894eucas1p2x;
	Fri, 19 Sep 2025 21:31:26 +0000 (GMT)
Received: from [106.210.134.192] (unknown [106.210.134.192]) by
	eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20250919213125eusmtip236748a339fe3a7ae4476be93fbd606b9~mzG-ijm9H1195011950eusmtip20;
	Fri, 19 Sep 2025 21:31:25 +0000 (GMT)
Message-ID: <d27df41d-58ba-41e8-9275-2e9991f574a0@samsung.com>
Date: Fri, 19 Sep 2025 23:31:25 +0200
MIME-Version: 1.0
User-Agent: Betterbird (Windows)
Subject: Re: [PATCH] clocksource/drivers/exynos_mct: Use percpu interrupts
 only on ARM64
To: Krzysztof Kozlowski <krzk@kernel.org>,
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
	Daniel Lezcano <daniel.lezcano@linaro.org>
Cc: Thomas Gleixner <tglx@linutronix.de>, Alim Akhtar
	<alim.akhtar@samsung.com>, Ingo Molnar <mingo@kernel.org>, Peter Griffin
	<peter.griffin@linaro.org>, Youngmin Nam <youngmin.nam@samsung.com>
Content-Language: en-US
From: Marek Szyprowski <m.szyprowski@samsung.com>
In-Reply-To: <8fb4534e-ffb0-40ad-8256-b0fa040a1b97@kernel.org>
Content-Transfer-Encoding: 7bit
X-CMS-MailID: 20250919213126eucas1p29bc2ab799cf2891457f4ff3353e96116
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20250827102650eucas1p1fe270adbf29c649b9ce529e1d45aabc3
X-EPHeader: CA
X-CMS-RootMailID: 20250827102650eucas1p1fe270adbf29c649b9ce529e1d45aabc3
References: <CGME20250827102650eucas1p1fe270adbf29c649b9ce529e1d45aabc3@eucas1p1.samsung.com>
	<20250827102645.1964659-1-m.szyprowski@samsung.com>
	<8fb4534e-ffb0-40ad-8256-b0fa040a1b97@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250919_143133_289944_D8ACE034 
X-CRM114-Status: GOOD (  10.28  )
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

On 27.08.2025 13:58, Krzysztof Kozlowski wrote:
> On 27/08/2025 12:26, Marek Szyprowski wrote:
>> For some unknown reasons forcing percpu interrupts for local timers
>> breaks CPU hotplug for 'little' cores on legacy ARM 32bit Exynos based
>> machines (for example Exynos5422-based Odroid-XU3/XU4 boards). Use percpu
>> flag only when driver is compiled for newer ARM64 architecture.
>>
>> Fixes: f3cec54ee3bf ("clocksource/drivers/exynos_mct: Set local timer interrupts as percpu")
>
> I am pretty sure the patch above was not tested on arm32, thus this
> workaround seems reasonable.
>
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Daniel, any chance to get this merged?

Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland


