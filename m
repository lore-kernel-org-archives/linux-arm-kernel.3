Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD6EFD10395
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 26 Nov 2025 08:49:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:Subject
	:Cc:MIME-Version:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LRFH/e+EPYkQeoBclAzTE/ypDqMfPq55IAr+yoWm76s=; b=LfabP2qKqpbdCu
	PJQmkV42fUle/YhCSjdgqGEnM0qq34sPjlbe62UFNSgiYn1/fthslB7MoYTPUDBBYEOdOd/x0+Zcv
	qtYQyijF/uzX/alxQ2Q9ZtPHd3t7Te1yR2nxQH8DAE/gIy/9OaRJhh4jTgzbEIkZS0awJgBijM9Mn
	z8YHVJ9g42mjcQtRdbnFmETlLqJz6rhJZsYZ58W2k+CwUtMT9sK2b62L+2+NQqndkdOn4VKvuJ9ai
	VWe/1F7d5v/dlekO5Y8nYld4J8vfJhX90mbo1M+IiaObQmRbwsUfgSoHyKmW5kKJY0f9SeD/enHOs
	I4kp2e8Tev2K73CmYoew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOBDO-0000000Ee58-14yE;
	Wed, 26 Nov 2025 08:49:30 +0000
Received: from slateblue.cherry.relay.mailchannels.net ([23.83.223.168])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOBDL-0000000Ee4T-1NyA;
	Wed, 26 Nov 2025 08:49:29 +0000
X-Sender-Id: hostingeremail|x-authuser|michael.opdenacker@rootcommit.com
Received: from relay.mailchannels.net (localhost [127.0.0.1])
	by relay.mailchannels.net (Postfix) with ESMTP id 7A578441E6C;
	Wed, 26 Nov 2025 08:49:22 +0000 (UTC)
Received: from de-fra-smtpout3.hostinger.io (trex-green-7.trex.outbound.svc.cluster.local [100.96.77.42])
	(Authenticated sender: hostingeremail)
	by relay.mailchannels.net (Postfix) with ESMTPA id 593ED441145;
	Wed, 26 Nov 2025 08:49:20 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; d=mailchannels.net; s=arc-2022; cv=none;
	t=1764146962;
	b=3c6GjMIYiw+vY+FoBKHU2nlqtdZzbTL004Q/fu9Ax7Z2rRTILGN2oR/4hXriSmnhLg6vfL
	FHPfh60BE/uPH/Y7gyuZV1k4g892397WsGGodxe76HMox4SHVKKkJMDGmSZM04f1PSYc7o
	Rd2ApPASfkDkuWe+5uF97kQv9QB81blOuLupXDLSpKzHG0h1EcwOghlfhrXuys26D//b3p
	Gxe6z6SCp2bBjs0W6mihJhzEzkA2b56ix/f1gs9eD5UQpIglIqMd2AAWCNQZii0wPYYSGL
	tBlkU4GJuR71LklhS0KKewa+Sp5CGNK2bGweP8bhfDZJ25jFa8LuF7A5uyFgBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mailchannels.net;
	s=arc-2022; t=1764146962;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:dkim-signature;
	bh=LRFH/e+EPYkQeoBclAzTE/ypDqMfPq55IAr+yoWm76s=;
	b=9kJx9uX77hmyGUABE1xGLuSSar7r1QNgTqwPNxFWAMqNA5teIGOxJ3Q2nefJ+Tr84SSQpC
	/Xmr3gvm4f6fGN29F3S6pR1wi1K05oKlWVtjcJLwNSoHgI3w/cV7gnSK/mSuMc29tVCASA
	7XHTVuNEW6Ie3hOYOvzLqSoNlfndLUfDEV2pr+bLbicGGne2AB7bYxZmKQTmvrZwLYlZqy
	Xk8eIK7Is0IAt1pCrpG332/yLDm5bpbkOyyDjBpB6YAuebuhT7Kh9fR+16FzPdz4qozAQ2
	qeBjp76/3/FKuqIoZo/+OkhTZ8VQ7+2CyQkVVaiSA+1bRUweLKumJlpPWxRj+w==
ARC-Authentication-Results: i=1;
	rspamd-7bff5db4cb-6gxzj;
	auth=pass smtp.auth=hostingeremail
 smtp.mailfrom=michael.opdenacker@rootcommit.com
X-Sender-Id: hostingeremail|x-authuser|michael.opdenacker@rootcommit.com
X-MC-Relay: Neutral
X-MailChannels-SenderId: hostingeremail|x-authuser|michael.opdenacker@rootcommit.com
X-MailChannels-Auth-Id: hostingeremail
X-Stretch-Harbor: 5ca944300a683b5f_1764146962264_120106243
X-MC-Loop-Signature: 1764146962264:3432847594
X-MC-Ingress-Time: 1764146962264
Received: from de-fra-smtpout3.hostinger.io (de-fra-smtpout3.hostinger.io
 [148.222.55.15])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384)
	by 100.96.77.42 (trex/7.1.3);
	Wed, 26 Nov 2025 08:49:22 +0000
Received: from [IPV6:2001:861:4450:d360:9d39:ba01:31fa:9155] (unknown [IPv6:2001:861:4450:d360:9d39:ba01:31fa:9155])
	(Authenticated sender: michael.opdenacker@rootcommit.com)
	by smtp.hostinger.com (smtp.hostinger.com) with ESMTPSA id 4dGYC221Zkz3x6d;
	Wed, 26 Nov 2025 08:49:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=rootcommit.com;
	s=hostingermail-a; t=1764146958;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=LRFH/e+EPYkQeoBclAzTE/ypDqMfPq55IAr+yoWm76s=;
	b=X6jBVttoL3yARGLzIsFqnVB5ahkH4vBfjFRADu/XlO7tZcd8jMS9nwhERpwYkOSpudvedq
	j6wDwpqztA4o2AsvLyZqhMB7gVpP/b8P/m6N1A8wNIOQ0MvRyyhNfU9k3tgjtjcVGB8xug
	wNo2/uqFM00hYcx5kexi7tb3vvewLOL+O2FlJgK/QbpCcqv7yeDxlqNLwQpWYCLL6KVIvh
	pBZj/7BjNS94pJODh0bQDigsqpeLSOcfY62wPsdcF8p4EqEA/nNmxcTf9w+juvYOjbUfWo
	CsrfWrA6VtcQ/hqkzXgYN19YuzuhIjQInBHLPgJyXUR3L1ZTUCp2xxdqGdAt0A==
Message-ID: <45aac7ef-a5dc-4e93-bb11-30bb88259974@rootcommit.com>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: michael.opdenacker@rootcommit.com, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "linux-rockchip@lists.infradead.org" <linux-rockchip@lists.infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] arm64: dts: rockchip: Enable i2c2 on Orange Pi 3B
To: Jonas Karlman <jonas@kwiboo.se>, Heiko Stuebner <heiko@sntech.de>
References: <20251120-orangepi3-enable-i2c2-v1-1-2e023a74012a@rootcommit.com>
 <d66f81e4-9d9f-4df8-916b-e6f68c85d813@kwiboo.se>
Content-Language: en-US, fr
From: Michael Opdenacker <michael.opdenacker@rootcommit.com>
Organization: Root Commit
In-Reply-To: <d66f81e4-9d9f-4df8-916b-e6f68c85d813@kwiboo.se>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Date: Wed, 26 Nov 2025 08:49:16 +0000 (UTC)
X-CM-Analysis: v=2.4 cv=ALriHGRn c=1 sm=1 tr=0 ts=6926bf0e a=YaLPeadj3FvY5eBQhwgDrg==:617 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=5dAzR5NRAAAA:8 a=d70CFdQeAAAA:8 a=Lmt_ZpWL_zpAlULcO8oA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=ZKAZAlVgJm32z6MX8p4a:22 a=NcxpMcIZDGm-g932nG_k:22
X-CM-Envelope: MS4xfPRGcvVSXLekHcmNkq6vTuUkhR318co5HtaTHzpmaZ6VNLzeJ0uYr82ojz55048VLXFP+jax2UkHjwRaJWbDiMc+s/jbRrKIUkHnAqZr8oEUoaeGJxtd ZWcSxrHYEY/+2T4GcuyRaEaIcM/+I7Niz2TaeTFiQaoDx/D25Cy37vrrGb/4ytyUvkZbwOcbZPMc+OUJHoMwzZyoayOFqPMJqaRu11GDG/i+4wqQQ3+dq+Rx V3ALG0xjoRffADbWQ9aZ6/diCTQNh7qMCHQ7SUhG2Euggy0NATI/8IeNUTGZAB7iBSP3YztxVjzHN5sTqlNMscxErpvI4DZVHqdV7LkEAO23EVsY9uOUe5i1 69BDFS8Yt3kQuPPn9FryKyrFXwtf9/akntyjMXof76h3ZHIU4GssATbDtQLqgJKQ1sT/n8rS+NIOtetmzLDC5zyye37PkywqS0E7BH7PLUo15tc1/Gv1Dh6w zRqTITaT1jpbZHyZuYLKjLQrGpa6OhLcZtnrfW0kv9quZo5cEGAhOCWkG5Bc2odrKr1GSYxtKvKCwFBNJ2POfw2EcJp0EIT1KmVLDLAwCrSxcZ7kba+hbGtr FJIOZiQWwa9iFuSq7SZxJdbSSVWd1otA+R/Lb4ABOW3b+NCXrFa/avrDMkM5dOMFD/Y=
X-AuthUser: michael.opdenacker@rootcommit.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251126_004927_687264_B9975876 
X-CRM114-Status: GOOD (  20.33  )
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

Hi Jonas

Thanks for the review!

On 11/26/25 09:40, Jonas Karlman wrote:
> Hi Michael,
>
> On 11/20/2025 8:00 PM, Michael Opdenacker wrote:
>> Enable the "i2c2" bus on header pins 3 (I2C_SDA_M1)
>> and 5 (I2C2_SCL_M1) of the Orange Pi 3B board.
>>
>> As documented on http://www.orangepi.org/img/pi3b/0719-pi3b-19.png
>> such pins are the only ones offering I2C functionality
>> without conflicting with other SoC blocks.
> This is strictly not true, these pins are by default used as GPIO, this
> patch change them to use the I2C2 func, something that should normally
> be enabled in an overlay.
>
> Functions for these pins:
>
> 	func 0		func 1
>
> 	GPIO4_B4_d	I2C2_SDA_M1
> 	GPIO4_B5_d	I2C2_SCL_M1


Correct. My idea was that GPIOs are easy to get on other pins, and I 
found that I2C2 on such pins would be a convenient default.

>
>> Signed-off-by: Michael Opdenacker <michael.opdenacker@rootcommit.com>
>> ---
>>   arch/arm64/boot/dts/rockchip/rk3566-orangepi-3b.dtsi | 5 +++++
>>   1 file changed, 5 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/rockchip/rk3566-orangepi-3b.dtsi b/arch/arm64/boot/dts/rockchip/rk3566-orangepi-3b.dtsi
>> index d539570f531e..e2f0ccc6dbe7 100644
>> --- a/arch/arm64/boot/dts/rockchip/rk3566-orangepi-3b.dtsi
>> +++ b/arch/arm64/boot/dts/rockchip/rk3566-orangepi-3b.dtsi
>> @@ -435,6 +435,11 @@ regulator-state-mem {
>>   	};
>>   };
>>   
>> +&i2c2 {
>> +	pinctrl-0 = <&i2c2m1_xfer>;
> pinctrl-names should also be added here.


Actually, the "pinctrl-names" property is already available in the 
definition of i2c2. That's why I didn't add it again.

>
>> +	status = "okay";
> As mentioned above, this should be enabled in an DT overlay not in the
> board DT.

I don't mind if my patch is removed, no hard feelings :)

BTW, is there a convenient location for sharing overlays like these? 
Some overlays are sometimes tricky to develop, and sharing them with 
others is useful for the community.  I guess the question was asked 
before, but I don't know its answer :)

Thanks again
Cheers
Michael.

-- 
Michael Opdenacker
Root Commit
Yocto Project and OpenEmbedded Training course - Learn by doing:
https://rootcommit.com/training/yocto/


