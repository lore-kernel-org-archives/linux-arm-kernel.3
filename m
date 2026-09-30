Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A9C7CA5FC5
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Sep 2026 13:56:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5SwTqNdqJfRK/IUxZeFy/sI9epuc4z6THWr/paPSz7A=; b=WzRyc/YWE6Zx7XZQ6QcB/5274h
	dnp7+w+1KpcAllBTHRedEOiCuuq14iLxTh5dUPsVA8FinWDQl4PetLov2VnLGHSLvEP1vZe3Au4PA
	NFIvbfxHjnPXy1XJR+jXWHXidGkNXjTHLfTwrPn8eyioXzMABYDO0zmFCW7KVzKsqdDfT4d2wt2Hw
	bEiH7SCCm9tT7efTcMhx656z08fJCqW6LHKVF5Z8jCCn8DMwRizjZybvIIQECyaQ5/1TB1Ai6kpTx
	eRTA5xCRidcOu+CBqvx7HmVpjoADBsxr5CttG2485bzGsrm7oz4pX6JhOM5VmUO9D8jyuTOF7v5z3
	ss2HHQxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBunL-00000006C3o-32iE;
	Wed, 30 Sep 2026 13:56:27 +0000
Received: from mail-ej2-x10.google.com ([2a00:1450:4864:34::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBunD-00000006C2A-3SII
	for linux-arm-kernel@lists.infradead.org;
	Wed, 30 Sep 2026 13:56:22 +0000
Received: by mail-ej2-x10.google.com with SMTP id a640c23a62f3a-c2940ef15d3so708448966b.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 30 Sep 2026 06:56:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790776578; cv=none;
        d=google.com; s=arc-20260327;
        b=qiEFoi4ezLN9Rt9z/e8mmdMKRI+AhYqfdCt8DeFke/NiG1aTfCQ0CkwnrdGPE1R4u1
         +yRc/LvtiZ7ocGmWylFonzFioSCZb0sLP0nfIUEs5ozsMNgHdfqGuG3jqR9cX81gibrO
         /FjTceooH2G73Qvs9WhJ6Dvhls6LeckL7VTqzzmBY+SDTjxOfFyzLqkEylu3U9yhtOxZ
         McUqQmY5QEjZSBlR080JYwmhNHeqMr3BCDn/n/VgUwkoPkcKIe5enqnS/g++tF5b6im0
         Yft4ya7N4Wf7V2QyLyOkn6V0aWW4ml9Gd7PqBFYJslgq9n0XPYd+PgR48U/gd6wlSVEo
         5VTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=5SwTqNdqJfRK/IUxZeFy/sI9epuc4z6THWr/paPSz7A=;
        fh=NNZ6G0I1SeWRh1blNxQ2eSMgNAXaG9VVf6s+T9zrB+k=;
        b=E5W/9yY5Pyld3wmnV+8SgCx1QTy5g8Qd+Feh6Mx+dqT6hRZmUBmP6DQJ/RNJnuRuGD
         grT7W9jmMC8O8HgmUFM1DAnG3d2zvsf43Ozjss9tQ70u9xyDGC5/TZcOsV2Ysq+guMxV
         ka1FbFE+8zYkcp8xzGPEn2tiSZ9iGljsfAtG2524MfbPVU0twNpZNiT07chCBA95BH+J
         CLopaHFmNRE6T7pVXHLqZWlCZirIxYUEEqg6nymetQTkZEOkelYV72hy76EhKIJWaTSc
         3GUyps3dDNoMRQNYXeCpNCGZY12fl/MzBjryOiFteNQgfFtRV3tUdQmpoIyGHefFP2Np
         svNA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=flipper.net; s=google; t=1790776578; x=1791381378; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=5SwTqNdqJfRK/IUxZeFy/sI9epuc4z6THWr/paPSz7A=;
        b=CjUYf3ufMTH0YFi4Mn/05TtaQ4oQq1grKJjDHpW1HPnvL6RkUwU8A1Y5aSsUYisd9/
         +lieUCSdUPmWxcCFdCbukXYDWvwePu9HovLaFuaERDQLug8t+ZBOF26PTo2htit8R68R
         znZnlR2ls6VKumgJeT0xCXB4jpx6t/XtYEEjWgQ7ZOUbU17c+/E8UdICxbH8akW4uNwF
         nb4uAvgMGH9TXw6FNTnWL9MEDu5FGS5Kh3oCi/Sm5GZxEZGbQJ/exPYe4krCeUJUixG7
         S53gubEcfO1j9r13cZnG1f2OQ4C+Br1HRR0oIm2OiYFZIRp37CBiWIAahhCNHQXOFDfR
         AFUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790776578; x=1791381378;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5SwTqNdqJfRK/IUxZeFy/sI9epuc4z6THWr/paPSz7A=;
        b=nbEPTh5t2rlrdAxLaeZp7oKCalnV0cXq39XplS1BfEW76xIubDq/24A0Ld3X6ricsL
         qF/56sd2QrVpt9zqcOW4JnmAHmlXXtX3Oyo3DEQX8Wa9Ntiy5+/yZTv5BgDaxYPLx5Sa
         K0E3BdNCEdbqRUIVtRCKJT7HaVY0WAIIgb4F449KmJFPrqF2FsVA3UTkKZPddQc2JlQw
         WClVxGHnUtCmFjcrCgd08O9hFpVuy79PvDdXfZsetdoxvb4g5RIYFPge/QX0fjZnEihi
         pFTWk4olPksUFo2Pxehq7XHEj87eW4+3gidUCQ/vfJ2ufhQJ2TaHUgidGTEZod9waSBS
         xsVw==
X-Forwarded-Encrypted: i=1; AKwUvBys+TjJYgZIQqA9tv6t7Ia7undJQ0ZJhrf7c639nA4JPlhaJtjX+lTJjmX5BBgcZLbrsZsQNEOXZk3YFIxHbHbC@lists.infradead.org
X-Gm-Message-State: AFuF++lzddjvmEKoHc+G4G6xXx5mqKjlBDJnrmK2NxjhcEgeEoqLlSMO
	qrVzwhI2HAZCaX5AYLa6j0pAmsw+j2t2wT1XVegVrYQvCyGXjhC86ZnI5mB1KZjBbK8Dgkp0ifq
	TNGyiYPvMuHSMc897Qo8mZk2iMs5Qb9eMszBSDz302A==
X-Gm-Gg: AYBFou11QR1TGe97NPEYwUCyhV4FgGQuA4FmG27iNC9ldoixz0tRtiI63zMOeuL7BZW
	AUuZaW9sIrKdidRcoWzVn/MTBV4KA3Z6lqt0YI7WlRaX4Vz9y6fZYfvfw1Ewn8QBtohadRdoK0Q
	on2LtPphn0xRD76oi4eNxh0WLdyOUFRYZBP8pdLiiZf6NM5Bxwd+xUNYg4Qv35tPlTHYNlqoANY
	m5Kkzs4Hdn9Jo7Kb3oyPJoo5YUJuHouL5xxodYQoiSDkgahbwxugE6DwfT0isFQLGk7Oimkzr49
	GSCSm0sUrbIcc5Pbtac2PzQ0/ncnpoPttPQKT1k21r7qE3dawQNFsQWrqagBcGQ/TppEFcS0ysv
	BMympsXzmea9PuG+XjmsSftI=
X-Received: by 2002:a17:907:1c9e:b0:c25:c67d:53cc with SMTP id
 a640c23a62f3a-c2e23cad0fdmr124499966b.8.1790776577897; Wed, 30 Sep 2026
 06:56:17 -0700 (PDT)
MIME-Version: 1.0
References: <20260929-b4-rk3576-reboot-mode-v2-0-5a34ca72065a@flipper.net>
 <20260929-b4-rk3576-reboot-mode-v2-1-5a34ca72065a@flipper.net> <20260930-hulking-swan-of-enterprise-94e2ae@quoll>
In-Reply-To: <20260930-hulking-swan-of-enterprise-94e2ae@quoll>
From: Alexey Charkov <alchark@flipper.net>
Date: Wed, 30 Sep 2026 17:56:06 +0400
X-Gm-Features: AclHuK_LS1pgpfgwaTzGiwreXcQZqQphizrD9-WsvYxGfaJqBGmravJ6aAw_W_w
Message-ID: <CAKTNdwG0NBZUez1Yy=jk3rYrD9W97oRMwvpX1qMXwQsP=_LvNw@mail.gmail.com>
Subject: Re: [PATCH v2 1/5] dt-bindings: soc: rockchip: add boot ROM download
 boot mode
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
	Sebastian Reichel <sre@kernel.org>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org, 
	Shawn Lin <shawn.lin@rock-chips.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260930_065619_908896_41AFD7DC 
X-CRM114-Status: GOOD (  16.09  )
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

On Wed, Sep 30, 2026 at 3:46=E2=80=AFPM Krzysztof Kozlowski <krzk@kernel.or=
g> wrote:
>
> On Tue, Sep 29, 2026 at 02:28:18PM +0400, Alexey Charkov wrote:
> > Rockchip boot ROMs enter USB download mode, commonly known as maskrom,
> > when they find 0xef08a53c in the register they take the boot mode from.
> > Add the magic under the name U-Boot already uses for it, so that boards
> > able to request it can do so symbolically.
> >
> > Tested-by: Shawn Lin <shawn.lin@rock-chips.com>
>
> Drop, you cannot test it.
>
> What is the point of such blanket tags which are not even applicable to
> 50% of patches here?

I'd argue for 40% :-D

Anyway, I get your point. I'll drop the tag from the bindings patches,
because Shawn tested a driver implementing the binding and a DTS
implementing the binding, but it's perhaps far fetched to imply that
the test covered the binding change itself.

Best regards,
Alexey

