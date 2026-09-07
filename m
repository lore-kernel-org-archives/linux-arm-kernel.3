Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6DEF0C79F89
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  7 Sep 2026 04:45:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=tEZDkgun1SxnDcq7CXUxTgN3EXXb5PDIeu9LnAI4BVA=; b=cdw5aPXyCA/qVWGTQ8+a/yMy8O
	8hWKzBmrqbVYx4iHZ6py26nyv1eOdhomKng7Lw3D1d1zCLcjLx1Sr3SiJqZYb7bcyXx01zNa//uVA
	eDwWZIVH3qW3+JgV8svU++xzMHgm1ShA3RELzxsXYdWuMkd2nzFmDCaEx0dDYe4OYb4hS7WoQP4SD
	ZVmalE0SAD0RVaB5TlHQbGBGOG21e5lzbF7FVcrrrNBDDmpjiyabsSGfxShJdb5AtwbpeQrvFTfqw
	WWERwThx6gltB6niaE9AI75gKom8eo7yixgZ5pDB1FbRhHbF6R/zVx5xPDHl2Ov4SGlluks/wokSo
	hD5lfy1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3RDq-00000005rpb-1CpD;
	Mon, 07 Sep 2026 04:44:46 +0000
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3RDn-00000005rp7-31j4
	for linux-arm-kernel@lists.infradead.org;
	Mon, 07 Sep 2026 04:44:44 +0000
Received: by mail-pj1-x1031.google.com with SMTP id 98e67ed59e1d1-38d489b6b71so3589219a91.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 06 Sep 2026 21:44:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788756283; x=1789361083; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=tEZDkgun1SxnDcq7CXUxTgN3EXXb5PDIeu9LnAI4BVA=;
        b=frtwO6ZAne21aXbI/JY2gyqaJ17iNPz5B7VQOw+u65ILql0xcNG2KN64yA9TM73WeQ
         IgksyNIIP3MRZmkY2YfmpKj8/PQ4trx3pm3cGirGO/ncmjWFuIDSzgP8L5z/sHqSyikE
         xVmtGYh16wUXeP/bNiGel0PW2s0bCDIwT7wWz92TsTIoljJhztEr+dkHEhPRSyy0kN+L
         L/kEfUsJmhA+SjRzSS8g6NVd5k0l9dNv4SbIEyRcMViyMMFMWqts+MYqMogsqd901GPj
         CHiBnWBF38deI0/FXe1XjWvH1yDV8tm3Kg112Rt2uniSE6nV399GU45yvMxvVxD7Vw13
         1aiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788756283; x=1789361083;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tEZDkgun1SxnDcq7CXUxTgN3EXXb5PDIeu9LnAI4BVA=;
        b=BxQoi1IdLkjt0LWn8tcTcHen3WHUuAQ2hzJioxsPYZmZvOR794NNWASArRS+9QZ7O6
         8ZxC2izWjZutDqiWuskTtrEwSFF/jEPRMmKzoQCJl1tX7+CIS7WmtELKIZhHBOu1reFf
         nGHBifDo0P8/4WHyR7PsXs9++wAmVPc6lWxRGiwVsyT5p2qRUs9ZPEKg3IqiAyXRxQKI
         NxH1zMC2h6dfoPxAjOkFy5DStSrU49dnwH4Kj8z2TnI9pLJ3/NZUwcw7EyHYC/m64CQ/
         TbtxLXtItPdo4Du9l7aPbvqdjB43GXt32f3uYD2/RfJ0lO2padxPk3jMPaxSGumlPB7T
         9Oog==
X-Gm-Message-State: AFuF++lFYCO65eCgFSUq24ZOtnVjd6HQ7czCDG95fP5Cwll4jI3Metp5
	GX4oBgpLrap8SAr5VmF1m2ys/AfRdCeeZn+2b9ljSlTIz1+6rIb20WOx
X-Gm-Gg: AYBFou3Lnf6Z2o2chJsy1ielEg3JCEoV/2f1j1B6PL+mLvRGxGGk5SMIo7Vm2B2lQm8
	lkRPc+SMgXRGMI8qCL/4OSkK9SS1ARFtK+0sk36SlDe/cz0JRZSCI6eP1NX9TGEx2R0BVOX+yfj
	iW2IEDmB3oFXp8x0bDLheBcQQqm6zDnn+xQlQJ0yF3OXAP5VkHQEqJJsOi657DAaUumBshP+rfV
	L0i1yz8JxfIMGzdTqcY7xDqJNYAfdCEd42sIdivt/JxhoVoMQqQf7CfR69hK/9z4WiYNM2VIi+0
	zAOMKzgj7Y+2pkK87arKCZmyigtSSJKYkOcJ4Vil/Nc4rXNqwH0H+ZbHhcWs3owHJvcgpgAQP8d
	jmk9DKbcwY4ovc5e/V5dvJlMrzKHy3Q5LdVhZrv6lkSvnqsQq2yAsLUfvMwLIZ73wao7Vibs9mg
	NViL5/U+HbG9bxddmSkGpSCHE3eBUFLfgdLXQAp3Cl2NvGPngMUCygRwjguEd+mx51ynPjOEJi2
	6I6SdaMR+IIdg==
X-Received: by 2002:a17:90b:2ecd:b0:396:40e6:f631 with SMTP id 98e67ed59e1d1-39b2609f306mr35329992a91.3.1788756282789;
        Sun, 06 Sep 2026 21:44:42 -0700 (PDT)
Received: from volcano9f6e-hostos.amd.com ([165.204.217.251])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3339af25062sm37823751eec.16.2026.09.06.21.44.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Sep 2026 21:44:42 -0700 (PDT)
From: Hemanth Selam <hemanth.selam@gmail.com>
To: Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oupton@kernel.org>,
	Fuad Tabba <fuad.tabba@linux.dev>,
	Joey Gouly <joey.gouly@arm.com>,
	Steffen Eiden <seiden@linux.ibm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Sean Christopherson <seanjc@google.com>,
	Shuah Khan <shuah@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	kvm@vger.kernel.org,
	linux-kselftest@vger.kernel.org
Subject: [PATCH v2 0/3] arm64: fix typos in comments
Date: Mon,  7 Sep 2026 10:14:31 +0530
Message-ID: <20260907044434.4682-1-hemanth.selam@gmail.com>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260906_214443_758223_722F7A80 
X-CRM114-Status: UNSURE (   9.19  )
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

This is v2 of the spelling fixes for this tree.

Changes since v1:
The pauth.c change is corrected: the doubled 'is' is a misspelt 'it is',
so v1 deleted the wrong word.  Spotted by Fuad Tabba.

Only comments change; no code is touched.

 arch/arm64/kvm/hyp/entry.S                           | 2 +-
 arch/arm64/kvm/pauth.c                               | 2 +-
 tools/testing/selftests/kvm/arm64/debug-exceptions.c | 2 +-
 tools/testing/selftests/kvm/arm64/hypercalls.c       | 4 ++--
 4 files changed, 5 insertions(+), 5 deletions(-)


