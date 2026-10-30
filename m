Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B90D606A323
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 30 Oct 2026 14:59:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=ebep/aLC;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ff+bC01N
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=OvUU/lB/oIMvrEYW+eB0/gBkIeV3CTDi81+D5y4HuKE=; b=ebep/aLCSj3Sb1h2W3v1wfKolH
	SUP36pfWMFayY8DrDgSlR3POfPlXyJTFunGekWUuwW78+U13w24LK8EPj49ug0XWRXoxDQWJvxWau
	aCBp/6bIWXQqd0arEvqEdPxP9AIo0r/iVzK5iKMCji54dqnR2xZtOBTFvqrLlD628FF0qRt+EHG+0
	p42DKw5NUC5qEq4HEIw3oJ6/MVNxLxodtS5ktyk4Yq+dDxZU6snT4P4XRUHJOvyH8IUIzB/q3sVFw
	K/apSugb4QxZR/ZBPI95aXCNgNxP32NLCLRuAx+zlz8fLpCcnDzB6jE/SYIzK6I4DoiJ3ILO5zZGn
	n7FNdTBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMo4q-0000000BusU-2Z8m;
	Fri, 30 Oct 2026 14:59:32 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMo4p-0000000Burg-0Bbd
	for linux-arm-kernel@lists.infradead.org;
	Fri, 30 Oct 2026 14:59:31 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id F0C5060619;
	Fri, 30 Oct 2026 14:59:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 619981F0093A;
	Fri, 30 Oct 2026 14:59:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793372369;
	bh=OvUU/lB/oIMvrEYW+eB0/gBkIeV3CTDi81+D5y4HuKE=;
	h=From:To:Cc:Subject:Date;
	b=ff+bC01NKaJDK0mNldE6OkS9O3OiphoGi5RAFxGOqZRndr4cLDv8A7XEwX0Nk6ORb
	 MxKUZMmoVsobUVAMhptf+JZzmj6oUoXf7ilUyhh1OWgj18kPlDo6UPJOYhnxO9jSk1
	 qjVL9AhSxExBNawmxm5QPwKNyplgaA1BeOOxdc/47ey7BKULlQ3IJK6VMxFDVcQQEX
	 YOxGQYKB/WeL5bXvbzHX4rj7MB82tsAit9V0xUGJCks5ByENsGCOkbfg79KAY0IJ7F
	 cMEkMQRhCAx3v86H1Q/TGS4T2XDtil+i2Eun9MFH34m1P8N+y5m1t9WBb3yb+jIE6/
	 T7PhvXrKd7XxA==
From: Joshua Crofts <crofts@kernel.org>
To: Ludovic Desroches <ludovic.desroches@microchip.com>,
	Vinod Koul <vkoul@kernel.org>,
	Frank Li <Frank.Li@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org,
	dmaengine@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org
Subject: [PATCH 0/3] dmaengine: remove redundant pm_runtime_dont_use_autosuspend() calls
Date: Fri, 30 Oct 2026 14:58:58 +0000
Message-ID: <20261030145901.1393-1-crofts@kernel.org>
X-Mailer: git-send-email 2.43.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Since commit d1706f9da9f4 ("PM: runtime: call pm_runtime_dont_use_autosuspend() on reinit()"),
driver core is now responsible for undoing any
pm_runtime_use_autosuspend() calls on driver exit.

Remove the redundant function calls.

Joshua Crofts (3):
  dmaengine: at_xdmac: remove redundant
    pm_runtime_dont_use_autosuspend() calls
  dmaengine: qcom: remove redundant pm_runtime_dont_use_autosuspend()
    calls
  dmaengine: ti: remove redundant pm_runtime_dont_use_autosuspend()
    calls

 drivers/dma/at_xdmac.c     | 2 --
 drivers/dma/qcom/bam_dma.c | 1 -
 drivers/dma/ti/cppi41.c    | 5 +----
 3 files changed, 1 insertion(+), 7 deletions(-)


base-commit: d89e1d186ec9271bf78e62771779e9fc03bf0fc3
-- 
2.47.3


