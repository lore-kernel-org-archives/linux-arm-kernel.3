Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A11C606A322
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 30 Oct 2026 16:33:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=ZyH1OchG;
	dkim=pass (2048-bit key, unprotected) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=NZ1D+MNz
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=4g4bBa15TQcCRqdP6/C6ogyt9YDhoGubfZMQbJjSRhc=; b=ZyH1OchGPAJrH5Co+6dNzGCmrs
	gTlNXbWiDzECuRnaf0m7h26TqDNW1E21r0ZEFk8fVJqF3yjZug1BClQMkR/D3phdoTk4+z6oWf3J1
	CPlYXWWhHIcirEm/ZyChaPsi1Obcw6UFlN8+XCs1l52rsIHJ9yQwP0jewcUWGu0rJjtlDk4TDgpx9
	RHvfQugvIykajkMQGkkgkMpyMupUAS/QIdns/2N14ZU3cC2EhkpCC+8v3JYGaQN9SS+FJ012AK7QE
	iGxljASkfzX8pBV8UjbGacsA7ZMvd4sykOO4+b1Dd3YztQOZ905TOMIcuxvMbiKVPVTDVecYpou7s
	qGytmAPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMpXB-0000000C8A0-1i90;
	Fri, 30 Oct 2026 16:32:53 +0000
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMpX8-0000000C88G-1op8
	for linux-arm-kernel@lists.infradead.org;
	Fri, 30 Oct 2026 16:32:52 +0000
Received: by mail-wr1-x429.google.com with SMTP id ffacd0b85a97d-48e6eb21a8fso405933f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 30 Oct 2026 09:32:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1793377967; x=1793982767; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=4g4bBa15TQcCRqdP6/C6ogyt9YDhoGubfZMQbJjSRhc=;
        b=NZ1D+MNz0Hnuv4Yzt4SRCAomO8plys7cEX2PlTZQcFllOUTIqu1jAoihZW4Dfrah3s
         et7txwDdefftsX0VevKiGv4/FspK4H+nDD03k4jK3cMcoq28fTPlcNg8YtJ0kvRWoWZk
         636iFbTk8FWtWNk/u1CuS5FaYaBJh44ibLVGvtoU+wkk1j75LIAsGbQ//wtVdD8yQqs6
         gE5gOsxJZJQDOHj3LGwfh9L0hDtb6BCfBvQywvmFWWHHN9wa4RWIcr2z9Epugwi8hQrz
         Q3i6dcvI+c/v7eEamU5kkUQVVsplyJzW6p040+720LojzyYoWP/Hbdx6ftyk0EwVyQjJ
         1qAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793377967; x=1793982767;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=4g4bBa15TQcCRqdP6/C6ogyt9YDhoGubfZMQbJjSRhc=;
        b=ROxp8Jjpab3+yImQx/HZ/FbeNJctaYhXJOIodLVnsPGXb6ufRks4KEc9VRuIvzH4Zc
         p5v+S40hxJJtAtDG1uNw32v6oqrKLTIbHpDSNbFTZgPSpVn7VM+zjRMrq3W7ja5bBHit
         yWaN+4lML8Gm7pF/DI8fOMFHJ/6OaUOeqYfi/yJocNNHmETJgZhVMeVccEJ4uq9UMbeT
         cEMouPy+3gjpSMeU1yD5Qods4NZN05sMeessVkVezIblOB73/1DaUbIbQEfyZktZcgy+
         Y/VASSAEnt5EaD1mraAI1oWskIemC6dU0MyA/W8Rht8qJD9x+zG5HAHdcUDq+57fcaCk
         k9Jw==
X-Forwarded-Encrypted: i=1; AKwUvBx8ZnpylsM8d2gM3vxgnyDjv8EYc1bhGtSuXRwlrxH+2i4YMBaZQ9eifWWjqMO57d0wfq2bpObJ7dMg/dRs3RXE@lists.infradead.org
X-Gm-Message-State: AFq9FYLyPnR4GAq1rRzdSoxvGkkgv1ENdY4+xcw/TPR39hNR+IyvQ39Z
	RP1wS8f0lHqcbdFgkpgrvxpFBqgMFzLxH4UZxKc2e0ciR7R+qF50T+eCk7RFN33MCVc=
X-Gm-Gg: AYBFou0uDN5yhYFzWpQ2pgY4XhINR3GTyXWPhk337H0yPnqXlTLDH/4onaCbwbGUk6h
	it2+Fpt9piWyR57IW1phvtTpoRVq+SEHv/3kQsLBLifK4EH0N+Q6deTAokqvcZ8g94/KJvZ+8RM
	XcfGODzp2BSuH8LJuU+X9jVP6UF/m7qQxfsRAnxjL/uSbEGXNTXqe4FgokMD42AaHW/q4HuVBd0
	yO8xFme/QuZt9e++RHyLkPLoy5nNdqEPkqrdYNJWHVDeYEKCUWjWeUOSXz3mBvUSMduX59abvFO
	yj3QbGqXAM8+d9mm6XFMBVkJFQGyB/gIh1cc8qy4bjnDA2L70V8C8vOrZ83u5tMMOQJGxXX2ML+
	ITj0TTUlVNpVLsXu5ZMEthAaGg+XY9XboRvM4bSnL/oUy8Zk4R6npQ6ZHm2ImqESghHYZ+pHQ1X
	rFVg4o8piBZd5O8bJBymcu8jwdpP71C0hUMk/KwuSVUTYHhE+j7lVk8gqfNP5cZ7RuOKg+9MHgw
	c6xUTq1YNjN+MqUdInRxDRhcDHkynhyj8stmYbnH1Keku7BGILG97y4mO/f3l1YEAY7dfk1xaG3
	bBSOEg1LG+k6xCUnjWwGjE2sNyBL70Sx+V3zxNrzSBhANjMFBxkzjnmEAQq+oy/LYXWXFw==
X-Received: by 2002:a5d:588e:0:b0:48e:6bbb:c3f3 with SMTP id ffacd0b85a97d-48e6e2fd071mr6553038f8f.28.1793377967347;
        Fri, 30 Oct 2026 09:32:47 -0700 (PDT)
Received: from localhost (82-67-6-57.subs.proxad.net. [82.67.6.57])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71bae25dsm3528697f8f.59.2026.10.30.09.32.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 09:32:46 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
Subject: [PATCH 0/2] ASoC: meson: card: fix driver remove
Date: Fri, 30 Oct 2026 17:29:52 +0100
Message-Id: <20261030-meson-card-register-fixup-v1-0-6474985e94f6@baylibre.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yWMQQrCQBAEvxLm7ICbiFG/Ijlkd9s4gpswk4gQ8
 ndHPfShaKpWMqjA6FKtpHiJyVgcwq6idO/LAJbsTPW+PgYfP2Fj4dRrZsUgNkP5Ju9l4ibE9nx
 qcnuIgdyfFH782tfuz7bEB9L8DdK2fQA9Y8sMfQAAAA==
X-Change-ID: 20261026-meson-card-register-fixup-31b7983d74b1
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-sound@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Jerome Brunet <jbrunet@baylibre.com>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=660; i=jbrunet@baylibre.com;
 h=from:subject:message-id; bh=fXalk+osyG8+ZDMUyak0NQXBdifxrSPFw4QoLcm/1KM=;
 b=owGbwMvMwCW2VtK+WnvWU3HG02pJDFlPjq27xpM6JbNrbZS+3gUH2UWJRwWXvzs54T53dvrNP
 OsuwaMqHaUsDGJcDLJiiiw13NXi7yS1vsyarnMbZg4rE8gQBi5OAZhI83FGhmOy6VOFZrpkt/9+
 JvZO33RJ8RuX5D19jk84d99jdl62dDUjwz/NL/wOz9/2mnOfb741b3nRzpd8yhcs538x/+P47b+
 dDAcA
X-Developer-Key: i=jbrunet@baylibre.com; a=openpgp;
 fpr=F29F26CF27BAE1A9719AE6BDC3C92AAF3E60AED9
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261030_093250_486622_4802B7CA 
X-CRM114-Status: UNSURE (   9.78  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

meson_card_remove() reads the wrong drvdata and frees the card links
before the card is unregistered, which crashes when the driver is
unbound. Fix both.

---
Jerome Brunet (2):
      ASoC: meson: card: leave the device drvdata to the ASoC card
      ASoC: meson: card: unregister the card before freeing its links

 sound/soc/meson/meson-card-utils.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)
---
base-commit: 11ae63bd9030349a0136fb2edd1622a4a029edc8
base-tree: git://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next
change-id: 20261026-meson-card-register-fixup-31b7983d74b1

Best regards,
--  
Jerome


