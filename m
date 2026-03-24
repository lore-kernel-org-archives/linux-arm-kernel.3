Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2D66F54ACF
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Mar 2026 16:33:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HaaqCyZJuHFyqaA3jF9mPx4YKb7kG9SBT0R3VHSi6qg=; b=cKYkFZHLxBwPtFMxugt9Yjx0SE
	MNZbXDLd/7w7JG+koGB5vj9bv8I45csB+1kRy9cZBvSHla5sLaNdmqWM47Z7nP37speBk8ehwF+GG
	JSnTnPCWLEHNsu8+FSdfpUALd6y+kasCQYCDX/mMohSkrYTaaOrsFvHSFXJIhsBe3WBNTeTcA4eEr
	xG/ia1xwxf3CcBZgcU9/hv79Y2AKsifq+j28jS23T6xRGO+4oLY33rL+TDpnLi4MXqaLI5bY6QOiW
	gqGiEEQYuSPKeNPemrLoXlftxyoWmhjc23wppWXGG1LLEg3WxwzLMSumcxqJpxpkrO3lHp5rMIALq
	H9OO6/7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w54gj-00000001tO4-0CAH;
	Tue, 24 Mar 2026 16:33:05 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w54gg-00000001tNj-1GZu
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Mar 2026 16:33:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1774369979;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=HaaqCyZJuHFyqaA3jF9mPx4YKb7kG9SBT0R3VHSi6qg=;
	b=TDwXD2iSShiHC3ZtxujZoy1USTRy3vSpjr+GshFuEL+b0Qc/1msK/a2styumghE+u3Buva
	akCEL+rOmvJW/fv3hNamApmXvdFQHS6p4/KPpOPFawLNI5cLGI8U8kxncb0Q68KXdAjDCd
	qJuCu4PQbpgcodWcD4XwKqcN5Xks88w=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-374--XToJWc3N2-g2izUlOs6XA-1; Tue, 24 Mar 2026 12:32:58 -0400
X-MC-Unique: -XToJWc3N2-g2izUlOs6XA-1
X-Mimecast-MFC-AGG-ID: -XToJWc3N2-g2izUlOs6XA_1774369977
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-439ca4b3d0bso5164055f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 24 Mar 2026 09:32:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774369977; x=1774974777;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=HaaqCyZJuHFyqaA3jF9mPx4YKb7kG9SBT0R3VHSi6qg=;
        b=deRFMyp/h4TfP4goJyY7zoH/lhqHd9NBDt9z9qYpYkaN6limZqcUleuuC9OMUJPO3W
         RBNcLyWhVyzy5X1EmefJMKXo1djW/pR+8vUpFo/nZZBFWe0Ai9qAjS4DiBEICgnZejfq
         vZcwhbuHyqfLkyM9YKmLEM/XahvWuOx1rAHhn7Ivpzmxc3VlrwHlN8BD1AEp+1V4W+jf
         70mKyFTqrZIrRdmCtKqZ3G20amPNlI2RLnk7RPN1jJP0hOUZQHlbZfgyX4ayOotqcq7L
         Ez1UuJJx5LOSoq8OJJkghegR4qrrx5mBgWQrTiBZNUXFqOJU82jg2F0s2J6yWWzq4pcn
         V1Ow==
X-Forwarded-Encrypted: i=1; AJvYcCXA7TiYdNRHBDRJYgE4vkzz9BNLZ6OAo56F8oud9cfNSzPEAVpk5mI+xXWe+7K/EaZTDicW7JbLt8nBKtJSce8L@lists.infradead.org
X-Gm-Message-State: AOJu0YyViO7Wd9hRMmVgEaUgk5lvI3y8lHFoBsASFVroKqkSxbLl5XvQ
	jI4JeZSQGOVyyKxjZCdp1KyopAiUgBIEi5e+4t7Xtah8G37ybJvMfp9wQatCUuFnAnEDcg1p8Ga
	Vx2mWIyM6ablXJMWnpK7d1B0v13NeGU34lYmWial0HHQc8kFUDTpsY2rJsbuMAcT2FaJzGRI3sX
	4TZS8jUrkGAdFrBwdTZkqKNbyvV4AsjwXAlTLZFZkUQx70gTa972s=
X-Gm-Gg: ATEYQzxzX46qzl7uxxluwBDfugghGrGA5r6E8C9PQ9uTjRt3WGA3+Z99EBYcWR5ucBn
	hZVy/cvJgoX17De3ZIJn5zS2mUvUHjliTO1MnAlGhzDAEmiaWfQpt1nUVfvgrTTQD724iLLuEKV
	b6ZEslOqiGiF8kshYOZWOsNvIm+2XFlGQXPBDcdktnmxAGTZ10ckPO43Vw+9xnCIQIqB+NB1lBQ
	jnzzztgcQQfpyO757k5iuRuR4EwwPpmIPqasdG9PnHFrfLTVRVcaUwk+glKRhRIbjsH8HJVWjJp
	6lS0
X-Received: by 2002:a05:6000:2003:b0:439:c040:cc8a with SMTP id ffacd0b85a97d-43b88a0fb2amr191785f8f.32.1774369976877;
        Tue, 24 Mar 2026 09:32:56 -0700 (PDT)
X-Received: by 2002:a05:6000:2003:b0:439:c040:cc8a with SMTP id
 ffacd0b85a97d-43b88a0fb2amr191746f8f.32.1774369976441; Tue, 24 Mar 2026
 09:32:56 -0700 (PDT)
MIME-Version: 1.0
References: <20260320094151.2541661-1-maz@kernel.org>
In-Reply-To: <20260320094151.2541661-1-maz@kernel.org>
From: Paolo Bonzini <pbonzini@redhat.com>
Date: Tue, 24 Mar 2026 17:32:43 +0100
X-Gm-Features: AQROBzBSOb2DrC9P9JRJKnQIuo8-0o7xFzXZcGC7UdoeyqQYcpLh-BRplqsjmsU
Message-ID: <CABgObfb=e4eeD7Dx7o_3rSNvs+dGmoE-n3Zp9N6A_QTzGtjVBg@mail.gmail.com>
Subject: Re: [GIT PULL] KVM/arm64 fixes for 7.0, take #4
To: Marc Zyngier <maz@kernel.org>
Cc: Joey Gouly <joey.gouly@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Zenghui Yu <zenghui.yu@linux.dev>, Oliver Upton <oupton@kernel.org>, 
	Zenghui Yu <yuzenghui@huawei.com>, linux-arm-kernel@lists.infradead.org, 
	kvmarm@lists.linux.dev, kvm@vger.kernel.org
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: VHK3YIwCYk3GAEukSAo1sk73-sT2FdEC8CamLxO_leU_1774369977
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260324_093302_411909_A68E928F 
X-CRM114-Status: UNSURE (   8.16  )
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

On Fri, Mar 20, 2026 at 10:42=E2=80=AFAM Marc Zyngier <maz@kernel.org> wrot=
e:
>
> Paolo,
>
> Another week, another set of fixes. This time, another two fixes,
> mostly observable with nested virt. The first one results in a vcpu
> coming out of reset potentially skipping the first instruction at its
> initial PC. The second one is a classic example of pointer arithmetic
> going wrong in our address translation emulation, setting the access
> bit in semi-random places. Both are stable candidates.

Pulled, thanks.

Paolo


