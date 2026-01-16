Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00097D4A61D
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 16 Jan 2026 09:37:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rjevClhNecUKOFoTrhz/ZX3fWZv5rxd0vUGBfcrCQjY=; b=Bw1avFeCQwc6UcItbxthxlV0sp
	Mn3EaXUvLoZH4wiOugeP4SIqsYU8YZtnvyfhHEApRPGYIZYfK3+/Z7HkbNC0N5zJtJFmFrpOxjqTi
	44E2LIeKoxe2nkVbuvwFZkmAc4FabmCO/vdwfb55KV01k+3O/G5S3VjiPczE+90x4HqPv82acui0H
	Fa7D9+LuqGqyGi+8klPzjxWVEcR54JadFJzDbZntmDsmkajNrShcDPAMY4i6v0NO+IN7jgycG5L9x
	zvd78yxkRtFN4gqwq4qsOhKRor0he+m6wPd8026C5FDBH4LbKMsA90TjMciIbE5EIM78sw2PYR59y
	gTMdFh3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vggGR-0000000Ds22-0U5e;
	Fri, 16 Jan 2026 09:37:07 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vggGQ-0000000Ds1g-0Pa1
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 16 Jan 2026 09:37:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=rjevClhNecUKOFoTrhz/ZX3fWZv5rxd0vUGBfcrCQjY=; b=YxzblDOHqEnkLUadIl0KXwxOhf
	Ng1wzBrXvaq8YMDpROzTxFLsoXMPuCavOl9rg9LTK1tDEOvmz/moKGdRiEo9PYlilWEyq8Few3ELW
	Mroe8JxSVcv2FnaQIOy5JUI7S6V5vtXKLe63qk5ujROlp/usH5bCdUBpu1phtdYSFakRkmNI2218L
	R9H3cSpPBRPIF+GNGGLsucdeRzuUn/70HzeuV0wvTfOlhpja8XdTX5kGT4W8DKNqQzRZgy5M7AjW7
	7oq9jPhKQ6EkTlWLBC35+63pUzbRExyw8hISgV0Ny0NI3lNrZsu7x5fngIHQOoKHsF9w7ZSo54WMp
	isyVkEtg==;
Received: from mail-dl1-x1232.google.com ([2607:f8b0:4864:20::1232])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vggGN-00000008Oyc-1FQc
	for linux-arm-kernel@lists.infradead.org;
	Fri, 16 Jan 2026 09:37:05 +0000
Received: by mail-dl1-x1232.google.com with SMTP id a92af1059eb24-11f42e97229so3985794c88.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 16 Jan 2026 01:37:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768556220; x=1769161020; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rjevClhNecUKOFoTrhz/ZX3fWZv5rxd0vUGBfcrCQjY=;
        b=YQ0drCcS3kyZeoxHvQhugK7Doqxf1hkq2gL+hB6b2KE9pzpnJ4c63hqEpb43Ocm53K
         kHUxjqITYOzhOQ9Hs8Pqz1zZTj3DZmSS7GEUCev5KpU5AdpYRervp3n39nObtaX4LXQF
         xlRb8trq07EuC5gbCqL9VvwjXvFzXZSAa0TEyUFSV4anLIdR2bVH9uxxARBT5hQwZ9rz
         /96us8qQKyvLPwCDJUD4S/UAy83yLyhRz/g92Fjnvtb1y3docwkNUCTDEsbqqwUWEl5J
         GBA48WzkzWPnjvPURnhpA56MUadlXutrPVzpXKn86bD1BtHTv5PO9gQhFg2WsvIy9h3N
         mXqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768556220; x=1769161020;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=rjevClhNecUKOFoTrhz/ZX3fWZv5rxd0vUGBfcrCQjY=;
        b=WKB+5l145de/SHHTXTUQVB5rnZcBXZ02FIAvEwPFPetpGrcEcsfvzQUIVOuBrsjDHV
         UbVGnfZ39SdUeg169WgIdywA+81c8X0wfDuTTyMwK0BpSvGL/6wr3WuM7JTMDR+eQ7yH
         sbyv0h7R+dScoO+sDjjMwRDNXPU30z+gPEnUpu+G+em2KPe0jf4xUUK0kcN34hqZh7de
         1c7OgfdBJgvIW7x10x4lqwIfvXyHBjasgBNJAhrZnifEh2wUL56WjycI7+qYCCrwwt09
         UjsfaXQXuwcZgFkeqxWrBeRXBKapJD3v72g3WuxM7yTHh812JyjYS+wWQkFEv8aREBit
         HpxA==
X-Forwarded-Encrypted: i=1; AJvYcCVINUS4joWKbHPjr5NarAW2lBfOcVCBrq2t02LOM6E9KjbKbgA7+aHUvCB/fQy67qvbfNGBWT0L6a3g2AhBmqvm@lists.infradead.org
X-Gm-Message-State: AOJu0YxMvFxoL99725aJYgZO5xftdn43SuzZLPNyyNQ70BvnTJb/ZtVk
	ZwA56PEGbp9EN5wAOTvfsgdydND4tvewrAhwiLPZh6duxCQ3u/fb2YXyfmkOhP0fpMOdVgJwd0V
	+ZGuRBvcm5GV+aWOxh4eMe2DQgAMaOio=
X-Gm-Gg: AY/fxX62cGAP05RVUSUlEkgZDx5cFqgP6SOm2riOFkgOqu+yHMUF+zOVealQru82WfD
	mnuxVfMvYt90ihJB/Worb/Wp+xWHsAIDBtbAnVCZXBUCS/xXSIGty7Njdku7te0RwvwP7lnv8Qf
	wAti8YyqB2zmsa5FHvLzP4t1E2oJW+dvMIO/8nxgaUk92TSlbTAGGtX0MQCFEpAf9PXk+vKaW8O
	/jXVto7ke7fHjW46zN9pMrcr7Cp7E3ESqnyv08cgIkE5odFiwjyJEBOOaLmF/yqpgr+civ1SBGG
	ETdu57f+jaAb6920cWxHl9iKxQkk5jhcFHVMV9gpdKtXqGf8EFgmTC/lymno05/c+4nQLaKgw2q
	NJ5gj5To/GETn+gBakovq
X-Received: by 2002:a05:7022:6182:b0:11d:c91e:3b58 with SMTP id
 a92af1059eb24-1244b381f4fmr1752175c88.39.1768556220218; Fri, 16 Jan 2026
 01:37:00 -0800 (PST)
MIME-Version: 1.0
References: <20260116-127-v3-0-3dc49545a745@nxp.com> <20260116-127-v3-1-3dc49545a745@nxp.com>
 <94c920e9-cde0-416e-9b6a-16255eda2b73@kernel.org>
In-Reply-To: <94c920e9-cde0-416e-9b6a-16255eda2b73@kernel.org>
From: Daniel Baluta <daniel.baluta@gmail.com>
Date: Fri, 16 Jan 2026 11:39:41 +0200
X-Gm-Features: AZwV_Qh6ntqhZTGdRL0PXfGXgKQs_rs353EC_4pMNSP4GTlexk3c6guYld7I3zc
Message-ID: <CAEnQRZDrchcDr51r7HWjq_=S184n2rq1o=XAnvQKVrXLxS+qjA@mail.gmail.com>
Subject: Re: [PATCH v3 1/2] dt-bindings: arm: fsl: Add compatible for i.MX95
 15x15 FRDM board
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Lei Xu <lei.xu@nxp.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, justin.jiang@nxp.com, 
	qijian.guo@nxp.com, Daniel Baluta <daniel.baluta@nxp.com>, 
	Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260116_093703_429278_8E6C0455 
X-CRM114-Status: GOOD (  14.81  )
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

On Fri, Jan 16, 2026 at 11:36=E2=80=AFAM Krzysztof Kozlowski <krzk@kernel.o=
rg> wrote:
>
> On 16/01/2026 09:56, Lei Xu wrote:
> > Introduce a new DT compatible string for the NXP i.MX95 15x15 FRDM
> > development board, a compact and cost-effective platform based on
> > the i.MX95 applications processor.
> >
> > Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> > Reviewed-by: Daniel Baluta <daniel.baluta@nxp.com>
> > Reviewed-by: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
> > Signed-off-by: Lei Xu <lei.xu@nxp.com>
> > ---
> >  Documentation/devicetree/bindings/arm/fsl.yaml | 1 +
> >  1 file changed, 1 insertion(+)
> >
> > diff --git a/Documentation/devicetree/bindings/arm/fsl.yaml b/Documenta=
tion/devicetree/bindings/arm/fsl.yaml
> > index 68a2d5fecc43..4b6188d39be6 100644
> > --- a/Documentation/devicetree/bindings/arm/fsl.yaml
> > +++ b/Documentation/devicetree/bindings/arm/fsl.yaml
> > @@ -1432,6 +1432,7 @@ properties:
> >          items:
> >            - enum:
> >                - fsl,imx95-15x15-evk       # i.MX95 15x15 EVK Board
> > +              - fsl,imx95-15x15-frdm      # i.MX95 15x15 FRDM Board
>
> It's always surprising how many people need to review such one liners,
> but for more complex patches from NXP there are no reviews happening...
>

Krzysztof we are just warming up.

