Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83E74CA6004
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  6 Oct 2026 07:48:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LIS7LQGXFKGRWwjzJfFhANm/+ELSmq9NRDYM4Ibfol0=; b=sR9ni5lWw0k9TGjkKM5bEMXWKP
	GuKURLCZ+c9taUod4c+fd3xDkbDwaKNeQTNK+PWd4cAFbsQAWW1DrwUknOQS6v18U2Euyb8zzmheo
	4VUdzVEwTmvz39408I3O2PZ0tO8WhpGPnyA16RoLAo+Lfb3UYjJEcVmsH5Mq9yKahKqtMz1Xi2PZb
	81SHtZpjFdLBgDf0QABxyIq9uxEtfb4mdRCvL+m3ullINANV83kf5at5nG0Nmip84gxyE+wu5ckW2
	Fe3UiMofVnCriadbfgNnmyHOMKenlU+dUYsRr0JidnVfutlc0/QHJgW1t7iIl9DiKsMRw2eL0PQTL
	i46iqgXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDzup-00000000DLD-2u9p;
	Tue, 06 Oct 2026 07:48:47 +0000
Received: from mail-ej2-x06.google.com ([2a00:1450:4864:34::6])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDzul-00000000DIN-2uV4
	for linux-arm-kernel@lists.infradead.org;
	Tue, 06 Oct 2026 07:48:45 +0000
Received: by mail-ej2-x06.google.com with SMTP id a640c23a62f3a-c2e61353ec3so72751366b.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 06 Oct 2026 00:48:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791272922; cv=none;
        d=google.com; s=arc-20260327;
        b=s58hv50KQQyGI/8vQQ/aZS/yvucLNoDhJQqf+iy0kMsuiOEHeu6BCZ52enBUG9CMds
         ZNg+UaeGQsshUarg3+PMQbM9kZfaPZgUEvTJegQzqPCZQrIVoBOuMN+Z+5cq9Y0tOhP7
         GP6sQtzhvegeYeR8fg0+fMSqKpDcVk/woYX4bCmg0xAL5qJUHkJ3/9pMvgwmckLvgl8k
         YAfByu70XENgfu7OZmCxzqcfWXdSLYL9yu0WWJ1iHUCPp6fLD28+qLekhUPOR7NLAIUB
         d/os4+sNmODcv/nDl1sKdCVJzMtaCi3/S+8AOl7YuUPMl0XwgHhTLrc9wG7si94rPXar
         MXuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=LIS7LQGXFKGRWwjzJfFhANm/+ELSmq9NRDYM4Ibfol0=;
        fh=pTfw+MU3Xv5ZYzr6pwWEoyodoh86Gn7J3qgdnZbLNaI=;
        b=l2aAWcAa53Z++z3rELb5bRMgCSuYEgg1IkgD3kAvAOGl/Uj98ApcOOq7NoVWHAOh6x
         Up5H+Yrgx/IZp7PBCJMUZhbP2cO+LDs1TIkPSNKgkIo3MfhaSJ63EG7JQg4C99URxtd7
         zuzj37IKz1+3ob9osbBaAPty32epq28rCIk+bze5GSJNbh8qFfC6VwZ7wtgDgsP/pLtf
         XW0I2zTT1PudOpD5894P6HYuifK/vK9wEFFHnk5IYDakja0dddlTF/l+RJIgCGl5zLFP
         7vbkx33uYLfT8XcqbU8LleS5tLe2p/58dfEdjnkUrpsVvHkTWmJGFWDDwoNqRwoDt+1S
         xOag==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791272922; x=1791877722; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=LIS7LQGXFKGRWwjzJfFhANm/+ELSmq9NRDYM4Ibfol0=;
        b=nTjjfp6jnMaS0+/hdsaWSFeaHEMEWKDzxVNQ+m89g0YV8gbdwZB7t3T4nZ6vKeHGLo
         VdiJsDQac2J0uKgHMil3xXZVPsvOC5NjehoexUpsCu0Sv6zBAmQDduF7rC/qL9m/3Ao+
         yFKpAV20w/IjS94XShrFR7ViDn6Ml1SJjwAeQ+NfkBFCU+2g1L5LILQbUxoiK5kumPYI
         qF1xO/tt5kWiqG8n7tnOfe/TzMSQGXgsOnCIMlT7SJgFIHHgGrSiDx5kf670ZcFhJ3z4
         hEIKr/mseGtZzVum52WQIVmzvwoOkFgCx6I3p6mNdkN3YXgSd8vZ2rT4t7PbQhNC6bTc
         Zw0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791272922; x=1791877722;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LIS7LQGXFKGRWwjzJfFhANm/+ELSmq9NRDYM4Ibfol0=;
        b=i2z02VvkwduwTcP35tB4nTZnw9Jy2Dlk8CLRAXrnM+qEw1qCg2IpkZlVE+oUxlwKDg
         8rUda3aqzuEcOduJlQ3FVlroW1rz2CgEuJX8VV0pe9Jx6wl0ymxbSmxECpyCFNqUt8hz
         nYRjHwh8rynPUDr45HSBrU9Yo6E9bvOp5nHgPCInNXaDP8ogNeVbPDwbUBuuPtj+bdJU
         DcefQO74WAvmxZyXHc8z84S/i3N8AZvw/+qJB7+rBkPiGFo7SCfoMjLp3rHih3x6p/TK
         eDQdQKkUpdsNHc1B9UYFKkLR4esI0ITwKjVphTDzp8kDRjersxj1arg9kj65QGSW+I0G
         WUbw==
X-Forwarded-Encrypted: i=1; AKwUvBxHh3jxk/7UzIHyDp/JM5No33pm61MBV2718f00NJ1FEpCTZJhU5MX/0z/cvkAqzRlWwXHYRfAWK7VFlng4ic0s@lists.infradead.org
X-Gm-Message-State: AFuF++nbWgZcGrpzNQOiuc14qifqbgAV3ZzMI3eNL9PoI+7xcJiHG1Uh
	RKDLyDUvKt+TDyRxuZc8BtH4aUAdmFgBu8ld7KWAlwqhE3SSotDYLdRYFbHqEDNS/Ald0MjmFZL
	bLhQ+TaCg2UBpsVE4xmhI0CYWiGz2BTY=
X-Gm-Gg: AYBFou2yTUuFwqikbPRD4PyWgu71myUspgZoE1h25Z8rXb7m5NXJDdXGLRcmL1zZBLD
	kSCv3BIFXvKnH0PnTMCXjja1KqsP/E3MYujiQAbAfDeamBnAApWdBrL9YaE87XO90i8OMO+cAsE
	tqohwf/onJnjhkh494Pc2cJLPDI8k/sWilBpshOP7Ol7w6/Ae2bUZ2YK0sOjbxDBr6SmH4zugu0
	KqH2kAg1QYT1a7f0g/F0XiAL6a9E5Y7ycusnsSfS8wl4YxnLoL9dJVmbahmCE+P0Kohca7e/tlR
	b68dxDVVm1dJNHg61W5OqOlNZT5jBMAMdeWbjoz7fL01I2wss/1CoMuOEg==
X-Received: by 2002:a17:907:9405:b0:c2a:f360:1c67 with SMTP id
 a640c23a62f3a-c316a07eb4cmr65136466b.35.1791272920911; Tue, 06 Oct 2026
 00:48:40 -0700 (PDT)
MIME-Version: 1.0
References: <20261005225944.1171574-1-coiaprant@gmail.com> <20261006032710.GA3539706-robh@kernel.org>
In-Reply-To: <20261006032710.GA3539706-robh@kernel.org>
From: Coia Prant <coiaprant@gmail.com>
Date: Tue, 6 Oct 2026 15:48:27 +0800
X-Gm-Features: AclHuK-_H5DMjjR501xY25PLqDQ4wPnk0DiXBT1PdwIvhQ2wQ01nPR-CgEl7PoQ
Message-ID: <CALj3r0hwkXBowh=vUbC9yPimkraMH1NJ3OmgBb0zp-z22ZFXvg@mail.gmail.com>
Subject: Re: [PATCH v11 0/2] phy: rockchip: naneng-combphy: add SGMII MAC
 selection for RK3568
To: Rob Herring <robh@kernel.org>
Cc: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Manivannan Sadhasivam <mani@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Heiko Stuebner <heiko@sntech.de>, linux-phy@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261006_004843_761008_3365DDFF 
X-CRM114-Status: GOOD (  14.31  )
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

Rob Herring <robh@kernel.org> =E4=BA=8E2026=E5=B9=B410=E6=9C=886=E6=97=A5=
=E5=91=A8=E4=BA=8C 11:27=E5=86=99=E9=81=93=EF=BC=9A
>
> On Tue, Oct 06, 2026 at 06:59:42AM +0800, Coia Prant wrote:
> > Changes since v10:
> >
> > - Drop the top-level "default: 1" for "rockchip,sgmii-mac-sel".
> >   dtschema injects top-level defaults into every matching node, and the
> >   injected value conflicts with the "else" branch that forbids the
> >   property on non-RK3568 variants, breaking dtbs_check on those
> >   platforms. The driver already treats an absent property as 1 (GMAC1),
> >   so behavior is unchanged.
>
> What? That's not right. 'default' has no effect on the validation.
> Please add it back. If the property doesn't apply to some variant, then
> default doesn't matter.
>
> Rob

Hi Rob,

Thanks for the correction. You're right, 'default' has no effect on
validation. I'll add it back and send a v12 right away.

Sorry for the noise.

Coia

