Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C61B9C83038
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 30 Jun 2025 19:39:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=uSnBBrW7DyQ9uDD3D8W9h8fjOrHlTZaIJ8+vrX+84dc=; b=FZUZm6wueHFtv5LQWp57XLIolK
	VyXDvQn8wQpY3HccORlNODg98VKT46TcrEYAn4j7CRlqus2JSLZCLKvaNKVhX11NvawjFlIAjqOfd
	43aV6oIOLj19JTzsAR0R+RWMw2Y/vRBcKeXAfsVWrt4z7aFhvMYgdeeGp/Lmm2ZXfsad9YrT8OMlh
	TcVGDePGUMU1652A2iitnP/Ma4dPMd+gJvJsvQ73jBUOffdkHsBceFD2gPZr/YANa4O8YrOM2qIlm
	tNv0UEukg431pH7lnXZ8gwKk9LPrupeWQSNo4rGPoFyHG8XG+9S2ASoDgpyPIkg8jngnniIkRhOZR
	jDOtQTiw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWKLD-00000003JdA-1OBl;
	Mon, 30 Jun 2025 19:38:59 +0000
Received: from mail-oa1-x2f.google.com ([2001:4860:4864:20::2f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWKHn-00000003Iu9-3xuZ
	for linux-arm-kernel@lists.infradead.org;
	Mon, 30 Jun 2025 19:35:29 +0000
Received: by mail-oa1-x2f.google.com with SMTP id 586e51a60fabf-2eacb421554so706297fac.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 30 Jun 2025 12:35:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1751312127; x=1751916927; darn=lists.infradead.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=uSnBBrW7DyQ9uDD3D8W9h8fjOrHlTZaIJ8+vrX+84dc=;
        b=PtS2aLqhe8TUQgMPLVFn6riBckTuTf0VUaHI93eWOa+zeq4hBKIFTGGJ9rV7yVmN84
         wgV7BeKsWWaznbgnAOPGP+1Q2BVc6lLe+vpkj/J+44bXehM5X0d37d6A6tDRy6y+KOq9
         GQROhmdEXVY7ibbOtKTF7pVe7xuhCiv9wuJ6R43P0OVBmJCdBdSqPP8OXVZtopI/YZ2C
         l6xU1sLt1XAc1Sk0OvFxyA+6bQde61ug5HNRY0HLF6xAbOU8CeUyImrgtub5jlPpn4y0
         IoIKIfyXnhDWrhZ2jujvw7WDUtjYCd4jd3CqLM732aD6lX2lD+f1/HW7Pg3sp4I9eW9D
         OXjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751312127; x=1751916927;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=uSnBBrW7DyQ9uDD3D8W9h8fjOrHlTZaIJ8+vrX+84dc=;
        b=dzdYqq+EV+kRFrky9u8P4Jf2xJrQdmavZh8DtqUfzoUudeNgwkhzuC0m9KquYXsMBI
         +RSHcju4VuR9alJRv4FKPJHoxW/j7RdI1AgBDSMSif0fzHTQA9ScbUgX1VDJaltc0QN5
         5Ljzja3LHTNfBwuvG4pwlK2HMVNTNbQe9thID9vRR3icZqqryhy2mrZMcSnUMuWJ6PAd
         3EGkzcYSQj1qVkAPFV7GWtovKMGD58nXO20TnY624isGXnIrC6WYRsoi4KbeAmvm7iMr
         4HuwLNxhF5nyvF7zMa0ERQWMjucUTxmNiVXZU7ERWc9Lk7s3HAICErrVhHgAOVuRI0e7
         8yNg==
X-Forwarded-Encrypted: i=1; AJvYcCVsK03ExGfMUYOkmtwR7gwr8ebJSWIn1jIAcb/Z6wRUJ8ARHCdD5XcU0Pw9mJq0IUz684iOSqtKEYYjPO+WY9kS@lists.infradead.org
X-Gm-Message-State: AOJu0YwKkra2sL1bJhNJa3ZTFymOjexjXK9/L3fSkaR6g/ZIN+ACWW6V
	CO6UeQELWs4OVpk9+fkM4pxeFIr7T0Dia/LOvoafo8kPaZ01At78zqws7B9/WKGoL6s=
X-Gm-Gg: ASbGnct+M/V+NF/LyuBvOcg3lBIxFTeb02JWtu/39/j5jIl8rYBNTBrJ3/z7GajKKEp
	wzTTOrCmdQfMDbvjS49wMyb2ZeLjq0SDRPnjsKog871vvi/Il3Y6uzXJ0OctzMlntAO8Tpju3CZ
	serA9jiE1MNRq7pl4ueTeHLf6+fzivj3xfEEwvS0KZPHOlH9OpOSxaRlStTmZKFTGjLICndZLS9
	jV1FPjrQGA6QbUoMkmgdKV+XQcLmRo3ZrSHCWfH76NNoeoBRJkuc7e1RTzH/QSjYGX2fYrCzju+
	DCDYy1LSCx6tdM1fpX2A2GDxXXhM6DSuzQv/sbZtXyrEajY6Lw9Rru4PnkReQR1sw7QS4DWA6Au
	tgI8=
X-Google-Smtp-Source: AGHT+IFjeReXBA3k7+eClk/ifIE93Uzbc7oaZBkcYmdYTh/N0ppG05eqByPpmkkuYUzt5s/KtcZ0Xw==
X-Received: by 2002:a05:6870:783:b0:2eb:adf2:eb2 with SMTP id 586e51a60fabf-2efed7a2a73mr9014336fac.36.1751312126689;
        Mon, 30 Jun 2025 12:35:26 -0700 (PDT)
Received: from localhost ([2603:8080:b800:f700:49cc:1768:3819:b67])
        by smtp.gmail.com with UTF8SMTPSA id 586e51a60fabf-2efd50f7f6asm2908403fac.36.2025.06.30.12.35.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Jun 2025 12:35:26 -0700 (PDT)
Date: Mon, 30 Jun 2025 14:35:25 -0500
From: Dan Carpenter <dan.carpenter@linaro.org>
To: =?iso-8859-1?Q?Cl=E9ment?= Le Goffic <clement.legoffic@foss.st.com>
Cc: Alain Volmat <alain.volmat@foss.st.com>,
	Mark Brown <broonie@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	linux-spi@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org
Subject: [PATCH] spi: stm32: delete stray tabs in stm32h7_spi_data_idleness()
Message-ID: <2033b9fa-7b0f-4617-b94e-7b0a51c5c4b1@sabinyo.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250630_123527_993038_A9EDCCEF 
X-CRM114-Status: GOOD (  12.42  )
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

These lines were indented one tab more than they should be.  Delete
the stray tabs.

Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/spi/spi-stm32.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/spi/spi-stm32.c b/drivers/spi/spi-stm32.c
index 3d20f09f1ae7..afb54198bde7 100644
--- a/drivers/spi/spi-stm32.c
+++ b/drivers/spi/spi-stm32.c
@@ -1895,8 +1895,8 @@ static void stm32h7_spi_data_idleness(struct stm32_spi *spi, struct spi_transfer
 		if (spi_delay_ns) {
 			dev_warn(spi->dev, "Overriding st,spi-midi-ns with word_delay_ns %d\n",
 				 spi_delay_ns);
-				spi->cur_midi = spi_delay_ns;
-			}
+			spi->cur_midi = spi_delay_ns;
+		}
 	} else {
 		spi->cur_midi = spi_delay_ns;
 	}
-- 
2.47.2


