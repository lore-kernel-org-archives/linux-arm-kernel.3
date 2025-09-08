Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D93C4CA1013
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  8 Sep 2025 08:45:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:To:From:Reply-To:Cc:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=+GK9tSWxCSwHclhCGlVejFXBQ2aFQkr+nMXMBqRXK58=; b=ZKdQ8iXvnFbEZLtWzZ2y4zFVV7
	CldUkv6Bia4JdT6srEClp/d0da7BFvc1UZgUUp1OAomjpIqL0KpGbwGqzhBRURKCUdtlXacGzPvUi
	cOJ+ogHW5udxw15B42iFTlXNxdzz86RT+yjnPjlukKElQn1nYdt1xZMVQ982E9tkA01XbGt+Nbndy
	hFDGgL0ySQl1Ayc/bh+qAhLgF0symVjlqYt/B1nUG48vVPuD1HUlydcBEBz4l8SXnCP0jCISofAxQ
	OTTe2BMyX6G2BREL2+3Xc8kGJ1A/HOs6Vc5+KP3LUQoKa5o9Kg5Gj9KFTPEWJk0GYlS8waf0px2A3
	TY45FM2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvXUw-0000000Fn8e-0qxd;
	Mon, 08 Sep 2025 08:45:14 +0000
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvWpW-0000000FY5e-2I2j
	for linux-arm-kernel@lists.infradead.org;
	Mon, 08 Sep 2025 08:02:27 +0000
Received: by mail-pj1-x1029.google.com with SMTP id 98e67ed59e1d1-32bb1132c11so2269065a91.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 08 Sep 2025 01:02:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757318545; x=1757923345; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=+GK9tSWxCSwHclhCGlVejFXBQ2aFQkr+nMXMBqRXK58=;
        b=TMy9UkHY+zv2mVuesLMIbLmIAk08qTDMD5/AH4AbR9N5EUqyX8yreBgixY9JgUJ12H
         ht6XsqrDpvrIBN7da8doC7auaZIIunO1w11TQ4GisTiadYuh5UpPJwBYRvi4mpGj/7Ul
         wqs/TZQcIppm1bAIIAydmUUb0hz51ItCz3Xu134lmJ/8msldnGZrmwWdIm3WgqYWRU+Z
         M+1Z8M0DYkjHk8XrwoZ04Jz9sJpukZctGvK7jTToBbN0mIG4H1kR8JkBuOYWAP8rzCwF
         ldyBfuA7J1a6XSbN6iqK0Udnk9OPCWiaG9u1tOzedlyO/6ugGCsBGkdWH/oAjNnCf6C8
         R1/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757318545; x=1757923345;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+GK9tSWxCSwHclhCGlVejFXBQ2aFQkr+nMXMBqRXK58=;
        b=g8MwfD8xZpKeF7mJCtR1V0zKnIvPT4kVA3Do7Arz8p5znS26Q93oWZ3UFWiTvXBB+e
         7BoGrUd4Kcblpua2ho89xGyTEKAZ7dJ25GwsmbfDk+oT+RDJezUaHpqEroefIsThq8bf
         1YbxCFfLIP7UrrWFyI/azn5de9hfBuSWHRmJTFXuqcLiPcF44wIB0ifuYe7PYcBscK06
         HO7pwSuPVPYZ3ARdQlhSZEe2tRZT+ccFlxcyaaggTPmimCyaF/63lhlLMtIvXnWMFnep
         X4uwxY1mZ2XAVqUc8yQ3r3/ClCuB/9O7r68slHcwqxX4xu72VO5P1LOZxErRpQ2y5a0W
         DJlg==
X-Forwarded-Encrypted: i=1; AJvYcCUKhZjXE8+6GgAgWAALFJcjWf+XFkRtaF27wK5KA6DKzN42eSjTvrwRoQ0z4sxPWzOjUdILjo1Q9qgM68BhKwXJ@lists.infradead.org
X-Gm-Message-State: AOJu0YyE+qUgk293465I3G2sG0ZkeOszIT8MHozKiBNezn0MvKB+q6gb
	hqQ3CJ6zOhtI5UdnaLGUn4Bnu4TKyjpZPySRdJ6xpGlGeFj5dnKU78x0
X-Gm-Gg: ASbGncubzp3D9olabAzKueNbSt6N1xHG8WtBviNU1nEIOjg/vtbmt/lIzWn7gfykPMn
	LTdZnTwE0Fau8l6jhVPTOq9/G/gPgEJb3eYrg2KfmkC5sBhghS+4jBVUMM8GaCZVu3ks6pjTEiA
	uvfYspOP0f/SPIEEvWQGJiQ3R9z9q4Hx2oc6FYTPrVuI3Jrl67N4BQueN0tH86wIw4T4okNU5WZ
	GhZzu96/urXSuJoU3KMOZKRbtdqwo+drLlJLR5m4mHxRcmGH+GKGFPwlQO8niIkVXOPB1qamYNO
	RCPVK4kNjiKKEpakmTGkgr4VT1kuu/onJvmGbPlBi1qMpXu3TM6AQbKVkllcdp6cqyiNvtL9o/J
	xlA8C/U8d0WGfl/91uGVTaPJTPhPVYMXdaCpn3bJRk8Xj+qgCvevl9O3Kc+w2Kc4Pt4+STqIppt
	XIWkzl2r05r/el9oTO0dVX4RepProeA/+ZVgDIUwp+VGQGAYuzX0FYBcGdsdtWMxgXFNED7nZMh
	ffrNA==
X-Google-Smtp-Source: AGHT+IHllvq11IvDLajj8xHW5uT3UeRGLK1mFDGxqYTfZLrLjLfh/epSzbZCpYMmk4Nyq0zjxJyr+g==
X-Received: by 2002:a17:90b:3c44:b0:32b:6223:262 with SMTP id 98e67ed59e1d1-32bbcb945aemr14341441a91.3.1757318545276;
        Mon, 08 Sep 2025 01:02:25 -0700 (PDT)
Received: from fred-System-Product-Name.. (61-220-246-151.hinet-ip.hinet.net. [61.220.246.151])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7727bce1b58sm15186600b3a.9.2025.09.08.01.02.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Sep 2025 01:02:24 -0700 (PDT)
From: Fred Chen <fredchen.openbmc@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 0/4] Revise Meta Santabarbara devicetree
Date: Mon,  8 Sep 2025 16:02:11 +0800
Message-ID: <20250908080220.698158-1-fredchen.openbmc@gmail.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250908_010226_586301_49568CB7 
X-CRM114-Status: UNSURE (   9.43  )
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

Summary:
Revise linux device tree entry related to Meta (Facebook) Santabarbara.

Change log
v2 -> v3:
  - remove mctp node label
v1 -> v2:
  - add 'bmc_ready_noled' LED and update commit message
  - add sgpio line name for leak detection
v1:
  - add sensor nodes for extension board
  - add mctp node for NIC
  - adjust LED configuration

Fred Chen (4):
  ARM: dts: aspeed: santabarbara: add sensor support for extension
    boards
  ARM: dts: aspeed: santabarbara: Enable MCTP for frontend NIC
  ARM: dts: aspeed: santabarbara: Adjust LED configuration
  ARM: dts: aspeed: santabarbara: add sgpio line name for leak detection

 .../aspeed-bmc-facebook-santabarbara.dts      | 856 +++++++++++++++++-
 1 file changed, 852 insertions(+), 4 deletions(-)

-- 
2.49.0


