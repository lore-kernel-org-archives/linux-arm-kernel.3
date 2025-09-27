Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B45C7CAC5B9
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 27 Sep 2025 08:28:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:Subject:References:Cc:To:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HaBJA/9QY7OaFtysKj9cM6C9pNz3VwiYcn3b170byGM=; b=M+QBo4ZjYxTMUS7BNjlDlYzn2D
	t+e8Kip4zf114yG1WJM0h1NAGiYzM3tL3lt0BpjmfOHlHo5gUgV87M5sdLAz04+D/o5ifkOdAKCIh
	avbiltzQN2nvEetG46GMzlVHtAxEx/UfMtNklrkS6jGno9KwALm9+pY00UN5bbGKkE/My32YEQXib
	YbLuliAjT642BQZk1lFjoTg7vFOeSKZcObk1LjAjnB1IS1S4rmRE6nZUyEVP4KkpievP7pSJr1Ksm
	498T976PMEjlShPIukYjObkfpbocnIfSkWKNHEwbU1b3v0pEB9IiJ4oeGdNUpc0QoX9aieqA9q9qP
	/sE8lcog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v2QIP-00000008Joc-1QMX;
	Sat, 27 Sep 2025 08:28:45 +0000
Received: from mout.web.de ([212.227.17.12])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v2QIM-00000008Jln-12if
	for linux-arm-kernel@lists.infradead.org;
	Sat, 27 Sep 2025 08:28:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1758961715; x=1759566515; i=markus.elfring@web.de;
	bh=HaBJA/9QY7OaFtysKj9cM6C9pNz3VwiYcn3b170byGM=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:To:Cc:References:
	 Subject:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 cc:content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=kSAaaHjNmbVnX9nexMY5eKob6BK7gEHyYaoRedKVCLf0sjpc7qFL6w/5ZgMcMS+W
	 WjQ6ANH2SN9Y7OqbPjA5BCKOr7P1Q5a+Ili7DPckO8+oylKDerBjk1WSPtzHTfvdz
	 eGiI9DLy4EzUvRaNdGK6ZwRj6UAkiMZO4N/Q+2g+u/yVU92LAt3ow6zlWPV5LMImX
	 9H4NqEoQDBp15KJOAT35KZmTl85YOZA3Res+9grog8deV9GmwIfrtqNFMLptZlETf
	 2ROeHH/Su6ateAiPSNmDlz1eLQJy8oxBdLpUsPRj2WMSN70dMmcxzvDIcXGt0grc4
	 x1GVX3O3YmmNL/yEhg==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.29] ([94.31.92.221]) by smtp.web.de (mrweb105
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1MadzU-1uUkVF19cw-00odiM; Sat, 27
 Sep 2025 10:28:35 +0200
Message-ID: <541009d1-b0ab-4dc8-81bb-2dd903cd3cf9@web.de>
Date: Sat, 27 Sep 2025 10:28:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: make24@iscas.ac.cn, linux-arm-kernel@lists.infradead.org,
 linux-perf-users@vger.kernel.org
Cc: stable@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 Besar Wicaksono <bwicaksono@nvidia.com>,
 Ilkka Koskinen <ilkka@os.amperecomputing.com>,
 James Clark <james.clark@linaro.org>, Mark Rutland <mark.rutland@arm.com>,
 Robin Murphy <robin.murphy@arm.com>, Suzuki Poulouse
 <suzuki.poulose@arm.com>, =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?=
 <u.kleine-koenig@baylibre.com>, Will Deacon <will@kernel.org>
References: <20250927073013.29898-1-make24@iscas.ac.cn>
Subject: Re: [PATCH] perf: arm_cspmu: fix error handling in
 arm_cspmu_impl_unregister()
Content-Language: en-GB, de-DE
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <20250927073013.29898-1-make24@iscas.ac.cn>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:4Gs/DylM+FZ1/v30UM1kG2H8UNFCU5ynxAN+OpDeWId5zlaV17E
 JAgC2hKIYGjCLE9UmfaqejiDetTTfQiCeI/ErCZhuF91PjrtZ5ranZYPtbC4n6EAmINY/++
 GtK8Osv/wBR+fDYcYGU8j/xw8qEDeq3jb3UprkPRNsGmEf5qXjRBwwL24/8PfFomm01LZuy
 WZe5PsFApHPbEiPl3KBvA==
UI-OutboundReport: notjunk:1;M01:P0:pzAYSlBlhVU=;ZXuEhtDQ8pnivTK4X58KMl87a1t 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
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250927_012842_659421_675200A0 
X-CRM114-Status: UNSURE (   6.94  )
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

> driver_find_device() calls get_device() to increment the reference
> count once a matching device is found. device_release_driver()
> releases the driver, but it does not decrease the reference count that
> was incremented by driver_find_device(). At the end of the loop, there
> is no put_device() to balance the reference count. To avoid reference
> count leakage, add put_device() to decrease the reference count.

Can a summary phrase like =E2=80=9CPrevent reference count leaks in arm_cs=
pmu_impl_unregister()=E2=80=9D
be more appropriate?

Regards,
Markus

