Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37697D358EE
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 29 Jan 2026 09:53:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/7eUFYzBO0piSeiJwey3BFHh10mwh8sua4KhOGsFt8I=; b=S8uUIf2BWYFdgxZu1bahSLjm92
	5E8geZ8Mx0+Qck2wrjJhBMwdY6zfu5KX9rw57TjWN2vndEdIJc0yZYTMv9doMoRHaQi3BfmHSlenB
	pepv5hs8vv9QsN/LtEA5GNYJWHzG1mgC8RL6JwugIqd1B6K0ZcQSDsrZCl5zUH3iBI9OcRsZtjogf
	PfSeY73SF3ie3gO8mFdIsp3r2JVQR+oZ11gStxCX6UxTcWPAtC9ZeNVEkXPs9PYMs+GuAEwFjXWLZ
	iUlX3ogjuRt/lPNzhd0jG72+TyKLU5MPu+H9Cnabelzsw7JaAerlx1oDYVKMPhQVXb7Rs1kYd7jXV
	c4aIbBGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlOik-0000000HXDk-1fOF;
	Thu, 29 Jan 2026 09:53:50 +0000
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlOih-0000000HXDP-37NA
	for linux-arm-kernel@lists.infradead.org;
	Thu, 29 Jan 2026 09:53:49 +0000
Received: by mail-pl1-x62a.google.com with SMTP id d9443c01a7336-2a7bced39cfso7398065ad.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 29 Jan 2026 01:53:47 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769680427; cv=none;
        d=google.com; s=arc-20240605;
        b=AxHZuqmRvFxBhvigZUrrudrwE50tI/CsC9vsod6YEFfyp8IVAeHQzVFjt1LOqduvHT
         Ms+x76A+VkEPr0GHIQl0WsOlN3AltMycLd3rtoIVCnVzyguw5PT5sPihd11qWyMwsyGi
         ojQSaFZK6zjYNJlanPibXCte7AmP9SwiTDS3Ckn1qAV2f+FOY5lSUAfJyQpZobBl5Brf
         pDY5x0UE+ufyO4TW2iV8QuyCc93LmXDWUO4pry+zZoD0OhGM10tuJ9iIoat1O2KZo1Uk
         fi9Pkspuum8Ke4/7KXtb+j0zE96K4iq+G94yVKm1S9NjV7V3Dpn/vDyDWl2suBtNB7r/
         XiGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=/7eUFYzBO0piSeiJwey3BFHh10mwh8sua4KhOGsFt8I=;
        fh=Oxv/3hlS24ZxrbORiLXV8xjC9HZFVwbOsf75dDnE0Lw=;
        b=MqO+czXk4gOQ/8Cb48hVCQ2bN2NTWXiEVyaAipFkjeUxQ+zubAW/CNDX/ML43lWODU
         tVrH/rXSgJMCPtcfYd3w2sYLduBd8EZlFqqH/9CJuRsqCoSJGaqKpWXvE5cTTVSKobi3
         wli045dZtzX3CP5zV1nJSYM+jky+8L8gK2g9nlkbCKBB5qt6slw8A6wzRGY1GfFwdXNV
         YvntfXDedpHR9dF7jIdlFw4V7fOaS48/aN4riZDKuOJkf2+C6fceb00CXWHeCO7h4N17
         YyDgAz5YwBdohGcolzoorA5fWSee5IfDkcrimcgvVq6yJwuy0yBh2VIkDaS1CVRZu3BF
         TDQg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769680427; x=1770285227; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/7eUFYzBO0piSeiJwey3BFHh10mwh8sua4KhOGsFt8I=;
        b=SDGrunYS0/ye7mI8pm/GvbkITCQgVe4tKgF9qYBsBqpDqeczwEsaCNZnXGn9i+xPrH
         TC1C4MuhBKN8UQT2ofVFYI/xKqTPDVByRV3NIWoHSJ4VGZTr15BhzvyKw2i02DXRZuPV
         N3ExwfR2Q8Fh3/lmAy98VAAeGGt115Zxrg6JMZ8Nmf58+uwcV3it4y8xZiSs3IZ+/kDz
         Xc9ModSLcFfaShUKqnmtwTQ3wCb95xLESsoFO+42RITVqggmk8uK2tEQtRFG2ffp6KhW
         S25t6kRa4Yi9IwuPE0u/c4ELdYkPchND2tT3jq1ER5T+VvOnZJaSqtIkL7dph2BiTwAk
         0BTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769680427; x=1770285227;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=/7eUFYzBO0piSeiJwey3BFHh10mwh8sua4KhOGsFt8I=;
        b=DvR0Qjid7Nuqp3yqjG4yfvhLtTGZZc55EXz6kqtRUMp14J5fjpa4+LHW6sS+7OR101
         zoMI3MgKZjj2X1y/rcmGT5iqf7PK61lnYCDm6AitnsFqOkRwWRa6BXSm2GPzS7HGfo8r
         iLi25qyBwqWQTd16kTjCYQaHrUcBNNKCpQ98o7SpINpGFTm/VlBqmI4f46iV3IGPBd0W
         fWufagbCuh6m5nM2CDzLL0tsblZICqPVmm9CnO+yq3RC9LHCcqOupSRa+zf2gQHmcHMj
         qEo3I3saMfTWTAPpGpSKohxTolHRIcTDq5YBI5hX2/A/5Kq85CYv9+Tm8xsw5QquMeuW
         xodg==
X-Forwarded-Encrypted: i=1; AJvYcCXxfhSHTp5Xa4nVI4uYTeuEairZXdYj0GeUyLllj3sBXmpDzlQisVyZpP1mbFEQGBviymuZ3oVtKcCEF9iChozX@lists.infradead.org
X-Gm-Message-State: AOJu0Yw4YIDufrm3O5IGtFTovCMkc1eF4Q6Awl9x3Q+Jt3o+ESniteDf
	UwtxeYrtYt1vac3Ic5k1ZibZQPBWS20a1l2GZHAkwPxH7OXhcrFwGOKXePSoXabTYOU8KtPEs3h
	qEhePjeZCUs0Y20JZVIboYjWhFm1iSii77w==
X-Gm-Gg: AZuq6aILFJkLEHksgJwOkLhPu3KoOtBugNI4CySkC0BYJlu3TfKzC+uV/AHv14fVg8b
	g1YWPWjlKvno/iRHFrY9TwOfbhZatjxJ2wWqtpVA+CMtg0QKb+Evj8qlPIZCOXx0v8mjmSMTcIq
	n74gHVmzNRrby1caAnAxHz3gQ9I3ZYqXB1U6ihlnt88C4oBuJnWtM6SRD/+0Icv98pUJzg+m3kY
	XrJwEhLuHHaJxCRb8uhXfb0SInhkon4o/fbQCbxsWQnVrLJTFREfzk2fOQTcfW7K4HqcS0=
X-Received: by 2002:a17:903:40ca:b0:2a1:5d2:2e45 with SMTP id
 d9443c01a7336-2a870e7dbf0mr74134655ad.59.1769680426799; Thu, 29 Jan 2026
 01:53:46 -0800 (PST)
MIME-Version: 1.0
References: <20260128071853.2602784-1-shengjiu.wang@nxp.com>
 <20260128071853.2602784-3-shengjiu.wang@nxp.com> <36309f30-8b83-4eaa-842e-c663edd8a439@oss.nxp.com>
In-Reply-To: <36309f30-8b83-4eaa-842e-c663edd8a439@oss.nxp.com>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Thu, 29 Jan 2026 17:53:34 +0800
X-Gm-Features: AZwV_QhJaxBDlnFwwTXJVH6oDtpo891knd-s55tPdoqjkrrPNspPNZy-5Dfzq3s
Message-ID: <CAA+D8AP==mteo7ucx=R4eyPw+DpBUtzC7H1++_iZBMN1kkPJsA@mail.gmail.com>
Subject: Re: [PATCH 2/3] ASoC: fsl_asrc: Add support for i.MX952 platform
To: Daniel Baluta <daniel.baluta@oss.nxp.com>
Cc: Shengjiu Wang <shengjiu.wang@nxp.com>, lgirdwood@gmail.com, broonie@kernel.org, 
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, shawnguo@kernel.org, 
	s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com, 
	linux-sound@vger.kernel.org, devicetree@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Xiubo.Lee@gmail.com, nicoleotsuka@gmail.com, perex@perex.cz, tiwai@suse.com, 
	linuxppc-dev@lists.ozlabs.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260129_015347_789228_8FCA3154 
X-CRM114-Status: GOOD (  17.95  )
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

On Thu, Jan 29, 2026 at 5:17=E2=80=AFPM Daniel Baluta <daniel.baluta@oss.nx=
p.com> wrote:
>
> On 1/28/26 09:18, Shengjiu Wang wrote:
>
> Add a compatible string and clock mapping table to support ASRC on the
> i.MX952 platform.
>
> There is a limitation on i.MX952 that dma request is not cleared at the
> end of conversion with dma slave mode. Which causes sample is dropped
> from the input fifo on the second time if dma is triggered before the
> client device and EDMA may copy wrong data from output fifo as the output
> fifo is not ready in the beginning.
>
> So need to trigger asrc before dma on i.MX952, and add delay to wait
> output data is generated then start the EDMA for output, otherwise the
> m2m function has noise issues.
>
> Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
>
> This patch does more than one logical change.
>
> I would split in two patches:
>
> - 1) introduce functionality to start ASRC before DMA.
>
> - 2) add imx952 support including clk_map and introduce fsl_asrc_imx952_d=
ata

Ok, will separate them.

best regards
Shengjiu Wang
>
> Thanks,
>
> Daniel.
>
>

