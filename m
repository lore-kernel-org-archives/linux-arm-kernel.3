Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A70BCD5BD1
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  1 Jun 2026 06:49:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pGxbL9faVDVgrvfQsBar+KVqQ+FJr+nh53Wa1vgTsOQ=; b=H53Q+MmOz5iIBkAXdZ8s3n3PzT
	go/Z5BglUeAEWMRQ9EiE58JP0tPE1/Kh5h5dmgOLPF78mJ17GM5k6nh0nyGJYAFA6Y49yepXG1LdA
	m3INrad++nPi2qtoNeghBWjQ9m07wem0V0FEKdhLq0d/vSOv94XR6+ZiGr0dR3UISDP32yw3qJlxA
	QKWrNPpyyJdfO2vWKxfTnUC+cDdSlg0YyecA7gQsWu/Fh+EPxBdCag1FR4SC0rvkGuHANKsJLrOcF
	aMDZRPNhsN4dZl0Lej5hke654ykibvOCCz14BufMyllSTtu/dhMBpc2zpkYCny703YnHm9WduJgvV
	AGdP9QNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wTwSP-0000000AEJm-41UZ;
	Mon, 01 Jun 2026 06:49:05 +0000
Received: from mail-lj1-x22f.google.com ([2a00:1450:4864:20::22f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wTwSN-0000000AEIt-0DqM
	for linux-arm-kernel@lists.infradead.org;
	Mon, 01 Jun 2026 06:49:04 +0000
Received: by mail-lj1-x22f.google.com with SMTP id 38308e7fff4ca-39677242021so9969141fa.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 31 May 2026 23:49:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780296541; x=1780901341; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=pGxbL9faVDVgrvfQsBar+KVqQ+FJr+nh53Wa1vgTsOQ=;
        b=Hjyt1ZCeRCMed90zRoUthEntF26gW6CEcgOVWGMEf/iz7m5+QUB6jTA2+aUe3DB3rG
         S1ZI+QmVvBg/KgZ/qdW3mbgUN1z03uj7V5vKH56sar2makEAvQ4CyCz9IeVxDVOwFZz+
         +sHJ/qOI4hVYIKVGxUD3RFgPrCedUIV2z3ugtyz8jIZRnqAiVNMN/1SB1bsdq1JUtqk5
         dwKf0b0LdPbngEkBQ461KDXUHzeaR/DeC4tsnpsdgHcLl7SkeZn2cq2+m9PO3lU40t2H
         wys0zXj6Hnh/bFCFim3tcdBQk5itxiu15zcntMyJWGhcVh2cJ/eZncETVgB2FVMtDdvB
         CrdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780296541; x=1780901341;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pGxbL9faVDVgrvfQsBar+KVqQ+FJr+nh53Wa1vgTsOQ=;
        b=Ayj/dbw8wiB45FZjdXdL/tX9ZzxcdOriORlvY41prx0W6HSiVUTr8m/OsjGVTZ0502
         PdBHdTcC1p6BleJjotb0jMKiVKiIw65KkrhyCqxcvANZa9+ylMZS75hzZ7tvtRSF2fNu
         zvxi/sZ9ymqLIGiUQu1FHoiOQi0wq2qpVbV+uj+n3e4GlSIdPxx5Casoub8TJ60ywPva
         u2DVJMOtkUL9EEmNVAq+/Kra8ngv/hf+w0ApOHkcxGvvQUXaymdwdBgKjkbjn+d3C1F3
         3SClyNzu9iajFkMTiq5b749wlZHFhcWVurb8zq9HP70pXD2nS+hdeQWRJi+e+zHFKVaq
         Ld8w==
X-Forwarded-Encrypted: i=1; AFNElJ/oIFd8SzN4QlUiJOQ1aPAWSRbtMwqS0d5rbfh821gCDRiQ7wqOhhs4iP7AfjWRYudNChkODK2LjtXCr57pGQC3@lists.infradead.org
X-Gm-Message-State: AOJu0YxUy9qB+4UXWIccO9Bdb/vhPkrT6kFg5lX9QhB8smu/aa/1WPTF
	fWWOaMZYW0b80+amJkOlDpGvJZ2yIO9ClGd3vWCa6mrJbmcQ3QmBo0ic
X-Gm-Gg: Acq92OHVYAb8+spX+BIslWtXgQRGDb31Pkn5tJPQO/azdL1jiW895Sj2Xa1cpo7Daw+
	5DNOlzMOT8sJRrD72oElc7zPM6agDXV/XfKrFUAlwwxlfqoaSjm+YD65KHNMHKRntaPinF2RCAH
	XDC6DuEWPEC8vc+LBwhzF1UfRYfrMeX86h95ITIA+lvwCdVLaMOIMQr/b5fog0Ug7Xj8Kg1W1wL
	TJm0oSaJeNw8xBANUIfpaTSFCBY3KMk7Ot7owIGtk+Yn/ljxbqzMR3kadLmYDGLhwWeRNORya6p
	JUISPkTjxVaOUk4Ac9V6hHVwSP1W22VbKKqabCwEcxV0ixZAidlS7RPWKNLRUTwfD9Hb1EGLf2q
	JaOGyo93KnUymTl973Ff1u5OvOyqWsbjvmijkGKCX41/KqlpWcTjJhrSZGotAvdU5p7hqC0I+MB
	uUF/lYB3VdcK1T+KZ8ocSHDvd/Ckha464OYj5N4blRDewl+1lQSXxMQdexQxzv4FbSF3qi9jCqw
	b6wcdjEzj9h/8H6MJc=
X-Received: by 2002:a05:6512:2306:b0:5a3:f25f:cc30 with SMTP id 2adb3069b0e04-5aa60a32f56mr3289885e87.32.1780296540285;
        Sun, 31 May 2026 23:49:00 -0700 (PDT)
Received: from ?IPV6:2a10:a5c0:800d:dd00:8fdf:935a:2c85:d703? ([2a10:a5c0:800d:dd00:8fdf:935a:2c85:d703])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aa5b793e24sm1898970e87.73.2026.05.31.23.48.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 31 May 2026 23:48:59 -0700 (PDT)
Message-ID: <b509c623-a47f-4216-9202-2c542f3c2e7b@gmail.com>
Date: Mon, 1 Jun 2026 09:48:58 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 4/6] power: Use named initializers for
 platform_device_id arrays
To: =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig_=28The_Capable_Hub=29?=
 <u.kleine-koenig@baylibre.com>, Sebastian Reichel <sre@kernel.org>
Cc: Yixun Lan <dlan@kernel.org>, Andreas Kemnade <andreas@kemnade.info>,
 Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>,
 Neal Gompa <neal@gompa.dev>, Amit Sunil Dhamne <amitsd@google.com>,
 Samuel Kayode <samkay014@gmail.com>, linux-pm@vger.kernel.org,
 linux-riscv@lists.infradead.org, spacemit@lists.linux.dev,
 linux-kernel@vger.kernel.org, asahi@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev
References: <cover.1780048925.git.u.kleine-koenig@baylibre.com>
 <1ceacf4f9c3f827bcad85b378aa04cdca1c04635.1780048925.git.u.kleine-koenig@baylibre.com>
Content-Language: en-US, en-AU, en-GB, en-BW
From: Matti Vaittinen <mazziesaccount@gmail.com>
In-Reply-To: <1ceacf4f9c3f827bcad85b378aa04cdca1c04635.1780048925.git.u.kleine-koenig@baylibre.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260531_234903_110533_038E081B 
X-CRM114-Status: UNSURE (   8.33  )
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

On 29/05/2026 13:18, Uwe Kleine-König (The Capable Hub) wrote:
> Named initializers are better readable and more robust to changes of the
> struct definition. This robustness is relevant for a planned change to
> struct platform_device_id replacing .driver_data by an anonymous union.
> 
> While touching these arrays unify spacing and usage of commas.
> 
> Signed-off-by: Uwe Kleine-König (The Capable Hub) <u.kleine-koenig@baylibre.com>

Reviewed-by: Matti Vaittinen <mazziesaccount@gmail.com>

Yours,
	-- Matti

-- 
Matti Vaittinen
Linux kernel developer at ROHM Semiconductors
Oulu Finland

~~ When things go utterly wrong vim users can always type :help! ~~

