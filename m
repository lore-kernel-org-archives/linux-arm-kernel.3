Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EBE1FC87FCA
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Jul 2025 15:49:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:Message-ID:In-Reply-To:Subject:cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GqRPDz7Js6J5ALXU+f1ABPbcLmWpDxvD5BvBQq4in9I=; b=fiOxLlrQuiddmhmAYOWpXAZlbV
	70k+hUaHTGARCHF5LILJaT4jJQDvjdGa95xiVIphSLWeg/+ad2j6C+xGfYFsTwF5rSqdcqMtKTZel
	CYuETmlPmTrCuEUgMMHnKLrfxhnEgw0NvGoislPArGa/LjBwTNUVxVU+Tcsxv9XfK2Hu68VJQ9ion
	j8Rx1ywzXJuKpOC2jW5GoPw+zBdF3XTL9387NRrq7hWqodIPmVlYeZ2Kq4Nc87MsEukmli6X3L/Gh
	g8A5CwMZsglMsajHTPjzIKD7CrZd79GmTiJ2tF/Vhr1Aup+/yIic9KaQKUK1MXWkBQnB36ZOWkZR4
	EBqnCx1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uebj3-00000005QWU-1y6K;
	Wed, 23 Jul 2025 15:49:49 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uebYU-00000005PDD-1Xko
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Jul 2025 15:38:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1753285133;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=GqRPDz7Js6J5ALXU+f1ABPbcLmWpDxvD5BvBQq4in9I=;
	b=h98pFnhbCK0P0QwFFhbuIsjGi7Ome1H4+5Q9lHdfxnxcZTzFawOiuVcHDoO/IF1o1Ldd3Q
	cTvgahs8RR83rd+ekWgO34HmNZUxeic0gOoWtT3mvGB4cQF0teyYqYd2dAnYJEstZSS6MO
	xuCTXMll6xbJD5c4BlprbBr4J0Q4Gcw=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-154-hXZu1VPwMw2fpYi_8JvZLg-1; Wed, 23 Jul 2025 11:38:52 -0400
X-MC-Unique: hXZu1VPwMw2fpYi_8JvZLg-1
X-Mimecast-MFC-AGG-ID: hXZu1VPwMw2fpYi_8JvZLg_1753285131
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-3a523ce0bb2so2739066f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 23 Jul 2025 08:38:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753285131; x=1753889931;
        h=mime-version:references:message-id:in-reply-to:subject:cc:to:from
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GqRPDz7Js6J5ALXU+f1ABPbcLmWpDxvD5BvBQq4in9I=;
        b=ASWjY8gDSaHxVH9K1z3CAClJ5+D4qtMkzoXmjc3lux75vBxeSfHGBT3xNecEa6CKmm
         ox0RSfBNwFT8GMkRTXcVmz3WKEvZC8rMdSQSB2RSTHhgoQ1O/iZ+azZDgn3HIoP2VU2z
         wWrFZ3He4M285zNAp8GTa7n0GdKQVDI18yQE1mEODUKJyGkoLRlHKub8/RLupo2PtcGo
         SGpLI1esdBvaO6pUJ0yP54G7Q9jCrp6tuuZt9OroNIRMzMojKm7U8WR1OAP5gLoiORiN
         2RGjoaX83F0N2XQxYRiddIMhyiH7Scxt+VrVxY0N988zURKxYmuLo+pzYtMZWpYLyv0c
         vnTw==
X-Forwarded-Encrypted: i=1; AJvYcCUMs4ib7/cMlnhMtDfQ9Gn1Z7l8fAvmDcuFkYXJovAEcJbZ+7BCwjKL9vEEZrxDQFZsC0z3DO9WVFD1GUQ+F2c1@lists.infradead.org
X-Gm-Message-State: AOJu0Yz2c54GfL7H7PkfOi1F8PSF7Q5i8fVIN5U7KLJyKiMQIyp5eFS9
	uof9CuZ/aK2c8hKNhTBbkDXx6CFEJKB0vC5zbUT/s21S9Fn5VUcsyg1xo06OeE7PJF+FDJSSsTX
	Aoail/P7wyuSoEJB8ksXlBoSuBBRfNbtXncveBruZ5BW54UciRl5PCQ/fECIE5jh24H92LXyUBl
	Nh
X-Gm-Gg: ASbGnct9OHNKyaDGnW8DCnwFPuhHnRFuAr1kBZHTFC17kZ2nLSiAlENogH6s11a8UAk
	04Iam4Eh27Gok9GD2j4EluGI2e7B/5i3CWPQ61G1wMSisYdcF35+EWjp6NhEmfKMnfOkCQTtgiY
	6NGR5undA7wO7cVQYFC2+ILi9JAYNf7kdqkVoOC9jN93e2QaQJToMQe7QdC1j9fFXmTp+21A2p3
	rToPifZEvor9GeI93nCYa9N2Nq8IG2aGPF+RfmFktzNGy/xArQjioDenPxP1wEATBtHOoqvsbUM
	ab2yBDy/GDvZrXULpO+gR51u9qVW88m3wUyTfZA3cPla88nff9LMg7Aq7UFi1Wmxtsv2DIXSSWc
	23srlixlmSTzB
X-Received: by 2002:a05:6000:2dc2:b0:3a4:e7b7:3851 with SMTP id ffacd0b85a97d-3b768f118cfmr2651217f8f.58.1753285130610;
        Wed, 23 Jul 2025 08:38:50 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE5VNOZ06d9Q7sp8ekogChg0i83vEbzTHM1kvfRBR/uvTvD2QLTEPwMtYJKOiLyp1I3mVdofA==
X-Received: by 2002:a05:6000:2dc2:b0:3a4:e7b7:3851 with SMTP id ffacd0b85a97d-3b768f118cfmr2651202f8f.58.1753285130217;
        Wed, 23 Jul 2025 08:38:50 -0700 (PDT)
Received: from rh (p200300f6af1bce00e6fe5f11c0a7f4a1.dip0.t-ipconnect.de. [2003:f6:af1b:ce00:e6fe:5f11:c0a7:f4a1])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45868ef50d8sm27988315e9.0.2025.07.23.08.38.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Jul 2025 08:38:49 -0700 (PDT)
Date: Wed, 23 Jul 2025 17:38:48 +0200 (CEST)
From: Sebastian Ott <sebott@redhat.com>
To: Marc Zyngier <maz@kernel.org>
cc: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
    kvm@vger.kernel.org, Joey Gouly <joey.gouly@arm.com>, 
    Suzuki K Poulose <suzuki.poulose@arm.com>, 
    Oliver Upton <oliver.upton@linux.dev>, Zenghui Yu <yuzenghui@huawei.com>, 
    Eric Auger <eric.auger@redhat.com>
Subject: Re: [PATCH 2/4] KVM: arm64: Clarify the check for reset callback in
 check_sysreg_table()
In-Reply-To: <20250718111154.104029-3-maz@kernel.org>
Message-ID: <cdf8ae33-192a-7e6e-8434-e8d336bea655@redhat.com>
References: <20250718111154.104029-1-maz@kernel.org> <20250718111154.104029-3-maz@kernel.org>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: PzmtOd1lqAt6eg896x89G3J2tJXkP2tdL5dSfR1Zgck_1753285131
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII; format=flowed
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250723_083854_475922_78FE1170 
X-CRM114-Status: GOOD (  10.17  )
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

> check_sysreg_table() has a wonky 'is_32" parameter, which is really
> an indication that we should enforce the presence of a reset helper.
>
> Clean this up by naming the variable accordingly and inverting the
> condition. Contrary to popular belief, system instructions don't
> have a reset value (duh!), and therefore do not need to be checked
> for reset (they escaped the check through luck...).
>
> Signed-off-by: Marc Zyngier <maz@kernel.org>

Reviewed-by: Sebastian Ott <sebott@redhat.com>


