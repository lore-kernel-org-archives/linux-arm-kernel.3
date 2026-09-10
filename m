Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE244C79FBF
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Sep 2026 16:49:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=trXMroz5mGRhnvsqxF0GR3hfGr2ispYPFG7I9RaBuY8=; b=gxp+Q4nGD/nm+QEYcuFVpLoHf8
	ZGUNNimS4LrB6m4XO6DuM4OYa92bPJIyKlqZtwVTOoYOeClTiIfgntQFect8b6QZzpugGP0zTviaL
	NX+cbk8YsM7kh75jIzq8h1cHinGZLjUYyU9f4i+mGwSirUtJgF0uuF9ehXGS8yg3Rc2H9cGgnbuxh
	MK64LPLX6C8C3nQ4fhjHjO4kjGoYB6cqjF3+09h8oA9lCYIC2is1QDE28orYrXWEkt06qN3c07O4t
	AOTnIXnt7oKGdRTRBEuy2g0lmEFWJoTljQtAqsGjAbGzFfaDYl/Vl+CwAngMQf7CBJqRygYgD9wNF
	b3GGtSIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4hxm-0000000Ezkl-0Dkq;
	Thu, 10 Sep 2026 16:49:26 +0000
Received: from mail-ed1-x529.google.com ([2a00:1450:4864:20::529])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4hxj-0000000Ezjv-3iYG
	for linux-arm-kernel@lists.infradead.org;
	Thu, 10 Sep 2026 16:49:25 +0000
Received: by mail-ed1-x529.google.com with SMTP id 4fb4d7f45d1cf-6a0de062db5so11274887a12.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 10 Sep 2026 09:49:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=pardini.net; s=google; t=1789058962; x=1789663762; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=trXMroz5mGRhnvsqxF0GR3hfGr2ispYPFG7I9RaBuY8=;
        b=BjUnrmJwx3yuqSsgylSh7jT39phKzGo87E9+CYog8iRmvc+DeruRD5bzBtgtsgij6x
         v9Sicgf6flCjwTK6XFCIoJWmRaHNRmJDxpwxKYdfJecTq3TswjLRzxO0v/MFcINUmpYw
         vxbLhDGa8AvFCixpZMSiYqLccnWSuEPBqDOdqUTJ8lvWa8/LqymW3f+Ka6qTDS1DxifM
         Loo9kYNvNvGC2rNugP1A+UcvTHip6aCT2I6hrX8oWxS6JamP4QsF8mphBRPVV1uwJPCU
         9L9aWjKPAiM+cZzlGe+XE+ppnWrAi/s9WWClDQhgPUKoHuZimD/QZ8oOJ72Y6HOsfd9+
         BKUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789058962; x=1789663762;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=trXMroz5mGRhnvsqxF0GR3hfGr2ispYPFG7I9RaBuY8=;
        b=HwdEysDuWLgQzGYZBz+dhvwlzOMOaXINfPFKu7zY6cUPATgzqpXMdi2kh6xRuRZUN2
         M080U5ltfIyJ95lIumE7uOXMUVH0TnYeMAGlBCzHUnhnPPIfGZPhdz9XeacNl7nwS59q
         i6oDLjzw5e1m7oimpDdPif+N4+dDdPP3ry6rGbjVzIS7u61frNE4z4h28T4UfiwhGiVn
         ck3u7EXtBjz1jINyEzhVycg4vG2zXHC1OGXUfxff1qT45CYnCspyzRIlqAVe0r98k6Sx
         y4XdTYm/SZ/HKgIsf3o5ii7zLH9GchUZIH5w4kqOYr2fZoHSyh2umoA6RicQTH7j6dER
         /pAg==
X-Forwarded-Encrypted: i=1; AKwUvBxl6b3BoIlvszLsVP8BJlSAgnLJoecb5wDjufV8NbBFdyq7/yg+zL84bXHG9DBh79lCdwGOn47wpQ+Ql4v/ewH8@lists.infradead.org
X-Gm-Message-State: AFuF++luTnmLN2jl4qYm9+E1nrOp+dvWpTPr9liSCLeYmjDBZnQBg9Qb
	P7GGmTfB8rq9da80j40tRF2zsOAlgH8ORrcPpz3M/sZ40xPV/MXIAKT8R9MTNHNfcg==
X-Gm-Gg: AYBFou0yo/TzfMcPthxVn7Eq5KinfVqMd0iXfrTmWhsTRO8tcmHfaYntuBUETLGZkgh
	leWoJQHQifWbjPf4nGV+97a+rE9BttT+99B8hpwqCTa5YmOsZFcg7DlvL1vdJwNoZsV9ya309od
	0RoG80XIPhdE9SetOPk90QbEUriP3zSkDP4W7QrnynBdyIDr4/MAjrZSY240vakSDfbEzXcucWY
	OCFWmBBW+B6BrtgHaNYFN5jwG3/+3yyzU2fJwrVNr1h3Tta6jvA5Cv3+pfWKSk0JX7j2la3zNYP
	0ceF8vn8++RxdcrkI7AN/XBUYE1YUt4/m+5lqps1TSEdmyWXAUB1fIMoEfIDQWBVPQwDELDeyYR
	zltU1xkdahXxfemaE3wgcQfrmu4XaqtePWLrTmkofvOq+ZmMTSybX508/uQM2HNjwda2F6p/2Yq
	YdZHu1+ZeLJQFG2AVxswHoD8mXOEvltxXdQ5ezPGSkhoy3sIWAwCDb2B8ExZ9U5sL5a+owOKRCv
	6ARmbnRdpK36Mu6NZu93e4Wws+LH+h77IcKssF7axbP01gDD86O4uSCrkBLCL/ppytdwgL7WNn7
	saB0/t/vRDx3wbzpRDyf6Uja1HoIe8JB0ksJu3ps5/ckfRmt+UxpYmBFzA==
X-Received: by 2002:a05:6402:2b9b:b0:6a9:a3a4:797d with SMTP id 4fb4d7f45d1cf-6a9a3a47b3fmr2194091a12.10.1789058961506;
        Thu, 10 Sep 2026 09:49:21 -0700 (PDT)
Received: from ?IPV6:2a02:a466:4d7a:0:8888:6b72:e1ae:406a? (2a02-a466-4d7a-0-8888-6b72-e1ae-406a.fixed6.kpn.net. [2a02:a466:4d7a:0:8888:6b72:e1ae:406a])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c294682fcfbsm143774066b.16.2026.09.10.09.49.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 10 Sep 2026 09:49:20 -0700 (PDT)
Message-ID: <08011075-364c-4520-857e-cd1acf955b53@pardini.net>
Date: Thu, 10 Sep 2026 18:49:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/4] nvmem: Derive Rockchip MAC addresses from the OTP
 CPU ID
To: Alexey Charkov <alchark@flipper.net>,
 Srinivas Kandagatla <srini@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>,
 Michael Walle <michael@walle.cc>, Miquel Raynal <miquel.raynal@bootlin.com>,
 Finley Xiao <finley.xiao@rock-chips.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Ricardo Pardini <ricardo@pardini.net>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 stable@vger.kernel.org
References: <20260902-rk3576-otp-cpuid-mac-v2-0-e4b7fe2ab13f@flipper.net>
Content-Language: en-US
From: Ricardo Pardini <ricardo@pardini.net>
In-Reply-To: <20260902-rk3576-otp-cpuid-mac-v2-0-e4b7fe2ab13f@flipper.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260910_094923_960718_809B484E 
X-CRM114-Status: GOOD (  22.53  )
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

On 02/09/2026 15:07, Alexey Charkov wrote:
> Rockchip SoCs are shipped with a unique CPU ID in their internal OTP
> memory, and Rockchip bootloaders use it to give boards which have no
> dedicated storage for a MAC address a stable one anyway: they hash the CPU
> ID and patch the resulting addresses into the device tree they hand over.
> 
> Kernels started without that fixup, e.g. straight from the SPL in Falcon
> mode or by any other loader which does not implement Rockchip's derivation,
> fall back to random MAC addresses which change on every boot.
> 
> Formalize the derivation in the DT binding and add a Linux kernel driver
> implementing it, so that a Linux image can use the same stable addresses
> regardless of the boot flow.
> 
> Only RK3576 is wired up here, that being the SoC I can test on. Other
> Rockchip SoCs keep the same CPU ID at a different OTP offset - 0x7 rather
> than 0xa on RK3588, for instance - which makes supporting them a two-line
> addition to the driver's match table plus the layout node.
Hi Alexey,

I went off trying this on RK3588 and - exactly like you said - it 
translates perfectly there, just with a different offset. Thanks!

Not content, I went for RK356x as well - and that revealed what I think 
is a snag.

Both RK3576 and RK3588 currently describe their fixed cells as direct 
children of the OTP node -- turns out that is the "legacy" way, which 
works due to 'add_legacy_fixed_of_cells'.

But RK356x/3528/3562, done more recently [1], use a single 
'fixed-layout' with child cells; and there can only ever be one layout, 
so we wouldn't be able to use the new layout for those.

I imagine one way around it would be to allow such fixed cells also 
under the new layout, by delegating to 'nvmem_add_cells_from_dt()' and 
adding patternProperties with '$ref: fixed-cell.yaml' in the binding, 
similar to what fixed-layout.yaml does, but I'm unsure that would be a 
good idea?

Either way, thanks for this, it really helps with Falcon mode and edk2; 
I can also use it for the fixed-function RTL8125 PCIe NICs I started 
describing [2] (and will eventually send a v5).

[1] https://lore.kernel.org/all/20260312213019.13965-3-heiko@sntech.de/
[2] 
https://lore.kernel.org/linux-rockchip/20260617-rk3588-dts-rtl-eth-describe-dt-alias-v4-0-2bd38922d129@pardini.net/

mvg,
Ricardo


