Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F647C83F03
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Jul 2025 10:02:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7gqevtmSJqbTOQP3b4x9NXYdvlxGgh2UtvTcmwhzx+4=; b=q1+oeR8LbTR1qDaKQQ6eTp2zVQ
	Ee+II58d4iJcwqLk99luu2Stgpt38RJh7xa9DyAfKfjpivAKtNzbmkZ2IlHCIwIKpcfsfJuk8cac9
	GyakaYm5HIh2nvXzrYquuwKPXhdAkRsoBnUebthgQIv08fNABziS63o5jz279kFBQS2g42GW+s+q0
	3IDMnDI48A7fj4jVzfaHZTbgiBXHY2e0qJtqwVaF2phVMOF3Mk0H2qcnFBcNeG08G+cRcvlJA9cJe
	JOnRvrPHfEHr9T5LviuC2WniDu8GMpLCqIxaKPTenykUXACYzioAsce6grpWjSub3b8U3qet/4bUn
	s59p/Yww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZRdB-00000008E8l-2GqY;
	Wed, 09 Jul 2025 10:02:25 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZPjU-00000007sU0-3RRS
	for linux-arm-kernel@lists.infradead.org;
	Wed, 09 Jul 2025 08:00:51 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-4531e146a24so34086725e9.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 09 Jul 2025 01:00:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752048046; x=1752652846; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7gqevtmSJqbTOQP3b4x9NXYdvlxGgh2UtvTcmwhzx+4=;
        b=QtVVmtFyvdhOlVRrFUdw1fHGWEWvg7uk2AiFhNj54Y+WxVzstZERAI9BmfmK544jZF
         tnvSn4dcvABMdywsgkJ07b4NczYA7T3zXaiMNFhpRWFcfHoabD5t0jDsNugOLg+tkKYs
         W6TVsNqt1T/yDSty4MLrmwkXds3MZR+OKSPxKXWsh2oAv5haZ6sKRfYpGVxbtQ9JaNqz
         c7dNSMSKN8fdBt7cc21VDVUkCxnIuhWDO3e5fUHJm7fhzOltMDK10bvM02r+LXRgkkP9
         rQmRCifYoA+KY/RVrqGWD+w8Z11oYK+mDJmbtPYMsEJW+7/5E1eHvf+cmKGaF1Dimj3T
         Mt5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752048046; x=1752652846;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7gqevtmSJqbTOQP3b4x9NXYdvlxGgh2UtvTcmwhzx+4=;
        b=Y5XLggZ5LhseuwsbDRY1u8P5HX5PNztjNW5Q4WQpxgBmwiEWrSSyRUGKN9f+RSGiZR
         9il77FtXBq7i/cjMpnVGNMtBhrL+fostBR3lI2nANPUXwqtsT+YyirRjzMCS1OJyGxNS
         7C3+STwuP7Vw5kDuaZEi/3lf9yHfE4o1mqNbSMUIQbpJmT4nZF+0UyZN6niHIjGqLV0r
         M8sgL8uiT9EnwaV7PByOt8ez3bMNeOcFLNx03jYM52yJNmgu0VOte/1KQME2WfzqD1nb
         k7oDfon3BJVdPbdDzOCJ5Urh/LrWtG/Uuf8U8PEz/EGO4+8eiXkAplAWb/jijB1+Wdk9
         Hhbg==
X-Forwarded-Encrypted: i=1; AJvYcCXBSQmygB4SGTGVyiesjAjkT8q7vzwX2JKAd3++3Uo/KLFRCZ/J3eADJE8JnLyN4b4LCIZlV0DzQ2Wxnc/Fg38d@lists.infradead.org
X-Gm-Message-State: AOJu0YyXzr7FFCnSxl3wYnsIb4szLLxBGwOZDZiCv4pcoykACVmTwHXO
	V3xDibVGytLDz+RLdMP4aH7uely1IxLSUSliT7uLdqzxzJtHSY2KS+Ix
X-Gm-Gg: ASbGncs4B+S5NySid6HA24atw8uICfnuGCaNuyFtRkrYeBqVBYLGgnG8TomuKPdHJpk
	WcIdiYO6BHpFKGaT/ikfU2ot1+aAXs2M8OcM5e/CUky2ikE6PkR9TxCaPyDCTb+5FZya1a7nlDq
	nh0UqEUJfszUUcW0gpe5+w1T1FKI/q+yiQPwtpk6Rl+5V27JkhcKblrQF4591qYHWMSE0AY55f6
	T0LlZZm+KJ9tvOOwGp7HCi1YwEs2wL00jPO+cV02V1MionFDa3tSTMtnKhUy2fkBCcFEdg2rtM1
	BzA7ZGaRBn0cqnnCcYGdaANMNyOFLuprMR8IXtsAYusXoy8a5nRsHf+PkzZSM2zWAEeHS1UQhnf
	Qn7NiMxo06MFphLy78jfMNT9H1Lwx
X-Google-Smtp-Source: AGHT+IGGHxzTWiVKtUesUPIw3M4x/KqFOnRTNLp1oaILf660K643q80EA8PTrG0cC1h1pLe8dGvpcw==
X-Received: by 2002:a05:600c:c4a3:b0:442:f956:53f9 with SMTP id 5b1f17b1804b1-454d53a63dbmr11897035e9.18.1752048046096;
        Wed, 09 Jul 2025 01:00:46 -0700 (PDT)
Received: from pumpkin (host-92-21-58-28.as13285.net. [92.21.58.28])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-454d5032ff4sm13954275e9.8.2025.07.09.01.00.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Jul 2025 01:00:43 -0700 (PDT)
Date: Wed, 9 Jul 2025 09:00:41 +0100
From: David Laight <david.laight.linux@gmail.com>
To: Qianfeng Rong <rongqianfeng@vivo.com>
Cc: Jonathan Cameron <Jonathan.Cameron@huawei.com>, Patrice Chotard
 <patrice.chotard@foss.st.com>, Andi Shyti <andi.shyti@kernel.org>,
 linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org,
 linux-kernel@vger.kernel.org, opensource.kernel@vivo.com
Subject: Re: [PATCH v2] i2c: busses: Use min() to improve code
Message-ID: <20250709090041.26605105@pumpkin>
In-Reply-To: <e6814ec7-b9fb-4185-9929-1e463ef518f6@vivo.com>
References: <20250705114436.579070-1-rongqianfeng@vivo.com>
	<20250707104041.00006171@huawei.com>
	<e6814ec7-b9fb-4185-9929-1e463ef518f6@vivo.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250709_010049_953943_C169186E 
X-CRM114-Status: GOOD (  12.87  )
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

On Tue, 8 Jul 2025 10:05:58 +0800
Qianfeng Rong <rongqianfeng@vivo.com> wrote:

> =E5=9C=A8 2025/7/7 17:40, Jonathan Cameron =E5=86=99=E9=81=93:
> >> Signed-off-by: Qianfeng Rong <rongqianfeng@vivo.com>
> >> Reviewed-by: Patrice Chotard <patrice.chotard@foss.st.com> =20
> > Drive by review...
...
> > Given it is now one statement perhaps cleaner toput it
> > as the loop initializer
> >
> >          for (i =3D min(c->count, SSC_TXFIFO_SIZE - tx_fstat);
> >               i > 0; i--, c->count--, c->buf++)
> > =20
> Got it. Will do in the next version.

Not sure whether that is better.
The continuation line makes the 'for' statement a bit harder to parse.
I'll move the 'initialisation' out of a 'for' statement to get it to
fit on one line.

	David

>=20
> Best regards,
> Qianfeng
>=20
>=20


