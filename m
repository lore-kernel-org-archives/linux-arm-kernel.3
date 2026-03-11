Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9FDC41125858
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Mar 2026 17:06:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vj2yvLGgVITiiLRf6REAXbXzj8fNSDCMYaahdwZynlE=; b=A+FLP8wGUNEX/XCcmQhFMPUnWl
	t0o1vryWnrmDkJopHCC0GUlOlU+nTSMKdmOY/6OS9DS2azuz4vIcoWU6qFst8ELXjaR+SxTrzZXyz
	wz4+BGFarCt89VqhEJJBu+54QJOHltHk8Xc++UNyYFTKen9wJFNWmIgvLIYcpk6QgbNlGdeP3Pd9g
	qorT8Oa6eHtBID4U1pYOP5EKyhrFbxCKrVlxAOky7utN3z77EkbSZJEN4tuCnGYva7R6j6CZ7jDsN
	jmUgl37YHuSbT4dy3i1JYUsnInkFnMTsEdvQoAksghANgV/gB9nP8//GkTufMB6zpu5ZPjD/d9bUq
	ItdpVGsg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0N0T-0000000BzgQ-3Tia;
	Wed, 11 Mar 2026 17:06:01 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0N0R-0000000BzfS-3Wz0
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Mar 2026 17:06:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1773248758;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=vj2yvLGgVITiiLRf6REAXbXzj8fNSDCMYaahdwZynlE=;
	b=OGt52T7q0V0HX0aIDWPa1OwinlZoK15Ak2F5hdhsikh3/nIYCD236+ki737jWgLrpjAf30
	alUJ4WgjpTrjpfH+3jajGueP0CQJcD64mch5S57t8wa7BGvhojTxE1Ri/5eh/p+575UpWm
	j8HLSP3E1QT/zoXW3g1R3DDQLONhuFg=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-647-vx31TBRIO4K-JMdXI91r1w-1; Wed, 11 Mar 2026 13:05:53 -0400
X-MC-Unique: vx31TBRIO4K-JMdXI91r1w-1
X-Mimecast-MFC-AGG-ID: vx31TBRIO4K-JMdXI91r1w_1773248752
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-439bab2d095so54168f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 11 Mar 2026 10:05:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773248752; x=1773853552;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=vj2yvLGgVITiiLRf6REAXbXzj8fNSDCMYaahdwZynlE=;
        b=a/Fsfe0QUfzjYoGlygH4dyWnEyIPq1j4UFzAqtD8qWPTfxFhyRWBqTfPDzHktBUYrI
         sEIcx9ACte/HnC+BijsAcKhT8P2YjbH3qE8tWCSGy/otAnd82emnRl4wzydiLfDBEkdd
         GhUX7GN75mpqEd2Z0OoBmGQGWzqYb3xnAkfe38Mv2218Km1U//dsUxvURi6Hi3QH0TrI
         ORSG+MCOH8RpmdmjkOeli/in/hQVUguxY34/7KFOJhtbZlPMCnrSRwZLC+SZCZ0uDidX
         R9PotD1hyX+WiZrai33Jet/DLrQbbtBQS9bdrLWMpzgi1l4EtdQPFdnXmmfg7oxb6tsw
         4vKQ==
X-Forwarded-Encrypted: i=1; AJvYcCViJbzUIr/tGyddyUfmNU8oLkNq2laTVv0hIgabQLK9sWm5Pjo+iTg3jpLfVlt8NoIFZ6PwJnspS3zqGe/yOnaK@lists.infradead.org
X-Gm-Message-State: AOJu0Yw+sb6VmcyBqDsnpxaOISYBmTunY/R9tmiJbqNh7PxoWx1e86pg
	6/w3UnWw1cSYX7TDR/VXajV+E0J19ZFSmKWWFBlmRcH/v8hWHvZhccjrCCpDj9S3yz7M+pyeTwd
	lsVEJAhKY88P0qYayK75C771BQW3h51WrnRUNGPtmjjdFGuH/lN8+cf3+EKtQKSQSDGT+9gwheh
	yXezsu97OCb2UrAKd4PTjznOVmGfZSb0sSy63N+9zBfayunE//Yh0=
X-Gm-Gg: ATEYQzziTxFR55n3vXLtk57xDOSKMTeKm14+uD1LGp0T7aj9V5djUmmWWZ79Ai8Dz86
	MWIqWKTn+erxTwEVqKb7+79o1gi7ScBbK56BWAK0kYX1T5LSqj2lNCCI7D//T/BWqjGVygkBkDy
	bk3wBvmzayNvhmIYCTBuYhObJpnmFj/v2KxlpuNhg6hSIqQeFkTqydRmpCeWuvPCzNm0sSx3mr1
	vUZnYMuehTRsSGGox0w6bCC6CBTsFW2U1yZq3Y7HN9VzlQkLCrm7UI9TRGoa41K7IbgyqyllQoG
	D1Yb+Vk=
X-Received: by 2002:a5d:5886:0:b0:439:b6f7:7ed9 with SMTP id ffacd0b85a97d-439f81df2a4mr6786229f8f.10.1773248752113;
        Wed, 11 Mar 2026 10:05:52 -0700 (PDT)
X-Received: by 2002:a5d:5886:0:b0:439:b6f7:7ed9 with SMTP id
 ffacd0b85a97d-439f81df2a4mr6786166f8f.10.1773248751678; Wed, 11 Mar 2026
 10:05:51 -0700 (PDT)
MIME-Version: 1.0
References: <20260306112231.3201502-1-maz@kernel.org> <CABgObfYJqhj3xiM4_+7gCE1x5v5JQhyS0ox4+obrsZwA2W4GYg@mail.gmail.com>
 <867bri70xo.wl-maz@kernel.org>
In-Reply-To: <867bri70xo.wl-maz@kernel.org>
From: Paolo Bonzini <pbonzini@redhat.com>
Date: Wed, 11 Mar 2026 18:05:40 +0100
X-Gm-Features: AaiRm505BH0B-LgEHk7B9nd4GEA3WrtXkbmONvErj4A6FWFc5cpbN4e0xfK46wI
Message-ID: <CABgObfYjQaTiC7ng3rY1FveMqgzgWvKk1ER6rymfbWNSo74jtQ@mail.gmail.com>
Subject: Re: [GIT PULL] KVM/arm64 fixes for 7.0, take #2
To: Marc Zyngier <maz@kernel.org>
Cc: Fuad Tabba <tabba@google.com>, Quentin Perret <qperret@google.com>, 
	Yuan Yao <yaoyuan@linux.alibaba.com>, Zenghui Yu <zenghui.yu@linux.dev>, 
	Joey Gouly <joey.gouly@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Oliver Upton <oupton@kernel.org>, Zenghui Yu <yuzenghui@huawei.com>, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, kvm@vger.kernel.org
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: VSm0Vw-CWfK2ERvODaoVUm2agLJ9GnyINMpP1Spe5NE_1773248752
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260311_100559_945896_4749CBA7 
X-CRM114-Status: UNSURE (   7.60  )
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

On Wed, Mar 11, 2026 at 6:04=E2=80=AFPM Marc Zyngier <maz@kernel.org> wrote=
:
> As a heads up, I'm about to send another one with a couple of annoying
> fixes, either today or tomorrow morning. Would be great if you could
> stash that one as well.

Thanks for the notice, I will wait and send everything together.


Paolo


