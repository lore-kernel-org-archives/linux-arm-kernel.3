Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 520631093191
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Mar 2026 09:11:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lnvpWrvuYkXuiKq1OQLuzrMxSlnrYn7ohrRGMt5HMQU=; b=Jg+WF/gowpqwIpwWhru4zWotUJ
	pd1aT8dixaQC5U7k6biii7sogP2DINPTRkmaXo0MDhJ6e3FLLCMBx1R48lDugm3/2gzFNEMHCo7k+
	ecfTgirjA1MH5Wpmh2IhIkgq7WnVl4F9dQSo9i5rLTdqUF+PnEJdDKYbEl8wTkDZcWpMQYyhX9V8P
	7VQU2igrmDg64Iu2esbqo4o3sprsEhM8wV68Ce9c+OSpHuVVn0JmCNykwZhYhFBgW1EwY//2CcLao
	bZylcOdDg7ry9lJZ7bJPe36O4X9BSyOm1IGgyYumDPX3MdHYoFvevhuCazECqWJMXseGOmBVPMU67
	Q+aEMYQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3Vsw-0000000CROW-3e4X;
	Fri, 20 Mar 2026 09:11:14 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3Vsu-0000000CROD-2WQw
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Mar 2026 09:11:13 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-486fd3a577eso3002175e9.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 20 Mar 2026 02:11:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1773997870; x=1774602670; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=lnvpWrvuYkXuiKq1OQLuzrMxSlnrYn7ohrRGMt5HMQU=;
        b=cdiCkBtdVX1KH0Gn62NRDkgPK0T28OxtiL5AZIyXxIIU0bW/9MG34iso7ssv/1bcES
         wLUz5BGj2dRkBXvrQfzo90E8odynlon6Z6lpr4hut1L5pM7Z/D0yODf59XvzEQHcCHk0
         BGTfTExpQPBkj2wMHj4IbtQqJf/x6GKop3WQznmmQRVoQiYyb4bR691U1TiPIwUtHkEI
         DgskOlomTReR8cP8NSu1hO/fYlicCP9ZO2ZaJsNebOhFoRXajaCxEy+JBsu3IAn/Kwm1
         d23XW77OWYssuKRfFbEbyhlVAtwUPBiKbvtMh+bl7lDy48pLxq2CEez90RYnTLH2OnSd
         flgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773997870; x=1774602670;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lnvpWrvuYkXuiKq1OQLuzrMxSlnrYn7ohrRGMt5HMQU=;
        b=UqEtg7/6KPugtQBqDnl1IRxVoVSTh9pxqw1ly/k0xRJMuz/NEizP0bJ/We5uVQmfBW
         ilNV6+wshn4ml/lRGsvUJP1A2MkmcSDAkkhNH9Vw0w2+mCwiiLewUd1Vhl3Hg20wkUUz
         IdHSNN1GRKb/+Wko9HgNlBlOlPnBfjP2u8UdMqRbRJ7uMB4H3EWBx6seMUYYAepOyinS
         VWISiY3qR4rUcchhuaXwtgxTTsXzTPce2/2/jMw9JOqR+pW7aWkPPVfyiepHzSN6/evX
         1Cifug72BwiXee7O/g5ssrwvVLhPk2ghOXd9WvqoHDPSnTEx2QRNhlLJSnrLWWr3McCI
         4OcA==
X-Forwarded-Encrypted: i=1; AJvYcCWeSGc2iw6Lpu41Q0vaM4IyQ+irgdktfSWnYsZId50GurL5422vXgVhSr4T+sA3DuuXfrlK+oJIxFSXAbDK2b3f@lists.infradead.org
X-Gm-Message-State: AOJu0YxgFBF1jrSo1+6swgVDLydKfqt6YdK//AEWRlcg610hGFb7Kn8k
	yTWGmJ4qIMoqojU8NOIWNvTrHKBrDwZ7u6QFm7f3RgTUsv1ZOfanYXTEgm07kbw8HSo=
X-Gm-Gg: ATEYQzw6sIXcEa5ENhteXU/2lnB0gH1K0qowfWGqgo29SmcKr+Y/RkS+RhuUCx1YbYA
	6kQXs71CByAXeSkWSGxqsgbVdhad9B7Y9L1oPlWDtOC0USolV4ihc4KdV4I8xvYKavatcD3GBOG
	X0XKWBoDJfUMF4IA4Fb000e+rkLzoovbiRUxgMeFsBF4nbN35yAT3PFu2Iw9WZWTzb4/qBUxxAd
	eaCdA8MPBM/G4bXPfMbkSFgG5eACI4PwQC1aJsv28prQrgC+tJD9YxGLqNniXJsRvmgk/AvIAtg
	ePVyB2KCghsffYcNFRsXpeZe76X0TkmA3rULGcq0coYwJObg6QseLtgZ3tpcriBOTmAUha4F/4/
	f94XQYbnVB5/X5DuOnbV5vORQK+pa8TUeuvbpBo/ddj64orH8mElIdUTplc1Mhx8luTHTLDsluX
	wk2DuVf0te8SDpUFPxzWyTNlRdMarRHc4=
X-Received: by 2002:a05:600c:1f86:b0:483:1403:c47f with SMTP id 5b1f17b1804b1-486febbc653mr33123025e9.6.1773997870011;
        Fri, 20 Mar 2026 02:11:10 -0700 (PDT)
Received: from [192.168.50.4] ([82.78.167.216])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-486ff118bb4sm18208155e9.2.2026.03.20.02.11.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 20 Mar 2026 02:11:09 -0700 (PDT)
Message-ID: <1f684500-6c06-4abd-984a-4cf889acfcc2@tuxon.dev>
Date: Fri, 20 Mar 2026 11:11:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 0/6] Add support for Microchip LAN969x
To: Robert Marko <robert.marko@sartura.hr>, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, nicolas.ferre@microchip.com,
 alexandre.belloni@bootlin.com, olivia@selenic.com,
 herbert@gondor.apana.org.au, radu_nicolae.pirea@upb.ro,
 richard.genoud@bootlin.com, gregkh@linuxfoundation.org,
 jirislaby@kernel.org, horatiu.vultur@microchip.com,
 Ryan.Wanner@microchip.com, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-crypto@vger.kernel.org, linux-spi@vger.kernel.org,
 linux-serial@vger.kernel.org, daniel.machon@microchip.com
Cc: luka.perkov@sartura.hr
References: <20260302112153.464422-1-robert.marko@sartura.hr>
Content-Language: en-US
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
In-Reply-To: <20260302112153.464422-1-robert.marko@sartura.hr>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260320_021112_722888_FC59EEBC 
X-CRM114-Status: UNSURE (   6.39  )
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



On 3/2/26 13:20, Robert Marko wrote:
> Robert Marko (6):
>    arm64: dts: microchip: add LAN969x clock header file
>    arm64: dts: microchip: add LAN969x support
>    dt-bindings: arm: AT91: document EV23X71A board
>    arm64: dts: microchip: add EV23X71A board

Applied to microchip-dt64, thanks!

