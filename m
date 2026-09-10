Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53C94C88E40
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Sep 2026 06:35:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wrGQmgTiJm55JhKTBWHPGvE5gvx0Uq3tjEPdNSRkMAU=; b=yh1VGCVLZcPoXxKKiYZrKUdRMu
	LYdrYFigu5hA/h3GKolmx1MTV+OtOkPueQGfiqsdgcMpsNZQoluV5O587pZNCNV/jGBVnkShgLqbT
	+RhytFcWAAjalnHgjAl/pKQjn+Q6CB2KtJlFvIEKXvks7iTgzZE89LUEbxLinYRR+OzcUxl8W1TKC
	ITzFGgdsasongqy7ug6ydwE868GibtNH9jD6Jp1r7d5APB45GMI2emhrYg0T7zffWc80G6+rcMakV
	lXXoEUP6NfUyThPWLZRphyuw0bvQ6cJUxl0ZyzW+Lzl/PBG4gfKw6WBI+6WvhEdsAATVmLUqsGtkc
	TI1ovVBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4YNF-0000000DWor-3fHf;
	Thu, 10 Sep 2026 06:35:05 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4YNE-0000000DWnB-1mLQ
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 10 Sep 2026 06:35:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=wrGQmgTiJm55JhKTBWHPGvE5gvx0Uq3tjEPdNSRkMAU=; b=exzVmtxkxt1D6L+WOb0o4WhMPH
	V7SHcc+oBZMQIlMaG9Psum/lEz1ls1DLH991vT2/AI4l106r+nOoHGFm2/OiZUK6ltreIzkLGrZ2z
	wyyxyfUao261JMZB+2nOZfwoQuO1Jc/YuGF7eOtwxdWTQS+AhmQjZjNTuNrwiVD/Y/3MJ9g6KtGOb
	TBLqyfTYYQZigCT5l/cEl08Ieffc/zPRMraOFF1a2RefDBSjFRzBrwGgyhRUnsfqeOo7uZadmdM38
	1FFcN1Fx0LUbrG2EA1sHIl1+qS7v7adOV0AtX2ZmIzpwfNuxBn/1ufYHBM/Cnjl1zQGmkd4JGuYG3
	GSSQRDKA==;
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x4YNB-000000025CY-2Fbt
	for linux-arm-kernel@lists.infradead.org;
	Thu, 10 Sep 2026 06:35:03 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-49b0d8bc2aaso81756825e9.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 09 Sep 2026 23:35:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789022099; x=1789626899; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wrGQmgTiJm55JhKTBWHPGvE5gvx0Uq3tjEPdNSRkMAU=;
        b=DsJNcFQjfdMNfzWP5Vk3EM9lp4s20NL7pkCgCsE6bOqAOMIZ+OVYVmfymcO6+9c3rB
         O1Jx22V19STctmL0aqRckwQTdTGRWhZwpvE3WL2/2HD/rTpKBC6mJNvmORaq2hUSVeGi
         +pR9TSgXUWtWfwKU20qidBav+RudnDykl7FPwFhR31ybaW4oqmdktocatKebHml+8cXe
         /fQU2MY/TnP4C56G2PnxNVoTr1IlFDaPmbmVXYSwsCw40XgPh62PckloYNC5Qo//FmI4
         PTFxMesNDFx5oKFjvtMWSnkRvxo8ghtpkl8FXmKveq7+zvIu4oWK5Z2h9b8seD0CSdVL
         Lmtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789022099; x=1789626899;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=wrGQmgTiJm55JhKTBWHPGvE5gvx0Uq3tjEPdNSRkMAU=;
        b=KwgJ9oDHn+m0ZF0Y9FkH4lDvbxjsIbyUlIqmxv3qmfLeli+KZx9R8FaRIrz/Uj7qO+
         49QtAykmA6A8uQIw5svnmKmSi9LRtk+hNeNqLl7Wt+vwgldCtO+EfOtvG/meB+/nX/Ot
         duBwoHamuflDY/4Kutk79HNKROvpimnftEQUm2sZDJ3QK3I0SpOVmYV+KvsBBzHt43ZZ
         N94N2WlhQ3ondXui7uRYnx2+gDZDfq3g5B9Vrut4CFdBAyHQZPPCy2bM23G0iXILuRI+
         TIPojKl41lnavbWttbFGcbeovwL6c1g/AjwId8IJeDzlrWTIoOUtIN3CZkf6yEpvlw69
         IUNw==
X-Gm-Message-State: AFuF++l4ruHg6LsxXphIwr3AYmgkHuHM3cokmFq+EAbjNPRBcuVNIWLd
	iRSVaWGYE2VhqSFf6ZhkqNg7lHhh2g78fT+ZzkF+O5196MXn/urfF9k8
X-Gm-Gg: AYBFou3J0tWb+zwEqzoBVHNBMOvPYy5d9lTPMdgrbPcqLK8OvubSRrAo06TLdjGrv3O
	/aFbdcErfXfNIdTliEn8W/wU1wA2FvocTaHmXZ/hL8aTdXoS+neWVGqqRW92ahtiOnhTir3+1UK
	qcw9MZ79CWyY30wqjmRQbu2JgdGtAlRK3Jj0DurTgmCeIM8CESlxh0FqZjFtARZfcs2XbDd4yOX
	XD5BkBIKWOprW7TOquRkbAGtVMxi2Vg67tnCXHrBQCSrAwidNGfVdo9bpJpShKhllscuk9UPc1K
	7rcssVZwyau0gCxRnZVSUrBCQ4JRMEi0GWxWAYw/SkuT+/NNAoWzkKiOUaTsnQJgfOgj+jQ/eji
	ybaSYozzKaj8MsHPV305ofCtBC4sbl6ooP67aRn1U+5dKgF8HFcAG/4WH1c9rY6DbwVvCQYAsgE
	Dp8c5UGNNNYu7P8q0FCLm6ZU106j5ANyohQldYJx1/zoT8VK42DnAv1f5kstRuVmTI5MdRAJNzU
	NtCIbGmmprT/MljwopCWchiDdKVbpgJMryLGvJSP/Q=
X-Received: by 2002:a05:600c:5254:b0:49d:5ff:f404 with SMTP id 5b1f17b1804b1-49d05fff5abmr273112235e9.1.1789022099342;
        Wed, 09 Sep 2026 23:34:59 -0700 (PDT)
Received: from localhost.localdomain (mob-31-26-103-238.net.vodafone.it. [31.26.103.238])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-49e2212193esm2595255e9.1.2026.09.09.23.34.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 23:34:58 -0700 (PDT)
From: Oleg Keri <okerixx@gmail.com>
To: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Sumit Gupta <sumitg@nvidia.com>,
	Prasanna Kumar T S M <ptsm@linux.microsoft.com>,
	Beata Michalska <beata.michalska@arm.com>,
	Russell King <linux@armlinux.org.uk>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Sudeep Holla <sudeep.holla@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>,
	Viresh Kumar <viresh.kumar@linaro.org>
Cc: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	driver-core@lists.linux.dev,
	linux-pm@vger.kernel.org,
	jonathan.cameron@oss.qualcomm.com,
	sibi.sankar@oss.qualcomm.com
Subject: [PATCH v3 1/2] arm64: topology: fix arch_freq_get_on_cpu() overflow above 4.19 GHz
Date: Thu, 10 Sep 2026 08:34:39 +0200
Message-ID: <20260910063440.4677-2-okerixx@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260910063440.4677-1-okerixx@gmail.com>
References: <20260910063440.4677-1-okerixx@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260910_073501_746192_C90DC532 
X-CRM114-Status: GOOD (  14.03  )
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

arch_freq_get_on_cpu() computes the product of the frequency scale and
the reference frequency as a u64, but assigns it to an unsigned int
before shifting it back down:

	freq = scale * arch_scale_freq_ref(cpu);
	freq >>= SCHED_CAPACITY_SHIFT;

The product is truncated to 32 bits before the shift, so the result
wraps once arch_scale_freq_ref() exceeds 2^32 / SCHED_CAPACITY_SCALE,
i.e. 4194304 kHz.

On a Snapdragon X2 Elite (Glymur) laptop, whose boost OPP is 4723200
kHz, cpuinfo_avg_freq reports 524283 kHz instead of ~4723200 kHz while
the CPU demonstrably runs at the boost frequency: a fixed workload
completes in 1.72 s at the 4723200 kHz OPP versus 2.01 s at 4032000
kHz, matching the 1.171 frequency ratio.

Keep the arithmetic in 64 bits until after the shift.

Fixes: 16d1e27475f6 ("arm64: Provide an AMU-based version of arch_freq_get_on_cpu")
Signed-off-by: Oleg Keri <okerixx@gmail.com>
---
 arch/arm64/kernel/topology.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/arch/arm64/kernel/topology.c b/arch/arm64/kernel/topology.c
index d28438f8b83f..0eca321ff113 100644
--- a/arch/arm64/kernel/topology.c
+++ b/arch/arm64/kernel/topology.c
@@ -245,8 +245,7 @@ int arch_freq_get_on_cpu(int cpu)
 	 * (see amu_scale_freq_tick for details)
 	 */
 	scale = arch_scale_freq_capacity(cpu);
-	freq = scale * arch_scale_freq_ref(cpu);
-	freq >>= SCHED_CAPACITY_SHIFT;
+	freq = (scale * arch_scale_freq_ref(cpu)) >> SCHED_CAPACITY_SHIFT;
 	return freq;
 }
 
-- 
2.55.0


