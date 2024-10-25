Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 659DED149E8
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Oct 2024 20:05:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lSsZDvEhOeZyn9VaJIiTtvyjKgumKCFxoFXoQeta2sM=; b=nfH4nvsdhUpzfuM927tV3I2H5R
	PlSzjQ8WqDvkv4bm7pmX5nuvHP+NoQeow5lHxK3yjUqxgCslbwhkCj+B65ux9/InM8gNBIG8+evjr
	Oytu/VtseUhDL/ODUI0uAeroPcvkrc692yMfaMe48yfAWumDuJ2wnFead+nzwaMc3fGnlCP3g69EK
	04Y8TMQlOqsAKgqOH1Q/igwqd2ZuFFEv5G5YvMD6hk23SxPhcSS6cap5jVPf1UiSrTwLYDuMTGFQt
	VY9hUcriSjrKmpOxDwzj0KoXPm4nUDTCmCbmo6wTINfu6O8qJ05hof5PwDe+C3+Zz5EbzEEcTNc2l
	oeWi0XeA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t4QYK-0000000545F-37rJ;
	Fri, 25 Oct 2024 20:04:56 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t4QE2-000000051rL-2Utp
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 25 Oct 2024 19:43:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=lSsZDvEhOeZyn9VaJIiTtvyjKgumKCFxoFXoQeta2sM=; b=oN8DzPjrhRozlhjsD5SxBTc1Q6
	9ImaeygfqvG4uVzNft1kLbFAr6xPvbcfH0YMvpSdnnhabJeaiEoMG55u+i7VBAZ3AJM/ps7vR+nCZ
	8BbhofjCAhefPk/ymfZ+x/BVl7xCpTmz0xw/iQ9I9K+Ba8609H0qv9UAGxUn3OzRYHjZqx0F+ETRW
	CbmRgkSJqYgmb8igb2yup9GgUoTlO/2XPLgAMpi44yaaivTxLCoA6s5MFiVWMknuB/AjVCu1j4Kom
	rdqCQn5JKIFi4pT99bfewQGSdPA4n7FmXYE48ekvi7UreJ+++KXELrrrw9UIJ5QeNxo9krQb1bcFh
	yP9rFY+g==;
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t4QDm-000000093PH-337V
	for linux-arm-kernel@lists.infradead.org;
	Fri, 25 Oct 2024 19:43:49 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-43161e7bb25so22798775e9.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 25 Oct 2024 12:43:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1729885420; x=1730490220; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=lSsZDvEhOeZyn9VaJIiTtvyjKgumKCFxoFXoQeta2sM=;
        b=erF6+RMwpGBg5K7/ePCAJ20a0G8KFg0kjUeqdBlo6Bf1Zn8faNPNae0lBUKJ6vyWgU
         IHZQSggDaa1YMUbFjp9dz2iTYP8jxEk0UinkKiNBou+vgYWj1iHp6WrI68FLVzRtKkM3
         0Vl8v8OHIrT7iQeJODh290m1OeXuFAWBB6/MSXYsto/zqZmsh2CeR+2fU+s3+exnQvw/
         HH81L6crUXnjD2N6Ga97zyzTK89yjnT8HXmbPIwsHhiAoCZ44E31wFFteUxopbsFzhH+
         8z6NpHdXJlgaxu1D7277iHNhwcLMV0OTQa1c23h1CdbGEwm9bgNs6JFk30Kc3+V45iLd
         jd4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729885420; x=1730490220;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=lSsZDvEhOeZyn9VaJIiTtvyjKgumKCFxoFXoQeta2sM=;
        b=jpRaK9M/4IUOk+ysK8b0Se0W6wuafXx1MCTn+oO/XTB0fzrdSJj6NFmM3AB/nMugh9
         rPZed5vCFrbvCTisr6e8U5ftoXf1R8Kn65mkr4scHXo7tnGBU4ObtY4xaAONcj/oFVoD
         kXt+Mb+MzgVNFhxqn2BmdKHISLC9OBZ6uimLhbq/8LDhUpzIy5TSbdp/4Suudk1Sj8Ty
         CBTZ/byAJiNy8sC8hSBN9HaGTBS6tdJh3lQ7cgnjCm38rGOoYV97nmfe1Jao8A6ytBvA
         vkNgVAjARldBrOJpEUFElHS0juGJ1EE8Wp62wOeMXd8nUZNqVRDSvewGotui/Id2TD9y
         vHeA==
X-Forwarded-Encrypted: i=1; AJvYcCUpkLZIMNO3fQMKmWPCbSxMa+6tlYgP4g9jRCpqoo7QMkMvQfovIbBtco4iTlPJGL2RBHMeDQ8By6ylNoRhszdt@lists.infradead.org
X-Gm-Message-State: AOJu0Yxz7/w7lFjbAVzi4qXY6DXicBBFBtZ/Wj9f1i5Jq3aZDppnF5gK
	2CYxILkuBTfQ9xdstSe3T0a29FvNP16s7Q6jVkwyFIQ7Opqgg9MqaqY0NiorNj0=
X-Google-Smtp-Source: AGHT+IEzPuLj09sW3XJSXTYzYRkCzcdUHuV5hctMILxMB/GePRDvwaT9iOwJTJZ47PpX92GjYN8nCA==
X-Received: by 2002:a05:600c:4f51:b0:431:59b2:f0d1 with SMTP id 5b1f17b1804b1-4319ac6fd9dmr2332175e9.4.1729885420036;
        Fri, 25 Oct 2024 12:43:40 -0700 (PDT)
Received: from [192.168.0.40] ([176.61.106.227])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4318b5430absm56939735e9.6.2024.10.25.12.43.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 25 Oct 2024 12:43:39 -0700 (PDT)
Message-ID: <94eca595-6ac2-40cf-9437-cb6695c45344@linaro.org>
Date: Fri, 25 Oct 2024 20:43:38 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] media: dt-bindings: Remove assigned-clock-* from
 various schema
To: Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 Sakari Ailus <sakari.ailus@linux.intel.com>, Shawn Guo
 <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Martin Kepplinger <martink@posteo.de>,
 Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
 "Paul J. Murphy" <paul.j.murphy@intel.com>,
 Daniele Alessandrelli <daniele.alessandrelli@intel.com>,
 Tommaso Merciai <tomm.merciai@gmail.com>,
 Martin Hecht <martin.hecht@avnet.eu>, Zhi Mao <zhi.mao@mediatek.com>,
 Alain Volmat <alain.volmat@foss.st.com>,
 Mikhail Rudenko <mike.rudenko@gmail.com>,
 Ricardo Ribalda <ribalda@kernel.org>,
 Kieran Bingham <kieran.bingham@ideasonboard.com>,
 Umang Jain <umang.jain@ideasonboard.com>,
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Dongchun Zhu <dongchun.zhu@mediatek.com>,
 Quentin Schulz <quentin.schulz@theobroma-systems.com>,
 Todor Tomov <todor.too@gmail.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
References: <20241025-b4-linux-next-202041004-i2c-media-yaml-fixes-v2-1-1b4535174a5a@linaro.org>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20241025-b4-linux-next-202041004-i2c-media-yaml-fixes-v2-1-1b4535174a5a@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241025_204347_678563_3B325438 
X-CRM114-Status: UNSURE (   7.24  )
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

On 25/10/2024 17:21, Bryan O'Donoghue wrote:
> Remove extraneous assigned-clock* from media/i2c/* schemas, retain in the
> relevant examples.

Ah, pardon me.

I've neglected to update the commit log.

https://lore.kernel.org/all/20241012172430.GB5212@pendragon.ideasonboard.com/

I will send a V3 to make it so.

---
bod



