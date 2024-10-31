Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0303D767D6
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 31 Oct 2024 14:47:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2dlgmPQjrWN8bcG64Fgx2fujRr7yOykhTLvlfDSXZU4=; b=m+qjgU6AIuQRJPSqiQjAR1E39P
	ChCawAaGFG/o9aW/Q5Y9Ep7chaUUHcjD7PEnPUEbSQS4ZLFhOVJFR1/9iw67465bN+jQLGvx0kgYz
	OL0/J+pS27WCYBMZZg4m5IogYhAVEXoH7dkXpybFx7W7Lryf0MeSxkWS4ZslXQkqV7Hc/3Bs/5pnI
	WaLmVGo63lA67fewLDGxJhKDRmuKpjwTU8QP1bGkpbzu0boGzJmlh00OIXdU92LlQ9Cmx+OXhGntJ
	Cd/pg2Yp4xtJTlBxkAVRhdcpWDzzpoHaFmbQVgPnkRpJaknXqLoIptQ+re0DvDmMgeBlzC0CHl23/
	tegMeqWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t6WS2-00000003rTN-10iJ;
	Thu, 31 Oct 2024 14:47:06 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t6WMw-00000003qSg-1WQ1
	for linux-arm-kernel@lists.infradead.org;
	Thu, 31 Oct 2024 14:41:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1730385709;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=2dlgmPQjrWN8bcG64Fgx2fujRr7yOykhTLvlfDSXZU4=;
	b=gHg5hZvtDcsQMj8nDqVk+t/4Hxzzm5s1ArmOkr/fWIlUt0bW/SWM4f29cP8XxaKYcApbjo
	VAKrDDB+9AMVQWU6Wy3x4wQuohUsrRwbkOiDKHCKiJHqPArzUBUbrAlf4byDPUol55zhVN
	BDScEhvDF43jTE5QWgSyBOdpC2K+Mng=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-249-igtiETPqOx6TKyMZY8jZLg-1; Thu, 31 Oct 2024 10:41:47 -0400
X-MC-Unique: igtiETPqOx6TKyMZY8jZLg-1
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-37d4922d8c7so490829f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 31 Oct 2024 07:41:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730385706; x=1730990506;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2dlgmPQjrWN8bcG64Fgx2fujRr7yOykhTLvlfDSXZU4=;
        b=OQaqxJBsa34x2jicFMQngrIgPpvUHr8iw9Mmc7NpTSrIV1e2h3Hn8l0G4QtWqB/omy
         dqkSe2tTzXU167UHxsggE+Il3RVauT5PLKfihet5GRYnasw2Tg8IkQN2zzAFhf9RXZYL
         L9nWuFFqtx7jxer+chlWcIE8MwjlYoSX/vkyP6CnftZSDvEWAzZ8Uq0wD/Z0T3rkquj+
         FEM7i6tprzdzAHF7Sz14IfRcgOV8MlEnSpJhEnC2wqKf+3OMLyOJX4hRf2KmamSilf0k
         +M9QEvprfLmu6fQbTTGPsuOAPVCS2K/lWRDJUfrEnnNKOj6Uq6MdX6575Rdc+NGtgeJH
         gNig==
X-Forwarded-Encrypted: i=1; AJvYcCU8uTVCsep1YxlWWbcxx0ZyCwhJsYVbuAl+XVed2IsnWUQaq4Yc/YjNK4X+01W9AbgL95VoCptmS5ZDrfOHZBG/@lists.infradead.org
X-Gm-Message-State: AOJu0YwvsE5ASLWpmIFDtalKj8pMcvVhkYy29Qc0Vob324BAapOXruS9
	NlSpijWy1UZPxMr9IgjsQ2t8v7nmHKp04U/ydYfTZpN90NLKUIkk9lSxOAN2eEvjAlLKLQilpVN
	3oFEZ9LOd/TjXqCdqZGgIeAKZbnkABM/yDzZWUbWnBOB4X9yHUZqc3QPds2TPXQPEa8hN50ea
X-Received: by 2002:a5d:6d0e:0:b0:37c:cc60:2c63 with SMTP id ffacd0b85a97d-381c7a3a23dmr216424f8f.5.1730385706484;
        Thu, 31 Oct 2024 07:41:46 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFg8FMucp/9+qkpBZFRMIEgFHrJyFQGjPuPNs4cDJVO5fafRU341aNOfiA7iUPsBELpgYtCyQ==
X-Received: by 2002:a5d:6d0e:0:b0:37c:cc60:2c63 with SMTP id ffacd0b85a97d-381c7a3a23dmr216386f8f.5.1730385706081;
        Thu, 31 Oct 2024 07:41:46 -0700 (PDT)
Received: from [192.168.88.248] (146-241-44-112.dyn.eolo.it. [146.241.44.112])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-381c116b11esm2278221f8f.104.2024.10.31.07.41.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 31 Oct 2024 07:41:45 -0700 (PDT)
Message-ID: <3e443eb4-d15f-45ff-8b41-a8215fb4032b@redhat.com>
Date: Thu, 31 Oct 2024 15:41:43 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v2 4/4] selftests: hsr: Add test for VLAN
To: MD Danish Anwar <danishanwar@ti.com>, geliang@kernel.org,
 liuhangbin@gmail.com, dan.carpenter@linaro.org, jiri@resnulli.us,
 n.zhandarovich@fintech.ru, aleksander.lobakin@intel.com, lukma@denx.de,
 horms@kernel.org, jan.kiszka@siemens.com, diogo.ivo@siemens.com,
 shuah@kernel.org, kuba@kernel.org, edumazet@google.com, davem@davemloft.net,
 andrew+netdev@lunn.ch
Cc: linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org,
 netdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org, srk@ti.com,
 Vignesh Raghavendra <vigneshr@ti.com>, Roger Quadros <rogerq@kernel.org>,
 m-malladi@ti.com
References: <20241024103056.3201071-1-danishanwar@ti.com>
 <20241024103056.3201071-5-danishanwar@ti.com>
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <20241024103056.3201071-5-danishanwar@ti.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241031_074150_558757_01F9CD03 
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

On 10/24/24 12:30, MD Danish Anwar wrote:
> @@ -183,9 +232,21 @@ trap cleanup_all_ns EXIT
>  setup_hsr_interfaces 0
>  do_complete_ping_test
>  
> +# Run VLAN Test
> +if $vlan; then
> +	setup_vlan_interfaces
> +	hsr_vlan_ping
> +fi
> +
>  setup_ns ns1 ns2 ns3
>  
>  setup_hsr_interfaces 1
>  do_complete_ping_test
>  
> +# Run VLAN Test
> +if $vlan; then
> +	setup_vlan_interfaces
> +	hsr_vlan_ping
> +fi

The new tests should be enabled by default. Indeed ideally the test
script should be able to run successfully on kernel not supporting such
feature; you could cope with that looking for the hsr exposed feature
and skipping the vlan test when the relevant feature is not present.

Cheers,

Paolo


