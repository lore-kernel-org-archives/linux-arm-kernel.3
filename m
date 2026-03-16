Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74DE9F53D6E
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Mar 2026 16:01:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nRTROiegC3HHzc2PKkDT6LEu+pHZlAThf22kVsmxLDs=; b=E1mQtRjNPOe6xXD1165ed3MqWq
	P2DvRb2RkWjUppWDmY99eT1koNhJaz576Gn6sM46q1O+vZ+lW/7r5yILBRPItXzZUQi5GdcXOQfnr
	Yx9RksNiVT8px85zGuXJjT5kiw5GiXbkuTbc9+rMRocO8qPwPcrPLoC9oYmAG/DV7yy242Y43btib
	3JYCb++s/SorvRLvSHPbrRXwmrNfIRlY/TQxFBXLuKEQEMlb+FnS1BdyOaKMQ7oHgcp35Iiz3ai9d
	f0jlXkdLZsMGh5mY+vylDbwaxSace6D00xPtdNFiheTw+5Klwm8gJetMDWuIMZGdjHP+IVBbllCZ2
	gwUzkfhw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2ANV-00000004Onj-0GU9;
	Mon, 16 Mar 2026 16:01:13 +0000
Received: from mail-ed1-x530.google.com ([2a00:1450:4864:20::530])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2ANP-00000004OlK-3m8p
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Mar 2026 16:01:10 +0000
Received: by mail-ed1-x530.google.com with SMTP id 4fb4d7f45d1cf-6618bc129acso6104477a12.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 16 Mar 2026 09:01:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773676866; cv=none;
        d=google.com; s=arc-20240605;
        b=ApbBaWCh6jbDAk02XLV+dan4vmiTyVuIEgxDkmtjoKZxq6JjXnMt1YszSTFFlVG4n0
         2jxx9f0pOOUc8pfB04n4LwtXB41YViA5sXapNvxExtNp+eRQ58scdeOmNq7i5XbkpGaL
         shHXj4tqD1kP3ZALL+npu2caETYGDuvyd0DgmK30HWc1I9kmMjfbbnyGelGFlvKX5yF/
         TmXy3969i6aVLr9g33kBxp4W5Pbby/3d0zid7f1bUX2kQSZguQzbVWN1nzuQ15B7/N6z
         0G+ApFOFHT4tl53u8V+vYVCWhmiZ/x2h7SFZFH8W0oq2vmN9m6JXT6oatRYmisyWZLkX
         /uRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=nRTROiegC3HHzc2PKkDT6LEu+pHZlAThf22kVsmxLDs=;
        fh=9oghvAU5DS+twOfOKAbqDkoY+OmPEGoMcbKXvuYpA4M=;
        b=aZTPOdKfz69AgZ5VLB4FTYdvGI9HIVlkiakynJ9qPATnFyqiVfeiaGFM5yYfx3WuXy
         IcBVOS9KoDKHEAQCeHwSt0+iuwuieg0liGI8SpttwfU2fjwTE3gnpLfj8SCOcpEWc79U
         DGU7o5CdupmwxdCliEPR1WjsmzorRnZ0Iwi+69+Ou+ZZsijwJDeQPXiWxda3FN27ESpK
         3f4ktkGUSvE2BjEzbXsI4KlmE1Xft3jFyf9PnQyCG3FWmr7AoEoaqDKJx1kznuHDjpPv
         TWzUlhlS6RRKVZk+lJP/hmyis20amaOKvBM5ZFgIf1jaNi3sf7xVDePmoGvs1dia1Aue
         fYtQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1773676866; x=1774281666; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nRTROiegC3HHzc2PKkDT6LEu+pHZlAThf22kVsmxLDs=;
        b=XHPBCwD5I4jA1ErXNE7pTteBRGg4Z2Q4hxBjXID9llMXt3+bQLihe71+mJ+Gjue7SX
         St9LX+E80vUDDtvTP8/IsFh518uVJGIoytRhZUp2J4v3hMPjvKy+jbdEwbp95krEDJ3g
         SPsDTBFmvMQN6PQ2d8+CoFYRiMMOXWVuWKEV5VfD9jNUmEp6awWJBQ8roAnvgDpAK0aK
         ++ZEA4tKCuamN9aUM+OIrEBuIU0lokQA3H4X/jsONkYPmMZespLejgaxjeJa4kgmYUqF
         eYgYYqpB4aiMheL2jjro2GqYhP0tAGs4eYfS2nQiVt+HraAqICrA6Z78TCMR0uRARCfx
         jKFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773676866; x=1774281666;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=nRTROiegC3HHzc2PKkDT6LEu+pHZlAThf22kVsmxLDs=;
        b=ceiuQQgq+DtFhNbvrmWPonkUhJ3bbusbRZaxmoptS4PsKKVhytD8yU0vQRwjohx34H
         tuv0KNs6mw2Cue7cx+I6+eUcnPRZElotgH3i3zYAuhvuShZ+qh/BU8hT5T8Il6qcTVHb
         iYpoeGxLUQRcwPnTo93vJXrRS2GzN8YvJI4RiCyGHMQ62qE2voh+9Sp1/k3/f9Q+sVN7
         0fjrohLWXox7+i9WKiJZaX181J3eodOo9RHchb2aUONumHtjR2C7dH/DQFwGHDaZxrY5
         1FbiltLCi/59ey8dt8W2LuSrGhDQHYVg6rDYf67IL+Q9RIWQ9rt7veSjey5ZnDjWK7Ru
         4LqQ==
X-Forwarded-Encrypted: i=1; AJvYcCUtrVUan7PGRDdYfkDDZLZkgp1+b37DO2ga0eHAFGX4WkHk++IeQ91RsZxKZI+QnlNB2C20ZSC4zaacCggxi99W@lists.infradead.org
X-Gm-Message-State: AOJu0Yy7/OA4pW9WTO1S1/A2SFxHi1VQBB6Iqn6rZh52yHh6mIiudFFj
	qGe7e4egoLtxrDm3uEfFwOlUlFH8kyF6Ff+KqdWYe5cr0FRQSEOp9hD0dmBxCcdmqyHmsXkBWez
	FggGrv/EwHaw7UnNZJxlOZ4xGEtpHlYXBJgpmlqygog==
X-Gm-Gg: ATEYQzyC6hR/ZNt+o1Eckm5uqIIqimzTJw4Ge+fT7gDgA+XkhmJ+2+VRlmx1ojgq3EP
	7aOdFUgJLh4W6pTZV6pbCnfNnFPp7YL4bHEfz3dgVvo7zo8YFNx6HjP+EygM4/aRkJsawh8Uufn
	8wrA2nLt0R09JqgTU4T5Uf2N7yEX/8hiiO9iLfXMJR2YtHQaaT7q93hTAwxvuy2Jp6tykRJQyw8
	5xSQvsSlSxPE1BWE62EpYTwdS9rSFGqnh1PFcAdvggq4Oj+avNDLN5J4COIgDV9DffzaDY34W9t
	Zu3V8tR+ax0bPOsiTvn37HgZir3NX6WWRLYlBlFrCw==
X-Received: by 2002:a05:6402:51c9:b0:65c:2af1:b7e2 with SMTP id
 4fb4d7f45d1cf-663bac17dcamr7423927a12.27.1773676865593; Mon, 16 Mar 2026
 09:01:05 -0700 (PDT)
MIME-Version: 1.0
References: <20260313195801.2043306-1-shenwei.wang@nxp.com> <CAD++jLkVZc7J+39eUtpWz4+YQm035HDtUyiyrEFGifQkcSMsCA@mail.gmail.com>
In-Reply-To: <CAD++jLkVZc7J+39eUtpWz4+YQm035HDtUyiyrEFGifQkcSMsCA@mail.gmail.com>
From: Mathieu Poirier <mathieu.poirier@linaro.org>
Date: Mon, 16 Mar 2026 10:00:53 -0600
X-Gm-Features: AaiRm52a6xRhLIv8WCDX8JG5wzLTI5tmdCIrfHWi7mJRzbOdI91SV43T2PYw5ig
Message-ID: <CANLsYkyd8x29kz1u2dkyn_5hhWVJehz6VVKEx81Ew6i1nKObwg@mail.gmail.com>
Subject: Re: [PATCH v12 0/5] Enable Remote GPIO over RPMSG on i.MX Platform
To: Linus Walleij <linusw@kernel.org>, Andrew Lunn <andrew@lunn.ch>
Cc: Shenwei Wang <shenwei.wang@nxp.com>, Bartosz Golaszewski <brgl@kernel.org>, 
	Jonathan Corbet <corbet@lwn.net>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, arnaud.pouliquen@foss.st.com, 
	Shuah Khan <skhan@linuxfoundation.org>, linux-gpio@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, Peng Fan <peng.fan@nxp.com>, 
	devicetree@vger.kernel.org, linux-remoteproc@vger.kernel.org, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, linux-imx@nxp.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260316_090107_960786_83F89AE2 
X-CRM114-Status: GOOD (  10.16  )
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

[Adding Andrew Lunn]

On Mon, 16 Mar 2026 at 08:23, Linus Walleij <linusw@kernel.org> wrote:
>
> Hi Shenwei,
>
> On Fri, Mar 13, 2026 at 8:58=E2=80=AFPM Shenwei Wang <shenwei.wang@nxp.co=
m> wrote:
>
> > Support the remote devices on the remote processor via the RPMSG bus on
> > i.MX platform.
>
> I think v12 looks pretty good, if Arnaud gives his ACK on this patch
> series I think it's ripe for merge.

Please wait until Andrew and I have provided our RBs before merging.

>
> Yours,
> Linus Walleij

