Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1AA4ED12691
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  3 Dec 2025 09:53:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0MIEaIEz+Uu4LM0hJtlrbSaF1/Us3rYdZCWuXdM8wDU=; b=PAkDTA1vT3gwiY9YybqdbCvVGG
	n8Q1Xt9y2o0JkzC9/OxezgaaY3eaCnL48+xzG+Nuj6RQ9wsBUjb1Vjn2ovnpaZZl7Ss+ppijKbF+K
	tOVSibWxJ0wfC065pgcrCsnhDEOcfAj/UD+Q87YO8c4+MLxQxAmucZJ3c1Z1dcO4zePOzF24p9Pzh
	YugrWSnww9X+78sZh1ppSN2GTI+xAj7t6qWS1g7030welw6vkyGXViqRNr3u+dIf4VZpyxrcHLM2a
	jEJcGLqHoxvKHyFMjOHE2jYzk8dTEoyBIt9a5tBAft/dWpWpWxtjj2zbLcSPVwvxgzjf9PmWJJwzo
	9pWxF+VA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQjXy-00000006Q78-3qoN;
	Wed, 03 Dec 2025 09:53:18 +0000
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQjXv-00000006Q6g-2Pmf
	for linux-arm-kernel@lists.infradead.org;
	Wed, 03 Dec 2025 09:53:17 +0000
Received: by mail-pj1-x1032.google.com with SMTP id 98e67ed59e1d1-34361025290so5320903a91.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 03 Dec 2025 01:53:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764755595; x=1765360395; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0MIEaIEz+Uu4LM0hJtlrbSaF1/Us3rYdZCWuXdM8wDU=;
        b=KQX4ByAjErCjfarC1poCNh/7xKr/eXnn5pEPdHdBRBnNVWLtP345ccT8/RO1NJdS5k
         JlnXR5KpxAnLDhftsTQ893egkOEqJPFMFUr228g7ojFOckzK7AyiDaXDRZ4agmIBJS2k
         1TO2J+CqFyhhz0MM2Vy+EpPHtUQpkniQIwhK8nPpAY73iyBLjNWqTL7Lb5n4FGKI01WO
         unisjlLvP9VscHn70m5zNnWLNYgQmpdFTVi9YOvPVKami2i3vAtXhDEnk1sn9ugBl5o3
         wxr3D4y5vX4hxCOlWECNUupbD/letx6in/5fhv66OofAYoKIfO1M66deNfw5OxKQcwuw
         JkGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764755595; x=1765360395;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=0MIEaIEz+Uu4LM0hJtlrbSaF1/Us3rYdZCWuXdM8wDU=;
        b=GtgTRDalBak6yS3iDuCXdOBRi5s+NOzoH8PHFC4lfm/mx+KV/ZSWDTW/OcMDDQwsV3
         0qHhcdqjjhnw5Ao8moFyZNBa013VnneeP8w/QFP19IdzpcW3qIOfyuNQTj7h16YA5ljb
         fKjJRoXCaoabcUJz8kSYiBP1gX+GxOo5+vf8z7+6ZKSg8PBF2SQAhbjdKIGvLMJekXii
         rp87HK4tSCZZIT1Y92Q68G1Pt2akqb0tw4TIXUs1wU7ILgu1f0yQ6lLCFOxvZlCpGETN
         /tQCJd5CoBd+LWVMOPVMQ3WUIUN0PK2BU4GHPEZAEAMXsKB16duNVa/VnCPf1IA0EgfJ
         JT/Q==
X-Forwarded-Encrypted: i=1; AJvYcCVNjCP0s//asdDFk+UABG/8DbvGy/2cIQ7+GZyq1ZTQBw/3AgvELPq6/l27I7qfjWF+Wodw1eUjm7pjSCjuCLqd@lists.infradead.org
X-Gm-Message-State: AOJu0YyyEyulPImubUm39aiGd6TkpUU3ZADOF4egAIgpKyzlwO4vpZMV
	L6YM44adgacq4Rj6VMYPexBsQErclWCjO35jlWC8rcsOlgjw4e1RHnToB2Ce6p06ru5Ua5lb8Jp
	Cpj4o7MOTW11lHaIFB8s+edLH29GVXe/65g==
X-Gm-Gg: ASbGncvj6V7NAlthc0SVC6srcUuktN1zyVO4AFRwPvInQtJwlgDnJkU5UXxphwQph/J
	0QuQ1A/YUyqjfp+yvfeXPKJUBVY3qPACDvHtjduvvh5jCKwkamGg+SkHLaZRJuw7dwOUPucTNMG
	36qL6EMVsrzSr9CFH6aPKf87wQobkwu9MIJdYU2YIQQOUsny8ITahqsWedNW9R9LNjkqNOEmqxl
	ZjdJM8Fryhw009EP4ig93n5K1bZCCkmQ/rCmESTmR9rW2NrSah13ImcDjO2F0Ufeim9oZHmWy1i
	BrsIfdi8XFd6Z8I6COS3lhyYL+fNkQqsA5wpv6azl6+bdbM/DqW82UWC7ENuTgFEDo9hjMMg4Qd
	Ymo2mIkTsSA==
X-Google-Smtp-Source: AGHT+IHHiE5h9vFxn3JWLglIm1nyTMKgPs1nJsrmvzcPj24vwltjLLoR5BR4ubExcXnNuPJHINfYUI8wqXTVIRIaQbw=
X-Received: by 2002:a05:7022:3893:b0:11c:fe15:f66d with SMTP id
 a92af1059eb24-11df0c5e372mr1051422c88.17.1764755594695; Wed, 03 Dec 2025
 01:53:14 -0800 (PST)
MIME-Version: 1.0
References: <20251203070605.1868821-1-chancel.liu@nxp.com> <20251203070605.1868821-3-chancel.liu@nxp.com>
In-Reply-To: <20251203070605.1868821-3-chancel.liu@nxp.com>
From: Daniel Baluta <daniel.baluta@gmail.com>
Date: Wed, 3 Dec 2025 11:55:47 +0200
X-Gm-Features: AWmQ_bl-2uOJJKigyYxADeo7ivsphIlHSLcBD3op8Es5RJBv4uA5RHkTpe-gdho
Message-ID: <CAEnQRZDx6kBwMYzXRH7zEzJQ58We+o6cfEh-XYcnL6tL4K+gFQ@mail.gmail.com>
Subject: Re: [PATCH 2/5] arm64: dts: imx91-11x11-evk: Add bt-sco sound card support
To: Chancel Liu <chancel.liu@nxp.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de, 
	festevam@gmail.com, devicetree@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251203_015316_070561_10587558 
X-CRM114-Status: UNSURE (   7.25  )
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

On Wed, Dec 3, 2025 at 9:07=E2=80=AFAM Chancel Liu <chancel.liu@nxp.com> wr=
ote:
>
> Add bt-sco sound card, which is used by BT HFP case.
> It supports wb profile as default.
>
> Signed-off-by: Chancel Liu <chancel.liu@nxp.com>

Reviewed-by: Daniel Baluta <daniel.baluta@nxp.com>

