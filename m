Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC3B0C83F27
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Jul 2025 10:07:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8pt/dDbl5x5sOY+/vW0nNNsMEFBe3jUslMri8s6phho=; b=ZwGhwY9YYN+ErZD7JYzCYuffTv
	4I8Hm1xglh+jfVo5Qrya/Z8oJpA8Q0+bHTYNMWOdibKUdZgPxdkpgyzrUHCy3MzOl5GkHQOO7cA/J
	eDETr7D1+WskZ8sVu463pqlKBJ/Qg4Q47dvF0efHteJBUO+iq+fR/OdqhrmE/G7OPhJPdMSmmQIzy
	5U7PSiieE90QfoqcZ/5hKobbvn/duQaYpsxY3H11PK7OBvudmjPPC5+NPMjx/t1T2ouSw0pRQcyPB
	EqXU7My2v2MAT7ryf2yRgedYFPzKsiuNju7FMSkNRmFll5dxZ7aGVGtTeRM20pgNwJ7zbLhhbbJHO
	UlbiNrOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ue9tj-000000026fc-3u7c;
	Tue, 22 Jul 2025 10:06:59 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ue9le-000000024jK-3oMJ;
	Tue, 22 Jul 2025 09:58:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1753178317;
	bh=2YDS8ULpwtubaxcIFjQWUJJwv1dOYUJ8pgeIv2TxAEE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=bOqivjtbSPvFJU/luuT3nC2wdJoPQbFutJLxUorFDE0xn/p/JubZ4ViWojQlqL/MZ
	 7ITo4F4fHJC5XYll5zEjTUOWA1Vd+7AovoPNXpBp09d2z+LicgilB8z1rd4FJOK0dA
	 hrj+akHr8FzXjPnP9AYU1OUeBiVujbJBPGOezZmarQ7b1AsSb1W9J+hMMaJhMx4pOk
	 bQ/ddwSNgA+pE8mQ79+WrSeDT7/tzUGKUwiXECcrv93gVyyxzJSro8NlD+4EVU9WLB
	 tTCyHqYxyxX/+C1ulM6IUgk73dhhEx0Vqea+CC8MaXy/3AzA/3czJrzKShCeJPYtwV
	 QeAi0TKhgHWLw==
Received: from laura.lan (unknown [IPv6:2001:b07:646b:e2:bd9c:eae9:88b0:783c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: laura.nao)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id DC33D17E07FB;
	Tue, 22 Jul 2025 11:58:35 +0200 (CEST)
From: Laura Nao <laura.nao@collabora.com>
To: wenst@chromium.org
Cc: andrew-ct.chen@mediatek.com,
	angelogioacchino.delregno@collabora.com,
	arnd@arndb.de,
	bchihi@baylibre.com,
	colin.i.king@gmail.com,
	conor+dt@kernel.org,
	daniel.lezcano@linaro.org,
	devicetree@vger.kernel.org,
	kernel@collabora.com,
	krzk+dt@kernel.org,
	lala.lin@mediatek.com,
	laura.nao@collabora.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-pm@vger.kernel.org,
	lukasz.luba@arm.com,
	matthias.bgg@gmail.com,
	nfraprado@collabora.com,
	rafael@kernel.org,
	robh@kernel.org,
	rui.zhang@intel.com,
	srini@kernel.org,
	u.kleine-koenig@baylibre.com
Subject: Re: [PATCH 3/9] thermal/drivers/mediatek/lvts: Guard against zero temp_factor in lvts_raw_to_temp
Date: Tue, 22 Jul 2025 11:57:52 +0200
Message-Id: <20250722095752.28245-1-laura.nao@collabora.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <CAGXv+5F51DiCHi_QPeDKOGCwvgM6HpmRjEjSgS8-mh=Fg1Fr5g@mail.gmail.com>
References: <CAGXv+5F51DiCHi_QPeDKOGCwvgM6HpmRjEjSgS8-mh=Fg1Fr5g@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250722_025839_097625_0C783F26 
X-CRM114-Status: GOOD (  16.30  )
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

On 7/21/25 12:08, Chen-Yu Tsai wrote:
> On Mon, Jul 21, 2025 at 4:26 PM Laura Nao <laura.nao@collabora.com> wrote:
>>
>> Add a guard against zero temp_factor in lvts_raw_to_temp() to prevent
>> division by zero and ensure safe conversion.
>>
>> Fixes: 6725a29321e4 ("thermal/drivers/mediatek/lvts_thermal: Make coeff configurable")
>> Signed-off-by: Laura Nao <laura.nao@collabora.com>
>
> Code wise,
>
> Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>
>
> However I assume this would only happen with bad platform data? The
> factor should _never_ be zero. Maybe also issue a warning in the probe
> function?
>

Yes, this should only occur with incorrect platform data. Adding a
warning in the probe function sounds like a good idea to catch 
any misconfiguration early. I’ll include that in the next revision.

Thanks,

Laura

> ChenYu
>
>> ---
>>  drivers/thermal/mediatek/lvts_thermal.c | 9 ++++++---
>>  1 file changed, 6 insertions(+), 3 deletions(-)
>>
>> diff --git a/drivers/thermal/mediatek/lvts_thermal.c b/drivers/thermal/mediatek/lvts_thermal.c
>> index 8d5259b9d03b..b80c2929ae74 100644
>> --- a/drivers/thermal/mediatek/lvts_thermal.c
>> +++ b/drivers/thermal/mediatek/lvts_thermal.c
>> @@ -280,11 +280,14 @@ static int lvts_raw_to_temp(u32 raw_temp, int temp_factor)
>>
>>  static u32 lvts_temp_to_raw(int temperature, int temp_factor)
>>  {
>> -       u32 raw_temp = ((s64)(golden_temp_offset - temperature)) << 14;
>> +       u32 raw_temp;
>>
>> -       raw_temp = div_s64(raw_temp, -temp_factor);
>> +       if (temp_factor == 0)
>> +               return temperature;
>>
>> -       return raw_temp;
>> +       raw_temp = ((s64)(golden_temp_offset - temperature)) << 14;
>> +
>> +       return div_s64(raw_temp, -temp_factor);
>>  }
>>
>>  static int lvts_get_temp(struct thermal_zone_device *tz, int *temp)
>> --
>> 2.39.5
>>
>>


