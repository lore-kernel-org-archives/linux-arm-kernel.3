Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8890FC982D8
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 20 Sep 2026 14:43:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=E2SZ7LXxk0nnMWEU5pr2Xf9Pm0qc6htez9AYqpxDpYU=; b=w1l5/iSQnMbxnyAsHUALBpXH3l
	M+J7jXtMpUkC6ZFZQnIZHd6qblnZlveKhov0nBgPzoBmDLlpW/JDkom21Rg/KtzDKPm4Sm3eKbvis
	+Pl9NmaSDAFo48nKsxxKCsqDAQcEzs/SxqSJ50vOMJvsqsfqInqt63asaRoQQNeQrlMCdRq0I0Htz
	VFmz+SOqaWejvodn94aMJKWpLcLU4GWO+JZdB6b7u5JJ3V2JgF2FOY9LtidbCxts6cz3NlAEOfng9
	3pWIsCU5M7PCOOFfcIFJJDGX0PEsp7lfwVkI3DfRJPtc7H7qF8NAPSUqqMPn+AYjNBc8BgiOxasmr
	W6As9GSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8Ikn-0000000HaiN-1kdE;
	Sun, 20 Sep 2026 14:42:53 +0000
Received: from out-66.mta1.migadu.com ([95.215.58.66] helo=mta1.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8Ikk-0000000Hahd-2FAK
	for linux-arm-kernel@lists.infradead.org;
	Sun, 20 Sep 2026 14:42:51 +0000
X-Envelope-To: linux-arm-kernel@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=1fWy5x8YUx7dVmmzZ+KhqPpbDf3gNkSDlagAqcQGkLg=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1789915367; v=1; x=1790520167;
 b=JMZwqzR87SV9DWrG7h5kbXK7ciiQyMI9GOHYxxZPx1fhSBJuZSL2YCqxZXpbv8+R6RTil9E2
 AKVksDhKkGBodkhZoSh95rG3mNtv9r1tvSB1vpDxVlYK9XAKSwcIhJmL3o7S/8SwdszRcubG58x
 twVUCm5Y1V3l1DhTW42AgIUw=
X-Envelope-To: linux-arm-kernel@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id cbdfd66f6be77372;
	Sun, 20 Sep 2026 14:42:47 +0000
X-Mizu-Trace-ID: cbdfd66f6be77372
X-Migadu-Flow: FLOW_OUT
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-5b8c42da963so5596e87.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 20 Sep 2026 07:42:47 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBwMx6C7Fwp4T1Pc9Bl6kk+wilVlFmrR91plASbi6zl4ZsGEo3tuQNvK2oNN+rCL9zWWXuJbg3yxXdIi51bJ7dPo@lists.infradead.org
X-Gm-Message-State: AFuF++kvov4iJBYpyb08nnn2YTGZMc6T8/pelWmZ9ukYpNz3ed2XBoTK
	epspmPpJ8mUPYHQ48w0G1eIwyzhU8kzSB8wP2cFy3oSDWCBzE9UMPCPdPN33deQUIO34GcJRSEf
	IjLBPhEk23qt792WEBRZayJ3rOt6FmOKqecMxePu4
X-Received: by 2002:a05:6512:3e08:b0:5b8:9e63:dfb4 with SMTP id
 2adb3069b0e04-5b8c751430amr119379e87.14.1789915366405; Sun, 20 Sep 2026
 07:42:46 -0700 (PDT)
MIME-Version: 1.0
References: <20260919123150.3283606-1-maz@kernel.org> <20260919123150.3283606-5-maz@kernel.org>
In-Reply-To: <20260919123150.3283606-5-maz@kernel.org>
From: Fuad Tabba <fuad.tabba@linux.dev>
Date: Sun, 20 Sep 2026 15:42:10 +0100
X-Gmail-Original-Message-ID: <CA+EHjTxDmJe=3zEoeFFdwW6yhjGiQRUQJOZpanFNd0wKcR4CBA@mail.gmail.com>
X-Gm-Features: AcwNN1XruSsA5ybOhhOfItuSbQn7x4kogACoIWKSQ7hmigHvGBaPd17FPkfXrfw
Message-ID: <CA+EHjTxDmJe=3zEoeFFdwW6yhjGiQRUQJOZpanFNd0wKcR4CBA@mail.gmail.com>
Subject: Re: [PATCH 4/4] KVM: arm64: vgic-v5: Correctly handle host ISTE
 __le32 conversion
To: Marc Zyngier <maz@kernel.org>
Cc: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	Steffen Eiden <seiden@linux.ibm.com>, Joey Gouly <joey.gouly@arm.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Oliver Upton <oupton@kernel.org>, 
	Zenghui Yu <yuzenghui@huawei.com>, Sascha Bischoff <sascha.bischoff@arm.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260920_074250_719520_29A1DB27 
X-CRM114-Status: UNSURE (   8.84  )
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

Hi Marc,

On Sat, 19 Sep 2026 13:31:50 +0100, Marc Zyngier <maz@kernel.org> wrote:
[...]
> diff --git a/arch/arm64/kvm/vgic/vgic-v5-tables.c b/arch/arm64/kvm/vgic/vgic-v5-tables.c
[...]
> @@ -1466,8 +1465,9 @@ static int vgic_v5_save_linear_ist(const struct vgic_v5_ist_desc *ist,
>
>          for (index = 0; index < nr_entries; index++) {
>                  __le32 *h_iste_addr = ist->base + index * ist->iste_size;
> +                u32 h_iste;
>
> -                h_iste = READ_ONCE(*h_iste_addr);
> +                h_iste = le32_to_cpu(READ_ONCE(*h_iste_addr));
>                  ret = put_user(h_iste, uaddr);

arm-vgic-v5.rst documents the IST buffers as little-endian entries,
which is what the raw __le32 copy gave userspace. With le32_to_cpu()
here a BE host would hand out native-endian entries instead. Making
uaddr a __le32 __user * (it's a u32 __user * today) keeps the
documented format, and sparse is clean with it too.

With that:

Reviewed-by: Fuad Tabba <fuad.tabba@linux.dev>

Cheers,
/fuad

