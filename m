Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2647FCA6019
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  9 Oct 2026 09:41:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:Subject:References:Cc:To:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3sYDVHHKSTSGTyyaFTeBEOESh0+oH1joLrgt954MLxo=; b=mNYAGlm2GuoIQEGPYGe1BvWz82
	XO5Laj4O7jMN7aP/WoTDPKy/jJCk4qfG6AwHu1goi+mrCV0i7fivYwR/Nu+7NJOFpmCXEWM9J2Nj6
	TQmClLUIceItvQtqiuyvYlfZzVxWRFNMHIa7my9ARWjVurSZteHVxx07UJ1T866hbiOsLYKPj/SK4
	CKpiCsDHf/rQL4045cdRnS6ONNcA2oh9Ukxb8azpzAyp+Tsq1pXRRfOGqz4dNnG2RGw+je5Pg7cm3
	EiKgYjLH3O10LWWAAKrYFyP9l2NORsBXDDjy9C+8WZmBEQCswPwbcb/UVUkzl8q3Q+/SKgkiPJnNi
	pdN8/K0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xF76Y-00000005wR7-49Qy;
	Fri, 09 Oct 2026 09:41:30 +0000
Received: from mout.web.de ([212.227.17.11])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xF76V-00000005wQA-1ben
	for linux-arm-kernel@lists.infradead.org;
	Fri, 09 Oct 2026 09:41:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1791538858; x=1792143658; i=markus.elfring@web.de;
	bh=3sYDVHHKSTSGTyyaFTeBEOESh0+oH1joLrgt954MLxo=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:To:Cc:References:
	 Subject:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 cc:content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=LWaaowUnB7AOxDMsWSRAmzYHvm1ECHzS/6Dp210xPuTzWtvbL2ED2kiwX8RJrCJ0
	 WqQVjEY9SEq/rI9VY9f/BKD8ZMhzkVfILMaTyFZW1ma0+eF7StoT7rtS+QXly8CV/
	 Y3xuzduXQOv4tAXcPz7SP81uZLYONhDznn+UeTe6URvaBVo/NoLb36EHPQNCQPGXL
	 /ZeopXetE5iD6rlfN3pVoHCRt/EmmTwt58DH23qMDJNZyIXrodFEB7UFa7T33u1Ef
	 marf5FaBrbcSWRxCM9jqIt6cFeKFKni8fmfej+GmbTLxOQDJth1v3gQfrEUwQf8o9
	 CobKy2LOi9LcfPFujg==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from client.hidden.invalid by smtp.web.de (mrweb105
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1MZSBQ-1xCNHo0LTS-00W7Ko; Fri, 09
 Oct 2026 11:40:58 +0200
Message-ID: <72b28833-fa0f-461b-a30f-bc15c1b34cea@web.de>
Date: Fri, 9 Oct 2026 11:40:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Karl Mehltretter <kmehltretter@gmail.com>, linux-mmc@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, bcm-kernel-feedback-list@broadcom.com,
 Adrian Hunter <adrian.hunter@intel.com>, Al Cooper <alcooperx@gmail.com>,
 Kamal Dasu <kamal.dasu@broadcom.com>, Ulf Hansson <ulfh@kernel.org>
Cc: LKML <linux-kernel@vger.kernel.org>,
 Florian Fainelli <florian.fainelli@broadcom.com>,
 Gregor Herburger <gregor.herburger@linutronix.de>
References: <20261009003201.68288-1-kmehltretter@gmail.com>
Subject: Re: [PATCH] mmc: sdhci-brcmstb: don't log an error for missing BOOT
 registers
Content-Language: en-GB, de-DE
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <20261009003201.68288-1-kmehltretter@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:gPL9bnt2MUt/MUnsmCpjz0Glx9T8AX7s9nujmSF+CIbOodcfEMY
 8QVM4qnhuZ3teCgSnFQ7mMJGb5nWjAOgaTGJxFaq8qeQrKHw0tHgHmQkSza7wgqh6C4dNqZ
 kfkC/eecX1bf+r8jKNpE+g3MYA6zLcHKPKr4KLcKXtf3/0ZJQoC12Kpp7VLzTLRaW7Qg6DU
 5RdGt48FSj5ZYMzq/vGwA==
UI-OutboundReport: notjunk:1;M01:P0:QdGJCHcqkwE=;KTC5BYJrkLTWgx2rCBepO6Jbmyb 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 VTgC0g3b0e5wAH6U1bGMoPtN2S88nkMWW7B+Wo=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261009_024127_791664_12302473 
X-CRM114-Status: UNSURE (   6.34  )
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
> +++ b/drivers/mmc/host/sdhci-brcmstb.c
> @@ -491,6 +491,7 @@ static int sdhci_brcmstb_probe(struct platform_devic=
e *pdev)
>  	struct sdhci_brcmstb_priv *priv;
>  	u32 actual_clock_mhz;
>  	struct sdhci_host *host;
> +	struct resource *boot_res;
=E2=80=A6

I suggest to reduce the scope for this local variable because you would li=
ke to use it only
within a selected if branch.
https://elixir.bootlin.com/linux/v7.3-rc6/source/drivers/mmc/host/sdhci-br=
cmstb.c#L535-L540

Regards,
Markus

