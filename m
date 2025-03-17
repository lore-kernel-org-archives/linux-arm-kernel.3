Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 223CCC282EC
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 Mar 2025 10:28:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Qdm1qAxomHTlqJ31Ysp8XFGoFz7wUaS6yogMNzcGP94=; b=ZWpVCxhb0Mho11Mq70w57eup9g
	osnrkzUJtLc/ijt7nm05T78Mto33ccF4d0kEQdhMmJkZgeji0WL5EX3OC/gwIHu+RNtZgy26UCamv
	lI3rJ+ED9IU8p0SpDcrcRlaJNbGr81pScbiiQhZZS/daQl5eLU/8sqTpjTHLvlSGjG1q5s5NEz4C1
	SJUBc0oxlKjEfjenSoUTYIb+IKZqehUphvBUmT8ygF2p865/8Xkgkp/ImnaJN05Qo/lzv0PllTcBx
	UifaQlaNkIh0XspUdaK3G0901JT/d/X7Xdw+x/uyyvwM0HGMFBE/LB6Oy6sILiLodlUd14pKjN3cW
	QF4eulCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tu7hs-000000029Z6-3S4M;
	Mon, 17 Mar 2025 10:28:28 +0000
Received: from mail-ed1-x536.google.com ([2a00:1450:4864:20::536])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tu7cp-000000027t0-3paf
	for linux-arm-kernel@lists.infradead.org;
	Mon, 17 Mar 2025 10:23:17 +0000
Received: by mail-ed1-x536.google.com with SMTP id 4fb4d7f45d1cf-5e8be1c6ff8so3978450a12.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 17 Mar 2025 03:23:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742206994; x=1742811794; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Qdm1qAxomHTlqJ31Ysp8XFGoFz7wUaS6yogMNzcGP94=;
        b=frmFsE+dhpi0GUJzJyIpPwG4gKLcYYtj3PJvuKtXvi5a1ZbmrL93DrduwWvjauRvmu
         soJdeZcU4TU3geacZmPfte1hcwy7m3I3Fsl+QzOgi8sOToV36+Wpm1kd2LHrd+DPErvm
         /czgqLaaPhDN/RqU+EZKmb8f7OK5c+XZ8kFDkjV1wdzOh5G7VA+YKnxqBQk20kyLIu5V
         ra6o9vFW+lbWM4nEZzQrl5MRQV00eamzjb8jXonGvAKWbietUewfd4OsPsztltImkd2L
         GOHEHMinB0GHdsgne3OgUD/kdkQZJuqM/lcdFd4bzWA86u3v3uiAtQso8EJ8FKnPfu5l
         +pXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742206994; x=1742811794;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Qdm1qAxomHTlqJ31Ysp8XFGoFz7wUaS6yogMNzcGP94=;
        b=AondPr6sBW/6rGBqd8XNUjb9e77X0Dxbu3YDYfsfZ+S020u9Uw6bUwxZqS+YqJ+qeB
         awaqH0lIpGYvJUeU+Ln+ig06ALaSwv311g7e2metCn5Bl8jVlcIWyIiJ7OYxy66vp0G5
         fA2zVD/5jmDFbAWhkv8k2VUfez0RgugKBYoyIlVt3ZpU5GaahwfcRv5KlqcXTkxx1Ghc
         9Up6gDzw1vi1yi+xlR/3aFquDjlfppFUS4QpXvJMIW6nxLZoIzZiHRrTLE49pNHc9laj
         KIFWzfMNXWioL48puywpPyvO/RymjD/DALxOOVgQ5D+76Smym5FiuhLrvHfq2WjACGhH
         II8A==
X-Forwarded-Encrypted: i=1; AJvYcCVNrEJdhnbaSHjDFLq5exCPebTp1qfaHu84LrxV8USu+00GGl8GX7Nr/bjD5Ym7s8h+FTJS68OmTmFdcw49Dx9s@lists.infradead.org
X-Gm-Message-State: AOJu0YzgsYv8x/lRJV4wvmTUCkS+yk4Sw1vsi+/OAsJG3QxaLERzWLnR
	lAkScRLCGtEoUn75OSEWU0iXGikX3MqapfKJfueObNAOLW0eSXBERvzjFNhGEt0=
X-Gm-Gg: ASbGncvPOVfVjqrA9hOUY8QRrcoexeiAhQN/aG3wll/dpZDVn+Pb4XNnqIHs2R39d04
	HX5vin3IcAA+EL4g6r0dUKbhlu7bxarXQKejljyVa2XVED66nBeM5eBBZmgOvLO0SYfFIsz2Znp
	numa7GHV1Jng05Cj93P9wo3iQvp5Kfx0KuZxnyfWkYhmmqA2GyBuvkXRuvKz2oxSOZIo234iriQ
	lfKi1ErRAsjtXYFgAc4rYj+MfXxHaDyOACm/qVWtZ4PpxDPW5/09QLYlCm9eaSSW9+AJCsY5N6N
	0n0d1Gc3OrWu3w0aP3yM/os3aQ+xKYF/kgCakeOWMLv9r0ZalZ7k8uP11RK68QMqxvkTSfnSwIX
	LKadkrJa3y6J9RjaJ82Y=
X-Google-Smtp-Source: AGHT+IHCBMDjgNT3Tdkp1GpOCjRuCJSOXbxDi3KNnxO9K77oOjx1sb8tnp36htT883NnLPExiPbV3A==
X-Received: by 2002:a17:907:6ea9:b0:abf:52e1:2615 with SMTP id a640c23a62f3a-ac3301db85emr1309545066b.7.1742206993695;
        Mon, 17 Mar 2025 03:23:13 -0700 (PDT)
Received: from ?IPV6:2a02:2f04:900a:ff00:eb98:2c37:6a77:39? ([2a02:2f04:900a:ff00:eb98:2c37:6a77:39])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac314a497bbsm647663666b.148.2025.03.17.03.23.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 17 Mar 2025 03:23:12 -0700 (PDT)
Message-ID: <5918c64f-856b-4820-b35b-538ffdd9ac6a@linaro.org>
Date: Mon, 17 Mar 2025 10:23:11 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] firmware: exynos-acpm: fix reading longer results
To: =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>,
 Krzysztof Kozlowski <krzk@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>
Cc: Peter Griffin <peter.griffin@linaro.org>,
 Will McVicker <willmcvicker@google.com>, kernel-team@android.com,
 linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
References: <20250314-acpm-fixes-v1-0-ab03ca8e723f@linaro.org>
 <20250314-acpm-fixes-v1-1-ab03ca8e723f@linaro.org>
Content-Language: en-US
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <20250314-acpm-fixes-v1-1-ab03ca8e723f@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250317_032315_956230_68BB6438 
X-CRM114-Status: GOOD (  16.12  )
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



On 3/14/25 4:40 PM, André Draszik wrote:
> ACPM commands that return more than 8 bytes currently don't work
> correctly, as this driver ignores any such returned bytes.
> 
> This is evident in at least acpm_pmic_bulk_read(), where up to 8
> registers can be read back and those 8 register values are placed
> starting at &xfer->rxd[8].
> 
> The reason is that xfter->rxlen is initialized with the size of a
> pointer (8 bytes), rather than the size of the byte array that pointer
> points to (16 bytes)
> 
> Update the code such that we set the number of bytes expected to be the
> size of the rx buffer.
> 
> Note1: While different commands have different lengths rx buffers, we
> have to specify the same length for all rx buffers since acpm_get_rx()
> assumes they're all the same length.
> 
> Note2: The different commands also have different lengths tx buffers,
> but before switching the code to use the minimum possible length, some
> more testing would have to be done to ensure this works correctly in
> all situations. It seems wiser to just apply this fix here without
> additional logic changes for now.
> 
> Fixes: a88927b534ba ("firmware: add Exynos ACPM protocol driver")
> Signed-off-by: André Draszik <andre.draszik@linaro.org>

Reviewed-by: Tudor Ambarus <tudor.ambarus@linaro.org>

