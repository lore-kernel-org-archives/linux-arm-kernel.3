Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2A8AC28B2E
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Mar 2025 09:15:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lA2bydqpRt+OlncV1V8Whn8hMq0Jg5Zcz7zDV610P04=; b=KuvPyQiuAn63p9cFln/XODy98V
	uZi/7bwGpmFVNWyLORWTlUPxHXI0szIHcZ+4eaQwggReXzzNNf59Wungr6eZqlP+15Y6+SZpXfozE
	KQHhx5EsH4R/9BozM9XeOFcq5a0M2yagbcxBjfv0SA8lHvmocalrZRaJfcCaRlqc9v1lepzyygMdg
	PLwsHO37BY39WSyT0H6D/dfvpHRJMLkNidI2DNGOzEK7J4JOnehh5nQDOZW+JCjyah5zNm8vkzPDe
	3UXu1xxVWnHSvO0XmYIMB63EUCDlcxBg/10GMgtHT0BttFFlJmG4WsxuruaScKUFkSGo8+EBoPiVn
	tfnGS6bg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1trvhr-0000000572s-29z3;
	Tue, 11 Mar 2025 09:15:23 +0000
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1trvRE-0000000542p-2TU1
	for linux-arm-kernel@lists.infradead.org;
	Tue, 11 Mar 2025 08:58:13 +0000
Received: by mail-pl1-x62a.google.com with SMTP id d9443c01a7336-2239aa5da08so82977285ad.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 11 Mar 2025 01:58:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741683490; x=1742288290; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lA2bydqpRt+OlncV1V8Whn8hMq0Jg5Zcz7zDV610P04=;
        b=Evav9nkjKnNtCvoWzyn+BaINeoC3iIGtH7Agr/Ngms7t+8Eens/uklQ8eRXrowkEK8
         Qd9wxSINfChcsyglxJgwkXqWIQTrnXwVdwUl8oMBmtZGFYu1B9n1S6yJR06hAU0iUHNP
         nal0tyJMC7v0R2HuTes//KC0tjJch6SAes2n8TzI2pe3j+1c2bHCt0poYDCiwrj5BNOi
         CDsA3S+RAPkHeVBBsTf45S1y2UBJdClfoR9tMSQ8jfToLHSrVDwxULJQYDmG29SvIFlK
         sai2u04Bcd44uPwCG1ENAO192OSNjK8ferNaX5WuqnzRZAW49LzWKpXDFDsmJbBFnIEK
         yDbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741683490; x=1742288290;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lA2bydqpRt+OlncV1V8Whn8hMq0Jg5Zcz7zDV610P04=;
        b=eWuonBj6Nq4kj2hPMOxcOdxTt9abeQdJuBW28IDTLGLAZmSa94VP8sjXEBIdPXQS5F
         n423LD4eH0TllX+Z6ue+8jvnhVcrh4I5UIjSTgVijwLGq5rk9PVRtXqiQM7t5vx8yFtZ
         N/EDY1Yx+o63OCE3E+s/iruYzUwy498AbmrFtEiYWOyhVDLk16pXnQgjfrQpeg1SAHrE
         krfOEQdM+T9UvQ0QOlgv4teFbGAOtjwhnKnJ9xYhTNN1G0Sb8Q8ExNhDRWPWlXU2iTCG
         EINnfcIboCEBEyxp+19GRdsJxfMXb5BT/oxe4nm0Ndh+NFLeitkUrTQN8dCUYiM26ZBM
         7sYA==
X-Forwarded-Encrypted: i=1; AJvYcCWQQee56fLK3UC+PtN6MPF3XJbtKCfKT26yHjmGoqFnz7vN2dGPjsGTc1lVl3DpnBkLtIx5kSjjkWZnQyHbvyfe@lists.infradead.org
X-Gm-Message-State: AOJu0YzYbclALbmV095V9DL3GteLHjoiopSa0aWzeuYF6OegzYVfdOcl
	fEs4umqIe7eukE/oAi1yOjNqxJbEUV+l000FSLI72DYsZ7kZP4b+RWhY3eTKl9Rqp2iI90aVmuq
	dY2CCTmSpKH67oX265CQasImbJsGBU1E7
X-Gm-Gg: ASbGncuNP6xK4VVMlRtNRlTz/OzJefleKraCZE2fpvX8FhzoY/xpIjWyiJQFvkXjqjw
	MmlgKrk+W+GXxkdX6RCxwaynEsdeTn3+WwVGG/oYFxBreNBGUR8uJOOX3Sswucj26SZJ3qNTpDT
	07/q/0TdUbJ1NLroS5+I/g/RA=
X-Google-Smtp-Source: AGHT+IHRbLEfFkSRN7svD/SU2NARgmIEUPnyFQQfIvjDTjaMuTGcz4qJxDZa2+cv/4IHsddy318d5FT1qriGzMT0Ex0=
X-Received: by 2002:a17:902:ec84:b0:220:ca08:8986 with SMTP id
 d9443c01a7336-22428a98135mr255205425ad.22.1741683490491; Tue, 11 Mar 2025
 01:58:10 -0700 (PDT)
MIME-Version: 1.0
References: <20250305100037.373782-1-daniel.baluta@nxp.com>
 <20250305100037.373782-9-daniel.baluta@nxp.com> <Z88Ib7HkbRQoiyZp@p14s>
In-Reply-To: <Z88Ib7HkbRQoiyZp@p14s>
From: Daniel Baluta <daniel.baluta@gmail.com>
Date: Tue, 11 Mar 2025 10:59:46 +0200
X-Gm-Features: AQ5f1Jqksp8_Ow3W7CPPxQeuga9K9-0CI_LlAxXmLAD4nYxorLD8ECBrBf3t_78
Message-ID: <CAEnQRZDeBkNYBNQwJL5LZgLK49siqomzyM_RDccdusJa22yiJA@mail.gmail.com>
Subject: Re: [PATCH v4 8/8] imx_dsp_rproc: Use reset controller API to control
 the DSP
To: Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: Daniel Baluta <daniel.baluta@nxp.com>, p.zabel@pengutronix.de, robh@kernel.org, 
	krzk+dt@kernel.org, shawnguo@kernel.org, devicetree@vger.kernel.org, 
	linux-remoteproc@vger.kernel.org, conor+dt@kernel.org, s.hauer@pengutronix.de, 
	kernel@pengutronix.de, festevam@gmail.com, linux-kernel@vger.kernel.org, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	andersson@kernel.org, Frank.Li@nxp.com, peng.fan@nxp.com, 
	laurentiu.mihalcea@nxp.com, iuliana.prodan@nxp.com, shengjiu.wang@nxp.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250311_015812_629326_9B10CE24 
X-CRM114-Status: GOOD (  18.98  )
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

On Mon, Mar 10, 2025 at 5:43=E2=80=AFPM Mathieu Poirier
<mathieu.poirier@linaro.org> wrote:
>
> Good day,
>
> On Wed, Mar 05, 2025 at 12:00:36PM +0200, Daniel Baluta wrote:
> > DSP on i.MX8MP doesn't have a direct reset line so according to hardwar=
e
> > design team in order to handle assert/deassert/reset functionality we
> > need to use a combination of control bits from two modules. Audio block
> > control module for Run/Stall control of the DSP and DAP module in order
> > to do software reset.
> >
> > Initial design accessed RunStall bits from audio block control using th=
e
> > syscon interface but this got NACKed by community because of abusing th=
e
> > syscon interface [1].
> >
> > So instead we use the reset controller API.
>
> I am good with this patchset.  The only thing I'd like so see modified is=
 the
> above changelog.  The second paragraph doesn't belong there, i.e it is no=
t
> useful to remark on a design that was not accepted.  Instead please conce=
ntrate
> on _why_ we are moving from the current design to using the reset control=
ler
> API.
>
> This can go in the 6.15 merge window if you send me a V5 fast enough.

Thanks for review. Reworded the commit message and send V5.

Thanks,
Daniel.

