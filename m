Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40835D2AB3F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Oct 2024 14:04:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gB3WSdXjO7v/Iei9P2xSNx89xruiqhNe99fDC+mG5Po=; b=YY4odUuxGmzl+mn1wsx36PDm7q
	dZpKzBTiRTD9l5XbtqouUdlggjx31v9f+zZdGAk+6bNcsq7V/RMwJloqT/pnso5Xs9vRIui/In15z
	GZ2NXTjodTKm93dCgxlcBH8xtp7mRdYu/81AboIC78aKPuQl5RP9Qh6aze0Jtv+D5kF0vWQKzNhTj
	AFp86kw4snkf0VIsfevm5bozU6uPbMaor4A981/BNITLh8wscAJ+eR2pKJSWGkyUVV1n4vJC/rwuf
	W08JlojahTn2ZN66NElOuElm6ObB2Bhc7ZQJ+YsEQ+qNMBdYJEj895NnprmiGCPugDu/WD1ixKCvV
	eziUgJCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t5mpo-0000000EfqB-00UN;
	Tue, 29 Oct 2024 14:04:36 +0000
Received: from relay5-d.mail.gandi.net ([217.70.183.197])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t5lfr-0000000ET8i-2AB8
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Oct 2024 12:50:58 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id B976A1C0006;
	Tue, 29 Oct 2024 12:50:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1730206211;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=gB3WSdXjO7v/Iei9P2xSNx89xruiqhNe99fDC+mG5Po=;
	b=g28+V//iv+dZW0GMwuHLqnAZLIYhrPMLE/30kYpzXbU7iSDONAE1h8nzDO1/zqxtJ2RP6/
	aFtkb9n8pfM5Sl8keTKm6+06VRwzs2MjQE59ywRQzU+P8zsG5CkGN/N1OpcHY7zhR91WfZ
	Ni0W3Frrw1x0asdiWU4VLTLkVC/fNDFhIZ4GVYXBAiu30H9KumYpIInvZaQ5fNzx4ygIoH
	eCH+gsa74e/NfromDTeQJ9mleEDF4PIoPeBtr3zrvJsUORUof8E/+IZQ/sanSp63RfN7g1
	mLpzBjNlQ9IpY21e0ABIMQ6S2IhxnwyOR8Co7II0RGjR/eraRfg36zm9ZrE5pA==
Message-ID: <1ca44f81-8c09-4745-939b-a29699fb937b@bootlin.com>
Date: Tue, 29 Oct 2024 13:50:10 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next 3/7] net: stmmac: Only update the auto-discovered
 PTP clock features
To: Maxime Chevallier <maxime.chevallier@bootlin.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Jose Abreu <joabreu@synopsys.com>, Andrew Lunn <andrew+netdev@lunn.ch>,
 davem@davemloft.net, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Richard Cochran <richardcochran@gmail.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20241029115419.1160201-1-maxime.chevallier@bootlin.com>
 <20241029115419.1160201-4-maxime.chevallier@bootlin.com>
From: =?UTF-8?Q?Alexis_Lothor=C3=A9?= <alexis.lothore@bootlin.com>
Content-Language: en-US
In-Reply-To: <20241029115419.1160201-4-maxime.chevallier@bootlin.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-GND-Sasl: alexis.lothore@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241029_055016_581640_A70C5666 
X-CRM114-Status: UNSURE (   7.37  )
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

Hello Maxime,
thanks for reviving this !

On 10/29/24 12:54, Maxime Chevallier wrote:
> Some DWMAC variants such as dwmac1000 don't support disovering the
> number of output pps and auxiliary snapshots. Allow these parameters to
> be defined in default ptp_clock_info, and let them be updated only when
> the feature discovery yielded a result.
> 
> Signed-off-by: Maxime Chevallier <maxime.chevallier@bootlin.com>

nit: s/disovering/discovering/

Thanks,
Alexis

-- 
Alexis Lothoré, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

