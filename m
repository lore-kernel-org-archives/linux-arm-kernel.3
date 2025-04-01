Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7089AC36014
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  1 Apr 2025 09:02:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:To:
	From:Subject:Cc:Message-Id:Date:Content-Type:Content-Transfer-Encoding:
	Mime-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dy2M2SCqr8kVO1xwWLFlB181Lqx+iKs9WHxMbKw/hXg=; b=1/JmJC/scvpiLGbSR/qFPTeQUb
	L9ksv5GgfapSge49oWvRe4SPhQ/oL2WmsJzc3JRJJPqDaK/eth4qhyTLsmzB5TNdTR2aAn8PXZt2T
	UY5UbOSHnLHcVp8Kroab5P1UeT/VsX0lBgNbYL4eRykFHWVIAGVHeUXveGy5hz04FRTjT+p9BkjPX
	Ozycc2RuapWGP0c8e4CHLYQFHJfbEdSpCuT34/xWKyCOjWRYbWMukFF0WO0i/fXfrKEq0gQD7LaRn
	HLJEyCdA1ZsLpF8H+bvvQh9//D0siyEhd8QQz+MbkzODQVQYer7eVlFhaz30QcIP73weUL/z6T5d/
	ix61xJvg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzXW1-00000002P5R-12Of;
	Tue, 01 Apr 2025 09:02:37 +0000
Received: from fanzine.igalia.com ([178.60.130.6] helo=fanzine2.igalia.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzXSO-00000002OR5-0eln
	for linux-arm-kernel@lists.infradead.org;
	Tue, 01 Apr 2025 08:58:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=In-Reply-To:References:To:From:Subject:Cc:Message-Id:Date:
	Content-Type:Content-Transfer-Encoding:Mime-Version:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=dy2M2SCqr8kVO1xwWLFlB181Lqx+iKs9WHxMbKw/hXg=; b=CqtCbjewvb0QvIn1otMdPUC11+
	ORUSMxI/ei8dB/e1hMtAlFOMgFVDyjE7gbI/t4tWfE/x5V1Tc1vT4l1sye1HQCGy49QxFaW3iRtrp
	BnQj2x5FkO2iDbySAerD2nr8zCJwcW+BhFdNF5qFr/M6j++WhMip8jGN6tiMfKiW0Y9R0cCDK25K/
	9UHLshkLtL2IzM9MkRUcmBiUISAdyRrMar215Ahhv7jq99b7AjN9Ipkv+kQTjkRhblL3nD1EmwWqi
	3vID+XegX8exG6CWX2gubV5J8l9kRDOv8QMsI44qTrCNQx0KrztAkpQCfzO0SvQ9DZPwcHq1HfTP0
	kqk8yEdw==;
Received: from i59f7adb8.versanet.de ([89.247.173.184] helo=localhost)
	by fanzine2.igalia.com with esmtpsa 
	(Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
	id 1tzXSL-009a4x-Rr; Tue, 01 Apr 2025 10:58:49 +0200
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 01 Apr 2025 10:58:48 +0200
Message-Id: <D8V6FN8TF5IK.DV6F5X5L61V@igalia.com>
Cc: <catalin.marinas@arm.com>, <will@kernel.org>,
 <linux-kernel@vger.kernel.org>, <kernel-dev@igalia.com>
Subject: Re: [PATCH] arm64: Don't call NULL in do_compat_alignment_fixup
From: "Angelos Oikonomopoulos" <angelos@igalia.com>
To: "Anshuman Khandual" <anshuman.khandual@arm.com>,
 <linux-arm-kernel@lists.infradead.org>
X-Mailer: aerc 0.20.1
References: <20250331085415.122409-1-angelos@igalia.com>
 <17de4426-8263-4ccb-8420-f6913d478ae9@arm.com>
 <D8V3VKNJJI1Z.27C32MUQ1OLYF@igalia.com>
 <c1dc28a9-7a36-4303-a8eb-0e227d866c37@arm.com>
 <D8V5E7FT19GH.3EUO3I50GYF8J@igalia.com>
 <c5d835bc-883d-449f-afd3-16a09e418e1b@arm.com>
In-Reply-To: <c5d835bc-883d-449f-afd3-16a09e418e1b@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250401_015852_209326_1BC308E5 
X-CRM114-Status: UNSURE (   6.45  )
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

On Tue Apr 1, 2025 at 10:22 AM CEST, Anshuman Khandual wrote:
> Makes sense. A small nit - just wondering if the following restructuring
> here would make things bit more readable ? Regardless, your decision.
>
> 	if (handler)
>         	type =3D handler(addr, instr, regs);
>         else
>                 return 1;

I went with the original formulation since -- to my mind at least -- an
"early exit" idiom feels more appropriate for something we found we
can't handle. Could work either way though.

Thanks,
Angelos


