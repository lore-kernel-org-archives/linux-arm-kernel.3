Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 297D1CA5FC4
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  2 Oct 2026 06:29:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=/3uKP316TAfLOs8D6w2CQrvf9oUDjp4A6r7z6eIgLW4=; b=QxbqptQ2U/ot5odNQeKy5E/K/F
	docaGDXsy3wjgtw0SXWgzEmLUyr8IN1PmPcoJS7TCuxN4YRQEJjWQqJ4O92fhyIUaVEHHJCiJy+AF
	0Qlon2/+PmYkgdKkVyoHuRDabKLCyW0Hlb2e+in0MatAICxhvteFy+FxdpLXcua3ONq0gnhJxfE3y
	S3ygwlCIlaeJpFvTXpvjJ4XdrZ3Jn9+x1w4yWdWYyVF6LNNGzUnlLPE2rO9Du3jP+L/7AmFhyzv7K
	zBog1/iCWfi/0UnztS34eU+Z3wWtKno5ozaU0m2ka00Q1hFGecdKUcW7clpNvti53GEua70SU23G4
	ju/WYyyw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCWm9-0000000AiSw-1FPN;
	Fri, 02 Oct 2026 06:29:45 +0000
Received: from mail-dl2-x0f.google.com ([2607:f8b0:4864:38::f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCWm6-0000000AiSc-46Ev
	for linux-arm-kernel@lists.infradead.org;
	Fri, 02 Oct 2026 06:29:44 +0000
Received: by mail-dl2-x0f.google.com with SMTP id a92af1059eb24-142dd046b87so5805919c88.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 01 Oct 2026 23:29:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790922582; x=1791527382; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=/3uKP316TAfLOs8D6w2CQrvf9oUDjp4A6r7z6eIgLW4=;
        b=fNvg0zPACcR+Q5RTjrM2/lpc6pVcLcA+dkpXO2tBr9qpAgq0r/EjppWSidG03CKFRb
         YDrdiZ2IcDZwQM5pezJJo2bYqKOVbMu7fgGU++jO/k//orNk3qbnWkIb6kld+BAbRa+7
         4XNRQSQ4p+ctvidktBp0hV+ljFjkPjTTo0S9XgR14nRrYVgFX5q+QjO1oMpaZLAxQNNg
         ekLcvr5PAgBSEQPjp895eSouaOb5WV0jbKzhuFo3UZEsSSnPkKSwzzEOQKkVyL2jWwLb
         X50smV7+U33i9LApXMACs2p1u/fOkrbBtpS0sblHJdetIk+FjdQwKlFgVUn9twQwEJ6H
         S5uA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790922582; x=1791527382;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/3uKP316TAfLOs8D6w2CQrvf9oUDjp4A6r7z6eIgLW4=;
        b=C8P0gSUKTbxuGflZwMLzuKrMfvZ1zDIxPLq01nL5UQxqkWhU76974c+ZZdKqHvmgO5
         lyZowrtI4ocnafQe7nzM3ykHFO96yMJfNjDVUyFWDHbp7an5lEjJT+0bzyunocbqWnpo
         0xl0mYJ9tAY9QavfYdiCy4aSh7+M+r330QXF86sGRY/fO2sV15YG+7IugwHrgjiTTJAg
         g7TTUNImqoJIk5QA93Njqtx+5MaBUTFkvaQvKk1gKujQ5HxixgtMyw8bYO553e7JER/p
         H/nR5zyqriwDmBZvr9/+6xdHAtGsYAOiXl0f/Nt3tpwbFteZ9DKC1ZT5r98D4EhYmxzs
         vqLg==
X-Forwarded-Encrypted: i=1; AKwUvBxPhXtijNsNNDCZfQYnbEZFWXIfi5xl5Lz0GbocOKzOFFtjOw5KqYgh6D3W+xZ0eDD8vEnBEgY9fuI/x96/9e0u@lists.infradead.org
X-Gm-Message-State: AFuF++lHfLD84fBAgTZV5zC22x9+VrFcy7oAr9ea1y6OG6Exsj9J1bfi
	rkz8G8xwFcHfQwS3RzlUxf8QtkryueC7bP1npAn7DEE0DnBF0R3ZYbV7s+i9Mw==
X-Gm-Gg: AYBFou01Cuz+XBGQXcp4XgUYWVfs5bH26tKG1MvT+Mj7BaSgRE4faX2wcj47YwSsGn/
	Tf6NW/t5DVIO5mYvqoF1eCsFkXi10ul1IVX/EKLkG2DUKGvKbpefNBBBA+plc5ltc7utMMMeBdJ
	bJHWTfEtt7bMJehiOOAkxeD/2/oRpS9s24RTfMoBZY4IatgYt5E6rqCFyYY1nSFXfUB4hHEnhNP
	KceXXeHS+y6TKWsuyPY9OWm+gxc4Fd43PbQHKDDBMgPysMEq+z1dL1raM7iuzIaMtXqEM+HXZfn
	BoqxiHI+rPm0KPkrc2xq8CDajdzdQ/mIOqd/GN/iP5cBIDVj25OA7zs/4r6uli05JL4dFU9aWgE
	QZ7wb9eEDsnMUdtsnph9De9k9zOt34Q0fL+dhmqYm5jtUOYgiLeveuRvkgbOt/9Hk+wYuDX1YfZ
	/sim3VH6jJBzckIb4eWdUrct1s2aQvgMH/zA7TPFjeAqgJqNYn2DpdhlHizvh8log8GOGENYCPT
	FwywFAkeazq81KL
X-Received: by 2002:a05:7022:f902:20b0:14b:588b:c80f with SMTP id a92af1059eb24-14f5b026980mr1769046c88.10.1790922581583;
        Thu, 01 Oct 2026 23:29:41 -0700 (PDT)
Received: from debian.prasanth ([103.183.205.240])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-14f45fedd43sm6236636c88.4.2026.10.01.23.29.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Oct 2026 23:29:41 -0700 (PDT)
From: Prasanth Kumar Padarthi <prasanth.padarthi10@gmail.com>
To: devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org
Cc: linux-kernel@vger.kernel.org,
	openbmc@lists.ozlabs.org,
	joel@jms.id.au,
	andrew@codeconstruct.com.au,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	Prasanth Kumar Padarthi <prasanth.padarthi10@gmail.com>
Subject: [PATCH v8 0/2] ARM: dts: aspeed: Add ASRock Rack B650D4U BMC support
Date: Fri,  2 Oct 2026 11:59:31 +0530
Message-ID: <20261002062933.26497-1-prasanth.padarthi10@gmail.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261001_232943_013138_CDF92988 
X-CRM114-Status: UNSURE (   9.23  )
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

Changes in v8:
- Correct the reported validation configuration.
- Validate the DTB with multi_v7_defconfig,
  CONFIG_ARCH_ASPEED=y, and CONFIG_MACH_ASPEED_G6=y.
- Preserve the reviewed DTS content and review trailers.

Prasanth Kumar Padarthi (2):
  dt-bindings: arm: aspeed: Add ASRock Rack B650D4U
  ARM: dts: aspeed: Add ASRock Rack B650D4U BMC

 .../bindings/arm/aspeed/aspeed.yaml           |   1 +
 arch/arm/boot/dts/aspeed/Makefile             |   1 +
 .../dts/aspeed/aspeed-bmc-asrock-b650d4u.dts  | 135 ++++++++++++++++++
 3 files changed, 137 insertions(+)
 create mode 100644 arch/arm/boot/dts/aspeed/aspeed-bmc-asrock-b650d4u.dts

-- 
2.47.3


