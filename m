Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3963C369D9
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Apr 2025 09:01:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=07WxlVOIaTyluGdh8BRRgEGy/WFU+aaBchjV13UhNQk=; b=X7FG5sbKk419eOJdzfTqTu023Q
	OEs1e2SuAbjU3MXX9KHIl4sqko45LZTQLqyghVog911DIOFEGCEZEyvqMXcQGJPz4Rts3cgw7K93K
	RzmW9QEMSo5RZ7i4egBab2vKPd4AZ97wJkWNQBrepCexQTtsxgQb10MpGYJqEXWKA7PvyCRAmzZIE
	LzDJ4rC0TQVzkqLOll2aR8SPkydtSuYcS8W8ZEwundt+9rH/Ur9RvGv87Y6zTYjA7CNGHjjYJJa6g
	P3Hq5bzb1cQLiE+3lDxqpVySEFF8KYLVMqW47DdKYp2HClM8h0jFwutJJEZoYd78fsXUCelhxqpS5
	f1rHqbAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uA3Ji-0000000CGzY-2VIB;
	Wed, 30 Apr 2025 09:01:22 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uA1s1-0000000BzPY-2UTI
	for linux-arm-kernel@lists.infradead.org;
	Wed, 30 Apr 2025 07:28:42 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-43e9ccaa1ebso8007695e9.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 30 Apr 2025 00:28:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745998119; x=1746602919; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=07WxlVOIaTyluGdh8BRRgEGy/WFU+aaBchjV13UhNQk=;
        b=CYFPKxbkac2AoFD/rzz9/jWwy9Z7jIXvhst4gKaRcE447OIZPiNXmOWCV9D9afei9M
         7YGvyccGfyDuNagB84PLplKYtYX9mVTmextE8+PnpnIkWg/2Dtdn1MParLbhI6QnKtlO
         1Or4pajlYYscqsg+xoDgjPzsrsC7yKRboANEdB8HQaGx2GFqrjZHn0YxIX4YkKQiV7aL
         AUZ0QLIhxCeipfyl8i0elhCgHo/QjMmVl8DnJWBvR0r+P4c8sf0TY3SUIAwkYZNgFEKk
         BTbM8I0lD1tQ8s+OQr033Y/5ahprpk/osK5EVQZTMosvdiAsFOiHRJWvBhyampCT+u6t
         I+Mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745998119; x=1746602919;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=07WxlVOIaTyluGdh8BRRgEGy/WFU+aaBchjV13UhNQk=;
        b=YUDBXNdWHgG8e4GwnvljxGXY7mcAMImcFS8x+K7txh33yectoYw4TFKGvqbCNKJGX+
         hZb0UbiU7SB/KJXM3nXZjjsbWtCdmOlooyd4PEVjbo1pYD+vra6p8F8er0ugPrcroH0V
         HOiK24apmc27E8RAeyoimteEZhOqM6WTK6J0uBax4TJPMMd3SOZZRAyA0hSsR+YO9cZI
         HTE2f+5mJ1H7TpBU28TQvWfmN1Q3mXUPX9DKJQIA58AfnskFNor1FEnt0rZMHkV7mZAA
         KzjplaFo4nWqjIbdzdmp2+HtOXKtVcJrneMgbo1YskQLe81+dCdGFyy+IcCqqMnLGY4F
         cYjA==
X-Forwarded-Encrypted: i=1; AJvYcCUgUdGCpgj7VRIyqUh5v0RJugpXZLAofQbvoV9r47zFqzArDwkwJhTki2Wjx5+OMnHQn8WLJOjJY7HEKZPY/hQN@lists.infradead.org
X-Gm-Message-State: AOJu0Yxiy4NCbTP9w55YQf7joHtg5OKQM7G5Vr07Kvo68iQljQqkXYrA
	1qumLYd7ZDAez3n38CY51JkGNyhMNCzLjNKEez/9Yhj5UZFn9VTkGF75RfVsE5s=
X-Gm-Gg: ASbGncs3wOEEWEzhfcJ1blc1NMS/OYo6oKVkrV4342oE6tcTp/uAa1RdgwfzndKzQuL
	UsY89rjZMPKNSz/s+ap4+zygU+TnAPWfikGd+IsBGXWPkqk1cxFwGgALHdpupSY5CVc4VqylGbn
	Lk+WnbFpMayxJiHNP7E5oKuhh1bmpHnZH6o0FViDOv1jlUdSH6jOHC3Em+TFb8Bn4hEDBZ08dcA
	cymFDRso/82Eq8uNIQ10i4zjaw9QSqPXTL/KANij40aMoeb/Zh2UBxRdCVdlv+IYax1zu8GE2c2
	QWn1kuiEo+SSxX1ld/qZ5qVw270rgwBU/hjAxKQjnTjmXRun2hEG6FK9b6Y=
X-Google-Smtp-Source: AGHT+IH6V25XvncoZLZe0TycQ29EnlwaWMEky41C5N2edT8KzWHciHnrPjPlKJj3kIRZ+fXKOUOaNw==
X-Received: by 2002:a05:6000:2dc3:b0:3a0:7a00:61e9 with SMTP id ffacd0b85a97d-3a08ff35f51mr414041f8f.0.1745998119358;
        Wed, 30 Apr 2025 00:28:39 -0700 (PDT)
Received: from [192.168.1.28] ([178.197.207.88])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-441b2ba4a6asm13905525e9.11.2025.04.30.00.28.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Apr 2025 00:28:38 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Krzysztof Kozlowski <krzk@kernel.org>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Chanwoo Choi <cw00.choi@samsung.com>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Sunyeal Hong <sunyeal.hong@samsung.com>, 
 Shin Son <shin.son@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20250428113517.426987-5-shin.son@samsung.com>
References: <20250428113517.426987-1-shin.son@samsung.com>
 <CGME20250428113601epcas2p11d09d84944957018da75aa548d3ecb2c@epcas2p1.samsung.com>
 <20250428113517.426987-5-shin.son@samsung.com>
Subject: Re: (subset) [PATCH v2 4/4] arm64: dts: exynosautov920: add
 cpucl1/2 clock DT nodes
Message-Id: <174599811787.45412.1841327377938630305.b4-ty@linaro.org>
Date: Wed, 30 Apr 2025 09:28:37 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250430_002841_634147_312CC628 
X-CRM114-Status: UNSURE (   6.44  )
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


On Mon, 28 Apr 2025 20:35:17 +0900, Shin Son wrote:
> Add cmu_cpucl1/2(CPU Cluster 1 and CPU Cluster 2) clocks
> for switch, cluster domains respectively.
> 
> 

Applied, thanks!

[4/4] arm64: dts: exynosautov920: add cpucl1/2 clock DT nodes
      https://git.kernel.org/krzk/linux/c/aa833db4b82205275f4a4c08554b3dde99dae0c7

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


