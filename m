Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78C1FC5DF81
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Aug 2026 01:49:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0Ua8XYpU22tIQ/rGIxeccBIdAfLW5KPd3qfZIOCS8kY=; b=EuJgCqiwdNAMLwQFJiajp3pNMJ
	9vZdjttbNgHnlp4llCuryILj1TeQ/ppnwchbdgprSjO0DFyNsv7dAqqpaWVTr68W5nrxlqz+YHczm
	r+WAV53GjmjsJeTSDa/BBaYDPl+mbdhnYT2N15jatAjzHML927CXzUTpssiCkEiIDu1IqLlIfcRk8
	k1g2twvD48zi7mtPQM/Y4nGHhFKuLn2v0UI0BUUoSD0XlTMOgq/y4v3VxALQvBW6WEMCt2Xas2jre
	73wcFTn324pVBWWm5UqleM2vysg/ORACQaqeVztL0TQevn5og1Rzo2maKE1Xi6ty3RbMs1dx41Mv5
	prUZS14A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwVQd-00000008qS2-23xt;
	Wed, 19 Aug 2026 01:49:19 +0000
Received: from mail-pg1-x535.google.com ([2607:f8b0:4864:20::535])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwVQa-00000008qRh-3WHN
	for linux-arm-kernel@lists.infradead.org;
	Wed, 19 Aug 2026 01:49:18 +0000
Received: by mail-pg1-x535.google.com with SMTP id 41be03b00d2f7-ca00f126b7eso283767a12.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 18 Aug 2026 18:49:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787104156; cv=none;
        d=google.com; s=arc-20260327;
        b=hBaxf7QerMyYXvLYZ0UoGrLRkqOtqPwcamLjNBK8SV4YEoJqyp50TyaH+Y3nDlY5G9
         eEepJtW+SAYeSqSIa+uIe4FbA0b++9lW+kvtsIDncXQaVcbRFjJFT0MkNGcoySMtI6WN
         SFpAL98fBt2PnGqB0xdG6hLypdhLTH/hV254kc0AXRmGC2StscnpHr5oa3RaARrapEBx
         MoNzwtUeYjjXv34TqFqnk2/5GrfDN/fqlm3I7vI6aiqKaXX7qROqVTJaBbKqKZ4Syquj
         /Sp46men1QIiUweuE1tBOHM7DZvqBWmZkFTGiBS2B8GZvQZ2YZSAyONEwwaKrb8Bif+i
         aMig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=0Ua8XYpU22tIQ/rGIxeccBIdAfLW5KPd3qfZIOCS8kY=;
        fh=PYCAfqCRRQ4TaT6dCVjPDbIddBiN4E31Ntt8lXYfGrk=;
        b=q8WvUOownEOzL5ZGk7Q6sMb5olduyN5N+2IE0QcFqw+bAFP7LD6qzghTyuV6Xq0XjL
         /Lbd6HLGL5cs5MrrWdzm+OKrJSb239iYY4VTEEfpXfJ4i+AIejRgCn/3u8hCq8Ygg3wx
         tRIRaYP86kjjDdfzyQSrvj5i5Yh0N7X2Rl8/1wEm/G4wkzrgWiqdbGVYWWKI3EyQjrsy
         QcmhS8bymn9rI8EHGhAfY8B1gTCV5yhpkcLcnSVKek2hwPq2Ws64w+Y+bsk92Q3cEsmT
         iFzaxOFTNunsrHw2tPYMHmGtuJjBgxi14ge5mLaGhGfMBUCAiOThdL1gtvqo152/hnRg
         xkTw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787104156; x=1787708956; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=0Ua8XYpU22tIQ/rGIxeccBIdAfLW5KPd3qfZIOCS8kY=;
        b=A0CaJlewYJ2StNyAPoahvgh4cUQX5lJCqQwLms4onuZWnioLYohB1kWjt5uL8dG9OR
         X1D/1bENy7EndsznWWr1G1NTGJb3eT0Ozbo+c5fQrRONsEE1pvNqJYCXUayEMRCeJenf
         9mpeRGv05KPMRmvVzweVWZqNN+z5RCaNI3wsyQpf9yJoBnY11mJ4V9T+TXqTz7VReHm8
         nhgg2wL65o3nJH2UpccrgOBmLYFlW88eHFDByzFDfhkIaGNkRy69R+g9MPbGqWDNvNmo
         9eGhKC1CtWN0Z+j9RBAH9qdDxyoF0s5/mdqM4aTKGwEVq5mchvNAtq3gwPvhw3Chdik6
         OnUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787104156; x=1787708956;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0Ua8XYpU22tIQ/rGIxeccBIdAfLW5KPd3qfZIOCS8kY=;
        b=cd5VeXY+/Kca8VRqB9pTegvutOVStyvuGTrjHDcBx01ejG0A2PmBmE/JXp2re708PS
         jywIcKJyAtV+uQNek36RDpmZ2WfdOgl6G+tRaoOFNKXelnkreWdfAmzU2ElAYdQJ5b84
         FdT699mfBzymgpavCJOCY9A/PmhUuSTuY6SQGn68acYUAkZzi+/hFVNZX03QIw943yXo
         EcE/IWYJtqyAOV7E0JYHq3dD+yFuiqMqucP+dhtBYFCcJDcuEimc1iW3N/PMpU5pfuiw
         tyDNxBwo/iDLzcu7PzsyO2P1BrbvPfj0IDbrJt1Mz1e41HYebDU6xvGGsui8S/UmhJe1
         WbRw==
X-Forwarded-Encrypted: i=1; AHgh+RoPpHX0qLo9NxHsvCZHrpQm6m42uh2BR6OI84ECkBWUL2SS6xiqBmhWgaqipttsnrAXyrUUnSfz8mE5QM9St10j@lists.infradead.org
X-Gm-Message-State: AOJu0YzA+HVZ3HpkngcF0moVJ67rmraJkS6VqWrZ2CWkPgvWl0IOpvk4
	/yAbwy5jFxdnz3fFqGLmXHW/hZ8e8iM8eT/W3WguraYC9MlDA/hU7Vgtu1UFqMYOGguccD6ZMcc
	3ihj+dwo1jwtBkCYjlQdJBzVVcwF6Dww=
X-Gm-Gg: AR+sD10UUB1Vbo4KPkHUAY1I3DxS8S0bDlBcaFwHMQkx8m+DcDiQqyqMCxX0GfKSbAW
	Wfc/SvUCjYVCiP9RJUj90uCamQ9t4hvzkkNtMU4g8cGuZ0I8aXEoEtAOzNo0lvLCeDBO57Xq9HT
	8LcVrNo+MWgjtGkXlHjb/gcXpDvYtURnw98mClO/pGz4t6wNIcH0M86ND9pUqZnemLmt4j7f+KB
	eIFKFKJT2k6rdbBOLy22kfZVFZ9sLPVxnWXe63G520UDLPTaZ5n89Tb70RxsUc2agO5DwAQoIPN
	JHBzfWkKJ4JrfcWGO7D0U+df14KxchM2EG+YMyqYA+kMZ1uxQRBdXcbo4hei2Qu0vuoU0DnfMlo
	33SfsT7sJ68OQWy6FSo5YqWln70rhcQDa3mTj7osb5wouneIZ9fz5z4GIVQ==
X-Received: by 2002:a05:6a00:800b:b0:842:5b66:3c7f with SMTP id
 d2e1a72fcca58-851d34833efmr1727992b3a.0.1787104155623; Tue, 18 Aug 2026
 18:49:15 -0700 (PDT)
MIME-Version: 1.0
References: <20260810051907.27136-1-phucduc.bui@gmail.com> <CANLsYkzHog8P=0Zxnn58zOQZP+RWiVpQxw3EDb4TkPdYxdYMfw@mail.gmail.com>
In-Reply-To: <CANLsYkzHog8P=0Zxnn58zOQZP+RWiVpQxw3EDb4TkPdYxdYMfw@mail.gmail.com>
From: Bui Duc Phuc <phucduc.bui@gmail.com>
Date: Wed, 19 Aug 2026 08:49:03 +0700
X-Gm-Features: AcwNN1XjHhjsq3CyJYZRBObuebJ_W_zahDjaumAJnsanqgsHQwQ0aPe7CapvWAQ
Message-ID: <CAABR9nF07sH0m+G8ZLP9OsZxmJgUVA2==s-FUQa_GNfiuObayQ@mail.gmail.com>
Subject: Re: [PATCH] remoteproc: stm32_rproc: Propagate errors from optional
 IRQ lookup
To: Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, linux-remoteproc@vger.kernel.org, 
	linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260818_184916_884068_4598FDE2 
X-CRM114-Status: UNSURE (   8.21  )
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

Hi Mathieu,

Thank you for your feedback.

>
> I'll pick this up when rc1 comes out.
>

Thanks, I=E2=80=99ll wait for rc1.

Best regards,
Phuc

