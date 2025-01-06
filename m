Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1590E77188
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  6 Jan 2025 23:47:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yjmN2PIfwC0c0nWPz1YMbfBRG3urs9KsCMv2W556xTc=; b=gyaYm+pRo/2ERpRQJMbFKFJPWG
	457utTgxlT0loXjrd8ELjx3BMiIMn2mqtJ+KILxcNoN7GXD36lSgObnyHpGiPRoe940WcwgBHD/vH
	fI/HD+3QPJDtWrJWysPgZqUGnqGFFUM5cUj2pBVvyif/FULqaeiishzEvBYHA3I/Ue0Ltx0HbRZCW
	vStoQVKz3Yh846RNj27WOmpqqGXVcEv/Hw/2LLaqj729Y99W1SICirMQsHgi3yHRQgOrVdMSCSq1d
	FdiaqSAMF0dsZQKoh8v8/TdQWV6vRiuRKZlswNIEhJDKuVEDMpaGUfe5FCvuX9cdWEQSSfyldayL9
	rU7fY4oQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tUwoP-00000002y4V-15Ig;
	Mon, 06 Jan 2025 23:47:09 +0000
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tUwnD-00000002xrL-1T8a
	for linux-arm-kernel@lists.infradead.org;
	Mon, 06 Jan 2025 23:45:56 +0000
Received: by mail-pl1-x633.google.com with SMTP id d9443c01a7336-219f8263ae0so169733915ad.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 06 Jan 2025 15:45:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1736207154; x=1736811954; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yjmN2PIfwC0c0nWPz1YMbfBRG3urs9KsCMv2W556xTc=;
        b=UTNVBE+TWESaGkxEczECYtzyOaB/nTypsAcNZ8nsWPow6s7oedx9FrnKW+4/tAbvVn
         qJEQr02R5lvieSYPCADS95oyO0UoJqOD/53m1ZeL4CeG3/vlVZvWQwucIr+gZfNxR05E
         iM6LDJ34WA3fqFWmOLF468Yl+mhnlmgQKdEMNYGAuErvoNlDYo8QWsFnNQmgcv8szEMa
         h2ZEJDNbfBkyI0jfNE2Fv0+Pb3c2kwix/0NCzil603CsJkln1/bucJcNNr+BloPMbqM1
         jlOTVaKzjQm3w3Oinr/UZiB5dJae+02K7Yg6qCXtwmyI2fxtdPbMsx3UtVmmZQipKt1U
         MGeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736207154; x=1736811954;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yjmN2PIfwC0c0nWPz1YMbfBRG3urs9KsCMv2W556xTc=;
        b=DIoeqYjgvdaKzkg55TSX3uK4Vsc86g6lAbPk0CL4ax1HDZZJZupXDxHHxj5zpdsgro
         h/afpakTYCLsHCpWJWMSCnTq2vZyqcFvJg6xvO4B31hYoJdMaNkkVWUdhleOaXJ4P5MV
         sayFmLnV3zoeolvDRx095yoqa8XI+96/9/wCGUmgCm0o0+yH9rdpV4LDErNap9IXw7+V
         DgwMmoDsujX7DFqSedgqtVg0xSDR1iDRvhG7hK/4bui/YHiOV4nvgz1RS0pt+5iNGqi7
         1W6/Q0/NYTHgvi3MES8NqjjarF+BHqDew4O7YvD8Pe5AbY7KLfGfAp0RDKVcJM+9zVfu
         QL+A==
X-Gm-Message-State: AOJu0YydtYUoaXvK2L/l0qLEyUjT9ITjq2rMC2QuAlG0OiqOZBa+0Fz/
	JYB2Wmq0BerNiNsekSwbrT/j1ve1S4pWx4xuuuPCRRTZsx1IYfDPSwq2OCvq/Hn9jsA+m7FiTMZ
	A
X-Gm-Gg: ASbGncsjdsf3+7n8JG2fyEVcdEtB5qy+Cw3d/l1a9NfmOZvezgZAE+roAaqMRVKKHZC
	T2P/m9CnELsFfCXBiSgJbjFA2YjPaLi7XRBbGKxGd0TJ4Jsrcc5QhwWjNesJAORz4+ErGUHnBT/
	I82hVs+buIuuLKzzsC8kStsraGd8xDXNeSyoVauCVK5PfR4zO1/vzct+vT3s96YWHUlxbrEXEz8
	PGH54kGi1Lv2E+N9d7GEQSuTl9380Y/7PUQTstfd0ZIgMeK4/jK3eI=
X-Google-Smtp-Source: AGHT+IGbRHs2RzJb3MSieBXWa+Evc31amSDQZTAZ7zwBIJ6+kd/xMRR6MvgmWDxKaWb1lU/MgC4T7g==
X-Received: by 2002:a17:902:ea03:b0:216:5e6e:68ae with SMTP id d9443c01a7336-219e6ebaf33mr879106765ad.31.1736207154513;
        Mon, 06 Jan 2025 15:45:54 -0800 (PST)
Received: from localhost ([97.126.182.119])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-219dc9d4635sm299184755ad.162.2025.01.06.15.45.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jan 2025 15:45:54 -0800 (PST)
From: Kevin Hilman <khilman@baylibre.com>
To: linux-omap@vger.kernel.org, Janusz Krzysztofik <jmkrzyszt@gmail.com>, 
 Tony Lindgren <tony@atomide.com>, Linus Walleij <linus.walleij@linaro.org>, 
 Aaro Koskinen <aaro.koskinen@iki.fi>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
In-Reply-To: <Z3UxH_fOzuftjnuX@darkstar.musicnaut.iki.fi>
References: <Z3UxH_fOzuftjnuX@darkstar.musicnaut.iki.fi>
Subject: Re: [PATCH] ARM: omap1: Fix up the Retu IRQ on Nokia 770
Message-Id: <173620715371.32831.15131354079648305645.b4-ty@baylibre.com>
Date: Mon, 06 Jan 2025 15:45:53 -0800
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-355e8
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250106_154555_404510_03FC5FB1 
X-CRM114-Status: UNSURE (   8.41  )
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


On Wed, 01 Jan 2025 14:12:15 +0200, Aaro Koskinen wrote:
> The Retu IRQ is off by one, as a result the power button does not work.
> Fix it.
> 
> 

Applied, thanks!

[1/1] ARM: omap1: Fix up the Retu IRQ on Nokia 770
      commit: ad455e48bba7f21bb5108406da0854cf8dede8ea

Best regards,
-- 
Kevin Hilman <khilman@baylibre.com>


