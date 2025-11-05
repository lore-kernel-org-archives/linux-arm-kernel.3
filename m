Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4B35CCF9F8
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Nov 2025 09:54:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=vo1T83LxmrpztjRJzJByTAsIReSJO+KD7UPLut/mg+o=; b=rxaAeqTQrME0b0o0DraMhf9LTv
	3pGP9Pjdi2kIz2uEd72vjqnmemBFaYjwiT2/cIVMXcUtpTcR1EHz+PEzNREpYeH13bTfPoZMZ19VT
	SLhQVwB57KajptJ814t0/BaEENZv2qAQCdB0OnO2iEs93jVozp59WRAcn4MgU72iqHfLIRf+mwzzB
	0EnWtt63RtHz0xWwoxVEdDn6RLUW0XqJMsBpf9XN4pJoRzqkmLtnTEwfn52cf/79bEs6oHqBdXLmQ
	/ke0slEDEbe1sh2eEwFKz34gYK6zxJGdd/Hk5sf26vOP6OAQxFYweRgQgzbQpnbu4XTKE/XlPW4mL
	gaMi0FoQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGaDf-0000000DQpm-0i5Y;
	Wed, 05 Nov 2025 09:54:23 +0000
Received: from mail-ed1-x533.google.com ([2a00:1450:4864:20::533])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGaDc-0000000DQop-1mnZ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 05 Nov 2025 09:54:21 +0000
Received: by mail-ed1-x533.google.com with SMTP id 4fb4d7f45d1cf-640f8a7aba2so1771083a12.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 05 Nov 2025 01:54:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1762336458; x=1762941258; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=vo1T83LxmrpztjRJzJByTAsIReSJO+KD7UPLut/mg+o=;
        b=RqKMFTNVAMcHDRwXJNw856hwxw4SCwCL0pklyI+IUX34nI8yQYIAx8MhHesZS7VP+V
         WKvzopbW8bSkQLD2HI6sfPr/BkZv9RAXCdrMLiVEWq9ksB0RzayueVndyBb+hV+seeka
         vGoPOYFkiHYdM+Ytm1o2CfuvpiBW77An5Nr9MBoa15tA+2CqYZipQJeHpbVAjFTALDqo
         LXONAMRy39eM1gczfILqDD/c3hm552GCdm7g7LakznDfVjW42a9IoKvg0NMGRon9w1Yj
         twYqB09azf0EhqiwXz057dPyPyyCKr/J1K2KbWY0FaBe7IFPSx4k/K5BQgrBcNSTvUCU
         wqwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762336458; x=1762941258;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vo1T83LxmrpztjRJzJByTAsIReSJO+KD7UPLut/mg+o=;
        b=tKA6fL89Iye83evU+OtxSaZajQfabAyipeXESrYfyu9hF2rXyjxr9qyuEk2WIeXJ28
         kGJpnSFbA3ayXazWXnHqafebzzy14T7FJWfWMrrN7WTT2P7ndRFtYvlK+PY1KgtypP/D
         bX94SWgmaYlE8weFvWCi9IskHdke2QNJMCdg7tZCElBWLpLZiqgKQBBgQIchtffLoPod
         9NO3vx31qTxR35+TsdFWSwZiZ5wO2CjOdVXDm8kbXJu0yIuKWB6FMRJraQxdMzt6C1yz
         GztCLi0LymLXT+YEBqA0wiXnhgtpQ2fBvCuikuTyNTuV3AJeJSOWLwUbAKf43Ywf9ha5
         6X4g==
X-Forwarded-Encrypted: i=1; AJvYcCVwpfmc/P9tATTgVlzYPkPKLP1XIUrOJd2ZY+rsKj7/oxzJlLzyuKfF3Z05WIf5fi041K+3EvQRSuH843zK398k@lists.infradead.org
X-Gm-Message-State: AOJu0Yx/Dx2SMdwCqmKMqpFTduytWwazCquSvMqCHZG8GREiYBM2+ojM
	U+jvNhfSbEFS7pXcu5SYiXzmN5Wv6ch/hNtXC7cvy/cyxjwyO/i53VfOKJvvOVrM34Y=
X-Gm-Gg: ASbGnct5lrqXY9/UMviKeon/UW4WB4HYuydXzaPqP2TdGGBeRq4/f0et6NmTHb1GjWo
	KNr66Cmp/AUWSXvETuNnzAjvZmumdSPkGKdKJQ00U9EQHUBje9X8pLWOWQuU28lMje0b+CuKIOz
	E/ctvuZinkPPZ+29BkloAMQFvszdC/LHSRQiNlK6YklstnQpFyzRkf1d1dIvUWNgHpq7doIFnEf
	2TsM85I+jfxFJOF12vIQXhiozNRdQ8X/G0Jp6w1AzSlgVFgJUeAhISk5sGcOBp3oGu2kW6Zle9a
	9oystx+s/mjyCmpo3EdsUT+WtRa9RUZKCYHT5Xw6tKtidK3iHdc1DNpCaU6Pc7lqdLrfIY4GYbk
	/Xcp8yPlT8fKBMtEi6wY1muiYfdjFkOMhmoZR+waYNN8eml2IAjcvER3nPhL4iBW3RLc1kCrsEp
	8WhsSRFQ8Tz5JU/v5fCqJlB2XmPUc9
X-Google-Smtp-Source: AGHT+IHToCJ0Tsc7PHqd+smQCkA2ppkm0fPmpSqpXEr36IzGbG2jcO6xOfoqNg0L3C1H8yEX0SGCOQ==
X-Received: by 2002:a17:907:6eab:b0:b72:5e29:5084 with SMTP id a640c23a62f3a-b7265155b74mr242771366b.4.1762336458345;
        Wed, 05 Nov 2025 01:54:18 -0800 (PST)
Received: from uffe-tuxpro14.. ([87.213.113.147])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b723fe37cb9sm442571066b.61.2025.11.05.01.54.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Nov 2025 01:54:17 -0800 (PST)
From: Ulf Hansson <ulf.hansson@linaro.org>
To: "Rafael J . Wysocki" <rafael@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>
Cc: Mark Rutland <mark.rutland@arm.com>,
	Marc Zyngier <maz@kernel.org>,
	Maulik Shah <quic_mkshah@quicinc.com>,
	Sudeep Holla <sudeep.holla@arm.com>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Ben Horgan <ben.horgan@arm.com>,
	linux-pm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Ulf Hansson <ulf.hansson@linaro.org>
Subject: [PATCH v4 0/2] pmdomain: Improve idle state selection for CPUs
Date: Wed,  5 Nov 2025 10:54:06 +0100
Message-ID: <20251105095415.17269-1-ulf.hansson@linaro.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251105_015420_485908_2A00D398 
X-CRM114-Status: GOOD (  11.60  )
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

Platforms using the genpd governor for CPUs are relying on it to find the most
optimal idle state for a group of CPUs. Although, observations tells us that
there are some significant improvement that can be made around this.

These improvement are based upon allowing us to take pending IPIs into account
for the group of CPUs that the genpd governor is in control of. If there is
pending IPI for any of these CPUs, we should not request an idle state that
affects the group, but rather pick a shallower state that affects only the CPU.

More details are available in the commit messages for each patch.

Kind regards
Ulf Hansson

Ulf Hansson (2):
  smp: Introduce a helper function to check for pending IPIs
  pmdomain: Extend the genpd governor for CPUs to account for IPIs

 drivers/pmdomain/governor.c | 20 +++++++++++++-------
 include/linux/smp.h         |  5 +++++
 kernel/smp.c                | 22 ++++++++++++++++++++++
 3 files changed, 40 insertions(+), 7 deletions(-)

-- 
2.43.0


