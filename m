Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD561C88E64
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 14 Sep 2026 13:26:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+N3/FMtODxlYu0yzHGvAetRCmi/Ara+QGgp0mXejZKI=; b=PQqznuRp1bCy+eNyvYeDs/TgTt
	oITVa84QuKxDMci4p7KpHSc5bHnnwyCNuAOurqBjmIiL3r2YB7KS5jum5C2yqqc4bWgwTSjM/wnjO
	VtxiBW1o7pNLK8b0yYTVPSjEESVAWHesu1KeEChgaNdfG+jkawRtiJJJ75U9eoN7blS7r4Vq/hu1j
	QUXNX2WZA3wnw7oMZNFPCP9A4enveNAOGsmHw2aS4xw6/htUklXLefeOLL9Nsx0L8LoQZU0G66J+X
	tRSmuDQIPeivJay0562fnlLe+aRhTlzkBY6oavQfnvhWhRoWWYw4jyBCqGPCn86zCMIdXrxixR4AO
	kV3bh2sw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x66h9-00000003kl4-167K;
	Mon, 14 Sep 2026 13:26:03 +0000
Received: from out-27.mta0.migadu.com ([2001:41d0:1004:224b::1b] helo=mta0.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x66h7-00000003kka-0DIG
	for linux-arm-kernel@lists.infradead.org;
	Mon, 14 Sep 2026 13:26:02 +0000
X-Envelope-To: linux-arm-kernel@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=+N3/FMtODxlYu0yzHGvAetRCmi/Ara+QGgp0mXejZKI=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1789392359; v=1; x=1789997159;
 b=bccD4MnZCE/5AO/2kvND7/j3Yoi17LSef0vGUHO3gu+49813eaLwBY8DABiYrwYFczvjQIZy
 zbzOm2BB/UqNTJRpPAE5BCi/GfXspAOVTVUf7hPu1v4iNl/lckoQlSvofJ4Z+6ja4JtPonPwj8W
 Qpqr+0XJ0waN65kOZZhbumZU=
X-Envelope-To: linux-arm-kernel@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id 3c59e032efc2d077;
	Mon, 14 Sep 2026 13:25:59 +0000
X-Mizu-Trace-ID: 3c59e032efc2d077
X-Migadu-Flow: FLOW_OUT
Received: by mail-lf2-f12.google.com with SMTP id 2adb3069b0e04-5b4a0b384c4so7641e87.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 14 Sep 2026 06:25:58 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBwsomttkBwChkaD4mq30KTpb6Nu/Mc68/txB/1xhSHl5TchEOPFa6EqxQMxbaLq6ajn6OEfZQ8ehu7BoiQlGgZ+@lists.infradead.org
X-Gm-Message-State: AFuF++kJRzjXwAQkpBG1dC5UwK7gyN2Jr5Iz0IjhPsxomjSaQ5hfG5Tm
	u5xFjtuKQ240oD+vutb5aLDU68JOZrhhyLLREFAkIX8w3NNQCuEQQ2GVr+krcy+RZPA7hLebFBT
	5TqECvpQibGrJx1HOBn8k0J99M4bswthpxnMXJdSz
X-Received: by 2002:a05:6512:158b:b0:5b6:4ad:d6bb with SMTP id
 2adb3069b0e04-5b8ae4c5899mr62300e87.16.1789392358016; Mon, 14 Sep 2026
 06:25:58 -0700 (PDT)
MIME-Version: 1.0
References: <20260913203108.3343404-1-vdonnefort@google.com>
In-Reply-To: <20260913203108.3343404-1-vdonnefort@google.com>
From: Fuad Tabba <fuad.tabba@linux.dev>
Date: Mon, 14 Sep 2026 14:25:21 +0100
X-Gmail-Original-Message-ID: <CA+EHjTxMq-HePyXDMoJGZGkdnQ6HXtFAe9pjH16e2V9De74oNQ@mail.gmail.com>
X-Gm-Features: AcwNN1UW_r2mHiYhGRo37JOJzCoHDwSb5JGU4WvZjTv5ua45gr-aCFqUp_0FaZI
Message-ID: <CA+EHjTxMq-HePyXDMoJGZGkdnQ6HXtFAe9pjH16e2V9De74oNQ@mail.gmail.com>
Subject: Re: [PATCH v1] KVM: arm64: Advertise MMFR0 TGRAN for pVMs
To: Vincent Donnefort <vdonnefort@google.com>
Cc: maz@kernel.org, oupton@kernel.org, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, joey.gouly@arm.com, 
	seiden@linux.ibm.com, suzuki.poulose@arm.com, yuzenghui@huawei.com, 
	catalin.marinas@arm.com, will@kernel.org, kernel-team@android.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260914_062601_382040_FF00EDC9 
X-CRM114-Status: UNSURE (   9.42  )
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

Hi Vincent,

On Sun, Sep 13, 2026 at 9:31 PM Vincent Donnefort <vdonnefort@google.com> wrote:
>
> Protected VMs can support granules bigger than 4K. Advertise TGRAN16 and
> TGRAN64. TGRAN4 wasn't advertised as it is enabled by default (supported
> when 0). Add it as well for consistence.

nit: consistency

LGTM. However, could you fix the message for TGRAN4 and TGRAN64, and
add a Fixes: tag for 6c30bfb18d0b ("KVM: arm64: Add handlers for
protected VM System Registers")? 0 is IMP for both, so omitting them
advertised them: on the M4, where TGRAN64 reads 0xf, a 64K guest spins
at 100% with a silent console instead of parking. Those two lines are
a fix, not just a consistency change.

Tested under QEMU with protected and non-protected 4K and 16K guests,
and on an M4 with protected 4K, 16K and 64K guests.
Tested-by: Fuad Tabba <tabba@google.com>

With the commit message updated:
Reviewed-by: Fuad Tabba <tabba@google.com>

Cheers,
/fuad

