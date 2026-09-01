Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9DE2DC61DD6
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  1 Sep 2026 15:07:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=I/qfdHGcZJO3oZ78BHYS8PUCc8yEpZReKvOSgJYCsWs=; b=QXmjjyfetyv6n+enkDKtHaEclB
	Isjq2ls3tMjg4efVHmHyJ1xvzhkEC1BTK8q0EYMAM+J2LSazk99Hwf9WnrtUIFm3/lejP0GaYMCXt
	KBlGHAtMeb8ZCNx5w/xGaTUmoxFBhidEcfFmO8pVK7wT1lnlxv3M40fi60Q2bc+ddgyU4LXLxSUg2
	QMddw8EoLGc4q6pzgrleOa4H4umIiMmgJoif5zwfmZsKmPatjqPRmwrdkcXHeIE5keT33/URMegAZ
	tPXwy8zI4D2myViqt/s6Kmuvn55wKdk6u11jsIH32r09cRSsmTTC1dWUk8rP8xW2rReW0f9IV/dsq
	0OwZYnPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1Q58-0000000CQyk-1ECo;
	Tue, 01 Sep 2026 15:07:26 +0000
Received: from mail-oa1-x33.google.com ([2001:4860:4864:20::33])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1Q55-0000000CQyN-3cee
	for linux-arm-kernel@lists.infradead.org;
	Tue, 01 Sep 2026 15:07:24 +0000
Received: by mail-oa1-x33.google.com with SMTP id 586e51a60fabf-46a22783960so1271900fac.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 01 Sep 2026 08:07:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788275242; x=1788880042; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=I/qfdHGcZJO3oZ78BHYS8PUCc8yEpZReKvOSgJYCsWs=;
        b=G5b8zwPtA39NzO20BtBrdhAFs58CODJQDvj6w/5Zlp+Ux0V1eYp27mxpWlC/wi5Y9n
         u2QcD0UZiCYlXviLs0LZjUPeEFTMeOoORf33PvU2Cbg3G/AdfGUESQQ2sYUwFUC1FLSl
         jguXVeONJFBIkrdHOHCOlwF0sUY7zdlVC5xA5B/JaK5tyXSP7JdFVP3UJP1uwu3rWi/3
         D97fcv9JaAl2ICMVKP6ONrtKJW8HojQ0ZzjXZFWTLdxyz5UKqq7+kDazMwWd0mxQNMPX
         YWw0j7YpxnvnWcqEyxb9JUUUACVloFGeShr0dr3Z43yykEs+qLQGDU+tYUBEYbUQ8XTH
         Ug0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788275242; x=1788880042;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=I/qfdHGcZJO3oZ78BHYS8PUCc8yEpZReKvOSgJYCsWs=;
        b=AuLFO4opM5fME/oQPm7r5oyBx3m6OJ4WBwPC5+CNU2K/6vfv2upVZe6heOv94XHL95
         BpaWmWAySiJM5suia+O9GRk8sPGnrWCIMUZRcknzM4KJ5qAPRJkcJkkHWacLCW6Xj2x1
         hrYKoWqz2Nrb8UJ9qVg4n+Y3W39uZcdbxCoL+jDACQkwjZdPpdZ0WCsSo/RiZT038TeB
         MVWn+pwolQDwtJDnYh+wUuu+qTlQHI4nNP3+/Q0tSWRt5JK77zhB0T8LR703rj/eYuiB
         /5OX69lrvhEEmrtcDXS+vEtPlQpexlN9Ppqbe0IdCcAFQSdsU+3p7Wg8mIAECOFyE/W3
         Gl3w==
X-Forwarded-Encrypted: i=1; AHgh+RrrMhyAiPeogdO81KMYcoO4htTKEohS+roaXb+/bzk0s4N377r5x6sivLmZPpevDOra47VHJDgCt+IzxENgpY4W@lists.infradead.org
X-Gm-Message-State: AFuF++m5mimeFVJYkVpq0XrwhPEmr+zhAAChNCfyd0ALNyGTPnFA8kiC
	suaS7CTmU1feBvh99EaF4+7dsd3RfFODfaIf20Bcg4NO6ZbAQ0ZRQo3v
X-Gm-Gg: AYBFou0NnzgSqkbCMKQCDGnHhLLiRbpV2jDNwbhCqvFk26pGcYhylRK6z19+ZGNh/Pi
	DBTa6vagNUoz6Nr5x2v+e/9ZxBhQme8RauRrx5bh/eBXW/m/yzSWC3Bplo1thWEUDMUhu07AQkG
	5FwbHR9H385qmse8Boj8/w5k0v08jV0/bo70+l/8KW3rOb6U2ht+Wwj1f0Rgh/2bbhbr8kjRSdR
	ciEQoZCnIiTX4hYr8fzimpKN1wwrqAZWTtRj2pJBVhW0UfyLjMsVGtJicKoCuS45wkse/Y4J7Kf
	iH/Wsmgp5N49q/dxr2MxxGsUX1jNn9Z4ewEqZc4+7zjXs4be/fbUEv9uQ12QQJy0Doz7WXI2RvX
	JjdQAmAmcql5Gr57n90DbkQz4WNNBq8y3sZZOtzkg1Sd8HEE+0I1A2FkptfnV2ACeNd5hfBzk8F
	I8INZ7rsJ15SD2vC/nw0ZZQsN6Hz76BSThgRIJoHX5pzwBLNFTNoyUrBef6KBjKdjryqgejiGD6
	uTrUxAz2Ejee/i+xJN1kWXY3hOIZhmBQC3977rM
X-Received: by 2002:a05:6870:698a:b0:456:772f:682d with SMTP id 586e51a60fabf-46837cfc41emr43388545fac.19.1788275242027;
        Tue, 01 Sep 2026 08:07:22 -0700 (PDT)
Received: from AMD.home.internal (dhcp-9-244-8-156.gobrightspeed.net. [9.244.8.156])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-46a4b7a9f82sm10697162fac.18.2026.09.01.08.07.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 08:07:21 -0700 (PDT)
From: Enzo Adriano <enzo.adriano.code@gmail.com>
To: Vinicius Pedrosa <vinicius.eduardo.pedrosa@gmail.com>
Cc: Junhui Liu <junhui.liu@pigmoral.tech>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Maxime Ripard <mripard@kernel.org>,
	devicetree@vger.kernel.org,
	linux-sunxi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 0/4] arm64: dts: allwinner: add A733/Cubie A7S DTS support
Date: Tue,  1 Sep 2026 11:07:20 -0400
Message-ID: <20260901150720.1764626-1-enzo.adriano.code@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260826230942.466219-1-vinicius.eduardo.pedrosa@gmail.com>
References: <20260613-a733-dts-v1-public-ready-v1-0-7787c94681db@gmail.com> <20260826230942.466219-1-vinicius.eduardo.pedrosa@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260901_080723_926912_8168C78A 
X-CRM114-Status: GOOD (  10.63  )
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

Hi Vinicius,

Thanks for the detailed report. I reproduced all three issues and updated
the private v2 candidate.

The Cubie A7S board now defines a correctly named 26 MHz `hosc`. The main
CCU takes `hosc` plus `losc`, `iosc`, and `losc-fanout` from the RTC clock
provider, matching the four-input binding. I also renamed the bus to `soc@0`
and moved the UART0 pins into the DTSI with `allwinner,pinmux = <2>`.

The MMC binding fix is already in mainline, so v2 will contain three patches
instead of four. I will hold v2 until the public CCU and pinctrl prerequisites
are resolved, then rebuild and retest on that public stack.

Assisted-by: Codex:gpt-5
I reviewed this reply and take responsibility for its contents.

Thanks,
Enzo

