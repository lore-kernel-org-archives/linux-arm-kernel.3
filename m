Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18153C83F1A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Jul 2025 15:59:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:Message-ID:In-Reply-To:Subject:cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Xx2dqPhZid/DVjqgMSquhTFU7ay+TzkkNAEATL+i+gw=; b=JQy3y4knB3oTLPGQDHkzU99Cfu
	UPuVxd/K8k7KQxwaweQzeOcWAnaUZuZztwNTDV47jBcNVUp+V+gZapGm/EiJWK0Cg/1YrvEIImO6y
	Tr/Ne1w08/W9hP8ALCCcUbll865eREnkGYjCRfKuqaf3VaoHXpBzqm8lIqSOZ8iOeUhFAaaE5jm/z
	bIbKhL0nq0CnfCrstya7+1e91ZNDR+6f1FwGL9HalkeQygWMBgXncdnU3lpb+vSVYPDfuE+F2KJpF
	Un9nAIt6purZYF/ZMDf/hACoOR0s6SiB7mmvo7KxkbcTQkRZNcJsZHuH8QLpVltEoEC2IelpqSLlK
	++MbPhVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uebsK-00000005S4R-1qQu;
	Wed, 23 Jul 2025 15:59:24 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uebpt-00000005Rm4-1Ys8
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Jul 2025 15:56:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1753286212;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Xx2dqPhZid/DVjqgMSquhTFU7ay+TzkkNAEATL+i+gw=;
	b=TcQEpN/7CkKOkiA+nZKwxkeuerDnBcJDxEftpyvIetx5N4SEBQ3wZ76D09osYnKdhVnEbW
	zscc1Sm78PCaIU2oeYNlBFDLFiI1P4J3fzUuSqwahkmr/5Dgw6vnBfWucMW88jxbet3z3P
	buRGOER8W04lMBpuxBp0Vwa9EsFcC1c=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-608-Rg8aa1t8OG6ITbRzq-bYVg-1; Wed, 23 Jul 2025 11:56:49 -0400
X-MC-Unique: Rg8aa1t8OG6ITbRzq-bYVg-1
X-Mimecast-MFC-AGG-ID: Rg8aa1t8OG6ITbRzq-bYVg_1753286208
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-4562985ac6aso68832495e9.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 23 Jul 2025 08:56:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753286208; x=1753891008;
        h=mime-version:references:message-id:in-reply-to:subject:cc:to:from
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Xx2dqPhZid/DVjqgMSquhTFU7ay+TzkkNAEATL+i+gw=;
        b=UXbAH2tPkm5g18WnAarRSzLWj2wEIXlMP5fRidZaMSdwrG9I0ADVBNS2HnsOfl9oCQ
         dArG9NyZ0snd0GwkTwXj1o70J0V1r1sqovfy1CcTc6nIUE/pyqYMdNKlKKwukyqW5cVC
         JDn+P0W0UXY3v4qrmIhPeJDP9JxFMjlBgL9grv2gpTA8uuiyxTE6LCVT48rc/CcKv+fQ
         5DA+G+5Jw3GylquPII225EmYxWm9ZDXgjZXHxQCpnRXE8W34/bnhdtCu4bIe5xSzkDPe
         EQM4HezohGDcPJOgC+C0g6VTPEMILST0Qurw8/csPkhB205XxMpYXo3mF/iMbanMLQFs
         5q3Q==
X-Forwarded-Encrypted: i=1; AJvYcCXLsqWgpXxIGmLg/cWw4ANVbZ9pdktPV+9XO//b5LLx9pooBLi+b4NTOp9UIG2389QEc1vXI8VJ5Q+wzv9wDuGf@lists.infradead.org
X-Gm-Message-State: AOJu0YyO1+HsmqdAH39IkHVmjSDZ5BkQfbXGvRI/H6L311/KpOF6e9kR
	8jP6fcZnR9paOE5xUSfs3+Si8+/taz/kNN3GY+x89dm9Kvljf3Xok/6rrDS6LskSo4aFIJA5oQs
	RpPJNfzc259UvC6ij6gBHgE2n8rLKKMD+o9bgUj87Waz3KrmB1Rh0Wt8z9AKWeh0GP3mmGdeIWl
	Lj
X-Gm-Gg: ASbGncs6/i7eVmjevgUMrTsSa+Jhrp2lYgy2jHg9qa0Lzi2Md/gpUiPeqmL/iDxRMYe
	uDlJWI1V9UEeAi0PDqIKD2cCzW7R5V67PIS8H0dT/d4mzxYNABt4/XUk4zvNIOqj5pInRLx+D+q
	HXSmWIaYNVNAf+YmIP8AtvXO34M9NizTB7RWvSH03I50N0hYVP15qQZvh1Lw5rClgWKbMoDk/Am
	uND4V5HxY0IrPpVOS0qEWAxi3Kqmp+5FJ/4eh40NgGFKcuWKs3wH7Z6a6oPWQOxg9tacI3LQTHE
	Sb/NyJd1MGfQTOSXWhfnITH2R0Mj61fzanlltICjJawB1yvtG3gOL/CZOIo3MTf163uDuwX7lHt
	1w2UGq89vccFP
X-Received: by 2002:a05:6000:26c6:b0:3b6:2f9:42b1 with SMTP id ffacd0b85a97d-3b768eedb05mr3113402f8f.13.1753286207907;
        Wed, 23 Jul 2025 08:56:47 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGRkJqxrVVPLRiwaF5PbaKWf414l/WBiJeIdnuyQV3tqT3YAeHRnT1isf7baSPgjvG55wCY9Q==
X-Received: by 2002:a05:6000:26c6:b0:3b6:2f9:42b1 with SMTP id ffacd0b85a97d-3b768eedb05mr3113379f8f.13.1753286207521;
        Wed, 23 Jul 2025 08:56:47 -0700 (PDT)
Received: from rh (p200300f6af1bce00e6fe5f11c0a7f4a1.dip0.t-ipconnect.de. [2003:f6:af1b:ce00:e6fe:5f11:c0a7:f4a1])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b61ca4c88dsm16709093f8f.60.2025.07.23.08.56.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Jul 2025 08:56:47 -0700 (PDT)
Date: Wed, 23 Jul 2025 17:56:45 +0200 (CEST)
From: Sebastian Ott <sebott@redhat.com>
To: Marc Zyngier <maz@kernel.org>
cc: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
    kvm@vger.kernel.org, Joey Gouly <joey.gouly@arm.com>, 
    Suzuki K Poulose <suzuki.poulose@arm.com>, 
    Oliver Upton <oliver.upton@linux.dev>, Zenghui Yu <yuzenghui@huawei.com>, 
    Eric Auger <eric.auger@redhat.com>
Subject: Re: [PATCH 4/4] KVM: arm64: selftest: vgic-v3: Add basic GICv3 sysreg
 userspace access test
In-Reply-To: <20250718111154.104029-5-maz@kernel.org>
Message-ID: <a6ed6e2e-38a5-41fe-7a63-0418d4ea7661@redhat.com>
References: <20250718111154.104029-1-maz@kernel.org> <20250718111154.104029-5-maz@kernel.org>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: MDeiyNwWv6LtIbdog53Lol9a4wwGlMeh9AguwGvhyDI_1753286208
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII; format=flowed
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250723_085653_481111_9CA10302 
X-CRM114-Status: UNSURE (   8.52  )
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

On Fri, 18 Jul 2025, Marc Zyngier wrote:

> We have a lot of more or less useful vgic tests, but none of them
> tracks the availability of GICv3 system registers, which is a bit
> annoying.
>
> Add one such test, which covers both EL1 and EL2 registers.
>
> Signed-off-by: Marc Zyngier <maz@kernel.org>

Reviewed-by: Sebastian Ott <sebott@redhat.com>


