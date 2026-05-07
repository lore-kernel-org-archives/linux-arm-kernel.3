Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73E68CD3427
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  7 May 2026 12:12:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZrnqX96u+Flxd2Q9FYBoadC2ai7BMu/bBuPcHTaRBc8=; b=M9fQeCi9vJxqvJUByxaXFRuXLU
	QcX1weV2KchcLL5m2JBMD0XXp0jMEpM3qq5iTMiYIfn53LKdzQTYIBM3HsZAyLfebROM8kXDEusCk
	iKOJn5PkjDBxM6JiFiKxznIuGff6X35VecoXGNaDZr22xCctxxUC84wte/AcDvlYEuOfHsDjR+tDy
	s3FhnSmryuqTkEtZzCVsz997eIg7iugA/UsIbgZ+7WD5N2aJnDKLcy46Jf4mv7AtOJGl5FIQYaisN
	k4vj4ckgXSSMwFgXqPIP4PpgH5rDYNX4a77NSLDAeAJXa1jWOBRrCpU2VVaSLYxk+DS7GZCCVd9NB
	/VKYq7qw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKxaj-00000003kfY-3afS;
	Thu, 07 May 2026 12:12:33 +0000
Received: from sender4-pp-f112.zoho.com ([136.143.188.112])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKxah-00000003kf0-3Xyd;
	Thu, 07 May 2026 12:12:32 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1778155922; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=SDqglZccFbVPk9LWQ0GXBIIjb5MTR7/+sA4n+fjXZXzD2J20OQUNcGzzI8P2ThMpfbxK0suJSqw8KJoBxUETcpz+Zc1EsGX5POHky3de0r5e5g2HHPRZpf/A66O4+k6/I53xMY74F7R0YsQ7AfWTkzcr6RKxCUardLqYkuBWWMo=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1778155922; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=ZrnqX96u+Flxd2Q9FYBoadC2ai7BMu/bBuPcHTaRBc8=; 
	b=LYk7OweCiBXGFeROcxl94OQydGvYw21aGDkgLo+D1qZw4lSgNAKmsD4LBq99l0c5nxOdVNjUcxb0ZORrKWKRllaWvWOfa0SAtujSYSDKZH9OzQ6BH22mvkJUimyAsUyQzusXbCKMgQ88pUXTz/BGOjLc2qrjZW5lRU70bdIpoIM=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=louisalexis.eyraud@collabora.com;
	dmarc=pass header.from=<louisalexis.eyraud@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1778155922;
	s=zohomail; d=collabora.com; i=louisalexis.eyraud@collabora.com;
	h=Message-ID:Subject:Subject:From:From:To:To:Cc:Cc:Date:Date:In-Reply-To:References:Content-Type:Content-Transfer-Encoding:MIME-Version:Message-Id:Reply-To;
	bh=ZrnqX96u+Flxd2Q9FYBoadC2ai7BMu/bBuPcHTaRBc8=;
	b=Z25JEbRAuz4jHpuHjKB0FLBVYYQUt9rboPSOl82e/pL+qjfex4RSH2vRvdYw63Ix
	zq4cfxq08lheqbLqpsL6cC/SUNOrT3BXqQr9WSwsjFWj+f5KbYlmn6rw960vb09NAzS
	ER90yeFBhvryN8yxHZfczpNpOZdDwFMWxNGocsm4=
Received: by mx.zohomail.com with SMTPS id 1778155920789528.3783773258275;
	Thu, 7 May 2026 05:12:00 -0700 (PDT)
Message-ID: <9f569ba00b959b701a7a51bcd7347c1a108a15ee.camel@collabora.com>
Subject: Re: [PATCH net-next v2 3/4] net: phy: air_phy_lib: Factorize
 BuckPBus register accessors
From: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
To: Andrew Lunn <andrew@lunn.ch>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>,  Eric Dumazet <edumazet@google.com>, Jakub Kicinski
 <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley	
 <conor+dt@kernel.org>, AngeloGioacchino Del Regno	
 <angelogioacchino.delregno@collabora.com>, Heiner Kallweit	
 <hkallweit1@gmail.com>, Russell King <linux@armlinux.org.uk>, 
	kevin-kw.huang@airoha.com, macpaul.lin@mediatek.com,
 matthias.bgg@gmail.com, 	kernel@collabora.com, netdev@vger.kernel.org,
 devicetree@vger.kernel.org, 	linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, 	linux-kernel@vger.kernel.org
Date: Thu, 07 May 2026 14:11:54 +0200
In-Reply-To: <3bd7803d-4c4a-4f61-9434-a6bf25627b58@lunn.ch>
References: <20260326-add-airoha-an8801-support-v2-0-1a42d6b6050f@collabora.com>
	 <20260326-add-airoha-an8801-support-v2-3-1a42d6b6050f@collabora.com>
	 <3bd7803d-4c4a-4f61-9434-a6bf25627b58@lunn.ch>
Organization: Collabora Ltd
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.58.3 (3.58.3-1.fc43) 
MIME-Version: 1.0
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260507_051231_945786_568347FA 
X-CRM114-Status: GOOD (  11.54  )
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

Hi=C2=A0Andrew,

On Thu, 2026-03-26 at 13:30 +0100, Andrew Lunn wrote:
> > @@ -480,8 +287,8 @@ static int en8811h_wait_mcu_ready(struct
> > phy_device *phydev)
> > =C2=A0{
> > =C2=A0	int ret, reg_value;
> > =C2=A0
> > -	ret =3D air_buckpbus_reg_write(phydev, EN8811H_FW_CTRL_1,
> > -				=C2=A0=C2=A0=C2=A0=C2=A0 EN8811H_FW_CTRL_1_FINISH);
> > +	ret =3D air_phy_buckpbus_reg_write(phydev,
> > EN8811H_FW_CTRL_1,
> > +				=09
> > EN8811H_FW_CTRL_1_FINISH);
>=20
> Is a rename required? Is the namespace air_buckpbus_ used somewhere
> else?
>=20
> 	Andrew
Sorry for the delay.

The air_buckpbus_ namespace is only used in the air_en8811h driver.
It seemed better to me that in the new air_phy_lib, all functions (the
buckpbus accessors and air_phy_read/write_page functions) started with
the same prefix. That is the reason I renamed them, even if not
required.

As an alternative, to avoid renaming those buckpbus function calls on
air_en8811h driver and reduce this patch changes, I can add macros at
the beginning of the file such as:
```
#define air_buckpbus_reg_write(_phydev, _pbus_address, _pbus_data) \
	air_phy_buckpbus_reg_write(_phydev, _pbus_address, _pbus_data)
```

Would it be okay?

Best regards,
Louis-Alexis

