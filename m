Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB634E77188
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  6 Jan 2025 23:48:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:To:
	From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ae7eX1VcrbWOal63x+hvMKIWCXRYTfaUhj7cSqAJrEg=; b=NHgJKhIruTijoKcz0EY4sN/pwx
	ElLWqqC37nxb1z4uQQp3cg8k+H8IZnFTwVwir78MVr3wUxPYLzPZxJoH3RUb8F7NWiizP2a+LCLn/
	7sWTBoEoqjMQgbfGiIYtooPwKg4GS6tcpjFqNn3l9pKRQ1KDAAuUej60/iheIYC/4kFPPr/Ti6Om4
	dq881YBBLv76WbSAkx4LQgFam1RUoqODlSCoHB52e6ATCm3FZrDg5LQlsnxQQXDE0mqil47h8xTNY
	RrmaumFdx1l+5nqgNr9torq8fQfz8JIrvnvmwOuj8x28bLuIRF/2kx8KgqLzs3P4/RonB1bVRanTH
	n7XDapgA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tUwpZ-00000002yEs-3guK;
	Mon, 06 Jan 2025 23:48:21 +0000
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tUwnC-00000002xrK-35W9
	for linux-arm-kernel@lists.infradead.org;
	Mon, 06 Jan 2025 23:45:57 +0000
Received: by mail-pl1-x62f.google.com with SMTP id d9443c01a7336-21669fd5c7cso220173245ad.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 06 Jan 2025 15:45:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1736207153; x=1736811953; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ae7eX1VcrbWOal63x+hvMKIWCXRYTfaUhj7cSqAJrEg=;
        b=hwTw35H+nQIc/0MXy+ACj9lBiAYXSRQ/dLx+Oy6/CuiRR49pl432W8jTKz7aKfarS4
         hR8ZPKixfiuZuDZ2YpkhuIlGeQDV0/yCHzKPSlMx3YUPCrL7Q5Q0FP1dP8y01fy30SMP
         bCLCrDxqYJw1hE+s6nWTHTg2dCcDyXJI5JB+2UBE5LiUcmcwff1Mp506lWORY1N6mlT9
         T1lrpAzCRlRkXgrBLco03th8/A4ym8flL8NS4JVS9U6GMoy2ZM5qxtjeuutBzZxHXv3R
         /SgyD2dGh25M+sSvQrXR6b8nG3H9ZKdAz+GUTYpmJqWqNkZwvTD6xlLieMcHEekNOZu9
         iFgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736207153; x=1736811953;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ae7eX1VcrbWOal63x+hvMKIWCXRYTfaUhj7cSqAJrEg=;
        b=XfMX+ICmF3Yax5xh5OfPCwtpooR2L5095zqNTEgRAWDYER02KA+YUo7gPoTd1Ibpzz
         NDq3dzfG1DJqteX0sBkJAXnq17bwie5hfsKbUsZ4kCpS33V2s37M2XnVitm2Lsm3o3Yi
         4QAylto+cjrl7H2fe2QW7GQkyoQ/XgGK2Rz4zz1UrBuTprvobBXvlKFgwuwuix+SQvHX
         CLBkgubFH9/NDf9NyzrTjnJ6E35x2uKe618OFUf1a8MBeRKrgRF9bmuTG455TalAiWSl
         u60OCk4LFURX3/6jYno427WLILXT5+QuKAPNcBt2wXrjGJy2cC41u+pqi3K8j6q2igw+
         J6AA==
X-Forwarded-Encrypted: i=1; AJvYcCV8HjLImKOc2AlUjSB6Ahujg+D1V2bqTi+qhSRCD07FelhWo4zjORTCwMaSp/nNYPb18y4P9zmDkiabgHXUZXvR@lists.infradead.org
X-Gm-Message-State: AOJu0YzadJwn/MCK9sRseiw33bdub61x7P8BVfZ783BQS7RhREhlj8Bq
	sjl1TLbQnNXMo2jAxdrRR3KAqTwOQOUC6ns7a2HXQg2VAv4Znn1V+wC/ikeJ8AE=
X-Gm-Gg: ASbGncvoUkB44QbDVC/qwT4ZJufOiTdzH6JMhUbKT0ntGvz3HYj1BmvPEiDI36vzB45
	V30bZM6Of8LoMhO/0MEsJLMKddLE2HiN0E6zaLtIGijhQqBtPT+8NEnDyszP6OyEB+Vyaq8sWUO
	kxFzyZ1hijAKaOx13QvsglzqI4CjlFaT5O+WFmClFSliwsIoHyPBl1Vw6JhsauGhdTf7M5KI0F1
	siS1lP0/TffW7Rdkfej5ls78hO5Zf0NBelceZ+2C6kiG2bPw/KTw1A=
X-Google-Smtp-Source: AGHT+IEyj/CbdGiIw4oe//fTvu0d1C6QeCGfXb3QIrnjF1+e1FD5isTOw1FMoA0flm7N9cEayQ9rLA==
X-Received: by 2002:a05:6a20:2d07:b0:1e1:b44f:cff1 with SMTP id adf61e73a8af0-1e5e07f9c06mr83863396637.33.1736207153545;
        Mon, 06 Jan 2025 15:45:53 -0800 (PST)
Received: from localhost ([97.126.182.119])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72aad8fb9a8sm32211279b3a.157.2025.01.06.15.45.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jan 2025 15:45:52 -0800 (PST)
From: Kevin Hilman <khilman@baylibre.com>
To: aaro.koskinen@iki.fi, rogerq@kernel.org, tony@atomide.com, 
 linux@armlinux.org.uk, linux-omap@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Andreas Kemnade <andreas@kemnade.info>
In-Reply-To: <20241229144459.9742-1-andreas@kemnade.info>
References: <20241229144459.9742-1-andreas@kemnade.info>
Subject: Re: [PATCH] ARM: omap2plus_defconfig: enable charger of TWL603X
Message-Id: <173620715274.32831.12985016138338790659.b4-ty@baylibre.com>
Date: Mon, 06 Jan 2025 15:45:52 -0800
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-355e8
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250106_154554_982520_C9EA46C0 
X-CRM114-Status: UNSURE (   8.21  )
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


On Sun, 29 Dec 2024 15:44:59 +0100, Andreas Kemnade wrote:
> Enable the newly-added charger of TWL603X in the defconfig since it is
> used by the Epson Moverio BT200.
> 
> 

Applied, thanks!

[1/1] ARM: omap2plus_defconfig: enable charger of TWL603X
      commit: 643cc5ca01ce462f2e2856eda60400e9a7052bb9

Best regards,
-- 
Kevin Hilman <khilman@baylibre.com>


