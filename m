Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67B86C79F8C
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Sep 2026 04:51:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SHMlaR7e60WLjZys1KqBq2H9AqQjLlKM6AeYANxxwuc=; b=eNjdr52jw3JV4CyC7wTeXayqOG
	JFEzsZe5cP6+J9OJ8cDsmHLwUgKxPLYEDJqPMSoU0EyHSM78toi4uCiW/CtI3eBIiwPN54Ab3GMpq
	vFMaR7VccaLZJ4ujUfL99glsCSUeMPTlsyuAQIWP7F82LkA1udLbLwH7ZUMh0NsXB1zJVvRSsnl1D
	c4vEVw3EdvOn7od/LmXxH2FfV17O88pcYqn//kUst0B1WsJPth8iEQ8toCGHDkYNQgRfW5iy2BZD8
	0nbT/Goye5n823i4CMVOqEn1Xw7rI1X18QNOisblDduFE6eKUeVA8QGOUfxPPOj0KF+ds+xV6Ih9g
	mz2TK+Sg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4AHE-0000000AllQ-2Ndd;
	Wed, 09 Sep 2026 04:51:16 +0000
Received: from mail-pg1-x530.google.com ([2607:f8b0:4864:20::530])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4AHB-0000000All0-3dfj
	for linux-arm-kernel@lists.infradead.org;
	Wed, 09 Sep 2026 04:51:15 +0000
Received: by mail-pg1-x530.google.com with SMTP id 41be03b00d2f7-cc48fe04342so1937040a12.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 08 Sep 2026 21:51:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788929472; cv=none;
        d=google.com; s=arc-20260327;
        b=p7XKdkYDVsbsYfIv82irU/mH0nhhemNlbwBy4AF0vx6FFHUfz8Sq7ccCS3Kl+9qy46
         JRr8hnQ+6OzMTSVwTIi3JXkANtAvv7KD5U7fSfwdT0QTGtImh3jgUfgMrgcXAZJbyyUy
         3iOBur5nAey+YGhp96It7yYxKn3Nla3/6mPwAmGI9WBAjVwSt5ExMI3qvtwdaRKl3Zox
         pNwDrfoV1J0d4ofaXde8GXSEM3ozhudaemC+7nbaDKxlCjVyDxxy9NiQW0pjHuhRbgbV
         9H5jDQIIj3OkqnipfIYqoRjAfOh0z3ceqEJiYbgmwybPcqtCJKiHjSCh2JQB1Jbe9YJL
         gRnA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=SHMlaR7e60WLjZys1KqBq2H9AqQjLlKM6AeYANxxwuc=;
        fh=OduC1u8M3N+gcWF4jO+LohRnyZtkkgsrA/fONjsiNWs=;
        b=imz5BeVDtU/YsYGzh2Q0cMCTIx/JbjwSQqbpCNgUGrSdNSDbFol7FXf4FuIWR6HQwa
         Ur+wrjT3DtGIzAjqIT9KSdTxWjBRNcbrKAd0aYmVaEOjBdsOs0pUVPgsmtrCsA6hUz6+
         Djm76NzuM09pB35IVHeKiZ9OdyXswzdJIYdV7KbD6Vhb6kmPau3ibcp+WdOcF5ItjoCn
         wVCznLv7MqUBdov8pTy+nv5BL82/AtFMiJbNS50YTNSfrr3prqfk+s+Zw5DZdlla/BMq
         FRtaPyrpov2EANeQrJR7MhyhgMc0F4fXMQBg1LYtosQ94JoBBb5Y2lwD9htuLhoyqLDz
         Thjw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788929472; x=1789534272; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=SHMlaR7e60WLjZys1KqBq2H9AqQjLlKM6AeYANxxwuc=;
        b=LGDRHx9cR0z6Inv+gyZYxB37ljenTckLjX6otns0ObGLHS7Xtuvjxhjns9P+iMPgCt
         dxZaXDmrKsJFMNPnnGPFi2225+52zqKw/Ox/sXrWbaAJ4iZJTnINWooJ198C/Ke3CEoB
         iFtR3u0rulQbgA3/PiZSE96DJybTVE0SEqO0Qx2A4ItpZqAeK0QPAJvJ9JNmODj+Z9DZ
         QyCYXE3d4DM/FWf9tHouHFE718meYxjCOKkprJx9pLNRuW+FZ0rZEv4vKkWy6lHG4mIX
         5k63WR2UDfWSUha8mfEKLZ8d/L5vtAByn7d+xNrv33Ph7jmiWIMoyjkwWSIvt0q33xny
         zxOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788929472; x=1789534272;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SHMlaR7e60WLjZys1KqBq2H9AqQjLlKM6AeYANxxwuc=;
        b=FdEcuM2tVvRbxT48uES5mLz6YS9kDbuSjpqFTXoP/o/KGtCjLkMEVnuv8/lyTXCsK1
         xERNmKwoXNtr1wXQDBvUFC5WHazvxNhn6UwXLeIbjUyAZnLwfUQoMNGfd8z7ta+Rqjr+
         qFOpFRbEzYrJIvK4b4gBME8GwaB+Ws4p+9xYbhSmDy3W8q8ntYOqmNBKNTeivVLJJlVC
         Ja1KJATWS4OuHYVH7EDcrS6vPt3JX/eNZ6PjbzxJqlfdhzd3YmSF/BwF+D79QOdcLcgN
         zF1M90kOtfRXDu6C5hTU7DsAbGfisRGK0LYJ/p6dOAzr70t3gShXwRyGUCorSRwprirY
         jlwg==
X-Forwarded-Encrypted: i=1; AKwUvBym966KlTFBN01sPQHRY4alMASj4pSwEaXSoJU1CWaGnLOniad3nStnWFZIhHefcasyRqtw5UsS7100H6W5vGkq@lists.infradead.org
X-Gm-Message-State: AFuF++nv+q5AD4MUBF+FPKqxBCd2uPVvAo7VaPkpMAwxJcHeZP9Nk3eO
	QdFaAfZac1lj4IHOwrKPaCupB56GEoiODts8bWbrcKuaW7RwOEGQd9Y9FRLMH73FKG7jeC4VFts
	J0xcDpxgS1v/HL/nQvThaRISQext01qzm21F7
X-Gm-Gg: AYBFou1gWVtU+YXfNnIUZI1hKBVxYMBsaZeSC8A6SYh6TK9D5bIy/gXGdv3i5RuWToZ
	kwCSBqSF5Cq9+CKHiRVFI/uSiZ6xDisOIEl0zfwKcB4KO5aPouvdEQoaYzh/sJHWrawhkGNvpKi
	mCWfwzF34r0e5/h2hKY/PKewX+i/bHUxmUh8ucRaaKO58Gm11KSK8KwOL8k2rB6Y8FjWWKvhFCU
	gXG2aGvMNg4R21bXCIP0eh/sczja/6Myizmn3TbmB0elZ42gXtqoPO01QCxS43oaMwFiYZXO5SG
	71CKalL9PCF1DXa0DxOfVEySR4dVPyxPgTD8+DyTKM+f7TJgJhHfmso5keezIaJnqFZ3dTfBAdQ
	gAv7LCJKGof5kaCZWfpcPWxAb6Wt/VzvD6gK0ZEzzlVQwbhsyjP8PHD2llnkq+CsefBk=
X-Received: by 2002:a05:6a21:9102:b0:3c4:396d:4a6c with SMTP id
 adf61e73a8af0-3da39d18692mr53393702637.5.1788929472160; Tue, 08 Sep 2026
 21:51:12 -0700 (PDT)
MIME-Version: 1.0
References: <20260903073252.339250-3-phucduc.bui@gmail.com>
 <178880965410.219967.16945994924537630103@kernel.org> <CAABR9nHd-S-3MgTAZk=JMCDEkHjuHqwsE_9h+14tXdhvWdn_SQ@mail.gmail.com>
 <20260908084919.GM40544@horms.kernel.org>
In-Reply-To: <20260908084919.GM40544@horms.kernel.org>
From: Bui Duc Phuc <phucduc.bui@gmail.com>
Date: Wed, 9 Sep 2026 11:51:00 +0700
X-Gm-Features: AcwNN1XRE5IMlU-W-GlbxFhG9fEet9UOoPLMR7lj76kvZQxj4Z6jKvrR_rWkHeE
Message-ID: <CAABR9nGvQQkjRhpefze24LARK0ZNhYOr2NM=_j_ERifwmmycpw@mail.gmail.com>
Subject: Re: [PATCH net-next v5 2/3] net: xilinx: axienet: Handle optional IRQ
 return value correctly
To: Simon Horman <horms@kernel.org>
Cc: netdev-bot+sashiko@kernel.org, radhey.shyam.pandey@amd.com, 
	andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com, 
	kuba@kernel.org, pabeni@redhat.com, michal.simek@amd.com, 
	andre.przywara@arm.com, hancock@sedsystems.ca, netdev@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260908_215113_910937_939DC760 
X-CRM114-Status: GOOD (  10.04  )
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

> > OK, agreed, I'll drop the Fixes tag in this case, since this is a
> > no-op cleanup rather than an actual behavior fix.
>
> Thanks, with that addressed this looks good to me.
>
> Reviewed-by: Simon Horman <horms@kernel.org>
>

Thanks for the review, Simon.
I=E2=80=99ll send the updated version shortly.

