Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4404C5B549
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 30 May 2025 15:15:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yfqZ4uwCBedZ314UKTh8R56ds3rRmx+4qFuELqIHy8I=; b=MVTPKt8ZhGDotIcoDvM+R3Ss/Z
	YiBHxJaP2mrIsgH+PXJT478a/Kq9VJBl4mMjHudW5gx6Z43S3/9SWuymskrsbEWgi3MvZNsgQqVvQ
	5hFOC6VM5ucPIzqNoorfKZCW9t85XiOCYdTTaNOGpXaiGU8kPIy4WO/BGNflIoJgNLCAM85OTUN6Q
	isEw5h5dg4fr7B1Oj+P9Lf7DrDieVXdQvqKZIyVPjPMhkRkHd12PNiWUFBZ4gmLLjdKQBKIHucq81
	Ku7OUX/+4U3DxfW6oROPr83LpW4IAQ8+MTuoWQYr5hZ9ctBkVPJ29Ofr+iircreVjeZ+Hnvjzp/oK
	uRzumTPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uL1SJ-00000000zGa-1YIq;
	Fri, 30 May 2025 15:15:35 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uL1Oq-00000000yea-3VB7
	for linux-arm-kernel@lists.infradead.org;
	Fri, 30 May 2025 15:12:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1748617919;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=yfqZ4uwCBedZ314UKTh8R56ds3rRmx+4qFuELqIHy8I=;
	b=epptEfXcFiW425761WIVeSZiR4fQ9XDJ30EPCe6/BgZ+tEVQvd5twMOv1VTCTLU3n0HfkU
	j8wTWR8FPfPjqK27yOaBTbMMUP2Yns/8Xe0LAu4AJv2fOOLboNMohaqVozAQKObbmdpaKe
	LjXB0kDZkjz+vn9mXbB9PjDqO9OkxiQ=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-558-LXhJzI5AMfmSuAq-uLo1OA-1; Fri, 30 May 2025 11:11:57 -0400
X-MC-Unique: LXhJzI5AMfmSuAq-uLo1OA-1
X-Mimecast-MFC-AGG-ID: LXhJzI5AMfmSuAq-uLo1OA_1748617915
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-3a4ea7e46dfso887168f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 30 May 2025 08:11:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748617915; x=1749222715;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yfqZ4uwCBedZ314UKTh8R56ds3rRmx+4qFuELqIHy8I=;
        b=NR0WdNosIa/tF0qezdnaNqxq4stuCvHLVw/mE1Ab9HslzRPkZuN39qsh4sd3DOXJbV
         uQY5OS3vgZ/IQgw5VpT/UuMofotXxUS2hQCjiTFZQLPnZHbz/3NynCM+6ifLfb35582Q
         u6pyXsosdOfqTs6+TCj2NJPCcg6WGdDfouRoyv7WuE81vN6ttKxXQycDieVfpVkg85nm
         D9hvRQd2Rc0CK8L0ICT3XvDuuIcP9eCZqcMhKzA01PW9PFLDF2yadapXNOR7W5GfvE3h
         ISbtiVc4Mz4mX379uCfMbsQvrScUgbO79trWbEVTO71L/1yTpn6ssvThYRS/7+YgNr7K
         /Wpw==
X-Forwarded-Encrypted: i=1; AJvYcCUBItj3b0t4PZy/xzAOjRLZTyl+4F77BBr0xJ/ul5Y9IERLPf++FAEpqSVHPQrYmxwL4BLGr3en3wUTVCHU17yt@lists.infradead.org
X-Gm-Message-State: AOJu0YzzV3BdVSyUHT9O8aHe4gSJgvRf1t7BivXXNNwwtfx+TYu/eujU
	Kt1TL0aH5GQXFllXVkHCPpeVKj0V0j+G2Yj5kveehnvXr+H3aSc3xKCf0KR+OFRBpJtDAaGnCHk
	DOs2oLMYlsb59/0i2XKWyMHN6g+hSru0eD3U2ohln5w+H1H+kiFfxh6I6AY1tzo4NHUQJrzQ38f
	sG8r9JKuHln6f0JqUabTNgmovKFMKO2uF784YzjnXz8aANvZ8U6g0=
X-Gm-Gg: ASbGncvGwhwnF9HA0xCjKQPUn7kdj2/xX83RHU+UftqHyzfNMWdptR4I1S341oHe7qv
	9FAeUsnO80/8Nup2CL8hdNbZSYwZA2kFKlYIDgto445ZDt2sVKyDemLIOV1TUU4TDBmg=
X-Received: by 2002:a05:6000:2907:b0:3a4:f6b7:8b07 with SMTP id ffacd0b85a97d-3a4f89dd0e0mr2510025f8f.48.1748617915364;
        Fri, 30 May 2025 08:11:55 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH0zplckeg0pZyVVtsF4Rx+t90b7lYELscoecfMN3axFdzklZzbvdq5/jQJWSDnQewmwTsExNb1LUaSwI9dMiY=
X-Received: by 2002:a05:6000:2907:b0:3a4:f6b7:8b07 with SMTP id
 ffacd0b85a97d-3a4f89dd0e0mr2509983f8f.48.1748617915000; Fri, 30 May 2025
 08:11:55 -0700 (PDT)
MIME-Version: 1.0
References: <20250530095223.1153860-1-maz@kernel.org>
In-Reply-To: <20250530095223.1153860-1-maz@kernel.org>
From: Paolo Bonzini <pbonzini@redhat.com>
Date: Fri, 30 May 2025 17:11:42 +0200
X-Gm-Features: AX0GCFs45z1db-bj9Xqr5W0smLTP6OZ81Z8ky2sMoDqJ9qQmYN3iiueiMy14ig8
Message-ID: <CABgObfb+MeNYmRpubfqf=KHWxNcK4bR7bHSsaKERF28ATYj6yQ@mail.gmail.com>
Subject: Re: [GIT PULL] KVM/arm64 fixes for 6.16, take #1
To: Marc Zyngier <maz@kernel.org>
Cc: Alexander Potapenko <glider@google.com>, Catalin Marinas <catalin.marinas@arm.com>, 
	Dan Carpenter <dan.carpenter@linaro.org>, D Scott Phillips <scott@os.amperecomputing.com>, 
	Jing Zhang <jingzhangos@google.com>, Mark Brown <broonie@kernel.org>, 
	Oliver Upton <oliver.upton@linux.dev>, Sweet Tea Dorminy <sweettea-kernel@dorminy.me>, 
	Will Deacon <will@kernel.org>, Joey Gouly <joey.gouly@arm.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Zenghui Yu <yuzenghui@huawei.com>, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	kvm@vger.kernel.org
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: DoxsAk-DshRpsdbHljr8KBAfHLpbZwRA4Ax94dvb690_1748617915
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250530_081200_942546_38ECA821 
X-CRM114-Status: UNSURE (   7.98  )
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

On Fri, May 30, 2025 at 11:52=E2=80=AFAM Marc Zyngier <maz@kernel.org> wrot=
e:
>
> Paolo,
>
> Here's the first batch of fixes for KVM/arm64. Nothing very exciting,
> except for yet another annoying race condition in the vgic init code
> spotted by everybody's favourite backtrace generator (syzkaller).

That was fast. :) Pulled, thanks.

Paolo


