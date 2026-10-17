Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B12EECCF2C9
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 17 Oct 2026 18:25:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=luYltKYLm6yYl2bIMxE28aT7V3Jm1uOyqRT/NXcaIW8=; b=nfRup98bY3dchz4JeJNZQRPiUc
	ET6kDTnLThVmxMPaIRbIaIG7ngk3q7W+QvhP2DFWPpb1RziJwVxPqN5HsghGcAruiGUgh0se3hxb0
	sTPJoAgJ3vEARkMp2Zf/sF7nNbYUmCPumU6TgyfNXSUyPeqx8kXDRGaZ14YZfPDYlrqCMDbBDhB7H
	uMS8E4OSaiEMSEFpiCup2NxU0v2xz6XiALwAG3HgD3U3GBFuEVQEFUnnO/wJxcNMes6NiFuQUviEm
	qN8dfJltsMibae+4G6jTkEAZrkvHB5Xlr3FiguLxn29WnoXatXwcdxpG6dirZqTRJgaA5hG4WVWJc
	ceBMPXBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xI95s-0000000548w-0dTz;
	Sat, 17 Oct 2026 18:25:20 +0000
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xI95q-0000000548W-0cuW
	for linux-arm-kernel@lists.infradead.org;
	Sat, 17 Oct 2026 18:25:19 +0000
Received: by mail-pf1-x42b.google.com with SMTP id d2e1a72fcca58-85377c8bc96so354177b3a.3
        for <linux-arm-kernel@lists.infradead.org>; Sat, 17 Oct 2026 11:25:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792261517; x=1792866317; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=luYltKYLm6yYl2bIMxE28aT7V3Jm1uOyqRT/NXcaIW8=;
        b=o4r3USli2naNCGhNPjxrPDxeqdpK7uUcAK8oNEY1qY0/qInnAB0iyxPPpEhBv8bUi7
         u09rdLzosQ/vuIR6pLDSYEqSXMpwk2AvkcyULdSXetSMRVXGtzHlqCQ0EQDDnIBa3MUD
         hKfTlyqdsUe6d2PT+1mDCrce20uSKLZ6pCvcJjlLgFCdyOKk/f5IyhB5nliAXG3w255Z
         kC8/1gluK5t7yUU+wENvWaIRBvpJu97SpwZAko7BzdAIy7i2On5+1RATps0VlRhNijQ7
         dFMtth8kR3v7m1Yc0Ma6L77Uxjw9wNrYNq35rflVIwKaORyZurHIQGvjb2U+Dvo6KRjp
         Yrow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792261517; x=1792866317;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=luYltKYLm6yYl2bIMxE28aT7V3Jm1uOyqRT/NXcaIW8=;
        b=UTDbp+UkbnKxaKXe0uad3qIongUDd1/HDjlmWspyC5nU0RVMNjkLsbX2Ngq2pyMWbL
         t9qIhhG4ypvESQaMLHMZEkPwBrLMPNtDrYn3DGMLRuVHzR8A113s2hilNq2kfkrY2nVs
         umRH4YsoHAZTCvPPYsgIQsFFD1lTRNhN+ezIFKQRbguPFFW0XOOGY4uT5aay6bIVdz4Q
         Wy51PLYLf/QjZodpCh66uFLwUa4iRGEKAstk/UivlZlFFTIrQ/fKPFK8dm7yJH38rr73
         txq8Y9quNMROV8xpEAqRp/jVVlIYt/e2FNHTSWLhONoaEo6JHX/iiv+OFlCHrvviTeSW
         awtQ==
X-Forwarded-Encrypted: i=1; AKwUvBz6VvdHgzVdSY6+wLUjikGoUZTz6vsrvMqxRgN0G7qk19fPauBF0BnI+LTsAHuxZw31DG4pXFmNHPW+F1dgABap@lists.infradead.org
X-Gm-Message-State: AFq9FYJ+zYEE3fqgQykOcW/355JP/X34VrV27ARm6CNm/lU6xk8i8g1y
	5fln4BjHzfSk2NqPVGr3tKSgAWlyp1GgJJrlS0mFiCXiI5N2lwOq/w0a
X-Gm-Gg: AYBFou2VmZN0cbHM7PDof21ozwrSONrZgw1iv2cuttfOjmk9+srfZPdJvW2oLPjR43q
	QZp/+b4AL77b5oFM0TyUh8J40cApwTSow016PaDkSyWQWlf+xU2lPmQP0fkQbtk4+zJS1V9NvhW
	Bgjp3mLpYitmjjVX7UIz6vkvjQ+v7Rbt6CHcyAUh64IT6qJA+50ybGJFtxVLGPxqBEX78nFq8B5
	rZC5wLprKcU4YMRe8N4tuOw+El+VLoFHAPglRhRLTkCS7Vzkqpm5pLDqnbVm1a5f0WC4QoVoqww
	cXgzJrfkf42ufVYNNadenb/twWuz1t/r5BH5ZIfvq4eGMUuQwmewOZwFtQsU8G7XAQltDpj4t+N
	/80+/pjeLrNsi2OwJf3iCf39yGcf47YThfNUruPOqqKDjSxTm6fNAcGtQIzxnNd8NU9IGThAFN7
	f37czbopoW2QV0Iw0JNkf8zffGlpfNMfvp5MCiAynzpYrg+5H6br22ZZeYwYW2ycter7NGsGp/i
	CMelTbJVOmpPB+rTOpJNQeyFyUNCFwRobw2s6v7daw2GFQQjjlDbrJUXgGgPGPGH/Ekd73FQrEn
	gw==
X-Received: by 2002:a17:90b:3b91:b0:3ac:bfa7:b079 with SMTP id 98e67ed59e1d1-3acee97ab0amr2910170a91.7.1792261516634;
        Sat, 17 Oct 2026 11:25:16 -0700 (PDT)
Received: from localhost.localdomain ([2001:56a:78dc:9300:8846:761:63e4:6d67])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3acc46ecd32sm9241586a91.3.2026.10.17.11.25.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Oct 2026 11:25:16 -0700 (PDT)
From: Abdalla Eldoumani <aamsdoumani@gmail.com>
To: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Shuah Khan <shuah@kernel.org>
Cc: Mark Brown <broonie@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Abdalla Eldoumani <abdalla.eldoumani@ucalgary.ca>
Subject: [PATCH 0/2] kselftest/arm64: vec-syscfg exit status and VL inheritance coverage
Date: Sat, 17 Oct 2026 12:24:52 -0600
Message-ID: <20261017182455.1884-1-aamsdoumani@gmail.com>
X-Mailer: git-send-email 2.49.0.windows.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261017_112518_219017_2C78CB8F 
X-CRM114-Status: GOOD (  10.62  )
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

From: Abdalla Eldoumani <abdalla.eldoumani@ucalgary.ca>

Two small changes to the vector length configuration test.

The first makes vec-syscfg report failures through its exit status. It
currently always exits 0, so a kernel that fails its checks still shows
as passing in the kselftest runner.

The second implements the "Test PR_SVE_VL_INHERIT after a double fork"
item from the fp TODO list by also checking the VL in a grandchild, two
fork() and exec() generations down.

Tested under QEMU (-cpu max, -cpu max,sme=off and -cpu cortex-a57) on
mainline (58161ead2, after v7.3-rc7). To check that the new test can
fail, it was also run on a kernel modified to clear the inherit flag on
exec(): the existing check passed, the new check failed for SVE and SME,
and vec-syscfg exited 1.

Assisted-by: LLM

Abdalla Eldoumani (2):
  kselftest/arm64: Report test failures in vec-syscfg's exit status
  kselftest/arm64: Check that PR_SVE_VL_INHERIT survives a second exec

 tools/testing/selftests/arm64/fp/TODO         |  1 -
 tools/testing/selftests/arm64/fp/vec-syscfg.c | 64 +++++++++++++++++--
 2 files changed, 60 insertions(+), 5 deletions(-)


base-commit: 58161ead29e50d70a317ea26b472e0c7508e69da
-- 
2.49.0.windows.1


