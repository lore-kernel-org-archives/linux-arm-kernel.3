Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2AAA4C3600B
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 31 Mar 2025 14:34:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:Subject:References:Cc:To:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kmL1aTrcUP4VY6+49eYnRNE3JyhMXnff7+AEBg2a+RI=; b=atQhueqx0w+dps55WWP/HPdpJA
	iM4yLqZq3e0eqHqXYdjiUdtRGnuuAtYmtg53I1yNOqabiq+afDhlAAxltser0DG5nbrLooLlaYUcv
	nGHTBfqLG7mC3x8+7L6FvnTPKBYbPxyjkgaEZ6MyZR0bAhU2n9GE/f6WNll0Ho+Yd6a0LZgHh17k9
	r+FEx0QYIC7Ov5LUpD26mJs0XX+Uu2CJJ2pvalHyxoC9DDhE7pdhsJnLDb2/ZIEfx3CNL6B1SAOUY
	j5GPjtd2+Eec1kpwGVG0xXgiR2E0hJrvN1deVGDvZSpjOHU0r5KzxBdB9LxHDbXsuMBa6uw7WJCHO
	aQ3kgFwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzGDr-00000000ZXh-1RRr;
	Mon, 31 Mar 2025 14:34:43 +0000
Received: from mout.web.de ([217.72.192.78])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzGBs-00000000Yzv-2LIr
	for linux-arm-kernel@lists.infradead.org;
	Mon, 31 Mar 2025 14:32:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1743431558; x=1744036358; i=markus.elfring@web.de;
	bh=kmL1aTrcUP4VY6+49eYnRNE3JyhMXnff7+AEBg2a+RI=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:To:Cc:References:
	 Subject:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 cc:content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=Kd/sGtmyD8kTKpIW3WzIjIdBMIHdTObJ3sqJCTLJBL0GSYEungAl9W/tZ0J3dMxX
	 cpIqJfqZIrW9zrFwMuHbHI5TBnufBWkb6P6XGbF8td4s5IwHLnHVW1UyJCklhwQx4
	 MYrwxb6S1CBQUz6E+5Ll7HHntclipqUBksZEBOIvIpnr3SpF0u2I3JBXR6dG/hRs7
	 xvriqqFR4U2sZO5hx2EmC39htThvYNPHWdRKf5eJUBkqTKeCs1YzxBul/a4nvZV6K
	 g+lfdoMbCC69A3ke3EO6igLJsM/mLS0dEY2alPWNaAyoWYQ722ubZsNqCbUraf4Eg
	 5z15ASAojz0yDae4pQ==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.29] ([94.31.70.37]) by smtp.web.de (mrweb105
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1MMGuC-1tiH2J3X3W-00ZBYp; Mon, 31
 Mar 2025 16:32:37 +0200
Message-ID: <e617d125-0d04-4f18-9fa4-b0e97564fa85@web.de>
Date: Mon, 31 Mar 2025 16:32:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Henry Martin <bsdhenrymartin@gmail.com>,
 linux-perf-users@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: LKML <linux-kernel@vger.kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Will Deacon <will@kernel.org>
References: <20250331135128.11881-1-bsdhenrymartin@gmail.com>
Subject: Re: [PATCH v2] driver: tx2: Add NULL check in tx2_uncore_pmu_register
Content-Language: en-GB
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <20250331135128.11881-1-bsdhenrymartin@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:RIwaUdmew4oY6QVCfkGAwrwsIvc3EyKLbs8QWQDs64QFvYQgi0j
 VsetIy5YxsigMMlj1J+cdl/fyPaNZjjCnC9IH/h33YvfEKr+Ltc1kySDnAsBDtSVb2XfPCj
 v5yNqs+vPVNUnVsZCoS2h7k9nik34SpwCHhJDx3pNC6XJjFxTtgDaUhNEHu8tpfvUL+ZLGG
 TEBPJ85UpFw571ksfcxEQ==
UI-OutboundReport: notjunk:1;M01:P0:lSFbWzsONxM=;K5cU8rRZmLMrSKm+7oq+u3EqgHx
 BKM3RFzHRM3EuCPzlUsxEnUmFqSqsW3CBS7hu5zf3wSqo3bTIcmMvfiikHK41dkD2m9GFO9n/
 iTzHl/kCGjGppCtpW7CWqNAAxkcR8hI15250pp41GAUzLdSKUVtBli4Bu6AYVJAPEDst6XLmI
 pMP7ekoLuDMDl610x5CeHyZ/kMWeHxEkr2cxZXulo6ArzfLJuElRwl6JfO52S7mJQbKXWsmVd
 0AjmsjaYOhvBAIsRGThHmlQccxZ2wRWK6PBpwnHEm042f0dpzDpbBsD+UdXjfUF3B+C8KlpUK
 aVr5um36YNoqaCjLGn9mjkYoH728pNaRBMjo+x13lmEuum9l5LS708VD5jA3MLwhiJWOOO2ec
 7uRnV9aWymVHyTPbr8JQUIFnDhL+oox5UHmSfsYXlMiA9xRk4GuDPW6Eu6axxVU/KpEcUSjVv
 yEM1Wr8v+XJKNDAUNXig+alHxrb01QPM954hQopn9s8Nqn48cBZbBTEhQ4OAhLTKQHBhKc0aO
 nv9rB/2DQsdpsU7pS87WDUbDblAbTqSiM5hbP88zsDbeVqrTMtkou/AANBeNFxru39gSgLqgp
 7Q6dEi74yoMMzYrrLlzfYwgFZbsLSQInkSPqUZY176qd3DVMHnH99hCHH4On6d7J1U3voooun
 sVrBhd94OeIh5h+wPLEJIaH7b0BZFzg9LzqBjoxXwNcQHGZEdSqZpWdv3atioZZi5CqHire4i
 aCfsvdJxJrVFFU1mSStnCA5NJCBvVYIeJi2F7GKrlxm+AOXT5ZyVjz+CibriG9mBptsSmXjKm
 f/vi7nV4oxRkozkHixV/oRvdNG1X9ZlxXYKSGTTIfVEacb+BBz7gjI/cMh9W2QC6O7nHB03V1
 yb/9chPMbFlTcEDdmfOdxiWVapX2c/qV17kdypLVqz6LEZNG1AcQooZ19o2k1/K2OUZXBWXVH
 OOaHEJHhuGRB3WBB4xmu7fXArD6FLVg4DhXs1v8/LRB8LYddgGJbMIxIaTdPZ2O5SElBEXmvK
 lpq4pe+21M4rT2vgAhhESqqvI1dJIdnJ3mSzWAW+5Bm3YdNF4J00mUy1/lLwZXdpea9tP4KBk
 2quLN03ysmKE4bWyrObIHP5dlQ3PPLrsjqMek0YFTw/haqBwfiooTSivzKH9XKmpz00XkJCdN
 tr5LNWy4yOzvZrwDV+qBW2J73CulIeaLSR41vs6OigHT9BkWihlRZjC3/2KIJWJLd4GMM2h+j
 yh679ynpMvyjBv3UmAEHXf4ANymCY06FjWboxoQ3CLDVhhGVRNbsl1pBF5s3uE8M5IN4AIlyF
 txSmtWO96a3QeDhl15ygu8shvcizKMHLKKqCsLdJDLtcSNcTjfSgc8RnBzk0UalywltDwPT5P
 Qa0QP4/ma7YrKZ6DKfE6mUYJSe0e+PX5QLR8kWF0xQDnO3ueCOQ/Tv3H6A1ep3/2CTXuCoFou
 6J2GYngl4vUuMWru5gW99bUy3rBc6A1sr3rccZ2xDCbLu6nvGGIDkc9iIIZOMlcyjVv9Erg==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250331_073240_988357_F52A601D 
X-CRM114-Status: UNSURE (   6.92  )
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

=E2=80=A6
> +++ b/drivers/perf/thunderx2_pmu.c
> @@ -738,7 +738,8 @@ static int tx2_uncore_pmu_register(
>
>  	tx2_pmu->pmu.name =3D devm_kasprintf(dev, GFP_KERNEL,
>  			"%s", name);
> -
> +	if (!tx2_pmu->pmu.name)
> +		return -ENOMEM;
>  	return perf_pmu_register(&tx2_pmu->pmu, tx2_pmu->pmu.name, -1);
>  }
=E2=80=A6

Should source code analysis approaches take further implementation details
better into account?

Example:
perf_pmu_register()
https://elixir.bootlin.com/linux/v6.14-rc6/source/kernel/events/core.c#L11=
859-L11862
=E2=80=A6
	if (WARN_ONCE(!name, "Can not register anonymous pmu.\n")) {
		ret =3D -EINVAL;
=E2=80=A6


Regards,
Markus

