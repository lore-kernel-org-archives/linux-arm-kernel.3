Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4FD8DCA5FA2
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Sep 2026 16:57:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KOoN/OwyAD6Kkfn5/Ly+b7YoPb/S1dy9tYTv7fMSYRA=; b=s92J6u9yHZ5I4nJp3yMDt2fx35
	Xn8Y4WBYur+dns3VkRZOxFDbnR+DiiZ1TBohTnGuoYAcl/eRhE05yiPseqRihXS+PKoCyHY2fIMyD
	0nEB/Sxp0U9CDXGbghaaeXu/m3is0DvL2YutxGR9ZWSW0EmL39m7KxHlEpiJcvHUfmXk+kUKuENOq
	nf2Q+Imncf/dy1BAsGS/PkVqe3BsPM5B/5YDug2fPIliN5l+tarw4FBaS+SQ4o+vklOptbVqW62bx
	xV2FGYaepp4lCW4uIulxyZWvBGMBXT0TPCYL0TzRsqXsKII4Ep72eOXE4McKU12ET3gVCmq7+98YG
	OENhIvYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBEfd-000000015y8-1jaU;
	Mon, 28 Sep 2026 16:57:41 +0000
Received: from out-112.mta0.migadu.com ([2001:41d0:1004:224b::70] helo=mta0.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBEfb-000000015xR-03Hy
	for linux-arm-kernel@lists.infradead.org;
	Mon, 28 Sep 2026 16:57:40 +0000
X-Envelope-To: linux-arm-kernel@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=n/OY102PNQOkr+cQRPgs6kcL1DdXHbQTCuyeQ/Mtw1c=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1790614656; v=1; x=1791219456;
 b=JmkelVyzxQlp4zKW/UijXHNyA3c2XOgcuTyhSE632xxEa9rYX1kK8HWXGLiigmAgRQn9b56W
 mgGusNL06FrOPKKR8ayl8sVP3G6sZ/KDXRs7dRbSXXlSAnEgQkvvrPUsX+KNP/fPaM+btj3mL+S
 +v2GBDoMR7exyqWJ1FkJLP8c=
X-Envelope-To: linux-arm-kernel@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id 2be760f42c216f5c;
	Mon, 28 Sep 2026 16:57:36 +0000
X-Mizu-Trace-ID: 2be760f42c216f5c
X-Migadu-Flow: FLOW_OUT
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-5b8e81e2a0bso172e87.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 28 Sep 2026 09:57:31 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBwl4k7ZW+XJkyQnoThv8GsOXJ+51bg8HVTqGhhtKktTojEm6Lk3eFDWArk1djV1AMvtmvnaFl0nXvHdqSf9MXnK@lists.infradead.org
X-Gm-Message-State: AFq9FYIjO7TtfQODQqfGBoI5SyUbryKqK7WecFG4J/SiIIu8aYG6wlaa
	0qFsPOylNL890O1wW7s9DAV1RvBY7A6tXctVbJacjc/SfWKiLrotT9tilM4n51tMq/MW0xHK2YU
	Od2bS6wUON6uImOvQHtIUCG5OrycYwGbKg5e9FlLF
X-Received: by 2002:a05:6512:10cd:b0:5b8:c95d:529c with SMTP id
 2adb3069b0e04-5b8ef0ddd19mr213006e87.0.1790614651041; Mon, 28 Sep 2026
 09:57:31 -0700 (PDT)
MIME-Version: 1.0
References: <20260901-kvm-arm64-idreg-final-v3-0-a0ffa06fa872@kernel.org>
 <20260901-kvm-arm64-idreg-final-v3-3-a0ffa06fa872@kernel.org> <arp7mig_PrD9Jbc7@gremlin>
In-Reply-To: <arp7mig_PrD9Jbc7@gremlin>
From: Fuad Tabba <fuad.tabba@linux.dev>
Date: Mon, 28 Sep 2026 17:56:54 +0100
X-Gmail-Original-Message-ID: <CA+EHjTxi=BrJYMb5z9QyGd7k_Ty7x5AbMNJinB5i8GT=BD2L_w@mail.gmail.com>
X-Gm-Features: AclHuK_NPvCKoTUsp1F5W2JZ-hpSJQcM6rQqImNAWwVW-ibb3CFddo_4yf4cCdI
Message-ID: <CA+EHjTxi=BrJYMb5z9QyGd7k_Ty7x5AbMNJinB5i8GT=BD2L_w@mail.gmail.com>
Subject: Re: [PATCH v3 3/3] KVM: arm64: selftests: Check ID regs are immutable
 after a failed run
To: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
Cc: Mark Brown <broonie@kernel.org>, Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>, 
	Joey Gouly <joey.gouly@arm.com>, Steffen Eiden <seiden@linux.ibm.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Zenghui Yu <yuzenghui@huawei.com>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Peter Maydell <peter.maydell@linaro.org>, linux-arm-kernel@lists.infradead.org, 
	kvmarm@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260928_095739_259198_4DFFE6DB 
X-CRM114-Status: GOOD (  15.07  )
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

Hi Lorenzo,

On Mon, 28 Sep 2026 15:46:51 +0100, "Lorenzo Stoakes (ARM)"
<ljs@kernel.org> wrote:
> On Tue, Sep 01, 2026 at 07:18:50PM +0100, Mark Brown wrote:
[...]
> > Assisted-by: Antigravity:gemini-3.1-pro
>
> NIT: we changed the rules for the Assisted-by tag, it only needs to be
> 'Assisted-by: LLM' now. Not a huge big deal but FYI :>)
>
> https://docs.kernel.org/process/coding-assistants.html

That tag dates from way back when the format was still
AGENT_NAME:MODEL_VERSION :)

[...]
> > diff --git a/tools/testing/selftests/kvm/arm64/set_id_regs.c b/tools/testing/selftests/kvm/arm64/set_id_regs.c
[...]
> > +static void test_idreg_frozen_after_failed_run(void)
[...]
> > +        /* Creating an in-kernel irqchip would change the ID registers too. */
> > +        if (kvm_supports_vgic_v3()) {
> > +                r = __kvm_create_device(vm, KVM_DEV_TYPE_ARM_VGIC_V3);
> > +                TEST_ASSERT(r < 0 && errno == EBUSY,
> > +                            "vGIC creation after failed first run: r=%d errno=%d",
> > +                            r, errno);
>
> I guess in general it's making sure - where there should now be finalisation on
> reg setting that this is actually enforced?

Yes. The test exercises each of the userspace-facing checks that 2/3
moves to KVM_ARCH_FLAG_ID_REGS_FINAL: set_id_reg(), set_imp_id_reg()
and kvm_vgic_create().

Thanks,
/fuad

