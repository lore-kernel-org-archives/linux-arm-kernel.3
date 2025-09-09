Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50470CA0FED
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Sep 2025 18:24:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=WWPK6qiwC5pY+gvwfZR7zxOqiXiBtA6mSbWCJx8aeqw=; b=yLzqTBxGHVDuHF6b1wmwGkDWKS
	zfAlJmBJ7eaID2pEVCk7fOQVzWL7V0Z6R3ZLVKxEzXju+ES1bPjCRBJeEOOo1UvK8SLuo28CG6t1e
	oojZDTL812tMM8ONPOEmzeg1jmzUO/rVikttvoIQcZl8zRwdXAuuZo33edy5fjIsDwZhU7ut49Kbt
	4f+6NfgDgd+u2quVc8v3/hKEbgqxoZsUkITx4s8d6MM6Prn7B3UGjmo5UuhYKuh4vl8ucJfdObFiP
	iEbSt7ASHrbzMgE7/S1UUI6VzW+yl/Fjn7NcURngyNj1H0Zxj0jK0YbcMwN/i0xAmz5iHj3Dh2LVn
	/RlnSVVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uw30f-00000009OiC-1N4O;
	Tue, 09 Sep 2025 18:24:05 +0000
Received: from mail-lf1-x129.google.com ([2a00:1450:4864:20::129])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uw30d-00000009Oev-2Wi1
	for linux-arm-kernel@lists.infradead.org;
	Tue, 09 Sep 2025 18:24:04 +0000
Received: by mail-lf1-x129.google.com with SMTP id 2adb3069b0e04-55f7c8b38a0so937533e87.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 09 Sep 2025 11:24:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1757442241; x=1758047041; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=WWPK6qiwC5pY+gvwfZR7zxOqiXiBtA6mSbWCJx8aeqw=;
        b=aCzn5cbrDRmFc000+ZEVGmMjgUT9lqlGTT6r/4iPTF2Ch5HivwD+2ig5lPVtGYMZAi
         j9oISfpx7xtTeja/XktTVm3BT0ogEC1Wqp5X3+oNJBU1OJE0+lqxdDeA3rOuK5700ZYo
         JNZOlLKxFtf9OGkRrbaMWAOD5dVYaPTnyn1DP3JLiCOZ/zbTcogZHtHCZ9xroABC1Hdo
         d1gKRuNQhdj/9NYioy3xDsEJ5tHxSTwrgTQH0ZnXmY4wkCM+/EljhGYryePSJ4TOjqSF
         gknXC9Sn0JfbPhNRZJ2s0N6Atkzb+U+ilM6uJneeHkwjh7pBEAncuJeAKgYZXgN9kNh0
         zHTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757442241; x=1758047041;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WWPK6qiwC5pY+gvwfZR7zxOqiXiBtA6mSbWCJx8aeqw=;
        b=nnkmVoNLSxKIA+0U3DYxiLVMIjdBEUrj6yOrNLcomFiPmgw1EcSfz25TK3/Ra9DA02
         SWUKQXBWpUeFqLaMs05kqc3k++jU7ToRWv7t2cnWPdnlau0hWnYCv+/0R03Ur9dxof8S
         Kcysc1J6/O/7P+qYRYTwOJG12SA7S+lBBjYyvPydrCIgdSaIwPAhD2GLHRAcsH7Fc4L3
         UcsnzFKe9TlgyBs/Xho+xf7oOTiNf04COsFbq2Q9Q2mkoaNuaAjHKmUmMV5/0vTIP8zr
         aYDZV8egF94wq6IyZoEIgsSOVfavFFSGoezCJ0zWCYBseGotkTICdzVXky1lkeyVpoGP
         FKkA==
X-Forwarded-Encrypted: i=1; AJvYcCXT7KjC3iyMF1iR8fWwbz4vnDNRgc0aSeuMLbOvmlMbQQAEDHanNLKsSeNo6LhAcYII6WSU3XmJ1EFSfcAv8EJJ@lists.infradead.org
X-Gm-Message-State: AOJu0YyzXVVUCg6SxfaC9fLuIDHCb7MTd0R+xbU2wQxlYMt+AF7WGnRD
	/HSY8m3qXfx0x/c8NGY20GJWNDJmYBOylPnSiVv2R1WNp2QghrLsoYZxNDXskbgWRsM=
X-Gm-Gg: ASbGncubUYYwqZnWvVflr2+7nkxd6WRQgcoBm58RUIKHurBxh078M7jHoSb5laNnHzX
	mBkHiSKEFrsl91UDhBgMlKvoUrinOjkdgwmCXIcnwspTbeFgRKSpX9s6odU+Dazswooin8QXHIp
	MJPIfDTM9/19219cXSTrwwJdYq6bQWUn0VTAhwxUzl22R3p2lw1DNrV99AU+Cro5xI1fWp+f6GH
	rJRmfrnsWRccVqudQKA7Uv04vx+RuNql1jbamZz8L3laRL3uG3qP5vGSa2BjrQbvkbCBw7YEuQy
	4iYWiZqVHA+aiW0VJJ/x48PMgEJZZrtsKnww5FPUzMnOa0frIfrYrTDhcLEAlgWzSkCf/TirCcZ
	rEP26Mr4/ttpj8QWex5qr/pQdUqNBB0J4xQ==
X-Google-Smtp-Source: AGHT+IFKUMj2Ann+5FvQWmTru0FFpd1c0y5YYx+6dgpjzz3R0gwegHovdsmJzRrG+FbV0JmNIFTadw==
X-Received: by 2002:a05:6512:61cf:10b0:560:986c:9b4c with SMTP id 2adb3069b0e04-56262a40f5fmr1551769e87.6.1757442241028;
        Tue, 09 Sep 2025 11:24:01 -0700 (PDT)
Received: from kuoka.. ([178.197.219.123])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5681795d757sm676071e87.82.2025.09.09.11.23.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Sep 2025 11:24:00 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Arnd Bergmann <arnd@arndb.de>,
	soc@lists.linux.dev
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzk@kernel.org>
Subject: [GIT PULL] arm64: dts: cleanups for v6.18
Date: Tue,  9 Sep 2025 20:22:56 +0200
Message-ID: <20250909182256.102840-2-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1713; i=krzysztof.kozlowski@linaro.org;
 h=from:subject; bh=PYpuE1bg3M8RrfKVn/z5QPHZvCyw0Q4F4OFmwIUXtHo=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBowHCA48KtemWMzw1tyv2NmUMBfo7b8GHRTLSZU
 QGFn/XMqgyJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaMBwgAAKCRDBN2bmhouD
 1wcPD/9nMH+muQgC86bN7iFNvLm+8O4InFbUmjf+AamXpj6CNoZ81ArlR0OgqmaG696pZh8+RKz
 r07DvRWDwSg2rSA1iAc6r45EvvPa2RCLFujMCLgp5llAixbu4GGVn9xvr9/bjUtqYIMcv7l8Xt7
 VGZouaW2YwL+t/wgOuBuA4dBvO805/I3XOwpXsADwrBfXtUEEH5Dr7dYeULkMB6HyQTYUWqaU8e
 mhnxKqrpUeF46mWVV1O7SWPswl7ieI60I6pmfFmn7eWbis0K4ihsCE3VcM9wsbT+OxkWcO5F+WE
 Be4c1TzYiMA6vEzRkiMFo4egPhwxfdYp3eaO2DyXBTCoNjJmmc4Ymfy+pKvCxTJ03sl6rEpsbfQ
 rOJNaon/J4sU0pz7pvecYodoADx9U8Y2RKpCqt6S/215BEOneyXDfIu9lMIEgoa2tpomeo4aVi0
 NSKYCbqjowjxRQsEwXDTmRteMjDyLAXgu517Frl5nz1B6EquOMKNecVjF0m+rJ766gonkY3frfF
 /TcJulsVdCrV90Nf/NCGpvCfa8WGrCtjAOO5oiZ/SkppfPy7K+PWIcdONYAwDIKJ8jwOhg4Loc2
 t9j2UuQUUXiwx8rqagzMLmCpJGn+Kud/g1/etDtKEWAtVHXDKZiUSX7zUu1KftuvbgsMH6AsvX0 KY2NQzSXvxETe8Q==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250909_112403_661454_104E967A 
X-CRM114-Status: UNSURE (   8.48  )
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

Hi,

Few cleanups which were not picked up by their respective SoC maintainers.

Best regards,
Krzysztof


The following changes since commit 8f5ae30d69d7543eee0d70083daf4de8fe15d585:

  Linux 6.17-rc1 (2025-08-10 19:41:16 +0300)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux-dt.git tags/dt64-cleanup-6.18

for you to fetch changes up to 7ee0f223cabe9b9384250024fec577c731cbcf72:

  arm64: dts: toshiba: tmpv7708: Add default GIC address cells (2025-09-04 15:50:47 +0200)

----------------------------------------------------------------
Minor improvements in ARM64 DTS for v6.18

Add default address cells for interrupt controllers to fix dtc W=1
warnings on Amazon, APM, Socionext and Toshiba boards.

----------------------------------------------------------------
Krzysztof Kozlowski (6):
      arm64: dts: socionext: uniphier-ld20: Add default PCI interrup controller address cells
      arm64: dts: socionext: uniphier-pxs3: Add default PCI interrup controller address cells
      arm64: dts: apm: storm: Add default GIC address cells
      arm64: dts: amazon: alpine-v2: Add default GIC address cells
      arm64: dts: amazon: alpine-v3: Add default GIC address cells
      arm64: dts: toshiba: tmpv7708: Add default GIC address cells

 arch/arm64/boot/dts/amazon/alpine-v2.dtsi        | 1 +
 arch/arm64/boot/dts/amazon/alpine-v3.dtsi        | 1 +
 arch/arm64/boot/dts/apm/apm-storm.dtsi           | 1 +
 arch/arm64/boot/dts/socionext/uniphier-ld20.dtsi | 1 +
 arch/arm64/boot/dts/socionext/uniphier-pxs3.dtsi | 1 +
 arch/arm64/boot/dts/toshiba/tmpv7708.dtsi        | 1 +
 6 files changed, 6 insertions(+)

