Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7EFCC5AD5A
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 15 Aug 2026 13:06:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6TunZ6T1253lLJ2+HTnnlCLT2K1O14zopzv5ooYmm6w=; b=T/H+aN7OXQx2/8ZyqnscJedtFc
	mhWr8j/bcq2wYreVmZM7ffxPVX8I/LXvYSarth/oJZUWN8MmecKU2kmlDdQZzbMYwJEP5Fhu//qjx
	5tQ5sjqUgzkci0bbGDbGUlIgs919yYvrxxmWLdp22m+AjLgoBIcoBW9/ABZRRDY0G/SHjv1NnQco4
	vCmMg+mRBT+IFfvpwDtzCnnyibI8O7U3aZqXsAKZ3FRcR4YBJ/bXhGRlUeJz5otQqYIoizepmistw
	SIJUSHDmHutK47Fq7HY6DT0adqSS6SPjDKGgrkB9bHlca7Ghb6D+pxIdYIzFRY86wj5pXtr4oyDDQ
	nBfvcQSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wvE5V-00000003q4I-0Wfz;
	Sat, 15 Aug 2026 13:06:13 +0000
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wvE5N-00000003q3W-2qRE
	for linux-arm-kernel@lists.infradead.org;
	Sat, 15 Aug 2026 13:06:06 +0000
Received: by mail-wr1-x42e.google.com with SMTP id ffacd0b85a97d-47fe45db360so225750f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Sat, 15 Aug 2026 06:06:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786799163; x=1787403963; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6TunZ6T1253lLJ2+HTnnlCLT2K1O14zopzv5ooYmm6w=;
        b=BFb2iufjJ9seCefnC33vQ4eI+g4uCSILyHabck4q82KrJ1i3xi4wm3u7oT/CgqjzHp
         cG9JIDi29oDpyK83eo0teZZQG90442/OCCvUoPtYz06PcSoUdOLRMSOk76jhvbtiXf0R
         s4pjCvmK+U9iBeNYLGqL3zKN5GNDxOKlupK256C+9fhX17c3V5GK8kjaEAszIO5eO64P
         0KjbE8kk+lYXNkwlzJ6vE8GENgOlQNntXPa6BzdvEvcVYLkFxfac/V50SoXw58sR96X3
         HYguj6LLGv4XAwoGxNc9IB82VNx+iCnYTF3C5xDe0+vEOywMueblpvFpC+yjj71rRlq1
         Ndtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786799163; x=1787403963;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=6TunZ6T1253lLJ2+HTnnlCLT2K1O14zopzv5ooYmm6w=;
        b=WoegWtEm/jBtkV7gRLKAjsuGiBJnzklw7wyQViNQVoyr9IAnd3pXbfpq62ZRpiqDBe
         2gExGYIFB430TdF/e1YQRZlseMGvrNGzH+1vQlQWGLMzuS9UaHNp+DEGAAiggmnDIrE2
         HtPUwC4cvD42drnbn/v2HLyTBnuf6E5zMhj8GjbPEherETjbsu7PO+GaXt17QNWL30f0
         ImiScNpDVCcYIvfGJ+MUgS35z8syvWjQgUc5cFAhMK4kB5mLcyrrGhTmYqSZEZUHoKBs
         9iInrXgb5ZBqRIhsHa1FAUAfebZsx5/0IxVjCmRxIyIdSiueYAVQq5j2OGGGSXwyaSQ3
         hGBA==
X-Forwarded-Encrypted: i=1; AHgh+Ro9JN5NsMmyry0R7AbYKkaIh3dZBhEzrKkEb1G+fg0bZbjhlfyi4noTCq2+arC+FaFf7tiaOZXvrR2VQwRSF1e6@lists.infradead.org
X-Gm-Message-State: AOJu0YwiKJd9dQszlR5CsiXfLnCxUfW2mKopyATYjt4H3aoIH+cu6a3W
	oh1Nfk+uk5kkeRsyUzkda57RQYmh446i2lSSxT5CWrb1/gazD20qB5SViO+S4g==
X-Gm-Gg: AR+sD11ReJm8kjk7Bxwvc2D0IAJ8YB5qFfUagUqGlOe/t/IIsKhe3goKzPktn8K/tFM
	gRFsVjWvpYpdXuk6ir/qGIyqje+RRINr621Lafl0oKt+cANyv92j9LTFbeRtNPYn9Z8csaJo+b5
	amJiVVicyUtbzssL7YyeO7qsLdTsIIGn5kfz6Uubj5GaSN4GtRVnEekrJzGbrIMvX7ysYZahJE1
	J33CPD8wlBqz9b1teBvzKQ84qWcrNvo42MlAY1uY5eQu2yoVN85CXOAM2Om/MkM9jqFTT4D4d+s
	RQsFU3Llzp39JgADiBFJPGGNMp0ifAYT8Gpi1HZ21GdYj1qkS4d9PuS6yGad3w2v5fhIWL7yGAT
	GkDQJr9Tng9pclla9/wAarL6cIwKzx+Rv7mpKuwyGq6ccLFBirXTsOaI3yx1pk+KvRgq/b0Iryx
	djplwhUzAwNgqWAdls6zpApE6C0Jqzae4K4SbPL6U0/Waxu9lRR2X4qG7xhyPaEFECMpLRR269e
	6THFlSu6+CteIqwJF8eFJY756TgSosHeY+QSYDCgg2fpI+Az9rouqVzbX/rCO2IaKU+tQife9hh
	qI4=
X-Received: by 2002:a05:600c:354f:b0:495:650b:4c61 with SMTP id 5b1f17b1804b1-499879690acmr87570305e9.3.1786799163529;
        Sat, 15 Aug 2026 06:06:03 -0700 (PDT)
Received: from OrangePi5-Plus.BB-HOME (20014C4E1B932600BF05B505F15B0ECC.dsl.pool.telekom.hu. [2001:4c4e:1b93:2600:bf05:b505:f15b:ecc])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4999130d9a4sm59398995e9.15.2026.08.15.06.06.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 15 Aug 2026 06:06:03 -0700 (PDT)
From: Igor Paunovic <royalnet026@gmail.com>
To: Jiaxing Hu <gahing@gahingwoo.com>
Cc: Igor Paunovic <royalnet026@gmail.com>,
	Tomeu Vizoso <tomeu@tomeuvizoso.net>,
	=?UTF-8?q?Heiko=20St=C3=BCbner?= <heiko@sntech.de>,
	Chaoyi Chen <chaoyi.chen@rock-chips.com>,
	Alexey Charkov <alchark@flipper.net>,
	dri-devel@lists.freedesktop.org,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v7 08/10] accel/rocket: add RK3576 NPU (RKNN) support
Date: Sat, 15 Aug 2026 15:05:53 +0200
Message-ID: <20260815130556.68876-1-royalnet026@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260815031219.3860651-1-gahing@gahingwoo.com>
References: <20260812094106.1391698-1-gahing@gahingwoo.com> <20260812094106.1391698-9-gahing@gahingwoo.com> <20260814110825.14893-1-royalnet026@gmail.com> <20260815031219.3860651-1-gahing@gahingwoo.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260815_060605_741621_5FB44B1B 
X-CRM114-Status: GOOD (  14.15  )
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

Here is operator 28 on RK3588, and it changes the picture: it is not an
empty convolution here, and once the reference is right it is the
cleanest operator in the whole model.

Setup as before - same board, same upstream Mesa at bf70ab68a21, none of
your four unposted fixes, ROCKET_SEED=7, model truncated the same way as
the table (subgraph output repointed to the operator's output tensor,
here the 1x1x1001 BiasAdd). One change to disclose: the kernel moved
from 7.2.0-rc6 to 7.2.0-rc7 as my daily since the table. The rc6 run also
had my devfreq patches in the rocket driver; this rc7 rocket has no
devfreq node registered, so it runs like yours does. Before running
operator 28 I re-ran operators 0-4 as a control and all five reproduce
the published column exactly (32/32 md 1, 28/32 md 3, 22/64 md 6, 21/64
md 13, 8/128 md 15), so neither the kernel change nor the devfreq
difference moves these numbers.

Scored exactly the way perch.py scores, operator 28 reads:

  674/1001 channels match, maxdiff 29
  NOT empty: only 36 of 1001 channels sit at the output zero point,
  71 distinct output values, min 37, max 117 (zp = 66)

But that maxdiff 29 is the reference, not the hardware. perch.py scores
against max(cpu, zp), which is right for operators 0-26 with their fused
ReLU6 - the hardware really does floor those at the zero point. Operator
28 has no fused activation (it is the logits BiasAdd), and RK3588 does
not floor it: the raw CPU output has 362 channels below the zero point
(down to 37) and the NPU follows them down instead of clamping.

Against the raw, unclamped CPU output:

  seed 7: 1001/1001 channels within 1, maxdiff 1 (708 exact, 293 off
          by one)
  seed 8: 1001/1001 within 1, maxdiff 1
  three seed-7 runs byte-identical

So on RK3588 with upstream Mesa, 1001 output channels - odd AND not a
multiple of 8 - come out clean without either of your unposted fixes.
Whatever those two fixes change, this SoC's path does not need it for
correctness at this operator. It may be worth re-scoring your RK3576
operator 28 against the unclamped CPU as well before reading its "empty
convolution" - if RK3576 also skips the floor on a no-activation conv,
the max(cpu, zp) reference alone moves several hundred channels.

Two small notes for reproduction: perch.py prints the headline and then
crashes on this operator at its spatial-profile section (got[1:-1,1:-1]
on a 1x1 surface is empty) - the numbers above it are unaffected. And I
find it a nice detail that my board reads md 23 at operator 26, yet
after the CPU average-pool the classifier lands within 1 of the CPU -
the pooling averages the deep-layer noise away, which fits your 1000 of
1001 end-to-end result.

This reply was prepared with the help of Claude (Anthropic). The board,
the runs and the numbers are mine, and each number above comes from a
run on this machine today.

Best regards,
Igor

