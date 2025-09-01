Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E24AACA0FF0
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  1 Sep 2025 18:01:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/giPzS+fk2Ol9RxCiUq6yACQ50TfsIs6m8m4/nlKqu4=; b=wzeerGCzPZRtVuueZ6BP355zUk
	6wcH+TBDktViLgnUrHV34jf0YKyZyfJpH0BKOAhLCiByqB4MqvTYKUWgW3hTXyWuB2Fy5hXaNznWD
	vOJMXEsyV4MlzWRLjSpGw2Wv3EJt1GHIqkNlOnrgrK0/Mv11xjRxlly7C7w3XH6iDXGzCKNqtzgJD
	n+PcwuPbfVEEmdMKqTiX/dfiFQcJ/Ffsbp1o/CPTgKwsmvs/YJ6wS9+RR5ac7mOgbQ98BffGiv2sW
	GRSZvWxF/77wsdoaqvyljnulGPS2GoF6D0PACsKwMq18dguaxa1IE3OdGB7pZfu4jjrKMEjXFnS/D
	Q4qjPGYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ut8qp-0000000DWDY-2U5E;
	Mon, 01 Sep 2025 18:01:55 +0000
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ut5qX-0000000Cuk8-3Jic
	for linux-arm-kernel@lists.infradead.org;
	Mon, 01 Sep 2025 14:49:26 +0000
Received: by mail-wr1-x42b.google.com with SMTP id ffacd0b85a97d-3d3ff4a4d6fso1200896f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 01 Sep 2025 07:49:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756738164; x=1757342964; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/giPzS+fk2Ol9RxCiUq6yACQ50TfsIs6m8m4/nlKqu4=;
        b=eqGnMnZuZ0mawB5puApnDPzxdwZTGr6KRjm3CzzIeXtSBvuRhK7EtFWk2w7lX9yzd5
         3d23ZsFrVTDLq2WA/ba4kuv9HjmNNyRrVGtpmOM1p8weTY/YHS4/FgyoBDvImEFr9yX8
         e7drPeXv040kZjD0V2waTATtXdh2Hh0uW1x6lghLkswD5Y8kiKTvZkdwGp3dEcPMEuDH
         7hdrTYRvAyTzuwdkkS1UsY+T41xbPKkGiLtZ0jebPJO2WPX1slTJGr6h9/7bDNfdEnzJ
         TBRD/lkvRbvVYx3ThdUVz21hkpqiY/RWft8mSjp5aOARPhabarcnyFERJLuKBzVlxuZ1
         DsgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756738164; x=1757342964;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/giPzS+fk2Ol9RxCiUq6yACQ50TfsIs6m8m4/nlKqu4=;
        b=vUcvseN+mDJNyks8BqXKyu12w66tpG9fxNBRKDqGNm8usU14+r8hLE+MJ6539wmy2A
         dNn8k4neswE/zn3LdQeouUrx+2v+d3fy3r8E+jR+kt9F+yKyYgldqFq1ONoYNk7aLOqj
         Eg3Wvu7RbjaGoZ8XQPaLCF/hCssbjcUhvw63WA12i2Fl8PXs+Yc9w/7KEwFsgbb5C2qz
         paPuDo9WOVF36mftgEZafOh17WaqM4yzZgELNm6nvagbgHFG4hT47eWx7Aek0uUx1iNI
         2J3Uw39dT+aO2rZTT46fg9YS2L4HFohrIu7mryhn7HFGLbDVK8uUFzEIs9AqqzAXtTFY
         exiQ==
X-Forwarded-Encrypted: i=1; AJvYcCWLHH6PixsxB+ATefpLk8OkMkQOEqqcDDvu3pvevfK9G522elMM/H2m+e8rFZUFpeIKyR7HTamJjckftoTVyfdG@lists.infradead.org
X-Gm-Message-State: AOJu0YyKm+gM0PkPfD7rSnTVDY61/QLZmdF6DA4RQKzSlZZk2mXO0TQu
	cOj59dhSJ41bq3NFvy+9GDSN/SgFEmTCjf+rd+3SM49WaX8J59/Rsk7P
X-Gm-Gg: ASbGncug+O9Wbx2VO0jhJtb3q2ZCwK9jnRZwlfvXzTenLIjBCllq869L8hz6ixMsmF1
	4fFwkgFn4RAKDPjhm0k6RIDYwbie0VhpVw+V2JnUd3FmuLlby7DIYAfAJ+XJ7cfTKsQwomwzqGB
	tq5rOKatEV/3f8naALKL+RfoVYjYzK9HA/jX7/q1yG7nwOFO7yDOZtduQH1g3eJAGi16+2JhofX
	a1NhBXuTiO0EmRkNgBC2DMCsPcVXM6Oesen8v5X7CyOLt/NGn8BL6L9PDgj6MpJCfA41sdll5sV
	inZTj/NBSR3wn5RoPW27nwltxz6rGVK4YQ0Z9CBZo1bOu9gdyGLJnEVe3Yy+8CwNgj7wXaWIpuJ
	/YWC6pcfg74T0i2Xjz5ZAeS8vT617Y7Fk
X-Google-Smtp-Source: AGHT+IEZGoGq98Ijbab1SmiHs2tS3qW8FBTqQ1v4FFAbuRCRgb71MOcnfTnqVgiDXIcwenCjplVkJQ==
X-Received: by 2002:a05:6000:26cb:b0:3ca:3206:29f with SMTP id ffacd0b85a97d-3d1de4bc29emr6618252f8f.40.1756738163806;
        Mon, 01 Sep 2025 07:49:23 -0700 (PDT)
Received: from [192.168.20.170] ([93.89.165.28])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45b83f86c8dsm69415965e9.7.2025.09.01.07.49.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 01 Sep 2025 07:49:23 -0700 (PDT)
Message-ID: <587f46d8-598e-4509-bc19-1e6d1b61a624@gmail.com>
Date: Mon, 1 Sep 2025 16:49:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/2] i2c: pxa: fix I2C communication on Armada 3700
Content-Language: hu
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Wolfram Sang <wsa@kernel.org>,
 Wolfram Sang <wsa+renesas@sang-engineering.com>,
 Andi Shyti <andi.shyti@kernel.org>, Russell King
 <rmk+kernel@armlinux.org.uk>, Andrew Lunn <andrew@lunn.ch>,
 Hanna Hawa <hhhawa@amazon.com>, Robert Marko <robert.marko@sartura.hr>,
 Linus Walleij <linus.walleij@linaro.org>, linux-i2c@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org, Imre Kaloz <kaloz@openwrt.org>
References: <20250827-i2c-pxa-fix-i2c-communication-v3-0-052c9b1966a2@gmail.com>
 <aLVle-fEMXlQlDR-@smile.fi.intel.com>
From: Gabor Juhos <j4g8y7@gmail.com>
In-Reply-To: <aLVle-fEMXlQlDR-@smile.fi.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250901_074925_836684_21E616A5 
X-CRM114-Status: GOOD (  15.42  )
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

2025. 09. 01. 11:20 keltezéssel, Andy Shevchenko írta:
> On Wed, Aug 27, 2025 at 07:13:57PM +0200, Gabor Juhos wrote:
>> There is a long standing bug which causes I2C communication not to
>> work on the Armada 3700 based boards. The first patch in the series
>> fixes that regression. The second patch improves recovery to make it
>> more robust which helps to avoid communication problems with certain
>> SFP modules.
> 
>> Changes in v3:
>>   - rebase on tip of i2c/for-current
> 
> Hmm... Why not the i2c/i2c-host branch? (It's Andi's tree)
> 

Simply, because the previous versions of the series were based on that since
they contained a patch for the I2C core code. Additionally, I did not notice
that there is a separate tree for host driver patches.

Although, I could send a new version, but that seems pointless since the i2c-pxa
driver code is the same in both trees currently.

Regards,
Gabor


