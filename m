Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E4FDCA5FED
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  6 Oct 2026 13:56:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:References:In-Reply-To:Subject:CC:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Id6lH5GTy+yyaEPTm6FcZZ7BLsleqqnI80GvEmpDvAs=; b=dXsgso7Xwzpc6RW4tJIbrqYHC8
	iwKiDDEPAAMP4BUs3EwXRK0zi+ibsIZCIG86es5RPyo+ggD5qfB4gGSuIw43mWMGzjDkJ+DIlLwg2
	n/1NpKJrcZVCfjV2Tv11vwwSkXmMWVhpRYSiMe/jC15wT7NsgkUlHdj2LMKSofOexQGSH5oZSplgC
	le5ovS8UZWwyvYD05TZTjOrEH7P3Km+0ipuPAYXudtlTmC8WIrzy6egksVvmXp5zyr3mJyddf7Xly
	0P3rTpr154cyjK4NAnDMRSZH/1YNgQq/nO+1LPUcYKq1DA+GmYtntDzQlfiSNrRUJr3l+XcNoaKlq
	SLra5AjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xE5e7-00000000ug7-1UR1;
	Tue, 06 Oct 2026 13:55:55 +0000
Received: from mail-pj2-x02.google.com ([2607:f8b0:4864:39::2])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xE5e3-00000000ueX-0LFr
	for linux-arm-kernel@lists.infradead.org;
	Tue, 06 Oct 2026 13:55:54 +0000
Received: by mail-pj2-x02.google.com with SMTP id 98e67ed59e1d1-3a854dffb5dso377650a91.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 06 Oct 2026 06:55:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791294950; x=1791899750; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:message-id
         :references:in-reply-to:user-agent:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=Id6lH5GTy+yyaEPTm6FcZZ7BLsleqqnI80GvEmpDvAs=;
        b=l86ygQqkunGOIEv8KN5Ey/Ezwi80Xz3OYEYfBfBAoJdYxzMIgrXyapuC4qZGmLMEim
         0z+lc5PlQRT6O61gwxEwG5pk/5Am4biy1MztbCdeTkS8uYwWxaGz4QwltYYtD2K1V8Ts
         WTD9axiRHqFGvF92AIN0ej+Mp4eNQdqd0qctBnWQmBt/BJIRfeqQoKJii7THvmCld0c8
         7qJPZGLxq+xKy+OyIJQZY0DDq1ng/34cgCHn6W65A0CngXtHy/Lq+tObPmp5pAci+vZq
         7YIdf1kDytdd7V5M5AXwvv8xXnTNWMJj8KaCF9yxM7R4vzA2qWOM1Iz914tR/GpwyuBE
         tNPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791294950; x=1791899750;
        h=content-transfer-encoding:content-type:mime-version:message-id
         :references:in-reply-to:user-agent:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Id6lH5GTy+yyaEPTm6FcZZ7BLsleqqnI80GvEmpDvAs=;
        b=GFOtjFrFaNGcZREaegif7diVuEqq0giB5sHJyyjW5/CoZtyoXZNSRaTP7Zg7T8XrWh
         yMxP1w9NHfBYrzliXVHTP2kGt1yUHRy3zxn+3FP79erZEbP4WI4LJT2QzwtRvL+tf1MV
         E/NPB4D7o4n2sbBnNhj6rXJciN3pH9Q3VcdPvBHOcuTPPCDgCKigQSNpmbLOefKIJ9I6
         7+OH5NsAE1urKQJLlNND1GcUBLTMqXJHMZ3ujqJN/aDCOB5D7Tw4gQy/m3zxzu/vqwd3
         xx6d1taXK4D51AQeXUGpGWXqzhdcFO3U5I560HyuThgumGDh0tsn7Ut2knlnak/palma
         pEog==
X-Forwarded-Encrypted: i=1; AKwUvBy9SUgY0g/9nysHhtCQmorDm0UZk0SCv2cP3xCFSdasniSMCw5dHG/8u0w+X7oXuHz3AvUAB7zKLQAbqJtbWDvs@lists.infradead.org
X-Gm-Message-State: AFq9FYITkIIFhDhUWXsqeYYr7r+VBeuopmcNRlgLb7qmLDetwaxJflYa
	uMqtaTavK3VxTN1Nvo5iAfQbSfuzo3aZ4EDhTp4+5O90Vk7EmhdjowWo
X-Gm-Gg: AYBFou3xaQuk+w3spHO3o8sUpcCkHJYbyLXym+YWkxTf/+3my26ar/WIJg2acQASi+t
	aldaZ5nwy509ktUyTFF5LFxiuxIjig4flk0kTTQMwIQWClHrA6kfE+y/oLRkmLeDwspY0/om96A
	LLOhLS63TPWI9tetYvgT3bmTP//ZCYmDcznGaj0vkz4K6QioE/Ay7DZrOd/UW7i7C3vgATbPrm4
	AAauK+mOKNl6CrU50j5Ef07cGncx8sdoUxE+XEnvCMVEDOG9vNp57CaHeBoNyRR3OrUw/pR4TNT
	ujHoL4zGzEkinZp0ucRj5MuFIq1pEJt1sFsEQw59PvzbiBmpz0tqRCjnLRVWf6usR6lzJO4NVuR
	Udjpc0/uiM0nTSJFFADEPXPBVr/ZpBuF5SxAQ0grdFblkfiI24sgdvgLzpUvdgcpu6Fi66/HqLi
	4L1WQ6gR7tzILDOHutg5Ok8Y6cLBqdZ5o1J+KsLUraW8M56jWlH8uhNRLX3ALyIZENTDU=
X-Received: by 2002:a17:90b:4c4e:b0:3a7:eb0:119e with SMTP id 98e67ed59e1d1-3a873554164mr844006a91.21.1791294949932;
        Tue, 06 Oct 2026 06:55:49 -0700 (PDT)
Received: from ehlo.thunderbird.net ([2603:c021:8000:9500:233::14])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-ccf99acacb2sm1189776a12.22.2026.10.06.06.55.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 06 Oct 2026 06:55:49 -0700 (PDT)
Date: Tue, 06 Oct 2026 21:55:41 +0800
From: Coia Prant <coiaprant@gmail.com>
To: Rob Herring <robh@kernel.org>
CC: Jakub Kicinski <kuba@kernel.org>, Andrew Lunn <andrew+netdev@lunn.ch>,
 "David S . Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>,
 Maxime Chevallier <maxime.chevallier@bootlin.com>,
 Heiner Kallweit <hkallweit1@gmail.com>, Russell King <linux@armlinux.org.uk>,
 David Wu <david.wu@rock-chips.com>, netdev@vger.kernel.org,
 linux-rockchip@lists.infradead.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH_net-next_v10_4/6=5D_dt-bindings=3A?=
 =?US-ASCII?Q?_net=3A_rockchip-dwmac=3A_document_pcs-handle?=
User-Agent: K-9 Mail for Android
In-Reply-To: <20261006134802.GA1916640-robh@kernel.org>
References: <20261005223011.1124347-1-coiaprant@gmail.com> <20261005223011.1124347-5-coiaprant@gmail.com> <20261006134802.GA1916640-robh@kernel.org>
Message-ID: <F86D938C-01FF-4398-B4A3-69EF2404FB72@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261006_065553_356956_E73E696C 
X-CRM114-Status: GOOD (  13.46  )
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

On October 6, 2026 9:48:02 PM GMT+08:00, Rob Herring <robh@kernel=2Eorg> wr=
ote:
>On Tue, Oct 06, 2026 at 06:30:06AM +0800, Coia Prant wrote:
>> The Rockchip GMAC binding needs to describe the PCS reference used by
>> the SGMII support added later in this series=2E The property will be
>> parsed by rk_pcs_init(), and a missing phandle fails the probe=2E Add i=
t
>> and require it when phy-mode is "sgmii" on rockchip,rk3568-gmac, the
>> only SoC in this binding that has SGMII support=2E
>>=20
>> Signed-off-by: Coia Prant <coiaprant@gmail=2Ecom>
>> ---
>>  =2E=2E=2E/bindings/net/rockchip-dwmac=2Eyaml           | 18 ++++++++++=
++++++++
>>  1 file changed, 18 insertions(+)
>>=20
>> diff --git a/Documentation/devicetree/bindings/net/rockchip-dwmac=2Eyam=
l b/Documentation/devicetree/bindings/net/rockchip-dwmac=2Eyaml
>> index 80c252845349c=2E=2Ebb7540e838033 100644
>> --- a/Documentation/devicetree/bindings/net/rockchip-dwmac=2Eyaml
>> +++ b/Documentation/devicetree/bindings/net/rockchip-dwmac=2Eyaml
>> @@ -120,6 +120,12 @@ properties:
>>      maximum: 0x7F
>>      default: 0x10
>> =20
>> +  pcs-handle:
>> +    description:
>> +      Specifies a reference to a node representing the PCS device
>> +      connected to this GMAC=2E Required when phy-mode is "sgmii"=2E
>> +    maxItems: 1
>> +
>>    phy-supply:
>>      description: PHY regulator
>> =20
>> @@ -159,6 +165,18 @@ allOf:
>>          clocks:
>>            minItems: 5
>> =20
>> +  - if:
>> +      properties:
>> +        compatible:
>> +          contains:
>> +            const: rockchip,rk3568-gmac
>> +        phy-mode:
>> +          contains:
>> +            const: sgmii
>
>The 'if' will also be true if 'phy-mode' is not present=2E Probably not=
=20
>what you want? You need 'required: [ phy-mode ]'=2E
>
>Rob

Hi Rob,

Right, thanks=2E Without 'required: [ phy-mode ]' the 'if' matches wheneve=
r
the compatible matches, even if phy-mode is absent=2E I'll add it and send
a respin=2E

Thanks,
Coia

