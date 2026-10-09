Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E0ABCA5FED
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  9 Oct 2026 06:10:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Ax4ioHhBTibMhrV/ZkvgxvrIeWrtpbyT/2pgDBLqygs=; b=avrUjddM/vE07UWRcKG5/mkQZM
	NDs7++nZ006dX9m8nMV7VrzXPuaSY8B7mZ/rDUu/H5p9pQ6D5frhJ/oX53pDzRWfdb3uoIX6PfV33
	xis7EfIpy0R26yuQvPR8qBWAZ3NcYmkAgZAajg7Yt7wZmLUiyee1JkIR3rPVUU6bxJyzs7/Xvmgjm
	uH7oIv6kkjbWOvSElfGj7EyuKKq2J5AXrj0dRkn6z3KKpb6EQEFNplExjwcrqXBIXsk2DgaWYjy4L
	cB2t2z+lUt7TNxjwUuxV+rPnHyuD16nldqtXAyX4qxP6L8QLwnTTxWV2BQoXPY9bMlCwyGw2qm8nh
	Dobg48lQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xF3oa-00000005ay7-05Gm;
	Fri, 09 Oct 2026 06:10:44 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xF3oW-00000005avn-0ueW
	for linux-arm-kernel@lists.infradead.org;
	Fri, 09 Oct 2026 06:10:43 +0000
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-4a16c1608faso15725255e9.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 08 Oct 2026 23:10:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1791526238; x=1792131038; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Ax4ioHhBTibMhrV/ZkvgxvrIeWrtpbyT/2pgDBLqygs=;
        b=OkwGiZiP5Yk20BwupgqdlM0HliQaagqEIuHdESIJGxogU52h8J6USMFt1EWxcS7HG/
         Ui1lK1x1d5WT6J/RST1mpIOA0iZplIben+EOVmbRm/Ld0Ird/49ZC2aWUKVlHXtw7VEj
         wfRJynoc4t2+3B4jq5LQ4OcChgN6XcwycsBWLFemA9kE4mzGCzd3fz4EWYcbXYMZGa7r
         7aMpnG8ZHAWWIS0BB9aMuifCsYdiDAcIexFuqSQ3eCInzBm3TAE/rCy9KhwJVAJGcGae
         LUUBnHGvy6ODF+ulzRaOEqLryjNTlL5NIo4yWRdGpmV5Q6//V1tEPmWobXcqidR8i9Lz
         OucA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791526238; x=1792131038;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Ax4ioHhBTibMhrV/ZkvgxvrIeWrtpbyT/2pgDBLqygs=;
        b=Dz8GaGKYtY5IArWfNWq70Mksavyc8TnYpcsa8MGT0pP/MYjTQmyVa5EcMBEjTV41KJ
         jC4lVnRxHJAkf3Chm7R164bk7Dsyq+rNbHbxnhtVFUdp0qcPK1yFH8OOiPKlvqdCsXjd
         oX2gyfKNZMG5tgUQx3xObpGBxOE4BRRTqBvqjZNkRxmnnjK3N8OnftWZFBpJEEZIM8U4
         EDBmpV0chjuo55xANAXaaWsE1Z2kPWEFmq5TwyniWOMxSe//POPT4VUSnvTWRxLKrgC9
         fzppCz1mJDOD6yr8w0ix0hfZhTESeukxby03rO6h8UU5nnN3hDXF27SrvDY6+6HWRtO9
         elsQ==
X-Forwarded-Encrypted: i=1; AKwUvBwUOvE/aNqvH6wBbxV9KdFOc+ar6/ovy15EjWWdc5iWVDPhVgptnpUIaIP9iQ4MASNhAx+FRmZCkNC9eYVaPoUt@lists.infradead.org
X-Gm-Message-State: AFuF++nRtLuBA7A8VTf7iG/4xs5mqOLOb5oHKdWverye3FtaplzLKjEN
	QM4Y3DIloibUygJ2UetaslsLtWbcVfFaOR0v/F9a78Hty5La7ioV8dVf1cOPB2RIaD8=
X-Gm-Gg: AYBFou13MMc4HUZg+fkW8NIN0UHtJKkl+DG9QVhyU2H/E6rYXdtqkG0ojyP8eEVYokf
	nqMFewkgmrLZfZRwcQSdQNRXisbBTckvei5BXRDO8s+gL/Vu4UM/8jjUlVWn3zqSmH05qgNV7Bg
	/17TeLMu/a5MjfeGQ+50t+YLTzictwvqI/YUTBUNURoCnztWH/5HbWz1I5wqeLHHyZG05y1ggvy
	fT41iNTUTwiiHXo29rVW+SkGs+xJgVI45B7ijKcfFTrbW59JUNWfNtbp/yvW9CAO1eWldC5njM2
	lLnP/+rumbnmla6Dhm+srNRZ1BTKoCcBKijOdCeqHQdo9+3k833F85sXsldKfnJWVu/nAE5wyez
	Hq+Mone7+IEQCCO7XrJYmxuxzVOpoavUiOnXBN2HwtFjg98xHHSMAQ4j0yBiiIkoK1INQXZoHEb
	TOorRta44toRgLpzgc+Ci5jObobbghn/kreJVGPaFyFkbm4CgLw0qNGho3610EKwTF3kFGydO6j
	D8aE0qbrBKVSbtjPLg95WBZYrr3rLwOohBYH1kHEZc=
X-Received: by 2002:a05:600d:82c5:b0:4a1:6282:1cf3 with SMTP id 5b1f17b1804b1-4a18e497a94mr15845945e9.9.1791526237748;
        Thu, 08 Oct 2026 23:10:37 -0700 (PDT)
Received: from claudiu-TUXEDO-InfinityBook-Pro-AMD-Gen9.. ([82.208.30.17])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a18bf21276sm56616715e9.8.2026.10.08.23.10.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Oct 2026 23:10:35 -0700 (PDT)
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
To: soc@kernel.org,
	arm@kernel.org
Cc: nicolas.ferre@microchip.com,
	alexandre.belloni@bootlin.com,
	linux-arm-kernel@lists.infradead.org,
	claudiu.beznea@tuxon.dev
Subject: [GIT PULL] Microchip AT91 fixes for v7.3
Date: Fri,  9 Oct 2026 09:10:34 +0300
Message-ID: <20261009061034.29475-1-claudiu.beznea@tuxon.dev>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261008_231040_362315_C48F5DC2 
X-CRM114-Status: UNSURE (   7.46  )
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

The following changes since commit cee9395acd8043be0644b25c34bfa86623f2b935:

  Linux 7.3-rc1 (2026-08-30 13:34:40 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/at91/linux.git tags/at91-fixes-7.3

for you to fetch changes up to afb1ecfeda3fc31d6300a176f4854cc62e289bf3:

  ARM: configs: sama5: enable current Microchip KSZ DSA symbols (2026-09-20 16:22:20 +0300)

----------------------------------------------------------------
Microchip AT91 fixes for v7.3

This update includes:
- use the correct Kconfig flags for the Microchip KSZ switch

----------------------------------------------------------------
Pengpeng Hou (1):
      ARM: configs: sama5: enable current Microchip KSZ DSA symbols

 arch/arm/configs/sama5_defconfig | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

