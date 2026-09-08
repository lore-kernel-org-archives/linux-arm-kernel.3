Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B2D8C79F9E
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Sep 2026 02:33:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HGD5b6Vz9R90sdvVguq5WIje3KUQbM5Qm1jcj6Nw7+U=; b=xW5M4vNcKxorWFNixuBflKMIYH
	WaNpKDtbrmxroxZdpaxFQLRSA0lgenLWw+L5hpZ1AzXQNHoqEOlxGPRnreMZLk1OP1cU1cXzpLUUn
	I2w1us0vnpeUjNCym6N/ymzZbLZxbeTO7FGsyTQ6b29CUNSAPQc7O2vGo52GetOV30DgW8K2JcVWf
	3kYMA6ro3knnPONpDjlRtjKIc/NtZ6jnFYNQaQE6y0Wiin3WVwer+UiRFCio10Iw0iQ9s2vX8VRRh
	ibhP7uuu99eN182rVC8S1G+sh7m52+oI24f6chP2wYM0rAThOZRGqc57XNsxc5G/33ShHMTndKYmg
	2uwYUsrw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3lde-00000007vx4-2oQo;
	Tue, 08 Sep 2026 02:32:46 +0000
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3ldc-00000007vwZ-2HzL
	for linux-arm-kernel@lists.infradead.org;
	Tue, 08 Sep 2026 02:32:45 +0000
Received: by mail-pf1-x42c.google.com with SMTP id d2e1a72fcca58-8568e3ecfc3so2721665b3a.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 07 Sep 2026 19:32:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788834764; cv=none;
        d=google.com; s=arc-20260327;
        b=qXdu8J5FoCcspJ9T+fTy9s/oDV0pvZsh3PEBtmV+y2ULL7/nJ03WjGLOU3ImNGn4IV
         KVqmA6njfxbq2bq4l8rP1+cGeTwdo8bAU93bbZTR/53wFhVuRBgennbBf0EudOP0f+DV
         u/XxroOgaT31c8Rrc88I68N3dkbeirll5sm1sCWQfLrEvQrvaisXbdvXZPfdnbs63XId
         S4mteJ37wtZPRuSFETmFlprPWR3ZkFf8E/5qMskC0qp23Fezif9wNJFD1S8I45naHEmj
         gZ5Zt0ljUm05wpfl5UDvyJVZhGlyXwP2DDoVRYjq+TYzWG6ZUAMBoWb3TTeN7RB/iOjZ
         7nsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=HGD5b6Vz9R90sdvVguq5WIje3KUQbM5Qm1jcj6Nw7+U=;
        fh=i118E7PgfHyaNKrve096NU1E0Vr9I+dDddFUaRhUMMo=;
        b=I3/JE1SgNKJQ9iDpE21nkiLZctTf1pwrwJ1tojgso9KDe9y6WWJ+X06kYRWSnm6inS
         lGaBnOid3PRuEuqfbwmvQt3ysHEurUwOWsiUxMNrD4oJle6WncvA0n/ledKvkYJM/uru
         uJdcVuH+4BKiSyqBQfNzt9aWJbK/0tl/QhaHzdiw4dvsPbnUKKn2BZCZ8QE3wdQrFP93
         PSQyyM8kd7x+GT3rOPerjwi3kFQax/kMoUpKlsuANJ6E/qdaWfDeqyih0qZ3yZ1tafCy
         HllmzOWp5E3OOmUNK1e306sW8KbbaDYqfmLCU/8jIt5CvA4HMArCnUqC4dv1Z0DBAcmC
         mCHg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788834764; x=1789439564; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=HGD5b6Vz9R90sdvVguq5WIje3KUQbM5Qm1jcj6Nw7+U=;
        b=bViAq78ujpYY094g82LoIooExFuqQhiKMu1wPTtGA+x0N16OAqJ1GqfRgEaQqlo2fN
         idQPuRvu0uocWzW4POkudJBsaB0+cXgTT8Zpawv/As0h1+8/QtD2XU4KF7s92WW8F8BX
         uKH9Af9VPrGdOugJoCohy6Yr5l7qUNJCluMwdhXC0VBlS+XjO0FVyxvG+tfVYirZfsqP
         5xG8lOHfUN8lZHEnwn6mFnZH6in92mA+wvuvF18d2iRfwFAVuJ75Ym/h74uIyx3uwrOs
         Wp06XnYoh/x3vpaoVocPO4Zrsf5/Vg+XVG/mYebG/Q7YTcoP3BvdqxYXtmKC04f8waRu
         rj4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788834764; x=1789439564;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HGD5b6Vz9R90sdvVguq5WIje3KUQbM5Qm1jcj6Nw7+U=;
        b=RFCOoAAqVRQLYvPme63yiF0KrFuLlGzbgqFOcU2pzT04Ip803YBtMQG+W9//ya1NcI
         CnsWq0Jl2dHiUABgukAO8jM7GbHNtSd4h0KxNBxb8oymsTXJYfmOGj7j+JHJvgsimY8H
         685uuAy3RWf/XjXxEqHoicfLrjyU5ewP6Crdn/g+ffG3HDkf9vAPmcU2BQCC1GlbgiG3
         Mc1lh1zVIkNwKTq+508o/h2DpTa4jtKM0jk2Ow1WJn8nVTUmUS0DVaRu3mePdghDjrQZ
         0Qt/VotTMZYUvgpj85eX43oSaWeKM9UuowDXpssoEuTgj+Z7Qsp5NEperuqDmJimjcxU
         KnEw==
X-Forwarded-Encrypted: i=1; AKwUvByiri2xDY/pHnIGjkOobv5T1mDOBx7TANhQpWt/VdYkusflphbV6ZTVaEfV9xQ4qcnN9TxZfN8MzYpwziPBNtYG@lists.infradead.org
X-Gm-Message-State: AFuF++kqwTnTP00eidx1RMNRcsXmGSiIjJytfxialruTviASIi1SzpbS
	N0MvaVhldjiqRJvavmyfCq4cGtq0G2cM6y4vBVG39vuItjXH5X/W6R/pQ65JREFc0VN81Jqxn2x
	0X/BO7eJCPZ8EycrLiKd+cEXJdaNgHc16JD6K
X-Gm-Gg: AYBFou2QrleZfvVScuWX4ixTJijGMb4ddAoguj2k2k9ny8Qvo40tr/dauelvQVJ9LlL
	szLYuishikeaJ/I8jNQU1Ltr7Tzydo6tcg27zJpVhpl6ZSPpuZnHxNVURkGYqhyf1R4Px/sFYfe
	J7k9cVXBTMfpdUmb+qiPXPJYAYYu3obaQX1ZJ59Q9olQWqUbzKLdHYsm5k4C1v5kOiApK4qrISa
	EIxfk+xLb/LCqEZzmMkA/Zx1lKGVy6AVmus+TtmV5ZsZEN0cMiBelSnnwFXO0yf/Ta0BjYaCZHe
	uiWvRU2jzwukDKu5Z+YK8EJmCFv6wqW+DMx8siZIjbDroH1Cd8iC5NtTehoIXrPvEQUIv8jOdAr
	m+embiP2nm4AaE425omYDRlQxBOZd3fEW81hCf38MorTa5Krd3W00ycyv
X-Received: by 2002:a05:6a00:10c9:b0:845:363e:12d9 with SMTP id
 d2e1a72fcca58-861660e3dacmr35566950b3a.3.1788834763748; Mon, 07 Sep 2026
 19:32:43 -0700 (PDT)
MIME-Version: 1.0
References: <20260903073252.339250-3-phucduc.bui@gmail.com> <178880965410.219967.16945994924537630103@kernel.org>
In-Reply-To: <178880965410.219967.16945994924537630103@kernel.org>
From: Bui Duc Phuc <phucduc.bui@gmail.com>
Date: Tue, 8 Sep 2026 09:32:32 +0700
X-Gm-Features: AcwNN1Uc7OOBBtUyoJPMDv9iTOKu63-H3SRX_PRIcuXsc9hMlCIYJizmbeV2DYI
Message-ID: <CAABR9nHd-S-3MgTAZk=JMCDEkHjuHqwsE_9h+14tXdhvWdn_SQ@mail.gmail.com>
Subject: Re: [PATCH net-next v5 2/3] net: xilinx: axienet: Handle optional IRQ
 return value correctly
To: netdev-bot+sashiko@kernel.org
Cc: radhey.shyam.pandey@amd.com, andrew+netdev@lunn.ch, davem@davemloft.net, 
	edumazet@google.com, kuba@kernel.org, pabeni@redhat.com, michal.simek@amd.com, 
	horms@kernel.org, andre.przywara@arm.com, hancock@sedsystems.ca, 
	netdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260907_193244_610300_2BEAC865 
X-CRM114-Status: UNSURE (   8.55  )
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

> Critical: 0 =C2=B7 High: 0 =C2=B7 Medium: 1 (1) =C2=B7 Low: 0
>
> - [Medium] net: xilinx: axienet: Handle optional IRQ return value
>   correctly =E2=80=94 the patch carries a `Fixes: 522856cefaf0` tag and a=
=E2=80=A6
>

OK, agreed, I'll drop the Fixes tag in this case, since this is a
no-op cleanup rather than an actual behavior fix.


> Pre-existing issues:
> - [Medium] DT binding vs driver interrupt indexing mismatch (pre-
>   existing, not touched by this patch).
>

This is a pre-existing issue, unrelated to this patch. I'll keep this
patch's scope as is.

