Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24960CCF9E5
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Oct 2025 22:36:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=1A/LVcxwDpEvr0Gd6ktMDjyv/wP+ObMnSP73Nfx0djA=; b=YzV3Wo84NsENTFmUfzeZPG30cF
	wb+jFNxDE956aGYXgNfVz2ImqjmJri/KxxZkhAINzUCWoH8rScgmvypYT5Uanu482dcp/ZCEPqwEC
	YauDbsDDDvig1WYFeuyYFmWwKQhc+3hAqLfj6wS7PhI77fcyNZaQg781GfGAIXV8QwsgX6iwP6OS2
	NKDR+kN3+IsJaVmu/b+ejkK0doyPHz6POi1Yy0mAnV9BZAd1X4MWIamnJdJiWhJgPvdyA2Srzz6wm
	u3DOi+Mh7AWvXHPFU3BjvrXIxl+0WnLtdz0qt6Zw1NMYbIHLjn2iDV3wHG/hi43NDsmWYCTwkdGhJ
	vjY7Xqtw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDVog-0000000Esgh-3RGP;
	Mon, 27 Oct 2025 22:35:54 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDVof-0000000EsfO-0QJG
	for linux-arm-kernel@lists.infradead.org;
	Mon, 27 Oct 2025 22:35:54 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-47710acf715so9045795e9.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 27 Oct 2025 15:35:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1761604550; x=1762209350; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=1A/LVcxwDpEvr0Gd6ktMDjyv/wP+ObMnSP73Nfx0djA=;
        b=IYNqPSY1Qpv2SGdKL/k+lrisNdbl2aBNQHgiNdDnXVdMmURl5v/DKjIAxExImvEIzJ
         1MbmPge6NYhi40iab5Ybi4M6yg8vj1v4n6cYJnvCEZnaSiq/DfoVtnyF5pcSUQDOh3RG
         Ea5csp5hAcgtxoBbIHy2diXuNnIcs+iV2TTrXLG/8NLD7i3wGJjSvZYck9NLAiBUy8UN
         ET4pyUTjZmHWfCGrWLI0v2W4B9GYgOWYKg3ZBd4ZaZZQ6i52/fs10PWPp5AphuBlXUSr
         3pOvE9fuJxZBuQV50Li8xqfm8crI06+BmCJPz2mdLHHfD0M0TK0Ad6trOcNsYUm0Zqz6
         xfsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761604550; x=1762209350;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1A/LVcxwDpEvr0Gd6ktMDjyv/wP+ObMnSP73Nfx0djA=;
        b=irR8IOmsVGfGLVAnCCZ+WahKj1VLRp/jkWO5d/dtln7U95Aletqrac9W1WzaD4bxzW
         t4t9v7dxoEfy/kCCOmpPy6UFFU2iiGrWbJvM7ha8q5X8Iu9F7UsgyH0iCRpFzMI3Q3Ze
         UckyyvhwH5BDIBXIp1B6aoYnjhh1TjlYzR4b6fccQCPijjwI0phXG98olXCHTonLNpN5
         qqpDfBhPwtGeeoz2xAgmHtCOeAUjjKCxjZVuZ8e2ncgcLYdIccPR0bvtS8wR3z99PrA4
         l4zet8EtxRPGZ7fGCMVR16PzOVTDCdDvfP4ZStI6eueZO3WcPyJ6llYMV3svc1M3V1XR
         s5Wg==
X-Forwarded-Encrypted: i=1; AJvYcCXDFl1ADmMj89Bk9EkqXoML+JpYKbfW3e5gcOYsagBZY01JaAygXcc7QcYe54Z80lKjYuh57SGjYtFPRTB/6w+R@lists.infradead.org
X-Gm-Message-State: AOJu0YzO3227+UT9sbrngeGDJFXiw9B7NL046TU6+s5/CKp8VkUj++FI
	8iZ8GCZXxhuV1G//Wf1us7f8+MFF6zeCH0q3L0hn1HPg7AstISHdyupmZh/FTXOrhhk=
X-Gm-Gg: ASbGncu/9gi2FzdQp8UJQZBXNId/hWmEFMVUj9BQoLBFPuB78ww6FdUufkOhhdOlK60
	U8BwGGEP6IW1jRXRq1z6FVzQ/r1XXABQ7+MeI5Ly5O2MBYGJGisRLe7zSjB7B9K8l2y9vKANmcH
	0QnW5bpqv0vIgsxJh5zNYjn22y/ZnqU6eCh2TA0PooxME+Z3l6xL+PjKiyJ3gNeEMvgBNgnOEyz
	Lu6upRgpNHytaTQjt3r5sZgqLHkGkZrSESYjM1NX7Djpw208jpSZYzrbvFXKBQ9Xv+ryw8epV4+
	kId1RVfY7L/0Mtc2AaH2Kfc4VeGirOH02aPJAXFdXzfFOdpJnzC5SJ5KVtVJpv+mcJ1j0xAeGaV
	6BzvICNUK92npp3nFhRqIJXQqULaAZXJuVVSP3YI4k9bF2ZCJ9pcWY1ekIIEchC8I7Z8Q9+Lwg4
	1UTrcKy7/O0odccoeQ8QCPUpXoNhPV/ZoOSZ136byCRS8QIh7Zh6POSCypZ2I19voYlJBuyrj4H
	j6De0TrTahAvUkY3dvxIWH1TdvCsn/xZ+KmJX0=
X-Google-Smtp-Source: AGHT+IHNgeLqcQIQBIBat/dcUh1iIM3JbO5kFkHctU5a6hvBLpM7+lnvBMICPcm0MwMUNylncZpsPw==
X-Received: by 2002:a05:600c:4446:b0:477:bb0:5e0e with SMTP id 5b1f17b1804b1-47717e3036fmr8362885e9.20.1761604550213;
        Mon, 27 Oct 2025 15:35:50 -0700 (PDT)
Received: from linaro.org (host86-130-206-17.range86-130.btcentralplus.com. [86.130.206.17])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-475ddad455fsm79826845e9.2.2025.10.27.15.35.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Oct 2025 15:35:49 -0700 (PDT)
From: Mike Leach <mike.leach@linaro.org>
To: coresight@lists.linaro.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: suzuki.poulose@arm.com,
	leo.yan@arm.com,
	james.clark@linaro.org,
	Mike Leach <mike.leach@linaro.org>
Subject: [PATCH v2 0/1] coresight: fix issue with insufficient claim tags
Date: Mon, 27 Oct 2025 22:35:44 +0000
Message-Id: <20251027223545.2801-1-mike.leach@linaro.org>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251027_153553_156891_B8C51DE8 
X-CRM114-Status: GOOD (  11.07  )
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

All CoreSight compliant components have an implementation defined number
of 0 to 8 claim tag bits in the claim tag registers.

These are used to claim the CoreSight resources by system agents.

ARM recommends implementions have 4 claim tag registers.

The CoreSight drivers implement a 2 claim tag bit protocol to allow
self hosted and external debug agents to manage access to the hardware.

However, if there are less than 2 claim tags available the protocol
incorrectly returns an error on device claim, as no checks are made.

If insufficient claim tags are present in a component then the protocol
must return success on claim / disclaim to allow components to be used
normally.

Changes read the CLAIMSET bits to establish the number of available tags,
and adjust the claim returns accordingly.

Cache the claimtag protocol availablity in the coresight_device to reduce
reads for the main claim/disclaim api.

changes since v1:
1) Added claim tag availability cache into coresight_device when using the
main coresight_claim_device() / coresight_disclaim_device() API.

Applies to coresight/next

Mike Leach (1):
  coresight: fix issue where coresight component has no claimtags

 drivers/hwtracing/coresight/coresight-core.c | 46 ++++++++++++++++++--
 drivers/hwtracing/coresight/coresight-priv.h | 10 +++++
 include/linux/coresight.h                    | 15 +++++++
 3 files changed, 68 insertions(+), 3 deletions(-)

-- 
2.32.0


