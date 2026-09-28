Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27F25CA5FA3
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Sep 2026 19:17:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4aE+Hss1/Jbe7wEGLMDMGvYVtcJjmEg9Q79wOsQKUHY=; b=EZBLWgkh2YN8e2tEM2Qv1QO3Ji
	cGCBIObsm3aDxoBJgT5GvZZkLeXhILa3a/5nYWnPMoVjPBNfrthU5BhwbNFTGFLLU+nIvzWXsBjb/
	fWIxZCqDXDWODOtuFq9D8TrABB+8s42dY+KQD2/3zlJMhXXfPq6pUB/aVZvg2rwLkLRL4apbEO5yN
	3sGbhGG/whBP0ahcy/noflzZC8uP67AXUR0jp4d6z/uD71mT5/wSEblgxaiNGJOV/avrT+9aj6hB2
	nl6pLlSmdICJfNnGW2twIvrYVIWRI/p9onr/5dGC+WLmDbyAn63/akOQzIaGmXM4mH+Xw0e8Kx7p0
	vJr/0YOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBGrE-00000001Pfm-1IJS;
	Mon, 28 Sep 2026 19:17:48 +0000
Received: from out-248.mta0.migadu.com ([2001:41d0:1004:224b::f8] helo=mta0.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBGrB-00000001PfO-018u
	for linux-arm-kernel@lists.infradead.org;
	Mon, 28 Sep 2026 19:17:46 +0000
X-Envelope-To: linux-arm-kernel@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=4aE+Hss1/Jbe7wEGLMDMGvYVtcJjmEg9Q79wOsQKUHY=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1790623062; v=1; x=1791227862;
 b=g13UdM3bOFbKg74HryOu/toca11ir8lv3s2ixQkXbgALbbr6OEOJHlbzINr2Wzv14ytFdQc8
 MeZaAW7k622VSoRXfN1HWyS2m7dive0ReKgC71BOmjsPNdWi2520dbs1r6S5r1szmjrvNKZ5uWk
 QISIhrIENTPkbG9HQ4iFeAWA=
X-Envelope-To: linux-arm-kernel@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id 77fedae46d8fa142;
	Mon, 28 Sep 2026 19:17:42 +0000
X-Mizu-Trace-ID: 77fedae46d8fa142
X-Migadu-Flow: FLOW_OUT
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-5b8c42da963so1656e87.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 28 Sep 2026 12:17:38 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvByTrxrLF5TxFB532V67Oj+FMIXpIoxkR5JSiV2/D4YXYC2xMaCXnKWOjCOhRO6Govv3WN+MKaaXyBSYPvwU+NPg@lists.infradead.org
X-Gm-Message-State: AFq9FYJFxJq8RtssVWK3oifQuzVYj7O5E4rFq5FhrI7zFDtrPCFazDGR
	R/Ml28Xq7zDYBE65yqbcl+1u7UhPjSTsChqhI7QlFZWc+iA2oD1TPZLjfitR5aH7+33MlNa+YcA
	EDwR2YsaAXvs9dJ8qIAg4t3oExfHAVlQb6W1vpQ2c
X-Received: by 2002:a05:6512:65db:b0:5b1:5141:9156 with SMTP id
 2adb3069b0e04-5ba2e78e166mr10617e87.9.1790623057450; Mon, 28 Sep 2026
 12:17:37 -0700 (PDT)
MIME-Version: 1.0
References: <20260928064643.3265087-1-fuad.tabba@linux.dev>
 <20260928064643.3265087-2-fuad.tabba@linux.dev> <arqeRSIoEwurSrya@kernel.org>
In-Reply-To: <arqeRSIoEwurSrya@kernel.org>
From: Fuad Tabba <fuad.tabba@linux.dev>
Date: Mon, 28 Sep 2026 20:17:01 +0100
X-Gmail-Original-Message-ID: <CA+EHjTy1rqqBGW_jiBwjdg1b6hphE1KwqvS1i5SDM040d5Cbjg@mail.gmail.com>
X-Gm-Features: AclHuK_rws_wTRAdrWEqO4myn_hhtXgz82YRIViNS-gJjlNQ2cw7YcPYJoEgtSM
Message-ID: <CA+EHjTy1rqqBGW_jiBwjdg1b6hphE1KwqvS1i5SDM040d5Cbjg@mail.gmail.com>
Subject: Re: [PATCH v2 1/4] KVM: arm64: Don't WARN on an unsupported TLBI OS
 from vEL1
To: Oliver Upton <oupton@kernel.org>
Cc: Marc Zyngier <maz@kernel.org>, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, Joey Gouly <joey.gouly@arm.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Zenghui Yu <yuzenghui@huawei.com>, 
	Steffen Eiden <seiden@linux.ibm.com>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	Quentin Perret <qperret@google.com>, Vincent Donnefort <vdonnefort@google.com>, 
	Wei-Lin Chang <weilin.chang@arm.com>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260928_121745_278099_17B3B553 
X-CRM114-Status: GOOD (  10.87  )
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

On Mon, 28 Sep 2026 18:05:09 +0100, Oliver Upton <oupton@kernel.org> wrote:
[...]
> So the FGUs don't actually require any hardware support, they're just a
> representation of our UNDEF emulation that can be applied even on
> non-FGT. That's actually the way we had them wired before the whole
> config.c rewrite.
>
> Can you look into reinstating the FGUs?

Will do. The FGT entries never make it into the xarray without
ARM64_HAS_FGT, so the FGU check in triage_sysreg_trap() has nothing to
match on those CPUs. v3 drops that gate and leaves handle_tlbi_el1()
alone.

AFAICT that skip has been there since the FGT forwarding
infrastructure went in, before the FGUs existed, so I'll write it up
as making the FGUs work on non-FGT hosts.

Cheers,
/fuad

