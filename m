Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51D6BD79768
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 31 Jan 2026 10:54:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Kft2vd6sCFHP1Kc6YzTKiQk6KPdEUPeMtNpgXRj7ZmI=; b=uJsLewRH6FwtvNP7Wr5xxLkgst
	+04qLLzSxS2xGPqnLnapAFs57MlEJwo5ZxLQwNKE0pM5kZNqScTjHNBLB8mJmzWGXiJp7xX3ZmFxz
	tUpFV07gh2cEt7IbLC15VutbQdBMlzR+sJKE/CTL8Ht6jzY4bl4tX1vIBLF0c0K4r6ipoLvaTjuSZ
	0h7Xo3zaztTRGT2eiNl1VZ+pQsfs4S6tCUVN+TM3oOv9ZXXhKsjYaKgH6STmVH54puypGYbr7R2F9
	uc0ZkbbBMo8U1JC6f7DrcxCiH20a0Gwaxm1tbf6HWxt4tx3Ja7Zkh0033m9TDQFuoKEKoDA0w45Fb
	p4GSnZSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vm8cb-00000002VXr-2vqq;
	Sat, 31 Jan 2026 10:54:33 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vm8cZ-00000002VXV-1CUS
	for linux-arm-kernel@lists.infradead.org;
	Sat, 31 Jan 2026 10:54:32 +0000
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-47ee07570deso24453105e9.1
        for <linux-arm-kernel@lists.infradead.org>; Sat, 31 Jan 2026 02:54:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1769856869; x=1770461669; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Kft2vd6sCFHP1Kc6YzTKiQk6KPdEUPeMtNpgXRj7ZmI=;
        b=cq/EqKaPHOT1XGyOGSXyEvWvQu0UmtwLkuYmBWM5CZ2iEC9Lr0sR90Mc+9vdXcnKPR
         /mypgvL3UXWyPX2HtnoMqS+UTvSQA46GezAKw1xQpDyIKhfcsVI6tSuV6+h9hPJH87H3
         dI5Awik0PwZe+mjgMP0EahVBcFxjcTJmJFnitrMbb6PjrZUAc/CUoYz+ab4/A6lo54zA
         S9asKyCyjYtwR5CNks4qGD+6QDyFbyXFF2DD/VgB/0QReN4z7Gau1PjfcqsDLCWpkhVd
         2EU083syT/Qclt1m5/QxmComqM5YEcv9l+A4GjFPEKXnwnTeD6Jp7ZsREyVTeiWewuIz
         Y/Fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769856869; x=1770461669;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Kft2vd6sCFHP1Kc6YzTKiQk6KPdEUPeMtNpgXRj7ZmI=;
        b=AlM7H4IM4kmQ4PMdjbYoljJuCYD+GPvRraqa/MSFpaXf9WHV0gcIPSzL24YjMX0T81
         bmlCP8XrDYrbS+i+Fz6BENPzdxd22kBs/oJcOL9yFX3r1NbfapMkZ1rPNP8PpaP4VBzZ
         OKxz1aNSoCRBjMu3ShLKK516BOtfqSlfRFsCsS5x2O4BIFbWRGrOyaLmeBpZYzpJjfNb
         vaJbMHpJnjunfsy7lBNBJRtdTWc/vRnjnC5YAeUrBt8U1wYt94UYae5XF/24NZxiwREP
         CKjTmo9nsEdG2iHKOjggLxBzxw9bKCGpX0S2rjkuFTVLIKy6ITUYxtUBUs+0CN7sxwIF
         HfJQ==
X-Forwarded-Encrypted: i=1; AJvYcCXLEHeJi1LcpzXPfl2X/Hh1Bzd30IYLO+iZPxEN8Nifajk4sndBZYZ+bk9RXn4UzqKegex3l2o17/2ihuhpqT6b@lists.infradead.org
X-Gm-Message-State: AOJu0Yxl1pSEGycguDIDl24wQElllyYLSNcpRWmeFJUHv4683PTIlZkz
	xgGw6wo69FwkerAkONiLgiOv/8gaxIrlEV5rQeROMM/K/Utu6QdfRbttJwXRuduYbhg=
X-Gm-Gg: AZuq6aIpbn/pnLah3QOSNXIVkEqFiVLfM8kynPlh2z6BImNXA9YT01tYZTKPQq+7v12
	AYBIkS6z5eTItOZPI0s8FL2GYcb2vbaJqFpFX1tg/SFFBSO16TGGtYBN5kZP6s6ozvfVd+CAI7+
	nfTasTYkY84YV3YieyJiJApzcmvAoAYXeivo1s2EvqjiG0JEhE/zi5wvItscnX6VJKb1tUAHyYj
	htyGeqh6QjtH+Qr5RSk0E7IN1e4IkNt1ij8NTNCYptdUQ8eCHPnvI9+8s+Xt+MABqhadHmpVFzr
	NGJdfs/pR4rCD/QjwmKr0mg5vS4xmgaVRXTvOBYxb6oJUE2g7MGn9UPbFRgjJ2KqwAx62LQJF2F
	Xe7ca9/37Yq5aAMO7gchQ0z9d7EVweoClIybiO7wLelD5MqY7byYYcpJ6odp7cJTgiuaBcXPPQR
	MEBb4a+25edvtEqCS1MFJrw9o+
X-Received: by 2002:a05:600c:4ec7:b0:47d:586e:2fea with SMTP id 5b1f17b1804b1-482db46b38dmr68726415e9.15.1769856869427;
        Sat, 31 Jan 2026 02:54:29 -0800 (PST)
Received: from [10.100.159.246] ([213.233.108.212])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-435e1354205sm29033129f8f.41.2026.01.31.02.54.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 31 Jan 2026 02:54:28 -0800 (PST)
Message-ID: <09f5ae66-9e38-4733-bdb1-044c41a996a5@tuxon.dev>
Date: Sat, 31 Jan 2026 12:54:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 18/31] clk: at91: clk-i2s-mux: add support for
 parent_data
To: ryan.wanner@microchip.com, mturquette@baylibre.com, sboyd@kernel.org,
 nicolas.ferre@microchip.com, alexandre.belloni@bootlin.com,
 bmasney@redhat.com, alexander.sverdlin@gmail.com,
 varshini.rajendran@microchip.com
Cc: cristian.birsan@microchip.com, balamanikandan.gunasundar@microchip.com,
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <cover.1768512290.git.ryan.wanner@microchip.com>
 <0d5517f708a262924c6aa6f97a23d078891c218a.1768512290.git.ryan.wanner@microchip.com>
Content-Language: en-US
From: claudiu beznea <claudiu.beznea@tuxon.dev>
In-Reply-To: <0d5517f708a262924c6aa6f97a23d078891c218a.1768512290.git.ryan.wanner@microchip.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260131_025431_333357_AC0BADFC 
X-CRM114-Status: UNSURE (   9.76  )
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



On 1/16/26 22:07, ryan.wanner@microchip.com wrote:
> From: Claudiu Beznea<claudiu.beznea@tuxon.dev>
> 
> Add support for parent_data in i2s mux clock driver.
> With this parent-child relation is described with pointers rather
> than strings making registration a bit faster.
> 
> All the SoC based drivers that rely on clk-i2s-mux were adapted
> to the new API change. The switch itself for SoCs will be done
> in subsequent patches.
> 
> Signed-off-by: Claudiu Beznea<claudiu.beznea@tuxon.dev>
> Signed-off-by: Ryan Wanner<Ryan.Wanner@microchip.com>

Reviewed-by: Claudiu Beznea <claudiu.beznea@tuxon.dev>

