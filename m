Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67C2FCAC5B0
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 30 Sep 2025 00:17:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XdEC/q6le7nfUpMwS8QD1mrWIXjjaEQSmDLATI0QjFQ=; b=QFF7FQj9V3yUJGKrD36NS1Oniv
	lX0ubDJpG6ZZr+AlfNuRceiP1Iz3Dg8GUVktu33CO+nK8C1BQ/0iYp4R/xKcu7H10HmZdi1gyXsuQ
	DHFC/bSGLAbAsfgQDZzDZqn85ZmllZnVHjvy7ryRGwFmv/sH7YODUMPivjWYjDg84ZCb/6DBjSi/d
	TSH7RO6Or55CAXO9k/HH1wn9/9epg71QH07MTJqEgy58Lg9QvjMktsnL5h9tnLZf1fcioaoQQI2c1
	k8nqKl7X8B5nM2O89Fvcj/36GP6jfWOAUIz7lh797WSllb2vi02vAz2GnZxruQuP8qHv1sWwEldeM
	g+RO8rEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3O3b-00000003fS9-2MN9;
	Tue, 30 Sep 2025 00:17:27 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3O3X-00000003fRA-3DsY
	for linux-arm-kernel@lists.infradead.org;
	Tue, 30 Sep 2025 00:17:25 +0000
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-46e504975dbso14556785e9.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 29 Sep 2025 17:17:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1759191441; x=1759796241; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=XdEC/q6le7nfUpMwS8QD1mrWIXjjaEQSmDLATI0QjFQ=;
        b=Mp0PCrgGNE6dMWm9p3Xmy4jl9RfRUN7ahNQDExVUYbzubD2nox1FB3lQ6RSD04rVxg
         mZ5FlYV37czSZg1FpZ+Pi+W+UL2lhNHByTmc05CbU0Ks4JRC0/LxVr4MM/m7OhhM4jj4
         zT6PdJLu1S8vt5pmlRPhKDa+5yLGmZj2G27skAdqz1gt7khAcg70a+OzdfW3n9Bo+cJZ
         DU3s0Ui9kSD6Tk1fuF3vGaYPNrwrzSLokFDV0Xeq7XKZgbDJBfeEaXL5+fVXq0eJb9cU
         kv1EdQbqfiGc30MKH/5tt20a+nbaapvheVPl+fl62HtWTw0AJ7wGZuOMcg+aQKBBUox6
         S4+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759191441; x=1759796241;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=XdEC/q6le7nfUpMwS8QD1mrWIXjjaEQSmDLATI0QjFQ=;
        b=pbS9d5GuzGOAVpf7GKZqA76xpkAWdfrmjkkbJgLaT36ovYlugGkO+JEzlmDvgtb7uS
         Io4ZiEqdIT8zuaQabe7C6I9fgsTDbPArLLlndtHHJ7J3MJk+kHpTWqzeoZjjFuN3Wzwl
         Ii+iLd3diAOzollP6sSw2q6m2yNAL95uNewskt/oQGtqGcvLMluWujIWXCK3ct8WaL+E
         uY88YACSvjgswsBHnhhPvjtNfM2kDU9XbYcDU54qCkTRO3SybL2tfAk350U3pSfbUSKT
         fzKaJSwaH+6izFqgOWDwFvw4//PML39bulpGUDRNU8m5Q6pSMHTYjzGNNpMlBpGmtP31
         1Ncw==
X-Forwarded-Encrypted: i=1; AJvYcCUP2WzIXY1rFhQXRuSTvlTsT1g5iypCUIdW6/t8WaPV/gE/HYl3WqQzISYK6JQQ41gFbqJkE2Xp7UP4nbyILpxt@lists.infradead.org
X-Gm-Message-State: AOJu0Ywh6NRw299zpJ/k3Yt7Tl7p6Rqf9Q6jV1ldvSYPAcLHlyLHlLHC
	ld+myr9ps6emR8yrImUDgSpCK90lRHRVBKxFgKQZZfGG8wErWv3HS2EyUv8xviqcbQ8=
X-Gm-Gg: ASbGnctX0W91esT/bxHUeXk7F6KVFq32XLjPb51YzIwH12OvafMgq5NPVn81faa6e83
	JiPdU3ZZW6jqzJ7Qa3p+cOSJYpEQGmEK5Bqc7FhkvIufOhe+zsKFK5eIA9pTgcOG00AxpGtAMaf
	E/Y2R73LsuYKjE12cCqGG6B3AZEqxFT+pm9a2Z6CC1Be/BaJ3mRAmm6u2Vk5PK6NMnYhn7q2d5A
	4JqyHoYRUYAW9XetZY74YSVVrU6Xc6+QZOYd7VWbSE5T95lklgHeABPo3ToL1/IlPBIdhZxc5ky
	E+Hx00ORE+kMCtWVdsKD8qE8EbkNu473cnify/BHT1NXyiWwZcaaWBuK8f+f1s0qgnBj98OcpGJ
	aiYwG6RiLXDIIp5ObDFsw0nn5MFf+joQQb2Cfxdl/oLNhfIfTTxvpSHHF25WkRTrOO809zDNco5
	i9MO++L6/ncBGXcFgOnd0aPFhr57/gw+E=
X-Google-Smtp-Source: AGHT+IF1NvJ6A8YUVxkdRJkfeGyVldxLeh1qdvb50sqvC4KYOgmP95PhemeRL1E+WA4Xb6qkHy3wsw==
X-Received: by 2002:a05:600c:1d06:b0:45b:9912:9f30 with SMTP id 5b1f17b1804b1-46e329a0d0amr156323085e9.6.1759191439753;
        Mon, 29 Sep 2025 17:17:19 -0700 (PDT)
Received: from [192.168.0.19] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-46e2a996e2fsm266744585e9.2.2025.09.29.17.17.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 29 Sep 2025 17:17:19 -0700 (PDT)
Message-ID: <3594bbc8-b063-4472-a294-117582f063dd@linaro.org>
Date: Tue, 30 Sep 2025 01:17:17 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v11 03/17] media: dt-bindings: add rockchip px30 vip
To: michael.riesch@collabora.com, Mehdi Djait <mehdi.djait@linux.intel.com>,
 Maxime Chevallier <maxime.chevallier@bootlin.com>,
 =?UTF-8?Q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Gerald Loacker <gerald.loacker@wolfvision.net>,
 Markus Elfring <Markus.Elfring@web.de>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring
 <robh+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>,
 Kever Yang <kever.yang@rock-chips.com>,
 Nicolas Dufresne <nicolas.dufresne@collabora.com>,
 Sebastian Reichel <sebastian.reichel@collabora.com>,
 Collabora Kernel Team <kernel@collabora.com>,
 Paul Kocialkowski <paulk@sys-base.io>,
 Alexander Shiyan <eagle.alexander923@gmail.com>,
 Val Packett <val@packett.cool>, Rob Herring <robh@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, Mehdi Djait <mehdi.djait@bootlin.com>
References: <20240220-rk3568-vicap-v11-0-af0eada54e5d@collabora.com>
 <20240220-rk3568-vicap-v11-3-af0eada54e5d@collabora.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-US
In-Reply-To: <20240220-rk3568-vicap-v11-3-af0eada54e5d@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250929_171724_009079_42DD6CCB 
X-CRM114-Status: UNSURE (   7.62  )
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

On 17/09/2025 16:38, Michael Riesch via B4 Relay wrote:
> +                enum: [5, 6]

Not required but nice to have is a comment like:

enum:
   - 5 # MEDIA_BUS_TYPE_PARALLEL
   - 6 # MEDIA_BUS_TYPE_BT656

Just for the sake of a reviewer.

Either way

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

