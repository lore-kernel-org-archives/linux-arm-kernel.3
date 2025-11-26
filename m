Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 430C4D1037B
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 26 Nov 2025 10:37:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:Subject:References:Cc:To:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kX4Y8HYcQl/E1hu3IOBIHvhCP+cNX5WgkX1ugsIckrc=; b=jvqVWFhdeJAClw0t8KmyuF0/tH
	6zh8vXCyrwExa6vVKA3LdsqnSC9IEriXWx485bPz2JGDkqHOAaUwdsmeP3kMk9QwtrBkHCkN018YV
	NM0NvwYGfWxkLZjAM6KYbQwUfEeyKp8wc9+12V/IuTDInIn6fy4vRcfNNJeHd2DLbnRZ+zllwgzsG
	vDf5Q+m4N5RhK26JzIen3bOFEDi7I4PQgkT0Mahf3b+FSUPaKkiLucH81mcslFGor5ea/uffImfgX
	MTrOtmpHqN44MDFRwovfX8yQQctyh7TsVGPZ0Wtg6EXRLZRK3yyFAhcl2HqoK0YQL3rXi7LcgcMfu
	c0oUnxtw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOCtr-0000000Eod3-2KyR;
	Wed, 26 Nov 2025 10:37:27 +0000
Received: from mout.web.de ([212.227.15.14])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOCto-0000000EoRs-0I8E
	for linux-arm-kernel@lists.infradead.org;
	Wed, 26 Nov 2025 10:37:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1764153283; x=1764758083; i=markus.elfring@web.de;
	bh=kX4Y8HYcQl/E1hu3IOBIHvhCP+cNX5WgkX1ugsIckrc=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:To:Cc:References:
	 Subject:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 cc:content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=HZQkCLFsc/MamjsV4xCoxwHj6fVFtdIia63kssnVoSUTMwWZZy7ewL/giKnGOpf0
	 Uplr6qn4sSBSSTy+PX8BySwLDXZAvqYCNUiYPbWZwXblnCt3IG0EyC5RXz8u3RSgt
	 Yfy+Kh2S8LBz9SHFJOKjgHqPRLLCZyL0ePdCIgMKAK5ij/AQZrLwlcDCMhWdWYPW1
	 edvuiVEiao3byTV4wl0wegcigU6XWMzxF0oaJzTVuHlRjLtvTUQv7hNbD91aKFe30
	 ldKOmf4YQGdHso/vdOG916tLqb35zf9SlSo4z9igL1PAXgxoGCtDqUZc6acD2GG7Q
	 vyrvrL8Y6O33IF302Q==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.29] ([94.31.92.222]) by smtp.web.de (mrweb006
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1MjxiW-1vqi3n2d4a-00jFc9; Wed, 26
 Nov 2025 11:34:43 +0100
Message-ID: <25f4192a-f518-4b26-9757-e23585177dbf@web.de>
Date: Wed, 26 Nov 2025 11:34:33 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: vulab@iscas.ac.cn, linux-arm-kernel@lists.infradead.org
Cc: LKML <linux-kernel@vger.kernel.org>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 Michal Simek <michal.simek@amd.com>, Thomas Gleixner <tglx@linutronix.de>
References: <20251126074559.1709-1-vulab@iscas.ac.cn>
Subject: Re: [PATCH] clocksource: timer-cadence-ttc: Fix resource leaks in
 error paths
Content-Language: en-GB, de-DE
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <20251126074559.1709-1-vulab@iscas.ac.cn>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:GilTOGLfdymHuGp/vNnZX7WCvF4ohigzk/M1S2+YfeYm4rwUnEV
 v1ep7jHvAi+yKP5HndGus4ad6h+1fkAlFIC/N44pQP+hI+qMDkCEod2u6ky/HCsNV7PTOzg
 +d5/bw1OIAoev9m7cc0A60SQwzb+jvKoCJRFww6SYH87I/K+a0xFKlcM99m+nxgr3oF6kQ6
 EdcWnt9XAr0xD7R7HTPCg==
UI-OutboundReport: notjunk:1;M01:P0:QI/UiE9GZxQ=;Q/t7cCH6q5hzIuZ65PA/1MdIK99 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 2fjz07QtQdtICB5akL8/ny3/xpcnd/EApuSioZ
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251126_023724_485160_C7377A48 
X-CRM114-Status: GOOD (  10.48  )
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

> The ttc_setup_clocksource() and ttc_setup_clockevent() fail to
> unregister the clock notifier in their error paths, potentially
> leading to a resource leak. Additionally, ttc_setup_clocksource()
> leaks the prepared clock reference upon failure.
=E2=80=A6

You may occasionally put more than 65 characters into text lines
of such a change description.
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Do=
cumentation/process/submitting-patches.rst?h=3Dv6.18-rc7#n658


=E2=80=A6
> +++ b/drivers/clocksource/timer-cadence-ttc.c
=E2=80=A6
> @@ -377,6 +380,10 @@ static int __init ttc_setup_clocksource(struct clk =
*clk, void __iomem *base,
> =20
>  	err =3D clocksource_register_hz(&ttccs->cs, ttccs->ttc.freq / PRESCALE=
);
>  	if (err) {
> +		if (notifier_registered)
> +			clk_notifier_unregister(ttccs->ttc.clk,
> +					&ttccs->ttc.clk_rate_change_nb);
> +		clk_disable_unprepare(ttccs->ttc.clk);
>  		kfree(ttccs);
>  		return err;
>  	}

How do you think about to avoid repeated kfree() calls in such a function =
implementation?


> @@ -465,13 +472,16 @@ static int __init ttc_setup_clockevent(struct clk =
*clk,
=E2=80=A6
> +out_clk_notifier_unregister:
> +	clk_notifier_unregister(ttcce->ttc.clk,
> +			&ttcce->ttc.clk_rate_change_nb);
=E2=80=A6

You may specify this function call in a single line.

Regards,
Markus

