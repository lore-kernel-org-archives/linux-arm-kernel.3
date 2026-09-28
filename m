Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B849C9832F
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Sep 2026 09:29:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1TuAr+Y/UX0BmiJqB7qrv7NfhasOAVFUkKtCRbqatjA=; b=fryZS5CL/mtAT6NpKV7TOABWeg
	IPFQa+/sSwtWPG9F7Xu10fRHl88Tdy9xDFfX/oHVnahNs1wLSwzzuP8aciveMqSZDoqPLmjuPGbsj
	5MPVYPj8yOgT4JbDsJcuEOcq9L+gxBqlMEkadOxO+7nGd0FP/d1U/KleMuDg2PiNzirkIQ5E5vF+V
	tzuEpxwsLqWBLzui1NcW7mIdy5HwDakZHTri2IbzQpau9V/lLp/Z7KaANbEWW2Er2vDnRXHUXcdvN
	j8sdN1HYUYf19DEEpg+8ZKJLdVIulemRqL0ROOmQscFbhkn9L7B0rJ0y0ahRAF9Get2Hmt4SXRLJa
	8txH5BDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xB7g5-00000000DrX-13qU;
	Mon, 28 Sep 2026 09:29:41 +0000
Received: from out-28.mta1.migadu.com ([2001:41d0:203:375::1c] helo=mta1.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xB7g2-00000000Dqk-0RkY
	for linux-arm-kernel@lists.infradead.org;
	Mon, 28 Sep 2026 09:29:39 +0000
X-Envelope-To: linux-arm-kernel@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=mNyW1L2Kl7XsWs4BhSwMHQIYW+aVztuR3efDX2CQxJ8=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1790587775; v=1; x=1791192575;
 b=TnVqrUpSi10TgM6NHSsahlF/WLf4OgrlPFTkFcwkvMs9H8AglY3SF6xCdX+DVAAihe8ZU/Pm
 /JZgB7Ms8n6intEieiXuk9b2OVobJ3f89yGEGIFs6yzNtjYxD1VywnnxYazNy/DpaUNoSqw79/2
 xX2LvybbUMGMh9QdjgIpYap8=
X-Envelope-To: linux-arm-kernel@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id c23ba52ff7bf5aac;
	Mon, 28 Sep 2026 09:29:35 +0000
X-Mizu-Trace-ID: c23ba52ff7bf5aac
X-Migadu-Flow: FLOW_OUT
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-5b8c42da963so10109e87.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 28 Sep 2026 02:29:31 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBz2NFwoHbor9qYCTfuhc7obj1oPZebaTZxVMoWWmOk9y7qqmPv3PHO/tKqgms5SnJC8QX1s4MZLagKd9iBZ94rz@lists.infradead.org
X-Gm-Message-State: AFq9FYI3uef2+PsSwxvse6JSbD/NnefQnRWT+bM3naMB/aC1EqFBXSKi
	eSuhvb4/Tbwk21FCaIC7WZYgyMZFvVnwJheW9BirDMu110iaLRCPhTRU2ns8QMJqpK8dJSzrNup
	Yl7cshOowANYJx3HLDQPKR3bu8x7XAdLosXlEzWRu
X-Received: by 2002:a05:6512:3d8e:b0:5b8:c8f2:16c4 with SMTP id
 2adb3069b0e04-5b8ef255fa0mr175606e87.10.1790587770867; Mon, 28 Sep 2026
 02:29:30 -0700 (PDT)
MIME-Version: 1.0
References: <20260928064643.3265087-1-fuad.tabba@linux.dev>
 <20260928064643.3265087-5-fuad.tabba@linux.dev> <4095827e-dbbb-4ab9-8610-1bc317aa096f@oss.qualcomm.com>
In-Reply-To: <4095827e-dbbb-4ab9-8610-1bc317aa096f@oss.qualcomm.com>
From: Fuad Tabba <fuad.tabba@linux.dev>
Date: Mon, 28 Sep 2026 10:28:54 +0100
X-Gmail-Original-Message-ID: <CA+EHjTxwffM9vQ0c8MQgsojsXOAUOzo8qD1=aoRK_zGvBF0XgA@mail.gmail.com>
X-Gm-Features: AclHuK9Tx9jSnIhG13zjawNFq0tNHoDD4fS1QJa_ek8GgO61EjctlFamlrJQUSM
Message-ID: <CA+EHjTxwffM9vQ0c8MQgsojsXOAUOzo8qD1=aoRK_zGvBF0XgA@mail.gmail.com>
Subject: Re: [PATCH v2 4/4] KVM: arm64: selftests: Check a feature hidden in
 an ID register is UNDEF
To: Venkata Rao Kakani <venkata.kakani@oss.qualcomm.com>
Cc: Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, Joey Gouly <joey.gouly@arm.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Zenghui Yu <yuzenghui@huawei.com>, 
	Steffen Eiden <seiden@linux.ibm.com>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	Quentin Perret <qperret@google.com>, Vincent Donnefort <vdonnefort@google.com>, 
	Wei-Lin Chang <weilin.chang@arm.com>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260928_022938_285520_E2510896 
X-CRM114-Status: GOOD (  10.38  )
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

Hi Venkata,

On Mon, 28 Sep 2026 at 10:20, Venkata Rao Kakani
<venkata.kakani@oss.qualcomm.com> wrote:
> > +     for (;;) {
> > +             vcpu_run(vcpu);
> > +             switch (get_ucall(vcpu, &uc)) {
> > +             case UCALL_SYNC:
> > +                     got = uc.args[1];
> > +                     break;
> > +             case UCALL_ABORT:
> > +                     REPORT_GUEST_ASSERT(uc);
> > +                     break;
> > +             case UCALL_DONE:
> > +                     kvm_vm_free(vm);
> > +                     return got;
> > +             default:
> > +                     TEST_FAIL("Unknown ucall %lu", uc.cmd);
> > +             }
> > +     }
>      Return missing?

No, the loop never falls through: the breaks only leave the switch,
UCALL_DONE is the one way out and returns there, and the ABORT and
default cases end the test. So control can't reach the end of the
function.

Thanks for having a look,
/fuad

