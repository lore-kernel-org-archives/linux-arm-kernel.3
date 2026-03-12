Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 212EDFED2DE
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Mar 2026 07:39:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:References:In-Reply-To:Subject:CC:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NGQFtN65jqZPHApCqR8fT1iH+UK6PY6v44zsFoBO/rU=; b=tpQMkZcu7uYX+CScMElJqZH0wf
	dAMzxMP//svYMQjFDXpbC6w+7IKp5YNm5tFVZG/bjJ7YZ/Jq4LjTt3UupHyzEyEagpLqNTbymzR1A
	qbF8E1LuYsbyh667WmbwhfwLU9n14fv7guKKuCpJaOWDFF+QilAhLfSTOQAa8fmdVAhNC71MJ0F3M
	//EcujDF8zKG7NmBOcbBlLp8psCBJpUfatVCJ5cS6RNVHzgcPLbx6e/Q6lZ9P3XaXmkndZq91BIGD
	l11xNMqMnzGTMxL51aKWGWrrUFZHaqjk8Uo1EL4MpU2qEgb4tSLJqeQerYIl3nbM6SJd1dkT2iocW
	DTaBr/Qg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0adw-0000000DYHP-2Vtg;
	Thu, 12 Mar 2026 07:39:40 +0000
Received: from mxout2.routing.net ([2a03:2900:1:a::b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0adr-0000000DYH0-0ymc;
	Thu, 12 Mar 2026 07:39:39 +0000
Received: from mxbox4.masterlogin.de (unknown [192.168.10.79])
	by mxout2.routing.net (Postfix) with ESMTP id F0A8060244;
	Thu, 12 Mar 2026 07:39:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailerdienst.de;
	s=routing; t=1773301168;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=NGQFtN65jqZPHApCqR8fT1iH+UK6PY6v44zsFoBO/rU=;
	b=WwL+dAsjvDAwGuZnVMJgvw+33+ocdTXcPGYqWKyxtPC9CadFv0zPwLqzVKS/bB3ZOlOMKe
	BOfF0YtZEc+oTSCdBlCB4sqONtWFuk2NhKRDzkCtiyCun1BQOSsPf7F+AnWeb2uxhh8AE5
	Iyoh/UEenaJm83mHOngDw9ZmtPzgZj0=
Received: from ehlo.thunderbird.net (fttx-pool-217.61.148.188.bambit.de [217.61.148.188])
	by mxbox4.masterlogin.de (Postfix) with ESMTPSA id 542F08007E;
	Thu, 12 Mar 2026 07:39:27 +0000 (UTC)
Date: Thu, 12 Mar 2026 08:39:26 +0100
From: Frank Wunderlich <linux@fw-web.de>
To: Laura Nao <laura.nao@collabora.com>
CC: angelogioacchino.delregno@collabora.com, daniel.lezcano@linaro.org,
 daniel@makrotopia.org, frank-w@public-files.de, laura.nao@collabora.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-pm@vger.kernel.org,
 lukasz.luba@arm.com, matthias.bgg@gmail.com, rafael@kernel.org,
 rui.zhang@intel.com
Subject: Re: [PATCH] thermal/drivers/mediatek/lvts: fix mt7987 thermal crash
User-Agent: K-9 Mail for Android
In-Reply-To: <20260311093519.15810-1-laura.nao@collabora.com>
References: <20260309064439.4296-1-linux@fw-web.de> <20260311093519.15810-1-laura.nao@collabora.com>
Message-ID: <8B371D2A-3C7E-4514-B495-9ED58FB60A80@fw-web.de>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Mail-ID: 63a00dde-0e31-408d-98f9-570225501692
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260312_003935_561078_EEB36939 
X-CRM114-Status: GOOD (  10.68  )
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

Am 11=2E M=C3=A4rz 2026 10:35:19 MEZ schrieb Laura Nao <laura=2Enao@collabo=
ra=2Ecom>:
>Hi!
>
>On 3/9/26 07:44, Frank Wunderlich wrote:
>> From: Frank Wunderlich <frank-w@public-files=2Ede>
>>
>> On mt7987 we see a crash due to missing ops entry=2E
>>
>> [    1=2E518540] Internal error: Oops: 0000000096000005 [#1]  SMP
>> =2E=2E=2E
>> [    1=2E564481] pc : lvts_get_temp+0x84/0xc4
>> [    1=2E564492] lr : lvts_get_temp+0x60/0xc4
>> =2E=2E=2E
>> [    1=2E620900] Call trace:
>> [    1=2E631753]  lvts_get_temp+0x84/0xc4 (P)
>> [    1=2E645471]  __thermal_zone_get_temp+0x24/0x11c
>> [    1=2E656502]  __thermal_zone_device_update+0x9c/0x52c
>>
>> Add the new ops member added in 7=2E0-rc1 for mt7987 too=2E
>>
>> Fixes: a4c40559499f ("thermal/drivers/mediatek/lvts: Add platform ops t=
o support alternative conversion logic")
>
>I think the Fixes tag should reference=20
>"thermal/drivers/mediatek/lvts_thermal: Add mt7987 support", as the=20
>commit introducing the ops also updated all existing data structs (seems=
=20
>like mt7987 support landed right after)=2E

Ok, i will change this=2E Have not looked on order how commits
are applied=2E Both commits were new in 7=2E0=2E

>> Signed-off-by: Frank Wunderlich <frank-w@public-files=2Ede>
>> ---
>>  drivers/thermal/mediatek/lvts_thermal=2Ec | 1 +
>>  1 file changed, 1 insertion(+)
>>
>> diff --git a/drivers/thermal/mediatek/lvts_thermal=2Ec b/drivers/therma=
l/mediatek/lvts_thermal=2Ec
>> index a9617d5e0077=2E=2E5671531d4c23 100644
>> --- a/drivers/thermal/mediatek/lvts_thermal=2Ec
>> +++ b/drivers/thermal/mediatek/lvts_thermal=2Ec
>> @@ -2026,6 +2026,7 @@ static const struct lvts_data mt7987_lvts_ap_data=
 =3D {
>>  	=2Etemp_offset	=3D LVTS_COEFF_B_MT7987,
>>  	=2Egt_calib_bit_offset =3D 32,
>>  	=2Edef_calibration =3D 19380,
>
>You'll probably need to define num_cal_offsets too, since the number of=
=20
>calibration bytes was also made configurable (not sure if this is=20
>already addressed by a separate patch)=2E

Thanks for pointing to this=2E
Should i change in same patch or in separate one?

>> +	=2Eops =3D &lvts_platform_ops_mt7988,
>>  };
>> =20
>>  static const struct lvts_data mt7988_lvts_ap_data =3D {
>
>Best,
>
>Laura



regards Frank

