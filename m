Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34403CA0EFC
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 24 Aug 2025 15:54:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:References:In-Reply-To:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=N8TnPVsESid2cQ1hhF98BtD+FAEy1qWNfNCLT8zQ3XY=; b=Bbix/Nyr5xsgmqC2XGJ0UkjFvh
	ZO6Pch4fRfrOg1L7Sb5I0WFVymmdES/tDfbC13Jcs7+kQX2AWkIv08AZ3mX9SWEcYtmQ8VthooE3n
	LObOOOksloO8P38GSiScKOQqtRLsxDiIAt1CqUgufFV3rrZb8o1x+etnfrdDpvYZEehbt4EXJZzdR
	7g4BrSOvctCMEVAUs3RB5SjelytW4UP0e/yDMHr922KsGa0Mmxh9dqfz/UvC8hiEhTdMxQpNzoUC8
	HOLRhSa7HEv61GSriHBsXIWia8VzK2bW7MW2C1IuYIWE/QvjAysIzPpb9ImhuHAcWnBKwo5LVS+b/
	w0Si23qg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqD2d-00000006Jpy-42eQ;
	Sun, 24 Aug 2025 15:53:59 +0000
Received: from smtpout-04.galae.net ([185.171.202.116])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqD01-00000006Jgx-3Zou
	for linux-arm-kernel@lists.infradead.org;
	Sun, 24 Aug 2025 15:51:19 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 29DECC653ED;
	Sun, 24 Aug 2025 15:51:01 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 092EE605F1;
	Sun, 24 Aug 2025 15:51:15 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id D6C5A1C228A5B;
	Sun, 24 Aug 2025 17:50:58 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1756050674; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=N8TnPVsESid2cQ1hhF98BtD+FAEy1qWNfNCLT8zQ3XY=;
	b=xGvqGf7RUIbvnFHVKYwyDxsvhN4cpVYRJdpCk068CKtchXKw29FhSGK9ubTRudt41vNmuo
	RNeqCEwo6Jea8JbdC+CeptKrmAXbyr9tvmM4GyzAY2iLXG9t3+G5A0toPdWcRJdybjl+AJ
	FcrFjY8NolfvDVaZW2qZOwNB4fnoBdBeRwXgcKPpk3+uaS19knB1dWK8KwEI0BdAnWzkrf
	bLnlmOgQNbw704qsR9jlBfh9ytUyKUhm/fM8IQRRmSOBVO2XGQoXwpJ+Mi9VlCsGhczfTs
	HqMke15N7FYJXtvy9Ythj9ewNzLHeby+Pw2HK+7znGITVrZAAtgrKhQT3tSxlQ==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>
Cc: Mark Brown <broonie@kernel.org>,  Richard Weinberger <richard@nod.at>,
  Vignesh Raghavendra <vigneshr@ti.com>,  Lorenzo Bianconi
 <lorenzo@kernel.org>,  Ray Liu <ray.liu@airoha.com>,  Tudor Ambarus
 <tudor.ambarus@linaro.org>,  Martin Kurbanov
 <mmkurbanov@salutedevices.com>,  Takahiro Kuwano
 <Takahiro.Kuwano@infineon.com>,  Cheng Ming Lin
 <chengminglin@mxic.com.tw>,  linux-mtd@lists.infradead.org,
  linux-kernel@vger.kernel.org,  linux-arm-kernel@lists.infradead.org,
  linux-spi@vger.kernel.org
Subject: Re: [PATCH RESEND v2 4/4] spi: spi-airoha-snfi: return an error for
 continuous mode dirmap creation cases
In-Reply-To: <e8f77b06-b47c-456e-8671-ac8ae573af64@iopsys.eu> (Mikhail
	Kshevetskiy's message of "Thu, 14 Aug 2025 18:33:25 +0300")
References: <20250814065423.3980305-1-mikhail.kshevetskiy@iopsys.eu>
	<20250814065423.3980305-5-mikhail.kshevetskiy@iopsys.eu>
	<78542bbe-1def-4aca-8424-cc26542d9762@sirena.org.uk>
	<e8f77b06-b47c-456e-8671-ac8ae573af64@iopsys.eu>
User-Agent: mu4e 1.12.7; emacs 30.1
Date: Sun, 24 Aug 2025 17:50:56 +0200
Message-ID: <87o6s4k9b3.fsf@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250824_085118_065363_E5BFEDBD 
X-CRM114-Status: GOOD (  10.25  )
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

On 14/08/2025 at 18:33:25 +03, Mikhail Kshevetskiy <mikhail.kshevetskiy@iop=
sys.eu> wrote:

> On 14.08.2025 18:29, Mark Brown wrote:
>> On Thu, Aug 14, 2025 at 09:54:23AM +0300, Mikhail Kshevetskiy wrote:
>>> This driver can accelerate single page operations only, thus
>>> continuous reading mode should not be used.
>>>
>>> Continuous reading will use sizes up to the size of one erase block.
>>> This size is much larger than the size of single flash page. Use this
>>> difference to identify continuous reading and return an error.
>> This seems like it just applies anyway regardless of the rest of the
>> series?
>
> Could you provide a link? I do not see this in upstream linux repo.

No link, Mark can apply this without the rest of the series it seems. If
that's the case, it's best to send two series because these patches
apply to different trees.

Thanks,
Miqu=C3=A8l

