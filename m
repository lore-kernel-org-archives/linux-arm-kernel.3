Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D337CC3ABB7
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  4 May 2025 10:34:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=NVI3WFsvVbAiXxz3fU5XE6nLo4wboKl7ftENxHDBGwk=; b=s2Hm6lLQsO+4K2nkScj09U0GZQ
	U53uv7iGKOQGHpUnpgxdl/DYaB9hY1i3aUDG4cJs/e6gQBmMnjoYHUT9iDP6+JZpcFZSHn05ry+lx
	HRFGihLx25RVEbWEvwTVD3hwFlTlTAQd7P4dnfnpE4u9JFI8snKoNKZ74YdzMm/D2SQvC0JZ16cfw
	ab/6Zs/av2KCkeu5EyYR2cxSAY3BTO2j/NHf6l7YPYrxEij9xUok1xivvagi5y4VIfrVYmyvc2iCP
	U0AaL/s7AlnpxuafBe0OvsvNKx7J8j8jNklzWHBPkjBD3myriwKpCNSttos1fPrfEcV41eS4O/V3q
	uIL1vVsg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uBWgD-00000005BMV-1Nhv;
	Sun, 04 May 2025 10:34:41 +0000
Received: from mail-qt1-x834.google.com ([2607:f8b0:4864:20::834])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uBWbp-00000005Avq-3PE3
	for linux-arm-kernel@lists.infradead.org;
	Sun, 04 May 2025 10:30:10 +0000
Received: by mail-qt1-x834.google.com with SMTP id d75a77b69052e-476ac73c76fso40221231cf.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 04 May 2025 03:30:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746354608; x=1746959408; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=NVI3WFsvVbAiXxz3fU5XE6nLo4wboKl7ftENxHDBGwk=;
        b=jaXCEvyvMqBNo8J78sdglGfM6/NNhLcc5Paquh8f90uU+I1YTEFi/k4nt0OzP5vz2M
         l6/tBVQQODg1+sjOFWpJjpSnoqz7iz0hZsxiMdT4Bb9XE+0iihewS+3wNE0uSszHUoD2
         m6ezy09TpVyf6mF4mFfXGa564f6qf5mX7YvDHP7TILhHMC90OAK/NmBEOq+MmiPJgkeX
         M8Unv5uYbge1dCCOqMqzBThD74Ns1J8b1sqAlRyAsFkhfa2yeQDZ+kvuCbj67EbdMCVi
         KOlfQ2Ps2KCIGGS0fmdZd2IOk7yGgVhJDrZbuabNV5qVu3cOLT1RbUHBEuoleAEKItZN
         eEsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746354608; x=1746959408;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NVI3WFsvVbAiXxz3fU5XE6nLo4wboKl7ftENxHDBGwk=;
        b=jm4qBANdhVV94jtlDf6e78CsM0GTyKQ8i4V+WtrXuG1l/l+PTah/El0rp3aHQcyttp
         gVAjUh9Dyr8xD/kSeu8npLX5VRN5n5vVTE33oXxZYvGXKpTb6g2qiM9Sn3QBPGCcqF/8
         L0NIOQrz5KwqS4pBIbVT9JnNEfUxNg/hhGMTfIgNasH4UKrGwG/ZVQ9M1sPJ0hF1sxq9
         OBqHmaJ3TC8fFOcRUVFuvnYREvvg8nM0JcRqCHM80SesW5HCUIrK61+FwlYvCwLcOc5F
         2KF+isxTmuEzX08bv0uiJ0SG7h1ysziiTMs7SQuDC3pJIDqD2hHHcLt7hB7jRvrhZVgC
         yrGw==
X-Gm-Message-State: AOJu0YymO7garhYKFh0FM73g9C3yrquO6GP6cROigTdavLptpHor8hIw
	hAlrnsHTeigXhAj0CJGNaJ6JfoIdUgJ9UndnNI6vf4QqaqX1iN7gkperXQ==
X-Gm-Gg: ASbGncv3PfNHjviRdcg4RUOFdsrNUmKR2GD2QyJ901aM7QbSc5b3/M4dwPLk6AaQlIA
	9KztqUdWCNv0zT7fFCkwlzeglVVn8VV3io3WAgdGu49KecQR2isZC0s+c2Mgh6TzPR4izAH9sqo
	9aCTo92CQLnsdg0AYzI7N51QyHXLD2+14tQenSzvy5sZbOIyebKRHVsL8DqoWisis2tdm/dq5v7
	pPVELnchomKlmcacAF/zYcwmKtjZwmyAZzSBmhv3dULuJlg3OfSrR+BPm4c47Vgdfopftf9ZolX
	MWFpUeV4ueB+qQ+JOm8iZIJAzzbqlchw4r7M5wxegY9VQwuxhX0/zqGGfcDX6/+6AbkcBErRN/0
	2fJ6egpoUkN+W8uc=
X-Google-Smtp-Source: AGHT+IE8wMnsF2emt72M8bfj3OH6CYYZM00ZNXnO/qtTENvjFh+h4azJWXELz665Db5XJf+cLgjMvw==
X-Received: by 2002:a05:622a:1e91:b0:48b:4126:8f3f with SMTP id d75a77b69052e-48dfd311c8fmr52973441cf.0.1746354607658;
        Sun, 04 May 2025 03:30:07 -0700 (PDT)
Received: from aford-System-Version.. (c-75-72-162-184.hsd1.mn.comcast.net. [75.72.162.184])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-48b960cf8fbsm42937331cf.11.2025.05.04.03.30.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 May 2025 03:30:07 -0700 (PDT)
From: Adam Ford <aford173@gmail.com>
To: linux-arm-kernel@lists.infradead.org
Cc: aford@beaconembedded.com,
	Adam Ford <aford173@gmail.com>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] ARM: dts: davinci: da850-evm: Increase fifo threshold
Date: Sun,  4 May 2025 05:29:59 -0500
Message-ID: <20250504102959.81830-1-aford173@gmail.com>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250504_033009_854225_AFB8AC7D 
X-CRM114-Status: UNSURE (   8.83  )
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

When operating at low speeds, the display may throw an underflow
error and the display itself goes blank.  Increasing the fifo-th
value appears to correct this problem and the display can now
operate when the system is operating at speeds as low as 100MHz.

Signed-off-by: Adam Ford <aford173@gmail.com>

diff --git a/arch/arm/boot/dts/ti/davinci/da850-evm.dts b/arch/arm/boot/dts/ti/davinci/da850-evm.dts
index 1f5cd35f8b74..38a191fb0414 100644
--- a/arch/arm/boot/dts/ti/davinci/da850-evm.dts
+++ b/arch/arm/boot/dts/ti/davinci/da850-evm.dts
@@ -60,7 +60,7 @@ panel-info {
 			sync-edge = <0>;
 			sync-ctrl = <1>;
 			raster-order = <0>;
-			fifo-th = <0>;
+			fifo-th = <1>;
 		};
 
 		display-timings {
-- 
2.48.1


