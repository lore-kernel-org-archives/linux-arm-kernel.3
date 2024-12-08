Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92046E77173
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  8 Dec 2024 15:53:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kx3jh0GE1/Dropfvo1pElPZ7xo029DSJLEgY7NpRbHo=; b=Ikb6cPv2qEQLeOozQwP2Dlebl8
	+5F/fdb7dpaZBstnput5sUzb/x5RQtFsx7im53VBSn1LSBSlId0WnsCqUnFnrz0Etf9l6MhpgMtLZ
	EhYZ3WNK3S3hiZ4XOhVbMudivPJth+s0EhmQzurGQwV5bBU7jFB0O8ZfzOiozjZXPGv4y+UFJnojq
	IWB+pWiO3yq5laFdzDd8fmKF+5S8MDBLpWRTObj18FCHPQkjU+CTE1n3Q7lkb5NjEG2KnP2lMdvvG
	vxs4N6h33a0Pxs1ohbIESeLVn1h9aPdGbz71pwEGJZGvpUQMInLdRayUdtYp3syOwGteuLUW9U0PR
	p4cdzITg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tKJb6-00000005VIa-34Pp;
	Sun, 08 Dec 2024 15:53:28 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tKJa3-00000005V6z-2e4A
	for linux-arm-kernel@lists.infradead.org;
	Sun, 08 Dec 2024 15:52:24 +0000
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-434e84b65e7so13084155e9.3
        for <linux-arm-kernel@lists.infradead.org>; Sun, 08 Dec 2024 07:52:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1733673142; x=1734277942; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=kx3jh0GE1/Dropfvo1pElPZ7xo029DSJLEgY7NpRbHo=;
        b=bsdqN4NHmIN0unrcul2OSwaCHhroCEw5mK0wx2eI16d4CsXOr9G/gjWyDytB6NvEAi
         J+7Zd401iBA+mOQy/izrG9gbQOKcYlTOGbUKkyRIwJetVWEK6F8631nRYFHZGo6WPwZt
         JXkmanTIxR10CyC/fAexV+I/GySr+k660YtnMvRbgqC6b/NgZuhbpYSIr1ukoJLd465y
         JUIOyE2sjseDtKiIXt8XL/PGSY/BUqfln6k2LtroG2EoQTXeK9AhWBLQJEHFh/cBd/WM
         D72xpr2yHRkgFiNSHHpdHWDjVNjQlUjQyTdIA05Xs9VPRv0DsVcTkTgsvAhvuG1lbS9+
         sKTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733673142; x=1734277942;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=kx3jh0GE1/Dropfvo1pElPZ7xo029DSJLEgY7NpRbHo=;
        b=Kgd80SLbiIQNgPjwqG2Kfy4T+IhfqydPnXvWpWPCIjUvO/apNsKRhIJGg5ojYasMA8
         +Ve+0CfRPN0Z/93AOfRjZ3TA9GYk0peT1jltGzNf2kKPiOn7lpqbBdkItHwVnkJ5B+vf
         4x57yszaCntMXpjKvnRyFkuEhvfT/bHXqsKLbOYjHVhcDZP2T3QmHYSnWmxZVYQpO/+H
         c5WoL3aSAQmWAHzB3Ogc6XYjwpTDVLrL3+IclucCTC/0DCC2tn0UQEmkdqR0Mw0wrbhv
         tc/jaFqwuCLfztRKL8EtE27jJU9QzaAlTs8cGLiffu6iucKvMGjm1LntAvJsWSWZDvQw
         QnGg==
X-Gm-Message-State: AOJu0YwbzKMr7IyEdJt8IkVyJw73zfkY+/0VwJGUnAT6wDlPSZY5Mf7V
	5pfV3ATt37LPTNrM7TnW0RVVNEUWjFzkH27RX6wZZI0HHd/NOKGa8H7/IPRYY9M=
X-Gm-Gg: ASbGncu8G9dShCoyJlcR9yk5aY+esX47AaIMTIbnEn/87zqvvy0YamKs9efso/nbx0o
	uOszE+tH9lv9YH+x9uwNJYAkTuzXmscvukwahvnP12OV/b+wW1wvRnqAesyTixgjdNb0H+4sycB
	R/+9tvZ8Isep31OQMZltKrmSkFKBCaRMgvoVav9TYNC1so76gSSbHZ0rEEp7WsIqbqh2pXt3v86
	EAZNXwS6TQVWqLBDwSJp+BED3wgkfPwuOZs0azCA1kWdaNc5EE919jXv/c=
X-Google-Smtp-Source: AGHT+IEHWXmOO6Qhxy2IR+e2zwqSa3oqeBDMkFmhJ9xKhEy7pcBF/DqwbtBN0uvcQlGuz1FIpzs6uQ==
X-Received: by 2002:a05:600c:35ce:b0:434:ba13:e52b with SMTP id 5b1f17b1804b1-434dded2bedmr89096995e9.31.1733673141783;
        Sun, 08 Dec 2024 07:52:21 -0800 (PST)
Received: from [192.168.50.4] ([82.78.167.161])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-434d527eeedsm157997545e9.19.2024.12.08.07.52.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 08 Dec 2024 07:52:21 -0800 (PST)
Message-ID: <afac0fe8-2854-43eb-a4fb-bcf5b6d194d0@tuxon.dev>
Date: Sun, 8 Dec 2024 17:52:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] soc: atmel: fix device_node release in
 atmel_soc_device_init()
Content-Language: en-US
To: Javier Carrasco <javier.carrasco.cruz@gmail.com>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Sudeep Holla <sudeep.holla@arm.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20241031-soc-atmel-soc-cleanup-v2-1-73f2d235fd98@gmail.com>
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
In-Reply-To: <20241031-soc-atmel-soc-cleanup-v2-1-73f2d235fd98@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241208_075223_729842_CCC2BA11 
X-CRM114-Status: UNSURE (   8.82  )
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



On 31.10.2024 14:33, Javier Carrasco wrote:
> A device_node acquired via of_find_node_by_path() requires explicit
> calls to of_node_put() when it is no longer needed to avoid leaking the
> resource.
> 
> Instead of adding the missing calls to of_node_put() in all execution
> paths, use the cleanup attribute for 'np' by means of the __free()
> macro, which automatically calls of_node_put() when the variable goes
> out of scope.
> 
> Fixes: 960ddf70cc11 ("drivers: soc: atmel: Avoid calling at91_soc_init on non AT91 SoCs")
> Signed-off-by: Javier Carrasco <javier.carrasco.cruz@gmail.com>

Applied to at91-soc, thanks!

