Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE803C5B543
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Jun 2025 13:22:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ALKVA2fW4irMbGXjAfGWZNtggykUGJCgahiUtNxuSd8=; b=tfBSSJVVzILDe5qOIyBNFL/nd2
	dzdZtZEQoL2ZikXxAXEDnS0/vMXwplp+OmeXx9lDqUo0Ua72Bq5xB5O+ZrYmER8RijQ0NKQvnRkrw
	nbWSpXI8KjsNvcqGSIbeyHqFP+enoEmTr5B9K+FooeY+qLSLL3iP0ROrDKTcOIW46fVO1/3obG0oo
	IRMlcGPCiZAVUfGgf0IvT8ociZzCbyL7SZ9+RsQvGJSwEWMNjZk0MWXXs2JEG8cSvHvCb/ztDKdsv
	st9x4xQ/f+AkOTSsFsLoRPN9nVh1iN7q8s5kyea3cEfUMoIiuaSWRbbgsa216kCKxY0YOdgzzHFjt
	3c5vcWOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uNAXg-0000000FcCg-1y2G;
	Thu, 05 Jun 2025 13:22:00 +0000
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uNAId-0000000FYRI-3cA8
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Jun 2025 13:06:29 +0000
Received: by mail-wr1-x432.google.com with SMTP id ffacd0b85a97d-3a361b8a664so845020f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 05 Jun 2025 06:06:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1749128786; x=1749733586; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ALKVA2fW4irMbGXjAfGWZNtggykUGJCgahiUtNxuSd8=;
        b=SW5/Xzz7XvUqmhtYZu9ijUg5FGIsVjH/x8lz7ChQCMtQFJKd7bfUpGJ1KOf/KRfOBO
         kZm/mKsbSnUJAX56JXJ56AUjCydPftmRQS0p+ZGjDo9oAkLAN/Gop7SOsF0xdpup+BB7
         7nPIkgBXUjw0GMNpJem7RLAsyzgUGsWnogELwNLtcdR1rjVpVUZAxWmSMnAtWZ4rfQG+
         CStd79PGkpOfnfwKuSsN1ikzcp7VYzLd8UjQ/istarD78SlLwF/eQXZAbqIVGEFJ4UCv
         3eXC0ZUnGwkBpiUVS8f+o7MBfoxAtR+sb8deXBObRGKwZi5JpiBD4JowJ8JufC9TkZA4
         21QQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749128786; x=1749733586;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ALKVA2fW4irMbGXjAfGWZNtggykUGJCgahiUtNxuSd8=;
        b=QsIg2I1IRT7rDwPZhr3VrH/LjWjqmkZIcBeatn5DqriqcdnwgkE/r1va8jMWpED6yj
         qVJ+Ukr+8vBbDr2h+tM8NbBvAYNhO5bZ3tQnquei4dk5dlq3wRIVA9+YwBRVfFE+Bpb7
         RPhxXVomNDfBbDjBlj/aSRNaqngvKlRfqpsjdVAVFiucDn6jM13XIOTvkHXAKmaoSGft
         8MSYE7ZKE3u0a4xrPD8/GgUVAzZU9v8nJGNd+k2DMIMfTgQwsPMb6obppUKWbaZOcpAv
         scN6lQFOrY/hl7gxk6sw9UBBiGa45hukJ0AIZ1l1gr5IUTyYRqq1dCHciQbk9wekJXdL
         6IZQ==
X-Forwarded-Encrypted: i=1; AJvYcCXpQJzSu3VNAQOhWrBnLDMNveBI0QGb48YYBhj9b9lxETIQOrygBOQXLpEq4k97/NOJcW0slq5dlroNiejqMiVM@lists.infradead.org
X-Gm-Message-State: AOJu0Yxhe3WG3aXUjTUhh0GkSe5G+TFY+F+20RlGutN/aaZedxLn5J/E
	oMps7XQ6RX392M3HlMOgCAmD6U1+vrnuzOnI2aRIznNYev+wHCuKlCOibRZl9ZMkArU=
X-Gm-Gg: ASbGncsmYTOxyMWUdnjpTTCC17pBXCAwW3+vuDJizHOS7BwNFy4Dxbwx+znI5NqW7X9
	Vo7mk8Tdjt6DIssD/hpEKBL+6xPAPHeFIk4Z2k1iXAxttR+TVoyqPRlMO8Fe7j1kFHFgPL0G7Zu
	do2iosvdXOEYFn+w8KsiJwu2hdnHgwI09DB6p1YiXH1hh2Uau0NDcxHt2M4uZlRarcQ9eM+P06n
	d2+Ed+MwktnZBwtV8CTm29TKXACfwedc7vNh/mfidqDZjaQ9F8ojscbF6Znr6FncEAXo1kCbnfe
	q/Zd9LWMpO7mXjHIG8ltFhqJp0pVI4Xo5hHFrmTj53lQMLXjV7D99hUgWzkX2KxcfZEbyQ==
X-Google-Smtp-Source: AGHT+IFlFSrl3XSTZnrLX3liutqht/hIRQLoBNZPN0qE0WMgTCPvfiUO9lKb3LhAK0eALpw01RUcqg==
X-Received: by 2002:a05:6000:1a87:b0:3a4:f7f3:2840 with SMTP id ffacd0b85a97d-3a51d8f60c3mr6177072f8f.1.1749128786358;
        Thu, 05 Jun 2025 06:06:26 -0700 (PDT)
Received: from [192.168.1.221] ([5.30.189.74])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-451f99248a7sm23764615e9.36.2025.06.05.06.06.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Jun 2025 06:06:25 -0700 (PDT)
Message-ID: <99d180ad-7e64-41fc-b470-62300a064bbf@linaro.org>
Date: Thu, 5 Jun 2025 16:06:22 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] dmaengine: qcom_hidma: fix memory leak on probe
 failure
To: Qasim Ijaz <qasdev00@gmail.com>, Sinan Kaya <okaya@kernel.org>,
 Vinod Koul <vkoul@kernel.org>, linux-arm-kernel@lists.infradead.org,
 linux-arm-msm@vger.kernel.org, dmaengine@vger.kernel.org,
 linux-kernel@vger.kernel.org
Cc: stable@vger.kernel.org
References: <20250601224231.24317-1-qasdev00@gmail.com>
 <20250601224231.24317-2-qasdev00@gmail.com>
Content-Language: en-US
From: Eugen Hristev <eugen.hristev@linaro.org>
In-Reply-To: <20250601224231.24317-2-qasdev00@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250605_060627_905116_88722C3D 
X-CRM114-Status: UNSURE (   7.95  )
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



On 6/2/25 01:42, Qasim Ijaz wrote:
> hidma_ll_init() is invoked to create and initialise a struct hidma_lldev
> object during hidma probe. During this a FIFO buffer is allocated, but
> if some failure occurs after (like hidma_ll_setup failure) we should
> clean up the FIFO.
> 
> Fixes: d1615ca2e085 ("dmaengine: qcom_hidma: implement lower level hardware interface")
> Cc: stable@vger.kernel.org
> Signed-off-by: Qasim Ijaz <qasdev00@gmail.com>

Reviewed-by: Eugen Hristev <eugen.hristev@linaro.org>

