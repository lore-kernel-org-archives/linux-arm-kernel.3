Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 956F4CA5FA1
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Sep 2026 16:15:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=c06SVugHWJJNDeT83SdkPtIHJEt16Y1SGd4fojskXEI=; b=dB0d0b483THadXrMqNvmW/xzp7
	iNAMjc6kV8g2MpbNTd0ngi0BRp5CBH6gOPWXh4gv+/cX5Q16+CIYtaCB5AkLP2GO1zQYI0UFl5lcH
	KeJIEtqZWU03z85Y4+Xjk8Yz0h49rlbkAJE/J3fvxt7KpAMtRmpVKtsDS3dA/U3i7PNmYTBjnQ4sQ
	gCyiTDndiWGc6ewJRZXu/9P6kRRXLKx2Flm9jkvnJcwO2dmiEvJwlw/Hj9ZwvMcH6lxLUDOnXNN44
	+K601TO1+vzv848UCdCogTAbFWuXwULgfrO+oCyLb33WUhGifotZj2yXphkcCQfveW0QcashmRDBf
	jqpL4URA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBE0w-00000000zJ0-2ZmN;
	Mon, 28 Sep 2026 16:15:38 +0000
Received: from out-162.mta1.migadu.com ([2001:41d0:203:375::a2] helo=mta1.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBE0u-00000000zIW-04P5
	for linux-arm-kernel@lists.infradead.org;
	Mon, 28 Sep 2026 16:15:37 +0000
X-Envelope-To: linux-arm-kernel@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=c06SVugHWJJNDeT83SdkPtIHJEt16Y1SGd4fojskXEI=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1790612134; v=1; x=1791216934;
 b=vKluE1yjdGr+r63jTd2Z5NMfzdedKowkOL8KxBqleTza0glCdut4v4F5iYoDrXrlaIE/4VUb
 VQIdGCiAax8It5F2ChRL9ILVuxjFUtruH7PSD7Sx5yLip2njcAgO/00nviDUw9o7GqB3NDC0Ndc
 m/joe0oB1pXyw6nIq4qYAt68=
X-Envelope-To: linux-arm-kernel@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id b904b37aa096d144;
	Mon, 28 Sep 2026 16:15:34 +0000
X-Mizu-Trace-ID: b904b37aa096d144
X-Migadu-Flow: FLOW_OUT
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-5b8ea0ca5baso11815e87.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 28 Sep 2026 09:15:30 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBzfRloaKwBCcHRIfYAQjCCKK+Jx5+9SoDyfW8NdJw5erLFGLF6y0UERmOBTaqnzn73bCAtuKmbxe+deM0wItxND@lists.infradead.org
X-Gm-Message-State: AFq9FYIv8/vyviAkKQIsijq6qtkvygQsjRc9X3uyBi0CEEsCJxEfl2Q/
	T4a0isUS1Nf9S2RiSXRn4mlR2U4Aa5VGv7H4Jqi/Y8ZSBwPMoIF/eHUi6MTMef83DUuFlXcv7G0
	8kRZsIDhkj1jQ40WeFcsEEVXr5HUojeislvUZ/jiF
X-Received: by 2002:a05:6512:220c:b0:5ae:b726:5f1f with SMTP id
 2adb3069b0e04-5b8ef277c63mr220456e87.8.1790612128596; Mon, 28 Sep 2026
 09:15:28 -0700 (PDT)
MIME-Version: 1.0
References: <20260928152507.2116110-1-fuad.tabba@linux.dev>
 <20260928152507.2116110-2-fuad.tabba@linux.dev> <arqNu0rSxIz4-Mue@kernel.org>
In-Reply-To: <arqNu0rSxIz4-Mue@kernel.org>
From: Fuad Tabba <fuad.tabba@linux.dev>
Date: Mon, 28 Sep 2026 17:14:52 +0100
X-Gmail-Original-Message-ID: <CA+EHjTwiqsvxXV7fm8emQHWW7qYrQ79J4V+5Erot5Df2=YaLXQ@mail.gmail.com>
X-Gm-Features: AclHuK89NS8J3Mx20bby02ytOoblOsUcBV9_SKsrfeTNez43AkDgos1HN6Dw7f0
Message-ID: <CA+EHjTwiqsvxXV7fm8emQHWW7qYrQ79J4V+5Erot5Df2=YaLXQ@mail.gmail.com>
Subject: Re: [PATCH v1 01/10] KVM: arm64: Don't WARN on SMCCC filter reserved
 range allocation failure
To: Oliver Upton <oupton@kernel.org>
Cc: Marc Zyngier <maz@kernel.org>, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, Joey Gouly <joey.gouly@arm.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Zenghui Yu <yuzenghui@huawei.com>, 
	Steffen Eiden <seiden@linux.ibm.com>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	Jing Zhang <jingzhangos@google.com>, Karl Mehltretter <kmehltretter@gmail.com>, kvm@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260928_091536_202159_70EAE88C 
X-CRM114-Status: UNSURE (   8.39  )
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

Hi Oliver,

On Mon, 28 Sep 2026 16:54:35 +0100, Oliver Upton <oupton@kernel.org> wrote:
[...]
> Eh, the warn is still useful. You could potentially add a check for
> -ENOMEM but any other return value is a sign of something wrong in
> KVM.

Ack, I'll keep the WARN and exempt -ENOMEM in v2 (or the new series
this becomes part of).

Cheers,
/fuad

