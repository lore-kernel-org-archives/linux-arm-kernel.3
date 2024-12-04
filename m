Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10CC3E7716B
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Dec 2024 15:46:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:From:
	To:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zsW3P2k6T49Ey7msdJFqq/bskLvtp3R1ODCsR+DajSk=; b=Hz99OtFZnKZJCRpc7YLw1qTR6q
	1Fex/f53cC+fPttalr3LFW/MYA6LxyaYvzHaUnA/xONWIsVzNyhZZZOH0kdZc792OMl5S/SSVbkkA
	WWSh19Fts/PxSxvyCrcqqR43IQAOdrn/Frbl0+B88sCd47RPwiMmfvd5mTp2P902KcE1dbkzBaNXh
	Vt9jYVi/0S5A+wQvlt7xzglbt1b/IabxHw0xYCAcesukOX+OD0vFjR9O59ZXYolot3+KZNBp6xQoC
	T1uj+IIaQ6QAr7ny6PSTOLkqpFxdfXxUYHCpHc/T4hypoMZavBCyiiXDUxsb8kQJDnWSET5DGVyIb
	OPO3GnZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tIraF-0000000D2g8-39O3;
	Wed, 04 Dec 2024 15:46:35 +0000
Received: from mail-10630.protonmail.ch ([79.135.106.30])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tIrZE-0000000D2WJ-2t9z
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Dec 2024 15:45:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1733327128; x=1733586328;
	bh=zsW3P2k6T49Ey7msdJFqq/bskLvtp3R1ODCsR+DajSk=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector:List-Unsubscribe:List-Unsubscribe-Post;
	b=NRNvUt7HhECMIl8yQpiHpQJ56mc1E5xg0aO3r2yXYdr5NqWkSLwnoMxa98HmOpN7p
	 kKV8D2fR0w+VLay45drsoikN9vp2ESNP4OKd5kjr+afHiAymDmWsW659qAPCtbUw5/
	 Ja/uK1u8HfR39su4/jw01Pk+45uBLnmy0SrMdHqChjfoj4xc6H4QNcJIKdHS4/l/Gl
	 N3v7Q1588l2b2T+3kzhxe9mRbeFrzOG96aMCmSpr+zbws6MNFeLu7J/PhP4V/5bPv1
	 pcMb1fOO1igHx0oFyE8F+ulJFJMo0YKdW1m94SFB6tXUO5KS9K0HiRzsg7kVjszJOs
	 Tggsc08QUktQw==
Date: Wed, 04 Dec 2024 15:45:21 +0000
To: hjc@rock-chips.com, heiko@sntech.de, andy.yan@rock-chips.com, maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch, dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
From: Piotr Zalewski <pZ010001011111@proton.me>
Cc: skhan@linuxfoundation.org, Piotr Zalewski <pZ010001011111@proton.me>, Daniel Stone <daniel@fooishbar.org>, Dragan Simic <dsimic@manjaro.org>, Diederik de Haas <didi.debian@cknow.org>
Subject: Re: [PATCH v7] rockchip/drm: vop2: add support for gamma LUT
Message-ID: <9Rp0NJW2QG5qDduowVaialZWN6xTe9KJFciu7Q2LERJZQXsUgFvMGXfcFaNznIEJEBpZeOdZPuL4fxOEFduaSJLuQJ3cIvN-fx2lEzYSBKE=@proton.me>
In-Reply-To: <20241101185545.559090-3-pZ010001011111@proton.me>
References: <20241101185545.559090-3-pZ010001011111@proton.me>
Feedback-ID: 53478694:user:proton
X-Pm-Message-ID: 6afc641a1cddc26bcfae7f62410b05a81c0b4b8c
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241204_074533_218185_9C70DBA9 
X-CRM114-Status: UNSURE (   6.11  )
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

I just noticed that after coming out of suspend gamma LUT is lost and must
be rewritten by userspace.

So I guess it will be needed to save LUT to a buffer and rewrite it after
going out of suspend during modeset?

I checked the patch isn't yet in the "official" linux-next.

Regards, Piotr Zalewski

