Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E362AC369CA
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 19 Apr 2025 16:03:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=W/fbFejZy4nIPoWrA0dBRfXvnbry7Fz4n31+Xfuj1TI=; b=HLuFDJ+CGKaCYSdyWsgPHjgnE9
	eZpC3xBMkEhHcvVqbO1vNbfq2k+auDQms4Rgz1QjjsVvkxrFx+xU1dEy9hAENwbVO9H6EsmQoafTP
	14KQuPZISQGLMXBwr4xQ68r5dz3f/kMam2OmUrH3Kj3rO74MiOGNJC+T1+i1CV5bPtXRhzhV0lkwE
	mlEZy8S2KYIcXP9png6BJmVZGYtv12WgNCHg9t09k84Vtvj0yAXD7Ms2zGs3CZ5IQrUGBpiMah56J
	hm+Z6RDSAjGXUUVwP9s+xKI/0BFScdPXzcYF/LR4ZRuk2Di1+9nrIKedZVJuFl5i6d4022EGNwn2y
	RAZpNgvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u6Aeb-00000001VHF-3VOo;
	Sat, 19 Apr 2025 16:02:53 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u6Ack-00000001V8w-3YQr
	for linux-arm-kernel@lists.infradead.org;
	Sat, 19 Apr 2025 16:00:59 +0000
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-43cebe06e9eso22818525e9.3
        for <linux-arm-kernel@lists.infradead.org>; Sat, 19 Apr 2025 09:00:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745078456; x=1745683256; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=W/fbFejZy4nIPoWrA0dBRfXvnbry7Fz4n31+Xfuj1TI=;
        b=ZWh/6wHWri4vR+X6IAILeDt+z9KBdVx97q8dlciP2Qq1G4l6oOakxHjfAJgkmJi6Ic
         tRqwLiu+FwVv5ipcx/Ge90Z5A7BYjwesEQLVQH1MVAP/p0q8yhX205BZ9wg7l8BOcW2A
         caH2kaTVZmqDQJBUzjpFBxcN975/fD9q7Z5B+Nm4VSFpEKUzp9WCck94TTfx7D5DW7pK
         VDJzM6Gv0NKnfP+dPtfneH2Nl8ac9zqgtJJHDhCQEAqu7wXSN4Benw1ZDXky0+H7o08N
         n5RaDDAkNuceWxCxD0xBqZg3NoAYrbUUD12GcF1Ib8xyznQxEV4mRjnEKBYq92JSKEKd
         u4Mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745078456; x=1745683256;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=W/fbFejZy4nIPoWrA0dBRfXvnbry7Fz4n31+Xfuj1TI=;
        b=t9fy6S/mPcI7BMovz9YNS+9Epbsbi9RbvV8/LANaaR3MGHb0C9b+xguflW3HfPekT6
         ls97njzbPwgeYkHcb8BABgRlRlGXjUbmjl5s7Odkjo044kyp3t/ep0px93/724dIDpkB
         YTJFvzAwsPvnPk+GV4u6ASL/tJ0lEYlm+iZpnjK9xskMeaWbhAZgGpz54lSGls1tv/79
         IuIp3DHAHACfsoJOCn3AgkZ9YSM2CH2NBEynK3dAgNnJI6Ycinmv/LzOInrUotw1VWhV
         6dXlZ1VzvkP90a8ritzacEAJjaHcCJwj3PqZstHtdPWnC6oyHqfFreLhWP1am5GTBWJ9
         I0KA==
X-Forwarded-Encrypted: i=1; AJvYcCXvXOlfIC0OrqQ9carlfYXYn72gSnsLdpwHRdULPd4w1l5TPm7aDEQ1zTMlyfX/32xrWmmgQDx7F41ByDhW4srX@lists.infradead.org
X-Gm-Message-State: AOJu0YxhkBFdyGu6xmJh09UqaIb9G31JROpGHSA5wb6FKHy0WxXxuzvc
	eVNDvvxpWDr6q8PfrhRKVbQYL74Ovfb9OYcbGCJtxMZ8xWGHn5VC
X-Gm-Gg: ASbGnct+cEQWIQ8X4UvePt4dfYfraXx5v23UmPdjZqaiFsoRJyaiE6SZJ38poqxQ61r
	MMQOwNIYEwYcowH+VfPx931sLv43w3ZvJUgCP/NySWyFeNkT3OO6uf4oi/E4MvcC0TSrBWjKeIP
	RruutKm8TXAaTByaZKpXzg7sQ/7n6Ph0YlVgK+gl4hv2ZCEePE2NeQ278K0Ey3gW/bJao5vd1H6
	Ms4qH3H4/Q9kLPlZlE/UvUOxJwHjwvQJGNlCDsKnTq4SBs1hzNljlIZ8fTXk5UzC5FSYUE81BJP
	5Fonl75JKb2SVMf9ySxHLNQ4DOfnlM5ZQ9yFPtv9diFlugGhTYu7YcBro8229iOckK/fR3IWGaj
	KsMx4EC/4K0P1Ir5mA4MAYe1tTJuqJairbGq37LcJF6xMfQckjf78G6Swhnu4P0Kg6cMlRP0ey5
	w=
X-Google-Smtp-Source: AGHT+IGnC36Pr2Pwb4ykt7IfU37k/BXh1PqT9qkdlZ9ToWVt+IpsfmlkELLWVuksNL2ab2S/sOLkPA==
X-Received: by 2002:a05:600c:1c07:b0:43c:f6c6:578c with SMTP id 5b1f17b1804b1-4406aba5a1amr65142375e9.15.1745078455985;
        Sat, 19 Apr 2025 09:00:55 -0700 (PDT)
Received: from cypher.home.roving-it.com (2.c.4.1.7.3.6.4.2.a.a.3.0.f.c.2.1.8.6.2.1.1.b.f.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:fb11:2681:2cf0:3aa2:4637:14c2])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4406d5acdd4sm65136215e9.14.2025.04.19.09.00.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Apr 2025 09:00:55 -0700 (PDT)
From: Peter Robinson <pbrobinson@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev
Cc: Peter Robinson <pbrobinson@gmail.com>
Subject: [PATCH v3 0/2] Add support for WiFi/BT header on Pine64 A64
Date: Sat, 19 Apr 2025 17:00:45 +0100
Message-ID: <20250419160051.677485-1-pbrobinson@gmail.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250419_090058_904274_DE7C58BD 
X-CRM114-Status: GOOD (  10.38  )
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

Add the BT and WiFi pins on the WiFi/BT header on the Pine64/Sopine
boards.

Changes in v3:
- Explicitly disable mmc WiFi section in DT even though it's already
  disabled in the SoC DT.

Changes in v2:
- drop patch that enables the WiFi module, it'll move to a overlay later

Peter Robinson (2):
  arm64: dts: allwinner: a64: Add WiFi/BT header on Pine64
  arm64: dts: allwinner: a64: Add WiFi/BT header on SoPine

 .../boot/dts/allwinner/sun50i-a64-pine64.dts  | 18 +++++++++++++
 .../allwinner/sun50i-a64-sopine-baseboard.dts | 25 +++++++++++++++++++
 2 files changed, 43 insertions(+)

-- 
2.49.0


