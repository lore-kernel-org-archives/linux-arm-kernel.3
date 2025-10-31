Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68251CCF9FA
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 31 Oct 2025 11:01:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=MelVgbYmu2c9trVYIc+BMDKKDqiiaRVkA5YIS13CkK8=; b=FmLezp4B1fy2bJdX1EGd/HCm8g
	dlHvOyY82MRJeCE6uqZslclOddEoE4hIzzz0iDwDKTYFEdv/w/z/Gj1w0ZFRgbrMJIx82AGtWywWZ
	Y3Gih5DUYGxRVRhjSU7vdyno7EXAMikw6+EFOgXSEbvvQoPN+JzTtkl6BCTRRjWgKnzBT854nL2dH
	tcwzIR3BCzzS/kipDRtnWCZPYSxtGB/fyaEq/Nb70JaK5ILT5PxjMX/WvNVEKt3dmeSQQGqAW9Arh
	z3gg68zfzmLK4KVHJrFJg06N+lxiaCd6lQ8qrhvj06lvqW5GTaBsJL1LnJ3AwG7CRZqxANqQE9cvx
	/+UCQrqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEmsg-00000005yVg-0iTQ;
	Fri, 31 Oct 2025 11:01:18 +0000
Received: from mail-lf1-x12b.google.com ([2a00:1450:4864:20::12b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEmsd-00000005yUv-2pc3
	for linux-arm-kernel@lists.infradead.org;
	Fri, 31 Oct 2025 11:01:16 +0000
Received: by mail-lf1-x12b.google.com with SMTP id 2adb3069b0e04-57e8e67aa3eso4721804e87.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 31 Oct 2025 04:01:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1761908473; x=1762513273; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=MelVgbYmu2c9trVYIc+BMDKKDqiiaRVkA5YIS13CkK8=;
        b=bLwvoQ9efJ6zGLu+IqWkGe3USm2wb5eVi79iI6Cy3yPhAaaMFYNTEpLCzhBLIAJJ0d
         TlSkLksloT6YMlikrFvtKCDm/Q/SIeOMCO2ANFVNf7emIvXJuH+qup7AV3OWcifksjGe
         4J/JeisPnwLW84rFnev9MoFJnnvVcPkde2n148wL73aMfUINugm5uQT2d86AIKrdIJW3
         1/69kMvIElfUrqP4DPcp9pgDhQe4nYy3OmLiUohlN/2LV4XL3ACj2N/FSLCh3X0pvkNW
         lNIYWuzf9d92m/n3AXRFBXFSPOYb0NPBlR1N5uu37Mm2ZFPzDZ8+/sJJUq1RrtrRBwaL
         eUKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761908473; x=1762513273;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MelVgbYmu2c9trVYIc+BMDKKDqiiaRVkA5YIS13CkK8=;
        b=SFUWMnKCidPsMsWHR7l5gkBJKRD8a2xCMT3/qEuRp9hEwn2YgZ9QdMohQe4zyOf2Cj
         qgJY326yOO5xoSZPaSb5YhvVTHqwKCQ9YvGVIQ/OdNvT6Vlw9BISRrCs4M4Fc8EVV9B3
         boJDqRUZrom/8z3YlUSX53v8ge92i/OIGeemtlZD2Op0H7DtBewyQUtpPWQOJVONb3aS
         XrarYsnBz9XUTlPVSA7EQyxmGuNqFw+3h4OwF1JYQZMfgsEcF1vs+Gahflec302w9Co6
         gB+NoefnCTF8ViWLHbH7l0I+RKpADGYdMiveRtGIuzQM3dWaGT4c2m4TkrRDouyIKxOm
         J2zw==
X-Forwarded-Encrypted: i=1; AJvYcCXn8ovdbuYOhQnpggHbrCNqHJiViOL3vWaWVaxf42j59aPqnqfd1bJDzJSPhas3pFyCqVA2MXK/0iVRItH6I/t1@lists.infradead.org
X-Gm-Message-State: AOJu0Yz8XJy4WNzJAjfjWnfwSR6H6OryLKCrhPmSGYF3vwzywu74VU2N
	IIrxcKU+xIVbv4huQBbu9NRBoZrwgdM0VD6KDgY/G3OWGlQdu/vgeDFC32wfE079XDo=
X-Gm-Gg: ASbGncv2fHWuI+LFnFRkqI+wu0ok9tQsnYwsb14QQHCtjqTyCMmjqP1/F7MUr/I8lnK
	5bzxYmstrHOnrQUK/GoZyEqXaEUP0aBQ1yNIiWPACy8MiQM4bYvNFmmLkuM5e44Z1M+RgAUG9Qv
	yfP0+1SaUFK2EHtkEFJLdGLSoyJemhD8EFf9njT2z0lWcdF1EANL9jzSlW2TcSosm7sTDHN2OBY
	0Gbv1vPeApLgBX8N/TH9zmQtXnj27bRRU2/dECbiwk8A/nJe32tzUi++NCcR3qcXr9limjir2PR
	AR8PTJ3fZYzUowRVBbXHXFoInERc/oU90Tb7ob1XBAgQDrgYFbRgFCAD87MsodidxBKM8eh/XnP
	DHIvrhRFiXrUQntjwGN+CZtcx7dI7bvXRptGSh85XlrU7VEvYpOwARSOhG5qxFvNQW766UUY8sI
	e7u+q1r1ngvyRE0yFE9UuDmKjJVopgEVDbGgvhGmV1r2InSsvfTA==
X-Google-Smtp-Source: AGHT+IHsT/nk3uXbNF1LOs+Zv/A3vY5tGk3m+upNiz408h90WHKfJVouc2BIcKO7ZcdEjqacd3XBlw==
X-Received: by 2002:ac2:4e11:0:b0:594:1a8a:3858 with SMTP id 2adb3069b0e04-5941a8a3a2dmr1796839e87.4.1761908472127;
        Fri, 31 Oct 2025 04:01:12 -0700 (PDT)
Received: from uffe-tuxpro14.. (h-178-174-189-39.A498.priv.bahnhof.se. [178.174.189.39])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5941f5bbaa9sm432721e87.77.2025.10.31.04.01.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Oct 2025 04:01:11 -0700 (PDT)
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
Subject: [PATCH v3 0/2] pmdomain: Improve idle state selection for CPUs
Date: Fri, 31 Oct 2025 12:00:56 +0100
Message-ID: <20251031110106.62394-1-ulf.hansson@linaro.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251031_040115_727089_80F19568 
X-CRM114-Status: GOOD (  11.18  )
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
 kernel/smp.c                | 24 ++++++++++++++++++++++++
 3 files changed, 42 insertions(+), 7 deletions(-)

-- 
2.43.0


