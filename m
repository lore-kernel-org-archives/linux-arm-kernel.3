Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5A19C53209
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Jul 2026 19:28:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TzFyIvdETtvcgqgQWIorf4OEXGTCx8wQba8CPFyKDaM=; b=uBsRTlH4a1XNeNcBtd4hOf1rfU
	4+W7GqEwL9+4i8mxqKsz+/RAuUKNHD7gfoBponVR13eQ8EqqHDMMe/sTROyCwJBpiD2LEfxCSJcYf
	PebVAx84c/ou/YuFlSm76yRCS/cAt3VMIXzETDRzjDplSn7cM380Yv9IHZv7Dmc++m49q5Eb92ZGS
	O4qNPmJ32qcPGoBNyqyz1C+0yVAuJRDtmKsNZrr/5P1CYHHa7+iWCmUTKtFlPeQ38MCMlGtiXBYYr
	KJWw0ePJqH3CrXkeP5DgZ91nhyr/NicNkvpw/dfJjIPmjDNSf0NFdHDloPWK/YVLC/caVjqoOhGeb
	ZehRKlAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woQzl-00000003lK4-3UhO;
	Mon, 27 Jul 2026 19:28:13 +0000
Received: from out-171.mta1.migadu.com ([95.215.58.171])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woQzg-00000003lJd-2BFz
	for linux-arm-kernel@lists.infradead.org;
	Mon, 27 Jul 2026 19:28:12 +0000
X-Gm-Message-State: AOJu0YwzjGhCb9XXAa5IYdQnc1OnBN/CGmB6kGAm26ZduqCLywHVFTPY
	MdhPPPDnBSrN44pbtjR622t7kXWCUgqXlrwSwSF3uL+LS+1pAT0NeS9MD3GDAkvn2FUL/DZUmXz
	Tf9r+ARHCnyXyuM3GTI7RsdbZ+u3WbO7yshFhmAxj
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1785180485;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=TzFyIvdETtvcgqgQWIorf4OEXGTCx8wQba8CPFyKDaM=;
	b=jYicMtF3c4RNt6ZsA1HyLRmaUH7q8s9fXfSMMqTNnvX5JSioJRID+veFXI8p+k+gzN45RZ
	0nG4ouQBrEC4o4BLG6fBE0VUFpQAap1zSaGcDRxYFXNIYdMZUKgt6/N465/ZeMOKuo8fTy
	k7UNTD1//UW6TYQhOvfe14Rm5RBeeKo=
X-Received: by 2002:a05:622a:901c:b0:51c:ae6:a57 with SMTP id
 d75a77b69052e-529a76e10b3mr37835361cf.11.1785180477336; Mon, 27 Jul 2026
 12:27:57 -0700 (PDT)
MIME-Version: 1.0
References: <20260724104819.1296803-1-sascha.bischoff@arm.com> <20260724104819.1296803-39-sascha.bischoff@arm.com>
In-Reply-To: <20260724104819.1296803-39-sascha.bischoff@arm.com>
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Fuad Tabba <fuad.tabba@linux.dev>
Date: Mon, 27 Jul 2026 20:26:00 +0100
X-Gmail-Original-Message-ID: <CA+EHjTxk_OnWEd_2w-w=Ub3ANXdHhqx_ai52cjy0vMo5bGOnfQ@mail.gmail.com>
X-Gm-Features: AUfX_myJCmLEFpem2D6VmQMOVasWlfXcuLnqXXpU_yqxlWvcIJNtla0GtSeFpRo
Message-ID: <CA+EHjTxk_OnWEd_2w-w=Ub3ANXdHhqx_ai52cjy0vMo5bGOnfQ@mail.gmail.com>
Subject: Re: [PATCH v4 38/48] Documentation: KVM: Add docs for KVM_DEV_ARM_VGIC_GRP_IST
To: Sascha Bischoff <Sascha.Bischoff@arm.com>
Cc: "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, 
	"kvmarm@lists.linux.dev" <kvmarm@lists.linux.dev>, "kvm@vger.kernel.org" <kvm@vger.kernel.org>, nd <nd@arm.com>, 
	"maz@kernel.org" <maz@kernel.org>, "oliver.upton@linux.dev" <oliver.upton@linux.dev>, Joey Gouly <Joey.Gouly@arm.com>, 
	Suzuki Poulose <Suzuki.Poulose@arm.com>, "yuzenghui@huawei.com" <yuzenghui@huawei.com>, 
	"peter.maydell@linaro.org" <peter.maydell@linaro.org>, "lpieralisi@kernel.org" <lpieralisi@kernel.org>, 
	Timothy Hayes <Timothy.Hayes@arm.com>
Content-Type: text/plain; charset="UTF-8"
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260727_122810_876061_5A7883C5 
X-CRM114-Status: UNSURE (   8.65  )
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

Hi Sascha,

On Fri, 24 Jul 2026 at 11:59, Sascha Bischoff <Sascha.Bischoff@arm.com> wrote:
...
> +      -ENOENT      A userspace SPI IST buffer was supplied, but there is no SPI
> +                   IST to serialise/unserialise

I do not think -ENOENT can be returned. The branch producing it in
`vgic_v5_get_spi_ist_desc()` needs `!ist->base && userspace_buf`, but
`vgic_v5_validate_ist_attr()` runs first at both call sites and
rejects a zero `spi_ist_addr`, and a VGICv5 VM always has an SPI IST
by the time this attribute is reachable. That leaves the
`userspace_buf` argument without an effect either, so this may be a
code fix rather than a documentation one.

Cheers,
/fuad

