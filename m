Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 383C7CA5FD2
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  1 Oct 2026 21:34:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aoQY2n7UuHsEBO2b/7mwS2MVg8AzdCvjCqCqmkccQyQ=; b=bkqDfKnv2eNqmMs7HH114f1NpE
	Liwi8XdtwHwhMr1yvqhvgxVh54+4hndyTaw2v7mOCW87nqNF6LH4mO3BxMPZRRSOlXUiZDFavwU81
	ns4u11DNd0V6PoH3WzDgD6xzlnAPVqnN288zUXved2g0ULF5lDJL9WSD16bkqMflNlbB8oTpL4CLR
	g1JapTRADHd/GjWD5LmoslpyI8ktlShU5EuxGZ0oLKPeh5cT8nPjZObgQkR2kbN1pwZUiTlvV2kPd
	a0L98ivQ506Wb1yoGvyZ8JWpnzVo3CO5gXwQ+w6+YmYFw/oeCvBkn38DI7P+Kfwk6iskdTp7CxULx
	p3/Keomg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCOPi-0000000AHBz-0ftH;
	Thu, 01 Oct 2026 21:34:02 +0000
Received: from mail-oi1-x245.google.com ([2607:f8b0:4864:20::245])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCOPf-0000000AHBF-3Hrl
	for linux-arm-kernel@lists.infradead.org;
	Thu, 01 Oct 2026 21:34:00 +0000
Received: by mail-oi1-x245.google.com with SMTP id 5614622812f47-4db3db8687fso2229461b6e.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 01 Oct 2026 14:33:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790890438; x=1791495238; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=aoQY2n7UuHsEBO2b/7mwS2MVg8AzdCvjCqCqmkccQyQ=;
        b=OOFyX6MmzvO1hXnJbifV/xopI4pezx3DReAPVZqAiGEM40KNA1B37PgE5Ypwvo4h6r
         jTTUGRRLDoN/9q8HUAtaWSLbgbXLLwVR3BQty3ttXd+1tdug9hKzK/nGPI88CkkAIV7l
         IlyExYNv0X6hTbUml7+tLbOy7dibfzv9rO0P20xxNHVr4eEA85rXVjI+maE2x4gUmkqL
         H/h1pqxiAPum5X+4WvPOlIQYX+f8YIb3AAM3VkWdsUjiryDeBd3PM5Q8g9Lf9pOgZLfn
         fRTgPFj30/15nPdYHahDt78XnLNs5USk/JUWNMOGvPPAymxFx98niVmoxT/BnTrw5PAl
         dDng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790890438; x=1791495238;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=aoQY2n7UuHsEBO2b/7mwS2MVg8AzdCvjCqCqmkccQyQ=;
        b=Yz0asH/d3dwzcgrDDyasMYNQ1FskijurIThglUAqiyYmkbv4C3niupeMcomaCeMQxr
         MtPqFGoJUGBi1zZ56+VWDBrxJUfIqtRHI/H6vpNpFLVj7XvEpcLPaxTiy24w/S+uT3gg
         PJoOM4Ag5dv2am1/CJcdes/zo5WoWpWR9ODNH/Kizv44FIBimzsDBkCgs4MpxRoWTzRo
         nFYWn6v/Oa8xJ3eeIbtkpQ0/WOfQs+LrDR82/SqUNKkPP/HxqiWBciY1mbaLfZV5w2bn
         u1zsh0K5HX+f5LpN8xPefUN9k9Jxly5EtmO1YRYyseLDOCj5cETvv+XU6D2+WXdfBjx+
         Igdg==
X-Forwarded-Encrypted: i=1; AKwUvBxtjruwEXl7qKnn4Q+MWog7BkQ+n+nRb408khumufc6sqa0G7TSOsPWr6mgHSysv3l9Ls9Y0GhVoQ7jbgIdq6mm@lists.infradead.org
X-Gm-Message-State: AFuF++k1ZR+Mth9naMYVXi6r7OcUXo7SCPeW+3p5jCQkwWQLOBmQrneS
	u/FyKFBQgzHJQ1afmcZQuGsi1ppbHN7Nk3XemDq6VuizBDNJb0yUKjZj/8ejO4KvRcbs/sBImz2
	NuOSRY05FTvsH2c0CrrIrSE/cIA==
X-Received: from ilbcx6.prod.google.com ([2002:a05:6e02:3c06:b0:50d:b50e:1675])
 (user=coltonlewis job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6808:1211:b0:4b9:a829:f015 with SMTP id 5614622812f47-4f529d297bemr430489b6e.33.1790890437780;
 Thu, 01 Oct 2026 14:33:57 -0700 (PDT)
Date: Thu,  1 Oct 2026 21:33:55 +0000
In-Reply-To: <8e47bb89-a894-4fd0-9f96-e11b5dea1972@linaro.org>
Mime-Version: 1.0
References: <20260924172928.2110956-1-coltonlewis@google.com> <8e47bb89-a894-4fd0-9f96-e11b5dea1972@linaro.org>
X-Mailer: git-send-email 2.56.0.rc1.315.gc6ed9934b7-goog
Message-ID: <20261001213357.2088894-1-coltonlewis@google.com>
Subject: Re: [PATCH v9 00/22] ARM64 PMU Partitioning
From: Colton Lewis <coltonlewis@google.com>
To: James Clark <james.clark@linaro.org>
Cc: Colton Lewis <coltonlewis@google.com>, Marc Zyngier <maz@kernel.org>, 
	Oliver Upton <oupton@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
	Joey Gouly <joey.gouly@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Zenghui Yu <yuzenghui@huawei.com>, Fuad Tabba <fuad.tabba@linux.dev>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, 
	Robin Murphy <robin.murphy@arm.com>, Zide Chen <zide.chen@intel.com>, 
	Alexandru Elisei <alexandru.elisei@arm.com>, 
	Ganapatrao Kulkarni <gankulkarni@os.amperecomputing.com>, Mingwei Zhang <mizhang@google.com>, 
	Jonathan Corbet <corbet@lwn.net>, Russell King <linux@armlinux.org.uk>, Shuah Khan <shuah@kernel.org>, 
	linux-perf-users@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, kvm@vger.kernel.org, 
	kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261001_143359_850162_A7CA8632 
X-CRM114-Status: GOOD (  14.33  )
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

Hi James,

On Wed, Sep 30, 2026 at 04:25:36PM +0100, James Clark wrote:
> Looks good to me, everything seems to be working now:
>
> Tested-by: James Clark <james.clark@linaro.org>

Thank you for testing and for all the reviews!

> There are still a few Sashiko comments though, and one critical one about
> racing with pseudo-NMI PMU interrupts that looked reasonable. I tried to
> test it and reproduce an actual issue but couldn't, so maybe it's bogus.

The "Critical" Sashiko comment on Patch 19/22 (claiming that clearing
hardware PMOVSSET_EL0 loses overflow bits because the guest has direct
untrapped access to PMOVSSET_EL0) is a false positive: Patch 09/22 sets
HDFGRTR_EL2_PMOVS and HDFGWTR_EL2_PMOVS (and without FGT, MDCR_EL2.TPM
is set), so guest accesses to PMOVSSET_EL0 and PMOVSCLR_EL0 always trap
to pmu_reg_read() / pmu_reg_write().

The pseudo-NMI race comments on Patch 11/22 and Patch 19/22 are
theoretically possible in a narrow 2-instruction RMW window because
local_irq_save() does not mask GICv3 pseudo-NMIs, which explains why it
wasn't reproducible in practice. In v10 I will make the PMOVSSET_EL0
shadow updates and vcpu->arch.mdcr_el2 assignment atomic, and address
the other valid Sashiko findings.

Thanks,
Colton

