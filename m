Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 510E6EBFD0A
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Apr 2026 07:45:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CPGB450BgNYljKUDXZxUQRXQWnX1iFE/RTDC2ASOQ6g=; b=v72Y7g6aS8NJdEiH5IUPNoqJNY
	3Y0uOjik4tqOjzAr7/szMaoXyFIAZJ+MaSdhy4+NsKRIln722ffa/kRRbfNy6a+4+zHIF1zcuTKfg
	3k6q2lWBPEkqmlyNAbcE57NXENKE4+6Ryi5hMFCqljOv1ST7zo2oXv1CEXDu6U+OwEga/mX+KcKqc
	iKmbpryFOWmVlfrO88hwCHp34eDA7ZvA3VIZqxylwKj5KrhrNgQSFe/yZBvbEkztqS4YexioCz+MD
	mdGI+sG1I7waMjV6D1ImtC8rVtI9as7bkwwt0Qs8QOZ0jVmj6bZ7TtKBnsF9lZflj1HfbO1RYPoO2
	ze3gvpPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCBzQ-0000000FBH4-2kXA;
	Mon, 13 Apr 2026 07:45:48 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCBzK-0000000FBCz-48Jj
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 13 Apr 2026 07:45:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=CPGB450BgNYljKUDXZxUQRXQWnX1iFE/RTDC2ASOQ6g=; b=E8s/TkMRin8iCO6uafhqXD8iF4
	tAFPWw4j6Pqmr037CIFPb6oW3Ey1EVJIhx5IuJSt4tgmFH8hgQr07S3KMCWh0VLp0tJdo/9SOL1Ag
	UC0mGgBR7oa8RLW9ZXWRmcs53n96jeg5gy88zZxBgXsh2FYq4qzZVdcvTJ0poFby439dU3PhwOklL
	QGmvDlWPvg5bq5nSePJ+IyLdrlz36dfSfwT/EjkgC3sQUZ6IPkILxGzAwSp8t43Mnfyx2xg9L7c1y
	7GPCjNmHZuk/wFdfJbQ7A1yLrK00ladb6r0XIz3xuNODOV8UUlgvixDXBnYEfnbHxqoMVVLB5vU/x
	Y0WZCRdA==;
Received: from mail-lf1-x12d.google.com ([2a00:1450:4864:20::12d])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCBzH-0000000GJHT-1jZ7
	for linux-arm-kernel@lists.infradead.org;
	Mon, 13 Apr 2026 07:45:41 +0000
Received: by mail-lf1-x12d.google.com with SMTP id 2adb3069b0e04-5a2a70bb66aso4263219e87.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 13 Apr 2026 00:45:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776066335; x=1776671135; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=CPGB450BgNYljKUDXZxUQRXQWnX1iFE/RTDC2ASOQ6g=;
        b=F730UE4x2ejkwaSAr4Yll/RDTmZrgyQENu7btnMuSXkNxlmURWrQUSoCjO1K0TDZTE
         RJuyv1qFTGD4aEsnl793ob/U9lvZOMsp+teIRFE7Nq5om4Bso0JEL7mNG8EYLfqlh4qp
         V5LrPTD6cQ24lYI75vh2yFBBFeeZfGbT9gwb55K1ZCYS95XuPrfGxg2yiblvATDzRM/m
         CIKiKVuNRusyAHnZJAKwrPsf8GpeHHppN+xt9UhXTYutuWnS1iAWrExzBejT82rL6Osy
         THsWYsAX6wdt9l5l1qoi7G7oskZVX1IyvenbzEJEAg+GWQs2nNS1Jy52YZuqy1oraTOB
         80Iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776066335; x=1776671135;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=CPGB450BgNYljKUDXZxUQRXQWnX1iFE/RTDC2ASOQ6g=;
        b=sNy8JBXSHLHFVq04hsUnSNHMKse/EtXE7OFR3lR/ySc2e8Di/qePBwA7P7beUhAdeI
         RBTMjZv9edaiXhe6JI4RuVATwWSqVhcb7JoynG41KAhu2qVIaXBAgSv3ZMsSND6As9hp
         uHzjqJ1ZYiP3V1z/G3j74b+AmzSizpevLkaioT6EkTp1DXAA9GwkzJmHgrCXXEPHL7Od
         dw7waHdGfM6ZeqDdY6NrOiFi+cMhgoTgl4/m0kVHkJRQBT5BMA3Qbwb6KNIVEPjHdh1o
         k1U9yCMVI7RgBXK5U9gum0O+4nT134tdTY9e+0N+rdAsHVFro/PcuxkJINeKCzsxQLQT
         A2AQ==
X-Forwarded-Encrypted: i=1; AFNElJ/X394n8UETRFsV1Jr1rsDz4/qfvgusr7aXb1AJ4nH1uKb5D1uzt9dggEwLFBuDkAm6Sj4fhwJ2BIWjMzPNuwgW@lists.infradead.org
X-Gm-Message-State: AOJu0YxsRY8iUpQoD+B8fLBtT0sfod7BZf80md87gUxMeyce0VON2gxO
	VFCp91wQ1DB/8N5O0qZPEtiPCFw0UUXludYcYuHT5Y9n5qJUV73lN8cR
X-Gm-Gg: AeBDies03LOaOvdrMlTT0gcMAqfoz//EQHtkrNAxN5ELM2j+7QwB9BtqyUPC+RvE05A
	jqBbeLLPGusyQSEDRp+nJUrQ4utknYl1EdsWLK47cBI3oHNYxfsO32s+ZOncTyWtCa96Tx+MFYz
	JMGAygBpgx998jjw7gimyakZeMe+zeq00U8WIB81nGS7y7b20hGre/SNLYXko3sQoT5KHBbaKp1
	gbi4An3I9fQghJCMp2bbXjji1A2LWeTDilmRPJfMUX/ce2XiYjzD9GKj+zHBhPfZEBvtLTKdLRV
	TA5WOx96rVLhD7KH+JkvVkS4kT+QklCVor2y2ATAtTItDI77is13YIKUKa69GpstW8a+8WX6rE1
	2+y6zPa0fg7r7EzpYVcIfFVJ0Bi1SUGGpsGml3xrgqNMmqNd7HGGyjixBWp07G6s8hM5BRpL0GV
	8C+xhWSzw5a7mTUYD4MDfVk/cdmsuB+6L6L8JQZvJ2ZXBREgeoDq06sJeOa+bq
X-Received: by 2002:a05:6512:3c87:b0:5a2:cacf:5b2 with SMTP id 2adb3069b0e04-5a3efb299demr4803771e87.22.1776066335061;
        Mon, 13 Apr 2026 00:45:35 -0700 (PDT)
Received: from gmail.com (83-233-6-197.cust.bredband2.com. [83.233.6.197])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a3eeefb849sm2411855e87.60.2026.04.13.00.45.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Apr 2026 00:45:34 -0700 (PDT)
Date: Mon, 13 Apr 2026 09:45:31 +0200
From: Marcus Folkesson <marcus.folkesson@gmail.com>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Peter Rosin <peda@axentia.se>,
	Michael Hennerich <michael.hennerich@analog.com>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Andi Shyti <andi.shyti@kernel.org>,
	Andy Shevchenko <andriy.shevchenko@intel.com>,
	Bartosz Golaszewski <brgl@kernel.org>
Cc: linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v9 0/5] I2C Mux per channel bus speed
Message-ID: <adyfG1jckNp3Sv2_@gmail.com>
References: <20260324-i2c-mux-v9-0-5292b0608243@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20260324-i2c-mux-v9-0-5292b0608243@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260413_084539_750311_D83EF5C4 
X-CRM114-Status: GOOD (  22.92  )
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

On Tue, Mar 24, 2026 at 02:54:14PM +0100, Marcus Folkesson wrote:
> This was a RFC on how to implement a feature to have different bus
> speeds on different channels with an I2C multiplexer/switch.
> As no major complaints on the design came up during the review, I
> decided to submit the series without the RFC tag.
>=20
> The benefit with this feature is that you may group devices after
> the fastest bus speed they can handle.
> A real-world example is that you could have e.g. a display running @400kHz
> and a smart battery running @100kHz using the same I2C controller.
>=20
> There are many corner cases where this may cause a problem for some
> hardware topologies. I've tried to describe those I could think of
> in the documentation, see Patch #5.
>=20
> E.g. one risk is that if the mux driver does not disconnect channels
> when Idle, this may cause a higher frequency to "leak" through to
> devices that are supposed to run at lower bus speed.
> This is not only a "problem" for changing bus speed but could also be
> an issue for potential address conflicts.
>=20
> This patchset has been used and tested heavily the last months
> on a custom board based on a da850 (DaVinci) platform.
>=20
> The implementation is split up into several patches:
>=20
> Patch #1 Introduce a callback for the i2c controller to set bus speed
> Patch #2 Introduce functionality to adjust bus speed depending on mux
>          channel.
> Patch #3 Cleanup i2c-davinci driver a bit to prepare it for set_clk_freq
> Parch #4 Implement set_clk_freq for the i2c-davinci driver
> Parch #5 Update documentation with this feature
>=20
> Signed-off-by: Marcus Folkesson <marcus.folkesson@gmail.com>
> ---

Any more feedback on this patchset is very welcome.

Thank you in advance,
Marcus

