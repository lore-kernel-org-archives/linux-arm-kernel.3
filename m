Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63927E7716B
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Dec 2024 09:31:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=rSvjzybcpgZsvOT9TlMKPiZLpA7cHiGiwj+87vtqrQI=; b=Tzz7UqC9+QRQ/NNNaosEAa0Xcq
	u6ggZmATuhi30/IIx5+SzyK8WTOTwvJHHe4VhB9G1fBFXDtlxMI4LDFwqwy4Ig9xV9dx5ulxEqAht
	nu6RMMeco9WRY17Q1rrB6J3mOpkk6aI30sAcCUGk858QBxtZpfEz5vl7M53HuNEsxgnkjz/KB5Nl0
	Q0mCGQbOmKBJQeeBqu/5u5ejvxPG2aBYdzsClIbFD3PUY3Is3pRiy/FLm+Z8hxN3gJRUWN4As8I4x
	qH6gP2yFtI9+BiMLuHUl/38andBXq8RySTNOJMcUO9liVVPmSwUkYQLmrzta8TYQjWN2njlpp/HpZ
	1Zi8kOdA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tIliq-0000000C34b-1N1N;
	Wed, 04 Dec 2024 09:31:04 +0000
Received: from mail-ot1-x32e.google.com ([2607:f8b0:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tIlgt-0000000C2df-0EPE
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Dec 2024 09:29:04 +0000
Received: by mail-ot1-x32e.google.com with SMTP id 46e09a7af769-71d46ace74aso2982951a34.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 04 Dec 2024 01:29:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1733304541; x=1733909341; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=rSvjzybcpgZsvOT9TlMKPiZLpA7cHiGiwj+87vtqrQI=;
        b=W+SyDWrlK7L5yP+O+sN5zQ9x5WyiMElhapZuTq6qm9JQ2Rj8InF4Ea2EGkoVBIJGt/
         U5gYbKtiKHwgPhNeGPBl72kDvwUZFxAEYaDDciN2H94ZDSeMiiNiJ6ZGxCEjn2KS3KoQ
         5tPG011Vbb3Eaz3nCImFhQ9idNhT1fSdiWdEs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733304541; x=1733909341;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rSvjzybcpgZsvOT9TlMKPiZLpA7cHiGiwj+87vtqrQI=;
        b=bIrJs+v/sDyNRsXmNOvE+CmmrDDjufSXlfOm18nWDrqN4JP7qGW4s9RIcWF9I8SV3d
         8kQAoWC+NiGZFk0mSHkLmDvWia+rhTGLtU3nF7+DKmigCNNB3obWlzaHWW3BgSkgbhXB
         reVMmQxpLdPyyKlkfdiqJx4ih/PSntnTOH71P71+R1Zfm+gSv7ILr/4jB0BfTXLsCKEi
         HamvlDZiZtd5H0AeQpKUvBUKk1BdcsZAe/d1wbZeB8rGAYGTa3WwXAIjMMTDXxO7TRjo
         /1UHAusYFKBoJ8BcJxB3oQuo9xFzsoyy8PgkIIjH64FUK/WeUixqHaXaGpWJdN1kyKDq
         qC0Q==
X-Forwarded-Encrypted: i=1; AJvYcCXHiOwZeJwci8ofkSyDb4f0DiRt09v5nriRpAnSYolOFrhIYF6Kdwdfc9rOjRdatoMG1elzGWGwcabiH/W7bR0P@lists.infradead.org
X-Gm-Message-State: AOJu0YxhysKQiEZvP2SxDPNkDE2QygtAnXHrYhtqi9cozi5WmNB8WoSR
	O3y49aylINP6b5Lvsz46ejYTszntmvzlfAeJ6DSc8/YAq/b6cIDQM9/tCPYWxg==
X-Gm-Gg: ASbGncuCTMh5XtUL4yRmF+Ts7cwBTepbRdrfvmcrJJ+ZPrNLTdUHQK4v2VqrPnYoNeI
	fN8NHe8ynHmR2gcBJhF9sumBcaqxT2RyjoYoOUsgXRAfSZWHCoLUxtkFENWGCR0IF6DSVnI6Iuv
	VIVev0DGjh3WnVzNSj+zHUgHgVaKrJnJDevKnumWv12eo9TYFHXVfZBvanHXqAn0w0lFeog5caR
	56effsB/Voq587TpsTS8Etv69BaxiVqnKQy8gDSTv4Aw0Ds1S1hv2cC51UuKkQSeWm6
X-Google-Smtp-Source: AGHT+IEDEK2nhMPbAOsuMuh6j108aGwGF9PHLhxq9QdnWZtG1dV+KYKtrNgMaqBZ6YJiiA1s1lmFsw==
X-Received: by 2002:a05:6830:b93:b0:71d:5a8a:1a37 with SMTP id 46e09a7af769-71dad652b13mr7062531a34.15.1733304541404;
        Wed, 04 Dec 2024 01:29:01 -0800 (PST)
Received: from wenstp920.tpe.corp.google.com ([2401:fa00:1:10:2eb1:a68a:2625:b944])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7fc9c2d38dbsm11049024a12.15.2024.12.04.01.28.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Dec 2024 01:29:00 -0800 (PST)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Chaotian Jing <chaotian.jing@mediatek.com>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Wenbin Mei <wenbin.mei@mediatek.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	linux-mmc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	devicetree@vger.kernel.org,
	Frank Wunderlich <frank-w@public-files.de>,
	Andy-ld Lu <andy-ld.lu@mediatek.com>
Subject: [PATCH 0/2] mmc: mtk-sd: Limit second register range to SoCs requiring it
Date: Wed,  4 Dec 2024 17:28:51 +0800
Message-ID: <20241204092855.1365638-1-wenst@chromium.org>
X-Mailer: git-send-email 2.47.0.338.g60cca15819-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241204_012903_127644_C6C31345 
X-CRM114-Status: GOOD (  11.64  )
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

Currently the usage of a second register range for MediaTek's MMC
controller is seen only on a few platforms. However the driver tries
to grab the register base regardless, and then ignores any errors.
This makes all the other platforms that don't need it produce confusing
error messages.

Instead, make the driver only grab the register range for platforms that
actually require it, and correctly handle the error. Also fix up the
binding so that validation of the "reg" property is as strict as
possible.

Please take a look.


Thanks
ChenYu

Chen-Yu Tsai (2):
  dt-bindings: mmc: mtk-sd: Document compatibles that need two register
    ranges
  mmc: mtk-sd: Limit getting top_base to SoCs that require it

 Documentation/devicetree/bindings/mmc/mtk-sd.yaml |  9 ++++++++-
 drivers/mmc/host/mtk-sd.c                         | 15 +++++++++++----
 2 files changed, 19 insertions(+), 5 deletions(-)

-- 
2.47.0.338.g60cca15819-goog


