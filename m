Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52252CA5FB3
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  1 Oct 2026 08:26:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=W0Zrat5nw9wyDAslGsAewf6QugMnqYJ61MC6tpHasAY=; b=PtQcBGYj+dSPkYwY1DxApUhY0a
	bao5CxI3HWcdlNXFSB+X5oqknKlHQPzlVsj92TOf8/9R6lmNAZoAqPxY5soqXVnEnC2Z+Wd9Yv+QB
	44YrWZhVI0MYPNTlAxaejYTVFFVFh1wj1sHhnWJz9DPQFwGZ87vC0bF+TXUidZqDmOcs7J3CCtFUl
	U0d6E0o8b3mBptM97LLX8W7SD0+R2pqZriOQKR2/D32ogbEf0lDqAn29+hFZNPabW62jmvfIhLNf4
	wkAcf4E2uW1S0TItssa5TP6lNtZeTpUmyDw3HNAqc29L3UFIcShSpEozXL5pSj5HFBXUU9GoYw3K8
	C972X3vQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCC74-000000089ty-46hL;
	Thu, 01 Oct 2026 08:25:58 +0000
Received: from mail-wm2-x10.google.com ([2a00:1450:4864:31::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCC70-000000089qO-3Zk3
	for linux-arm-kernel@lists.infradead.org;
	Thu, 01 Oct 2026 08:25:58 +0000
Received: by mail-wm2-x10.google.com with SMTP id 5b1f17b1804b1-49fff6f0f87so33391625e9.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 01 Oct 2026 01:25:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790843151; x=1791447951; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=W0Zrat5nw9wyDAslGsAewf6QugMnqYJ61MC6tpHasAY=;
        b=f9izIR+UHJhvCynqByI+JWFKKIoWKbEcHkAhVK9pLyqv/TJukRRKBMxLtqdTOG1g6w
         d3Z13hyG+tqFEsjHKgilkCm0WIZu5x3kogkQVWKIGjaP4Wxidz6Kn6dZQl5bz1fjeHKm
         mMdZSWPjPgGzVEFejLXYPTh+zccN1o64mWlzPZ+JLxAgxqXB0Yk6Xkfz8OVZB9grWSoW
         Kp3Pup9uqDB31uKLtCyYIfmErsV8iEELo/EtJ0vNW3N3Avtd9CTyeNArVkr4S0EFmkX7
         e6uWSRGJtxtZWf5bqYmt3DUTwdN+w0Lq8UuXxaTjDMLwDgkihlv4INzximjgbjNgL2Oa
         IDjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790843151; x=1791447951;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=W0Zrat5nw9wyDAslGsAewf6QugMnqYJ61MC6tpHasAY=;
        b=RJprspTO5/Z7rZspgQt5PCqX2LLVM+l5TZEUJdRokXiot7uWD4y0C9RhL+qipLSw5Y
         gak0YKfd5f+Dg94nQJqHqTZ+66dfpOdGoVwh+DoV79gaTXjulFbug7qOjyjibbZa9n08
         1Vi4QCMhukMUAJ/hV083O1mOccRSbeVna25tV6lOUv1Tq4Ubj01euZfMvTmDRV2XuAZa
         7TDx3No5SXoyqYXNXBusMKskQEfEctDgaY0NJeBwVAZLJ5WyN0/acReIfa+gtfuSBj9+
         OA9inlbfIty1AzMQEWZEyUXDglQtZZE4ByrQsBmLLusg+aj96zN8+foGCa67G96EDVGc
         q2Dg==
X-Forwarded-Encrypted: i=1; AKwUvBwkUiTyDZ7dJapoHmvhWzoo9P4CXVaJSOb9oZch8YQLpH/SyZZnlXFyv84YCYREs0AVA1bnYYtWtkVBrsKog5iK@lists.infradead.org
X-Gm-Message-State: AFuF++m4ct4EQVGmyMsR16Rzq49+RZKR7iZ90GkLw1qlEg/D0OfbiBd7
	BxPZ+CJPjevVhhl4bvvZpk4HMgVix0pSrvFDBWoJqS1Pk2hMhlZ4Eqg3
X-Gm-Gg: AYBFou3ALIJ24jGj4nsjL/FBi+UdyLNN5foCXnDrh47u17QGZaQlyhzW7F780kq7INB
	CEE7b6nHltRCShK9gmeYVrVJ7PFXMFXULDevw000YIrhaNWIY0Cd0tqeHDNCqQWC2/Ca+o1Giff
	4LtdSHC8noetH7wiCJgXc3Va/FpJ23ntVdxnkjSnJg0ccwZgOHT8va50sKBYnZ+ptmQ5SPH3NLS
	SY3d2aSS3w8kkr01F5lPkAmrxPJh7vXHEFaeIU6rrALv+x/xeuWHKtDMlOmrngNOHtWboy2leOi
	OiFnZ5iKctQ+T0CLYeDbh2MPCT4q9iUeekW2JdmwQxlRfdEHjboRfUdOUpbsSERNIzx81WWHWWs
	4EKnjh/LNRKY1Cn4KWJBmRJDmiNXRRZcVOguko4mLKZmcV5O/MpPkzV4FM8ekpWXG3m5PokNptx
	2THlWrVUIbPwR1BiaGIsurjSdzH5kcvxSdUu/zVvGwCrr0oX51RNYlhooiYTEximeFusUj2JvR7
	Zu11tvjOAu/3ZEIOOqVRjAPOzszRBggWI57DhueBMIf57Jwr8OP5X7SEePISMJD1TEyRShtEg==
X-Received: by 2002:a05:600c:a45:b0:49e:6c27:d093 with SMTP id 5b1f17b1804b1-4a01afde48emr58311595e9.15.1790843151361;
        Thu, 01 Oct 2026 01:25:51 -0700 (PDT)
Received: from ernest.hoecke-nb (248.201.173.83.static.wline.lns.sme.cust.swisscom.ch. [83.173.201.248])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a01f947898sm54455885e9.10.2026.10.01.01.25.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Oct 2026 01:25:50 -0700 (PDT)
Date: Thu, 1 Oct 2026 10:25:49 +0200
From: Ernest Van Hoecke <ernestvanhoecke@gmail.com>
To: Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>
Cc: imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
Subject: Re: [PATCH 0/4] arm64: dts: freescale: Add Verdin iMX8M Plus overlays
Message-ID: <rq5ndq2sqsyoqwhnbdy34etudy4xevdqpm7imgd65uu6gy55nj@wpt6jrgnq2vp>
References: <20260907-verdin-imx8mp-non-camera-overlays-ready-v1-0-ca0c63c2994f@toradex.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260907-verdin-imx8mp-non-camera-overlays-ready-v1-0-ca0c63c2994f@toradex.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261001_012555_675564_F5176A13 
X-CRM114-Status: UNSURE (   7.94  )
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

Hi Frank,

Is there anything blocking this series from being picked up?

Thank you and kind regards,
Ernest

