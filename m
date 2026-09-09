Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D71E7C79FB7
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Sep 2026 19:18:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cQp1h+Nea1dCnGwxCQ5G9ZglVlG59gCPu/u14By/urM=; b=UQQ7KPq3vhGaLFsv9OL36ebYmk
	GIs6EIgiE/17j2Io9gjmjF+RepzmzghKMdURrOn3SInZ9picMO74MM5oVqzHF1sme1tzvjLLSronU
	JYzjg9aUyEa+H68nzrNYcU9TZ1UuNDIF3EOABuS1utq6lU0nilVTnAP0VuHkUHmgDwgI3mTyJyE2t
	KGa/8EEOU73GhDti4hAW/Sx6BV4uCpFBR6lvTrZPwpNm0FcHGYmhAlUQkv3+JGhcsM1BztF7MvFEV
	U11SxaIzkDJosps0pinXRU36a0EpG8k/v/x2iDItkYxI6++3qfP7+p2W+GS87EJats2dYm2HXpKB9
	rohdq2oQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4Nob-0000000CgqJ-08oZ;
	Wed, 09 Sep 2026 19:18:37 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4NoX-0000000CgpU-3r42
	for linux-arm-kernel@lists.infradead.org;
	Wed, 09 Sep 2026 19:18:35 +0000
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-49b392ccaacso90658635e9.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 09 Sep 2026 12:18:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788981512; x=1789586312; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=cQp1h+Nea1dCnGwxCQ5G9ZglVlG59gCPu/u14By/urM=;
        b=FrTMLBDy58cMhDAK87FCi/9uVBa7hKvkqB789yMtIuGV9SrD/ygXo2OFPIrGKsExXa
         QXZ6r5EpBcdW/reE2BaqzadWyZblsEkhpeo9VrY17y6ScrXutJZ3njeyyuSAlmbxBUMn
         zHdRoLE3UXIVfiQ5fgs9qHucqCEPYXHNcvKOZ6BYbq8sqtWvLIuBXggx6um9s1t5I9xQ
         TNode+G6QWfQrgXOSa20bkySbNK1V73BrBW/KOIqiHeLpicd46HraQc5r8vpWoBb385g
         dhHT3dXqpNPNUBuYcMvl9Gi6Sr4ylWiJsWYcK70JAqeKufEgkBrlXiB4WDFWJ0W480WD
         TLeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788981512; x=1789586312;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cQp1h+Nea1dCnGwxCQ5G9ZglVlG59gCPu/u14By/urM=;
        b=AnGZ0ukfhBXqmYZqHOsd5Wpku00B7f+geTlr3DxQdxzHtHTsski64T+PjTibPZ+syC
         MFRYR3NILLN233+ZIMiGRv4HAtP4FXq65S8wA3xPCrS/kLwEOCtI7ZreaseVFRd1zBJB
         2alVS9aPAgDNkJjsvY9tlQjtROiRb69Rhj8QTYx+B/aA+LaxPq2wdjit1i1WXRuN6qoT
         lHFjtua0SHw+zwAjRRpHxhSLQJ4sBHYQXN/02aH2bAzY//cR8NQI/AEH/NDyvJ2PSB6X
         eLrZWlpk+Xe8TtjT2KuGhkzv1pjqlPllghwW3vJ7Fqp1NqaXbovCjK4370b5aYLbzAFT
         sNVw==
X-Gm-Message-State: AFuF++llT+7qm08CoAUUX3kbNa+P8R4d8t691saonBJ8JekgNV3/GLzD
	8f1fkLdsdbtfrkMRk3Zsg/UVI7phvlDpTeZ9ZwkVkOmGE2Zk1AlEfvqz
X-Gm-Gg: AYBFou2JG4HKjKuVOAiv0hH7WCVjp15BthSdwYdWKXsQa+gMHz+MmfoPv12TGmdFoXN
	R0XOiZqcFxZR5mJecLgSQhQcKIWvbZ8TzAeP2aWtNvb6u3Z57/njoP21IVVHDL8PY87aIMO7Ncy
	/Op5J79TxqaOQgKWY9tl3+ZmvdiV0tJrzZAhPvMWdvN5j9sguBeBhhNivyDeYfp0bps+oVurq/k
	d6eWZbZicG1U8nEjsjjfTMaGN4VaBQE4m8jv1W4iGEnhbt/yaIQ7+BL/W5m10ENgA0p+l/RRslA
	Qqsg3dtrZ9UlGDqDJuquT0/uZq+mMUWnvVMqm21CW7lIamjmp+jDL2e0Y7K69WfYpD6Nzvip28w
	Rnsx6YFAkR+wtPwNbRwaCDdOYIAMU2swTFyu/Xz+Uh0cwVQVZMo6vH9Kf2RORSOFDHkjK0fwnIt
	5qvi0/x9I4zUukGUHBJdA8gUY7Cgs+mzep1/woN0mUW+fS/ts9XTZ236UlLGPpsgu14nqvNVXVV
	kir1ZYbzH3IsSvq7uukdK5CXVOPohon0Yo8+XFnSj0=
X-Received: by 2002:a05:600c:628c:b0:49c:e1cd:536 with SMTP id 5b1f17b1804b1-49d17a8745bmr144560705e9.12.1788981511672;
        Wed, 09 Sep 2026 12:18:31 -0700 (PDT)
Received: from localhost.localdomain (mob-31-26-103-238.net.vodafone.it. [31.26.103.238])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-49d20fce7a7sm164538455e9.4.2026.09.09.12.18.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 12:18:29 -0700 (PDT)
From: Oleg Keri <okerixx@gmail.com>
To: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Beata Michalska <beata.michalska@arm.com>,
	Sumit Gupta <sumitg@nvidia.com>,
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
	linux-pm@vger.kernel.org
Subject: Re: [PATCH v1 1/2] arm64: topology: fix arch_freq_get_on_cpu() overflow above 4.19 GHz
Date: Wed,  9 Sep 2026 21:18:16 +0200
Message-ID: <178898149654.33757.7826789084252321894@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260909113625.000063be@oss.qualcomm.com>
References: <20260909113625.000063be@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260909_121833_987481_8F8B241B 
X-CRM114-Status: GOOD (  12.95  )
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

Good point - that reads much better than reusing scale as scratch.  Taken
for v2:

	scale = arch_scale_freq_capacity(cpu);
	freq = (scale * arch_scale_freq_ref(cpu)) >> SCHED_CAPACITY_SHIFT;

Same semantics, and it makes it obvious that both the multiply and the
shift stay in 64 bits and only the final value is narrowed - which is the
whole point of the fix.

Agreed on leaving arch_scale_freq_capacity() out of the expression too.
This file is arm64 only, so unsigned long is 64 bits and it would be safe
here, but it stops being self-evident to the reader and the cast that
would make it evident is worse than keeping the temporary.

Thanks for the review.

