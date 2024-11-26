Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09171D65543
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 26 Nov 2024 18:27:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pGO4VEjmMCTpy6yKK70GikOB6XhW54AbxXkx7kdm35k=; b=lf95xIX0MNtLOq1gOTBc2cWLid
	LspcA7RfuJx/YhiQo6pMo5w3RRMCBfcCEgigvZquqsW+2kiH5hBgJEIt7VjxcGvD+Jtv7FCZuTHtt
	v1l05PrS21hxZDxIjx3ySuq/1GRpnufh+RGiEl86/BjHXCEACGuztYwG/JF30IgbnOlNjsyk5rTx/
	n+EqFB9e1paca7YcnDAz9glOauFEE0LM8Zlf0vLH2btlwt+9yd7GyVQ5PX5evs9lGMolicljXtYJH
	2jzJSidKpUrBER0fTBJJ3m6AKpD2KYTbXWHBfgWOFXKvD+Ac923P7Gqb+5tMZQr0pjHD6NsmPNa9x
	NOzYBinQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tG0H4-0000000BQgS-1QUV;
	Tue, 26 Nov 2024 18:26:58 +0000
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tG0G5-0000000BQVF-46wX
	for linux-arm-kernel@lists.infradead.org;
	Tue, 26 Nov 2024 18:25:59 +0000
Received: by mail-pf1-x42f.google.com with SMTP id d2e1a72fcca58-724fee568aaso3048644b3a.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 26 Nov 2024 10:25:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1732645555; x=1733250355; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=pGO4VEjmMCTpy6yKK70GikOB6XhW54AbxXkx7kdm35k=;
        b=E3ot89GzAZQD9konIlL5665hE92UNmoghN5AU5XBFxv4cEzM5Koawh/Tt2O/sAnvN3
         md6i4okxknl7hbfbCidqXfNw6JOsPsUZz+shqNCGild3lS5ZRZ2l7FgBOjJfSaxAVCPP
         qMj75zXjUCuakWvuHibA61GepG382ZYQYnSEGgKEBC6dFa6ZsK3gsE+Uubj4rglM1YwX
         tzFeeLtOoappivipdW+LBJ1HmC4vS+oAgQrqlYkcFzBFBE3UPK3NmACbqiQEfI05ejSc
         AQ7u0CIB98ypOK9i7zdWPdBaJVUxy14zmnjbZfkyWaWC5MLon/rYmUZLhHOsWgDaBnCm
         rwOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732645555; x=1733250355;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=pGO4VEjmMCTpy6yKK70GikOB6XhW54AbxXkx7kdm35k=;
        b=I449+1P5xaA5YCmKzTzCmWfJ3zrxeSiZeBDCLhLlmq942h2jIZq1srOVtYjhLCr5EZ
         h+FJh9RqiD6LQGwYe0RJvKGfiXQD9uCChRZgC/akVYoaxj3M6+0uw3qBWNiTl5HQz2wh
         jZe+Ja9AbaHzjrc7vXOuuYlp5I1crFcI5bftKp8Xo0O+jrSOSckvPWLwIIw3CoDnqypA
         GgoEqRfdg7tS+FnGcDn+2EbVXq87xl0DF47r3vliYzMQdVlxDF1t6YC1O8wMyImL1zK3
         MuYHMPMxiFxQUd5u5akGThja+RLo2zvrNkX8teNn7qvctbCL7cN5YnL0AXARfxwN0uUG
         3mJg==
X-Gm-Message-State: AOJu0YxgloIwtQkWZV2tdktB5tJFtepE/CKDSoaxs+LVonxhK8J7uep/
	kzzost5QH3n9rI54wnQZrA1bn5bVSb1p/vBnMLaPvfB0v0/21JRq
X-Gm-Gg: ASbGncuj39Sk4z0A3ZYddnwIo3j9jfPzl1t/CMbYsHyCdVi3BpOMEx4sbH9K9fgZepC
	4O9yNQqKLbj4bGl2EKoZoZtw6CJqx4jz5VwYQFIKIJ9MMOzWweTo2hqgKAvm9KhOwkvxGAL43O0
	yOF47FuyP7Ja6i+ta2QlT1gtHgX5oOpk+WCJBBbcqu67OEi7twWxkGMCfH31VOEEdGBA69Pc9YG
	7EfCFm8qSSbs6yu5jGFD3H2K/yhSKFFTFQ6UDS/rsbAf7XrTgrPl2twig==
X-Google-Smtp-Source: AGHT+IGIW8YWKhxplj7PnOWubg8KaT/VQiw22cMgLmX8nunNS6CMBCZlxtxFLFqpa21jqQ2K9VRpzA==
X-Received: by 2002:a05:6a00:3d52:b0:71e:cb5:2219 with SMTP id d2e1a72fcca58-7253004b06bmr165886b3a.9.1732645555470;
        Tue, 26 Nov 2024 10:25:55 -0800 (PST)
Received: from [192.168.0.122] ([59.188.211.160])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-724de531b50sm8971221b3a.101.2024.11.26.10.25.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 26 Nov 2024 10:25:55 -0800 (PST)
Message-ID: <e0f78e42-6454-4855-9004-05d90ba6895f@gmail.com>
Date: Wed, 27 Nov 2024 02:25:49 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/5] dt-bindings: display: Add Apple pre-DCP display
 controller bindings
To: fnkl.kernel@gmail.com, Hector Martin <marcan@marcan.st>,
 Sven Peter <sven@svenpeter.dev>, Alyssa Rosenzweig <alyssa@rosenzweig.io>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, asahi@lists.linux.dev
Cc: linux-arm-kernel@lists.infradead.org, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20241126-adpdrm-v2-0-c90485336c09@gmail.com>
 <20241126-adpdrm-v2-1-c90485336c09@gmail.com>
Content-Language: en-MW
From: Nick Chan <towinchenmi@gmail.com>
In-Reply-To: <20241126-adpdrm-v2-1-c90485336c09@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241126_102558_023541_5DE868D6 
X-CRM114-Status: UNSURE (   9.46  )
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



On 27/11/2024 00:34, Sasha Finkelstein via B4 Relay wrote:

[...]
> diff --git a/Documentation/devicetree/bindings/display/apple,h7-display-pipe-mipi.yaml b/Documentation/devicetree/bindings/display/apple,h7-display-pipe-mipi.yaml
> new file mode 100644
> index 0000000000000000000000000000000000000000..2cf2f50e9fc7329a5b424d5ddf8c34cad2ebb6be
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/apple,h7-display-pipe-mipi.yaml
[...]
> +
> +  reg:
> +    maxItems: 1
> +
> +  reg-names:
> +    const: mipi
> +
Drop. Not needed as there is only one reg now.

[...]

Nick Chan

