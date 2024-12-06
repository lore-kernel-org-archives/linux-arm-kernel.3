Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2929E77173
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Dec 2024 08:41:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=8VUSVD5d4Al31C/uHXsnAW+QuZilX6JYMkj8nRl9R0w=; b=s4dwSis9HDttSKWmFBeVreHot2
	Dk/e0556oA4++kaa8r1Lwh4TSrALAz+BEzq70Ptu3zUC1cq3MHzCBYnETRM9wSDXXCQJgCpbHsHzm
	5nQ5sLOUqNUI+GG1mH1jzcq95WbXGil7TsSNz7PgHAoCyT5a8G3PTOu+WCE+YwCr6M2k+RI01ITvW
	qeYAJ+3ykhIPmMtaC7V3YoiFl+/ZuH9ug+lnnn7fVlaYIuKHyFDtRUv2a3zo2LiF7mk2HMjuuGYsw
	zEby8PX1Nwl//OX+tsaoBMqbDCyXAfaWIFaaQW5CiSBRoIQvwR61EBzncrWWWHX/rnE/JwUysUBIl
	wZigaVYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tJTu8-00000000xbi-2ds0;
	Fri, 06 Dec 2024 08:41:40 +0000
Received: from mail-lj1-x234.google.com ([2a00:1450:4864:20::234])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tJTt7-00000000xT1-2PLp
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Dec 2024 08:40:38 +0000
Received: by mail-lj1-x234.google.com with SMTP id 38308e7fff4ca-2ff976ab0edso18417291fa.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 06 Dec 2024 00:40:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733474435; x=1734079235; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=8VUSVD5d4Al31C/uHXsnAW+QuZilX6JYMkj8nRl9R0w=;
        b=DxYUrrL+RQhAVtczY1JB5Sc2eBzda5zJ59xAJdgQo8FxX9Hp6u87OMF21g0qqo+YpZ
         SbdnVZ+tFLP41umDmGX9LFdzNy2g9eXTmGVA0r45gYOWYtGX0kkZ+sEMKURag10AIKaq
         Mfypz2CpvCGin1WS1Ek1F0R6qhaWFlQA3ZGqssi1D7BUcxZ/Y2tPY0iyfzic6Xy15W51
         Ao+aYD9Qc6iV/85GNXFiuPoqJ8G7ceRNT9lzcuERVEd5GULqbbqy0gGPFkn3N/JrE4/x
         wPLxEyBw6HZ3EU04Y/HbFnVRuKppO7vvM+FKahoTMEFChd++e3mG7JNTsPfPC7ITQF6f
         odCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733474435; x=1734079235;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8VUSVD5d4Al31C/uHXsnAW+QuZilX6JYMkj8nRl9R0w=;
        b=Vc5fVmw4Zu5KATi/9J+20w6AHaJLE3q2ve24+FtPumHReReLu4s0CwnYA2OBU8BVa6
         WjfAK6mSXon1amfe59wAAHl2iRH20XthrSwAa/QiyKcRO2u+y6kkRzZsSlehEuc+X0Oi
         qrJEweYSSoNQeKV+D/fYkwnLLgthL8XQLIRPPSupIaexDaccooUBzrV9mRUBY56YllVQ
         HTcAbOAdymLx8DUmOsLEZRs+E8SSQMarIzZFSsn31xsoGODBGYCwD2ffXllDEFBpjDPv
         ipjE+vJ4SlwMP+OtWEHaj1cJEvyfD89bleSS9UtvTimFd16gzKUHhHH92X0+dUjPMEp+
         9tyg==
X-Forwarded-Encrypted: i=1; AJvYcCUZmRZld84ZT3KOWrSzEvosPYO6Y25sxkJS1pmEtbwVThzQOZ5N40xbhCEoxVqosrCj01nMw6jS1XDBlxQQjRmw@lists.infradead.org
X-Gm-Message-State: AOJu0YyC1gGmUAJcu+oNsR5dI5M/GY8LePfQzLBtS7L03Kx+Moh0u5AK
	zOmQJz+n2xLGvPRgLSY3mi27vB+QalxXYHmjMxZnFF04x8Yrs2TUxtf3ZnTQrpI=
X-Gm-Gg: ASbGnctrHWracfQNEoxQMvpSChdG4gAMBzvt41+0kFJKgLkqBIMkXQfRKgfNRHenwMP
	0gEXZs37VAJLJn7Zf6Glj9vIp9oZq4fU2YebfztGmSTTk7dx8Ggc2FN9BsQUAR+H5LfnxwSzJBL
	54ZlwkioLXbkS+4/Je92kQem4d9iwbddMhocJv18gi0diErCUhGmlP87CnRZGyVMnOqA28SSFCV
	vbybIgQbqo2jiISM4r8uVtBpIQMuOBM1LwAE65MIs444tggWJ7VZrmGL/XykpAmhBJh9fDeK4bJ
	Dy6WeU1fuvodkJaWQlYP0bxr
X-Google-Smtp-Source: AGHT+IFpuj5t7B9JAnco0SLRdwKPzD3iDmQdoSabd9nUYzKXx43l+NudJrIm2FG0ufsZx+78hIKN8g==
X-Received: by 2002:a05:6512:e9c:b0:53e:1fb4:45cd with SMTP id 2adb3069b0e04-53e2c2eb652mr1210445e87.41.1733474435296;
        Fri, 06 Dec 2024 00:40:35 -0800 (PST)
Received: from uffe-tuxpro14.. (h-178-174-189-39.A498.priv.bahnhof.se. [178.174.189.39])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53e229751c2sm440973e87.106.2024.12.06.00.40.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Dec 2024 00:40:33 -0800 (PST)
From: Ulf Hansson <ulf.hansson@linaro.org>
To: Linus <torvalds@linux-foundation.org>,
	linux-pm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Ulf Hansson <ulf.hansson@linaro.org>,
	linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL] pmdomain fixes for v6.13-rc2
Date: Fri,  6 Dec 2024 09:40:31 +0100
Message-ID: <20241206084031.119041-1-ulf.hansson@linaro.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241206_004037_622918_5AB6A393 
X-CRM114-Status: UNSURE (   8.84  )
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

Hi Linus,

Here's a PR with a couple of pmdomain fixes intended for v6.13-rc2. Details
about the highlights are as usual found in the signed tag.

Please pull this in!

Kind regards
Ulf Hansson

The following changes since commit 40384c840ea1944d7c5a392e8975ed088ecf0b37:

  Linux 6.13-rc1 (2024-12-01 14:28:56 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/ulfh/linux-pm.git tags/pmdomain-v6.13-rc1

for you to fetch changes up to 2379fb937de5333991c567eefd7d11b98977d059:

  pmdomain: imx: gpcv2: Adjust delay after power up handshake (2024-12-02 17:09:26 +0100)

----------------------------------------------------------------
pmdomain core:
 - Fix a couple of memory-leaks during genpd init/remove

pmdomain providers:
 - imx: Adjust delay for gpcv2 to fix power up handshake
 - mediatek: Fix DT bindings by adding another nested power-domain layer

----------------------------------------------------------------
Fei Shao (1):
      dt-bindings: power: mediatek: Add another nested power-domain layer

Shengjiu Wang (1):
      pmdomain: imx: gpcv2: Adjust delay after power up handshake

Ulf Hansson (2):
      pmdomain: core: Add missing put_device()
      pmdomain: core: Fix error path in pm_genpd_init() when ida alloc fails

 .../bindings/power/mediatek,power-controller.yaml  |  4 +++
 drivers/pmdomain/core.c                            | 37 ++++++++++++----------
 drivers/pmdomain/imx/gpcv2.c                       |  2 +-
 3 files changed, 25 insertions(+), 18 deletions(-)

