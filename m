Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BFE9D10775E1
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Mar 2026 16:06:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aPJNEHqr9HCYGUb6/HYe7QV50yFPw4glgAjAlyGnrgg=; b=jLNWkKHnz0K7yLuFTt0/C9BlpS
	U6zdjsb0kLbS9Xg6jDqTXiD6ldaC/9A/F4C+u+Va5sDFfT++Sv/Wqi9hyhEE9zKjIIKJ0cOA3ki4z
	7QbbkDznjid+0kIlvTKoqHs5NB/wkz1mi0RfLAkDhKCMStt7fu677nt8Rz60hmLfnY+QtjjkZWOx2
	Da77EV1xLoCOK61mEu97kZplnomiLvEj5dJ0qL554qg/yJ4gsxvscU7PjxCFDRPnK11leGiN9eAOB
	jdovFTE4kKhG0w+YLGnJLFwasa9c5W894gbXbxuHUXb+xDBcVcAvBjK3IQsrU5xEGMUSrsX8zp9LO
	kAk1rXlA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2tQ0-00000008tBj-3PHL;
	Wed, 18 Mar 2026 16:06:48 +0000
Received: from mail-dl1-x1236.google.com ([2607:f8b0:4864:20::1236])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2tPw-00000008t92-3ZuL
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Mar 2026 16:06:45 +0000
Received: by mail-dl1-x1236.google.com with SMTP id a92af1059eb24-128e4d0cc48so27527c88.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 18 Mar 2026 09:06:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773850004; cv=none;
        d=google.com; s=arc-20240605;
        b=SYmGgy+SU89Hb5kul9Mw09+mUpYGIDccx2HG8Jq6NOYs53nOQEhRQIo5ySwcr3MQ7U
         df5Zh+HVW8xMXSsdoyZObiHb/aPg6GqL0Twa83Y00Njovy3Z07edVZoHfAte8Sqf5OLn
         ZiIadMypXUBJjjk85HD6AMrAa9F5Tdfd9jYsIPiAdLIC2ZuhFPSempugi0aZghWhVkZY
         n+xKPdKX1UifHNYTNdawZQzU3SKa7R7Dx3cA+bW8GniBsJt696+o/Zhd88OXUW/kwEuF
         IecQfW0sOgwbk34ws27LWCoJSupLpaM0v/mcraXQgzBZdfUmiTkD/qpPSRh6RX6K5nkc
         e/Hg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=aPJNEHqr9HCYGUb6/HYe7QV50yFPw4glgAjAlyGnrgg=;
        fh=BsjfmOmyPFiG9gmKTnDZc4fdvVnEBthqI+/POrTScCI=;
        b=G7bu84pYyQczXCE8ts/fdyqXNN20pXaBZsT2SAmxhSrjKV06XAiHHMGDJZH98F8hXj
         8aRxUSJ+vJvUx5B50LJTPv7t9gOUsFJdzE67mT3ta+i1m+X+ghVMzeh7HYbwbTOoMAZb
         xlssnnkomivrjPRsTYIm8utzHNw7u8DYCRmlKif7/bKsJ8BzahuvdvwUZuGvb2Ofrke4
         /1KlmmhesEdDrbmp1n7EFg31jGnUigSM3Ck5cAX78fh5S5BlkkhHr3CJxMUqXLAtG9CX
         KAbWbPeohKLU3CspYWJ7U5IIO1ahPheGyNow5tonoWIe+SGwmUGNQ5iOcjBZCa6KR2+w
         bX/A==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773850004; x=1774454804; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aPJNEHqr9HCYGUb6/HYe7QV50yFPw4glgAjAlyGnrgg=;
        b=B0p0HUbTFS2zU34QIq9E3oIdUFwMSguzQAKL3kZAPpEa1b6lDS2H4L+x9+yFKlPdGd
         iE2DfcX09Gem9QyJJaZlg7OqM/FvHA/WK5qgVeHgkSGMI3tDfjaIG73JF0X8uBlLa9Ys
         5+7mXa8qCNdmz1FdpXEe0DdoTqlWugXh84pYo5pgBNtTFlf6s29BInRphCbAi8eU+tYK
         THKyu1nyy/gF7j//9xMsYUfKH+xnSrS+pDH/Zv+WVy43lfNwojlrQkC17LkN6CU2gIcB
         Qq9JEFoRlq4aOjYjwnZ9EA1b5yf/hPhh9laOv6eUYfNGMZ0+tiDEzjwKyWZAc4xochJU
         YR9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773850004; x=1774454804;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=aPJNEHqr9HCYGUb6/HYe7QV50yFPw4glgAjAlyGnrgg=;
        b=mvOt0N1rNa97jpDkzxNSXEtD4FFE3bwmb9P3Tbf69a3XGyGfK82RcOFGlMNnBCcvDO
         C8xAE/tJ5APA2zYi9J75jISfJFxFe6foeU6/BZsoJWVTZBqQtkoDZNhNU/4zEGiwDLdT
         KcutSdZRkzjjY7oypa1C64pLPx4/GmJ3LZxDAUdP4hVIk9EMOpb60wh6XXQpMAiscp/D
         HnAACqgeBzvjwqKueC5MhTmS6nd46XCZYVdWDzOTgRYM74Az6UcCrzEi8tWAXr1cXCwp
         XwGUMtOVCrNnVgnW8pclXnhIOI5GAgBNyoHeG2lBUGrUV93DZrWExwdfn/rYamL9xxYc
         bZ6A==
X-Forwarded-Encrypted: i=1; AJvYcCWBVFgdFgGe1Wf+/N3DK87wTGuo9e7uLJAbKIJGsKyuyQApSeiNuffqA7W9jZlu4m/vvv9bhngKEQaXd82k8U8q@lists.infradead.org
X-Gm-Message-State: AOJu0YzxyeyYG59cv1vRruQlnjmH900NZ2bYkwncKgTv/4E326MDhT5o
	N5drSPFIxzAqwfnXY1459rfSKHE0buCSU1wOu88mmrfWXw+EJObvIF0/o5OttTGl9woX5ehavVz
	k+w9kdo1WcJ/hn81bjzwQlsa6C5i0/GM=
X-Gm-Gg: ATEYQzyazLM2VmE32gdfrqws00t/wVSvnwRfZScevfNClV57aGgbkFaRPDwBT6P3MLx
	uTx1qnYpaGRFqX//gBmqx4unDfhgArzsNvtTIanLPzyIVK5FpIp3reToxm4wdJUmwi/8oa/bQ8V
	xlPBsTKCt2sdh6dprUxR4dlI2YpWRDJCHPEA+9ZJbAvvc/MuoXo8pkIXFiOalVGeaLET5Hd01w0
	TOVnLhdgDTUWbF0iqYuqAX1Yrb3d/mC9K0I0NIrOSYvsyGA7owQBu8mvq5AKQSyU3jVy/YySbIU
	HEj7HcHo1oTmaamuQ8voH4GAXsB9CwcQfDyKwnA7C+hAuaFFYmRHO6LwKSfROK8Sc7GFtdORwSf
	rUwpRlLti43SaGdcacPrG9Q==
X-Received: by 2002:a05:7022:421:b0:128:cc34:3617 with SMTP id
 a92af1059eb24-129a714811bmr1918564c88.21.1773850003615; Wed, 18 Mar 2026
 09:06:43 -0700 (PDT)
MIME-Version: 1.0
References: <20260305-scmi-imx-reset-v1-0-18de78978ba9@nxp.com> <20260305-scmi-imx-reset-v1-1-18de78978ba9@nxp.com>
In-Reply-To: <20260305-scmi-imx-reset-v1-1-18de78978ba9@nxp.com>
From: Daniel Baluta <daniel.baluta@gmail.com>
Date: Wed, 18 Mar 2026 18:09:31 +0200
X-Gm-Features: AaiRm5289taSx1eb7TjHchZuhRz0bSwV54-QwJD6-l7mMGU5Fnso3LBqXAa9jCw
Message-ID: <CAEnQRZB6L7asKXq4rjPr+a1ai-jonBF_bTsT=Sk3ZJuNtUPS9w@mail.gmail.com>
Subject: Re: [PATCH 1/2] firmware: arm_scmi: imx: Support getting reset reason
 of MISC protocol
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: Sudeep Holla <sudeep.holla@kernel.org>, Cristian Marussi <cristian.marussi@arm.com>, 
	Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, arm-scmi@vger.kernel.org, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Peng Fan <peng.fan@nxp.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260318_090644_893265_CC2EA06E 
X-CRM114-Status: UNSURE (   8.49  )
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

On Thu, Mar 5, 2026 at 3:55=E2=80=AFAM Peng Fan (OSS) <peng.fan@oss.nxp.com=
> wrote:
>
> From: Peng Fan <peng.fan@nxp.com>
>
> MISC protocol supports getting reset reason per Logical Machine or
> System. Add the API for user to retrieve the information from System
> Manager.
>
> Signed-off-by: Peng Fan <peng.fan@nxp.com>

Reviewed-by: Daniel Baluta <daniel.baluta@nxp.com>

Thanks Peng for your explanations!

