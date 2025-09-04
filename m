Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 421BCCA1002
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  4 Sep 2025 16:27:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wg9RQ81pLZ+ciihaHbHh+VHe51/1jd/flpRJCWP5vTY=; b=Zd7AYDtVsVO8UicXf0+wV41CI5
	w0H7wHwlPVmyCc5Pmi43V3Gqze4xPcFzKFvFSGjDlHvkuOcNx8nxf+H7UY0yIfZNe52C5V1GAHMpW
	AhoTHfA9mnOv0dzqQlnn6iZwIHH6FCqRDOosMGFa1mpI2wyc0z4x/CMXqD0IyUJXkBXu23xD8Eimp
	joCP8K3oh3YvhBeEJlxuIfd83Gu+yuhl9KJMRFmQbwGrFOn1f1UYttYw6YgXj0yiDhlqF31V1SOGu
	jj6flDlvJWw5T4npZTi74lfLaNDVPMJnYYo+JBJemdakz7Lg6c7WcWPg61KqRA5mQ0WoD+DqBkM0M
	6vPqZKLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuCnx-0000000Cugg-1RZa;
	Thu, 04 Sep 2025 16:27:21 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuA0t-0000000BtHL-0njZ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 04 Sep 2025 13:28:32 +0000
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-45b7722ea37so5227945e9.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 04 Sep 2025 06:28:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1756992510; x=1757597310; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wg9RQ81pLZ+ciihaHbHh+VHe51/1jd/flpRJCWP5vTY=;
        b=sm4tP6reqfYeqbefl7PVBbho9zDSmQKJNv9nLDS1Z8npFnnhne3Sdg2VRFlSQiwgxE
         ZThikM6Q5xmu27EI+GZQ2XhylUY8tEGTD/rQmvO9wlsiIGkNhEAAHq+il8Taw7jVRNIw
         G7YSkxvrueBoQnebJOZhoyZCmSslrkLPp8tPl5V3oIcBKpklLSaYw3tZln2vhj3lZCPy
         OLtpkHlO13fvT/JtkHUCVW3Rz4uSZAEh+gSL8CSdDRiccfm3OHni+Jio6R3HouTUkLS7
         5fr7Mis2Opbx/Rj3PhAhqF6Sj96kzvK6qDB2D62utHJAN79m/WfMrQnIEwboguLPFGBP
         KthA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756992510; x=1757597310;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wg9RQ81pLZ+ciihaHbHh+VHe51/1jd/flpRJCWP5vTY=;
        b=VLrU6nAn8D1asuUDhlXLqYJrqCaiwx6YVCWZ7jvIjStC8IUSSZX+Rtf8Khdreba5Ho
         HmQKGVJ/ebOvxR8yyTRGx3PznY8Hq1x0s/k5sllnIwHKwI8kupm6Z/8I7JPPVRT2AQW8
         caK+CZrTVF9VQwLVwNhrT2H8YauEnz3rLTIXICCEjXV0bq2eEGXvCDynxxoCtBeiu9WW
         Vzw3xyC07CeHUiXOSxOmctmEHthj0A/BnhIs9s7XUt/fRvPLBXmhynubZB7vvE0zrJAu
         PkOenu+LW2Jdj8BKbQHFYx0FYEWUfLyt7dqo8UalbAP3t/5F/lyjU4WCfL1EGuDcw+wr
         BD+A==
X-Forwarded-Encrypted: i=1; AJvYcCVyDilfdsSFQ1gjiyNZ+Xi+qT66sX69os1HfbUxVu3ftGaDKa6tgb3spJAbfWIV2HSpKYy+jii2D1+tLg6qISqw@lists.infradead.org
X-Gm-Message-State: AOJu0Yxgxruvpp7kkLTJMEekDfdf7qQuipOmaWy+58dJSrFKt6o0i5ry
	8UFYQgGMhFHXeUXacgOdrA5dvepvzb7sfELsY0hiM3dqvcUdH3Z7fyUSzGUO3uUsN7E=
X-Gm-Gg: ASbGnct9Ooo0Xe0CQNNxbyZxwt1PMwvYiOm8Sv2BNio0uCMNkV7uTxZcV7Jj//DDVuc
	bIUv/K12Ld+BcUAcmphBXJiPB1hvUp4hn8GvD5CggLxPVlJ3rJlD7S3W1OQipggsLt6FKbQPK8N
	N8B6J6VPs4XVHw59G+5CCPhWkmy5zAz/G2hammmKeogNm+/yLkqsMqPOIjcNsrFqZ6xypen2C4n
	b55WV3DUT95HT0HE4gdY7P0dVSPISdmp405sPAXDjw9N0N5AL5hKNj2w40kZs8+7zpnIIaitpvg
	6Yj0bn9AKe15nd8Ztef8Unw4wkaI5mWIgT1Igig2zhbFnqu9cB+fAN4EpOnixgPoQ0XPQxo/Swp
	lymOVQB4BEstgxChee9VeoOqmNwRBJHLBAvMlhZxuI6s=
X-Google-Smtp-Source: AGHT+IEqR0+n4/kIxFH+iZ1e8ctE7JnfjyeZG2z9hWnY3yB50qjsaKmYnmnDkhp/9C/R0KCDPHIUFw==
X-Received: by 2002:a05:600c:331b:b0:45c:b501:795c with SMTP id 5b1f17b1804b1-45cb50179cemr38578945e9.10.1756992509525;
        Thu, 04 Sep 2025 06:28:29 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:3d9:2080:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45b7e8879cesm286165305e9.12.2025.09.04.06.28.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Sep 2025 06:28:29 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: Yiting Deng <yiting.deng@amlogic.com>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Kevin Hilman <khilman@baylibre.com>, 
 Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Xianwei Zhao <xianwei.zhao@amlogic.com>
Cc: linux-amlogic@lists.infradead.org, linux-rtc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org
In-Reply-To: <20250717-rtc-c3-node-v1-0-4f9ae059b8e6@amlogic.com>
References: <20250717-rtc-c3-node-v1-0-4f9ae059b8e6@amlogic.com>
Subject: Re: (subset) [PATCH 0/2] rtc: add amlogic C3 RTC node
Message-Id: <175699250880.3374853.13696019102809895067.b4-ty@linaro.org>
Date: Thu, 04 Sep 2025 15:28:28 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250904_062831_245748_4FA17A85 
X-CRM114-Status: GOOD (  10.57  )
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

Hi,

On Thu, 17 Jul 2025 17:38:36 +0800, Xianwei Zhao wrote:
> Add C3 rtc compatible string and device node.
> 
> 

Thanks, Applied to https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git (v6.18/arm64-dt)

[2/2] arm64: dts: amlogic: C3: Add RTC controller node
      https://git.kernel.org/amlogic/c/59b4c260582a74e641c973d016725e5dca32f300

These changes has been applied on the intermediate git tree [1].

The v6.18/arm64-dt branch will then be sent via a formal Pull Request to the Linux SoC maintainers
for inclusion in their intermediate git branches in order to be sent to Linus during
the next merge window, or sooner if it's a set of fixes.

In the cases of fixes, those will be merged in the current release candidate
kernel and as soon they appear on the Linux master branch they will be
backported to the previous Stable and Long-Stable kernels [2].

The intermediate git branches are merged daily in the linux-next tree [3],
people are encouraged testing these pre-release kernels and report issues on the
relevant mailing-lists.

If problems are discovered on those changes, please submit a signed-off-by revert
patch followed by a corrective changeset.

[1] https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git
[2] https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git
[3] https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git

-- 
Neil


