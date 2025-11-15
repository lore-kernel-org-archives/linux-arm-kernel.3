Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12826CEB2CA
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 15 Nov 2025 09:01:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Content-Type:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Q0ZwHP0w/ZzXX9CPFHfzkBVRDrGDiIy2mewdqadHPqo=; b=zimJzJ84VQtHriBJb0v/DdjpFi
	5KrT6uylui/cyGBJXouMl2mZuSzYa3bxXe5tnrAsq5/Xt1a62RmMg3ehK1a8GzaA4yxHxQz9pBrTD
	6HSIq08eF1aKonxlrkvsNezhv0/0jTAzumzXpzoMkHLXBEg2TBP3p6Wbln1azNvtgDhCy9xl5nZ39
	Xmzj6TZWfmpwA9ENpZ9Y2yC0mTnXxTbWMY6b6/Gt+RK8TOAw5U0tXj56CMryRTBMGrnsVx/LA25QD
	RB9V35/ZAhRn/3siHGZIiGhgOnKILLHUwCon1Re6oLPv+jqBbdSlStFXpGXGpfr+dmJHfYBbhdbd0
	daGjq4yA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vKCA2-0000000DcAI-3s0N;
	Sat, 15 Nov 2025 09:01:35 +0000
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vKC9a-0000000DbzW-3qGF
	for linux-arm-kernel@lists.infradead.org;
	Sat, 15 Nov 2025 09:01:07 +0000
Received: by mail-wr1-x436.google.com with SMTP id ffacd0b85a97d-42b3377aaf2so1725785f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Sat, 15 Nov 2025 01:01:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763197265; x=1763802065; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Q0ZwHP0w/ZzXX9CPFHfzkBVRDrGDiIy2mewdqadHPqo=;
        b=F7I/W5dVurCiTUNawtOzeC4AGkYNhymX7knsI5FMUm6zrjPekkT/CqXmDbascx75zi
         Uz2JS38+5OQouOQJMKFT3/T2CFjD/wdV0i1VOOOgTcwo4q2wy5QqDQqeL/lfxPRR/rnu
         FM6X4jItjy6iaYsWd0pnn4/riaVs+/GlpjH/+fh7bnVjo1bEF4qpH/wHhhxr8j81GmeJ
         yg5U5jKVngwMdljclp+GMazZE3M0QsjaWfT9JfJO9adu5oFauFDJjS8ujMB09uysBvnY
         3ozTNz9e38VVzQYBtuCvWXf7tDc0vEWd8bixPlg7VCijE+D3lHrVZK8DKQD/vkVNpu3g
         sUNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763197265; x=1763802065;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Q0ZwHP0w/ZzXX9CPFHfzkBVRDrGDiIy2mewdqadHPqo=;
        b=ahaTeNfAAuHMxQDw3DU+F3pjbhHVL3oa2WTDJWawSz2/+AM00aM58+xUKzDXvDro5/
         kD6qoi9qtvhEEELACKKgvMquNbMlyNIxXZJDNqzOMcVgyXs5aLvLpLhe3DbM0rotWyrW
         Pb3A201lWedQLUffzmDlfroWueIpC1F8gNnlTy2I0tKQRY2gns4iRgMk1XpRXwySEXU/
         CInOdtbyKWbCLySZDxZ7wdz+ceOA7zPQy1N5XPGcr7tG4JoTlsW2E+XoO6fh48O94mJl
         jmsYwFI03Wnw/y+s5zlyhzWbB/33CrJjHq5tmTamOvTb0ME9orgCjC/KNZUSOHhN1m5U
         tLsQ==
X-Forwarded-Encrypted: i=1; AJvYcCUwftKWaELrEtOC2xsgKi/sDbDxEi+W99LKT8waYLuGMGlyTBgoKip5/Qwe3dvgmOPb2MCzycbGEvlOjxESI6CJ@lists.infradead.org
X-Gm-Message-State: AOJu0YwpwrBD3lUFp4eRN/8zUd0fjE/w5Sj5tXSAHWN2A+9zNJ43Pmm4
	269O56tbgo9ykNjaFErENYKFRi5uH4QFR/N4RQwPx8ftE5CU1eFevYZ7
X-Gm-Gg: ASbGnctr5UXAWK5eIMvyTdImaxU/If60z+JBvKQwEgZ4lHibbhGz4y5bJaixeYcZfCA
	ra6NwuolDrRfry/dHpblRm8VcqkuGCRNbceTl5PEJURHQ2ConqC/3cYoL8I8zQnj+WGGhlM6bat
	SLtkG4Y9sQrNyzS+dw6q8dMsVnrOv39B5scw2svWDYdB/4L+Y+Ckwnh71BvQU1+uQ9AOyyWOPqh
	/DXtKfrBignTTVJy6PiRIFsTctfX1bjEUxVrTpSd1NKVw3cZSRfS8YfJT8+mZ03geR1SO2EeBx/
	+Ujg6Qq4qzVhS/Ug0TLubseQ7ItwomC1vQVH9eFlJo9I2U/hUCQb9k+uPoGnHHLtRAL9dAokAjC
	sOM+WmU00FiNbVpI+qy2ysBDPM9kJ2UGAVNM/T/fL4qNiiR/Zmr7XSSTWjyvbD6DD6BcUT/hfUS
	P9DmOkEk4xVOxxaSVuXmq4gMzcCbpBMByd91094C3WoTDBsYC+np7O1szzJltXWDrRP3Fa
X-Google-Smtp-Source: AGHT+IHaz8rnAcDH+Ih4GXwMyi1IntfGLPFhdJ3V0CaIhnOCXB9/ZniCGlMvXD6/h8Eah1krdyuflQ==
X-Received: by 2002:a05:6000:310b:b0:3eb:9447:b97a with SMTP id ffacd0b85a97d-42b595b8004mr5910070f8f.54.1763197264994;
        Sat, 15 Nov 2025 01:01:04 -0800 (PST)
Received: from localhost (p200300e41f274600f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f27:4600:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42b53e7b12asm15080566f8f.10.2025.11.15.01.01.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 15 Nov 2025 01:01:03 -0800 (PST)
From: Thierry Reding <thierry.reding@gmail.com>
To: arm@kernel.org,
	soc@kernel.org
Cc: Thierry Reding <thierry.reding@gmail.com>,
	Jon Hunter <jonathanh@nvidia.com>,
	linux-tegra@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL 8/8] arm64: tegra: Default configuration changes for v6.19-rc1
Date: Sat, 15 Nov 2025 10:00:43 +0100
Message-ID: <20251115090044.3140331-8-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20251115090044.3140331-1-thierry.reding@gmail.com>
References: <20251115090044.3140331-1-thierry.reding@gmail.com>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251115_010106_959639_D4A9A1E7 
X-CRM114-Status: UNSURE (   9.00  )
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

Hi ARM SoC maintainers,

The following changes since commit 3a8660878839faadb4f1a6dd72c3179c1df56787:

  Linux 6.18-rc1 (2025-10-12 13:42:36 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/tegra-for-6.19-arm64-defconfig

for you to fetch changes up to 145cde94a5435920cb9f78aacfe91bea6795efaf:

  arm64: defconfig: Enable NVIDIA VRS PSEQ RTC (2025-11-14 16:29:44 +0100)

Thanks,
Thierry

----------------------------------------------------------------
arm64: tegra: Default configuration changes for v6.19-rc1

Enable the new driver for the VRS PSEQ RTC found on Tegra234 and later.

----------------------------------------------------------------
Shubhi Garg (1):
      arm64: defconfig: Enable NVIDIA VRS PSEQ RTC

 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

