Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 584A7CAC5A7
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 20 Sep 2025 15:31:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Rxoe6gkMqaTRHJBxx7naU2YBnTbK7xxNZMLfKtFttQo=; b=vibESyfA7xoqnY
	kUrrq3HhqbMjNXFhT7OvThr6Vq7691NME+1qrSVCO0yIrHTy7UeVO1Njx8y/GXcGTLj8Scc6REdja
	V6fpSwMWOpQs9SuyJf9DsCGABE4SnMOxaREtqW8Iw7yuiIU2V9psprEoGppvkcD1ZcsdlvDerLmHC
	kspP7zCd5FLGA6zVjV7WGUpCWAwW+Ik7Pt+5fPt2zdSwsLA7rKArfW8qhTR0xCsgh+Fja4I8+ERnJ
	VRwbjqi1SaXzjACvkgtmqRSIevLwvDLcyZIVkfoG6uX24CbZAq8zpyFNk6/+sVV5XJjTsefc94/m+
	QEsS0igIuP+wfaefDhQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzzYV-00000005XUu-04fr;
	Sat, 20 Sep 2025 15:31:19 +0000
Received: from sendmail.purelymail.com ([34.202.193.197])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzzYR-00000005XTW-3B1O
	for linux-arm-kernel@lists.infradead.org;
	Sat, 20 Sep 2025 15:31:17 +0000
Authentication-Results: purelymail.com; auth=pass
DKIM-Signature: a=rsa-sha256; b=iWqtrSbkxBi/JLRtP+iV4RQ3k1a/tesuTQDMgAOYaJrV4z4Alue0kRIlCXG9+d0c7mYoZjRyokZC22Hggfu2+b6LpUspt8EsOPd0y42DuKze8KnMR2qsqUXog8/vBIDorYRSGpMhhkzrylMEnZFo8XMajFm4DXKrdI8Gvhw40NCJpOAClQuewkde8tKwYx+5CPhtWn7VLhRtgiGa2pcmcfDUwpPA/HPCQNkI0yX4WgetJ6Kekc3bFTlHJePlollL72koMZLnIU3bi1RNKs6xTQm77+g+4MTi19Y8AgflsVqnDRUe5byyQ7OWccIXe0Aa+TVbQyjfEvY3fDB14PL3eQ==; s=purelymail1; d=purelymail.com; v=1; bh=hSg3c2ZghTZizAbYqX13nbRSTVnHbltJh3jiavgkq80=; h=Feedback-ID:Received:From:Subject:Date:To;
Feedback-ID: 68247:10037:null:purelymail
X-Pm-Original-To: linux-arm-kernel@lists.infradead.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id -1935225507;
          (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
          Sat, 20 Sep 2025 15:31:09 +0000 (UTC)
From: Igor Belwon <igor.belwon@mentallysanemainliners.org>
Subject: [PATCH 0/2] i2c: Add support for MT6878 I2C controllers
Date: Sat, 20 Sep 2025 17:31:02 +0200
Message-Id: <20250920-mt6878-i2c-bringup-v1-0-d1527ffd3cd7@mentallysanemainliners.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIALfIzmgC/x3MQQ5AMBBA0avIrE1SDVWuIhZa05qFkhaRiLtrL
 N/i/wcSRaYEffFApIsTbyGjKguwyxQ8Ic/ZIIVsRCcFrofSrUaWFk3k4M8dVS3mWlvjlDKQwz2
 S4/ufDuP7fnRUnrZkAAAA
X-Change-ID: 20250920-mt6878-i2c-bringup-640d48cbf66b
To: Qii Wang <qii.wang@mediatek.com>, Andi Shyti <andi.shyti@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: ~postmarketos/upstreaming@lists.sr.ht, linux-i2c@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 Igor Belwon <igor.belwon@mentallysanemainliners.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1758382267; l=759;
 i=igor.belwon@mentallysanemainliners.org; s=20250908;
 h=from:subject:message-id; bh=hSg3c2ZghTZizAbYqX13nbRSTVnHbltJh3jiavgkq80=;
 b=ZmmuUVQP60SFRzeKx5oSct4QOEoDeLeYJIF9FKk4TQgtZPtWpkWxvMFN31WjyU6lbr31VyM1G
 uWVbihpePQ5BA6j/daH/+17Zn4BAr2LzmQymhbXdmJlbCFgEvwgwFTG
X-Developer-Key: i=igor.belwon@mentallysanemainliners.org; a=ed25519;
 pk=t9Kz6B3jEwJD7YAKcp8XftfEz7SUSlGbrsfFlbrrFwA=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250920_083115_899186_22A04783 
X-CRM114-Status: UNSURE (   7.86  )
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

Hi all,

This patchest adds support for the i2c units found in the MediaTek 
MT6878 SoC. These units use the new v3 register offset scheme 
(differing only in OFFSET_SLAVE_ADDR).

Signed-off-by: Igor Belwon <igor.belwon@mentallysanemainliners.org>
---
Igor Belwon (2):
      dt-bindings: i2c: i2c-mt65xx: Document MediaTek MT6878 I2C
      i2c: mediatek: add support for MT6878 SoC

 Documentation/devicetree/bindings/i2c/i2c-mt65xx.yaml |  1 +
 drivers/i2c/busses/i2c-mt65xx.c                       | 14 ++++++++++++++
 2 files changed, 15 insertions(+)
---
base-commit: 846bd2225ec3cfa8be046655e02b9457ed41973e
change-id: 20250920-mt6878-i2c-bringup-640d48cbf66b

Best regards,
-- 
Igor Belwon <igor.belwon@mentallysanemainliners.org>


