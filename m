Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C1CED5AE60
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  7 Nov 2024 06:13:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=mdcIOwk3kp77s1l8BhKYHWZOlMgYXx/DfwT+R9F7N9E=; b=b+h4FMeryiv4wVq9c0aRchrF0U
	C5z1bpMA7rLmxVYdLcujRUUoUl2j6z/tirYWWxTpxEwj5AlEEoduJ1MWGauJt5HPR7v+TgGau0lxq
	YfZuGWUe+DMv1FASDpajQa16HjLg3/b1OgFlz4wzEtnt6UlxtZPpFfPcMUU+WSG0Lco7A2WaISLxO
	Y54GmDQVHgjJY4JLY8PdtettwNtk7t2R+plVytHXaRsPD1yjQ5fR/k0JFmQaTwYAo7iBKqsh7LnDG
	3fIX24kaIax8MORQWBkdk0Y+40uWAErrRLaSo2fikg/UtfVwHte8ygdVkZP2/BFxVlcJDLShwI9wr
	mjtTzVng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t8vlg-00000005o79-17EM;
	Thu, 07 Nov 2024 06:13:20 +0000
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t8vjv-00000005nlD-2Zmr
	for linux-arm-kernel@lists.infradead.org;
	Thu, 07 Nov 2024 06:11:32 +0000
Received: by mail-pl1-x633.google.com with SMTP id d9443c01a7336-20c77459558so5665975ad.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 06 Nov 2024 22:11:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730959890; x=1731564690; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=mdcIOwk3kp77s1l8BhKYHWZOlMgYXx/DfwT+R9F7N9E=;
        b=Z47wRzRiIwMCHtrBMA8QnUwBnYSIi319d5Ai0ZrUzl9JwwbQchhf6suOvBUYV0GU3p
         LXGS5FCcP9HZTQnjjROTInIp1XXC7YMlNl4vWN3sw+HGSrH1XMB7R81Hk+Go8LQOu4tU
         ZA6+1ZhEJDSgqCrNcJb+T3AmnuWtoC15e23EOfVaQgIbVOG2Ljt6GvzUg8qlCpve1bZG
         1WM2BQrCqFmN4EdJl0kCc/4Bs4e2NzDE9tGjcM54Q5crh5d0x1TyUOOFIUJVkBZ2k28T
         KEA/dXDGDM9PnudE8wRYMqscWDWKV7KK9Tp7pgNthcDv8BIMKQgDglJW4ZJ2VEfBCDkq
         aH6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730959890; x=1731564690;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mdcIOwk3kp77s1l8BhKYHWZOlMgYXx/DfwT+R9F7N9E=;
        b=ASYadXXEyXxYp0sUbiRJrFkvRfkXmU/G+VmUQt0vw2LxSFNj18YNYjumroSR+DLV8E
         F1Ajp2LkGoiuZvWceIjZSo3VDbjX+Xq6VxuI3ARxESIpLRKSe3xCyT8swcqbtV54htz9
         VbFxEiYQh63IphugbbIlxSAK9R+4YYbqb9goXAB4Aby9ur0HO4Pep8LFCGAnDebr9KO6
         QWX/XSKoMZU7bIAJqtPYsLwlq5II3TrDawm2plLvXb0mBDai3Plidlr7H+u3PdsnDxMb
         w37g+z7Gcsz0mqSjva0Rkx1CKBr7gbKBCzmcfLrGuCdkTi+Vfj5TB0yb7caNY8E1P6BX
         uqJQ==
X-Forwarded-Encrypted: i=1; AJvYcCXd8UcA3QIWjaBrcz+gVlXuuXUISMJXpF60nO4SQ3NNCR33wiW09mSKKNUGGO7a1uU89hqlpiTLWFF1+vEabdwA@lists.infradead.org
X-Gm-Message-State: AOJu0YwA34mwDvcozqiZJo5DN0vQD9eN1oX31x488d9XBbI+/SJ5+pXC
	ZNwUHBr9743/j3tSnJhitdmgSx6CsIduzep3sJwQahmO8dKsZE5/
X-Google-Smtp-Source: AGHT+IFb44ve8UxBIvy91ELgGSUmf+xH+y8rohtBiFFGcFZF2HaHBFlJbfOx82kv14jZNYjFRB9GRQ==
X-Received: by 2002:a17:902:c407:b0:20c:da98:d752 with SMTP id d9443c01a7336-21178618acbmr7885715ad.16.1730959890021;
        Wed, 06 Nov 2024 22:11:30 -0800 (PST)
Received: from 1337.tail8aa098.ts.net (ms-studentunix-nat0.cs.ucalgary.ca. [136.159.16.20])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21177dc7cf8sm4652465ad.34.2024.11.06.22.11.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Nov 2024 22:11:29 -0800 (PST)
From: Abhinav Saxena <xandfury@gmail.com>
To: linux-kernel-mentees@lists.linuxfoundation.org,
	linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-mips@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-arm-kernel@lists.infradead.org
Cc: Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Abhinav Saxena <xandfury@gmail.com>
Subject: [PATCH 0/2] Documentation: dt-bindings: Fix documentation issues
Date: Wed,  6 Nov 2024 23:11:22 -0700
Message-Id: <20241107061124.105930-1-xandfury@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241106_221131_672870_62739EC4 
X-CRM114-Status: UNSURE (   9.82  )
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

This small patch series fixes documentation issues in devicetree bindings,
specifically addressing repeated words and trailing whitespace found using
checkpatch.pl script. No functional changes are included.

Patch 1 fixes repeated words in various binding documents, while patch 2
removes trailing whitespace from several files.

Signed-off-by: Abhinav Saxena <xandfury@gmail.com>

Abhinav Saxena (2):
  Documentation: dt-bindings: Fix repeated words
  Documentation: dt-bindings: Remove trailing whitespace

 Documentation/devicetree/bindings/gpio/gpio.txt        |  2 +-
 .../devicetree/bindings/interrupt-controller/msi.txt   | 10 +++++-----
 .../interrupt-controller/nvidia,tegra20-ictlr.txt      |  2 +-
 .../bindings/memory-controllers/mvebu-devbus.txt       |  2 +-
 .../devicetree/bindings/mips/cavium/bootbus.txt        |  2 +-
 .../devicetree/bindings/pinctrl/pinctrl-bindings.txt   |  2 +-
 .../bindings/regulator/regulator-max77620.txt          |  4 ++--
 .../devicetree/bindings/soc/fsl/cpm_qe/qe/usb.txt      |  2 +-
 8 files changed, 13 insertions(+), 13 deletions(-)

-- 
2.34.1


