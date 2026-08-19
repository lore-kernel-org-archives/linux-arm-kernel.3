Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7116AC5DF6D
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Aug 2026 06:52:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eNYpcIGxrPu5UcGxlHe8CSKb/lcjMt/RLjlOnDxhBfE=; b=ORvQ18CMavXIiw2utZ9UGN200j
	qg0UtKCMgSoawFZ8G4iw25HUjlIvJeF1rXHk7fwN2kwFN6yPKEFTuRghYjywItSt1n+DuFS0SajpK
	4+ip4RzYIuGhdamEIOvvIi1ITI9ClYgqUVFCVoo2SKbT5u1244FUbBsqrY/Tm3ZXvtzgiOl/1N429
	UAlFSagZ7QPGLIv1jZCEW28zPmOlRV2qBGC1zWmaGUSdgK0YIKGs+34Yo+TmO26A4iyGgY3TesHcU
	hxjlUpV1KLi5uY3iVWCYsBvMQjuiWTLMmFrL6hGR0iHnejHqt5ALvIXCJqwo5y2oJKG2zlwYe6yhl
	mi4j0ceA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwa9n-000000097uJ-0Cd6;
	Wed, 19 Aug 2026 06:52:15 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwa9j-000000097tH-1t9t
	for linux-arm-kernel@lists.infradead.org;
	Wed, 19 Aug 2026 06:52:12 +0000
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-499acf0fb63so50195e9.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 18 Aug 2026 23:52:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787122329; x=1787727129; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=eNYpcIGxrPu5UcGxlHe8CSKb/lcjMt/RLjlOnDxhBfE=;
        b=TJCfvTPUQOsGjpxpgVg4I68xUuKum2crpj1iyas636ok7Nho253nIW38TWQV5jM2vB
         HRjLNaTaU+otuJgKLP2p37XmJy/Cy3viYZCue7StFQp2Tj5L5lRzYJfowxu+JtVqnqPF
         ZAZI2pr6KTq2pQ/+V0lE9+vm2qsbMXpe7sbVdRFZ36kbUgTJ5asnhApBqpHL+aUIBgPW
         epDdUl4Ne0I2HfOaX/QnelN98ek1R4O80YMPIK+tky9GI7Tw3zx05CmBmmd48V6uYEx7
         uAM5GdOZ/OZp1SHWgU/GbdvYGMDdTMQVWp2G4fJRKOL+WP0No2CLhzQvEdhhYBc7VDW9
         1Qbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787122329; x=1787727129;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=eNYpcIGxrPu5UcGxlHe8CSKb/lcjMt/RLjlOnDxhBfE=;
        b=mNtxoX7QuX19LvmMc9ICM3tV00IBHD8PGjQHxCGJ4MfgctPw4kTEzN93+miHKw3A7X
         T6pFDz8NBKaCcH/BrQNQSmFlXYurw4I6EruERsriqtevchVQFEXjoFCGf91iZwkMGaGG
         Aks7VEvfJ0ThYQB949nU4aOE/ob1hWbX+qHVikibKSx1KhLr1hJtlP8e/jTUMmfKX01h
         I4t0lHty0ZAk3YPItaG6+jxltb71Vb3G44/zL/E/6Irmkc5YvEhq+c1LXKvjJT6zS+RE
         GeroQpR9qQ67lFRzXmMRtNEhF910EPPK0tj82iAXQKBYpZPrZTkEeA0jWJLszJG/0JNH
         sM5A==
X-Forwarded-Encrypted: i=1; AHgh+RracrmdOd2GNsRQaIBoMXMGQCeaFlms2ByQqxQAKMsoMZS5hHiRrJbTvuxFgQxBhFFlcBRYDXxRqythZr/3ouhw@lists.infradead.org
X-Gm-Message-State: AOJu0YywInBXshm9Qbe0C89Hl42yPGBaHmZ1nF5y7yS6qCVBy0JbH7cT
	nrqAYvWyGg+H0TdZvcFXmo3SS+mqtBAsKpHVYYp9XG8MPmeQU/t0TTfp
X-Gm-Gg: AR+sD10LXWQe+t7Ya/qT0Jn0SqTDjWm5Ne6NNTHScqaz6cQK/hxJlDSFWp3ShxskjMK
	182m6Khew7ZvJlFM0WttoBZ+jHzXOelKwKbEI4HivfVsE18M34LwCjAOoD9TiZCEcQXegL4y8uI
	WhDihltve0RDA0LOjvO8s3SsXxhCVWAhA4wbHWnySU6gAwIZXVsU26QaDn1smmAIye2pYMHBgab
	P+D7Vcp/QOFPALcEU2KSpOxB26XwC7mTcrmtOD5SMn5jjwd4DEqLkt8tIcNwZXPG56zPjxxTNfq
	k8HG8UeQhKIFUv2PlD0p10RznmE+4Ee6wCc+Xb/M6PVFCvTbbNFnu4x6hHw7mYS9tUVeA+la8Sb
	2HCGXGCFlTpkT4FpNrtyPDSVHnyEXp9VTNswqDoMUidzQRJEnfjMTFDsJ/LsBVvLduzzgy6m4w7
	SptIMagdAkWOPUP6FrBS/+Z0la/2NoWIz0iwLFQ86Qqkya+rcTYcNiBJy5GllsXYwDyD+BmE+DK
	ByZJnmv3aksCfZtHS4IFebi77tbJg/KJQ3WVC15CZakA9BKEQEdDz9mpjhcZeLa7mbvzy8yhDmZ
	aCO+
X-Received: by 2002:a05:600c:1c29:b0:495:4126:1e55 with SMTP id 5b1f17b1804b1-499aa1c16d7mr24093695e9.2.1787122329217;
        Tue, 18 Aug 2026 23:52:09 -0700 (PDT)
Received: from OrangePi5-Plus.BB-HOME (20014C4E1B929600C08047F1073FEAD0.dsl.pool.telekom.hu. [2001:4c4e:1b92:9600:c080:47f1:73f:ead0])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-499a9aa7e8dsm24166515e9.0.2026.08.18.23.52.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Aug 2026 23:52:08 -0700 (PDT)
From: Igor Paunovic <royalnet026@gmail.com>
To: Jiaxing Hu <gahing@gahingwoo.com>,
	Tomeu Vizoso <tomeu@tomeuvizoso.net>,
	Oded Gabbay <ogabbay@kernel.org>
Cc: Igor Paunovic <royalnet026@gmail.com>,
	Heiko Stuebner <heiko@sntech.de>,
	Chaoyi Chen <chaoyi.chen@rock-chips.com>,
	Alexey Charkov <alchark@flipper.net>,
	Joerg Roedel <joro@8bytes.org>,
	Will Deacon <will@kernel.org>,
	Robin Murphy <robin.murphy@arm.com>,
	dri-devel@lists.freedesktop.org,
	linux-rockchip@lists.infradead.org,
	iommu@lists.linux.dev,
	linux-pm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v8 02/12] accel/rocket: wait for a running IRQ handler before resetting a core
Date: Wed, 19 Aug 2026 08:51:45 +0200
Message-ID: <20260819065146.5904-1-royalnet026@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260819013609.1613919-1-gahing@gahingwoo.com>
References: <20260817113603.1436067-1-gahing@gahingwoo.com> <20260817113603.1436067-3-gahing@gahingwoo.com> <20260819013609.1613919-1-gahing@gahingwoo.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260818_235211_631982_961A0B79 
X-CRM114-Status: GOOD (  14.27  )
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

Thank you for the round history and for running my archive check - the
zero stall/paging count telling us the MMU is not responding at all is
a better characterization than anything I had. put_noidle vs
put_autosuspend with a separately forced suspend/resume sounds like the
right de-confounding split; I will watch for the result.

Here is the induced reset test I promised, run this morning.

Setup: RK3588 (Orange Pi 5 Plus), all three cores bound. My 7.2-rc6
tree with exactly two rocket changes from your series - 1/12 and 2/12 -
plus one local test-only patch lowering JOB_TIMEOUT_MS to 2 ms so that
healthy jobs (~5 ms at this clock) cross the timeout deterministically.
No other rocket changes; in particular my lifecycle series is not
applied. PROVE_LOCKING=y and DEBUG_ATOMIC_SLEEP=y. Serial console
captured on a second machine for the whole session.

Protocol, built around the trap you described - the RK3576 symptom
emits from rk_iommu_enable() on the next attach, not from the reset
itself: 20 scheduler-driven runs over the model set with all three
cores active, a follow-up inference after every induced reset, then a
forced autosuspend cycle and one more inference. Two full passes, at
console_loglevel 8 and 4, because synchronous serial printing on this
path can perturb the timing.

Results:

- Pass 1 (loglevel 8): 12 induced resets. Pass 2 (loglevel 4): 8.
- Every reset recovered. Zero MMU_DTE_ADDR, zero "Error during raw
  reset", zero lockdep or atomic-sleep hits across both passes.
- Outputs matched the oracle in 48/48 checks per pass, including the
  inference after the forced suspend/resume.
- All three cores returned to runtime-suspended between rounds; the
  domain did drop and come back cleanly after every reset.

So on RK3588 with 1/12+2/12 the block comes back every time, and your
non-recovery does not reproduce. Combined with your archive result
this is consistent with the failure being RK3576-specific on the
platform/IOMMU side rather than rocket-wide.

Two honest limits on what this run shows:

1. All resets ran with three cores bound. Isolating a single core
   requires unbinding the other two, and without my pending lifecycle
   fixes that path is not safe on this tree (the list corruption I
   reported on Aug 12), so I skipped it deliberately rather than test
   through a known-broken path.

2. This run alone says nothing about the race 1/12+2/12 close. The
   same protocol on the base without those two patches is queued as a
   separate build; only that differential earns a Tested-by, and when
   it lands the tag will carry its conditions:
   # RK3588, three cores, induced reset, JOB_TIMEOUT_MS=2

Raw logs (dmesg, per-run outputs, serial capture) are kept; happy to
share any of it on request.

Regards,
Igor

