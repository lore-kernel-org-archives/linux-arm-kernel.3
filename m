Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23358CCD199
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Oct 2025 14:17:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=d4CIb+mZ4TdXD2+XOrnH5Psl6jGU1lXy8Aan9HS+a3c=; b=xWozeGVeP8MKTJTtGw98sR2HNn
	vBQJhU+1qCKbs+DX3zZSeM0pryjt/RqO1TsK73FW1cxA5EA5fscOzzMeXwLS+Sl6xx35AFbIt6lma
	lnUFWPreqUuDK390E5nt2KNC6mumMn4Bv/ZaHsMHoLs07msVA0xZQJY1kg7u+w2mRYkGJBFpyQyRN
	Y+f87fDeYk0Q12CibRlfwD9cKgX97KGmDICTtFXmeB/J+qaDWW9NCl31glbb87IhEEoac73reEgVf
	yTRE5BrwLPgtA1+EOC+35yg7mysxZPRcAaxJxHfHb7tb1amHix3IOJAgYQkBWLs7hJSsJ8e3cuSaU
	/fckTNuQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAqhb-0000000DvoX-0sRT;
	Mon, 20 Oct 2025 14:17:35 +0000
Received: from mail-lj1-x233.google.com ([2a00:1450:4864:20::233])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAqhZ-0000000Dvn8-0BCD
	for linux-arm-kernel@lists.infradead.org;
	Mon, 20 Oct 2025 14:17:34 +0000
Received: by mail-lj1-x233.google.com with SMTP id 38308e7fff4ca-36a6a39752bso43860811fa.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 20 Oct 2025 07:17:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1760969851; x=1761574651; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=d4CIb+mZ4TdXD2+XOrnH5Psl6jGU1lXy8Aan9HS+a3c=;
        b=XienBSap7RUws8z1dYErfQc8FSDMJozDDN6LEI7asb8Y/C2xydlFMXKfKYqc+QfEcF
         F5qSjw6H+ScO8wbP0Zjp8m2ko1mJ730n+uDWm01e55Ms5cyBxNRu4Y6aPuE93wxUDNiq
         ZUFifTiUJh3hRmFM9tw3scV84xkP1xilMMhQYEn+5VGI+XRh6J0LtErag4IurlMPzcZQ
         J2bg+OtCiRT3WKmcl2s4tdm14sy9PFn4WJjPabtVBb97mpchZR6AbQKr6q0BRXd4svTX
         Ijv/trZqv84RwCjOSZ7C6heVvoefgKfacpj3U0O6vwVAiwGNxl/LRejS1YbT+42P4BHc
         aEZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760969851; x=1761574651;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=d4CIb+mZ4TdXD2+XOrnH5Psl6jGU1lXy8Aan9HS+a3c=;
        b=KSkmdm3B7ERvGmnPteDhL2L7UIgyw71j+BTctQI9jV6sFykEKsg25Inve04AjuF4u3
         1l0pPthMnXuY060ua/WwO9bUiYtrsjDQBg6vq5hLQP+KUTv8KoxQ42Snp83eSs2ddSQp
         bZAGHvFAWKlkF2romvnsTQTy5dZdq4hiS4zxlSGI68DGazQ1KeV1qBFmbom9x6q0wOBK
         cs6zYxHU5ETkkjQGYUyB0kF7dmHwTpSgKYFPbIVJcgWmYmqHqfWdGlrCxVqGvoZQtOVe
         ie0VM/YjG1tFdU8q7tgDWCSFRLu8FaLfRgdhnri9jZMJXv+kxD+PZUk6VxmEMY0tIfi3
         8ylQ==
X-Forwarded-Encrypted: i=1; AJvYcCWYBI8cdXFZk2bMmbXmPUFvUeio+M9lPhVefq2NVOK9HlC1heAo7R+PqHI0VMQr6Bb8Ytn+JerJDiNEufh9ba3u@lists.infradead.org
X-Gm-Message-State: AOJu0YxfZ39uICP4x3h2T+lStvitmOrpi/Z3liytW5xtBvgwhcr+dW99
	wTan97Xiun/Xd1yi1g2/koI37RpoIpFJeGiAM3xKQ+Kki6wlC9Gqp5Dc1f3X8XOX9VU=
X-Gm-Gg: ASbGnctTN53dcVlZoQDUhPNEwnbw+qnRIWrIW6jfGnzlDDGfxgxmsEgXoroGPPj9zdc
	Z1AEAjz+9cQaFc7iILlqUYoAwruCa0Vu55Cwf9C1617oF8MqFijTMZewBnxFOrKLlQ6FKSnu/63
	rjtrklhRSzSa4/1YZXY9mEta9cS7PO7+ZY1vpbUncPEhf+2Hw5Zae+UxPRgDD9/nfIu4YsovC0G
	GG5rczS9MOV21oK5uXU4flnfBtzOZM4roqaaK6WHdR2AY2MKGs0dBo3VwRXYqFsmV8FzMv426WF
	+UVH4+z6u2P3XnnAhL6sPY4uaqYb3fIxte9hW/5Pjcu1zh9zO5qOIC3w9rdFjo8clgF1kJur3wz
	WPevK+HpOh9UxxjEKOe7scVXTTVBGG1czxNq1gLxDtliEwhv5BPTaw3eElX9NxtJetpIaSMXt1d
	AhldcnigT0AgKRc8xi5tFoA54PGn/KTGWIOkJtx6Ezx6DV4/I46ycnS+M+NAGa
X-Google-Smtp-Source: AGHT+IGaUa1A4Uzcr6IBjfTLgEHTVeFFWXgoQ0Z12nmLZQh/21hDjDxTbaAdxTiU3/Df8JDb3tz84w==
X-Received: by 2002:a05:651c:501:b0:376:46ba:864c with SMTP id 38308e7fff4ca-37797aca3femr42697361fa.46.1760969850852;
        Mon, 20 Oct 2025 07:17:30 -0700 (PDT)
Received: from uffe-tuxpro14.. (h-178-174-189-39.A498.priv.bahnhof.se. [178.174.189.39])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-377a950a284sm20797191fa.36.2025.10.20.07.17.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Oct 2025 07:17:30 -0700 (PDT)
From: Ulf Hansson <ulf.hansson@linaro.org>
To: "Rafael J . Wysocki" <rafael@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>
Cc: Mark Rutland <mark.rutland@arm.com>,
	Marc Zyngier <maz@kernel.org>,
	Maulik Shah <quic_mkshah@quicinc.com>,
	Sudeep Holla <sudeep.holla@arm.com>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	linux-pm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Ulf Hansson <ulf.hansson@linaro.org>
Subject: [PATCH v2 0/2] pmdomain: Improve idlestate selection for CPUs
Date: Mon, 20 Oct 2025 16:17:10 +0200
Message-ID: <20251020141718.150919-1-ulf.hansson@linaro.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251020_071733_093203_F5FAEEB7 
X-CRM114-Status: GOOD (  11.58  )
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

Platforms using the genpd governor for CPUs are relying on it to find the most
optimal idlestate for a group of CPUs. Although, observations tells us that
there are some significant improvement that can be made around this.

These improvement are based upon allowing us to take pending IPIs into account
for the group of CPUs that the genpd governor is in control of. If there is
pending IPI for any of these CPUs, we should not request an idlestate that
affects the group, but rather pick a shallower state that affects only the CPU.

More details are available in the commit messages for each patch.

Kind regards
Ulf Hansson


Ulf Hansson (2):
  smp: Introduce a helper function to check for pending IPIs
  pmdomain: Extend the genpd governor for CPUs to account for IPIs

 drivers/pmdomain/governor.c | 20 +++++++++++++-------
 include/linux/smp.h         |  5 +++++
 kernel/smp.c                | 24 ++++++++++++++++++++++++
 3 files changed, 42 insertions(+), 7 deletions(-)

-- 
2.43.0


