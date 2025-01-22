Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04C08C02181
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Jan 2025 14:14:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Vr5CMuJ7WXIe+OEUSCiZCZ+n0fE3WK083QR9rz+lxBQ=; b=lrIaxoEWGMExxh7afdZ4ET4eYH
	l6K2Unvpp3a3f0AR/LOd1gsvhjEXOzc9Jmejc6DgwMNsRDqefzXj0bmHe4ufUMpYu6LTcE8bWpN7L
	2hS2aHXDLV16NrJjqEmSGsar0MRgSPTdYbSQlHEah5VwkRb+ZuDI2YeFr7hHPKkhoEpt50BBEDz1A
	1t2AMFq7JM0EKRDI/Dne1t1GCWImxsGWII/X/4UI2dopCSe1Bd9RL9rdJh5e+Q7vr98s58ViWTyzU
	WdrQatjwnV2mcX66i0NbEPLkvT/+2Z7kmhDOZWNTdxnkJwHl1vTJAfGTsvBPGEs5ot2+h7w6m+mpd
	uNYBVb0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tabUN-0000000AOGw-2LbK;
	Wed, 22 Jan 2025 14:13:51 +0000
Received: from mail-ed1-x533.google.com ([2a00:1450:4864:20::533])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tabPR-0000000ANTU-2wRf;
	Wed, 22 Jan 2025 14:08:46 +0000
Received: by mail-ed1-x533.google.com with SMTP id 4fb4d7f45d1cf-5dc0522475eso51251a12.1;
        Wed, 22 Jan 2025 06:08:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737554924; x=1738159724; darn=lists.infradead.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=Vr5CMuJ7WXIe+OEUSCiZCZ+n0fE3WK083QR9rz+lxBQ=;
        b=GCR8xw2cH1pRAhFyjMiLk/y/GqKZ+jffv1vFtmEf8hffN9u8km6U+XP3c7/vnG+xPG
         lrIZrqVVV6ZuO/szsRfNEyM1imKmzk1PU6bl1uOh0LUQDJirdJ43c62dUBiVSC0eJ1QW
         kCKpjP35sLCPZGknx/YVlhI8bxJd+giTOlL390S2Fq05AzWmAQcHjjJLapc4exDAWPif
         4qBpSdcSCTohiIxyukTCsvnpLMD7vSrw9Cr6BQJjjmr83t7PPW+yXGCNA366zuxxetsc
         NMsgUwUh4Q8A7prOvswqNRjXfLXQ3coHqAqpAd7gkzcTsBLdD8RtFfdXxf4usSC405Gf
         yM3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737554924; x=1738159724;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Vr5CMuJ7WXIe+OEUSCiZCZ+n0fE3WK083QR9rz+lxBQ=;
        b=jV2EoCWuv58uHNXbcGrVYxrdDkV+v3EfsMdXfJJV2sEG7RantE4a4Zir3HuiWX6Ktk
         fzTolEWgLmmOeY/WmhvbAHg2ajGJScaPwO4VuZw0KFfImE7xTRY6lOmgxKw4sBgNzyEx
         GocQiHCrPMSVO1G9hWKQn6HPa7lcw+qIhX7IyRef5/hAHspNS7gF9tGvBkUfFr6JEeBS
         FOo5lROXg2iT6mAP04HzFqhHld1eT92HGJmT/vmsKBMFtlhUk1l1S9P/apc/XVwVSU46
         dauFLsv7Ji5/hhrDLdJFIKPI0UV07E1FazIonz+WbQ/f8gC22ar8BLqBBiW1A7djMQ/A
         vKew==
X-Forwarded-Encrypted: i=1; AJvYcCWPGyhUPAG/uU20rqB9JJJBM5lHayY69ihnap3ozWSYHshjIwmqi/GyN83Ih2lMS/g7MfXXJUphsSIhZYwIAtw=@lists.infradead.org, AJvYcCXB6pLcCoYFCPg/+zVk1vEJ7ptGPnE+Qpmub5I2jOFcalL56ZQNVby3hRkDmbrzjyQEdcohyN7N4iOG+xxj1o2u@lists.infradead.org
X-Gm-Message-State: AOJu0Yx3/cm5e1Cqu2JQGg792q+baWVd2rTuRe7xv3yej+3jSMeVWyOL
	jXgYWQPk1r+/i/4kELTrZt6Wi3jfPyCkd5Avs2qUTOG4Qa/3YUq3
X-Gm-Gg: ASbGnctKPaTRwYRYXzM90hGUBW/lmazxVAl8JWN1AvnfQtseHWjWfjQgY01epMGr7Dw
	FR2th4EyDwMLSX5p2k5okof63dcaPRE7cfipemn9phuXKz8FrW6fDwY2DUrV1Pn6IqJpQlkjfkX
	qEPRH9vntE4FsuWYhpePanqoMlAPyTDB9VvC+LwSAHSKc5leFekjrK0UEqudp9QZpLju1skLb0v
	IWOa38jBWsQdhiGnN+jwNt0/JEjpLF2srPeAzMf4aQ6tbymQ/l9sbkuNPEBusLSefqlJqB/
X-Google-Smtp-Source: AGHT+IH2NEP4UNloaXkGthBrT4sL9NKjk8qQkyz+9II1I0gTS6OcTxLGYZEnJoB0B/zOf7Oz+BxRJg==
X-Received: by 2002:a05:6402:1d53:b0:5d0:cca6:233a with SMTP id 4fb4d7f45d1cf-5db7d2f59cdmr18220018a12.10.1737554923323;
        Wed, 22 Jan 2025 06:08:43 -0800 (PST)
Received: from [10.176.235.56] ([137.201.254.41])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5db73edc913sm8724961a12.73.2025.01.22.06.08.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jan 2025 06:08:42 -0800 (PST)
Message-ID: <86425106b6756a45444e8f0479c7880cc78498ce.camel@gmail.com>
Subject: Re: [PATCH v2 1/8] scsi: ufs: core: Pass target_freq to
 clk_scale_notify() vops
From: Bean Huo <huobean@gmail.com>
To: Ziqi Chen <quic_ziqichen@quicinc.com>, quic_cang@quicinc.com, 
 bvanassche@acm.org, mani@kernel.org, beanhuo@micron.com,
 avri.altman@wdc.com,  junwoo80.lee@samsung.com, martin.petersen@oracle.com,
 quic_nguyenb@quicinc.com,  quic_nitirawa@quicinc.com,
 quic_rampraka@quicinc.com
Cc: linux-arm-msm@vger.kernel.org, linux-scsi@vger.kernel.org, Alim Akhtar
 <alim.akhtar@samsung.com>, "James E.J. Bottomley"
 <James.Bottomley@HansenPartnership.com>, Peter Wang
 <peter.wang@mediatek.com>,  Stanley Jhu <chu.stanley@gmail.com>, Manivannan
 Sadhasivam <manivannan.sadhasivam@linaro.org>,  Matthias Brugger
 <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>,  Andrew Halaney
 <ahalaney@redhat.com>, Maramaina Naresh <quic_mnaresh@quicinc.com>, Eric
 Biggers <ebiggers@google.com>, Minwoo Im <minwoo.im@samsung.com>, open list
 <linux-kernel@vger.kernel.org>, "moderated list:UNIVERSAL FLASH STORAGE
 HOST CONTROLLER DRIVER..." <linux-mediatek@lists.infradead.org>, "moderated
 list:ARM/Mediatek SoC support:Keyword:mediatek"
 <linux-arm-kernel@lists.infradead.org>
Date: Wed, 22 Jan 2025 15:08:40 +0100
In-Reply-To: <20250122100214.489749-2-quic_ziqichen@quicinc.com>
References: <20250122100214.489749-1-quic_ziqichen@quicinc.com>
	 <20250122100214.489749-2-quic_ziqichen@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.4-0ubuntu2 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250122_060845_741218_EF0FEEC3 
X-CRM114-Status: GOOD (  10.31  )
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

On Wed, 2025-01-22 at 18:02 +0800, Ziqi Chen wrote:
> From: Can Guo <quic_cang@quicinc.com>
>=20
> Instead of only two frequencies, If OPP V2 is used, the UFS devfreq
> clock
> scaling may scale the clock among multiple frequencies, so just
> passing
> up/down to vops clk_scale_notify() is not enough to cover the
> intermediate
> clock freqs between the min and max freqs. Hence pass the target_freq
> ,
> which will be used in successive commits, to clk_scale_notify() to
> allow
> the vops to perform corresponding configurations with regard to the
> clock
> freqs.
>=20
> Signed-off-by: Can Guo <quic_cang@quicinc.com>
> Co-developed-by: Ziqi Chen <quic_ziqichen@quicinc.com>
> Signed-off-by: Ziqi Chen <quic_ziqichen@quicinc.com>

Reviewed-by: Bean Huo <beanhuo@micron.com>

