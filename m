Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1192F417EE
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Mar 2026 15:01:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:To:
	From:Cc:Subject:Message-Id:Date:Content-Type:Content-Transfer-Encoding:
	Mime-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=F3ujtuI8oi0dmg2LEg0gpPv/xj90uC+9iN3YKwWa9UI=; b=WS4XsOLTJuwpz026Prf6F+dVIG
	2mSgsdcw69mjuyAdDc8StlwXeP2GcC1O9hSJ4Yono8snaOKZogSxlAheEkgYpc6ss0x36djCS4kck
	rei47s1I9W3Rk6CLBdy6jEaMzIKE5akovdypKtofrK6KzxH9ZSxqWSIFJ8BViA08HkX49S9TzkIMD
	cZgDEYAdWbns/fbF3BA7FhxbV+dP+FQ2VWMgs5MMlpBoAdKFHFgfOpjyhpzoIcFcIv8mx9x1eGNYi
	YMqmGy1XgjxijkCmcULqoocu6quIQdgNYCegcPcMtvLNQ15OHhtiv+EHMhctF1vFiKPFlsJSfuXSt
	Cdm7ky+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzc6Q-00000007Xv8-35cp;
	Mon, 09 Mar 2026 15:01:02 +0000
Received: from smtpout-04.galae.net ([185.171.202.116])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzc6N-00000007XuD-0K5Y
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Mar 2026 15:01:01 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 67B18C42878;
	Mon,  9 Mar 2026 15:01:15 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id F3B575FFB8;
	Mon,  9 Mar 2026 15:00:54 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 6A5A9103695C1;
	Mon,  9 Mar 2026 16:00:41 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1773068451; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=F3ujtuI8oi0dmg2LEg0gpPv/xj90uC+9iN3YKwWa9UI=;
	b=cjWIjVqrshunpRqRYpQ9ALsqcgVYHgzv6XgOh0jAeqD3ifD67dzTsndCsD29AeYItQ87jV
	tyAKpUxk/xmtT3ZxLdFAQdv/pQt6XIZ5o1wa5cAS0E6XhhztXWvYVNPRJtceOQ7bRea+a/
	j6SbHs+YlZwe73Rak2rVKRAuBhFsnDGpFvr+VJhVdbopdUL7EwNQyHjhEK1+L3LrDlVnb/
	YUmv5kaxKEEcIIEuc0iJQcrMQQyW3wkepFJCwxFxLmYH8hl3SAYSUiAe5/E2OWlf1gZVjP
	i03GdkadEiC+gWnUGebMUH8aM3ss+UR9Iw7tpYl4J6q482OyvypHaiqkU9oW4w==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 09 Mar 2026 16:00:40 +0100
Message-Id: <DGYCB0V4LO08.ZQP15NRFMGKA@bootlin.com>
Subject: Re: [bpf-next v8 0/5] emit ENDBR/BTI instructions for indirect jump
 targets
Cc: "Alexei Starovoitov" <ast@kernel.org>, "Daniel Borkmann"
 <daniel@iogearbox.net>, "Andrii Nakryiko" <andrii@kernel.org>, "Martin
 KaFai Lau" <martin.lau@linux.dev>, "Eduard Zingerman" <eddyz87@gmail.com>,
 "Yonghong Song" <yonghong.song@linux.dev>, "Puranjay Mohan"
 <puranjay@kernel.org>, "Anton Protopopov" <a.s.protopopov@gmail.com>,
 "Shahab Vahedi" <list+bpf@vahedi.org>, "Russell King"
 <linux@armlinux.org.uk>, "Tiezhu Yang" <yangtiezhu@loongson.cn>, "Hengqi
 Chen" <hengqi.chen@gmail.com>, "Johan Almbladh"
 <johan.almbladh@anyfinetworks.com>, "Paul Burton" <paulburton@kernel.org>,
 "Hari Bathini" <hbathini@linux.ibm.com>, "Christophe Leroy"
 <chleroy@kernel.org>, "Naveen N Rao" <naveen@kernel.org>, "Luke Nelson"
 <luke.r.nels@gmail.com>, "Xi Wang" <xi.wang@gmail.com>,
 =?utf-8?q?Bj=C3=B6rn_T=C3=B6pel?= <bjorn@kernel.org>, "Pu Lehui"
 <pulehui@huawei.com>, "Ilya Leoshkevich" <iii@linux.ibm.com>, "Heiko
 Carstens" <hca@linux.ibm.com>, "Vasily Gorbik" <gor@linux.ibm.com>, "David
 S . Miller" <davem@davemloft.net>, "Wang YanQing" <udknight@gmail.com>
From: =?utf-8?q?Alexis_Lothor=C3=A9?= <alexis.lothore@bootlin.com>
To: "Xu Kuohai" <xukuohai@huaweicloud.com>, <bpf@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260309140044.2652538-1-xukuohai@huaweicloud.com>
In-Reply-To: <20260309140044.2652538-1-xukuohai@huaweicloud.com>
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260309_080059_284617_C3CA155D 
X-CRM114-Status: GOOD (  10.82  )
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

Hi Xu,

On Mon Mar 9, 2026 at 3:00 PM CET, Xu Kuohai wrote:
> On architectures with CFI protection enabled that require landing pad
> instructions at indirect jump targets, such as x86 with CET/IBT eanbled
> and arm64 with BTI enabled, kernel panics when an indirect jump lands on
> a target witout landing pad. Therefore, the JIT must emit landing pad
> instructions for indirect jump targets.
>
> The verifier already recognizes which instructions are indirect jump
> targets during the verification phase. So we can stores this information
> in env->insn_aux_data and pass it to the JIT as new parameter, so the JIT
> knows which instructions are indirect jump targets.
>
> During JIT, constants blinding is performed. It rewrites the private copy
> of instructions for the JITed program, but it does not adjust the global
> env->insn_aux_data array. As a result, after constants blinding, the
> instruction indexes used by JIT may no longer match the indexes in
> env->insn_aux_data, so the JIT can not lookup env->insn_aux_data directly=
.
>
> To avoid this mistach, and considering that all existing arch-specific JI=
Ts
> already implement constants blinding with largely duplicated code, move
> constants blinding from JIT to generic code, before copying instructions
> for each subprog.

Could you please add me in CC for any future revision ?

Thanks,

Alexis

--=20
Alexis Lothor=C3=A9, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


