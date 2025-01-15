Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 086D0C02180
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Jan 2025 17:55:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=is/Az9xGToTsuvQhxSyLFLcXvYqhkADF/5ojbpYHtBU=; b=c5Hy7eoko66L2hJNZFLhWjnqTr
	lPlwS1jXu7gW6OgGrIOgv6UXBemut6EFyvzWnLPPNyp+hbUTiIW7K69ckUoznG9JPm2HFo0XIm1Un
	0KZq7h4406PKPDLIyrSec+oBQKYBUkF+6+4Fqad3I9mMteww2LwGT00gIUgtvYKyxxXyHSLHm5Idb
	fI9EbreKno86TeTOPle/GpUCp4cZNshRo0sBYVOwLRbUadjSSuurgrLzrjxacowCMKAUuYMhYm6mZ
	AerZIGnq5apbLfv4n/7vixnCvBELQQTDBvTDmtnryvkweR20Prb2U3V0HJwIE+2YvXq6Mp6La38HY
	a6p7PMtg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tY7bw-0000000CghE-2bXv;
	Wed, 15 Jan 2025 17:55:24 +0000
Received: from 009.lax.mailroute.net ([199.89.1.12])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tY7aL-0000000Cg0E-0I1K;
	Wed, 15 Jan 2025 17:53:46 +0000
Received: from localhost (localhost [127.0.0.1])
	by 009.lax.mailroute.net (Postfix) with ESMTP id 4YYDBc2k4gzlgMVW;
	Wed, 15 Jan 2025 17:53:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=acm.org; h=
	content-transfer-encoding:content-type:content-type:in-reply-to
	:from:from:content-language:references:subject:subject
	:user-agent:mime-version:date:date:message-id:received:received;
	 s=mr01; t=1736963619; x=1739555620; bh=is/Az9xGToTsuvQhxSyLFLcX
	vYqhkADF/5ojbpYHtBU=; b=Ng1loLEuc/xiqIXDqAxKT0RhMLuNdkB/9Ztk1mYg
	n0Izfs2wFJeOI8t6HeumaGvHR/ZMQ57s34/kmp5CKve9jiZp7LxOGsqpgxBeAhDc
	gXuzQ1VptPRYXKa7lq52Du9YpK6NchNqwhDtNWkSiUqJb0L2jPYugDgXrHXczv1z
	KDrO4ji9MW/EE86h8Ak0ao3rSqvuiQ1XOTqcTPrXCeGWzqCELR0he/gxxjZLvVft
	AHK/62cFZEUlRWvl/XjzCki6DA5xIwSl5vsxvV+Zfv7DENIOUaBrpfGqAMIaqZ87
	9vKHr2cJ9RSbkMewHkPgVzOYKtVxHNQTE1Ha5y9hyLALPw==
X-Virus-Scanned: by MailRoute
Received: from 009.lax.mailroute.net ([127.0.0.1])
 by localhost (009.lax [127.0.0.1]) (mroute_mailscanner, port 10029) with LMTP
 id 0lmg9n-RFN6D; Wed, 15 Jan 2025 17:53:39 +0000 (UTC)
Received: from [100.66.154.22] (unknown [104.135.204.82])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: bvanassche@acm.org)
	by 009.lax.mailroute.net (Postfix) with ESMTPSA id 4YYDBR19J1zlgT1M;
	Wed, 15 Jan 2025 17:53:34 +0000 (UTC)
Message-ID: <ca5482da-1612-4fab-bfeb-bdc72cd65662@acm.org>
Date: Wed, 15 Jan 2025 09:53:33 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ufs: Use str_enable_disable-like helpers
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Alim Akhtar <alim.akhtar@samsung.com>, Avri Altman <avri.altman@wdc.com>,
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
 "Martin K. Petersen" <martin.petersen@oracle.com>,
 Peter Wang <peter.wang@mediatek.com>, Stanley Jhu <chu.stanley@gmail.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 linux-scsi@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org
References: <20250114200716.969457-1-krzysztof.kozlowski@linaro.org>
Content-Language: en-US
From: Bart Van Assche <bvanassche@acm.org>
In-Reply-To: <20250114200716.969457-1-krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250115_095345_133091_B4D6A298 
X-CRM114-Status: UNSURE (   9.33  )
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

On 1/14/25 12:07 PM, Krzysztof Kozlowski wrote:
> 2. Is slightly shorter thus also easier to read.

Does this change really make code easier to read? It forces readers
of the code to look up a function definition. Isn't there a general
preference in the Linux kernel to inline function definitions if the
function body is shorter than or close to the length of the function
name? I'm referring to functions like this one:

static inline const char *str_up_down(bool v)
{
	return v ? "up" : "down";
}

Bart.

