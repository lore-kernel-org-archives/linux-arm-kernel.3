Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E3E7C79FAD
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Sep 2026 08:29:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yA6CuRicjjgsNVONC8XoJBBZSSNo90szOTe69EAFcy4=; b=DrkI3pc3LcWZA11OeM2EK3N2fJ
	bVWyx6jS9wgvZGeH9QWXvW/yKWXB/zbBNGtLmsDrXmaQeRlVk+DjxKeC09ZytGEyyWwu/UGSWRuuq
	RS3y+u26wpAJdtfoFkqpZtPshXei+SEQXK8vkQ5xaSWo08FllLeUDG/ZqrDIDN456HViSdT9jL5UX
	j/Gsr6oypczRCc+GZVwUhgqxxerIScSKHRbIBblenIp9+W8LTIH6zIlm9hARaRL1DvOuVRz2R6BAn
	HmTTij15ER9xqvdIPUNzJQv7c5mMdujx0sHYxHHXpJ7/clIHi888LlBiB6T+1SwoXlsvN6LfoFtW6
	wOnPLF0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4Cs4-0000000B0F2-2WiJ;
	Wed, 09 Sep 2026 07:37:28 +0000
Received: from out-148.mta1.migadu.com ([95.215.58.148] helo=mta1.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4Cs0-0000000B0EP-2Fiv
	for linux-arm-kernel@lists.infradead.org;
	Wed, 09 Sep 2026 07:37:26 +0000
X-Envelope-To: linux-arm-kernel@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=W3MflD4KvxfjlYvuaglkAbbfr+JQGM3DGNPD2OgqTvE=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1788939442; v=1; x=1789544242;
 b=VTvcqYdhVw3BqZqMxgPpKlFNdTMGCqaNX+v3SI1pjhnWlwFt8J2wq8qBXZ0TyU+7oPTcOho5
 yVqKq0Ohrj0WjKq4uE6PTaspkXo6j/KAwQIdKn+CFh005L5Oa84VOwn7wRvvLb6bzTUEhM99GXk
 unnTcI/PF1p+i8dSLrMidkq8=
X-Envelope-To: linux-arm-kernel@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id 9aca0a55722310a2;
	Wed, 09 Sep 2026 07:37:22 +0000
X-Mizu-Trace-ID: 9aca0a55722310a2
X-Migadu-Flow: FLOW_OUT
Received: by mail-lf2-f12.google.com with SMTP id 2adb3069b0e04-5b4a0b384c4so4638e87.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 09 Sep 2026 00:37:17 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBzHXEtujyCDBJsdSm5SuqCjsu4Ibt2spV7tz86cZdh18Tf7Fi26eMKuEpZWMX4lMG0msUnssBsZrb9eeb5hns3M@lists.infradead.org
X-Gm-Message-State: AFuF++lPSdN5sqbOqdPj4xAz1OA2mcekPIe5N+C/kkejdh3bdWgfkTRi
	1VjheXfHxoMr+FdxxKtOtlnWKqbr9ccCworpMQKK/AAfMim07YORjTMukvuH7XM5IKrh0YsORht
	2VXKIBNq7ZB8KAB/8MIKUVvjVIhcAMP/IBYKr2NZq
X-Received: by 2002:a05:6512:288:b0:5b7:78bc:ec07 with SMTP id
 2adb3069b0e04-5b778bcee15mr17247e87.14.1788939437032; Wed, 09 Sep 2026
 00:37:17 -0700 (PDT)
MIME-Version: 1.0
References: <20260909063156.89636-1-kmehltretter@gmail.com>
In-Reply-To: <20260909063156.89636-1-kmehltretter@gmail.com>
From: Fuad Tabba <fuad.tabba@linux.dev>
Date: Wed, 9 Sep 2026 08:36:40 +0100
X-Gmail-Original-Message-ID: <CA+EHjTx3fmj_fkD_ybPANyTrEApMUyBscfP4JtP-F_MRL-L=2w@mail.gmail.com>
X-Gm-Features: AcwNN1X7nBSrvOxVUlaJ6opTCQ7kc3b4t69IqzHQ2RwkJ6z5rM4K_pY4NvS2qiE
Message-ID: <CA+EHjTx3fmj_fkD_ybPANyTrEApMUyBscfP4JtP-F_MRL-L=2w@mail.gmail.com>
Subject: Re: [PATCH] KVM: arm64: Fix kvm_get_vtcr() kernel-doc
To: Karl Mehltretter <kmehltretter@gmail.com>
Cc: Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>, 
	Quentin Perret <qperret@google.com>, Joey Gouly <joey.gouly@arm.com>, 
	Steffen Eiden <seiden@linux.ibm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Zenghui Yu <yuzenghui@huawei.com>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260909_003724_864864_527B7673 
X-CRM114-Status: UNSURE (   9.25  )
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

Hi Karl,

...

Good catch, I'm a fan of documentation fixes :)

While you're on that line, the description is also inaccurate, so you
could fix both in one go and save a follow-up touching the same line:

> - * @phys_shfit:        Value to set in VTCR_EL2.T0SZ.
> + * @phys_shift:        Value to set in VTCR_EL2.T0SZ.

kvm_get_vtcr() sets T0SZ to 64 - phys_shift, so phys_shift isn't the
value written to the field, it's the IPA size in bits. Something like:

     * @phys_shift:    IPA size, in bits.

Cheers,
/fuad

>
> base-commit: 893e11787f78e43b534e252249ac3fff4d1333f8
> --
> 2.53.0

