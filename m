Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7144C54F51
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 29 Jul 2026 11:43:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=c+h8NJ3p4DMHwqN+FWUP3u5Jy7dG3Az5SXXuJ0SBbqw=; b=BrTBn4EtAK1sC9B1f5v/B7bL50
	MkcpBt3dHPVWjtGoAZg2tpCvFgghanMu7JuWWDQuTnn5wTNQNtFm5qc97B7Qovn/YEJjHib8jwpWQ
	F8QK97phWA420SqoG/K5J2yT/Ax1oBhO74xa4G/6GNcyGTH+bHg/qCbZ+bsL7mf+6FRQ7zspGHJ7F
	Q3My5salDWxcq7Oh8RArEZ4x0Dhg7D9Kx+fuUc4ozC4I9iEyN7evGFiePMMSl7gTBEdt0sb+K3BrV
	kk2KhDauavn77O8Qa59Ddpj2vB4gfJom12Vp+I6N6aC6bRHUqRPrykgWZ7Odlcx49kMSJG4GXlMs+
	+U4UdJ+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wp2go-00000007lJL-3xGt;
	Wed, 29 Jul 2026 11:43:10 +0000
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wp2gm-00000007lIN-1StA
	for linux-arm-kernel@lists.infradead.org;
	Wed, 29 Jul 2026 11:43:09 +0000
Received: by mail-pf1-x435.google.com with SMTP id d2e1a72fcca58-84862b0d5aeso918961b3a.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 29 Jul 2026 04:43:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785325387; x=1785930187; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=c+h8NJ3p4DMHwqN+FWUP3u5Jy7dG3Az5SXXuJ0SBbqw=;
        b=mTy8lsXIJBvpE+0ozRDK7PTtcViDgFZrnC7awxBjJGEiz8DCMlOEJJn8wC2qE9D1sC
         MPnXBX3tVxmyR++MAhrIhh1Bk4SrwFmBEHi/Z03He+a2rE4z+HUkR4afVkAGkXlleqUf
         CgDllntkyabYAnuMn2ewr2UAQpyIeNDtPw+WLmJ+1i/1SGF91QwLGTn2ecHqlj0IxFXJ
         dmFnfsCUk3wZSz8MihNJ+h6dnwHpaLl/VpSWvQV8+SDqNfB5rcoljRgMwXcQg2CPK5Cz
         8ZZiM3F67IGi9tPjPvFeI0INjrCFrtKLAte3+ObMP5FGVx+CCThmzG8/1+crhlhG1YS4
         hoTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785325387; x=1785930187;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=c+h8NJ3p4DMHwqN+FWUP3u5Jy7dG3Az5SXXuJ0SBbqw=;
        b=iI6XYvE1utfGnlrecU3lsqb+TgMp9JXpmEZbmC/DA/Zw/I1lrZQcvBuvjIrin/z9Et
         Zu3aoPcqnzh13nhBpuhhZbXKcl9LX2gtMlSXmzX47pyfYcZwZYhhQqlwVHaRr/aCOfoX
         IMVQYQitH9mxMvatqT0/25tlfAY4EC+bfSIxccFU9O5ARkN7XFgPKX5EWKVAe2kS52mO
         my4cOomJ6HqgfQmf4aCzJcPcjGjjqKUWlNvWTjrSGUFePBqYrYU2ehDhUKg3VxBuk7Ca
         pgMxKOHELb0fT95jzK418KgJHx+xjf6Wa3R4Sf1N5/cN0b8SNodv7C4eWf9N+ynJPdCO
         AccQ==
X-Forwarded-Encrypted: i=1; AHgh+Rqlb0Sx+kWhGsl6lIT4vqTatODPKyjrwJYpymk7ajn04NDz/RwZGKL/+R0yAK5Gb87mxT7h62Q/zQkNuaoNQQaP@lists.infradead.org
X-Gm-Message-State: AOJu0YxXup1QNdCuXqv+5P1mQVv07UNn5kAggeKYOmgQnuGscXXPwOJM
	rNWwzqx1gQjNpzxZOk5rWm4S/wSFpEQZM0+PbnuFqIFXFyQP/hUMYxb03yBw8Q==
X-Gm-Gg: AR+sD12ji0weP79E5Ewp9nZvfaogo7beYqxhgXY+/dj9hmbsidg3Zyp1n5IGmSFFp+6
	Akk29So55sbblQqhXRGfiBDjVEYKbul0wdvaS76fAe60QGxH9fAi8dtnlv+LVfeicgwwad8YCZN
	gmuWO3ufutsQXobxQqSfT8tqa1mhAVNo1FbTftpwZFgf8ckHMrpnKqh7yUnoqffGz/7YZtbsGuo
	QA1gFlvfXo9qyhL2KnFR0yI4WQMJQyH8dcJFWXE43MjTM3JhlScn9ECijZWo2+Ht5xt2Iy+Lj8P
	lr4LUIwLLqdb1x76ePOm3czfKnlvKP2tXHd4qN7sQ6vNHOtuvUOl+vCQg7vtiwzVcEYPpPheBR/
	MF5GOigDzRrUdUzM09B8xjjg8G5z1w5nwlahIVR1/X1MmSbruaFK9j3YA7iORW1S+yyJFQmm+xP
	Oc2WPqgHHJJQJAa+92tsd7nRHb60xOTR4FaMdJYLdtO/JWZYS1fI2Sil4yNgeywwERm7rq1OHWa
	etcZWwYtGheJMZhWOkckvHxjnz7N3Qb0w4=
X-Received: by 2002:a05:6a00:10c7:b0:847:83bc:d2a4 with SMTP id d2e1a72fcca58-84e931f6966mr6315709b3a.2.1785325386605;
        Wed, 29 Jul 2026 04:43:06 -0700 (PDT)
Received: from cosmo-ubuntu-2404.. (61-220-246-151.hinet-ip.hinet.net. [61.220.246.151])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84ea03cbd1csm1263532b3a.53.2026.07.29.04.43.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jul 2026 04:43:06 -0700 (PDT)
From: Cosmo Chou <chou.cosmo@gmail.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	joel@jms.id.au,
	andrew@codeconstruct.com.au
Cc: devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	cosmo.chou@quantatw.com,
	Cosmo Chou <chou.cosmo@gmail.com>
Subject: [PATCH v2 0/4] ARM: dts: aspeed: bletchley: Cleanups and second source devices
Date: Wed, 29 Jul 2026 19:43:08 +0800
Message-ID: <20260729114312.3947300-1-chou.cosmo@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260729_044308_408218_894A9D5F 
X-CRM114-Status: UNSURE (   7.96  )
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

This series resolves dt-check-style warnings, sorts I2C nodes,
and adds second-source RTC/LED support for the Bletchley.

Changes in v2:
- Added patch to sort I2C device nodes by address.
- Added patch to fix dt-check-style warnings.
- Carried over second-source RTC and LED controller patches from v1.

Cosmo Chou (4):
  ARM: dts: aspeed: bletchley: Sort i2c device nodes by address
  ARM: dts: aspeed: bletchley: Fix style warnings
  ARM: dts: aspeed: bletchley: Add second source PCA9532 LED controllers
  ARM: dts: aspeed: bletchley: Add second source ISL1208 RTC

 .../aspeed/aspeed-bmc-facebook-bletchley.dts  | 1317 +++++++++++------
 1 file changed, 903 insertions(+), 414 deletions(-)

-- 
2.43.0


