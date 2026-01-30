Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26121D49C71
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 30 Jan 2026 08:25:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qIF2oyc7jSMJyV9MJXutUw0TkKSVy7Ny/HYiVWp/mcQ=; b=dD+4krgy850BXVoaYub3IWTw1J
	aDQCbiaft5VvILvOIYYTAsxeG1aDhJQtrkhmfYord7EMscrutg8GKXQduzKBKObUuWNkwl3EPgnsy
	IcHauqBQYtBGwqRpueIBy6Ijh0P9whnAuMh7PCBRrwjagXH+CklmvbAOV8FDxqlj97tMO5JmjiNa/
	biFVp8WqmMVfE0KMJQhm1QxGYgwNSU1vzCVTfz4sw4AKw0K0I4nOP0L3fr3gOz61FL8Is9Lf5p/Ms
	SjLW6iIfEImmW3VjhxySR0dqETg38R5vwCQ9TnMVDPlDELxuMr4YmX1NaE2bOTBUoSFeZxEXMkwja
	C7tDhMlA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vljoJ-00000001DYs-3Ott;
	Fri, 30 Jan 2026 08:24:59 +0000
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vljoG-00000001DYV-3pDb
	for linux-arm-kernel@lists.infradead.org;
	Fri, 30 Jan 2026 08:24:58 +0000
Received: by mail-pj1-x102e.google.com with SMTP id 98e67ed59e1d1-34ab8e0df53so1547033a91.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 30 Jan 2026 00:24:56 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769761496; cv=none;
        d=google.com; s=arc-20240605;
        b=PTSNi4pGfYpP2s4o4Wcrv5kk8/B8/5fAxj9JoX60MvIxMKBgyYVcHyDVwNC/6VAMtq
         HCaJgfiMxOACJBhFpvV2/KcU0whd8Dl0Badi7OpJg1sg8tJTTCMgfrNJKcxh1O+J1ivR
         TXCnE4W3/L1yyqwR1SeMTCt//emNex26LGjzt9y32SBCh26VVt+OiDN7Upa9dI5rCM21
         QyH4z4AYDtpZJRF9iOhY4y8SvXv7P2mvkn5kmoipIovxxM8fseUPyhpf8A1F9KxsWGuj
         KSY0/MK9hDpUiOuWOR2vsxBnCr7rOXbT99aQh2tulUpak7/v0eOhl67ILhlZWzsITFAS
         SEHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=qIF2oyc7jSMJyV9MJXutUw0TkKSVy7Ny/HYiVWp/mcQ=;
        fh=l4nUboFMbaNZ99kQsr/5wMSJiyb/M1dnJUNpVqqQxmE=;
        b=iXdRr55buQO7mvTYmH7S64/SHa9us4f+t7De01Edgn6N240OUx2UFUdMxocOykfWMc
         OOmo2b/1dn3+8ymO4hFEpdSXP4OvUZLQ0L6l+L3yg+AinP8EmQwhhyr/adMW8KNgq50h
         XcV51dFtphlbeO+aE3/vEkWKCg9gFObMCiABkhAg5V+tr/RMQHAD8oTvRyw+JySKM3ME
         tl536Q4s2eOzpEzw+mpCQYDBIR3ix6tcC6I2NbMLawF567Vktsdc+Wob+GWuASTLayX5
         j4JMwiTe/bDQ7WQcr8iLB3r6Gvl+otsJxPwmJQQr3pkzY3Ry9Hn7CMqPFTInjtteQ3ux
         pgkQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769761496; x=1770366296; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qIF2oyc7jSMJyV9MJXutUw0TkKSVy7Ny/HYiVWp/mcQ=;
        b=RIQXUKLHq9/cIyuL84Qkt1G45nksuy+iAMG8D3/0QRa6CGg7inIe42o0KrfVUxyYxM
         Bb8US3ehWPF/B/UqCpPcwJEn1lug1OMjwcyT79uKcbm0w6Tpjy/XVW9w0LxYS0xfIbXu
         G/ECW43FGi8L/l8pEM+btr0+1hZnpnuo4GTT+wU03DYxNMVY8fXDw9mbQjkgOhvLZHp2
         iP/yVDFBBxWmxnXzeGYnODgKqCRhxD80aZIBo1QAotGvvjvRJtQ46qw7XS2iNiO8WLCT
         QH0CjCNIp/Rc82mWr2Kmv/iBxfZ2eTt0a3g4X4EmosPOR0qxYEXkid6V12BlYGdom6iu
         mbRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769761496; x=1770366296;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=qIF2oyc7jSMJyV9MJXutUw0TkKSVy7Ny/HYiVWp/mcQ=;
        b=B/Wl6hncKJXJo0rFMjWJvgdfpkhzJUHF66jNrDPgvHhM1g2uumS4s6BPWCDt2Hv646
         F706ByKNYRkDZIAjO40tncciRosV8ukn/fx+ToIEUsi5iFINa/QpgP0JkCi6D2B8GNam
         WAUt9lJ0iK8nmOdq3jYgI72uiqNINnTolVDzTemq6S8dQ2KBrjkV85Urt+TnIqL0sDPV
         j28zv4AJ4IU4WyEHCwk5eJfJkfxx+QXfPFKjFv2gg3iPux++4YyZOuPebwPcHQMdx/uO
         bB5QSaaXYV4+RXoWmNjPIcFLoXYvG+ze9N/gPiPMaWVPim/EwoCZUg1HSw6ZdyUb/MN2
         c7hA==
X-Forwarded-Encrypted: i=1; AJvYcCWzf5GZKIl7j8M2Elun4A/8nwEaq3KpSbfKxCa5/1Ou5zRq2eptFsymbzvnoCDjh/z/3RciwBad1wXYfnzSkRVw@lists.infradead.org
X-Gm-Message-State: AOJu0YyInT3W1RIpb1nsD9IuX3XulMnhpib6Pi5aISMQ0YcJ/l91rVSj
	kDDttfR6sVkbDgzy/Sw28M8ByTfuZa9yh0u09RPhfrcZzKWGCvcAD+0Qd23xHBbjkS9wirpuHRf
	r4YeBQM+1FYSXQKRI1cNgbxcgNocra7g=
X-Gm-Gg: AZuq6aLTxEnQ0hIjMfhn+Y7NPBWHaVOqGH2kbrCmSDLVbODPi6kPugV90NfBrCrOeEr
	B1smjnEftFymIwt1DZ9B40huzUTtlix/byXo6mwgS4e2zB1gzKlF0lyHQdsBKtKNYWYsiZSU8+t
	QuD0gCeXtzQZRa9c5O3OIAKDbEnJop3f7yPiwFkz0APUosviCnUz2vu5NpqvJG8Y5v3LAt0TUA+
	4PLADR0U9Ot60+jP0uO4moHezV5+9GtQSC3iMMsJRg71uyfqg2qqcNw415KHP6vv5kevZo=
X-Received: by 2002:a17:90b:35cf:b0:353:e91:9b2f with SMTP id
 98e67ed59e1d1-3543b3c648emr2292966a91.37.1769761496076; Fri, 30 Jan 2026
 00:24:56 -0800 (PST)
MIME-Version: 1.0
References: <20260130054330.3462544-1-shengjiu.wang@nxp.com>
 <20260130054330.3462544-3-shengjiu.wang@nxp.com> <CAEnQRZC_6xRRi6y2t0MGe8udTPYWg9XEBFrxhFCbKYBCCD=OeA@mail.gmail.com>
In-Reply-To: <CAEnQRZC_6xRRi6y2t0MGe8udTPYWg9XEBFrxhFCbKYBCCD=OeA@mail.gmail.com>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Fri, 30 Jan 2026 16:24:42 +0800
X-Gm-Features: AZwV_Qh3nyHcIbEYDDCvGcF70iBOk8SCVrc7tCSz-T6YiK9YuuynA5ywxyM9ma4
Message-ID: <CAA+D8AMkaTkHL03fi8THxK-a8xBR1Cu4BcNC5XfeZvzvwJ=rTw@mail.gmail.com>
Subject: Re: [PATCH v2 2/4] ASoC: fsl_asrc: Add support for i.MX952 platform
To: Daniel Baluta <daniel.baluta@gmail.com>
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
X-CRM114-CacheID: sfid-20260130_002456_963689_9F6B3E2E 
X-CRM114-Status: GOOD (  15.12  )
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

On Fri, Jan 30, 2026 at 3:27=E2=80=AFPM Daniel Baluta <daniel.baluta@gmail.=
com> wrote:
>
> On Fri, Jan 30, 2026 at 7:44=E2=80=AFAM Shengjiu Wang <shengjiu.wang@nxp.=
com> wrote:
> >
> > Add a compatible string and clock mapping table to support ASRC on the
> > i.MX952 platform.
> >
> > The clock mapping table is to map the clock sources on i.MX952 to the
> > clock ids in the driver, the clock ids are for all the clock sources on
> > all supported platforms.
> >
> > Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
>
> At this point imx952 has the issue with dma request not cleared you fix
> in patch 3/4.
>
> So in order to avoid this you need to swap patches 2 and 3.  And in the
> newly patch 3 you will fill fsl_asrc_imx952_data with correct value
> for start_before_dma.
>
> Thus we also keep everything working for bisection.

Good catch. I will swap them.

best regards
Shengjiu Wang

