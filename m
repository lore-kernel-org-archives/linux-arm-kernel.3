Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2CDB8C5AD7B
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Aug 2026 02:28:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FK3vmJiqb7a+gVn5qBnneGTL0Sw9n7wbleQLLjtRCmM=; b=BnRyyPsVg6INKhQA35uduiXEaX
	V7Vm/vhMXt8o8vgpS7ZQ6XzI0o3lUc8f0ijQF8OUM4UwDHu8ax1O0QgHu3xlToh703lDkf2romkSy
	Em9qi5Eq0CbLWNf24Un2fcPxXp3TUJOtxUdyeEMVyckSrMabTTtLlG/m/uhhMlIdyAz3bEz/fbcGD
	WuvKrg/MsYJoNqX5LiWjkVah5mnG3gIXUQb8xNx7lvUXtGzSOejLg93wf+UAnbdDg0NfuLuu8BlZy
	yE0dGephZNYXVFlLXnaRIX0IbeOCeHOwdNgqqisQ6Fs3vM+oTifNJcgaMy0EKebB/6uk2rnyDR32A
	VBK2XocA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtcEI-0000000DAMq-2Dau;
	Tue, 11 Aug 2026 02:28:38 +0000
Received: from mail-pg1-x52c.google.com ([2607:f8b0:4864:20::52c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtcEG-0000000DAMR-0lcY
	for linux-arm-kernel@lists.infradead.org;
	Tue, 11 Aug 2026 02:28:37 +0000
Received: by mail-pg1-x52c.google.com with SMTP id 41be03b00d2f7-c96b08cdd1cso1891323a12.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 10 Aug 2026 19:28:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786415315; cv=none;
        d=google.com; s=arc-20260327;
        b=tDdHQCEI5XSPx2OWJbIPSTI5Ctop1mwm9XvWhypBYe7Ak8w6NFHcMM/OMTN3FG7acE
         5tFmUIS386MmhBqeGggqAhqSHJDyA9nI1bACW3UerR8nSCRe0UtY44+VVbV1X/jIbzeR
         G8+JZtQNo6K9pjT9Qbq4zm6eAvUleSbnSMRRj+g2t1v+9xbKqEfoLBEK0Wmx3d3TMK1m
         W90HdapkNiMU029QN2RYC/VkD3ubhsKHYCDlvPhPe6gOinTC8+waQZgFT3wD8AAyHefi
         Ov2vRsOlWial1ApewoAsqPVaH2JwVrNfSvKf8XRUy4nbqgzXCwFrCP9z69x16FQ82F7D
         dRTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=FK3vmJiqb7a+gVn5qBnneGTL0Sw9n7wbleQLLjtRCmM=;
        fh=c6859vUPrQBWEeCJmID5h2Z6PIAGR+AsxhJnbyzt0zs=;
        b=alDCNJ1RGBbobHctpqQ6tNDwLwQVHkelm0yqND2jc1pwFuj/sH/K5ji/MJlqmdHwR3
         PHK6yalilAitYa2kK9ZtES5Ao7zxiJumvO1xXMTf7rjePHJzt4Px5Mt12dvRF2s8PcG7
         rdl2bSwXe+6m4+XmG1Wun/1qm2epgkas1UuuGOZlSKRa0P6FXRxj04Twz/ePBQEML+zt
         rOxhmtHSrju+tQzJqvaMbmwV5Hakdm7xy8RkUC2JTnF+f1nG18iKsjcYBjwHwnJ8mB+w
         bF1+IqUNDrfu5J36JlWu/9dh9OMFtpvkRHfG6Ri2FhG1glLUrVNYYqfy3yoXCxUfpvUO
         h9IQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786415315; x=1787020115; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=FK3vmJiqb7a+gVn5qBnneGTL0Sw9n7wbleQLLjtRCmM=;
        b=FHQmVObBwHuOAgCPzbqNLjW6MCXanyQjj4lbc+lwT/mO/9OOYm4ZTLP3zxb+84/85M
         WkVqqfUtGx1vKc2IoeYEzB84S/NQZH/c1K1XQ6HADO+CfkmP8wbJX6bPgHQHNYWW12Al
         LNbicml8HID3L4KSFBk8VJKdwrLd7NgvhqfLj/IvrYJ56QwSd7D8LPaBsP6pg+VSjTFr
         3wdLPdLJ3bQ96urRTtIX2KzJ05KvBCeZbywEPumBA56MVpGabueRJRHX64Aj6a7Q5PnS
         x2AbGagxxqBQ26F/MLQVgzWNJhrL57ee+Qunk3CE1VJqZD8ht/xnPpVuuT4Bd7Pt7g9k
         Uk9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786415315; x=1787020115;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FK3vmJiqb7a+gVn5qBnneGTL0Sw9n7wbleQLLjtRCmM=;
        b=pqDQpxa6tGLdRmwhaKP5//xHBpxF18Fwss/5TXlU+oEiPCbLi9A9G04H5N/3mNTYAg
         Ks7W9L5QNq/HvN1YdZtCqjgsJkpOEA+EzX52kCmxKCJz4KdirCnu6QinsAg+QgysIcwr
         4W2F2x2+F1+eZBj/49raLJcaLNgYMF/xfNqS3+tjG91EbuR/lgSbKNd/wejD8bxlx6GG
         QLHa3fXDy2rtROJS3uTjqQewul+N41cX+Bqx4mvT6Bpbr0NfCT1m+sN9AFgA4ALw1fmq
         v+3MJ2YR36/TuCfKvHXnkwYrW41+CRc5pDbK4B7wWSNG1pM7Vjyi0u0arl4PTQ11J2aB
         XwmQ==
X-Forwarded-Encrypted: i=1; AHgh+RrOr5VpnTj83+MZmUt0DTy+bNJWIVoh/0RNlV85nMcRR807/gJgNu5LPEnfoxQXKIB99cwb7MrdYFygz3JPiuHS@lists.infradead.org
X-Gm-Message-State: AOJu0YwiRMrSCtUgK+zKLO+DJD+f49s94G0tjfIpeUrUxnFAlrdCbFa0
	koli513Ef34XvdMF7BAthtFdjca5X+32c8uS8T28QL4xwZyIcDYqgWxC1rFrb6Nko/J89s9Z2kP
	YezK+r2S15T3EOB3uo+7uInp8PNMAGU4qb/mn0kM=
X-Gm-Gg: AR+sD13l1hqU6CVUHODUOYafaoZy59Hi8Ybr2ESuPTj9iaBL5kV1YaDQXvt+nsuDjMg
	IvINL7QK4v8RF/JcPwE0l9iUSkIN/hGc3eTqXIIpPwS4arfpZ/O5LwNRrCoWDieCa8RlCDvLQjX
	1h0BBcsz/bktsua9abA/W2x8eXaJ1TChmVg1ZULaggibiX9B3o6WV0xzxwcwVappJWjTHZ837FF
	0WQTpcIHjLSo9nZlHvUhPLeGuGBN9r27MH/8X0vWyiSksTmoIKBAkNk4q6lm5Lr/sdpkTHVKsyH
	fHDCmTblpMbEDjCaBpJTF6xoa0Dg4zSES3NiwKw5OWw3
X-Received: by 2002:a05:6a21:e0a6:b0:398:837a:7af0 with SMTP id
 adf61e73a8af0-3cc2baff1a5mr397245637.30.1786415314854; Mon, 10 Aug 2026
 19:28:34 -0700 (PDT)
MIME-Version: 1.0
References: <20260804100218.49587-1-shengjiu.wang@oss.nxp.com>
 <20260804100218.49587-2-shengjiu.wang@oss.nxp.com> <20260810-normal-cuscus-of-argument-4b230b@quoll>
In-Reply-To: <20260810-normal-cuscus-of-argument-4b230b@quoll>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Tue, 11 Aug 2026 10:28:13 +0800
X-Gm-Features: AUfX_myaxBa_rPqdovqcCYr4z7pz2bgmNVRQ7bdnJSbreWmsZ5qeF4VRopEa4z0
Message-ID: <CAA+D8AM9s7EX-G246Hf2=DOx5q2qXWg_MjUCaoJ8RggOjp+5cQ@mail.gmail.com>
Subject: Re: [PATCH v3 1/5] ASoC: dt-bindings: fsl,imx-asrc: update port
 binding to support multiple paths
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: shengjiu.wang@oss.nxp.com, lgirdwood@gmail.com, broonie@kernel.org, 
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, Frank.Li@nxp.com, 
	s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com, 
	shawnguo@kernel.org, linux-sound@vger.kernel.org, devicetree@vger.kernel.org, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Xiubo.Lee@gmail.com, nicoleotsuka@gmail.com, 
	perex@perex.cz, tiwai@suse.com, linuxppc-dev@lists.ozlabs.org, 
	Shengjiu Wang <shengjiu.wang@nxp.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260810_192836_260086_E8457E38 
X-CRM114-Status: GOOD (  22.32  )
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

On Mon, Aug 10, 2026 at 3:14=E2=80=AFPM Krzysztof Kozlowski <krzk@kernel.or=
g> wrote:
>
> On Tue, Aug 04, 2026 at 06:02:14PM +0800, shengjiu.wang@oss.nxp.com wrote=
:
> > From: Shengjiu Wang <shengjiu.wang@nxp.com>
> >
> > The i.MX ASRC hardware supports up to three conversion pairs (A, B, C).
>
> Which SoC? Did you read this binding you are changing?

The i.MX35 ASRC (the original) already supports three conversion pairs
(A, B, C).
All subsequent SoCs that reuse this IP -- including i.MX53, i.MX8QM, i.MX8Q=
XP,
i.MX952, share the same three-pair hardware. This binding covers all of the=
m.

>
> > The existing binding exposed only a single generic audio-graph port,
> > which cannot represent independent conversion paths when multiple pairs
> > are in use simultaneously.
> >
> > Add a ports container that enumerates up to three sub-ports, each
> > representing an independent conversion path:
> >   port@0 -- conversion path 0
> >   port@1 -- conversion path 1
> >   port@2 -- conversion path 2
> >
> > Each sub-port references audio-graph-port.yaml as before. Hardware pair=
s
> > are allocated dynamically at stream open time; each active stream
> > direction (playback or capture) on a port consumes one hardware pair.
> >
> > For backwards compatibility, keep the old single port property but mark
>
> Why? Did the old hardware change that it has more ports/paths?

The hardware has always supported three pairs; the original binding simply
did not expose them all. This patch corrects the binding to match what the
hardware has always been capable of.

>
> > it deprecated. A schema constraint (not: required: [port, ports]) ensur=
es
> > that both forms cannot be used at the same time. The binding example is
> > updated to show the preferred ports form.
> >
> > No existing upstream DTS file for fsl,imx-asrc uses the previously
> > documented single 'port' node, so this change does not break any
> > in-tree device tree.
>
> Does it break other users of this binding?

No. The existing single 'port' property is kept and marked deprecated
so that any out-of-tree device tree still works without modification.
The new 'ports' form is additive only.

>
> Why mentioning upstream in the first place? Either this change breaks
> ABI or not, explain that.

The deprecated 'port' property is retained, so this change is fully backwar=
ds
compatible and does not break ABI.

Best regards
Shengjiu Wang

