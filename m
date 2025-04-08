Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47472C3600C
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Apr 2025 08:07:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LJWmN0ibsu4tQTyghfK7yZm3Bp44GAS3lqX86jPaL5U=; b=KZyWq3xO333f+JFuNi62zT6zAr
	hFzIXSlvM2uPwWPWro9vaIt0KfZuVe3JOxtJvwRs0gRuc8dQQdck0fFYB0vF2XJ/hZZUfq9mrbipV
	SZwZh1alOTjaCQG1Hbm/VhzKZv264Jq1LJJzbFy/fbjvabcOWlW6jWjk+/BNujX32nuUbBEgd/8wP
	RzhCcowulafYuL/DWgDAbim0uEw2VekvvbEJODdC8zZXQeR2T4eQWbNjby9DzZXlqw04vlTXzKVv8
	moats1jVOnXK33bCimPsHDlPfjVq2h9xnEDa/CLm5IWLDjwwAAqNquMC7dB8vEaN/Xe5YFIRxcA4q
	lX4Ah6wg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u23zQ-00000003BfB-22ED;
	Tue, 08 Apr 2025 08:07:24 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u23xd-00000003BMy-4Azi
	for linux-arm-kernel@lists.infradead.org;
	Tue, 08 Apr 2025 08:05:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1744099533;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=LJWmN0ibsu4tQTyghfK7yZm3Bp44GAS3lqX86jPaL5U=;
	b=c3tfLg/3nnFPk6D2oWrnEVTHhbil8P4wAdazmMUmk/5D6mrHihOEy5nNCzOYB39Lieqgd6
	t5CLAA3ed4xDVBld/ElzBc9FY+Ou8qJHL9jAy0Ab9mcW9jHzq5g6oOc9BJgz0R9hpHdQ2W
	ln1X3ZZ5POhvTbnqJrkk4cpS3x9WPPI=
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com
 [209.85.214.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-639-AQPTszXYMTW5loYABWRX7A-1; Tue, 08 Apr 2025 04:05:29 -0400
X-MC-Unique: AQPTszXYMTW5loYABWRX7A-1
X-Mimecast-MFC-AGG-ID: AQPTszXYMTW5loYABWRX7A_1744099529
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-225429696a9so76264975ad.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 08 Apr 2025 01:05:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744099528; x=1744704328;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LJWmN0ibsu4tQTyghfK7yZm3Bp44GAS3lqX86jPaL5U=;
        b=Jex3KzQHuOmNh7wUsRT2w9NvGOo4d9JcLhMRveZu8LMihLJjxE3yywoZfkoJb9fGot
         qKLyLIZVimH1tt5JLRk4b/H6vTJn0nduI9K3yQXQ5LM2H2KfnAsoMJ1JgPtXkarheCrV
         I8P5DtT1uH08uetgNuSv8Lcsr/PcHXDbIAaYAj9oSaudjBjlFkb3ILOGzPDc3kqUWw4o
         t/aglWuT5igEvCml3Icw2GlC/BGGPeBw27RzoOWzILdD1wmk1/rh+ww+lV+36BYxLGi9
         dbBC97rILU7XslJq3OrqsDqbdrh9UzJIyUqiquaLFeIQ5Nkxl5kweFK1WcUM1cDLWljL
         FL+A==
X-Forwarded-Encrypted: i=1; AJvYcCWde274BEBxQ5GC6HPQXfgdzq5TxvpgT1aGgn7HqMHE/jEVM3LpPp8dbBQruyGZ2r/Ue34g4H6AkhTTe3+xNocX@lists.infradead.org
X-Gm-Message-State: AOJu0YxBtrbMIvYG3p8Oyl3+VdnEyQ56/V/oZFdnmkw539TlC8FAZe6B
	E8IIkP2D+bCKS6oR4AtUcXpS5uxSBRCJ24hMl3zjlc4S/ZOy/d7QgpV0nw7+eDRJnFiSeSEDsF3
	924/MdyVMyCARmXtwPr1mjqgoBF0QNxWAEmoyMJ66Qs0pkbso+Dqd1m8RjEDXH9iJoFyvYu4/IW
	xlAzqRM0Yx0dnU3s6YHvqNMV+hWY7WAEz2Ntnt/o7APhFKJL8=
X-Gm-Gg: ASbGncu4jxLytqeUlI2t3iaW9FhxIiubLbTpixfOaXJQEeBkWH6y/AxdSL2M7DppWTT
	AmkAGmVEI6xWGOmZCpCvtH65VYgWiE9PjCwqUvirAluOaChdPyNycxqK0IbXUd//xm9wzOgCOVd
	AKbPZctqtOcqWaUlNGdJSP01Y9/nRZ
X-Received: by 2002:a17:902:ef46:b0:224:1acc:14db with SMTP id d9443c01a7336-22a8a065a92mr216812305ad.29.1744099528586;
        Tue, 08 Apr 2025 01:05:28 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHxt6JXSAKwtzMhURmlwXUeHTpsebb4IGewHFs0bIb9p2YTTOJJynYQGNzCWOOkQfdVElwjfxkR47pQbpLQyHc=
X-Received: by 2002:a17:902:ef46:b0:224:1acc:14db with SMTP id
 d9443c01a7336-22a8a065a92mr216812095ad.29.1744099528326; Tue, 08 Apr 2025
 01:05:28 -0700 (PDT)
MIME-Version: 1.0
References: <20250407-airoha-hw-rx-ratelimit-v1-1-917d092d56fd@kernel.org>
In-Reply-To: <20250407-airoha-hw-rx-ratelimit-v1-1-917d092d56fd@kernel.org>
From: Davide Caratti <dcaratti@redhat.com>
Date: Tue, 8 Apr 2025 10:05:17 +0200
X-Gm-Features: ATxdqUEwnkKiKF8g-PFRZFZFOa_vl1d4t-NasxHHhEMxF0J2LDMD5D2Hq6aL9t8
Message-ID: <CAKa-r6tNa+Ltxb61g6E3h66pxW0XTDb76T6Wc2XMJCu8xuAvPg@mail.gmail.com>
Subject: Re: [PATCH net-next] net: airoha: Add matchall filter offload support
To: Lorenzo Bianconi <lorenzo@kernel.org>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	netdev@vger.kernel.org
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: fV0AoH556enGnsZaywpRyFbALf-vFNienIF2JY-U2A0_1744099529
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250408_010534_103172_32305408 
X-CRM114-Status: GOOD (  12.31  )
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

hello Lorenzo, thanks for this patch!

On Mon, Apr 7, 2025 at 10:04=E2=80=AFPM Lorenzo Bianconi <lorenzo@kernel.or=
g> wrote:
>
> Introduce tc matchall filter offload support in airoha_eth driver.
> Matchall hw filter is used to implement hw rate policing via tc action
> police:
>
> $tc qdisc add dev eth0 handle ffff: ingress
> $tc filter add dev eth0 parent ffff: matchall action police \
>  rate 100mbit burst 1000k drop
>
> Curennet implementation supports just drop/accept as exceed/notexceed
> actions. Moreover, rate and burst are the only supported configuration
> parameters.
>
> Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>

[...]

> +
> +       if (act->police.peakrate_bytes_ps || act->police.avrate ||
> +           act->police.overhead) {
> +               NL_SET_ERR_MSG_MOD(f->common.extack,
> +                                  "peakrate/avrate/overhead not supporte=
d");
> +               return -EOPNOTSUPP;
> +       }

I think the driver should also validate the so-called "mtu policing"
parameter. E.g, configuring it in the hardware if it has non-zero
value in act->police, or alternatively reject offloading of police
rules where act->police.mtu is non-zero (like done in the hunk above).
WDYT?
--=20
davide


