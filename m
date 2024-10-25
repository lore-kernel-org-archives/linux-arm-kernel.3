Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 090C8D0C5F8
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Oct 2024 10:02:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=E4cr4e2WpYdldiza6Smv9BM5tV2IoSAN/lMOvuaNoy8=; b=WZjysMjpzoQqAt/XTPIu4WABU0
	DWLAKD7JVQVmqrAEGEitwtlbi8kDyqD+oMeH2aKaafGKlKjfpj9oITM3Y8lBqa4PYGXAFcMPq9ebb
	oPhCFcDdOXtPpwn1Ub+K9Q5ZxjRpo1fdCDyge5+8YTyK+HULneLuqsCd64atjgZb5sybyMFTdVg88
	AzcQrUJfLkTEsvT/SpzbEpaezG0Y7wY6p36hyvjmvg1f+dQq8rHihFYDhMu+uIPoD+fQCiRs8pGjJ
	zuW7aD/3vW1zv5vgQkbJ/vllulrXqQlEOM1FaYbBOg5O0kh0hvHXNcRKjeXfSzT+Dj0WRw7LIsy2S
	XnFi6zbw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t4H8l-00000003Hg1-3R9g;
	Fri, 25 Oct 2024 10:01:55 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t4H6F-00000003H1s-078d
	for linux-arm-kernel@lists.infradead.org;
	Fri, 25 Oct 2024 09:59:20 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-4314c452180so20016715e9.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 25 Oct 2024 02:59:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729850357; x=1730455157; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=E4cr4e2WpYdldiza6Smv9BM5tV2IoSAN/lMOvuaNoy8=;
        b=Yfx/1Ae0rtBLq+1GPQ7H/SSLE1gJQ0OfmCoP4708H6CNP28YGG8z7O9NfxYeJ2hlIZ
         KDShKseqOs/qRdaYex0RtFdA/bSjpSpE5ExaZS5ih+SmMml8ki22z+fRUbueH3Ebk0UR
         dfrt5k++Ic7DqW3acIhZ5axGHuEcNCUnWwLf1wSKkiNe3X7mdsUY6prdDct762UzBlfO
         rb6TCDTu7mBkOlMXA+DQMEQUWC7VeEdMxKIQ0g5SEsMLUPePR6VKMTyRWLzuasQZRC9q
         rYtQyqk2hCZ7j/TuZ83Ht3GRL/v2VR8UHfcBP/qKv9A/E+QtpRRtKN9qL2q4YyL67gW4
         O2zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729850357; x=1730455157;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=E4cr4e2WpYdldiza6Smv9BM5tV2IoSAN/lMOvuaNoy8=;
        b=LAEQFuD94u+mBgF9c9NMne6/Nz2Z9kPJYxLGHr4+jX377iPs1HQDBXZ0Ddp8L5OPYE
         6pyMiKFt3nCPcZHhGEWFUj+0lNqLPNTTysjuSseoM1r6mCZEKBnqpbHIqLhfmeC6qmXw
         V1p337jOVeMwAufRXn/2JxVkQv+X6iNW5SrhP4Oto3V06jrbybG5nL85lKpftzmSF1Mx
         UyoFi9/X0D/wkOD9dt2M8OJLM4X1lrjLwCJFn0eg+2cmXJ62xCoZ9LbS8dzTXoK2jyV1
         NkZBdzBqNLHbwo/l0g34nNOXD/tyP5hXtXZ2H8yGndJc3etgC7yjad4rwfDAUqygZAzs
         TBSw==
X-Forwarded-Encrypted: i=1; AJvYcCUcC81vE670Xa/upZxnwS3/uCXJn+xJVRCJqGw7VyJqN1HN1hLXogdC8UB1fSouGHPbAisv7F41qr++CAqak1Ed@lists.infradead.org
X-Gm-Message-State: AOJu0YxhrMvoL0N70ZzHKkjjBer46neaer+7lzMxoqrPioUknnMoVb6v
	G347DfizGBo8oXi8wYrvyBx6q7F6VHLEP8ypQwYekmex4nTD+PvK
X-Google-Smtp-Source: AGHT+IGsDr1xiNpVz0zWvEjm8K23MeXnqNJoj9pKxKeUpb6r2cNqS3tSAm+MEb1ei9011b3zn/BiAg==
X-Received: by 2002:a05:600c:1c81:b0:42c:b67b:816b with SMTP id 5b1f17b1804b1-4318b587a84mr36861205e9.1.1729850356816;
        Fri, 25 Oct 2024 02:59:16 -0700 (PDT)
Received: from eichest-laptop.lan ([2a02:168:af72:0:7bc0:826e:69e3:7e40])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38058b3c7b9sm1098214f8f.32.2024.10.25.02.59.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Oct 2024 02:59:16 -0700 (PDT)
From: Stefan Eichenberger <eichest@gmail.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	shawnguo@kernel.org,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com,
	francesco.dolcini@toradex.com
Cc: devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 0/2] arm64: dts: imx8mm/imx8mp-verdin: add single-master property to all i2c nodes
Date: Fri, 25 Oct 2024 11:58:01 +0200
Message-ID: <20241025095915.22313-1-eichest@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241025_025919_087757_82CDBAB9 
X-CRM114-Status: GOOD (  10.21  )
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

Add the single-master property to all i2c nodes on the iMX8MM and iMX8MP
Verdin modules. This will allow us to use some single-master
optimisations on the i2c driver. Together with the following series, now
in the i2c-host branch of Andis tree, we get rid of a timeout problem on
the i2c bus with a SMBus ADC:
https://lore.kernel.org/all/7ts577rxed4mmfkfin7kfdjfjkb6iak2y4vtgtz6merwxkzz6w@h5aefbvyx44u/

Stefan Eichenberger (2):
  arm64: dts: imx8mm-verdin: add single-master property to all i2c nodes
  arm64: dts: imx8mp-verdin: add single-master property to all i2c nodes

 arch/arm64/boot/dts/freescale/imx8mm-verdin.dtsi | 4 ++++
 arch/arm64/boot/dts/freescale/imx8mp-verdin.dtsi | 5 +++++
 2 files changed, 9 insertions(+)

-- 
2.43.0


