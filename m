Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3504CA0EE4
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 17 Aug 2025 10:50:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BMnCO2zM9NxeIYDXCHfCP7qlydNItbG2D6dOsV08UvU=; b=q9waUZHKQVQGO32WjWEGdhKYWZ
	DeD2sGw4Ke6LUeC1XzRGUTP8v8a5Q9zF/O4C4kbLa2z7+EkY4HBFdDZj4lnz/jqVT0+u5KoL/6xeT
	A/9L0cYrao+K9dBLliAmxlj2gvltJOXO6uadZPum40OHd0TC7y2BGcZsKUbrKNP81/Z5znDJcYd2T
	y6EDzNsxxOjAyFp1NCcTOpfVuS4Kb45dNCr1zkvDY1BcCj+tzO60mavcqIE4wxB1zX8V44ll4Si0B
	fYAwDevWEU6R2brh/NsuPoF2N7jeWDBcRdrTBNVExPmdLnWrODbgn0RIVzv4Twq5AXZsGq0lWFqbo
	+xmM1VhA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1unaxf-00000005ZHx-2ROk;
	Sun, 17 Aug 2025 10:50:03 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1unav6-00000005Z9K-2kDg;
	Sun, 17 Aug 2025 10:47:24 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id A855D60008;
	Sun, 17 Aug 2025 10:47:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C62A2C4CEEB;
	Sun, 17 Aug 2025 10:47:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755427643;
	bh=I2ib/OXqX53rEewSl2SArXNdOrcnURD5+ssUMeP5k4A=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=QjGM9q7nSJXUG+plAyBKPeCiYay+NFV+chGfJaCtilblGRo03kdUHr9qFNgkc8iJ6
	 anqblR9hInENq7Uuu4qRNQA83z0iPv7ADUCW881ts/mqQ3AWZnPkmRhvD4u210QSfj
	 MJJixD0mqvqXagcHSxfcKfpAUScJjRMNHEcqLG+Huji6tOSzinqkYWjVeqifGk5z7/
	 CDMjgWqJrmdXJwz3hYNJC1UbPjva4T9KuVEsAu8obnILYYAAcnSQCfS8ft4Na0NCVr
	 cUlp3650rCXaI0M/XM33xOxy4VTF6Fv2hjgfha5YP26SMZSQQN0LYy+hTKGNy02fk7
	 cfpRCk+CRnwtA==
Message-ID: <56be1cd1-73cc-4733-b364-31b74f588e9b@kernel.org>
Date: Sun, 17 Aug 2025 12:47:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 7/9] nvme: apple: Add Apple A11 support
To: Nick Chan <towinchenmi@gmail.com>
Cc: asahi@lists.linux.dev, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Rob Herring <robh@kernel.org>, Jassi Brar <jassisinghbrar@gmail.com>,
 Neal Gompa <neal@gompa.dev>, Janne Grunau <j@jannau.net>,
 Christoph Hellwig <hch@lst.de>, Keith Busch <kbusch@kernel.org>,
 Robin Murphy <robin.murphy@arm.com>, Will Deacon <will@kernel.org>,
 Joerg Roedel <joro@8bytes.org>, Sagi Grimberg <sagi@grimberg.me>,
 Hector Martin <marcan@marcan.st>, Jens Axboe <axboe@kernel.dk>,
 Conor Dooley <conor+dt@kernel.org>, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 iommu@lists.linux.dev, linux-nvme@lists.infradead.org,
 Alyssa Rosenzweig <alyssa@rosenzweig.io>
References: <20250811-t8015-nvme-v1-0-ef9c200e74a7@gmail.com>
 <20250811-t8015-nvme-v1-7-ef9c200e74a7@gmail.com>
Content-Language: en-US
From: Sven Peter <sven@kernel.org>
In-Reply-To: <20250811-t8015-nvme-v1-7-ef9c200e74a7@gmail.com>
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

On 11.08.25 15:50, Nick Chan wrote:
> Add support for ANS2 NVMe on Apple A11 SoC.
> 
> This version of ANS2 is less quirky than the one in M1, and does not have
> NVMMU or Linear SQ. However, it still requires a non-standard 128-byte
> SQE.
> 
> Signed-off-by: Nick Chan <towinchenmi@gmail.com>
> ---
>   drivers/nvme/host/apple.c | 228 +++++++++++++++++++++++++++++++---------------

[...]

>   }
>   
>   static void apple_nvme_rtkit_crashed(void *cookie, const void *crashlog, size_t crashlog_size)
> @@ -284,21 +294,8 @@ static void apple_nvme_submit_cmd(struct apple_nvme_queue *q,
>   				  struct nvme_command *cmd)
>   {

Please just create a separate submit function here.
There's just not much code that's shared between the two variants.

[...]

>   }
>   
> @@ -587,10 +618,17 @@ static inline void apple_nvme_handle_cqe(struct apple_nvme_queue *q,
>   {
>   	struct apple_nvme *anv = queue_to_apple_nvme(q);
>   	struct nvme_completion *cqe = &q->cqes[idx];
> -	__u16 command_id = READ_ONCE(cqe->command_id);
>   	struct request *req;
>   
> -	apple_nvmmu_inval(q, command_id);
> +	if (!anv->hw->has_lsq_nvmmu)
> +		cqe->command_id--;
> +
> +	__u16 command_id = READ_ONCE(cqe->command_id);
> +
> +	if (anv->hw->has_lsq_nvmmu)
> +		apple_nvmmu_inval(q, command_id);
> +	else
> +		command_id++;

This entire block here looks weird. First you decrease the command_id
directly inside the shared memory structure, then you read it with
READ_ONCE to a local variable only to increase it again. Why?



Sven

