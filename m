Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F6B7C9830E
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Sep 2026 08:29:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zlBXKls+F/WVyUupqY3wSg0zZR5jLPtlUo39nbMOMgs=; b=NEmOtG9kWm6ieu+xZMilgZhsnt
	1/ZY/DFqL5O1WiYgTWJQ3Ec02H7suIQ9YGv40tlZpgc2aMOAbI0MVlZjV6/sXXMTlPHHvLCkRvuf0
	9obgSFRqWWQGzOUmhW7yYz+wodMtaxS/kAPjCIYBapIIzODZs+tMb4mGDQOJxOAJbBYVVmwfxiTug
	dzJpL/35je1gMXm0E5cgki0NHXLZBqTQj/2ypSFJiyXr8lW5/C0ytSPhhy9bX4MeMFdi16ipcwVei
	gaoV+3+ojGEoLDNPAZqeAJfv45XCPbDD+3K0F7FPdLA9rvOBdLCDJlfpc0eQIww3CguXvPjxerBu3
	2p1+l6sA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9eps-0000000AQwa-1oBq;
	Thu, 24 Sep 2026 08:29:44 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9epq-0000000AQw6-3sPE
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 24 Sep 2026 08:29:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=zlBXKls+F/WVyUupqY3wSg0zZR5jLPtlUo39nbMOMgs=; b=DOmDh/rk73TCA/eaonpv1YWtjX
	JLfq+mZePJ5GKMu5FkBoTm6keGoSA5LHzRuzv+zSjJURpcRqIJTsMurGWb53qCNCdvfK+37AmkODs
	KSw7fYhUL/q4F+D56qM2SUPWugVJDPsLGOC7lz7rvuhyn+w7n+rYrxQA8wWtUpKAKtpAotMM9rai8
	7W3xTPZlByJn9U7J2L59PC6BfzxfxCTX0w+0cVO44PUzaCLcBuQs/N8AivlifWOfe0f6fhwvqSPy6
	gAgroMqowPBShWxT/a0d1nVt0/AUyzgMmIYTFUpdvYsshbK3J2W2lttC+HyWacnlr2hz4d/WGeBXw
	yHN9FM6w==;
Received: from mail-wm2-x11.google.com ([2a00:1450:4864:31::11])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x9epn-0000000FiyY-2r08
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Sep 2026 08:29:41 +0000
Received: by mail-wm2-x11.google.com with SMTP id 5b1f17b1804b1-49b912d3931so13574295e9.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 24 Sep 2026 01:29:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790238575; x=1790843375; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=zlBXKls+F/WVyUupqY3wSg0zZR5jLPtlUo39nbMOMgs=;
        b=hMP26DEHuEvLOgcUqPWZXTnIC6o3UDu8iuKhCG+FmtaUl/yVuh0Z+3C7d645GmoeOD
         hv4iIhIwW9wlKwlEV0o9UEHUfgKgowu9piLtMptP8hfa4H1ICnTaJFPYF6KO323ezfmb
         r/xUhCcWz018qlmuVUSYy708Dz9dim4aDBYTOiN6m4WfDoCQmpAQMZnJEZF63gEy8WTr
         QJnfiIsRBo2D0Br8MkzscJYSLCD6h+tpi0Oc0kL9C6DA69dBirindh59DrtZQwZ4+tGf
         6lnjZXUCTjTurDMpZ5ttr0xAYbHq6T5FK46tzqZgX8zVrgLEV7DG31Pvo7WXFNaPEYWk
         cdiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790238575; x=1790843375;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zlBXKls+F/WVyUupqY3wSg0zZR5jLPtlUo39nbMOMgs=;
        b=0y0Y1D8PT2H+IbNh/VPyppP1PGVooBBS3Jh6lz+CS1mfG6MBv1UhgIIdMnKGLJkO5m
         p5sVcit2gmNy6svhfQH428qFJgnkiT1gX5xOl6I6WXJFLRMphZYwuLjgVSgot381IpmS
         OnacPv83OHMtAeZOtczDRsqMPQKaaSICdGwYuQyCqmqOmwLT3CIrkEkKeWvyWpHzrZ5O
         b7eTDIg6MJQDoPQCDHAKOZgsMYQuAtghKKoZJIrQr3+HpzA+YniGPTgBhkSOmPaUA+0+
         UZsoOPHYKPr9yecQNg2+NuFzFqxiJqS4xKRo8BYtmcTBVnmePYHzmU/6PUeecTA9/V0i
         KeqA==
X-Forwarded-Encrypted: i=1; AKwUvBw4YbQ1Q5xRTQKX8kHZ5IiIfosFVKoFwzfAoi1zzTqZYXNzWjMRSv6KLnOofxY7bDF5SyILa/L6T479p8dIXrer@lists.infradead.org
X-Gm-Message-State: AFuF++nn6Kc079fiTZ3jEHqzu4RxdZ9pxDUy/n8DapzxKigDgX4oTzy5
	Q2JQb9MHw2xsmqL/ZVtHTWrONJNYl3lC4Mb9OhMmihJdtKrkgLaZHBnl
X-Gm-Gg: AYBFou3qUDwZMIM39bDalZz/E1EB6s2TB/s9PXsxwjsSvO9Te3XEljGU8Ji+BxUu6ii
	/c9LKVylYA/6VVhhqv9CN7iWt5p7Qinc0DA3AfnG9f+R7DJhPM5sEKS2b07qarrNYrx89Th4kAK
	kBLNUjV9t0WjqG4AwltRJ/Ck9UWP9ds8u2RUTXIhbpRMGFwKM8OmYc57AVwEX+A7Xj+ibhdZOa6
	OsXpoShB0HJIeXYZlQ8fzWfBqtDSC1HozRo549g+hYhnEiu2vNog5ScQt8Lm2/zqjK7DMyOnFMU
	/aD1JW8nUHWqx9Ps7oP91+S2k8cX8FLUdF6w0MJR1ZdmUx2LW8/WSqhk1wRwXKLxt2qB4vUQfTl
	OZP5yvH5IolEpg/7QLjuIClVk9P7BHO0jv0itZZ8IZdiJvS6g2Pob7NVGXKm9MxBNlXaNxEBEgZ
	iG+5tAfvWAZ7Byzs8CN0EGdVu7R0+Gs0rnZUCXEAF6bBNWCoNbgVd+8v6wukiY2i7dZ4h8lwpCb
	ACUJ8CMJfcQn60lDw==
X-Received: by 2002:a05:600c:628b:b0:499:900c:9c69 with SMTP id 5b1f17b1804b1-49fe66d1134mr25718035e9.9.1790238575219;
        Thu, 24 Sep 2026 01:29:35 -0700 (PDT)
Received: from localhost.localdomain ([94.252.74.168])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-49fe0c4b51bsm99926925e9.4.2026.09.24.01.29.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 01:29:34 -0700 (PDT)
From: Oleg Keri <okerixx@gmail.com>
To: Catalin Marinas <catalin.marinas@arm.com>
Cc: Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Prasanna Kumar T S M <ptsm@linux.microsoft.com>,
	Beata Michalska <beata.michalska@arm.com>,
	Sumit Gupta <sumitg@nvidia.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Ananthu C V <ananthu.cv@oss.qualcomm.com>,
	linux-pm@vger.kernel.org
Subject: Re: [PATCH v6] arm64: topology: fix arch_freq_get_on_cpu() overflow above 4.19 GHz
Date: Thu, 24 Sep 2026 10:29:28 +0200
Message-ID: <179023856877.183607.17352008232359942762@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <arPmhnU-pkGpaD4-@arm.com>
References: <arPmhnU-pkGpaD4-@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260924_092940_227292_6D1A8E1A 
X-CRM114-Status: UNSURE (   9.34  )
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

Hi Catalin,

On Wed, Sep 23, 2026, Catalin Marinas wrote:
> I assume Dietmar and Will's acks still stand. I can add them from v5
> (let me know if you disagree).

No objection from me, thanks.

Oleg

