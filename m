Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F904E7DEEE
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Feb 2026 15:12:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=blBZowIYxmGQt/qp8Zqs7qxe8LPuadPVWAo6HXJFncM=; b=wpEugJgtFXCpldpn/kEFYsf1/4
	IY8Ybtzk3sVJOWYRAZV86CHRSpQl5bAqyM4E0R+xb1F+M+WM+J4GQpnEccM4S51CBYtEnwXJCszex
	ZO0+9PwLSkgiu/wCIkq3Hn70TK8CjKKFRnrKYW0NVpUalJvVhkPcL3kZVPTR/mHo0iKwB6DgYOc69
	NIeFCViwA06Clvw5z2QOuec07rY+8RmrTic394zXPYlYccglI5iEgY5M+FcDBJbMFJTLMIPWJrmmk
	D3bBMTdVsYvJMJQ4V/P9oewn0hNq3LAKhZLIM0FKAd6c3SGoDe8xk3+uF+9G/yyEyLh3XTyOd2Aa4
	3iQeuilQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vmvav-00000005AVA-38cP;
	Mon, 02 Feb 2026 15:12:05 +0000
Received: from mail-oa1-x31.google.com ([2001:4860:4864:20::31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vmvas-00000005ATm-0sGk
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Feb 2026 15:12:04 +0000
Received: by mail-oa1-x31.google.com with SMTP id 586e51a60fabf-409de4132b5so937139fac.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 02 Feb 2026 07:12:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1770045120; x=1770649920; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=blBZowIYxmGQt/qp8Zqs7qxe8LPuadPVWAo6HXJFncM=;
        b=nR/SkclbZ1scjMWxXLTR/1gWjawXU6tEkel5tQVBUFqPE+tBS03sILZdN5ElRbbx6w
         M/esFqIauv9enIYA93qbXXbiAPibk783fxqxDqP/W84khqeJm+7u6dVsTE8f/wAANiOs
         br5B9SUA/jiRS33bMvWe8cTx2pZGvUlvRAQqXBksayUY8oRa/4W6WKeHIPSZm4+iEnNO
         2jBq6s2nhT5dzWxEqLffln11h2UtMPknibV5RmguJznSaIWo49bT1Dj8fzaVzsyV/2C3
         e0ziFwy+VCxAp92eF6qUkcScpn7W24QW/sIR3YQeFUDrwtDIsjHncHUpM/sV5+Rkgc05
         lFZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770045120; x=1770649920;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=blBZowIYxmGQt/qp8Zqs7qxe8LPuadPVWAo6HXJFncM=;
        b=EcfQtUV/U3qD9Q9CIt2rNmcQohOUbtZq1AB8bPNXeKDhtw0Jva4BoGCLS4QhbNpAgq
         4PRthBS9qIvt0WBwVel6Cx0IlOcy2BVdZkEcpXcB0ckKTpNedxKaMsQiZzEm/gHqnGWD
         b7Yhnigb8fnQ79ox/N5e5a1HXMgDyPl/9qBPwU1srNWKJmCMRknlWJx0uNlq12pl1GBF
         zjBqceuNEYkpelitvQpLNn+XRCQmcTuNzLXLR2reYBuvqiC/snXHodNYet8qDgu7hVhL
         INoGzoPdrAbDP/hF7PySZRDJLkShr2D0YgkUgJh2Npt0sSOsylY/DF4Ds6vLy7PSdrU3
         Qd6Q==
X-Forwarded-Encrypted: i=1; AJvYcCVXlmJXnmfXdnzkp8IygdhTWtbg7ATITlf/pw/AUnjgr/ZsrYbd8LGwC7Ph8kQdgDp475KTxA8VF0OfN4wQ/qIR@lists.infradead.org
X-Gm-Message-State: AOJu0YxuXmASnk3SOciliFZNrHAEv0TioAiaVMZQMoOulPr8yjgE/TaG
	1bBtAQfi9DEp+gbs0DLnb3Ek9HRqWYjFYSG+9u/m1c0jKTzD3RUFlTpKFtt8Fcy+e50=
X-Gm-Gg: AZuq6aIibt9H0cpGKtAHrOmJPcK8/WCoyGAElTjBeMJ6b/q9RBpukses34qo/Ezrz32
	peawl0pB7FiJL2ZCiKyFZ51imgjUl1qpr+K+p/O2PZDNCUTxpEiu7/yOHqPgW1mgjvk798oPMnw
	sc/kxwIJnHNa8BlGpMI4b0oxz7XTosQ0okxtsk2cEQYKNqJhg8q5i4KSS5a16UZ34/oxjq5Z3g4
	PqyJF5FtcAvfAO9hnGB9/On9aA0Mii7GTQUfnlln40UFUJbAYNQEav7/3iPldX2iUxtv+QIFNsd
	MW8ODK18a1vA9we38pP2HZownHUwwMqoe3l64Y1LbJxYTvmAVUkiOGIWMboIPTxf4j6QT4OMorf
	9EY6ofXpf6/GWfN4OIl5hi4ddmzVfC6FOFoZkx7Qst1Bq6/Wt7SFaWyip9b91EWkbwKV9NQpJb8
	I4Pe0lSOTiiTJLVnYdDqO95P/YAqLtlatvTwSkaexdD65If2Q9VkZ6g1zmueDXUOo8B3PKUNE=
X-Received: by 2002:a05:6820:1621:b0:663:c86:e9e2 with SMTP id 006d021491bc7-6630f043bb8mr5049423eaf.35.1770045120281;
        Mon, 02 Feb 2026 07:12:00 -0800 (PST)
Received: from ?IPV6:2600:8803:e7e4:500:3695:6954:27c2:42ef? ([2600:8803:e7e4:500:3695:6954:27c2:42ef])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-662f99447b5sm10006110eaf.2.2026.02.02.07.11.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Feb 2026 07:11:59 -0800 (PST)
Message-ID: <01eb6fc5-4a71-4877-8a62-ef397a1036c9@baylibre.com>
Date: Mon, 2 Feb 2026 09:11:58 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] iio: adc: at91_adc: change at91_ts_sample to return
 void
To: Antoniu Miclaus <antoniu.miclaus@analog.com>,
 Jonathan Cameron <jic23@kernel.org>, =?UTF-8?Q?Nuno_S=C3=A1?=
 <nuno.sa@analog.com>, Andy Shevchenko <andy@kernel.org>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Claudiu Beznea <claudiu.beznea@tuxon.dev>, linux-iio@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20260202115733.21382-1-antoniu.miclaus@analog.com>
Content-Language: en-US
From: David Lechner <dlechner@baylibre.com>
In-Reply-To: <20260202115733.21382-1-antoniu.miclaus@analog.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260202_071202_494195_CFA5922D 
X-CRM114-Status: UNSURE (   9.49  )
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

On 2/2/26 5:57 AM, Antoniu Miclaus wrote:
> The return value of at91_ts_sample() is never checked by its caller.
> Change the return type to void to make this explicit. The error
> conditions are already logged via dev_err() which provides sufficient
> visibility into hardware issues.
> 
> Signed-off-by: Antoniu Miclaus <antoniu.miclaus@analog.com>
> ---
Reviewed-by: David Lechner <dlechner@baylibre.com>


