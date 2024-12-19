Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E384AE77184
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Dec 2024 15:43:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rWgkw7lmexiViKq2PxMUqduxvXcrYGn0gpO5vp9Rz7Q=; b=NJCwNecrdYmtszC+20xypIxKkx
	BzsgiiaBJHdk6csarRB+RNlwXcxSZvY2F5kPjqVq8+KjGmtH1P1ha3uBC40WUrm6fVpK3BeFGXXlD
	OVOzA1+db7t41eUsQo54DREF6J37Zc8fHDLKATsD5W/y0YLpOhyx5PQHmF6Nj1XDUk5bq4bx4lYJm
	QNAqwC9ci24KbnURHOl0iJwPu+v7HQzDqk96hkl93UDEf9W9633VuuizcFbJfzxrg7uBcYARUF3/w
	wGxMxFT87HKOyP9F4Aer0Wd6VlYRYOQAhwn/OwDEbLU+gDfnM6duEECs1MqB5/9Qzox+9B5P02j78
	Ib0m0mKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tOIgP-00000002CIq-01KB;
	Thu, 19 Dec 2024 15:43:25 +0000
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tOIfH-00000002CB8-20Rz
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Dec 2024 15:42:16 +0000
Received: by mail-wr1-x434.google.com with SMTP id ffacd0b85a97d-388cae9eb9fso532793f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 19 Dec 2024 07:42:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1734622933; x=1735227733; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=rWgkw7lmexiViKq2PxMUqduxvXcrYGn0gpO5vp9Rz7Q=;
        b=B6qHYMs11MvbUYw0dO/gJaZTbWcCctJex44cUlpS3oMHw9/nS5oNtzJRtuKSFvC0gV
         JE04pb1l2cluqQYSxg0L0Z3gjHvUd2h1YlXWZCmq7OSQ6RG4xWWMFkj3mCDUEu1AhH6s
         wWxfDyCJOhdh8qCpXGnVLSGD+fjHfIZz++oJ61tX+0Ow80AuKfukBu/S12QeWm7Vd88e
         lX5pxUKIzrtFjEJO9pxJ0PDjlauTduNzM5HeMjcULE4MzCwYvX7t8Cq0rj+jqe9BsEVl
         hKCU+fN3GGCx7398Us+NY78KlKflydlPbeT1Ogtj7EDBU47YSOG0TSsWvp9MfPtHZP5k
         2HDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734622933; x=1735227733;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rWgkw7lmexiViKq2PxMUqduxvXcrYGn0gpO5vp9Rz7Q=;
        b=rhrIk3TNsDEhGFXdBfRSrMhmXV+84YdG4cP6nPRU3hN1FyFZMLlwKF1coo+FrhDTTE
         gvg7BMeEC0wZN7ghITm0QINZUkW8e5xPT50uvVU2PqvnBmh7gZMG5gf5d6PnxY9RZx/X
         dypmnR+8obkQ/IX2Gi6hPG12+ifiQWFv4EvXsJ2YAaOZJacvRHnB3mtVsk4x7sbH/uVr
         6qyEGDfN5I19NTuFPnZ015GPpgy5Ie6OALn43Bo3grIbiHvg9eqrNt7I2q24djHQT6Xg
         LvE34ZLSTvx1f3qtvvhHzEIdtEdmQXxZJJlHpZhtSUu4EbcvucZ16UVM1owhvtvQ9lxe
         V1SA==
X-Forwarded-Encrypted: i=1; AJvYcCU7F9myiZ5dSYo9z6ZAaIQjsaI6Gq6xvYXOjLySIHPzTp+A84xqqp43+wNZiQ2Nugg9nXcHWBSE9UPl9/JjQgU+@lists.infradead.org
X-Gm-Message-State: AOJu0Yxy5ufoLTjNzd16dMc2/ScixUAoyUpL6zkuyLHs4qjdFGaqlNDu
	SXG/sYNTAJB34AgwccVpWJ+ZevGmOIjughgN+EdV9WtfASybTofdi/GHUKQAYTs=
X-Gm-Gg: ASbGnctVB7hcCvg4iVLsEZ+YheTKCqta5jD1IbM1bh7DXqQJEi/Hsj0Tha8KKU61MLz
	tTdCJZVAMz9K7PTUXtZu5C7CRgglLK4CqkpJdzm+TC2Yl1lgEEzOCCBCwoqDkCB1PE73ckfmTlG
	1aGQF5lkYR6LXppuQ+gnJO/7RaFD8s1OnF6V4bxNsNkXhqLSKoGF5XluZOWSIL/2xiEs3M8nYfY
	etgSptJ+vT4iJlLdo8XwJpWPY1MWekYxujoYSsDLOud8s1A3yXjGY2vUq0LgUfQ
X-Google-Smtp-Source: AGHT+IHyTbXfmMGun8BgqdCNy/tymW9cvuteP7xXPOqYhxYi6zsB4192YIqC9FG7M9zeEWdBkq3JFg==
X-Received: by 2002:a5d:6d0e:0:b0:386:2aba:a7f6 with SMTP id ffacd0b85a97d-38a19b47ecemr3753765f8f.49.1734622933377;
        Thu, 19 Dec 2024 07:42:13 -0800 (PST)
Received: from [192.168.0.14] ([188.26.61.92])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4366127c639sm20872915e9.31.2024.12.19.07.42.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Dec 2024 07:42:12 -0800 (PST)
Message-ID: <d9e635c8-de05-4812-bf2b-11651f6da5c1@linaro.org>
Date: Thu, 19 Dec 2024 15:42:11 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] dt-bindings: mailbox: add support for referencing
 controllers solely by node
To: Conor Dooley <conor.dooley@microchip.com>
Cc: Jassi Brar <jassisinghbrar@gmail.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, andre.draszik@linaro.org,
 peter.griffin@linaro.org, kernel-team@android.com, willmcvicker@google.com,
 daniel.lezcano@linaro.org, vincent.guittot@linaro.org,
 ulf.hansson@linaro.org, arnd@arndb.de
References: <20241219-mbox_request_channel_by_args-v1-0-617a6910f842@linaro.org>
 <20241219-mbox_request_channel_by_args-v1-1-617a6910f842@linaro.org>
 <20241219-recent-everyone-865b19864693@wendy>
Content-Language: en-US
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <20241219-recent-everyone-865b19864693@wendy>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241219_074215_545106_4942118B 
X-CRM114-Status: GOOD (  10.00  )
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

Hi, Conor,

On 12/19/24 2:11 PM, Conor Dooley wrote:
>> There are mailbox clients that can discover the mailbox channel ID at
>> run-time. For such cases passing the channel identifier via DT is
>> redundant. Add support for referencing controllers solely by node.
> I don't really get your implementation, why not just allow #mbox-cells = 0?
> That's what's done for things like fixed frequency clocks that only have
> a single output.

Ah, indeed!

instead of:
	of_parse_phandle(dev->of_node, "mbox", 0);
I can do a:
	of_parse_phandle_with_args(dev->of_node, "mboxes",
                                   "#mbox-cells", 0, &of_args)
where #mbox-cells = 0;

Or ... can I pass NULL for cells_name and make the #mbox-cells property
optional and still keeping its requirement of being at least 1?

Thanks!
ta

