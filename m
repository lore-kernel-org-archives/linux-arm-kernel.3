Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B68FFC282EC
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Mar 2025 11:59:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=YwysEm8CgcGz0FLembVWmSDCiCxUvMJeL9Cn5q2MMGA=; b=yaZWBlPfTJINqx70MtzOIFPgxz
	L4ACxUE6feUwd6rNYbuprnw4Xg08se6yRoU9x8eDs0Tq+ESG7mFeP2hIIHW3+2KpfUeNMLsKPUstN
	PR8r6/vMsQl9+/FEuR8w/RFcplFUBLfH7lRsbH6z75ss7AqA6Tk7lTz9c6Rqp7jRBhcCZAwAeZVzK
	OV+X7IxMWxHZXS9qHj3mN/Pzuk4B9pizsd2h73q9C0T9pkIjLtF9wxzAxkX9EeaqPFGhMZkZOZ5LI
	ixAxUKJbTMaQw6kk4l18UckrLkz+aSMULvKD+pRO3C7yuD1vC2jACCl96VK/WvwayURNsthiXjkkd
	7pa0NXOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tryGa-00000005XvH-1cao;
	Tue, 11 Mar 2025 11:59:24 +0000
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tryEl-00000005Xjw-0570
	for linux-arm-kernel@lists.infradead.org;
	Tue, 11 Mar 2025 11:57:32 +0000
Received: by mail-wr1-x42e.google.com with SMTP id ffacd0b85a97d-39127512371so2998281f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 11 Mar 2025 04:57:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1741694248; x=1742299048; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=YwysEm8CgcGz0FLembVWmSDCiCxUvMJeL9Cn5q2MMGA=;
        b=PfymkIIaXaCWLBpqvpLs/yFYn+gcpjjD5RcFuZ77tpogGv0FnUusiXYLW6wHqrDFW+
         U27sU610oGuC49H9jahj1XKPkZsu6eilCwSFSdVzQo8MTheNF7kzr/gz0Qs9bWwqxpTc
         tZabiTxI4Sqt8Y61LapITrfsdBwb4wYTvxPJiOcOUNDwCH+oO5H7p05iijOJeX3226Vs
         U28h2eCQ4dOs60eWmQwQN21L7MFUunnPiUxmMqq3CJMF39C2jQZsE9o0MKw8LC8e3QXV
         B7cEwotR9Lal82AMOfE7zrCUXTa3L8O8OSfMhwAnI2yAqu4HbKXKcY7HD2gtkcgXHvgG
         R95Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741694248; x=1742299048;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YwysEm8CgcGz0FLembVWmSDCiCxUvMJeL9Cn5q2MMGA=;
        b=ZzMb6vrMSZtajHMwZoKIbrUMCnvwrOc6KNLWeTRfOeJH/UAgeOPWAoca7EwbgpfC5o
         nKaVS/xGA7Gh17EoZalQzfZayU8lV72zQEeW3pqoxuHLExV2KLWhZRi+upoH8aMkmokl
         hB2DgBV/YxEqlNb4HrKNbNrwBXRE43pYUtukcYlTwisW9KWD6tqWsqMlRCDCwScyRNau
         eLeZl5rjnCRQsNbHVh2bNnn0Cd3KE0AvyPvvC1W2IsTioyN4Ya9CwOU1SG0FXVgL5UXl
         bvR1iS4tp4c6YVdgj2eszTa/ZHjX4uaNM73LxUVHBnsixak5Cq99wWQiNOxVHkuXUK7Y
         cGxw==
X-Forwarded-Encrypted: i=1; AJvYcCXJAFgphWa9/dwVZZPLfwkp0MRQtP/0L1q4YGE9gPFIlH6ZNVpBRmIKuuGw8wGPSSLUdct8mhvWsg8p/5lg5CsJ@lists.infradead.org
X-Gm-Message-State: AOJu0Yxn+YNOg5iRcEPienx/+ift7a9LdBsYhGkoLV2h8IOF4vmIA6sw
	+22HRO3FrPs9ac6cePgmLkQkDOFXtsDfdYXcnRc5MMkdy1VVoVUwv389NakHp6ed/+7As84fL6b
	b
X-Gm-Gg: ASbGnct1UyR3jaCEEzH+MnnmNCDlsGtVwRsTkiSCi4SySG/1IZQXVWd3bVQJ9V+fqnj
	gdNIrUXbNUzzD7Cx8PXDWw/5yF4hapF4BNzfaL0iemv82TmHmlTZ1ZId8lq9OXF/gvDHyv53vMS
	iTjK7bAUia0NZCJSdsBhAlCvodOeGfUx3sOgBLlq2TiD3xMDGwNZMXkq2ueNeyjtTb/A/CYXNxM
	ht8XnNUl6ybCQ2GAKmpIqxAg+Wav0Eaj9ncY47d4ftkK9olAU8gODc7wQ+kHH+iat+V9wvqtmpK
	X8rF3MI7rYh2U4318uvujfHxPa/gUogefBc33AYCmUhewn3nuyNY8Q==
X-Google-Smtp-Source: AGHT+IH+VpDB44gnrhW+DLqQbZXEtOu1LVpBt7zvglX12x25lWmYvK0tB5Yg2Jsuzi/rc8ZMAGUcBw==
X-Received: by 2002:a5d:5989:0:b0:38d:cf33:31d6 with SMTP id ffacd0b85a97d-39263b006c5mr3918261f8f.3.1741694248428;
        Tue, 11 Mar 2025 04:57:28 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:5946:3143:114d:3f3])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3912c104acesm18161461f8f.98.2025.03.11.04.57.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Mar 2025 04:57:28 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: arm@kernel.org,
	soc@kernel.org,
	linux-arm-kernel@lists.infradead.org
Cc: Arnd Bergmann <arnd@kernel.org>,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [GIT PULL] davinci updates for v6.15-rc1
Date: Tue, 11 Mar 2025 12:57:20 +0100
Message-ID: <20250311115720.40053-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250311_045731_059071_62297C86 
X-CRM114-Status: UNSURE (   9.52  )
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

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Hi!

Please pull the following set of DT updates for the TI DaVinci
architecture.

Thanks,
Bartosz

The following changes since commit 2014c95afecee3e76ca4a56956a936e23283f05b:

  Linux 6.14-rc1 (2025-02-02 15:39:26 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git tags/davinci-updates-for-v6.15-rc1

for you to fetch changes up to 58abc69e479cf5b36c4fc4287a11c9d92d2ce4b8:

  ARM: dts: ti: davinci: Align GPIO hog name with bindings (2025-02-03 09:11:33 +0100)

----------------------------------------------------------------
TI DaVinci updates for v6.15-rc1

- make GPIO hog names conform to bindings

----------------------------------------------------------------
Krzysztof Kozlowski (1):
      ARM: dts: ti: davinci: Align GPIO hog name with bindings

 arch/arm/boot/dts/ti/davinci/da850-lego-ev3.dts | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

