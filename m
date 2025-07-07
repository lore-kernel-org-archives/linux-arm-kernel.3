Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D6ADC71130
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  7 Jul 2025 20:36:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MH6AW7DZ/+6oxcmK2lbp/E4s2yvinxh6tDS7lCW48ZU=; b=ZvV/FQxVeSHLShPU666UnEqjjK
	n3322MieBXQuRqEoYmTBQ8TzqXPGQfCY7JTpLZxsfkF2td9ktV1TdE3ZgxFV7ThbTOggMCfN/Xjnl
	/NCXRpwmlM/sWUt2Wx7qwszJditLFRsONOJv87mvFH1+mmF/y9or/M0kWDctL3xyQVj5Yo7lQRcsh
	x2KJiKm/2CGHjLjwhGnRYK2VRM3oqnzF0BNBWg5aLrR8lqapVjT2JRGDhHjCGsarr2Mo0LcJcIQuu
	UbpwAXGe5GLbGJkJrcOFA8qKpAr0st52WUnypSzA2SzWYNkLRu8mnU3FlOU4zoPhO/H4/06xkuMPn
	2r2NzNSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYsZL-00000003XyH-3Ywt;
	Mon, 07 Jul 2025 20:36:07 +0000
Received: from 004.mia.mailroute.net ([199.89.3.7])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYsIO-00000003VyT-3Gdk
	for linux-arm-kernel@lists.infradead.org;
	Mon, 07 Jul 2025 20:18:37 +0000
Received: from localhost (localhost [127.0.0.1])
	by 004.mia.mailroute.net (Postfix) with ESMTP id 4bbbCv3q9Hzm0yt2;
	Mon,  7 Jul 2025 20:18:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=acm.org; h=
	content-transfer-encoding:content-type:content-type:in-reply-to
	:from:from:content-language:references:subject:subject
	:user-agent:mime-version:date:date:message-id:received:received;
	 s=mr01; t=1751919513; x=1754511514; bh=MH6AW7DZ/+6oxcmK2lbp/E4s
	2yvinxh6tDS7lCW48ZU=; b=jSR1FrsCl2VS0dFJCuOShZLpG0WDsBAU0/hDbzeA
	l39wESHmTAQftBnRGuphZAqsS/E2PJ1fbQ9oLv378acS3Ffph5wYOsCY0Smes2rY
	BA1hahqSW6U0U1AIBSXluY6UQzf/ROej8ZP9GQux8jacZ2jGAVN/KsNrrsgQlq5Y
	+vYkUfutjXKJ8DS/81QIcoOKKkatBJgIyVuL6COuUZSGaD52LPP+Vs20eN8Foihv
	cvBJZhpBm2+hKEvpIFIsgmGYzOffRQRjpDTWQEh7ingXuV+1yDOUGGj+BBfNup7s
	4g0jFstuvU87VKPYT15PWWxdgsgurgH20P58Iga1mtwwbQ==
X-Virus-Scanned: by MailRoute
Received: from 004.mia.mailroute.net ([127.0.0.1])
 by localhost (004.mia [127.0.0.1]) (mroute_mailscanner, port 10029) with LMTP
 id RmX8vjQgZHsO; Mon,  7 Jul 2025 20:18:33 +0000 (UTC)
Received: from [100.66.154.22] (unknown [104.135.204.82])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: bvanassche@acm.org)
	by 004.mia.mailroute.net (Postfix) with ESMTPSA id 4bbbCl74C8zm0yVD;
	Mon,  7 Jul 2025 20:18:27 +0000 (UTC)
Message-ID: <bac5f533-0513-4d59-98b8-de44a08daef3@acm.org>
Date: Mon, 7 Jul 2025 13:18:26 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] scsi: ufs: exynos: call phy_notify_pmstate() from hibern8
 callbacks
To: Peter Griffin <peter.griffin@linaro.org>,
 Alim Akhtar <alim.akhtar@samsung.com>,
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
 "Martin K. Petersen" <martin.petersen@oracle.com>,
 Krzysztof Kozlowski <krzk@kernel.org>
Cc: linux-scsi@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20250703-ufs-exynos-phy_notify_pmstate-v1-1-49446d7852d1@linaro.org>
Content-Language: en-US
From: Bart Van Assche <bvanassche@acm.org>
In-Reply-To: <20250703-ufs-exynos-phy_notify_pmstate-v1-1-49446d7852d1@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250707_131836_900326_61AA70A7 
X-CRM114-Status: UNSURE (   7.13  )
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

On 7/3/25 7:07 AM, Peter Griffin wrote:
> Notify the ufs phy of the hibern8 link state so that it can program the
> appropriate values.
Reviewed-by: Bart Van Assche <bvanassche@acm.org>

