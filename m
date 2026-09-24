Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7537C98312
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Sep 2026 06:09:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XHpWqj04QFUErnLgPhyPwQH0c/whsMd8F/Sj8yIguRU=; b=2QqZhgMeiJ52HqP5ZPjmQyqJg/
	9d7RiR5ZJhiELWq56VnoBlIMAIqgRthV1PIDsIpnPPz/+wbao28Z2sbG/GAXAFqUyr3vpvEjPYT9+
	y29jP8xPpJ6QwJ2ZDUYCW62QAqgtcngonE2JO0Esj9F6TAudr3j3ryd+JEBTe4BMyhv+h+ZghH3zi
	QBwQ7L4JuW6slGYyuaneSQzWipIrknjKyux849AAOJZVDHph2drd5lcEjuhChsbufWuU0eFeU4ltb
	F46NSnGc3dy8QQf0WBfWOXBJZY3TWR6WbQAH9TbUD70sDmQKnmGLggGvPxEaUkUCKrV79zPKcdHFh
	r3JwmZGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9cdu-0000000A6wW-2D8U;
	Thu, 24 Sep 2026 06:09:14 +0000
Received: from out-235.mta1.migadu.com ([95.215.58.235] helo=mta1.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9cdr-0000000A6tO-2I3J
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Sep 2026 06:09:12 +0000
X-Envelope-To: linux-arm-kernel@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=XHpWqj04QFUErnLgPhyPwQH0c/whsMd8F/Sj8yIguRU=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1790230148; v=1; x=1790834948;
 b=jrbBVUTrnyx4B7Q1uZ/B/xMaYim+VacyJWZZ/pgdEbjKN2BX1Al+j2xQuJzwD4noLWYflPmj
 3IuNZV9f2somZk9NekfjJy8r1uYk3MG03pI71fGs1V24WxNzAvENU/Fth+1TepwINjrI53yil7A
 Xc8l1h+UaLIdBZrinrjXhW54=
X-Envelope-To: linux-arm-kernel@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id 15c52f2b69d4fb3d;
	Thu, 24 Sep 2026 06:09:08 +0000
X-Mizu-Trace-ID: 15c52f2b69d4fb3d
X-Migadu-Flow: FLOW_OUT
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-5b778bdb5b8so3479e87.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 23 Sep 2026 23:09:08 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvByNcUskKxD+Wm9omusznjhstqQ/j+c2hzhyc/kaLllB+TgmiYB4/h4NOrrL9Hu/1W/a1hDwMgRoQdZHVZBHMegk@lists.infradead.org
X-Gm-Message-State: AFuF++m83MlvQyTBMb+d0ve1IH9hdQ4MMlA4Z3OAdKlzA16Bdv39f8VX
	1TayBzDvheIOU+fI60Xh2vKwyLxpaN+D0N7u3WubesYW6VdDrCePePj5/gR79LWKTCKZUMwJOsd
	ITA5GZ3oHoCPOUmEGworzBrkhwGJ5ZCZcpjUltJvp
X-Received: by 2002:a05:6512:2395:b0:5b8:b502:9a76 with SMTP id
 2adb3069b0e04-5b8de5cbe34mr121752e87.13.1790230147200; Wed, 23 Sep 2026
 23:09:07 -0700 (PDT)
MIME-Version: 1.0
References: <20260923-kvm-arm-prefault-v4-0-d4b0b4dfa8c3@kernel.org> <20260923-kvm-arm-prefault-v4-11-d4b0b4dfa8c3@kernel.org>
In-Reply-To: <20260923-kvm-arm-prefault-v4-11-d4b0b4dfa8c3@kernel.org>
From: Fuad Tabba <fuad.tabba@linux.dev>
Date: Thu, 24 Sep 2026 07:08:31 +0100
X-Gmail-Original-Message-ID: <CA+EHjTyPsMQ-p4uRpHEd5sabKZPV0nuQv0VdoPWy7PpLtUe93Q@mail.gmail.com>
X-Gm-Features: AclHuK_F7RRmcZYBgSNF-QK5bg4WxE50rqT6HjF75xbDwVFCBghG7Y9qfeVwzCs
Message-ID: <CA+EHjTyPsMQ-p4uRpHEd5sabKZPV0nuQv0VdoPWy7PpLtUe93Q@mail.gmail.com>
Subject: Re: [PATCH v4 11/14] Documentation: KVM: document arm64 KVM_PRE_FAULT_MEMORY
To: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>, Joey Gouly <joey.gouly@arm.com>, 
	Steffen Eiden <seiden@linux.ibm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Zenghui Yu <yuzenghui@huawei.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	Jonathan Corbet <corbet@lwn.net>, Mark Rutland <mark.rutland@arm.com>, 
	Randy Dunlap <rdunlap@infradead.org>, Christian Borntraeger <borntraeger@linux.ibm.com>, 
	Janosch Frank <frankja@linux.ibm.com>, David Hildenbrand <david@kernel.org>, 
	Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>, 
	Alexander Gordeev <agordeev@linux.ibm.com>, Sven Schnelle <svens@linux.ibm.com>, 
	Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, Shuah Khan <skhan@linuxfoundation.org>, Shuah Khan <shuah@kernel.org>, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	kvmarm@lists.linux.dev, kvm@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, Jack Thomson <jackabt@amazon.com>, 
	Jack Thomson <jackabt.amazon@gmail.com>, Alexandru Elisei <alexandru.elisei@arm.com>, 
	Vincent Donnefort <vdonnefort@google.com>, "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>, 
	Sean Christopherson <seanjc@google.com>, Claudio Imbrenda <imbrenda@linux.ibm.com>, 
	Leo Soares Passos <Leo.Bras@arm.com>, Wei-Lin Chang <weilin.chang@arm.com>, linux-s390@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260923_230911_743160_18CB29E9 
X-CRM114-Status: UNSURE (   9.76  )
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

On Wed, 23 Sept 2026 at 16:18, Lorenzo Stoakes (ARM) <ljs@kernel.org> wrote:
>
> Update the KVM API documentation to reflect the fact that arm64 now
> supports this functionality.
>
> Also document error values and arm64-specific behaviour.
>
> Reviewed-by: Oliver Upton <oupton@kernel.org>
> Signed-off-by: Lorenzo Stoakes (ARM) <ljs@kernel.org>

Reviewed-by: Fuad Tabba <fuad.tabba@linux.dev>

Cheers,
/fuad

