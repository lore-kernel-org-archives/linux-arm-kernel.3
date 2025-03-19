Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06FB7C35FFA
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Mar 2025 15:39:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MFAUALr8nAtye3+ZWjuqCa8ix3cqHAZ7WDjEfM5Mp+M=; b=fmyAsigCTfKdpgMjnTj2pUcTQK
	+OTJefQfGWVZwb736mR4+PvZxuZhB7vhivlExi84//djdWJjXruFCl9T/FS9bkqtp5bbJ4UR5cYoe
	VGp+pdZ5p7XpK4lXivIlHGasexLrscJUBty2seqILNIFCCxgaY+ZqBN3zwoU2+pK4LaHZEYZe9Vpo
	Dl1ctEhItPPu6FbTpXSXh6JETKiQ82mYUJMHL+IsfHIis2Z2Bdw46cQeny6s73r/OVjrQISck4Xl8
	9cBERZudbvhi8drge/wTl4bBJTjymZ6oEyndrqSQklIJc6GxouXzSP05dqIsb1DwTYdMtjfwhr9RO
	OxBt6eOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tuvVe-00000009Pi0-3FzX;
	Wed, 19 Mar 2025 15:39:10 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tuvNM-00000009O13-1oT6
	for linux-arm-kernel@lists.infradead.org;
	Wed, 19 Mar 2025 15:30:38 +0000
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-43d2d952eb1so31570055e9.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 19 Mar 2025 08:30:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742398235; x=1743003035; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MFAUALr8nAtye3+ZWjuqCa8ix3cqHAZ7WDjEfM5Mp+M=;
        b=A4/TnCB160+AU1wa6iOErnsbc1Q3eWucWiFboZk7RIkleWrbQEhMGuZuIZbFUlgUub
         +49CKlD/bV/RXfWfSLCOZRdPPXFLEch2iXNxJTIAvpULoQtN8nnW5JfdOrErRe/7V5W6
         cGA+PCycFTg+nouPVrBH7z0bd74izwhujUv6xTbblRQbK2i4ZjOZChelq/lDHZd+LUjL
         ysodvZSTfQCTvASAH3jBXCDUEGdUwUM7KMcMJs5DDSSeR1qhPEzZoovceY+OiELlpj3a
         u3wfzBjPSsmq3Gkggk6c/vybQZTA/46HvArJFFInMI1BIlWPo1BtOHAWGfvSHyv2r+Mm
         6Ceg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742398235; x=1743003035;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MFAUALr8nAtye3+ZWjuqCa8ix3cqHAZ7WDjEfM5Mp+M=;
        b=X3PVHKrIRYKR93R1Ka4FyD2hYgdDo66AMt8OaYWkb9AI4VQPABdraYl6bimfyQmPCl
         nelWcP94yO/JR1JBZLZtA1R3S4yAMUGVXj92ebjG6w5nBc5LOJkYHX0jJrpMIn247h8X
         kZCVomm5yksMbcDAdGzw9ZYLJiUe36TUewA96JfmzRCTXMaQIlw0dD6uOwrOGKDJMRA1
         +WZodWibG3ZJxxLQ2UaJG18sILAssB1pBLM3AQ9MzY2Uoc9E7x9s1Lkyt9NDZrEHFAgy
         hgbHaaqd9hoZrq78+qNjqU4aYtiIPyfddeH1gZuexSwFdjBRxdf4GLdMQQ4fl+2qm/oK
         4s9A==
X-Forwarded-Encrypted: i=1; AJvYcCVjJc184pFmVi+f4QWCW1fbQ5tcisYvs1o/j8y7G91cMySVzeBwXOy2bqoNfa8YntcuULlZQGuxbf7T4wAc4Ck/@lists.infradead.org
X-Gm-Message-State: AOJu0YzKRmIgTKFS/vc1mV3K9LIaAYxEc95C1XEEC/EFk4QSn7b0b52l
	oTNFnMWX7AC031H0gdn28tGYrPC54LoA7QzUuYkIV4LHLC9bqQnTHOcAR8t3Ze4=
X-Gm-Gg: ASbGncsd59epFDJxrBiUJB8avKwkw4ecLXk2fV2s1HAbeWxUpblOiTyOX1hqTYZ5o/K
	7MgVJ/5DeV/1IJEaFLoeqmyGppxTpimA5V+YgloT2QFpGyfXAsBi/kdzlmX1HG63lx0hr/JcZWr
	CKrbAuKMTrETYOkR7KNlAdkHFquidzG1pYdO38xgseDcxSesVr9DI65RzRiPfeQgiGbU2QLC4rv
	WMVigzBM8Rpj0yGCNXdokB38Keq5U1M0jkM9pyf3VE8Zu8DrPcQc9T6+b+wT6uZ/ypoqoRU5UJH
	E4iB2ts0VbZub8GUoJjwdXzIsNhgtEtykkBtaj+VANNsIHg1dW9k1dNdjmx5CURzZ9g2x6ZTmtd
	73c7GBKdHbzw=
X-Google-Smtp-Source: AGHT+IEHXtC0EIKTh5C5yDLtKnopzR+kKj3o5MrwB8zEIjbuESCbAMxGj1QGIrHhGz+ceqR8jXdneA==
X-Received: by 2002:a05:600c:3509:b0:43d:79:ae1b with SMTP id 5b1f17b1804b1-43d437a9541mr31446495e9.14.1742398234649;
        Wed, 19 Mar 2025 08:30:34 -0700 (PDT)
Received: from gpeter-l.roam.corp.google.com ([212.105.145.136])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43d43fdaca8sm22590635e9.28.2025.03.19.08.30.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Mar 2025 08:30:34 -0700 (PDT)
From: Peter Griffin <peter.griffin@linaro.org>
Date: Wed, 19 Mar 2025 15:30:21 +0000
Subject: [PATCH v2 4/7] scsi: ufs: exynos: ensure consistent phy reference
 counts
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250319-exynos-ufs-stability-fixes-v2-4-96722cc2ba1b@linaro.org>
References: <20250319-exynos-ufs-stability-fixes-v2-0-96722cc2ba1b@linaro.org>
In-Reply-To: <20250319-exynos-ufs-stability-fixes-v2-0-96722cc2ba1b@linaro.org>
To: Alim Akhtar <alim.akhtar@samsung.com>, 
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>, 
 "Martin K. Petersen" <martin.petersen@oracle.com>, 
 Krzysztof Kozlowski <krzk@kernel.org>, 
 Chanho Park <chanho61.park@samsung.com>
Cc: linux-scsi@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 Eric Biggers <ebiggers@kernel.org>, Bart Van Assche <bvanassche@acm.org>, 
 willmcvicker@google.com, kernel-team@android.com, tudor.ambarus@linaro.org, 
 andre.draszik@linaro.org, Peter Griffin <peter.griffin@linaro.org>, 
 stable@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1228;
 i=peter.griffin@linaro.org; h=from:subject:message-id;
 bh=3SI4bC7ybL3N2FRvbuwPacvlxHEWeD8IolpWQSN1KPw=;
 b=owEBbQKS/ZANAwAKAc7ouNYCNHK6AcsmYgBn2uMR7Gt6GMiUHhQ9tNeB1ryvfLXf0f6hKBg7Z
 AIUaxYvoPqJAjMEAAEKAB0WIQQO/I5vVXh1DVa1SfzO6LjWAjRyugUCZ9rjEQAKCRDO6LjWAjRy
 uhgZD/44yhmeYZZzFKVFFjq28rha6NHqeREb1/qoxysPC7HrGnjsYlpYk7SLWHWWcyjtwhG/gMt
 O1lVZxIDu8c7fSHM8+Z80aiXDkcsmEARfOUrD7rvRCij6LS61K5swgmRoawpJUwVvovpsoSW0g5
 ABdLqjCx+iqyCQMidJfzV25UAHL4ymc/kVXCFeiVTBnnTndKQIathuUUcIEm/D2p1t+jRbp1ouj
 psGLVwlAg4zg8pKpXLOUq9qzcfjC45NB8RsIepMMqtHXKaJISGMHXLd5hVa/TNrEeTA/cPK42UC
 gzzSTMDl+u11SC4wzQJW1pGjPumuXTS5esnkGul/VvG0fkXHdp3YuGBE3rnUUwFqjGqOmH5yoXs
 Y70vVU28KnxP2Fnhhl1lONhMkR2STrszNmC6huHjeZtsh4TFCSmXHmLJh0xpisMoQmlN/30pOcl
 RRN4m1DK7nUiauvbcCVaPdj5P6RmbOYJtDqUCqON9M/eQo7wP4JYkQZi5YQHNXvOx1YZ7jHq5jc
 mfPzh2Tq80p/hi0O56Kgz0Ehub3xxNXIikH/CGYwVORuo/Gmg8U1YYHcER1HhltRaAp1JQPrDw/
 c1f/EAeGILL0PZnv5PKrNi3kkPLIv224YLEkUbnDCaWb9v3eW95YQeb7mFh8wcQGHiwEF+mqTl6
 hymvqaPAm/4Doyw==
X-Developer-Key: i=peter.griffin@linaro.org; a=openpgp;
 fpr=0EFC8E6F5578750D56B549FCCEE8B8D6023472BA
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250319_083036_503508_579E0097 
X-CRM114-Status: GOOD (  12.54  )
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

ufshcd_link_startup() can call ufshcd_vops_link_startup_notify()
multiple times when retrying. This causes the phy reference count
to keep increasing and the phy to not properly re-initialize.

If the phy has already been previously powered on, first issue a
phy_power_off() and phy_exit(), before re-initializing and powering
on again.

Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
Fixes: 3d73b200f989 ("scsi: ufs: ufs-exynos: Change ufs phy control sequence")
Cc: stable@vger.kernel.org
---
 drivers/ufs/host/ufs-exynos.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/ufs/host/ufs-exynos.c b/drivers/ufs/host/ufs-exynos.c
index 61b03e493cc1ddba17179a9f22e5b59ece02458b..34e16e198830d086cbdb6cb0b027ca92687b2ae6 100644
--- a/drivers/ufs/host/ufs-exynos.c
+++ b/drivers/ufs/host/ufs-exynos.c
@@ -962,6 +962,12 @@ static int exynos_ufs_phy_init(struct exynos_ufs *ufs)
 	}
 
 	phy_set_bus_width(generic_phy, ufs->avail_ln_rx);
+
+	if (generic_phy->power_count) {
+		phy_power_off(generic_phy);
+		phy_exit(generic_phy);
+	}
+
 	ret = phy_init(generic_phy);
 	if (ret) {
 		dev_err(hba->dev, "%s: phy init failed, ret = %d\n",

-- 
2.49.0.rc1.451.g8f38331e32-goog


