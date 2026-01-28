Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0E81D35674
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 28 Jan 2026 05:06:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pftsMK2Bn1JCcMxWOi9xdDs4s//i9MppnFiwPUF/boY=; b=guHKqWnfbyKpXdM+iqWWtlhnXY
	yV8tkAwMhc0qvegoOKws6eUYKHYHiESPIiSDUKF/ULFzfgjq+sxdZnck0TawaQlPc7uBYc+H7rD72
	zQJtidY4pRX45zAjhAs1HeTVfB1DBYvlTmYb5nOV2AjrHr/+SKlDIExjziWxhC8J4Ceec14fUyl68
	5smfG0inJWZjRa+N11n5X4jT2iINcgCM7TM27+69lUMzyam+rsBpfoZztW4eBxmrZroCf6LjswwlQ
	hXq/GbO2UzxrWedrsv3i5m3gwGcY//++iufgfthg0jAEZRC8pJvge4og12cgTSXpal52GTRDyqrkE
	Fh4rtXZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkxki-0000000FRts-0bT8;
	Wed, 28 Jan 2026 05:06:06 +0000
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkxkd-0000000FRtK-43nm
	for linux-arm-kernel@lists.infradead.org;
	Wed, 28 Jan 2026 05:06:01 +0000
Received: by mail-pl1-x629.google.com with SMTP id d9443c01a7336-2a78e381fc1so28612045ad.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 27 Jan 2026 21:05:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769576756; x=1770181556; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pftsMK2Bn1JCcMxWOi9xdDs4s//i9MppnFiwPUF/boY=;
        b=O7guKPjDzdeDYChQaLSCtioxHW59uZ3YePvJUdkYuwJXRpEg/m5AFHUEQ5UMWxbiiN
         8FtelhG4mp/ZItHc15McErogIVG/DhVjuAg773o0qVgU+XruJezV6+1k3rWOBexGDb7b
         MXPCd8zewibMAObqHXV2klQwQSS1PCju9MO9uOBu+Yxtkw1FD8fJb1Jdvuqvv7rXZIfx
         bUdMCWJGO/WERmO4vZlsvo526jfSl4ChCEuttwTycesUTAzPu5+A+UBS3S9CfNCQO6Os
         upMGqWOaw/c+drPEkPndK0IrVwkn6llLw/zE0bUKDAodGtXIGPO2DKUeK4wJBzS8bW05
         Unxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769576756; x=1770181556;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=pftsMK2Bn1JCcMxWOi9xdDs4s//i9MppnFiwPUF/boY=;
        b=nrFDsG9ALvaAWKiF9fmsQjdyuEMnYqAt+ZRi4kWQTp9Rysvzjm3lNUBvCPHuPumo2L
         nC+Y1DcEbPrKkC/v9meHD4zXDs+2hMWQd/Yk2fRkfL13nJ7ejrPJE5qH2ZgTpdjtydMJ
         L66lFtSTuScS6Yb8usEUm84aGBAkBl8jaKEWgPq/24kQGGnvLnIP0PsZSUs7IHLcVY5w
         Qz59E17vEYsNXshk4OW5yIuYX/n8BhrA0Yw/fM7rnM5Dy57XfYzu81e4vssOkMDpJXYF
         vOTJwRXzmXzWES2YpPrIPcjLLGBZvRs9BKmL7TPU5Gx1LeRJIc3Y98bItSfJOH/sM4s1
         pEdg==
X-Forwarded-Encrypted: i=1; AJvYcCU3ZUyg5odvLwwanNoKEw/dYbzhMhDQC3C4zz8eKioLfaXRUQR2PUSDDPsU1xYpGFU0y+F+1rFhbo3o7NKrTzUp@lists.infradead.org
X-Gm-Message-State: AOJu0Ywp9qL/dQ64Qqv/C+EHmjpFMFJji39Yp3RCKgYEsKFVvWZJnliO
	ROmuD4nq/yMNqyUuiI04f2c/98JQuSn85QNKmKAHhfcMdivzLxTIHbtJ
X-Gm-Gg: AZuq6aKlklrBJwSPLKmA6qtnLZzrf+q3Iw0mwVQA04rmwyPPgCiw7TRLglqdye0ssGJ
	UOdNPx6HFWEycT4XQz57IXsJfKs4+7kYTAN9fGeP+Pp+ZiKoZLakrMiHtnP7wWs2X9jyLuTFwka
	EfqibPOC4v8BTqwzgcsBiM6IujkALYBp4dHPfaYalfwvl8Ha2zhvagEoGUX285lWWnTEXQKZ91/
	brWERY7LlF+b2Zk0mSsybcSSrD0VvhGiVElbPAjtxGnAcjTiA5ipMNdJcR7QPgoZEYYWHgXAfs9
	fxw/f6lsNaWUrYyGnbVbDA7hovp9Kp4jf+DSn/EwAhlsd2aFa1yYNtV1+9xKIUq6WJXa0agLRBB
	kH6HylpvxZakdTAK70lHyknplXlXWUKuB3mBvKl0OC+7ErVKtApbU1YnyBWnp3X6gZ3rm8tUXts
	7V8cg6GcCl7aTOjBfZb+5bQqclKj9Az+BzuVx3B00Ag9PNVVwk6acrKAA=
X-Received: by 2002:a17:902:d54d:b0:29f:2944:9774 with SMTP id d9443c01a7336-2a870dc6ebfmr39393185ad.33.1769576755960;
        Tue, 27 Jan 2026 21:05:55 -0800 (PST)
Received: from wig-Precision-3660.. (125-227-154-99.hinet-ip.hinet.net. [125.227.154.99])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a88b3ee952sm9736025ad.14.2026.01.27.21.05.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Jan 2026 21:05:55 -0800 (PST)
From: Wig Cheng <onlywig@gmail.com>
To: shawnguo@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	zaq14760@gmail.com,
	Wig Cheng <onlywig@gmail.com>
Subject: [PATCH v2 0/1] arm64: dts: freescale: add pixpaper display overlay for i.MX93 FRDM
Date: Wed, 28 Jan 2026 13:05:48 +0800
Message-ID: <20260128050549.3337279-1-onlywig@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260127025740.2601841-1-onlywig@gmail.com>
References: <20260127025740.2601841-1-onlywig@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260127_210600_030771_A97E2533 
X-CRM114-Status: UNSURE (   9.12  )
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

Changes in v2:
  - Fix Makefile alphabetical ordering
  - Move vendor property before status in device tree
  - Simplify commit message as suggested by reviewer

Wig Cheng (1):
  arm64: dts: freescale: add pixpaper display overlay for i.MX93 FRDM

 arch/arm64/boot/dts/freescale/Makefile        |  4 ++
 .../freescale/imx93-11x11-frdm-pixpaper.dtso  | 51 +++++++++++++++++++
 2 files changed, 55 insertions(+)
 create mode 100644 arch/arm64/boot/dts/freescale/imx93-11x11-frdm-pixpaper.dtso

-- 
2.43.0


