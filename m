Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C42EC5DF70
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 Aug 2026 10:01:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=C5xJAp5EsJh4mtoVRdetKKnVuOabsV+/QbXlIN6U2H4=; b=AKXlWFgEob0/ExhUrLqobYSPlh
	Tczg3yJwc9k9U6xQCeFSZy0N4wPuVlOxOMC5rnxnqv931i9diayoayCqehk0M0XszJzq7s9bQAeL3
	zs68AJkdmQEIQXQ3+vVO7n9qiTj8k0yYQLACPrxZStrNB0KjZVJ6fHFoA5YRBXOhrQVV808iNIlHn
	wdN3nc+I94wSoNMGX5TiPb3Q3DLUhfV8yWncJzrnh53LGrdxu5oTcUfFPfFqNqknN2fAaoKse1yN8
	Y9uU0rAtM4hTp6Gi7wIj6wtKHxFiqSjuSon+wWEAAUENi82XoT1T4nFw9VWvkYjhjwXamxf7ybSLa
	zZbFVdog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wvu9P-00000005roG-2H9G;
	Mon, 17 Aug 2026 10:01:03 +0000
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wvu9M-00000005rm8-20tr
	for linux-arm-kernel@lists.infradead.org;
	Mon, 17 Aug 2026 10:01:02 +0000
Received: by mail-wr1-x42f.google.com with SMTP id ffacd0b85a97d-47f502ff678so379137f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 17 Aug 2026 03:00:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786960858; x=1787565658; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=C5xJAp5EsJh4mtoVRdetKKnVuOabsV+/QbXlIN6U2H4=;
        b=fpDrnweK3Yyac73o2oqC93j7bLC4j7Yz14evNxW6pnu4kcCXlu64AQpR9qzkvPPORF
         8aVZkLfWyfeZvulYoOoPDx4+c1+IzrDwBnhClrzREDXTqt4fMgGVTm4hA/lDWa3n58Gd
         02FR2ESIz27CJxE/+Uma6XVaoihD8dLXRuI68VlbfhRx2jACfTULYwdAK/XMSpF6768w
         BFsJga+mN90B+J62oNN84ambLuW+d9uOfRcgtUXb3jMa5fQnuqg/SOu4jtcnCh8aXT2y
         ouM8UyTUUiiOAIA5Sdo+Ab0CGQocI7DVLKJr0o2R1NJ6Bnlo+plCp08zqXlSGzeATU1D
         4TPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786960858; x=1787565658;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=C5xJAp5EsJh4mtoVRdetKKnVuOabsV+/QbXlIN6U2H4=;
        b=lQOA26hzITm1svKoRHsKW2HFrNhrYKG3n0JGWVokYaUqCIzFioa1yRAkjeAPJYEh7R
         SK7j4hGXcZY7w/VXW/p9fFsqEqyoZsuwZv+regL3qr8g1c5wXM96UWcih2gwT2ngQS9p
         1QzpSvzVm0lcKr8FoQ/ttqsuE/alX1+8In9wnTIGzHxp9DS1302OcMcGZgvvHJQK3GHq
         BMyMHDwN9dSwGPQ16j+Vy2PCn21+OTBeDvtBvvGf/PJkkcVFg9KI9tMW1WvgSOGKzgPq
         VkDAPjMfZffU3X2syZYZ4b0Tssrai6p9FuiTtkKfq4UYsqZUkHuRpXE8SuygtU31FIHG
         B9RQ==
X-Forwarded-Encrypted: i=1; AHgh+RrPqEKngzh50Pcktcx+wFWmCPltHPeLT16T4jVnh5bN2tGhV/n9i0KACatBI7jcGM2jrhB+RdtMKdzNSGCazueN@lists.infradead.org
X-Gm-Message-State: AOJu0Yxrg21OL4hmgzSKIvJWlDMXbBOnW8bKktSvFKnVwccW8Gefu2Zf
	hzpWUX8aWyOl1w944bFSJuYwzbc7ZfuMULkAdMMGZA/5SC/kzCCaWZkU
X-Gm-Gg: AR+sD10UvLWundG18uNFkSKGKoQJQc2C4fhj9w/BcMvih9hn7sT0bIEiGEw4Gf2+H6F
	wHS9mH02kSRTRoB0t9cx2tNn0dBxpMZmCUsxjL39w9zt/FfYkynfBmnd6kegyQ9B6YG5oFaB5eY
	/T0VjSrzRsRv0rJ+MXNvePCQji4b8sGF+7OVmToqZ3eHj6EByh+yGqrzirbjLw9EjzVRYT6chuz
	etcvx12uJ6P18LS9Uo0iRYE2zqaxuTFvGMIHQlnL+21Do+PFSEMA+pQlhnK2fQANoF9PYL09lO6
	prJDhkrXgQPC87s2yRtMA6InHnXhJEOC1Y2u0s6SKx2CMzpSw8LYSWhkPLJ9T4Kqj0H+q+O2Bxg
	2VFB8I9MY0CXgd9+lIcdVXesOpMgDhoQXQodMqPeli6xC40jBYpDhVsotIlwui1bcoYA0Vwm7J3
	ZJScUgNgo6skMF2iUsk0A10cuidc/fAbUApRt7VQpwB+UyonkkruSM8//gpem0JoeAG8u2Q21cm
	Jbg2aihFxT/M6WU3bgw53KCRd0elZjXBnHHllDo2ITy1T0XHJIPL+A5hCWdetN1B3NYag==
X-Received: by 2002:a05:600c:a0d:b0:498:1371:660c with SMTP id 5b1f17b1804b1-499878d5e0dmr175209465e9.0.1786960858323;
        Mon, 17 Aug 2026 03:00:58 -0700 (PDT)
Received: from OrangePi5-Plus.BB-HOME (20014C4E1B8FC50027494B64639367E4.dsl.pool.telekom.hu. [2001:4c4e:1b8f:c500:2749:4b64:6393:67e4])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49996109652sm167889155e9.4.2026.08.17.03.00.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Aug 2026 03:00:57 -0700 (PDT)
From: Igor Paunovic <royalnet026@gmail.com>
To: Jiaxing Hu <gahing@gahingwoo.com>
Cc: Igor Paunovic <royalnet026@gmail.com>,
	Tomeu Vizoso <tomeu@tomeuvizoso.net>,
	Heiko Stuebner <heiko@sntech.de>,
	Chaoyi Chen <chaoyi.chen@rock-chips.com>,
	Alexey Charkov <alchark@flipper.net>,
	dri-devel@lists.freedesktop.org,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v7 08/10] accel/rocket: add RK3576 NPU (RKNN) support
Date: Mon, 17 Aug 2026 12:00:43 +0200
Message-ID: <20260817100046.24872-1-royalnet026@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260817094544.1159366-1-gahing@gahingwoo.com>
References: <CAEWPSH7ETfw2TDjUfOvcVtDm19FC43x2vP=Lh7m+XPOGptnPWA@mail.gmail.com> <20260817094544.1159366-1-gahing@gahingwoo.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260817_030100_548522_361B8273 
X-CRM114-Status: GOOD (  17.28  )
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

Hi Jiaxing,

You asked for a count that is not 24 modulo 32, so here are five, on
RK3588 with upstream Mesa. Same generator and same scoring as the 56, 88
and 120 rows earlier in this thread: 1x1 conv, 64 input channels,
uint8, output zero point 0, scored against the raw CPU reference with a
channel counting as matching at maxdiff 1 or less.

  oc    oc mod 32   matching      bit exact
   33       1        33 of 33        31
   40       8        40 of 40        34
   48      16        48 of 48        40
   56      24        56 of 56        47     (16 Aug)
   72       8        72 of 72        62
   88      24        88 of 88        81     (16 Aug)
  100       4       100 of 100       86
  120      24       120 of 120      106     (16 Aug)

Eight counts across five distinct remainders. The upstream constant
computes the whole output at every one of them, and the global maxdiff
is 1 in all eight runs. So on this SoC BS_OW_CFG needs no term in the
output channel count at any remainder, not just at 24.

Controls, same as before. No channel of the reference is constant in any
of the eight models - the generator refuses to emit a model where one
is, since a constant reference makes a trivial match. No NPU channel is
pinned at the output zero point. The NPU interrupt counters went from
zero to five across the three cores over the five new models, one job per
model, so each of them reached the hardware. And the counts that are not
bit exact are off by exactly 1, which as you noted is not something a
delegate falling back to the CPU produces.

What this does not say: it measures the upstream form only. It is not a
statement about how the modulo form would behave on RK3588, and it does
not touch your timeout observation.

Which brings me to your last line. I cannot run
ROCKET_DPU4050_MOD32=1 against my build, because the knob is not there.
Upstream Mesa has no occurrence of it anywhere in the tree, and
src/gallium/drivers/rocket/rkt_regcmd.c emits BS_OW_CFG from the
depthwise flag alone:

	if (operation->depthwise) {
	   EMIT(REG_DPU_BS_OW_CFG, DPU_BS_OW_CFG_SIZE_E_2(3) |
	                              DPU_BS_OW_CFG_SIZE_E_1(3) |
	                              DPU_BS_OW_CFG_SIZE_E_0(3));
	} else {
	   EMIT(REG_DPU_BS_OW_CFG, DPU_BS_OW_CFG_SIZE_E_2(1) |
	                              DPU_BS_OW_CFG_SIZE_E_1(1) |
	                              DPU_BS_OW_CFG_SIZE_E_0(1));
	}

which is 0x36c and 0x124, with no output channel term in either. Setting
the variable on my build would be silently ignored, and I would have
reported a null result as if it meant something.

So: send me the value expression your knob selects at 0x4050 and I will
patch it into my tree locally and run the RK3588 side of the comparison.
I would want to run your oc=64 control at the same time, both ways, since
that is the one where the two forms emit the same value by construction
and it is the cleanest discriminator you have. You got one side of it and
the other hung. I can run both here, and I can also give you 40 and 72
under the modulo form, where the remainder is 8 rather than 24.

Two things I want to acknowledge rather than skip past. You flagged the
mod-32 confound yourself before anyone asked, and you were right to,
the twenty four lost channels at 56, 88 and 120 really are forced by the
arithmetic and are not three independent confirmations. And you disclosed
that the 120 modulo row is a different boot with an unrelated power
domain change and a different NPU rail state. Reading that row as two
points rather than one is the correct call, and saying so in the mail
rather than after being asked is worth more than the row.

If it is useful to anyone, I can send the generator and the scorer. The
generator builds the flatbuffer by hand and self-checks against the CPU
interpreter before emitting a model, and the scorer is your perch.py
logic reduced to this one case.

Regards,
Igor

