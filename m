Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E10BAD59F5F
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 13 Dec 2025 02:57:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fsn3yi34vFL6wAN0Oy9EVsb5SXXk0AlVm2ngOvpfyQc=; b=MLMybweJ09uE+bElThi24eUKB1
	+wAIPzICjl5EOofRpmagmawzKt1oUumOhKws1PDWGRs5Ic25nJRQFc/gKLggzvNP9Aw8bIpk9iwRB
	+ET4yCGZ2RoiplhVMMquFfiN002bPE3IsFecHID5CnSKOCQEfA8/UA8Zkpv/RNr3VyNq+jOQo683r
	ICylG7uAMjacrbFzkLr7/CV8y2QcwxB+ruqC+9z2ZvqBEunFMUlLSeNS+9udNjs5+IB9AmbvLePp3
	IUnyrohse62BNdeW8JXWIhj5SOhz846EecKxaOXtAwlMl/rpjt60nv/b1Ds/g4/yRY9clU2cUCT1o
	Iyu7dLKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vUFoz-00000001K91-3Fja;
	Sat, 13 Dec 2025 02:57:25 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vUFot-00000001K5e-1yEH;
	Sat, 13 Dec 2025 02:57:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=MIME-Version:Content-Transfer-Encoding
	:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=fsn3yi34vFL6wAN0Oy9EVsb5SXXk0AlVm2ngOvpfyQc=; b=fif4OYbQrUqHpZ4FJ7vOJw5ppb
	qzSenlT3AuzM+q32lXhgD/2ihkR2g+ZXjDd5juyhl/jjpAxXGTWKU+A2lyUTv8yyBQfUQHBhRhXfm
	jnth6JflHHRGZVJtOVYw8wfopHt/0BvcAQBwhGBXpHgHGaggyKj45f488c9zAUEkV4lr+xTHsKX4C
	uMabCn95zs2fmaNVRAb/RHjRHpvvQmVsHXMXTFIs1oCRj+yKKXg5F1MDDXVx7AVxfwRnZNqCJBfOV
	eC+0zeIaJ88wDVYzveuUJ4W2hgBZAh7yrXyHOO63/4tOedf7yz5VsTC6BaLu4tQQM9qaEw9tpphYM
	vyeBDBzg==;
Received: from rtits2.realtek.com ([211.75.126.72] helo=rtits2.realtek.com.tw)
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vMJOV-0000000G66t-3cOC;
	Fri, 21 Nov 2025 05:09:19 +0000
X-SpamFilter-By: ArmorX SpamTrap 5.80 with qID 5AL61swwE3030759, This message is accepted by code: ctloc85258
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=realtek.com; s=dkim;
	t=1763704914; bh=fsn3yi34vFL6wAN0Oy9EVsb5SXXk0AlVm2ngOvpfyQc=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:MIME-Version;
	b=g1ymSDUc2XnpItiFt1mLtTcVL2qynJILZyNh+cuVceFHQ5NejiT2eFGrMqVKsa7yW
	 Y63xkKyLwo7dOOgCYQCAEmrJeSluKUd3zfuolXnDP0OCJBL3cs8YcPo3xd7NdszYqa
	 /UjHIKXErxW50bySB/6PjSNOxfBy0UyfSLRqZwyK2aeDa/79L+uZOUonv2rJ3Olnbq
	 OLXeTEKgec9RfTrdULOzuFPyOuXopD3BCWudYA0duLSfN3EkbUqL+oz+sCCzt7o/8A
	 Kb2MW5U4omC7SHveGpNNBBddv5kQA7fnkAjrEwz64GW/vKWql3LaP6IRLcUm2lbhfe
	 9/OUyDPPOMFpw==
Received: from mail.realtek.com (rtkexhmbs04.realtek.com.tw[10.21.1.54])
	by rtits2.realtek.com.tw (8.15.2/3.21/5.94) with ESMTPS id 5AL61swwE3030759
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 21 Nov 2025 14:01:54 +0800
Received: from RTKEXHMBS01.realtek.com.tw (172.21.6.40) by
 RTKEXHMBS04.realtek.com.tw (10.21.1.54) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.27; Fri, 21 Nov 2025 14:01:55 +0800
Received: from RTKEXHMBS06.realtek.com.tw (10.21.1.56) by
 RTKEXHMBS01.realtek.com.tw (172.21.6.40) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.27; Fri, 21 Nov 2025 14:01:50 +0800
Received: from RTKEXHMBS06.realtek.com.tw ([::1]) by
 RTKEXHMBS06.realtek.com.tw ([fe80::744:4bc9:832c:9b7e%10]) with mapi id
 15.02.1544.027; Fri, 21 Nov 2025 14:01:50 +0800
From: Ping-Ke Shih <pkshih@realtek.com>
To: "Mario Limonciello (AMD)" <superm1@kernel.org>,
        "mario.limonciello@amd.com" <mario.limonciello@amd.com>,
        "nbd@nbd.name"
	<nbd@nbd.name>,
        "lorenzo@kernel.org" <lorenzo@kernel.org>,
        "ryder.lee@mediatek.com" <ryder.lee@mediatek.com>,
        "shayne.chen@mediatek.com"
	<shayne.chen@mediatek.com>,
        "sean.wang@mediatek.com"
	<sean.wang@mediatek.com>,
        "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
        "angelogioacchino.delregno@collabora.com"
	<angelogioacchino.delregno@collabora.com>
CC: "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>,
        "linux-mediatek@lists.infradead.org"
	<linux-mediatek@lists.infradead.org>
Subject: RE: [PATCH] wifi: mt76: Strip whitespace from build ddate
Thread-Topic: [PATCH] wifi: mt76: Strip whitespace from build ddate
Thread-Index: AQHcWjgzLwwe4dMD8UutouPxvuwR37T8o4bw
Date: Fri, 21 Nov 2025 06:01:50 +0000
Message-ID: <a29d737be885490586c30be6262835c8@realtek.com>
References: <20251120155829.3494747-1-superm1@kernel.org>
In-Reply-To: <20251120155829.3494747-1-superm1@kernel.org>
Accept-Language: en-US, zh-TW
Content-Language: zh-TW
x-originating-ip: [172.21.6.42]
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251121_050917_209087_31C2CDB7 
X-CRM114-Status: UNSURE (   7.90  )
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

Mario Limonciello (AMD) <superm1@kernel.org> wrote:
> @@ -3124,8 +3125,11 @@ int mt76_connac2_load_patch(struct mt76_dev *dev, =
const char *fw_name)
>         }
>=20
>         hdr =3D (const void *)fw->data;
> +       strscpy(build_date, hdr->build_date, sizeof(build_date));
> +       build_date[16] =3D '\0';

As comment of strscpy(), NULL terminator always presents.

 * Copy the source string @src, or as much of it as fits, into the
 * destination @dst buffer. The behavior is undefined if the string
 * buffers overlap. The destination @dst buffer is always NUL terminated,
 * unless it's zero-sized.

> +       strim(build_date);
>         dev_info(dev->dev, "HW/SW Version: 0x%x, Build Time: %.16s\n",
> -                be32_to_cpu(hdr->hw_sw_ver), hdr->build_date);
> +                be32_to_cpu(hdr->hw_sw_ver), build_date);
>=20
>         for (i =3D 0; i < be32_to_cpu(hdr->desc.n_region); i++) {
>                 struct mt76_connac2_patch_sec *sec;
> --
> 2.43.0
>=20


