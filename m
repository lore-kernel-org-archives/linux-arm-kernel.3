Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4944C982FA
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Sep 2026 09:01:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=y+jlf8HC0jzi0HPwewqu9aTCsp5Qe3C5F4r8ZihI4BA=; b=Vz7iIN9DtNwX3JhI5O1R3iJC0A
	mZGeIZjsxFWqaLWV9Ne7TTqb+OtMIkV35npE0gTP2A3k2zEs8L9Z9GU0Xrb83veGUyOpCT6iXdPfD
	w4l7QQm0+pbkDbGorRap+zYOI4a11M/SVxlMXepqxmtEmrjRG07xWyrsQbQ6bKQjFVCTqzgix8h+5
	ICHc1Hpi6fKaTFI+gX4hDz6+kjmf+QHaX9DvwJi8CK+5kD75Oj5OWdAbBHUJbgwN0MFq8XJ8T2a2c
	NnSzmG3Py4ZV5CDQZaNxHqHCBSm/txXFNkD+etJhxhMMh3l5fR6BlJoouE6o7vI9lUIfxYbU3SGGp
	eXS1h3Iw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9Iqc-00000007e5s-1WYp;
	Wed, 23 Sep 2026 09:01:02 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9IqV-00000007e31-1xjY
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 23 Sep 2026 09:00:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=y+jlf8HC0jzi0HPwewqu9aTCsp5Qe3C5F4r8ZihI4BA=; b=XD+Yc8P6B86LtzpVkD+THwAT37
	l39UHjmnmd0ZU6gfKbZSsF4CbPw7r7V2fsWkz5t+fO0xSgf167H18cCI5FWliS6JSSt9i01u5TYvw
	FPPU5NsuoGmul7gEyXzSii6fHZckHonAkhXM9m0KsXaD5GTagN6aWaJimtNtA9K2Dkzvs7Bx7JBwd
	Wh3/GzZzh1JmKnYdTrpBahAFu7JTTqBrGtjbpZiK1eCkGb2OwJwlX6AhlDzkFRfeZlxIg5hsnJybK
	tKPprjUA7LUXJWbx/a7ehiiig5LdrhSpBY4DKjpcjUCliWf/D23ddVY7QqPnVMzjr6ca7TjzrkAdk
	WapxBtiQ==;
Received: from mail-wr2-x10.google.com ([2a00:1450:4864:30::10])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x9IqM-0000000EYTz-0dn1
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Sep 2026 09:00:50 +0000
Received: by mail-wr2-x10.google.com with SMTP id ffacd0b85a97d-48436686a40so97640f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 23 Sep 2026 02:00:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790154044; x=1790758844; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=y+jlf8HC0jzi0HPwewqu9aTCsp5Qe3C5F4r8ZihI4BA=;
        b=CzfuePLBI120OZ5kJBk4UehooQRt4r0J9yjCnDFYuHmU964eZJpBciOXqi9G8fpDlN
         GHtiGehrAutPeNdSjjg2Ow8S5c6pQphol57Y11gDlErKAx0AFGGBclv+1jveSmIhO72b
         rLpqxLd3Jt9U0wlpQWHjnbURKwHpsbPKPM8+PSWYrkhuUNLw4HJK3a3ypHU+zrHMWs6l
         X929x2AcNO1QUhr1SpZjkG0aqlX7GB59Df8+bEdgCOn4QqJ8E3k1QWGsc1iXuvxqhI9q
         bbv1geZZreXDmLCkIe7/IL0jM6xwNykMBRJO09+hvLP4nKQHdZ1Dq4QXcu0ckFiYYBca
         MDsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790154044; x=1790758844;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=y+jlf8HC0jzi0HPwewqu9aTCsp5Qe3C5F4r8ZihI4BA=;
        b=MQAHn0tR98Qrfn44C1vC/nCgCd0XC2Zj9kinNrMe6TqsgaBpH/ce6j80Q5mX4MADAU
         +jwpMQ7GRxcoTgcotKHd4GaC7+OZf28u2sW2TVYRomIhLSLDCaqt1Mbc/WbxPv6J1cKh
         yFut7V6y09HJAuO/3R774SXBjRWhEGe97NOlEXYVw1SwZHVU9+u0yzxSBKa/CyOH1H2I
         7x1Ue9gavkPYWqOsofzyxI7KvAFmFlNTjSeHgla0B67bxMpOjirFVJeyWBBZknUFzS3m
         WndStkNAgnUfC0V81N/Oym3+7CXPKcSCxncVy7Typ9L0d9pVTE9Rvk8QVb1WdLkQu+Bk
         5XBw==
X-Forwarded-Encrypted: i=1; AKwUvBwRiUZMhBhF5gSfi6GwlTxUbHZvwgUsHkDUX+8zkJP9IIOxwsDj49dtvLHAQlI4njwG4/Majy5O7tlHe0DKVyND@lists.infradead.org
X-Gm-Message-State: AFuF++kGBPvUu+M32lmvh4jZU14FcQ+Hg+I5FfLK6hjosFEEtNlWGypm
	3Ri3jNaSt8/MPl3sGjocS88D7E76gzZFaNS7z2Gw86ld6zfrod897PUO
X-Gm-Gg: AYBFou2Gch+8vIxWGKIJ52Qlb5bMZmoCEtmgURmJuQTvoL+yBjiRqoUayQokQwCYz88
	cu7YWQNqzJRNKjFi0uPgsOE9JLlinwdXxgv+zqbmYaQEQjB9Un9tgUnUaOB57Q0JJ5otMSLHCO5
	s66PAuAlJ2mrPkropurfKjVBCevflCOzL/shuZUFNGBGBWJJGrxnThDTt+dL7NTzhH3jhuTeYcU
	kv8SgLOHAHiAiwy6PVZUiU2EVFht/WhDgIaWCUGtdq4KeWWNgQD6y78VswMOVhDmgvBs7jYuTFN
	XfPi3TZouZHLBVfq1NQsTlwIbAtkTTxBHzqQPYwpiWlX3ZbbP/JCaw3rd1y6k5HQwnDvBxhSBu0
	GKy0pADkVs/QPanMDdu1zNiep+wXBvysSn5/e2j+4H+GnfVsOn755TEmWOSObRhYf4uL1fSYm9L
	hy4oUhNpU8xSDZPXiRx3m2y8DaKB6DINqfr73HxgZ3211+vdmz4sCVaiY+prBHbR9KsShSs+f89
	xFztdL5A8dURuYYiCyWYJt6jPWNuXy/LcNoMgte4v2PEuyxV0aZCY3tCPpBuD6CLvrcNJHXSewI
	nt0=
X-Received: by 2002:a05:6000:4a17:b0:487:803:ba34 with SMTP id ffacd0b85a97d-488670c9e54mr2673656f8f.6.1790154044255;
        Wed, 23 Sep 2026 02:00:44 -0700 (PDT)
Received: from OrangePi5-Plus.BB-HOME (20014C4E1B8F4500D949869966507951.dsl.pool.telekom.hu. [2001:4c4e:1b8f:4500:d949:8699:6650:7951])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-488688893a0sm5538990f8f.32.2026.09.23.02.00.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 02:00:43 -0700 (PDT)
From: Igor Paunovic <royalnet026@gmail.com>
To: Heiko Stuebner <heiko@sntech.de>
Cc: Igor Paunovic <royalnet026@gmail.com>,
	Dmitry Osipenko <dmitry.osipenko@collabora.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sebastian Reichel <sebastian.reichel@collabora.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-media@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	kernel@collabora.com,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 0/4] media: synopsys: hdmirx: add HDMI audio capture support
Date: Wed, 23 Sep 2026 11:00:32 +0200
Message-ID: <20260923090033.16539-1-royalnet026@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260721064115.64809-1-royalnet026@gmail.com>
References: <20260721064115.64809-1-royalnet026@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260923_100049_319421_1E64BC51 
X-CRM114-Status: UNSURE (   9.12  )
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

Hi Heiko,

patches 1/4 (binding) and 2/4 (driver) of this series are queued in
the media tree (media-committers next, ee6a964dca65 and d667a3c4d003)
and are in linux-next. 3/4 and 4/4 both carry Reviewed-by from
Sebastian and Dmitry, and both still apply to your for-next (4/4 with
an offset).

Could you pick up 3/4 and 4/4, or would you rather wait for the
binding to reach mainline? I can resend them at that point if that is
easier.

An LLM assistant helped with these checks and with this mail.

Igor

