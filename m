Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8DAC0C87FCF
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  7 Aug 2025 11:31:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CObGEyXsBl5ckArYvb62OQgoq3Ny+zC7kyISSXYr+yM=; b=G9ms+QDU3VoxmrofI6HE7oCkTB
	0b3lUnNYUMax5+JWni9QBHTNFGVk358OmMXe42tf8vAZ5vGReEgkGdwCSdZutD5ovN7mWnEG89/lr
	A19MUHlwBwhUDQJIDVQ+/OS/17pHNzQKKA2HhJKq+jiTtXVZTC64yi71RLmJBU384QEzXPGc8XiC5
	N+LZ6nC4iA9dCVcvfd+q+IBMq7XXWBFx2OIP8wkpfYXUNer83M+KEJb5ZIWlPLsbg2n2Fe7a/YBZD
	EyvZ/uCy8A7aiJDzECE2gSuWyIHqJBioe+5RtpTmWI2MhOqidpFhZPQaSbrAAZaZ1+nq23CTWA+dA
	2FSbR2Fw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujyqR-00000000Nou-235m;
	Thu, 07 Aug 2025 11:31:39 +0000
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujyO8-00000000Jwf-3XGa
	for linux-arm-kernel@lists.infradead.org;
	Thu, 07 Aug 2025 11:02:25 +0000
Received: by mail-ed1-x52a.google.com with SMTP id 4fb4d7f45d1cf-615957f4884so78949a12.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 07 Aug 2025 04:02:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1754564543; x=1755169343; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=CObGEyXsBl5ckArYvb62OQgoq3Ny+zC7kyISSXYr+yM=;
        b=HdImZ4+MH2OrJn0JD9LithtW5rMle03dxhNv4DV6GamKzo9qYFv8VM3qv+V0Bn9X24
         Dz3UkfrHb3Cvi9aPTfV2X7jsuqcEcVLigG6G6i/e43fN3TbnGWgOmH816CbpbDCBYQFR
         F9oPMnj/X8W1X5TfRvxYCavFGVJEja1qdG7X/dNYnrdrruogTwM2pH2u19MOM7PkJz62
         1TCx8V4+pJudHujJkhLeX9NR4g/w8IJ2UlO9LeCugS5L4nHpl1mSnVWyXK5Xl3IpAPm8
         Ghf4c+NkR6+Ck1dRjv4ilqu0j4wB9EE88mSFB5ObtXvjYiX+QNJh7FEtkvb2VwNNeMzd
         2LLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754564543; x=1755169343;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CObGEyXsBl5ckArYvb62OQgoq3Ny+zC7kyISSXYr+yM=;
        b=cCE2QGXH7InmbZ9/r+BJ9HsMyug6JYWovBeqAGL45qCeIupbzJ9JWbp5P/4XdvOETv
         rMOl2ksOdeB4LxZ0NBgZbTSZygsrUT4IWkcZJa+D8zK3lVUuzUBFr7behRz9cky3Znh5
         pY3AuGWYFedFITp4ljW3BY08d0tP3PrKuummqp+VNlWd63Y0LzFJvqGFzD6M4s5JZe1+
         eZjitHYURAZxdg3MqIOEXgn3xF+UG8S7xffgCTiE067bUGq6MF5RhkDDF+qpqw2DQjsZ
         Oxhc5PVCNh2cTKwQHIw4Jbx01LaMcLy+7KNbeCY7FGr1ULBWGu54LWoI3I/0O7/6P9yF
         nsaQ==
X-Forwarded-Encrypted: i=1; AJvYcCU7Vx9uY7p0ozXomgu/v576IKQAU2T0aMsml4jA1Y6fANCI+dhr94MlyneusP+eOBy0DU5DpfxqMN1qaXu6yADZ@lists.infradead.org
X-Gm-Message-State: AOJu0YyjRd9lq853Bh02WewkZLsLCGDr+LvBGJVD4gUOzSGjYf3uVnUN
	W9ff2He/8Aa7qsFm2tkS2CdnmiQslMEHxi9QBm/WeOyZB+CLagHLEvmPr0ybKlQwVTw=
X-Gm-Gg: ASbGnctxXHkHAUVYMRStUpd6b1tRknF9RjP38Wy1LEaaShQRIv3kmJ3iR9t2xvAWjm0
	V/uo7CMbZp9L0rojF/dhsw/764qPyyoJpdhNSNSSuesZdbAOw9xVWmL5p3oqoxkIe/ZVQztt0gS
	QFCYHprb8RM5lcj3j4vP5yzXHlqjA28cMgcoiafsnoWHGo/vuyFq+Er5a1i6IueWpI6QHlocc9k
	UjVJnk2pDfHwpLakXHo6ixfkwqeenvMRdvSsdpkLx4xx+lvyHaQF+pcDG04AMsSiE6EJw2m3oNQ
	G26C16wyYGFEe+pYqkm4buQq2UGfRt9EIoJOm6nQ8wJFbkAMxbVSUL/E/kqYaO9GGsGeJ0err/5
	nn90iRcJA7v4CEcKAsZNcxzU/Bvyxeth3TFlGKyGPxbw=
X-Google-Smtp-Source: AGHT+IHxxXvgiIBcVo2bRXpywTm3YPRpmc1P0j9HlD/oGdag2IrL12KHdTRAWZTF1ygVNW+NegUEJg==
X-Received: by 2002:a05:6402:3595:b0:612:e262:929c with SMTP id 4fb4d7f45d1cf-61795fbbd25mr2327171a12.0.1754564543182;
        Thu, 07 Aug 2025 04:02:23 -0700 (PDT)
Received: from [192.168.1.29] ([178.197.218.223])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-615c57f9fd0sm10434591a12.11.2025.08.07.04.02.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 07 Aug 2025 04:02:22 -0700 (PDT)
Message-ID: <4150c213-b99a-4862-9e60-f374e40f97c8@linaro.org>
Date: Thu, 7 Aug 2025 13:02:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 07/10] media: s5p-mfc: Modify compatible string check for
 SoC-specific support
To: Aakarsh Jain <aakarsh.jain@samsung.com>,
 linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org,
 linux-kernel@vger.kernel.org, m.szyprowski@samsung.com,
 andrzej.hajda@intel.com, mchehab@kernel.org, hverkuil-cisco@xs4all.nl,
 alim.akhtar@samsung.com, robh@kernel.org, conor+dt@kernel.org,
 devicetree@vger.kernel.org, krzysztof.kozlowski+dt@linaro.org
Cc: linux-samsung-soc@vger.kernel.org, aswani.reddy@samsung.com,
 anindya.sg@samsung.com
References: <20250807032449.92770-1-aakarsh.jain@samsung.com>
 <CGME20250807032520epcas5p47545f2b03e29296b583248f8315abf45@epcas5p4.samsung.com>
 <20250807032449.92770-8-aakarsh.jain@samsung.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 2+47PN9NZAOyb771QoVr8A==
In-Reply-To: <20250807032449.92770-8-aakarsh.jain@samsung.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250807_040224_888151_601E7FB7 
X-CRM114-Status: UNSURE (   7.68  )
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

On 07/08/2025 05:24, Aakarsh Jain wrote:
> Modify the compatible string handling in the MFC driver
> to explicitly match SoC-specific identifiers.
> 
> Signed-off-by: Aakarsh Jain <aakarsh.jain@samsung.com>

Please read maintainer soc profile, submitting patches in DT dir and
writing bindings. You just broke all platforms without even admitting it
and without providing rationale.

Best regards,
Krzysztof

