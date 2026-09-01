Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B04BC624D3
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  1 Sep 2026 16:34:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eQ+b0FuUbkgk3GjbjUprpVwWlSOMhpS2zwmbdYuf/ow=; b=MpbXhpZ+GTYN0av7MfGPmE+gWg
	v/8Nh9FyivZ31cgfdtva35i/Jh70suGIyK1Unfad63ndBO0aMkn963puzaW+Z6qFLqMup3z1d4L3W
	HQQwASNaFpl29XppMy7IGn2hHUoWcoqHerJ5iK5DdvQ0+gPlTBvYO9KjRhL7aZ60QN0Y2WSgreLJY
	dhAQetqVMPDceWAj9Iwu0YMa0+eJdCjAhY/BYJxnoJxoRDnMaHlOLKZW957HJbfb4YQyvqHDLX6tX
	eS/rFtuLB6JtAnxw/gKzI74V1u05JyHo47qNZeOlpHkiQn4y7THX4pPRJY6X02cT5Hpiyb7NDjdHP
	eJxqEMkw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1RRE-0000000Cfi7-2IGa;
	Tue, 01 Sep 2026 16:34:20 +0000
Received: from mail-lj1-x22f.google.com ([2a00:1450:4864:20::22f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1RRA-0000000Cfg7-3lYO
	for linux-arm-kernel@lists.infradead.org;
	Tue, 01 Sep 2026 16:34:18 +0000
Received: by mail-lj1-x22f.google.com with SMTP id 38308e7fff4ca-3a33307ecd9so36641fa.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 01 Sep 2026 09:34:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788280455; x=1788885255; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=eQ+b0FuUbkgk3GjbjUprpVwWlSOMhpS2zwmbdYuf/ow=;
        b=oRGsBWrvJRNf+yf4vKh9etM1FmikAs9ZNkQDCgln5dQ99uG8u+dYE1uWKqhMXTMvpi
         6Bq382ku/x7xn6u1MDskf43o6PByyBhcqySZP2ZLqaP8g1omq7s8g9FUM6xI71qFrDfv
         T+t5vGAfRQ55TiViz1Oh1tyWXG9ZDTw3uu/o5YvpiKuDAJGtYzYafzAH7VVmFSTaRXor
         mVRwsBaIV8fL8nwWqo/KksDLgTnuEwQsoiGOIuEVqTKyEhde6n9S34crwz0dDCGyok9W
         ubGozWAdmpj/XMScWEikudYuSpr2L0wnadqF63FGAavtVF2Hrms/EfB+S2Z5o3pEhRLI
         UVLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788280455; x=1788885255;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=eQ+b0FuUbkgk3GjbjUprpVwWlSOMhpS2zwmbdYuf/ow=;
        b=QHGlXxDecpFDN3Gpjq5+tNqDJ2U7+jEG9PaKMAxFurRMY3HHnGrYsT74bZDBK37485
         xxfUoXaE1CgLxHZ9KcEP2ejYz0hwyhTmeuA9PGoeknvQ/96fqhBvMvyIVWFMRrB02nR/
         tVyNyUz81ZtaiY4mCHuOrSj9AYAvDQVax/axSrqaCkoWPhTYbLksxfN9o3Bxz+VYUWYX
         pj1UAXcuBMB0/K1qoogOc2JZ0QpWmGdbPwKCpT3bYDdqxuqUKh6gJe2DI1a5j4z2Tlh3
         ypWRFcFG/YcxlMp56AKnyrREEyj6TbcfD8slFG0NHWVu/KQaM2L9C3xrNwSN9KJoHIRh
         QU+g==
X-Forwarded-Encrypted: i=1; AKwUvBzau1QFx0bHSu3h5qEpWPGKamBU6zhF60rHZBtD4Br6/etbmkWgLg6c7yVS3z1QkCZrtQDCTPJ/Z++kmALpOYVG@lists.infradead.org
X-Gm-Message-State: AFuF++mEMi2HaZoYhDwH42DaS69Pz9DurON8fzBDElzaE0mjK+6Ug6QP
	Tu0NZGJenDkmOdqurRzGRt2p/Pj4BayEoZKMkWdY+AxCVVpSw99+JFk=
X-Gm-Gg: AYBFou1fMYTR7NlIo+pLa9uJtGjb3tMEw/5x+UaeHhH0eWod80yeg1C51pKNcm3L5PM
	HmbZpa+MTeLVXhqpu+51sgABi+W7moJl3er2eQdaGujLujoopMGCK8a7QKcU/DLkQYIgmeTqiRq
	TQOwZvj0yk/a15seQqhE+LfVfDUbw4Illfak9zjq5+ZGD5wJjszywU4qgp+QMatxIviJsZD1l8y
	sIlwLoNB5JW+DptGmXrXr2PgffAMspzP9fhEnXuyP1+iVu9iehCBrZpq1lvq4CEaeeawsn5GzGd
	uEHvwZb139FRNtyBudavnvclZXdpX4cdjRI9ahaWH1tIw8DndPdiWnMv/2SoLoUPeHEsT8/FNAP
	4afYFSH/g2derJKVHbOVKn4kiomlm1IanzslqQ//ORDNC85C8TtfCSF8BGOPf1zI9EYpb61XGHw
	KqcZ9pJ/mYLNtxqjifbSORNRmPcj2UbzDXdYzQdDg8jZMRT5LoCoEc
X-Received: by 2002:a2e:a554:0:b0:3a2:fd1:8a8 with SMTP id 38308e7fff4ca-3a3018ba808mr78554981fa.1.1788280454464;
        Tue, 01 Sep 2026 09:34:14 -0700 (PDT)
Received: from fedora ([92.36.3.203])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3a34a8f03fasm688001fa.9.2026.09.01.09.34.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 09:34:14 -0700 (PDT)
From: Vitaliy Sochnev <sochnev.v.74@gmail.com>
To: Lorenzo Bianconi <lorenzo@kernel.org>,
	netdev@vger.kernel.org
Cc: upstream@airoha.com,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Vitaliy Sochnev <sochnev.v.74@gmail.com>
Subject: Re: [PATCH net v2 2/3] net: airoha: recover RX ring after hw completion stall
Date: Tue,  1 Sep 2026 19:33:48 +0100
Message-ID: <20260901183348.40949-1-sochnev.v.74@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <apaA5jDYH71F0JaS@lore-desk>
References: <20260830095717.37218-1-sochnev.v.74@gmail.com> <20260831234701.206021-1-sochnev.v.74@gmail.com> <20260831234701.206021-3-sochnev.v.74@gmail.com> <apaA5jDYH71F0JaS@lore-desk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260901_093416_945391_7A47976E 
X-CRM114-Status: GOOD (  11.52  )
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

> IIUC increasing the ring size the issue never occurs again (correct?). If so, I
> would drop this patch for the moment and add it if it is really necessary.

Correct. At 128 the stall never occurred: 500 forced PPPoE reconnects
over 20 h, ~37500 samples, zero triggers, plus ~994 cycles in earlier
runs. This detector was compiled in and armed throughout, so that is a
measured absence, not just the absence of a visible symptom.

It is also not sufficient on its own: at 16 descriptors the recovery
fires roughly every 35 s and PPPoE still never completes, since each
recovery flushes the ring and negotiation restarts. The ring size is
what fixes the bug - and the other two patches on their own are what
ran the longest here: 508 forced reconnects over 20 h 32 min, zero
rx_dropped/rx_errors across 39158 samples.

Dropped in v3, just sent. I will resend this one with evidence if the
stall ever turns up at the larger ring.

Thanks for the review.

Vitaliy

