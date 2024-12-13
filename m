Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A825E7717D
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Dec 2024 05:29:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=pHzjLDekd5mQV8SYfeuvwYKyGO1BHWQrWxmHdBR2+PM=; b=WvJUMiusp3ADhU
	RLVkDts0S2AH4um1BYi+Q9cBT2hGeaCxRBoUVak4LgAOot75PVxTHENUoBBlO6gfv1ac/vyqWJ66t
	+fUMN/mr/wsXM5sBBIbxj/8cnZf08JlhK/FjKvBHcNhBJhddJ8UueLLmEaUaUGw9OhW8VeH8lOa5m
	rW+b+YO3SFeXkOIpFFIEoeqoRGsL2opB9k/on54ZEnKvDNtNCHBimsxVsF7yx4PSRKG5Ur7MwDWXV
	XgPr0aEAyFRFU3m6nsYWnd5F5rNP4hmWAO0oMmfTnjl8GiZOb1XATasGFX0Btw0Jz1ylgKYlqq8gk
	L9jJW8GpLecWamiXVU4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tLyEq-00000002ltW-1O5F;
	Fri, 13 Dec 2024 05:29:20 +0000
Received: from mail-pf1-x436.google.com ([2607:f8b0:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tLyDQ-00000002la7-1K33
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Dec 2024 05:27:53 +0000
Received: by mail-pf1-x436.google.com with SMTP id d2e1a72fcca58-728f337a921so1520038b3a.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 12 Dec 2024 21:27:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1734067671; x=1734672471; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=pHzjLDekd5mQV8SYfeuvwYKyGO1BHWQrWxmHdBR2+PM=;
        b=JILmLhPlDhNaeZCFyPuNv9/x6gtbb5ZMd2ySDEzz/CzaiQO5Vdi7qLShfSkx6ufBOP
         kvqeGoyQKPOQF+NXtAMFDvWAnAi8ccRUymb6KmltCpQPDAEyLqpybpGLQClnF4QUdqg0
         Si0Jpnsag7suSqdOhEv1ZanAE9wTyCnUsca8Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734067671; x=1734672471;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pHzjLDekd5mQV8SYfeuvwYKyGO1BHWQrWxmHdBR2+PM=;
        b=lZqd99m5AXDZPBius3Znd8IggexWVwOFB9DXLFAEKzf8pheNvf5WwlgAHVYQaTMEaO
         UsRoS2tYQUHtBcaUtusMsjhJaUD9L6WJfCd0v2jRKRjRk2EpNRYFfgVfAh9cWEI7DCx3
         BdLbw0shLrNwbt2xnYFFoTxSFkDY5/++bBLXnIiZyP2CZMqdDJ6uEevR30QI0RYvENfg
         /BqgjU5QMfyXq7d6DkXZ9ybRMEG8szBbI3ll4JkyaZqoHKR7BhCfxk7zXdHHHTJwGO5t
         9uLuXrR6qnumb2U/Q50yl2poNOBYrJvWLp0UcXjF3plJ44ght02n+ykYxel/ZiALXvPq
         Nqhw==
X-Forwarded-Encrypted: i=1; AJvYcCXe8Pbk57SVcMquLhxD0s/fErNc51GQuMFfW3AGI6xhoevrfAxxi9djVKmTHskcNTE/+LdZpPWOQsz8d7I/dFUQ@lists.infradead.org
X-Gm-Message-State: AOJu0YybBtXqOP7deGMXe8598kjyodJ4lqEFhCXGEgGsQfSLgw702xMJ
	djLQk8NeC7a5JhmZWisY5wyu3WE9ZtYB8YGAMcXNudQQwLnOBLQmqndnA2vpaw==
X-Gm-Gg: ASbGncsAr02t7F/m1nO2tWpWtXOSXkZEENw/qpmpa+3DjGHz6uIbdnPJdRwJf/ymMyb
	Am/7DtXiQ3QQn0VzfnkEM1GvimntNyqLfgTg+xqW/KfutbClGJwdhSdJtypi/vwPCdQz9X1iPXG
	cq4ilX2IJxGOj4bdHLcDCsljjri9s+UhhSeIRpz0Dk4TsRAkFxk/L/tAB8FBhtqJfZ7M5zWM7P1
	Sh8K2V2GGYZHiIX7Q3OioQV4LHS6FQAWP23Vpx2u95h+GpK0riHkVr9CvToHblzJPUKLJePG2uq
	94UK3VdZZxBJVeyrZRLpVrJ+AarAwb/CPCZDdcO4cu0mFus=
X-Google-Smtp-Source: AGHT+IHB67SDjQZdu1KmnyQPCBhhCJuO+6RCt8yzJ21rj5AHz2vHeQnr45DTMywbF+2HqFLTeZ/Yjg==
X-Received: by 2002:a05:6a00:ccc:b0:727:3cd0:122f with SMTP id d2e1a72fcca58-7290c1456b3mr1782962b3a.9.1734067671614;
        Thu, 12 Dec 2024 21:27:51 -0800 (PST)
Received: from yuanhsinte.c.googlers.com (176.220.194.35.bc.googleusercontent.com. [35.194.220.176])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7263803a805sm7386830b3a.14.2024.12.12.21.27.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Dec 2024 21:27:51 -0800 (PST)
From: Hsin-Te Yuan <yuanhsinte@chromium.org>
Subject: [PATCH v3 0/2] Adding second source touchscreen used by some
 mt8183 devices
Date: Fri, 13 Dec 2024 05:27:46 +0000
Message-Id: <20241213-touchscreen-v3-0-7c1f670913f9@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIANLFW2cC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyjHUUlJIzE
 vPSU3UzU4B8JSMDIxNDI0Nj3ZL80uSM4uSi1NQ83bTkRJNEU6OktDRTCyWgjoKi1LTMCrBp0bG
 1tQA7gEEWXQAAAA==
X-Change-ID: 20241213-touchscreen-fca4a52bff58
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Enric Balletbo i Serra <eballetbo@kernel.org>, 
 Hsin-Yi Wang <hsinyi@chromium.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 Hsin-Te Yuan <yuanhsinte@chromium.org>
X-Mailer: b4 0.15-dev-7be4f
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241212_212752_356671_D925693E 
X-CRM114-Status: UNSURE (   8.99  )
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


---
Changes in v3:
- Split from the v2 series
- Link to v2: https://lore.kernel.org/r/20241018-post-reset-v2-0-28d539d79e18@chromium.org
Changes in v2:
- Add second source touchscreen patches since they should based on the
  first patch of this series.
- Link to v1: https://lore.kernel.org/r/20241018-post-reset-v1-0-5aadb7550037@chromium.org

Signed-off-by: Hsin-Te Yuan <yuanhsinte@chromium.org>

---
Hsin-Te Yuan (2):
      arm64: dts: mediatek: mt8183: kenzo: Support second source touchscreen
      arm64: dts: mediatek: mt8183: willow: Support second source touchscreen

 .../boot/dts/mediatek/mt8183-kukui-jacuzzi-kenzo.dts      | 15 +++++++++++++++
 .../boot/dts/mediatek/mt8183-kukui-jacuzzi-willow.dtsi    | 15 +++++++++++++++
 2 files changed, 30 insertions(+)
---
base-commit: eefa7a9c069908412f8f5d15833901d1b46ae1b2
change-id: 20241213-touchscreen-fca4a52bff58

Best regards,
-- 
Hsin-Te Yuan <yuanhsinte@chromium.org>


