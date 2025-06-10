Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39957C5B543
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Jun 2025 06:37:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=6O0xC6SOcOSthm+nVuFP6/iA1o0YzWpNBPJwRk/wNao=; b=gaoJhwThhqa6JamH5w1lDky+3G
	LlLhyQT2x/O9Z1DUGTWpAcd356q+J+EXTs+hnxB87TrTd+u2SLc9QoOYVPmz+YEZHr3Wml+Tbt8eO
	jjQtGFgAO1jemiPb2yXYaR3TRegjSXBgWHr/9vNqb4TyI4l4+fy+g/SbetsybXjkQKXf6tAL5K7Om
	rFAZRiIqhp2OqJFnT50Sjqeysxu4CnIt8FTF0dp5KNoe5vu5wTJh5SBZH8URzYmxwSYvTsRZKVZ1P
	296u7tP/Hx6KMmAznUK2+nzA7hJHktiuRaPYwUdU4jYDnepdYgGN2fW9ZpPhHZ71DPWRuNFleyRXL
	9mengmrg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOsbP-00000005whx-369s;
	Tue, 10 Jun 2025 06:36:55 +0000
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOsZG-00000005wMf-18dJ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Jun 2025 06:34:43 +0000
Received: by mail-pl1-x630.google.com with SMTP id d9443c01a7336-2363497cc4dso7558595ad.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 09 Jun 2025 23:34:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1749537281; x=1750142081; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=6O0xC6SOcOSthm+nVuFP6/iA1o0YzWpNBPJwRk/wNao=;
        b=AfpzYHLPxv8IWRx0wY+a8dWRqWe8XohwfVVsYXe/21MKRvkVqS1E9SZQbcJysPZH1Q
         vPXdP+QT+Cg9W24mgKlCq6wnhaZ0SMiuxlEDKKLhx411HjwHKSt5+zAs0GkuoVlo6LGt
         oNbmB+urU5WOfHIUu0MXT8Gp0NdQ2JRy0ePIk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749537281; x=1750142081;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6O0xC6SOcOSthm+nVuFP6/iA1o0YzWpNBPJwRk/wNao=;
        b=PCdxPa8pvnfaSj0H10LDRJbR3VWtcdL8Y73oHqDkILlmC96lxoMdVJdpdvjGt2F4qT
         PyR+9DOxxSuDjPesJVY6jhxpdbnMJQELadzz4lwaAbwhMEhFNeVORmiNpMgheOkl1Spy
         cUQeYFOhJNkuCiDisfaUGAEJtlD6gzS0qHoGlVqFx9z3POMoBkVoG8xbCDdvdzSQZJGr
         6BUQP+08Dv79KAIBVmaJoxk2R+KxJdFpEftmaQw0LkFaykBt17UI8V5ciLjsCgoPCpdK
         ECQ+VfCq+Gi7TEIN0w0PBxB3oqEx4rVKLxdEYvYKP/dFgJ0CdbaQ3UvV2ImG2ArCJ9kH
         JEpQ==
X-Forwarded-Encrypted: i=1; AJvYcCUTgYWDhDcViqU1lyfw1YIDSAv169Ws4QEuqlfQYt9jBt2wGt63bRdB2v5tiqbxM+x1NH0/pHuI1XPyqiQpBVQ1@lists.infradead.org
X-Gm-Message-State: AOJu0Yy8F8KynPbyB+pVUktjJJojoWtn5KZGuEnRKt7xPYLARGtrm1KX
	xJKRFAH0sE6OUAVoxbpajGV/1BSIyCRUOZw6NMRsKiYFx9hxEb4pR6q7jHEl+zPRDQ==
X-Gm-Gg: ASbGncvoinLNBrFz22M0CA1YWlsbXgfRV4qvbHnNWL0PLKGCKZDPAzz/JXN4iDKhtcE
	EdFbFeSWOKuYoC2b9MMiK2srOD0qUuCs+KMEjcpOL5GPBNOgD5EXV7fS7bergJMjMSAI5yHGh1C
	olbODnAugGh61dKm0495h+Da6xX8yR/D2yor9Rcq1DzmbRtmjTHZ/Ozo83eL0VaWWWUBpxO+s3z
	c1qlMa/nYQF026f7HGPmk2+fSXU0KuNWw9+j301L39cslekh12ueqqyC2qZSVm4HUkIfLtaUM7t
	bPB4aDjZ3EeS/vbzBjz4lymdkL5jAss5IlBslbHLwYV0TOzCbn7GJbNwEI1w9flCyJm8rkSmdRR
	kA1x2
X-Google-Smtp-Source: AGHT+IFMVjJL9gd/t2t1Cdy7S0Az0MbbHnKQkvJXrj2EcXFz4rjITbDsj/BO0L7kopXXEwjxKA52Ew==
X-Received: by 2002:a17:903:244e:b0:235:f3e6:4680 with SMTP id d9443c01a7336-23601cfddb7mr217198085ad.21.1749537281092;
        Mon, 09 Jun 2025 23:34:41 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2401:fa00:1:10:2826:ada4:efac:14e8])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23603092ee2sm64596765ad.82.2025.06.09.23.34.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Jun 2025 23:34:40 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Srinivas Kandagatla <srini@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
	Lala Lin <lala.lin@mediatek.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/2] arm64: mediatek: Enable efuse GPU speed bin post-processing
Date: Tue, 10 Jun 2025 14:34:28 +0800
Message-ID: <20250610063431.2955757-1-wenst@chromium.org>
X-Mailer: git-send-email 2.50.0.rc0.604.gd4ff7b7c86-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250609_233442_302356_FBF095C4 
X-CRM114-Status: GOOD (  14.33  )
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

Hi everyone,

This is v2 of the MT8188 efuse GPU speed bin post-processing enablement
patches. In v1 [1] the change was made to the driver. Angelo, the platform
maintainer believes the change should be made to the DT binding instead
[2]. v2 adopts Angelo's argument.

Patch 1 updates the efuse DT binding so that MT8186 is a base compatible
with no fallback, and MT8188 falls back to MT8186.

Patch 2 updates the MT8188 DT to follow the new binding.

If possible I would like to see both patches merged through the soc
tree once the DT binding maintainers give an ack. This avoids prolonged
waiting for the binding changes to land and uncertainty about whether
things have fully landed or not.


Thanks
ChenYu

[1] https://lore.kernel.org/all/20241223100648.2166754-1-wenst@chromium.org/
[2] https://lore.kernel.org/all/11028242-afe4-474a-9d76-cd1bd9208987@collabora.com/

Chen-Yu Tsai (2):
  dt-bindings: nvmem: mediatek: efuse: split MT8186/MT8188 from base
    version
  arm64: dts: mediatek: mt8188: Change efuse fallback compatible to
    mt8186

 .../bindings/nvmem/mediatek,efuse.yaml          | 17 +++++++++++++++--
 arch/arm64/boot/dts/mediatek/mt8188.dtsi        |  2 +-
 2 files changed, 16 insertions(+), 3 deletions(-)

-- 
2.50.0.rc0.604.gd4ff7b7c86-goog


