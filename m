Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88B9FC79FB6
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Sep 2026 19:24:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZYBzWSPZN1Lxcn6Xbnnk/C2mw1GBteCvVQmx0ay5t+A=; b=C6hW+Iwp6ph5OVvNrOSCV2BRN2
	Yb05q+HXYpZWR4zOwVVkAjt0xGsAnk9YD3v0ndT/DxOb2HrmjTIwY1niEeYgq7DhYwBxLCPObtNaA
	7YjdNEJRhzTRusV4uNHsoD4ZBQ+XKO6NkeZEg4dk3xRXisyqaXmDbfoCP659f1JqeK/aw4aHKnyZF
	Oj4zPAcq19aFUj/57lDTcazhPK/Stktq98c1dPCWUjawjolBYe+IiuUVL3AOqWSIb3oCzJf0J7Wxy
	Tx53FrhvNh7dwrNJ5iJbBb2qo3SyKg/vZk89unqpOmbFKs4SXGc2AbTEdI9hifYS1WEjcBEQBhlFd
	4xjrhi2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4Nu2-0000000ChPM-1Udl;
	Wed, 09 Sep 2026 19:24:14 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4Nu0-0000000ChNP-0Jjd
	for linux-arm-kernel@lists.infradead.org;
	Wed, 09 Sep 2026 19:24:13 +0000
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-49d0b98d6d0so42085465e9.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 09 Sep 2026 12:24:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788981850; x=1789586650; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZYBzWSPZN1Lxcn6Xbnnk/C2mw1GBteCvVQmx0ay5t+A=;
        b=RULvgQS8sYKvGkHQ8dnqFDwKIODYLjxBuSu501g1Oclnf84nxlxW7WPZ+nMofXvqCh
         2VHE2g7E6c5QeSjwZ5tdoUfL/VNF6FqyJzxc/pCrux8P0eDbrMF9iLoOfmsw+dW2/xqm
         cGpljCR43ff64RQ9tY7PDuw1l6zCDHnWM20eIjhB3oa8luJbFZAWyY937Uwf0LspY1p2
         6IZaVLwLhn6+Fhw/tFrhHPPiu6hCyryGqkupxg5hBfNJ7TSkoozGPYTaAVinH0uAPgCH
         ZkiuMCc1NGqzsOye2PBZe8pnX8KcnDec16X/fSCO7LH2YbOURWKk/WDTyBmXLodbNDnw
         N2wQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788981850; x=1789586650;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ZYBzWSPZN1Lxcn6Xbnnk/C2mw1GBteCvVQmx0ay5t+A=;
        b=rYSfl4lO4/1PdSyK93nKeJ5uieE5ms6fW1Z2occOwu0CbCTdwOuUD0Q4UTH5P+CnhI
         XlmnWJc+YgDfwhTjd3ZlTAauElhDuG3gw8V1S7nJymasa56odGfxP/eV5qKZhhc/rqUf
         anuiziKHICLx6mwgu0lJI8adEYMI3lm8ui5UYZtkV+up2KRpJ3ydHmvC1/cjz7wuO8cp
         Q0T+/DtCd8RVipBvnd3nsXC9faZynFcvswdCPpWbW53lIA2SwD1S4wkNQ9iuArLlkdYv
         gcrgYqZtOHUS3eZ45A9mW66ulxCon2nd1ho7lKJcCXgDZASC8j78vOb5s23alGkxunMJ
         QGTQ==
X-Gm-Message-State: AFuF++nxQoyR4vNXfGAzKOPxxiV6j+6aNbjgJIcGj8jQqytedfruRqqP
	U/q9G0iyxGgDGH5tYTVgqaExP1S2iclcHxJl2TApSg/4k9sMDz8T/XzA
X-Gm-Gg: AYBFou07iN4tZZOIrK1JfULuDDXEkbuAf4sW5MT7TErGI1lfbMOCZCS9kBl0ZqIUKJw
	vpNZ5A+6NdpH62iXdFkYDv9tCxz/wF1qjC14vsBiMZNB61NPp1dmgOit/UVZfKDodK7ywAHgCau
	issrnLxEWprj0tS/mkgX9A0FTEiAOmM53IXD83/cYOdXEl/lqMXvMiXkICpgVc1Hz5dR0q3SYMT
	chOesfNWaydMh9qVseyakkcZlV4mmr3TYO8JDt4/p9gqMCtTkAZgVAosV0eJNCp7zWxoDjQrha6
	ZziRNmUrCueN2Taw4nRCzwq7/4RuxbDqvdSlQGb5hFf8dZGe419NPbCd0Pvo0d45nCvIRbut9Fl
	3GUsXhTh2gwSoR/Y+i/jPK6Lhl5FwLz4T15NeV5LdMhTkPqbi5nDPcB3iqumBZPV0N9Hm2eU4ng
	DbjtyfRWL+pgIJlvzqLaHp8kF+v7pQZCOc0EnGx1mHHSSYS9zoVtG3FdjFhusL33FTBrcuosSlE
	g+oPE+jhhyrU3Af6SVK/DVkZ3WbkI2bY9tzU1SYFOY=
X-Received: by 2002:a05:600c:4e8f:b0:49d:4ef:bf70 with SMTP id 5b1f17b1804b1-49d04efc043mr282755995e9.10.1788981849957;
        Wed, 09 Sep 2026 12:24:09 -0700 (PDT)
Received: from localhost.localdomain (mob-31-26-103-238.net.vodafone.it. [31.26.103.238])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-49d26bf9490sm10925625e9.9.2026.09.09.12.24.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 12:24:07 -0700 (PDT)
From: Oleg Keri <okerixx@gmail.com>
To: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Sumit Gupta <sumitg@nvidia.com>,
	Beata Michalska <beata.michalska@arm.com>,
	Prasanna Kumar T S M <ptsm@linux.microsoft.com>,
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
	Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>
Subject: [PATCH v2 1/2] arm64: topology: fix arch_freq_get_on_cpu() overflow above 4.19 GHz
Date: Wed,  9 Sep 2026 21:23:50 +0200
Message-ID: <20260909192351.33910-2-okerixx@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260909192351.33910-1-okerixx@gmail.com>
References: <20260909192351.33910-1-okerixx@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260909_122412_151798_42236AB3 
X-CRM114-Status: GOOD (  14.20  )
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
Suggested-by: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>
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


