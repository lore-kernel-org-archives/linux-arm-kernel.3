Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA988C61DBE
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Aug 2026 12:45:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=L/tKJYcvU4NXXk+0M0kR7FOdArxlDjY1WmX2yzsU5wU=; b=NA/Ub5S22rCRDHz0jVQKs+0667
	t/ZoicER4nmyNmiEPwIyGaV8nPUBZI3C6MIBR8/726jk4iWZBcgCkYQPKDKy7OjBcb05Qq1l3pOTD
	xZBlcMH+lCBWdzeSDr6uOq8ZsJOIxDqvucyJZcbUOpOUKVqqjJxPGGBnQ25Tye5k4NS9jagzHmm4P
	ncr8c81o6vmYKZk6eWzC0vRM4Y0jrQHBMUTFnuAHthtRsy8EOlRv/uLPES+LpbW4puACcv48Zfr7Q
	QrSvWjVLRHbzdNLbcUgC1xLokhayLEhoNqV3fu8R9CKewZHshcC4xdc50LFGHwQ4/CZ4QYDmlHPk0
	9KTLi0Zw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyqX9-00000000nzD-1q9l;
	Tue, 25 Aug 2026 12:45:43 +0000
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyqX6-00000000ny4-2ox3
	for linux-arm-kernel@lists.infradead.org;
	Tue, 25 Aug 2026 12:45:41 +0000
Received: by mail-ej1-x629.google.com with SMTP id a640c23a62f3a-c1676648c1eso38503866b.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 25 Aug 2026 05:45:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787661939; x=1788266739; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=L/tKJYcvU4NXXk+0M0kR7FOdArxlDjY1WmX2yzsU5wU=;
        b=aFP9P93eBEZ17ricNKzyq/EV8sr0u0xZexEt6ktjvxPfkXqk77bTz/fk26h/9tPufe
         kArS9i54ybOjzT3CeslI1Xffm4+Wh/wpJH3c5XZwrHL1FL6hviCdQy5ji4sKV51egwdc
         Iv8sTNhumY5OrHBwC/rKjZzcJNrFWd6BhAyBSQDjBB+fCb9Gzd/ko4g3t3E8+9o3rEAb
         YnWx+2iBjxd/5EnlZwBEzbGRr9OUp7mEdh0hKF/6QpnqntbTdYNxpFh6H5Sur/ZnL/m6
         sDKI6H5UqAmyx5EP9UOi/n0eRzVsbhvZAegnzdeDjCBbUjYleHql8YD0xqNGQ1icmnHZ
         kkRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787661939; x=1788266739;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=L/tKJYcvU4NXXk+0M0kR7FOdArxlDjY1WmX2yzsU5wU=;
        b=cu+yOkr8xsoEzXmOCBrCsnYmXL5nCIAkLgIXxO+r4HDLFN5bSv8PmhQ1ViwMZ9esmN
         MSa3RaUJjNXGBsX6EEHSkXbmwzBlMUHze2bsx1MhOyzS7HmXl+TDiKR7tiaYxi5Wpgc7
         h/E/fbtXJ3BR57i7wELGXyNYPeKM0fXpAk6876Nvo9y7asURZ6DGl8IjQL1Ke29VmR5B
         53VYYGnOgEw7h13bnrAWlbBxMJu1Jpj7qGcpUCvESSduwssSiRCs4Re4T9jZ8nsWu2PP
         glVO8QgjjcNF3zNVzKQjcdqlMv5XYpch1Zdlboa64iTgW1VX0oiwZn3mnUSidpefVvYi
         8VOg==
X-Forwarded-Encrypted: i=1; AHgh+RrTiCgVSvQerHS/l/gfnvbmRMaT45ZaFphJmX35InCd6VCF9yGtTgWRuuRMnJ3yskGOpQ0TYi2DDtW9El5J4K6O@lists.infradead.org
X-Gm-Message-State: AFuF++lfg11GHwNIKA2RtwrL1gkdN7HJ0xLlyyQEnVUm7TkEGNy4ltq9
	F3oer4dbAF61PcT83nJwQVqFoRBhjAsmSXh0fpHN0tMythMA1aAoTv+B
X-Gm-Gg: AR+sD12c/rSQ7xF5yGq/zPmCs7bsSTegEZIgO5MPbIr3V+oeiO6y5V5nZ09UYlvfToU
	xqgrOqhLUtMRj3Q++Was9yMT8YFinEXDaaJwgA1HKzM2+sQAaLLDeB/4NoSM0cEKQFaUdUawDkP
	yKAEGKyfS/dDSu6zs1zY6tlbP1jdTcVzIrofsQDHgjkID2sl8EVQPCs79qs671ar8hyxiUxkKvG
	gXcGO3HMLYgnbpZjgiJbPh0CcvNC878mwmQdYfF9oXMoCF5dhH1zovoxfFjHOvETIC6WlPc3ydu
	Aj7xP3EaJ78x59jxoEIVdRKvF7O2J+UxWUgy8DT0zU4Psu//FEslxuJ1ns95PGMuEoOJKQJDUof
	/YKDo6pKvj2itYGUvlarRhysLrO4VYuO/y5kesl17uAummBF7Goorpd+xh2aXPpIrGjWgzMLuNF
	xqO2W8aMFmDmrtiSL4AAhDVZrCAPCqjV0bT7okssxgHsYrIwW9JLj1Ci/YAkWWOVoFq+wrzpkpP
	LpVXcBGzWd/QK3cUV54zn6kKO25+ioM8/SULBijJYi0JaE=
X-Received: by 2002:a17:907:a089:b0:c15:de99:8060 with SMTP id a640c23a62f3a-c2469f96e84mr1943665966b.0.1787661938300;
        Tue, 25 Aug 2026 05:45:38 -0700 (PDT)
Received: from OrangePi5-Plus (178-223-53-162.dynamic.isp.telekom.rs. [178.223.53.162])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c249673d43bsm1646329666b.47.2026.08.25.05.45.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Aug 2026 05:45:37 -0700 (PDT)
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
Subject: Re: [PATCH v9 02/13] accel/rocket: wait for a running IRQ handler before resetting a core
Date: Tue, 25 Aug 2026 14:45:05 +0200
Message-ID: <20260825124509.11657-1-royalnet026@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <CAEWPSH5mxTbUkNouxm6yecMZYvDowquhvYvhaXQ8HoMtHD5U1g@mail.gmail.com>
References: <cover.1787568658.git.gahing@gahingwoo.com> <7d47bbef8b629eb287fdfa3e8d6c62b95de6b61d.1787568944.git.gahing@gahingwoo.com> <CAEWPSH5mxTbUkNouxm6yecMZYvDowquhvYvhaXQ8HoMtHD5U1g@mail.gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260825_054540_743541_F4D0D90F 
X-CRM114-Status: UNSURE (   7.57  )
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

My mail client wrapped the tag comment in the previous mail, which
would truncate the disclosure when the trailer is collected. Here it
is again, on one line:

Tested-by: Igor Paunovic <royalnet026@gmail.com> # RK3588, three cores, induced reset, differential base, JOB_TIMEOUT_MS=2

Sorry for the noise.

Igor

