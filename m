Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67F26CA1012
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  4 Sep 2025 18:31:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=wYkWbCvyzrXYcRtGccULZYx96qOTZhMo/W/nEtVwCNo=; b=XCM6psFThXCBICcf4H81iDfoOo
	DBVVO4+G2BKMJ7kzIrd2O6HffjzNPuoTUNfBLtCH97vF9hsphKa8Te2fWoLwqqI+IMmGoB90DsRCu
	WrK1yb3TMd1n045nlR+EdHKE8Zan9jRmRSapONV1GYDGjpbx/oaLchySPa5l4NzMj/X9eRz+kGFeU
	z1osSuFps3bU+SEBaspnH+T8hS0WmKTqXbls8XgmJLmXmmP78+rDSz7QuzZAnudTuq6GYCwp7ZcnQ
	voZKuEbvrT1CmMAVRJoGxZvUwqF+ICszUE0R33vTLSKoCNbevlGVKy8MdOBRRMMnib+xbwOf9yEq+
	tZ87iQog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuEkR-0000000Daa1-3NLp;
	Thu, 04 Sep 2025 18:31:52 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uu9eS-0000000BlKM-0FTA
	for linux-arm-kernel@lists.infradead.org;
	Thu, 04 Sep 2025 13:05:21 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-45cb6428c46so8057445e9.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 04 Sep 2025 06:05:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1756991118; x=1757595918; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=wYkWbCvyzrXYcRtGccULZYx96qOTZhMo/W/nEtVwCNo=;
        b=ODaizJezgkmOaFAM+nK7qWpI2y6f6CtjITx37Ku/Lfi9KNCu5lrdcZwV47NtJeloMZ
         mtp5el6yQ4PP57Qze4wrK6TzhyB9L5ZYW8VWb27vinjrPhSV8SLcg7bkIlBNGc+123CU
         60L617HjH9dD/F3JjDIrLxjcPZKhI7U63rvDrEj+fOvsZ7MSLxo3m8Ew0nbDOWQvSrov
         nEqt5x4Gp2ErbKl7bXSND+rwWcUr5gp6Ziw7EUxHvo4Ox2gFKSEPqFLyqQ60XNkW5pym
         D1FowDNd7YP6aLaFRGoIML6CvJaAazZaDYl8qT6giYbz+E/OawVlB3gzFPq2b0Ue8Ey/
         uLIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756991118; x=1757595918;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wYkWbCvyzrXYcRtGccULZYx96qOTZhMo/W/nEtVwCNo=;
        b=WR8n9RSLs0O5B47innALmtIEOBmHcqZq3FQF5Q0+h4j9c+v/RbmE5RuC98hBTJYp03
         oKLbm5Jx6IeAwgpsSVPp7qUis2lQaqC628zJhb747GnWYlolwQe8xXiE9Sb7J6VX2pRT
         p854esEMZFS4D7jqkKIZPNT8bDead2RwdVwTWkr+LIBPwA8w3MmfgnRLG8u/P5R9NbFv
         aUU5txcQ3PZTb/1Qpcctb9XuHSyczlPYNlOLO9C0g28LPW6X0Ems6jYOZohDzfuHmVFq
         +oin1ZftoWhV9vKs+SSNmDy96K9lGNTG0lFTta7QuygenmNorh0ixKEKxKNrR9XuksEH
         xmQw==
X-Forwarded-Encrypted: i=1; AJvYcCVUsnE+lrQ/NfImfAagEiq3c83mlNj5c4EsiD1Mqn56AB5i/KytQXrZ6f9HREr9Tdd1higxNCJvuboJbKBtczZz@lists.infradead.org
X-Gm-Message-State: AOJu0Yz0qNTK0k3HjEBo+8vDnRGK+lW8NNlQhiLez1IIevMPHlC66Lds
	02P6QOa96pcKGH4D2glpmYu/mPgNfsOAQqfV89Ha70yGpvVzqjUF794l9+MdB9fH1ak=
X-Gm-Gg: ASbGncvncZZKcXIOxjBoBnmvrl5was7wnVVnC0rGphoZFtdrJkB1+Ft7rIr9A125bcn
	BMSbHcBt1nUNJW9in2bmSIBm6lMx7neaxXP6tO9DqapfHwVv63ADu7tjQCozZtCnqavLCooo2Ce
	8HW0tC0uYn4ZdGrjmeXSjipZgp1oQ0DyRX55EkG1lT2LPzlZ+8/goaWycQlGprwkh+Gxln85+Hi
	YctzRV1H9D3A6ib8Vn/sn7KOW8KWtGxIuxU6w4MtkX+bJEtSYtv1vHMNMPQn7uzO0W8sd/5litv
	Pz1Pi2NXnRCBEm6HrNq6SeSEpriHeyHD/FEYGCFhjIkQmelEoV9y8FrOvnJcABrUCmVz7PztxHK
	m8mkTicYqjOsg1nfFcvQwxVrqz5c3zmOn6A==
X-Google-Smtp-Source: AGHT+IGeiyinvVoDIY4X2T0SG++4d/2SLzsdQmO+tL6RfTknWDo1frGnFfVgbdD6pRFAo9bc8mLUsQ==
X-Received: by 2002:a05:600c:190f:b0:45b:8939:8b03 with SMTP id 5b1f17b1804b1-45b89398d27mr126045955e9.27.1756991118284;
        Thu, 04 Sep 2025 06:05:18 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:6e82:a4aa:49e0:a7d])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45b93fae643sm131185925e9.3.2025.09.04.06.05.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Sep 2025 06:05:17 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Lee Jones <lee@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: linux-kernel@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [GIT PULL] Immutable branch between the MFD and GPIO trees for v6.18-rc1
Date: Thu,  4 Sep 2025 15:05:16 +0200
Message-ID: <20250904130516.72266-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250904_060520_098371_AEE324F9 
X-CRM114-Status: UNSURE (   9.63  )
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

Lee,

Please pull the following MFD changes that depend on commits I already
have in the GPIO tree for the next merge window.

Thanks,
Bartosz

The following changes since commit 8f5ae30d69d7543eee0d70083daf4de8fe15d585:

  Linux 6.17-rc1 (2025-08-10 19:41:16 +0300)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git tags/gpio/mfd-stmpe-for-v6.18-rc1

for you to fetch changes up to df6a44003953fb23ad67f82d299e439e7ff7150a:

  mfd: stmpe: Allow building as module (2025-09-04 15:00:53 +0200)

----------------------------------------------------------------
Immutable branch between the MFD and GPIO trees for v6.18-rc1

Allow building the MFD STMPE driver as module.

----------------------------------------------------------------
Alexander Stein (1):
      mfd: stmpe: Allow building as module

 drivers/mfd/Kconfig | 10 +++++-----
 drivers/mfd/stmpe.c |  6 ++++++
 2 files changed, 11 insertions(+), 5 deletions(-)

