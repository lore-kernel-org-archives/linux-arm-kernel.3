Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E3B9CA1010
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  1 Sep 2025 23:12:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0pRhd0lrfXZ0Au0ju0lgUDZOFE95BU2h+YsyN9ySYew=; b=vSdM4M+CLlN+PT9eVvGkIYLUOD
	vzIsFUVbUJkjR9j0JemVtNqvQw2DYSeXw+VIKrL9YuPijdgIq3Gt0G5hW33j7tjD/DpTQchJVaNVD
	HlykgrVDkdI9XUsZAiEb9N5/uwgX2ikS2xBXBDWxHubUaac6KuXnhTmS8ezZkomh9/m5Vmqc9geOt
	MYmvf7YRWO3SKNUYppfJE7LtVkYxpaV/FdMKAY48uqhpg2R2yW4aJKitXs2MsV4RV+7COOozs8UGK
	TfR3el58dyG4PWthKROwEcAveWcum5KwS92GaR6vp+uiRNQWuFeIo8go87Gw8hgtwrEs9yr0yWmJM
	5P/nZEvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utDgx-0000000EDqu-1Xqb;
	Mon, 01 Sep 2025 23:12:03 +0000
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ut6Os-0000000D4hc-149q
	for linux-arm-kernel@lists.infradead.org;
	Mon, 01 Sep 2025 15:24:55 +0000
Received: by mail-wr1-x432.google.com with SMTP id ffacd0b85a97d-3d965477dc0so108550f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 01 Sep 2025 08:24:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756740293; x=1757345093; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=0pRhd0lrfXZ0Au0ju0lgUDZOFE95BU2h+YsyN9ySYew=;
        b=jshl72BdRM4RrEGKBO1+MfbCmb9MP92uY2xWQUP9dFZI03MK3zBsKIetTRStBb4lIW
         9iQXt7MjoRvAg/1dlHMUuKVlv3T03qPaxvFlz2xIOT76nEdJEOgnh855MYp8gk+GqAS0
         RDKIfeefc/QgoRLrYH96/FtJ00tboJ9cepo7SjmDhCVWGQp3DaX+3BKOY45ThN1SsQB4
         zaQkRd2XfRefqA2qRoTA3YQk/v+zCFsZOyX3djH8Vj3+vDPpqu3mmSJeaZaGJstxEu3Y
         SoCtEVHQcXSszRpZg8Uq4jntAQEon/qfoSfah6WdFCxFOrHpprLSbUQwzTwBva+x5upR
         9sjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756740293; x=1757345093;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0pRhd0lrfXZ0Au0ju0lgUDZOFE95BU2h+YsyN9ySYew=;
        b=L0bLszJV2gafraADkM0Hy7ycQClcH+ECiWb6CQacI0zLaYPmmg2LSzUvnYAme8Fpz1
         AkrBU8PsRgjQwksRQ7A3mCnZ+fF2U3hCmlwcbWhEhgWKtDncbYz9C1D3O1IE1uEU6ieB
         uE4kaefYjPACP0Cs1iYk5q2Meqn4dajN6Dm9dHlCBMLAVeat4btlhZLlMCB2YFYi7RqM
         SKufyBZwIQAKlKkfqlhRV1oU58683pPES+XT1z1IknKDvcr2HObJxOgi+4xLmTt+dEXR
         WeLt3bryqI4OVRuPNgfxEo1T6yMnHu4Fqw9X9AIJ6+qS2J+TvXLRtxdBenuygEr6eCR0
         0IKA==
X-Forwarded-Encrypted: i=1; AJvYcCU0TqAm1vn40XBe5k8jHK0GxZq03WHXEYXubuFj1n4FXSEV1gYf6fZi/NbM0AFzes64H/TiH3QCDD8k0FQJmeiU@lists.infradead.org
X-Gm-Message-State: AOJu0YwFBPlQF6rfoGcblapTTCz1r4PBA15iekHumYc6MLfwSYZG/349
	lacwDbK9tga/b6lBvONMk9ZWuNJCBrCSkF449DKJOBj2xfYNuU9mM30F
X-Gm-Gg: ASbGncvOw6yetPP7/LgT9I0htn4ODYpQL+Hb0oErAHKa/yt4W+GYIqZQOs3bU8fK9OC
	sjKlrjveMQ8U+lPgMnuTCc/IgRBPj/EG8vuETus3R3ItB/tzSla2lKQE0kxicq5fHNtPtR/Ss50
	mDhOS0A9Zm36GJApsB4xIv4ntjRDqY0IFuiPJttsXFUewr1HCGdI/oKpQX2rU/cKpU8pyKU9q/v
	hw65LBRI0X7NDgXz7hnlckoHuPjREfhIwhKl0kCAbsPcxXeTeheNyl1XcN2F7H3wINlzuipIM9q
	QMUytBnB0nZv+n0+vo3Ac052VUfwMoX8uQFgX4dgRKotZYrDx2ujOCHN7hk0ZC8YvPR5pdS7vgi
	4kzBXWrPQrldfTfEVD/58+IiMXr5mTKcnaltElQPNYhIrP8mdlTbHZJgtVUCBPYw=
X-Google-Smtp-Source: AGHT+IG8L+Y1WLn5A24obkwlkF84y/HEF0FCpuQZuNbCTNlUmHOEZHatFeXSB2OOW/xfvasSPf+K0g==
X-Received: by 2002:a05:6000:4013:b0:3cb:2049:c743 with SMTP id ffacd0b85a97d-3d1df34f336mr5922864f8f.52.1756740292522;
        Mon, 01 Sep 2025 08:24:52 -0700 (PDT)
Received: from [192.168.20.170] (5D59A51C.catv.pool.telekom.hu. [93.89.165.28])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3cf33fb9cebsm15711441f8f.46.2025.09.01.08.24.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 01 Sep 2025 08:24:52 -0700 (PDT)
Message-ID: <3d3c9d5a-d3a4-4c94-8199-a5870474aa23@gmail.com>
Date: Mon, 1 Sep 2025 17:24:51 +0200
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
 <aLVmKrxEzYgbMUQU@smile.fi.intel.com>
From: Gabor Juhos <j4g8y7@gmail.com>
In-Reply-To: <aLVmKrxEzYgbMUQU@smile.fi.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250901_082454_315537_0AA3FBD9 
X-CRM114-Status: GOOD (  18.23  )
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

2025. 09. 01. 11:23 keltezéssel, Andy Shevchenko írta:
> On Wed, Aug 27, 2025 at 07:13:57PM +0200, Gabor Juhos wrote:
>> There is a long standing bug which causes I2C communication not to
>> work on the Armada 3700 based boards. The first patch in the series
>> fixes that regression. The second patch improves recovery to make it
>> more robust which helps to avoid communication problems with certain
>> SFP modules.
> 
> ...
> 
>>   - remove Imre's tag from the cover letter, and replace his SoB tag to
>>     Reviewed-by in the individual patches
> 
> Note, this can be automated with `b4`.
> 
> 	# Start a new branch of the same base
> 	git checkout -b v3 ...
> 	# Apply last version from the mailing list
> 	b4 am $MESSAGE_ID_OF_v2
> 	# Do actual development of v3
> 	...

As far as I know it can be used only to collect tags offered publicly on the
mailing lists. I can even use 'b4 trailers --update' for that on an existing b4
tracked branch.

However, the current case is a bit different. I have replaced Imre's tag
manually according to our previous discussion [1].

[1] https://lore.kernel.org/all/aJyM3N9T4xI4Xo1G@smile.fi.intel.com/

Regards,
Gabor

