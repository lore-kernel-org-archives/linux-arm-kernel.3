Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE869D13C3F
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 26 Jan 2026 15:55:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/Hesy3WNA157TAdMBzarWweQcPLGwH1r5vKjc9cMaj8=; b=psgkqIcuaN+mWcM/A47Rl7ZhxY
	RgFmVILQtNWV7XdVcqdklh/eMFTu69jDTm0bBEADx9t27ufRYNcDNPRsanYzCrxhfxJ+LB59S5YJ2
	2X9ZVxTHTFoMeyFNDdCAsSv+V5DfBUTJgUY2FCC7AbEAukKKIPI3X334f2QYycDQ+BB92onSG9ZkB
	sr/fPVHfXHW2uU7ivzLQcCitiD1CcVrmlMkYWeE/l7GF8wmj81cUTpatj1oRVqQ65DnHvvlG8/L3t
	DzUSIR9a2KjKK1ElZ/oT7yQMItLCxZ7rAbMTiSm4/6R05TEsrdWRLFSBymEiovYWwUhH5ZmDEqTWb
	2TZ73NqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkOvm-0000000CnbI-4817;
	Mon, 26 Jan 2026 15:55:11 +0000
Received: from mail-dl1-x1229.google.com ([2607:f8b0:4864:20::1229])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkOvk-0000000Cnaz-3jLS
	for linux-arm-kernel@lists.infradead.org;
	Mon, 26 Jan 2026 15:55:10 +0000
Received: by mail-dl1-x1229.google.com with SMTP id a92af1059eb24-1249b9f5703so281073c88.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 26 Jan 2026 07:55:08 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769442907; cv=none;
        d=google.com; s=arc-20240605;
        b=R7mDrle40++eKs39LxARn0dG5kne1vQ+azgc3RNsw/IfKoAgBhgqJwNgnCPZQLFs/F
         8ixb71T+qve7v3/CdP7mNutCWPar768F0R2Eens3D4Kbzg+V1XhAPujkTLbxrkg8Gbif
         2dNOxZ2v1XGuWiC/uvgWuqoUyVFD6QSIUz/VZ9X9FXk4TwVld/cegdb+amamx9Zf8nBW
         W49GlKRTzJKZMEzauhyjupabKOWk4sbNxweidWT2FcimJxswHJDEFYS3sr2ZCr9qEwVk
         bOJFYdeZrvLs4egKdIO4153oLQ14oIAofhZRxAvaWY/fu1KAvxsogRRJ/qHaFj/fCIDY
         lPUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=/Hesy3WNA157TAdMBzarWweQcPLGwH1r5vKjc9cMaj8=;
        fh=QhSDgiJjqidAPrWDIziN3ky/jOVJCoKfyrBnlsJyjxs=;
        b=MRhOgX7PQ6Q9rLP4xhbKn1qBaMvufU6vk+KnyCbxsAr5Ia/MREdYWp5q09beByaElp
         tA0t/39T/b5d2NovToE/hmytWhU4Hug9tBkfPmJWXj7qweGnL0KFGct5Txlc7oMJ7IG1
         RIRHAdK5x62X/uvuZQto1vb9zXpjkk8sMmuDvlPg3cwCUIZ28VrxnQ9EPYUy71Te5RRl
         2iX/nmhCI3Y0muI8xxg40uotM0Stmc2yY8PhbA0D7XhzCjDrrqy8U/AVIh4DkLzJbIMt
         P4TuW2362JDx7ZGhlyOh6AwjN00NGm8rN8s0Hf/hBnPtQMqqLeNKgICU3ib4ejWMM8hq
         8y5g==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769442907; x=1770047707; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/Hesy3WNA157TAdMBzarWweQcPLGwH1r5vKjc9cMaj8=;
        b=UmPmzDuuPsjlD4NxkNuA+ZWu0ysZjRwrLAdIm4iJEWWWRwSmFBP+T1G9MTkWy1xgax
         yqM2WeHa3wq0OBhpda6BCN1Ea4GcTC5vg12nihAaf2ezU9sLRxjO9QsQR017f/giHDI+
         q/SfJICvpw4QijH6hR1tF1DthgKihop20TZOnz0rFDzvlICmr2tXGThwvT/yJa6mIQQw
         R1qmwHyu8ffa4zlNB6RIZ2rMKKu5kGZEHbIP1pIhY5xe2SIaC/TyMIr1qx8LsirWBtM7
         D9QH92rSyaqoTq6IT8JoUixzV37kbaAQNwIpWf9qRf0Axgj1zHzJJPwwD1/c0KRNQ1VQ
         myIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769442907; x=1770047707;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=/Hesy3WNA157TAdMBzarWweQcPLGwH1r5vKjc9cMaj8=;
        b=rxpZU1ejj4OU8ujkoGSMXZ5WG671KLbWqM4A848kvXBe/luXT+Cxwj8m4kqwzcKxFS
         BQGQ+5qIXBXcB64qeZ+1sB1FARakhIWcq2Ih9E/y4TmYWYO5Qdh6rp54WHg1UvrTyuOt
         wbhLRZQW5pX5DzMfqthqxjvmE3CCimjiGxQigb60bVC66heauAXAS/ERAHdfvxkiYhhn
         IXi3F+31cwyCakK59tpWXlHBIw71rfjx6erWGBq8JUPDeV1KlBLDR2JaZbz371Tcoqdp
         urXJTgegwix8PcT3LPdqkzS4Nyvq1e2Aj3j5XKJe1lla4WpfS+YwLOpysuZFJL3p1XGq
         +79g==
X-Forwarded-Encrypted: i=1; AJvYcCXg9Clro0yo3pW4IKDSuDE+Rid8RuGf3He5WxdzAusTg3MFxsUSNbFuUxlmVP0ECx5QeRvffhLyeJehpsieTT2W@lists.infradead.org
X-Gm-Message-State: AOJu0YxJOLNMQHzbBNg7XzBdo+9CdnVpk9rN0XPt131L1caHRNIja9Xy
	OePw9anJMudWQq7tIJqyAqb3/vyStqVTl1ddLQt4G/ANo04eNI8rHLC0jt2z0JFiGgq8WZjYPwl
	rkqzo7efGky+f/iYeAmk2sK2aTxn97Do=
X-Gm-Gg: AZuq6aKdWKs1WiiH2YWP9IMHHs53QNT/SLyWmuUHvUv6hO6FFcuyfE4hpFUWCX2ahRA
	YNecNRBQ+p8D1mgJZEHfJRzW/FtgI5msdpbNPu7CzlRrFkVTdsPnnb/x8HNMwWl0QlRkVValmx/
	vtxY5OV1GIkIPg52e4TYs8pElWhM6IHy0smIxBqmZYV47dnwVzlmeGHEdfSva6pnY9A10fPPLH5
	MlfWmcJWxWW1+beB+DEAHxETAOMSqU7BksORctfAW0HeG/+wPL5NIPWeVjnqvcG0O8ZkxQ0D71e
	3HflfOSEfwAMPffk9wpKIg2G+FGuIXzKU+Uha++tkB35JkOyotah2/DOHieNTYNWXIxmQbLfaIw
	V4QJok2QZdhMnhg==
X-Received: by 2002:a05:7022:6083:b0:119:e569:f610 with SMTP id
 a92af1059eb24-1248ebf0a49mr1954211c88.9.1769442907480; Mon, 26 Jan 2026
 07:55:07 -0800 (PST)
MIME-Version: 1.0
References: <20260126145537.2301-1-laurentiumihalcea111@gmail.com> <20260126145537.2301-3-laurentiumihalcea111@gmail.com>
In-Reply-To: <20260126145537.2301-3-laurentiumihalcea111@gmail.com>
From: Daniel Baluta <daniel.baluta@gmail.com>
Date: Mon, 26 Jan 2026 17:57:52 +0200
X-Gm-Features: AZwV_QhA7W5Q3bPcFDKVTkQAu_DrVk_1nocQQ4dhm96_V9DFsolG5j1PxG9BQFE
Message-ID: <CAEnQRZAsiciJDQTAOjwQRZqxMW7sNifRf5rGBNq_sS0s0kJKcQ@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] arm64: dts: imx95-15x15-frdm: support AONMIX MQS
To: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Shengjiu Wang <shengjiu.wang@nxp.com>, 
	Chancel Liu <chancel.liu@nxp.com>, Frank Li <Frank.Li@nxp.com>, linux-sound@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, 
	Pengutronix Kernel Team <kernel@pengutronix.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260126_075508_964846_8158F049 
X-CRM114-Status: UNSURE (   9.51  )
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

On Mon, Jan 26, 2026 at 4:57=E2=80=AFPM Laurentiu Mihalcea
<laurentiumihalcea111@gmail.com> wrote:
>
> From: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
>
> Add support for AONMIX MQS (i.e. MQS1).
>
> Signed-off-by: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>

Reviewed-by: Daniel Baluta <daniel.baluta@nxp.com>

