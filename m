Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F005CCD193
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 23 Oct 2025 08:30:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=r9GcjNdKx0l5qe7F9q2vo9g6zEhRHjHM5Fp6gH11pEQ=; b=rWbtKs3KyJSWXOtOBUbSNC8e2g
	xxspPK5amnmyUmssHxhxaepTpL0oLnt/n8p61OTLUb/l/bzV3Fy+CzFIOAhnh9p08ka5jtJ8DEKeQ
	RciR6z7UeL9ESfNV3oV8AueJgEjTWEPKUGngjS1HQWtzhcGkGMBDbtcFgPjF5uOiSAHxloY6TEcpd
	oa9YDKOz8fLz7DrUMWE+Dbs8qJGB197k3s9WvP9qCxmsY5Y8CKZT2DVABh2jbZ+uVQUXGUjOwf4va
	/uWL+77c3cbLcO6JPbz3T0d5lShdnIybFYA9xYA2S6YorMj2b3F9hb/B88EWAUgjQTNNUAMhxP/b2
	yXdrNmkg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBqho-00000005YXP-1hsF;
	Thu, 23 Oct 2025 08:29:56 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBqhl-00000005YV2-1IGF
	for linux-arm-kernel@lists.infradead.org;
	Thu, 23 Oct 2025 08:29:55 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 2BD464E41298;
	Thu, 23 Oct 2025 08:29:51 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id F3BE86062C;
	Thu, 23 Oct 2025 08:29:50 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id BA200102F245F;
	Thu, 23 Oct 2025 10:29:28 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1761208190; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=r9GcjNdKx0l5qe7F9q2vo9g6zEhRHjHM5Fp6gH11pEQ=;
	b=Z9EtBMWuXLdFsMpNL5Is/fGSdVkHMoU8On73jz/5/ppGCGeFA/s+BGs5fNBndHP/oE871A
	Kwf77bbihCJTwF2SHIIloFW/npmFuSEW9T1aNCmWFlVk2urveiGjvVxKBzjOcUb1FuPTjc
	N1UZY1+fzrl69/hREa0jTum9igth/ny1umb8LP1B7v+4PWW18Pc8iVnihuAgBElu6Zckg7
	ZpqK34HeP6g3pp37DftoKuVKZpL/yre5EvwGMsncIEtc8X6Q9BvAHc+tTTVlK7g3aJqFTy
	SL91odbrCbiLSoeyIKOUWZKhCaCe0ibxcolKfL2yT5j0H6Q1Gqr/UAJmto0eBA==
Message-ID: <ac505a82-1a01-4c1d-8f9b-826133a07ecf@bootlin.com>
Date: Thu, 23 Oct 2025 10:29:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next 2/3] net: stmmac: Allow supporting coarse
 adjustment mode
To: Jakub Kicinski <kuba@kernel.org>
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Jose Abreu <joabreu@synopsys.com>, Andrew Lunn <andrew+netdev@lunn.ch>,
 davem@davemloft.net, Eric Dumazet <edumazet@google.com>,
 Paolo Abeni <pabeni@redhat.com>, Maxime Coquelin
 <mcoquelin.stm32@gmail.com>, Richard Cochran <richardcochran@gmail.com>,
 Russell King <linux@armlinux.org.uk>,
 =?UTF-8?Q?K=C3=B6ry_Maincent?= <kory.maincent@bootlin.com>,
 =?UTF-8?Q?Alexis_Lothor=C3=A9?= <alexis.lothore@bootlin.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20251015102725.1297985-1-maxime.chevallier@bootlin.com>
 <20251015102725.1297985-3-maxime.chevallier@bootlin.com>
 <20251017182358.42f76387@kernel.org>
 <d40cbc17-22fa-4829-8eb0-e9fd26fc54b1@bootlin.com>
 <20251020180309.5e283d90@kernel.org>
 <911372f3-d941-44a8-bec2-dcc1c14d53dd@bootlin.com>
 <20251021160221.4021a302@kernel.org>
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
Content-Language: en-US
In-Reply-To: <20251021160221.4021a302@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251023_012953_482347_057415D5 
X-CRM114-Status: GOOD (  10.52  )
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



On 22/10/2025 01:02, Jakub Kicinski wrote:
> On Tue, 21 Oct 2025 10:02:01 +0200 Maxime Chevallier wrote:
>> Let me know if you need more clarifications on this
> 
> The explanation was excellent, thank you. I wonder why it's designed
> in such an odd way, instead of just having current_time with some
> extra/fractional bits not visible in the timestamp. Sigh.
> 
> In any case, I don't feel strongly but it definitely seems to me like
> the crucial distinction here is not the precision of the timestamp but
> whether the user intends to dial the frequency.

Yes indeed. I don't have a clear view on wether this is something unique
to stmmac or if this is common enough to justify using the tsconfig API.

As we discuss this, I would tend to think devlink is the way, as this
all boils down to how this particular HW works. Moreover, if we use a
dedicated hwprov qualifier, where do we make it sit in the current
hierarchy (precise > approx) that's used for the TS source selection ?

Maxime

