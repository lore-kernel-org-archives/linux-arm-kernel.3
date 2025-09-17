Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1AA3FCAC598
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 17 Sep 2025 10:01:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CGBsfleZ3i+8ylc+seLROZm49XcPG4nT0LLpkt3EpGc=; b=ABNokpi0zmzT2uSt+BeFvQSQ4t
	SAueGH6/xBLvfM9lNMh9+bqBheOOlBaQ0JrCfaM1tNXau7dj9QA2ZNL5cY/oOYnUjIlbxs/YJk6VZ
	6sgdzIrrjsAX6BpaYDkbmCv+NubRwXAF8nf+1FPdmBLwxjGX3eUs3CrYTk1/gudoMAb1JIa2JejUm
	RSGLSGiUg/qJJs0sQmqTRjyN4srdDVnASvnXJ9gXEbxw/5yCVF3R0oriJBFSbmzMzO4cWiYpSPY+t
	QUpxK8vSlG19sh6lpuAzUv6hE0CA3cba6MfmR0bxJuhg3u78AqUwCEIzW7IyvIV8brKgHYVvPqNX+
	ClmqfVqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyoyI-0000000AsxO-0po3;
	Wed, 17 Sep 2025 10:01:06 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyoyE-0000000Asw2-4Ae8
	for linux-arm-kernel@lists.infradead.org;
	Wed, 17 Sep 2025 10:01:05 +0000
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-45de56a042dso44027395e9.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 17 Sep 2025 03:01:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758103261; x=1758708061; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=CGBsfleZ3i+8ylc+seLROZm49XcPG4nT0LLpkt3EpGc=;
        b=iTK1L2NVil6If7N3IGm8KoXfElkl/SNA2yAI3bxOilJk7/3nxNVj2y5iOXstZgc6ql
         btFIcUrBjWAmfA2cMg7oxWjskrgSgfZx7NnCDB00gkYYWDcxKFUyBPXdqqlbNbF6s+Wo
         z89PFC7PxFXIHos4Z0zlc5DgiwcM29NMfOAt7TGjP6scOjycQ1ofNczdVre2bwAV1S28
         vjM7es9P8VdlD9GR2L77iFGtq7SHyMFVAOQ1TfUscIp0skNUHsfbXFpTDbsVfDFrLySX
         NkmZUC70lV8zdXNPWWTFCjFp4/t0Wbe3ovnVe5gzYVwIncn6YjdCjlvbajExdQYrdYCJ
         wWzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758103261; x=1758708061;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CGBsfleZ3i+8ylc+seLROZm49XcPG4nT0LLpkt3EpGc=;
        b=CTC8xMgWcIj4VUvFuLQjspfUfGR4A+W4XpgBKiHuDWO1E4tlNMlx3IBZepexhSI2xU
         nNhuWCtxotEbZ5traUmLH2HhbAYllIOE9jVYs+nNId/3OLVQUJoSzwvH+K8HpYGxfDQA
         jroJEEoPiyhFwkE4McyV7mrq24i8r7FUSXf+Mx3R/VxAqm1OxYzbqahpJRr7NXewz5nC
         BM+KUalri9HkCrHijMZ7MSiwKNx3sRoK7eQploXPITdJZGizeDIhhchvMbuveg2Cw3hT
         lJwmyr5b+tzeM4oKPatqW1qGON/YvwlSYtmIaUDBsjl8O9NiUexU7P1cq/5yciTsFXV/
         +qtw==
X-Forwarded-Encrypted: i=1; AJvYcCVOAoNiHZr9gmIh7tuvzvfAhANF1ZtcBQfPZU+7ATg0ELyaQ4QTMAwRF/6V90kYWTB6rrVobc4Nx4bk7jFSkWLd@lists.infradead.org
X-Gm-Message-State: AOJu0YwM+2bQAvHg0Fjl6QdIetThd1cSs8CVVUCKh5g6Pm3dcB9KhdsP
	/vQFG70sGSCPZcZFQXBkitROf0UKhF6jB27MUvBrHL5wwhK67wGMKjDg
X-Gm-Gg: ASbGnctck13FpmzuP6HKIgyUnbasa8/S8xs1m5yZYY6PoABPCKFaVV/e8n1PIiFCslx
	SKt9Y8kIQSWlwTNKPe9r8mBj4wDQ2hN+vAjn4uN+uf9NS0ZHX9wqbn8/CHu03/dDWVGP2hgQMN4
	ZRUMzpesO5du8X11l34GPg6amUq0iQKO3DpMCVGKmtMJttJGmv9nokUyQg9tlVQxQnYkilULZcR
	UvH789MGEMG25/eXuS3FV0sfRBbey4Mn/eB26/vktATaEeR3fcCtFIuRLBxPag+22FPM9cTl/bR
	gbovag7ukGq6N5jGtqEG2W1ic0Uwg1jqmBYIfNfueVYL7GAHgE8PWCfooJWBVNhUcyaoY/qYyLf
	TMnZe20wVXbge9y5PkLMSHRz6yPGr
X-Google-Smtp-Source: AGHT+IGcDDfwcLKirIEgcdjZXbE5ytuoMBhtHdSVlqoGfPRQcdjcLqJrL77I4lSdU5uEF4DfuyU5cg==
X-Received: by 2002:a05:600c:468f:b0:45f:28c9:4261 with SMTP id 5b1f17b1804b1-46205adf781mr14100095e9.20.1758103260560;
        Wed, 17 Sep 2025 03:01:00 -0700 (PDT)
Received: from [192.168.0.24] ([148.3.20.242])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3ecdc2deb20sm4014209f8f.47.2025.09.17.03.00.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 17 Sep 2025 03:00:59 -0700 (PDT)
Message-ID: <939cea9e-d7bd-4a13-b462-17e483f61e4c@gmail.com>
Date: Wed, 17 Sep 2025 12:00:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] serial: 8250_mtk: Enable baud clock and manage in
 runtime PM
To: Daniel Golle <daniel@makrotopia.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jiri Slaby <jirislaby@kernel.org>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Yu Jiaoliang <yujiaoliang@vivo.com>,
 =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Changqi Hu <changqi.hu@mediatek.com>, Sam Shih <sam.shih@mediatek.com>,
 Steven Liu <steven.liu@mediatek.com>, John Crispin <john@phrozen.org>,
 linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
References: <de5197ccc31e1dab0965cabcc11ca92e67246cf6.1758058441.git.daniel@makrotopia.org>
Content-Language: en-US, ca-ES, es-ES
From: Matthias Brugger <matthias.bgg@gmail.com>
Autocrypt: addr=matthias.bgg@gmail.com; keydata=
 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
In-Reply-To: <de5197ccc31e1dab0965cabcc11ca92e67246cf6.1758058441.git.daniel@makrotopia.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250917_030103_075156_50920C51 
X-CRM114-Status: GOOD (  22.43  )
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



On 16/09/2025 23:37, Daniel Golle wrote:
> Some MediaTek SoCs got a gated UART baud clock, which currently gets
> disabled as the clk subsystem believes it would be unused. This results in
> the uart freezing right after "clk: Disabling unused clocks" on those
> platforms.
> 
> Request the baud clock to be prepared and enabled during probe, and to
> restore run-time power management capabilities to what it was before commit
> e32a83c70cf9 ("serial: 8250-mtk: modify mtk uart power and clock
> management") disable and unprepare the baud clock when suspending the UART,
> prepare and enable it again when resuming it.
> 
> Fixes: e32a83c70cf9 ("serial: 8250-mtk: modify mtk uart power and clock management")

Most of the issues from this commit are already fixed in
b6c7ff2693ddc ("serial: 8250_mtk: Simplify clock sequencing and runtime PM")
which is more or less a revert of e32a83c70cf9.

I think we should add
Fixes: b6c7ff2693ddc ("serial: 8250_mtk: Simplify clock sequencing and runtime PM")
here as well. It's a fix of a fix :)

Regards,
Matthias


> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> Signed-off-by: Daniel Golle <daniel@makrotopia.org>
> ---
> v3: squash into single patch
> v2: add managing run-time PM in dedicated patch
> 
>   drivers/tty/serial/8250/8250_mtk.c | 6 ++++--
>   1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/tty/serial/8250/8250_mtk.c b/drivers/tty/serial/8250/8250_mtk.c
> index b44de2ed7413..5875a7b9b4b1 100644
> --- a/drivers/tty/serial/8250/8250_mtk.c
> +++ b/drivers/tty/serial/8250/8250_mtk.c
> @@ -435,6 +435,7 @@ static int __maybe_unused mtk8250_runtime_suspend(struct device *dev)
>   	while
>   		(serial_in(up, MTK_UART_DEBUG0));
>   
> +	clk_disable_unprepare(data->uart_clk);
>   	clk_disable_unprepare(data->bus_clk);
>   
>   	return 0;
> @@ -445,6 +446,7 @@ static int __maybe_unused mtk8250_runtime_resume(struct device *dev)
>   	struct mtk8250_data *data = dev_get_drvdata(dev);
>   
>   	clk_prepare_enable(data->bus_clk);
> +	clk_prepare_enable(data->uart_clk);
>   
>   	return 0;
>   }
> @@ -475,13 +477,13 @@ static int mtk8250_probe_of(struct platform_device *pdev, struct uart_port *p,
>   	int dmacnt;
>   #endif
>   
> -	data->uart_clk = devm_clk_get(&pdev->dev, "baud");
> +	data->uart_clk = devm_clk_get_enabled(&pdev->dev, "baud");
>   	if (IS_ERR(data->uart_clk)) {
>   		/*
>   		 * For compatibility with older device trees try unnamed
>   		 * clk when no baud clk can be found.
>   		 */
> -		data->uart_clk = devm_clk_get(&pdev->dev, NULL);
> +		data->uart_clk = devm_clk_get_enabled(&pdev->dev, NULL);
>   		if (IS_ERR(data->uart_clk)) {
>   			dev_warn(&pdev->dev, "Can't get uart clock\n");
>   			return PTR_ERR(data->uart_clk);


