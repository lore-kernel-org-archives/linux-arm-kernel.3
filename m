Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6AA9C9832A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Sep 2026 15:11:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Guq7vvdBrs+2LAbftC06J/zCNpDu/2cevbftm5NnBUc=; b=TXAuwHVK4y71xsQhI4BpIgkch6
	fhZlSUeS58NjJ1mEX2IL0J+1HTRK2LgJpPRAemXFDGx6QOe1QCC2cYEWH5OhIGLm/3P+4oT2+aATH
	INik6iWXB004EkeMjfqjFd1MlYRYZ+ejD2+fGKBu4k8mfoGNsGC2qe8DwKfBm2ABwxViEBwVLzUBU
	57OIq/1RDWzgFvRv6RxNFLM0TJwzS7J8kGmiDMB9aeHKgHALTcmOmE3t21XTC7THe3rMk+NkFdkuY
	RxRj6HN+ZLQ1MfInLO11Z8cqvR5BGaIIt+PC437vsi8vP+1Z9NKDipHueSqfrx9LePc6fvS/TgV3G
	/IB/hagw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBZUN-00000003u6a-1ba1;
	Tue, 29 Sep 2026 15:11:27 +0000
Received: from out-111.mta1.migadu.com ([95.215.58.111] helo=mta1.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBZUK-00000003u6C-31uh
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Sep 2026 15:11:26 +0000
X-Envelope-To: linux-arm-kernel@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=Guq7vvdBrs+2LAbftC06J/zCNpDu/2cevbftm5NnBUc=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1790694682; v=1; x=1791299482;
 b=xZ4Fp5Jx19Vf4EL35G1UoKjFhmiS0lTJtkEjHRF0A+XtrwmYftKheSrramBuJmj2BJOUQhOu
 7nfLMOKkMN87pIqV7K6rOggY6DOOb9JurN4Vv4x8ddBEfz0LNUrNl1UA8kcP9XHU6Rj5OZcJdyM
 UHJXVS8vx7nh2vMFwF7lKSIs=
X-Envelope-To: linux-arm-kernel@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id 4022596fc7548172;
	Tue, 29 Sep 2026 15:11:22 +0000
X-Mizu-Trace-ID: 4022596fc7548172
X-Migadu-Flow: FLOW_OUT
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-5b8c42da963so9800e87.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 29 Sep 2026 08:11:22 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBxgALabxTIVGBFvWVr7manvnqjVi16XVXx9FnreARqEyO/xVA2xTl+3Nhl3hpmXDOX9vCUo18eMLzDmJOxqSWPn@lists.infradead.org
X-Gm-Message-State: AFq9FYIC1htBTtiQlbpsIeX1Jm3U8aW4ofnqXHV6JtEcs453AmsLDdY2
	J1VRWgETjHSnycdIIMGzaLadE89cHnhvcqepAbZ4IuhjRVFEtP8kGpl4FQlfGHH260THDJzP4Ze
	nlnNrbm9V0QyfqfuIE2cqyFWxSGo+tXAmSrI7JySf
X-Received: by 2002:a05:6512:39ca:b0:5b8:eb6b:2a62 with SMTP id
 2adb3069b0e04-5ba2e7e1189mr155370e87.4.1790694681036; Tue, 29 Sep 2026
 08:11:21 -0700 (PDT)
MIME-Version: 1.0
References: <20260929090031.3829185-1-fuad.tabba@linux.dev>
 <20260929090031.3829185-2-fuad.tabba@linux.dev> <lfkiqqw72uqjih442pozc3gsydxwmdj3kacgl7c2572kxzx3sf@vivqilohtwqn>
In-Reply-To: <lfkiqqw72uqjih442pozc3gsydxwmdj3kacgl7c2572kxzx3sf@vivqilohtwqn>
From: Fuad Tabba <fuad.tabba@linux.dev>
Date: Tue, 29 Sep 2026 16:10:44 +0100
X-Gmail-Original-Message-ID: <CA+EHjTwrOhVHQ+Kv2dbimsZknRttscwmr+nfurgyL31hzxVwwg@mail.gmail.com>
X-Gm-Features: AclHuK-bF-Gg2TRO1voI3bbJx08FqrvL74I7XxHF_wOtMWk4sUktlPjaZGhwxI4
Message-ID: <CA+EHjTwrOhVHQ+Kv2dbimsZknRttscwmr+nfurgyL31hzxVwwg@mail.gmail.com>
Subject: Re: [PATCH v3 1/4] KVM: arm64: Apply the fine-grained UNDEFs without FEAT_FGT
To: Wei-Lin Chang <weilin.chang@arm.com>
Cc: Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, Joey Gouly <joey.gouly@arm.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Zenghui Yu <yuzenghui@huawei.com>, 
	Steffen Eiden <seiden@linux.ibm.com>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	Quentin Perret <qperret@google.com>, Vincent Donnefort <vdonnefort@google.com>, 
	Venkata Rao Kakani <venkata.kakani@oss.qualcomm.com>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260929_081124_967550_4020F632 
X-CRM114-Status: GOOD (  12.90  )
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

On Tue, 29 Sept 2026 at 15:54, Wei-Lin Chang <weilin.chang@arm.com> wrote:
[...]
> This reads a bit mechanical to me, can I suggest:
>
> ```
> FGUs don't actually require hardware support, so don't gate fgt trap
> config insertion on FGT. This is the only action required to allow FGUs
> always, as kvm_calculate_traps() already computes the FGU bits with or
> without FEAT_FGT.
>
> This also fixes a spurious WARN when a TLBI OS is run on a guest in vEL1
> without FEAT_TLBIOS on non FEAT_FGT hardware. In this configuration the
> course-grained HCR_EL2.TTLBOS trap reaches the handler handle_tlbi_el1(),
> which expects an EL1 TLBI only from vEL2. With FGUs enabled the UNDEF
> will be injected without needing the specific handler.
> ```

I cannot write commit messages! :) Thanks for the suggestion and the
review. I'll reword if I respin.

Cheers,
/fuad

