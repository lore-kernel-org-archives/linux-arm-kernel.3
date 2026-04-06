Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F939EF4EC9
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  6 Apr 2026 09:27:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lEvuDfMbAo9PRGVT3OUpXJy6KBnBXNk7eE9OcVQDjJU=; b=RhWO3tk/KDzJUHfxCoKiJA9QKn
	47d8gJQ//8qid547uSVMtTGNdf2r3XxXVC7E2o0VC0nbW1/24nemPfFy+tZYGksJew2q42CpPTsb9
	HO2gLQetiudYU6NzrUxOTjEdvmbcoQGrmcmGDQoZ4flrGSZdah0r/kkNVMdooNpN60GGuYQlrmuPv
	wfBTC6LdG2El5nBPBQCyDl9YUdVhTkaOK2mg7eRqyhV3FNbg/IxLvqWIoRYolPa5Tb3p7JPCakrRZ
	iI0BGJ0R4P5nkSxWtckSEQs5HaV5FAnpKZ1SJ0zqCiNaPGDUkHzJRPR/7IycckIyLuRJugLh3GTRU
	B6EZ9qlw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w9gEl-00000004xhS-0KVt;
	Mon, 06 Apr 2026 09:27:15 +0000
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w9gEh-00000004xh9-3rYk
	for linux-arm-kernel@lists.infradead.org;
	Mon, 06 Apr 2026 09:27:12 +0000
Received: by mail-wr1-x42f.google.com with SMTP id ffacd0b85a97d-43cf7683a28so2157348f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 06 Apr 2026 02:27:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775467630; x=1776072430; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :sender:from:to:cc:subject:date:message-id:reply-to;
        bh=lEvuDfMbAo9PRGVT3OUpXJy6KBnBXNk7eE9OcVQDjJU=;
        b=F1BKZZutEwbezyhXK4z3zQ3YE7u9xsySj6N4CRBhEpvc4W2/ge2XsHTp6lh0NOpBBQ
         ke0APkk2zdffRZD94hyEXWOGvA5tu3ueROxxtAfNj0QvLMGH7kJkqhI4rZxC9Z8OTiO/
         /9yGS4xVqj0e3VafyuifganjPQx6H/dcwpCOUJESEBA18XEvydvMJkRM3yLDvhQskWGY
         PxIO4cXPrIX024gXsOJPl2cu6fN1fiKDKKCsmlP8Zsve67CYsXzIFEgOhKkl5qMr4hNA
         lx0NzNbLfk5JdBnTJIP1N0MYL4WzUI36ez3saZQdcuK2mxbiESYCTzIAHoCqzifyiufq
         dZqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775467630; x=1776072430;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :sender:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lEvuDfMbAo9PRGVT3OUpXJy6KBnBXNk7eE9OcVQDjJU=;
        b=DMUE3JdhOzYGOzpnJkO4KIWmGfQWZ8MfHGaQHN5oVX6ywRpLxsABAT7tUKa2ds4ZQA
         uUiel2DW86CwHjKBAkckrPwOZQP9JEc1gKH3Mc7eakn6M1+QvQOznSSb19juHmt1JZXd
         9TfaHuQwwFxoQGcOTXCCkqHt6jLL6N8fYy6QuDrhPN1UU8rSpqNH4qwnTJbHosNou6lN
         vCKCf7qsjKDGDqkYiCP0HNu2ZFQTOsZXRJSyw36X+hiQRm7CffQViDs4+7qktD/mYnIL
         b4qFMYfGxePDoZtnvDy8wn+ZojaFgDl7tcpwzN/vL7+8omsgsktZlbuqKcDF5CKF5FlL
         rgEQ==
X-Forwarded-Encrypted: i=1; AJvYcCWtK/wQuMYSQyHZUPy7Du5LgsdvCvqGTifBm53pVWp2Pl/IkD+a/PpbPJb5cnGUdjdMS92dO6N5+wriR8MyTl60@lists.infradead.org
X-Gm-Message-State: AOJu0YxMLpa5aHfU5j4tX6VUygHkvXUjFN+VKgE9Dh7qtH8iLKNpNOt0
	pCDo99c1LBRJnoODWW/tc3qI0y3EchuZZWOQbUFNqiUixXydjTC+l6jA
X-Gm-Gg: AeBDievPM+PyQ2WR5IDeoxiYTDCw0QdiBtDuhfFBh+xti8JrHAiQaju34RNNbpi38kh
	R7XUjGoeo/uCX8AxJMUxi783bWSukEwcuk7P0Gomg7tnqUg8FDpE+d1kbv/FgECNpUI0zoTQU1S
	u31B5B3HgEFt90c9aPOisBAM3Q5eNGIBh5JGnqIeTT/WGilG+oygvBiWISaiUGn4GBI75/TJhT3
	WyKoAB9PTHOc9kkJ1BLqLdn026DptPnSJ/SycnIZBNcXWfHIoos38Op8HewTwiUGRLsvVmwbB3R
	MsU5ZqtCb3fOjGzYum9brx092y84Va88nOp51GpUcmes83UzyFdECe74HV/JGgTXE+0if+00u7l
	3JwWjp4YtN+iDUZj8LBPYxhA4zPWHkXgnC++MsSpENAKOSlTkf6DTMc0wVBd56et/ED5QHsdgT5
	ont6SqWepwjnkz2LNI3SVZOiNYmQ3u4n8pnNOUeKt3CSDOS6Yz86pvWzHzdYqIwWtdKca5TZkf2
	w==
X-Received: by 2002:a05:6000:310a:b0:43b:4212:2ee8 with SMTP id ffacd0b85a97d-43d292cbcd8mr17078806f8f.24.1775467629447;
        Mon, 06 Apr 2026 02:27:09 -0700 (PDT)
Received: from ?IPV6:2001:8a0:e95c:5e00:7c8d:20ac:6645:7b95? ([2001:8a0:e95c:5e00:7c8d:20ac:6645:7b95])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43d1e4f843dsm37655217f8f.37.2026.04.06.02.27.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Apr 2026 02:27:09 -0700 (PDT)
Message-ID: <f914fb50-ffca-49dd-901d-0b0176e5ee93@gmail.com>
Date: Mon, 6 Apr 2026 10:27:07 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] stmmac: cleanup dead dependencies on STMMAC_PLATFORM
 and STMMAC_ETH in Kconfig
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: davem@davemloft.net, peppe.cavallaro@st.com,
 alexandre.torgue@foss.st.com, mcoquelin.stm32@gmail.com,
 linux@armlinux.org.uk, kuba@kernel.org, netdev@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
References: <20260402145858.240231-1-julianbraha@gmail.com>
 <CAMuHMdUfzVSQpadJYpEqPJ_UOBAgswnGzD_bp_U3U6jt2dy0dg@mail.gmail.com>
Content-Language: en-US
From: Julian Braha <julianbraha@gmail.com>
In-Reply-To: <CAMuHMdUfzVSQpadJYpEqPJ_UOBAgswnGzD_bp_U3U6jt2dy0dg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260406_022711_974580_BAA45B43 
X-CRM114-Status: UNSURE (   8.67  )
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

Hi Geert,

With the patch applied, I've attempted to configure the kernel
with STMMAC_PLATFORM=y while STMMAC_ETH=m but menuconfig gives this
error message:
"This feature depends on another which has been configured as a module.
As a result, this feature will be built as a module."

So it looks to me like this patch hasn't actually changed any kconfig
behavior, but let me know if I'm missing something.

Best regards,
Julian Braha

