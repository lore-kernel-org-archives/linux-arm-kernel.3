Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C155DC55ABA
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Aug 2026 11:57:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:To:References:Message-Id:
	Content-Transfer-Encoding:Cc:Date:In-Reply-To:From:Subject:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fhVJOI/iWMfAidx5QvrgBKyOQQvEhaR/KBcGi/ST9nI=; b=DcMrH647nsMnxF23ySTg2io+BR
	n29vWOq7mkE0hxs4+PRBvR7D4hQQBsUx70OFODPIyfUoCVJE5FkQg9CKoHTnyK7WIpWfyJEtGhjut
	OJiTW3T8O3mdm40Q/am1YgQUeWFIEaC3fxNy9mkgPeEeJlhx6uXrRijzRcTNdMXbhQ099ZHHfxuwY
	i4pTX7poSjRo3Erbhdwyr4q6hDh1S5CniCScAPHunOmBBQLopbtHcUsxbUBxmL2TEmB1M3gswuGXj
	MzVZCN/O9IlNgxGAlz+sT1I9nPWHer72pjMI8ylDLP4Dbyi4NnnGzsIihAU334XhDdNUoqG8HqlwD
	BoF1CGTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wraFb-00000003q9D-3xga;
	Wed, 05 Aug 2026 11:57:35 +0000
Received: from chaosmail.tech ([77.81.229.115])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wraFZ-00000003q8s-3HGi
	for linux-arm-kernel@lists.infradead.org;
	Wed, 05 Aug 2026 11:57:35 +0000
Received: by chaosmail.tech (Postfix) id 6801F1C867A;
	Wed, 05 Aug 2026 11:57:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chaosmail.tech;
	s=mail; t=1785931050;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=fhVJOI/iWMfAidx5QvrgBKyOQQvEhaR/KBcGi/ST9nI=;
	b=m9M3sVw1v0K3H7rD9qC4lQMMiOkiLN1VJEUvTTA06lHKB1t9gAxf9S4Lrpf5NkXDruibn6
	zJB8GkxwbvCX9e2iQt0EgwvZnl6LwrGtDDd05mY+4wsyoja0w2+pc5TJydTN3QzEEdzF7W
	4aTavklZlZT+MK5DIkKzTF9p8ma3gvc=
Content-Type: text/plain;
	charset=us-ascii
MIME-Version: 1.0
Subject: Re: [PATCH v2 2/3] usb: typec: tipd: Factor out i2c specifics
From: Sasha Finkelstein <k@chaosmail.tech>
In-Reply-To: <anMi2q5FmsvE4z8W@black.igk.intel.com>
Date: Wed, 5 Aug 2026 13:57:18 +0200
Cc: Sven Peter <sven@kernel.org>,
 Janne Grunau <j@jannau.net>,
 Neal Gompa <neal@gompa.dev>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 asahi@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org,
 linux-usb@vger.kernel.org,
 devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 Alyssa Milburn <amilburn@zall.org>
Content-Transfer-Encoding: quoted-printable
Message-Id: <7D31226B-98F2-4DF2-BA47-31CF9B269A7F@chaosmail.tech>
References: <20260727-tipd-ace3-v2-0-1345957bd635@chaosmail.tech>
 <20260727-tipd-ace3-v2-2-1345957bd635@chaosmail.tech>
 <anMi2q5FmsvE4z8W@black.igk.intel.com>
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260805_045734_303228_20DCBE70 
X-CRM114-Status: UNSURE (   7.73  )
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

On Aug 5, 2026, at 13:47, Heikki Krogerus =
<heikki.krogerus@linux.intel.com> wrote:
>>=20
>> -static const struct regmap_config tps6598x_regmap_config =3D {
>> +const struct regmap_config tps6598x_regmap_config =3D {
>> .reg_bits =3D 8,
>> .val_bits =3D 8,
>> .max_register =3D 0x7F,
>> };
>> +EXPORT_SYMBOL_GPL(tps6598x_regmap_config);
>=20
> Don't export that. Just move it to i2c.c

I use this one in spmi.c too, the regmap configuration is the same,
just the backend is different




