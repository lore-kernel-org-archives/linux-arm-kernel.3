Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4CBAC77B7C
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Jun 2025 17:03:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BcRT+NYpbdzPXOED5vFm930hD+F6AH0QJgXxP3RxDZk=; b=4TE0dhuJyNRWLy3GVbNFPIy7ji
	5BTItfycIN5NW3jBLyRl5tD7sAwbfbFhnWI2Oa3yTQhDBXtwzFK31GAPUaQGRUvoKGjZrCGwgWJjT
	SGS3o8NKLkdp+TWBN3cE7n7g887mihrZEX/FmRgoLoj2skzf1l3VXYBv/+R/FlllN2Ibt7uI+9URh
	RL+sIKzXqk2f7RkX9A90H//gbgEZ1ySX636hw74G3rkX6tfidmHtgM9H6u3/uNVm3/b5GiVHtn74k
	Myn2/69GFu9baqegNItgbKJ8e7+2w9RpymAjP+V6A9JpOynMdbYJvF9p7I/v6tIIVewO3qiag8q1Q
	3lKEqN/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTkZj-00000003VL3-3wAx;
	Mon, 23 Jun 2025 17:03:19 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uThH5-00000002ssv-2cC6
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 23 Jun 2025 13:31:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=BcRT+NYpbdzPXOED5vFm930hD+F6AH0QJgXxP3RxDZk=; b=lQ7Bqv0Pf3292BkwOxlrIw3A9N
	BZLOgkBssKyKtgdRIme0/XCytx+dfPBhEesOIg+SsKgQkVp4pTJCogOaYw/fIuaRo1zisJoBpoRDP
	wTU9y41M3qKocebo9WR7vsJWT5eaJTea8k5BUf26itqJqV/hEy76kH8g6g/M5Xken2XLQiapm3xOe
	ZmXhdOQLVcXEu/GlO9ZdK7hP2+blsygIiya3tJRC0rMSC3eqESdNft+mFSSDdF5fD+ypiE4s1QCd4
	BPWiz2nE1DvKfkKlZg05hPb7PLVhfLHjm31LoqcaStgZjYandkjuo6ucO2GbfNHMGJ8E6QMonRK4W
	l1T9ckwQ==;
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uThH1-00000005E1C-1Pmz
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Jun 2025 13:31:50 +0000
Received: by mail-wr1-x42d.google.com with SMTP id ffacd0b85a97d-3a507e88b0aso3554985f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Jun 2025 06:31:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1750685504; x=1751290304; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BcRT+NYpbdzPXOED5vFm930hD+F6AH0QJgXxP3RxDZk=;
        b=CLq4D/2ABPLGTOsxkciHhccOeg1/sp0klMjsqjr5wSpKTc/tBgrPBH5I12KPS1b0Sg
         Wra3yz619IzDvs4DaqEMBGD56bQfBk2qX4ZI5s3dBjUvNqV57OxXG0Q4pqXoyuk7TuL9
         Rn77P1M6hNQi0ujEV4PPQ7zVycPppGUDnjWROtDis809Fuy3CC1Sa7Pv6oT//lDM7i9p
         2txHfVBbowJRCcJknhdsuujEepBAQq7lMhlEeAMt6CQhOooqg36LlUiw2H7VZkErPPW0
         +gkmJ7A3xEtDav0LC9eZkwTsjS3HrAZJMYx60eo6eMCzyX/b9a1MkGIfmWq5Aaodu4o+
         p3YQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750685504; x=1751290304;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BcRT+NYpbdzPXOED5vFm930hD+F6AH0QJgXxP3RxDZk=;
        b=tUoukPt1NGUzqj1CA23wdFL7zhvgPaiMSVNMoSjRD37MA+CxlRONXZk18HuczI6GuG
         s8FKMlq/gPs3BifTYxIE7K0z4YYmKMfINmStXyKeBqRhAR3kcChZZoxpaAfOASajsipI
         aoNPWvEe2l/iNux7eGR8urwMP2v0jAA6dpv4Zmyb4VRWu9cwxoT7i2zZYAzUqnTMiIOC
         +pOmr6zKANIE2VL0HOt9MVRPLwmhBMQg27vWzWsCv1d/rcqixJCxEC2W8SxxjoOnvdpD
         rydUecZGfyEVqDjxCBVjp+3vOiSGI37VdAy0K/XUHHJItg8NXWfZCF5JaqvH41mrk+qm
         oGdg==
X-Forwarded-Encrypted: i=1; AJvYcCXRwmk9BqxbDZSOLzZp8oGxYc6Z1CyHkUfZoCdFxK+EuTGejXdqNvH97oHz9TrvAV2Nn3GVTJzlubthXFQgcG2m@lists.infradead.org
X-Gm-Message-State: AOJu0YyEi8wIbjGEd27FJJz0YsaNAvhh2zj5aPFdff1npmIqpELR9evx
	iqD1T4zJTWQUZ/Gk6nWIiNHqu0khV4YjW+fniybcxJ9Tqx8GSGkge3ugrWw0s0ldHkM=
X-Gm-Gg: ASbGncua1Z2QEdSTXmrbHR4p0X4YJwhOa4LYq8/xAcK5Gv6pVTBuS8etDtIrRkzSLhl
	y4Jz/wTKvHPDsxgXCLPvwxN+oGcOXiCiuO01zrfPMGTqOf+1odmzUlZp7zeuN7UGmwjrwg2NtAa
	RFJ0UgFfiW5bSX9bDp2iLCYL7wX2IjPrmUq9kp3ALmwZ+90VpGPKiZWwRzxtElm9Y7u8fnij+ka
	wKN5aSN2E6u7sujGleH+aO4wb5BrFRoibJLU6YZcGOfBsY/oJ/K/JzWer9ZqoYuTTStaYxJL8Ke
	Tb+2+iqxSjYvladlQK9vOrKPcWvGV/GGb4Q8VZIT+hquqh+bw7RBpoxk+szrcnWr
X-Google-Smtp-Source: AGHT+IFMA6wLpwWOu66ZBT/Uwcl+XoqhLxK9+V0tMp8/c191NViuqFm+b+1J2RS5eF5XWF43kziHdw==
X-Received: by 2002:a05:6000:491c:b0:3a4:f7dd:234b with SMTP id ffacd0b85a97d-3a6d1164217mr12380643f8f.0.1750685504100;
        Mon, 23 Jun 2025 06:31:44 -0700 (PDT)
Received: from toaster.lan ([2a01:e0a:3c5:5fb1:7b0f:c522:cad6:acd1])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-3a6d0f1808bsm9401818f8f.24.2025.06.23.06.31.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Jun 2025 06:31:43 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>,
	Gregory CLEMENT <gregory.clement@bootlin.com>,
	=?UTF-8?q?Th=C3=A9o=20Lebrun?= <theo.lebrun@bootlin.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Abel Vesa <abelvesa@kernel.org>,
	Peng Fan <peng.fan@nxp.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Jerome Brunet <jbrunet@baylibre.com>
Cc: linux-mips@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org
Subject: Re: (subset) [PATCH 0/4] clk: use the auxiliary device creation helper
Date: Mon, 23 Jun 2025 15:29:56 +0200
Message-ID: <175068537068.1888277.981802582113061223.b4-ty@baylibre.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250611-clk-aux-v1-0-fb6575ed86a7@baylibre.com>
References: <20250611-clk-aux-v1-0-fb6575ed86a7@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250623_143148_033023_3B04DB7D 
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

Applied to clk-meson (clk-meson-next), thanks!

[4/4] clk: amlogic: axg-audio: use the auxiliary reset driver
      https://github.com/BayLibre/clk-meson/commit/301b96e0668a

Best regards,
--
Jerome

