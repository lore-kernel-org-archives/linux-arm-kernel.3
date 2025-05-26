Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5ACA7C54FB3
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 26 May 2025 20:23:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6O+HULtQ2zQfibnl8FSMfuNYNOIwOeOtgHCiLFy2uks=; b=PqHUim9ySIbiA3S+dUcFSTWnKW
	DBdkZnRZbWjRFdcOrF5nR68Aemot6k4/4yxzGDRM4SWKjCKTguhGfUiiHeSrtjSibiNR9Qe/c/Rav
	Tnqaxva0n7o2kzbLBX+kDmjz7nF3NxwAmihl2+9FtG3PNCWi/MtE/XOjGnruYQl3TdYy1bRpRueqV
	t2KFXNPORXpmwiDcD8LTekDJlwbcBoznJVsmR/mTqfp263v3ncyUUZz/2RQGuQ0r49VTqZtnnrDG7
	VPBOqbZ44S4wJfDF2YYWerWi7SrrL65GLAlROVXmlNrz6KSkfHUm4H+liRByq33vxkVe7bXT0reOu
	5OVqH0Mg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uJeMH-00000009TdC-0G33;
	Mon, 26 May 2025 20:23:41 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uJeK7-00000009TNf-0Vhj
	for linux-arm-kernel@lists.infradead.org;
	Mon, 26 May 2025 20:21:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1748290884;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=6O+HULtQ2zQfibnl8FSMfuNYNOIwOeOtgHCiLFy2uks=;
	b=FEHdm/O+qBe9auS6E2hiZuKm3uEJvsWK6q2zvB01uuyNPYPdjmmUilwui+g8MMBhmg9MiE
	ibXThrOWH6wVxeDMXYSBl2lLI39mUu5Nqpt8DwgoRkipXAa43PrQJ7Ohu2PxdzjAoVcOh8
	ImwXYR6nB16ZaHCUu/9v67DyV7oMCJU=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-391-3ByIeZBkPbSFoUepKwsFnw-1; Mon, 26 May 2025 16:21:22 -0400
X-MC-Unique: 3ByIeZBkPbSFoUepKwsFnw-1
X-Mimecast-MFC-AGG-ID: 3ByIeZBkPbSFoUepKwsFnw_1748290882
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-3a3561206b3so1067248f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 26 May 2025 13:21:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748290881; x=1748895681;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6O+HULtQ2zQfibnl8FSMfuNYNOIwOeOtgHCiLFy2uks=;
        b=tArqUzpwDbSVyrIeiQmZjWov6jfXnjGVeUvT2Vbp8SMHBgzMLNUipxnyxVIdAdRqra
         3dvk6zV3j4BjHqMiqwQz0UKVjr72VkDXhJTPd9K+o/p6RHHKkuC5bgCjqKU+0kixho8Z
         bdjjZALOVKzkMYcFxXVm53FkIevz9A9qQZNju7wDNBHNz0yyv10lKbGYB+mhIQ/b60ki
         AJ2TrDlzjVDMhL5BmaI/HXCCnBssbHhpse8+VYni31XFRo35PtebYKdwL3pOh2/AY9Hs
         BGm60xj7uybYDxW6P+LsmNqu5GYV2+piN6DDVZMqbRfE3qkrOZCEazQqQ+bKZPXzZxVR
         7NAA==
X-Forwarded-Encrypted: i=1; AJvYcCUZvlOlYIBF8AmKAKDnUxN+K4ecGS9F7E8Qg6cuE0l5JV6MJYDXFt1o/Zf3epwPcLS7WEgTysPpDuxKDhXqt5h/@lists.infradead.org
X-Gm-Message-State: AOJu0YxRbbpvZXPm/TiWOwbmG3cyJT46btU+QQVrbrJ80y68qyAKK+xv
	2+1/+JkA3yD8TwxokrXHT8lYoUvvc5ELj1zRzvBUPrWQYUPJLHVcqGjG6t8sI2TF7zTVjClvRLG
	VnBJNjrCwa96aCvyYFZibwfP59nThiqmYfa4lbZZHnr1BHPn57deziCdRl/hQYmkxqSg/DTjyk3
	eYoVI2cCgbVCU38PhtZC2Vgnnrp3cUI1S0/84JI6TEAh4YKuPQZ68=
X-Gm-Gg: ASbGncvHM0AJtU2sd/eiEL8cyTpO0w3g4fOng7N7hG9bNrvMNlAOq+0IntqfmwIUsED
	EPfHvvVCteWcHODRyH49uZ25OGTOdR0Z4DQk24RKd7YoQfOHuIvIEtgjXsihM45bClCE=
X-Received: by 2002:a05:6000:188e:b0:3a4:d4e5:498a with SMTP id ffacd0b85a97d-3a4d4e549f4mr4549104f8f.42.1748290881566;
        Mon, 26 May 2025 13:21:21 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFPfGkLNrDWsuMBcvBhphCxIvU3GI8PzuGzZDpGUJKW1wSG80qF2SscvPTAo9oEnA5hoBADF7+zA/YXDDS9O04=
X-Received: by 2002:a05:6000:188e:b0:3a4:d4e5:498a with SMTP id
 ffacd0b85a97d-3a4d4e549f4mr4549074f8f.42.1748290881218; Mon, 26 May 2025
 13:21:21 -0700 (PDT)
MIME-Version: 1.0
References: <20250523112015.146300-1-maz@kernel.org>
In-Reply-To: <20250523112015.146300-1-maz@kernel.org>
From: Paolo Bonzini <pbonzini@redhat.com>
Date: Mon, 26 May 2025 22:21:09 +0200
X-Gm-Features: AX0GCFszvJZwa7StoX7JqXeC8eM3B-BChUPaDxpaOnMqsQR84k4snxyVAo-DiDU
Message-ID: <CABgObfbAD9W8dFzAPhyayBwohNW+9MpBnHfT5A-KVs+7RDQ9ew@mail.gmail.com>
Subject: Re: [GIT PULL] KVM/arm64 updates for 6.16
To: Marc Zyngier <maz@kernel.org>
Cc: Anshuman Khandual <anshuman.khandual@arm.com>, Ben Horgan <ben.horgan@arm.com>, 
	Catalin Marinas <catalin.marinas@arm.com>, D Scott Phillips <scott@os.amperecomputing.com>, 
	Fuad Tabba <tabba@google.com>, Ganapatrao Kulkarni <gankulkarni@os.amperecomputing.com>, 
	Gavin Shan <gshan@redhat.com>, Jing Zhang <jingzhangos@google.com>, 
	Joey Gouly <joey.gouly@arm.com>, Kees Cook <kees@kernel.org>, Mark Brown <broonie@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, Mostafa Saleh <smostafa@google.com>, 
	Oliver Upton <oliver.upton@linux.dev>, Quentin Perret <qperret@google.com>, 
	Seongsu Park <sgsu.park@samsung.com>, Vincent Donnefort <vdonnefort@google.com>, 
	Wei-Lin Chang <r09922117@csie.ntu.edu.tw>, Will Deacon <will@kernel.org>, 
	Zenghui Yu <yuzenghui@huawei.com>, Eric Auger <eric.auger@redhat.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, linux-arm-kernel@lists.infradead.org, 
	kvm@vger.kernel.org, kvmarm@lists.linux.dev
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: dYm9RblsigMUHMepXMr55vWdaS5cIU9fnJEUaPRmKwY_1748290882
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250526_132127_237250_FD24CC95 
X-CRM114-Status: GOOD (  15.72  )
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

On Fri, May 23, 2025 at 1:20=E2=80=AFPM Marc Zyngier <maz@kernel.org> wrote=
:
>
> Paolo,
>
> Here's the initial set of updates for 6.16.
>
> The largest change is actually not a functional one, as it "only"
> reworks the way the guest feature set applies to trap bits and
> register sanitising. This translates into another (generated) set of
> large tables describing the architecture, which is I hope easier to
> deal with than ad-hoc code trying to do the same thing.
>
> On the functional front, pKVM gains THP and UBSAN support as well as
> some page ownership optimisations, we workaround a couple of really
> bad issues on the AmpereOne hardware, and we finally switch on nested
> virtualisation support.
>
> This last bit has been a long time coming, and I would like to express
> my thanks to Christoffer, Jintack, Oliver, Eric and everyone else who
> helped me getting this monstrosity across the finishing line. Except
> it's never really finished!
>
> As usual, details in the tag below.

Pulled, thanks!

Paolo


