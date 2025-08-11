Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4888C87FD2
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 11 Aug 2025 07:35:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:To:From:Reply-To:Cc:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=VmAvaOe6j5EmRYWGU1fBubg+Cb6vql9Hba/ceuT9oGM=; b=BZYI6fO8LtL4Wra35Go6zf7TxP
	IM8Tw8anmOi7ky59a6rpxfzT/JCbc9L9aGrrsPDnHuYQ+ZYKVAWNNPjiKcqz3yPuSeTaSwPy/DlWt
	1ykqd0/tIkGrWAwoPlMSafY1hoV4j5T7x/sbyisByLxExafB8V92v+5mLpETgJzQRc9hY7Tai118/
	Ax1ZDGiQaTyMCJ9Qx0stxeK1LrcUhHQ9LsU4DC2xnjdqfDsd3LUDD73fA0rE6tR3jVL5nqsLkV83W
	vxVNV34ik7x44do+WF/JgwlMRPFmCZWD5SSyQSR1FByGHFB/jW0ZjZ3y5RMG/JSZqLbZ1xc9Ve3nO
	oUkfbZhw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulN3W-00000006ifL-2lUR;
	Mon, 11 Aug 2025 07:34:54 +0000
Received: from mail-pg1-x533.google.com ([2607:f8b0:4864:20::533])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulN0v-00000006iMs-2bXl
	for linux-arm-kernel@lists.infradead.org;
	Mon, 11 Aug 2025 07:32:14 +0000
Received: by mail-pg1-x533.google.com with SMTP id 41be03b00d2f7-b422b31b1c0so2444032a12.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 11 Aug 2025 00:32:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754897532; x=1755502332; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=VmAvaOe6j5EmRYWGU1fBubg+Cb6vql9Hba/ceuT9oGM=;
        b=eHyIsdSrlxZpWcXGj3IiGJD6SmyPaxz/Og2WDeEYugB20jdgXYyPzhFfuE1YZ/6YJY
         NVeXC/Vv2yakJ1X9Q9js1P5NQr2PsewmVWBUHUHkdLqHe8qRBLt7Ol46LwvOIU3dRNSH
         KXdJCeV7W2RT8GKAUe016pIZ2nmm5NC1fNMFu/f6qdT4MBcEZD3/EYTZz/Rt48QUln2l
         0kQslQ+Uq7nuwWnuynr75zwX78TMub2/d9RD0XxAdly2swvr+qluEt+53k199gSSMdJy
         M0S8nHAGLmZYzy3ut7aa+1UjKe8eLAaMxaXuP3vwbEeB3cImLaeNZoAaRLb5gwa3ngbg
         8zIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754897532; x=1755502332;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=VmAvaOe6j5EmRYWGU1fBubg+Cb6vql9Hba/ceuT9oGM=;
        b=HmWa/EINRKC6K/mvxmKOt1gC/t9sfFWmLdvdYBZ1E48yd4gXQW1SGtrD1nOrgjSHVC
         lk/Hs95o5TD5PezGstZkNgh3kLKLIhefCaChvBaD0RTUo4oTrLpU1HNQk7GA8llhanqu
         B4xPM6Aro9VHnSfKwrStciRMn+lQnO6uJmzXDC87Ut8B9Khjo+g4IvzrOzG0K/Wex+B9
         SGEP0ian//w9MSQviTonbNeA72r2nWqVp8rpso1wFoSSaEURABzKzMrAU3FfPVfMlNI3
         EjCVqQfnvOm6xam8hdvMaUd3FAmiv42UGlVEaIuwiulxzfnf5yfsXIaZ1D+1igLCvaq1
         BkYQ==
X-Forwarded-Encrypted: i=1; AJvYcCWXqrCotpCdQkfH1Bm4e2lIV8eIZXNYYFuZ7bl24TWuoILmIGyrjpbPsD10G8yGiO1K1HZlsxdfeoFiiqXpdmRx@lists.infradead.org
X-Gm-Message-State: AOJu0YyPENYdMV5wcKqxxTtgl0jPHxSOdxYsFvuw6tVocbadt3mGp4if
	3i0K1D0wKpUoaIs4Sn2S+M8FYIAj+ktt6R0/dMSFxnCaeYtiEppRYhEP
X-Gm-Gg: ASbGnctoJ2ydmYGx0o41t94wjjJ/vBhco96qzNN+v3gzDzCsmSasxr1N5et6K/DWQYe
	50kr9gvcaGNBAPNQt+8nVvXMAGQK6WefYHJcRxcyPJNP7Iq2qSwHA7ChmBcJtCbHYOvSf1unv8K
	VsmLRufbZ8sWIuW6jwCQg1gdDuesjhu5AHgWTHQZRJI2d+l7P+mf0o2wIXDi2IpYL8OO/6XCZY8
	GS60fQNXZ/4/yzseR9DHWJo0KLdJAbkSHqyreh31mnx8qtRYjFRAhpAo+nW3HDUYyHw+ycbCX+a
	CtzJqPjoCvNFuPq9IDiJtD+e37vcM6VcNYxCnPSnZ/YH3SGrETaAIzQToM74b6pNcJgly/JvCeS
	FqtwUHrXrRGmUfoyohg550yJrNw1eXK5tZfpYmJpYtNninWinJHOuiTJdQgH+duOjTBf4zY7dAY
	HC+bvpuHcAw8eu4Sc6uduYjQxb256A
X-Google-Smtp-Source: AGHT+IFXbN/ROk/rj/EE6wkBjU2Pa6lHobrT5on+fm9tiIBjWD7PK7FkSOu7E5PIF5JTYu2m2sIOTg==
X-Received: by 2002:a17:902:f78e:b0:240:1831:eede with SMTP id d9443c01a7336-242c21e043dmr224354695ad.32.1754897532487;
        Mon, 11 Aug 2025 00:32:12 -0700 (PDT)
Received: from peter-bmc.. (2001-b400-e388-d3b1-e90a-ba63-d547-4584.emome-ip6.hinet.net. [2001:b400:e388:d3b1:e90a:ba63:d547:4584])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-241d1ef59b2sm267624575ad.7.2025.08.11.00.32.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Aug 2025 00:32:12 -0700 (PDT)
From: Peter Yin <peteryin.openbmc@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 0/2] Revise Meta(Facebook) Harma BMC(AST2600)
Date: Mon, 11 Aug 2025 15:32:05 +0800
Message-ID: <20250811073208.787063-1-peteryin.openbmc@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250811_003213_657248_01499BDD 
X-CRM114-Status: UNSURE (   8.32  )
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
Revise linux device tree entry related to Meta(Facebook) Harma
specific devices connected to BMC(AST2600) SoC.

commit-id: 2236141ed3d6f31f53147c26208dafef6051ae43

v1
  - Patch 0001 - add power monitor support
  - Patch 0002 - revise gpio name

Peter Yin (2):
  ARM: dts: aspeed: harma: add power monitor support
  ARM: dts: aspeed: harma: revise gpio name

 .../dts/aspeed/aspeed-bmc-facebook-harma.dts  | 25 +++++++++++++------
 1 file changed, 17 insertions(+), 8 deletions(-)

-- 
2.25.1


