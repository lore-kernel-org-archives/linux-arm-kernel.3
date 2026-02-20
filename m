Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92FA8E9A049
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Feb 2026 02:20:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=JvWDQd8kefwEaqMMYkm4D2HK6neFrO40ilwGSEerMMI=; b=jUEcIOwqBpZXzfkTP1thi7gZfA
	Gy4ea1u637CC20zEG8u9Wig+pzCc6Dals+Jh+E/AVg4swAmY532Mf0Nwpr/jPDOMVJGRm5glYuMsF
	YIyxPZoTbx+ByKeYa5t6d9VsjITuChXMGPYyoVM//pDKeKlLUC6fyN6SqvzCQ/a59zOhXb9PrlGG2
	iS6vSzdDH7l5BYy1BumdVX+g+/ySHJFMtGVmKjkmA5yk456KG07g86HTpwkhcvmnLhJDYV9akMHbf
	+RB6A96B/EJRGzIQT9HPJh/GTMgQA2YqY2yjUb7gV1GuQaF/vgV5D4c8WYztAvH1j0AEsLYcC/6ED
	O1kPjJyQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vtG7o-0000000D41e-24UL;
	Fri, 20 Feb 2026 02:20:12 +0000
Received: from mail-yw1-x112d.google.com ([2607:f8b0:4864:20::112d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vtG7l-0000000D40Q-2vwc
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Feb 2026 02:20:10 +0000
Received: by mail-yw1-x112d.google.com with SMTP id 00721157ae682-794911acb04so16608927b3.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 19 Feb 2026 18:20:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771554008; x=1772158808; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=JvWDQd8kefwEaqMMYkm4D2HK6neFrO40ilwGSEerMMI=;
        b=ACbTiME8EYJ0o1/CJ2q8P5ZhWEEKtp0T3QAIUClqbGxsjpWkRq1f744ih56ZdDno2u
         A1FLb8i6OXaqNP+7Yt37gNorRC5U15UN/v1L9eoxN0AvYIhsDtPCd/2S6nWzP02GFkUX
         LepXZEgW5NP3fcOYzDETxifiB58LfNpEPLwpP1m7Ve9QCfnWvjWVb9xvhdIc5rmuGjuX
         tXlqCd/lDRWZDQ/oDRYku4aenmTM6J/wjLzYCWNkJFE4usw9iajp+F9BDpJLMhlCLOog
         B/esOBxQzehVno6a9mKTDOvEeTSYKim/mGbQnSuBFlSKaskuuBP5el+8nKb91lMnDKYD
         wP7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771554008; x=1772158808;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JvWDQd8kefwEaqMMYkm4D2HK6neFrO40ilwGSEerMMI=;
        b=Gt5B6ujorOxmSqMjRDeGHfjeXK+koZNN4xbfxE3VcFujGZn5arCdTuzSm1GWZZvmH/
         NHb4OUSlk0d8XX5eRfqXbrbGCYcS/KSADWax7SWQfRJpQoTQ1wzRk0ekGugb0eS9RCBI
         d5UCM70wdDrVF0eDVV5LsqNGnwszzVGUoJzHjSxwGpB0JcZ7t4hJORjmNeiT4rGSelfG
         GMRjvoYfJZ1XVIwATCyaWSsHFzXXc+L9uIK5muslUlNNriu+9c+jq8DLoxpI5i/xPE/T
         kjtJmE6Y8cdxfN2aC9nkxjuv17rkga42KPxytUFNxF+LqHKhOjv5IgEHAsN13ZqRg7yN
         x6tA==
X-Forwarded-Encrypted: i=1; AJvYcCX/eTF1kf+KIVMWtb7j1lXrsj3HUTXLLN+qm+lroHbJlzm7raWzofqIQVo/dLsjRzr1tMDMojXjsxUqz4VLydS8@lists.infradead.org
X-Gm-Message-State: AOJu0YzWUTdOtBYelJhoqz/OPg02GQMny44FwKHtScwzrlYLd5W9q1BP
	ToLTmsLZxjtRbr+SpNW88/pp8xkvFeUG8wDbmeaeEzdhFUI5iIam8AZJ
X-Gm-Gg: AZuq6aJI8uWAcwOsne84usRJX9FH+vIdxbm9P1ZW7KN/P3xTCD3uLrxottJypj0LMIe
	LNlC5Z9e2KojeJx3ixAKv99fogp/dEOxJM0FrAWgJGaeyy/qJYLbfZ34rACBAXpvwMNaD+KI7DI
	DZWS/rxGSJ/yQNWVWtsP6YlpBTqi/y1hw9fxKsVY99Ua5Mupr6iaPr1+JHvwNyrkyoPqcVyikBK
	6NNoDLn8rs48mIU3Y56CMEH/BXmEwjedgUDKRJRr9S9qPrnsiomRglfOdJhvdyeKBm7iOJHmR0h
	tVuBVIObU5gs2K5820le9LTHmcQ5qo8bwwhmmcjkb/lQKD+spIZ+lmqlA8cB5tsRSGIQX+H+17Q
	nNmK2GLCaLgqzK8f42L3vifDgSBEBppqqVumjmXhtzcZ1yYSQRvzdNFW13eAn+Srk+wrH
X-Received: by 2002:a05:690c:4992:b0:797:a27b:8633 with SMTP id 00721157ae682-797ac5cd220mr174743647b3.42.1771554008222;
        Thu, 19 Feb 2026 18:20:08 -0800 (PST)
Received: from ryzen ([2601:644:8000:56f5::8bd])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-797d142c2dbsm45550347b3.47.2026.02.19.18.20.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Feb 2026 18:20:07 -0800 (PST)
From: Rosen Penev <rosenp@gmail.com>
To: netdev@vger.kernel.org
Cc: Hans Ulli Kroll <ulli.kroll@googlemail.com>,
	Linus Walleij <linusw@kernel.org>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/CORTINA SYSTEMS GEMINI ARM ARCHITECTURE),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH net-next 0/2] net: ethernet: cortina: support deferral
Date: Thu, 19 Feb 2026 18:19:47 -0800
Message-ID: <20260220021949.40817-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260219_182009_742468_4E182B1B 
X-CRM114-Status: UNSURE (   7.30  )
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

When using nvmem, it may be necessary to defer probe until the specific
nvmem driver is loaded to get the proper MAC.

Rosen Penev (2):
  net: ethernet: cortina: use devm to enable clocks
  net: ethernet: cortina: fix nvmem mac addresses

 drivers/net/ethernet/cortina/gemini.c | 25 +++++++------------------
 1 file changed, 7 insertions(+), 18 deletions(-)

--
2.53.0


