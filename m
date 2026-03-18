Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B0261088E50
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Mar 2026 23:18:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=39G6VhNjqSI8lRjTTtbDrj2wp6uAuLBcTj3h2hKU/RY=; b=wcKDlWwY8dtZlkFgFPEjhEFY6O
	aEO+Zds2yoEjAeW6ZPsHLf+2xMRBV2dEb8Qp8YbhRELEMPNZ2iCK2a7EBEA6YYmLG9fdgUv7X6rQe
	qgS3JJo1FBBalGPxCfhuwxB/yfdC9G4cRxn/VrpmtDg0oP42/MAOIwl4CcIp+ZGz7vePWR5QsLCH1
	PtJdPazz2ejP1q12l5cQxuwRXgzxh3AV41Otq2c+iKadyQ7UsdrNlhe0kLuY1RWh817hZN0ocEKk3
	LPbp+03LAVir4QwPdlgj5rjty8Jlyg2fFLci13h25XE8sGv3Z4wEUA/5gfby9wyhFhG5mLIHkkJGp
	XVRwyanQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w309k-00000009Uli-2C4U;
	Wed, 18 Mar 2026 23:18:28 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w309i-00000009Ukc-3K7Y
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Mar 2026 23:18:27 +0000
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-48532925a4bso2061155e9.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 18 Mar 2026 16:18:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773875905; cv=none;
        d=google.com; s=arc-20240605;
        b=W/YfIo5sW877qyanwjgdYooAUanYh/yF8qShFkis6MITz6yLkKWNW7vT2k3kFYyXtf
         oPe8iT20ECMyZxQL5xQOKz2Bqk6NtxcFVimpuFl/FBfO5JI6uvqwdLw6I8xBRzAsGV4i
         YYIML/TbhayYy2NNUMIqyARJJb/6M2I3Gpz5//hxa2qFSatXZS6Ze3Zzslkm5lN7UcGV
         gJ1T/VVCBlKXd5oChVcI7QIDLKzYrKuAkx2WJlo9oGNBVnTwEg2qV7cvY6/aVlZ3xZjk
         llmppwpHW5U0zEzIGROYt6XpK1yiGHc8VII0NYz5leVWNVr49wHrDejSL/r7zIe3HLwY
         Ttow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=39G6VhNjqSI8lRjTTtbDrj2wp6uAuLBcTj3h2hKU/RY=;
        fh=XvGI5dRG2raK4rYe9K7LJhdfSCTNurhQ35tm1saV9Tc=;
        b=Z7qthTIXeW5UKu2nvTBBU6JAlLZBW1+k3MzlCJU1Qo78395Oy3HicWb6Sbg6dvhHHI
         0+RicAJq1rQnUM84dHosnoSOegaAzU0kfZQueoa1JoqkpMw9tSdXhD1u/pUBvNDbPnwJ
         BVux8c4tqeDcj3eCW137vtkdYSeADnF29nUG2QmYiHJCBqNQ51UDw/xbw1Bw6OOQJwyq
         In774IDP/+wf6po3rcaW0+J7QNa44IRqVM3AuoI3zpNVTU1lES/4ose1tKw2oVqFYa1W
         9QX8YHLYdzVQlXB47x669mQ/tg1nE//jUb71Mlm/PCGSA485hOomk0IU8Y1yvGSHIBaP
         LplQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773875905; x=1774480705; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=39G6VhNjqSI8lRjTTtbDrj2wp6uAuLBcTj3h2hKU/RY=;
        b=G40UhQNYgYdZO5rNet4rq7facbEB7K5Y7ljuHJGbo/m8+laAHQGxn5XBoF0GJWmxts
         CFyJJL2VKigFrzF3egUsaRo7iv7gbXnqYyeYgc3BhGIcqqcfVSEQi1NqHh0YPZN6s7sB
         iVLl9s/xshHUrWdAGmLMxSCqIE8lu83mzxN8KCfzDtdOBPWwjAsG0aOmaDCkey+Dhwq2
         fyyIng3uLBFC1PJummZJ38JoooWv7xc0b3rmazl2vINxuDq1dLPrRDMUyyaDwcku6n6V
         jcrFoJw2Dtzsw9Vxj3g9RonyUAIvxDKdAX5zAcuEx6WB5HrGTWZEP6Kb8kmeLf1YAPmO
         cPYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773875905; x=1774480705;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=39G6VhNjqSI8lRjTTtbDrj2wp6uAuLBcTj3h2hKU/RY=;
        b=fz739fo/d8nFZDhff90CSW+c5riQL6vNmQqRf2OsMOw39m78XgN8dsLDA9aUs/qEqw
         8iRn7lRckNRZ6HDcXhOrySb5vZ8cVorL3UsdnFlwbMnz9emnCT5agQV0oyBH8fSAbGmT
         nx2l9DLczs3FWTCLB4cy6xQKYMVUlGxJsAbthskuXJgkG02fXW8+iwronwUlb+YoKNZ4
         KCVPLrWM2CxdYZ+URUALzMNnvikxDJB57DfURjdI+hzS6sqZDH+mJu3MaGLDopbiKRt5
         S+64VA2FBxZbUCLfV4EX919fEZFmLDU4o3rY7/lV2e9Xixm3lrjfgZyQAPxPxNiCNOti
         riJA==
X-Forwarded-Encrypted: i=1; AJvYcCW6LjtHnmRsYKDN9Ngwe8TjGQX6XvJP87afJ0CYxzAErRnbfXRw1okTH0x+/sVVufTD0jO1DZPcbqfJ+wHGUXfA@lists.infradead.org
X-Gm-Message-State: AOJu0Yxc/Q60IsqcuGx21DHZwD3a/MPqxjDs0NTUqaT1r2CVmLvKWEae
	elb3lfcxqLry+XpfYB1yAM3twPoLax74gXtmftvpp+8z/euoOnvSBUh0amHA6BmzTJz491exwY9
	5FzAlNVadrBnF7rZHwxSd0+JL52hm8Gc=
X-Gm-Gg: ATEYQzxj5nh6kpVEbtBdofdRljOQENPMa4gcGqZCkck8fUoh5JMdKUdovbKxy3JpV30
	tDe/h2D+1y4E2ShkPkNUTvpgXJThugk5/s2hN5vpb9Q7EEuuk9GVa0DLX+BHd77HXfmmcQTc9Hr
	3V+WV8Q8fTpnybXUfgFeyiW57ihaiHPv5sNWxbEAptBdAUbmGS/a7iWQr0axSgg6rwiw2YV3ng4
	jrU9R/I3W30jPuo9wGem1zUVYI1IpZl00G3UrlDNeLJwAM2Us5pIn0W88arwtS8xCBdis8kWE15
	l+ytlMoSvqJVZrYSZg8c
X-Received: by 2002:a05:600c:6995:b0:483:badb:618b with SMTP id
 5b1f17b1804b1-486f4463574mr81919745e9.24.1773875904527; Wed, 18 Mar 2026
 16:18:24 -0700 (PDT)
MIME-Version: 1.0
References: <20260316021009.262358-1-CFSworks@gmail.com> <20260317202718.3a5433c4@kernel.org>
 <CAH5Ym4iaBkFsAH6e9UgHbxOEs8D6-Tcq9so0HJ24GFfmnQiUiA@mail.gmail.com> <20260318151116.665400cb@kernel.org>
In-Reply-To: <20260318151116.665400cb@kernel.org>
From: Sam Edwards <cfsworks@gmail.com>
Date: Wed, 18 Mar 2026 16:18:13 -0700
X-Gm-Features: AaiRm51YP9gogPBHIhlbloiKNsmx_tzX5wtT9H4tULOXMMRpIlakAKewKNpYF7A
Message-ID: <CAH5Ym4jYyejXqp0NrX_Gx9ND3kyrQxZZ7zDLN2P2HioZOgybUg@mail.gmail.com>
Subject: Re: [PATCH 0/3] stmmac crash/stall fixes when under memory pressure
To: Jakub Kicinski <kuba@kernel.org>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, "David S . Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>, 
	Russell King <rmk+kernel@armlinux.org.uk>, 
	Maxime Chevallier <maxime.chevallier@bootlin.com>, 
	Ovidiu Panait <ovidiu.panait.rb@renesas.com>, Vladimir Oltean <vladimir.oltean@nxp.com>, 
	Baruch Siach <baruch@tkos.co.il>, Serge Semin <fancer.lancer@gmail.com>, netdev@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260318_161826_844888_92697BC5 
X-CRM114-Status: GOOD (  22.42  )
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

On Wed, Mar 18, 2026 at 3:11=E2=80=AFPM Jakub Kicinski <kuba@kernel.org> wr=
ote:
>
> On Tue, 17 Mar 2026 20:46:00 -0700 Sam Edwards wrote:
> > > Please have a critical look at the commit messages.
> > > They are very bloviated and not slop looking.
> >
> > Thank you for saying my messages aren't slop. :)
>
> Typo, of course. Are you saying you haven't use an LLM at all to write
> these patches or commit messages?

That's right: My crash analysis, source code study, bug reporting, fix
implementation, testing, commit messages, and correspondence were done
the pre-LLM way. (Perhaps it's time for me to adopt a disclaimer a la
xkcd.com/3126? /s)

> > I'll try to dial back the verbosity, though. What kind of bloviation
> > do I have? Should I be leaving off more context, or should I focus
> > more on preserving the same detail but using fewer words?
>
> IDK, writing is hard. I read the commit message for patch 1 and I felt
> like I understood less than when I started :S

Ah yeah, I get it: Sometimes with negative feedback, people don't know
*why* something is off, only *that* it's off.

(Aside: I originally wrote the patch 1 message last month as a comment
explaining my issue on Bugzilla, and later reused most of it when
preparing this series. Patches 2/3 were written fresh as I was getting
ready to hit send. Maybe I was relying on context from the Bugzilla
thread more than I thought.)

> Try to imagine you don't
> know the code very well and think what information is crucial to
> understanding the change.

I have a bit of an edge then: I'm actually pretty new to this driver,
and used the commit messages to document what I had to learn in the
process.

I'll try to workshop the commit messages in preparation for a series
v2. Thank you for taking the time to speak with me about this.

Best wishes,
Sam

