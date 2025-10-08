Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 839F2CCA470
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  8 Oct 2025 14:20:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=b42xDXhO49h19EC9DNZkSXucWC1hQOgZ114Q6ATMM8Y=; b=xAagfcpNsi22DhvXyDm13EMjs8
	S1qCvnxTvagTejyDE3aMvsJUkm5mTdJU+ccRGRCT88TVhWQDflEPJ7HlQFLGZ/Zxjsr3R7eAc9s0b
	yLFCgy07mXcImpsWKCy21eEtX4KK87sVw6776xEqRro+pRP2aDgOYR26hi4HT/w8wE7Znu1hONXuv
	Rkt7UadOW+60nUv/5EW7KQYbhZxYMJ4vetm4w6ZfAUhVapQPwPQ1MAP7yMOxwlFusXAanFZKBr1Sd
	8/0mIdvJ05iOz2IWF1O6MIxkwbylFkKjavCzVaS2UbIv2znoQ7E4xsGFUdBrBUG0O+wCaHQHb55Ui
	h9A7p71w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6V21-000000041qH-0drH;
	Wed, 08 Oct 2025 14:20:41 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6V20-000000041q8-10d0
	for linux-arm-kernel@lists.infradead.org;
	Wed, 08 Oct 2025 14:20:40 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 99CBE6026D;
	Wed,  8 Oct 2025 14:20:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AD753C4CEE7;
	Wed,  8 Oct 2025 14:20:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1759933239;
	bh=DXLUJwIFDqo9yxA809XtAiU05h5zv726Jm63srA1HqM=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=sr2HY6nP+YY825+Af6T62I0LEEsgtfcpYEQzMKp+63xt/Et8VIkg5MLMrvDXOK059
	 L0F3U5GiTCsUYcH8wvyTH8JINufV0omW68WAsGedvOsnGio87ZM79i1f3+74EiYn7+
	 8wb/76ku57LJzKSDXB6JxqQTdpB12Us2iU6ektinAsJpzKYBqsULugyCBpop3FoWzI
	 OXhividQD/YC44OtznP6d7ZFUEzyZWj0xYP9TdCyxOUbAmsErqrkomuS/V0BzazfBI
	 EiutAu+evxc8HpF9NaTW4MYJC0m0ZAEjdyrdoQFf9gYAE/WaT9DZynxeEXPpOycfI/
	 Y7dfut7eSbZXA==
Message-ID: <0fa63b77-f912-48de-b67f-6df3acccea61@kernel.org>
Date: Wed, 8 Oct 2025 16:20:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RESEND] mfd/macsmc: make SMC write buffers const
To: Atharva Tiwari <atharvatiwarilinuxdev@gmail.com>
Cc: Janne Grunau <j@jannau.net>, Neal Gompa <neal@gompa.dev>,
 Lee Jones <lee@kernel.org>, asahi@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20251007130510.1653-1-atharvatiwarilinuxdev@gmail.com>
Content-Language: en-US
From: Sven Peter <sven@kernel.org>
In-Reply-To: <20251007130510.1653-1-atharvatiwarilinuxdev@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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

On 07.10.25 15:05, Atharva Tiwari wrote:
> Mark the write buffer arguments in apple_smc_write(), apple_smc_rw(),
> and apple_smc_write_atomic() as const. These functions do not modify
> the data provided by the caller, so the parameters should be const
> qualified.
> 
> Signed-off-by: Atharva Tiwari <atharvatiwarilinuxdev@gmail.com>
> ---

Reviewed-by: Sven Peter <sven@kernel.org>


Thanks,


Sven



