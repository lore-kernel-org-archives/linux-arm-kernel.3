Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12DC1D3E798
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  6 Nov 2024 09:57:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:References:In-Reply-To:Subject:CC:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nFpPn0d2yFLk+e22ei9wc3wv5WH7ZWHa4AxPfroJzYQ=; b=2K9odfz35b02+RdhH0oBu6acN4
	kLro93jDptZKDFDpPgN4Bs/HOH68eVZXT/97sCkInUL73XY12fqqD+eAu/D4cgDz32otCjCmgYPY5
	9t6KQPLQiHkMmq8e0E8QcN1cSuz5CpqmtOeojYwcNkdTqJFALEvID1v8LxUidrig65VvjQeKelG5o
	3JYq744TxObq0OSNGgrpmNgxG0gT6hJcyn9qUCtgrnFbP7l4zSRr6V42w3qdiAxHSxUdaQY8uwbzt
	7KGI470OVgdI/Cf+0i2knC9bgKomnII+OYzC5HbV4vf2LOSvZhU+7z9qsBuYevbEPG+HAfEU/Sizr
	iIIldXqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t8cmY-00000002e6r-3pzU;
	Wed, 06 Nov 2024 09:56:58 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t8cD1-00000002UXJ-3aZv
	for linux-arm-kernel@lists.infradead.org;
	Wed, 06 Nov 2024 09:20:17 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-431688d5127so50710425e9.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 06 Nov 2024 01:20:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1730884814; x=1731489614; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:references
         :in-reply-to:user-agent:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=nFpPn0d2yFLk+e22ei9wc3wv5WH7ZWHa4AxPfroJzYQ=;
        b=IMYiUupx6moIX7fEREoV48ULic+IK3PbpKhGbed1yU/Ti5vV0YP+R26BHDj51YsxIJ
         6OKv1d9yok3flqBeRi7JCNmdXM99mkAt+W0GDep/dRRWae81gVImpfT0NE+AB6dcecUp
         vfvk+xfYJUAge1xrpajaL/95eag+EctCYbMydiyFAwUmq5PT/Xs+98E/GTCk70y1ipGH
         1lSv2TXrJv3eWNEHTYdLzQU0dh0uMtFhrHc5qnu0PGkbjk6ci3pQw0bkqrCcaZQ8Oy+4
         Ae3xiKKHFrVa27kLxmBTpuBQtxO8aUHqrvwkhJkkDLNcfzD3zqVsERwGEuoxKGSL+zo/
         Mq5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730884814; x=1731489614;
        h=content-transfer-encoding:mime-version:message-id:references
         :in-reply-to:user-agent:subject:cc:to:from:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=nFpPn0d2yFLk+e22ei9wc3wv5WH7ZWHa4AxPfroJzYQ=;
        b=kzC5H5GzWHNyIn1fwFV4TFHKSXSha/a5TjU40xJxLLAZgpiTMs/VP9EgcAmjMfnLEv
         mgR7972uxdpU5pRiWXJywJZIeAfQVtYwsvZ1boX8dDUOh5SueRkyf7P3nEcrOz2EQ/tT
         GGD1Ag+DxuAiIIeMfnITLHXuyyysSqo4kY9LELTCU76CDJmWUQyYkFyTREgQ0xhIfC0G
         BYxshMqMxVbT5nsoaQGFbteIIVR6Y6fXfRGAv7E8d3XV65R+yIbHMS8NH5jsptFwoF0V
         1WxsWMnGtAojbX3j3+KS98fFJd0tS/Xo3q55MJ5gdFldAUF8jojwLQO79TYIhO9bDRpa
         s8/Q==
X-Forwarded-Encrypted: i=1; AJvYcCXvjtKBoWRwgxs2+FT0ICd6+k1PYFxBHtWrwIEaFnR9soCQD8nSA131elXerIHgHm0SBdpXH8xooL/qPFcp3MKS@lists.infradead.org
X-Gm-Message-State: AOJu0Yzw6ZhEBSzPBwUo2h4KGdyV1F0/swbg5We/QlBuC+jeEwKIQ6n2
	lCnerUQZfhCbO1wAWBwdxfX4V395VTE2vWUB7xdEcEv6jhaVs/wv/6rrEbUcVl4=
X-Google-Smtp-Source: AGHT+IEYpLtbvoq+DLNXwR3nRAmR6avtTq4h+YsWpETFhBlqaeNqXWJjhte4lroosj4mGd9kd6ILbg==
X-Received: by 2002:a05:600c:4fd3:b0:431:60d0:9088 with SMTP id 5b1f17b1804b1-4319ac9acedmr359810715e9.13.1730884813855;
        Wed, 06 Nov 2024 01:20:13 -0800 (PST)
Received: from [127.0.0.1] ([89.101.134.25])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-432aa6da939sm15286495e9.31.2024.11.06.01.20.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 06 Nov 2024 01:20:13 -0800 (PST)
Date: Wed, 06 Nov 2024 09:20:12 +0000
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Maxime Ripard <mripard@kernel.org>
CC: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 Liu Ying <victor.liu@nxp.com>, andrzej.hajda@intel.com,
 neil.armstrong@linaro.org, rfoss@kernel.org,
 Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se, jernej.skrabec@gmail.com,
 maarten.lankhorst@linux.intel.com, tzimmermann@suse.de, airlied@gmail.com,
 simona@ffwll.ch, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 quic_jesszhan@quicinc.com, mchehab@kernel.org, shawnguo@kernel.org,
 s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com,
 catalin.marinas@arm.com, will@kernel.org, sakari.ailus@linux.intel.com,
 hverkuil@xs4all.nl, tomi.valkeinen@ideasonboard.com,
 quic_bjorande@quicinc.com, geert+renesas@glider.be, arnd@arndb.de,
 nfraprado@collabora.com, thierry.reding@gmail.com,
 prabhakar.mahadev-lad.rj@bp.renesas.com, sam@ravnborg.org, marex@denx.de,
 biju.das.jz@bp.renesas.com
Subject: =?US-ASCII?Q?Re=3A_=28subset=29_=5BPATCH_v5_00/13=5D_Add_ITE?=
 =?US-ASCII?Q?_IT6263_LVDS_to_HDMI_converter_support?=
User-Agent: Thunderbird for Android
In-Reply-To: <20241105-succinct-pygmy-dingo-4db79c@houat>
References: <20241104032806.611890-1-victor.liu@nxp.com> <173080602214.231309.12977765173766280536.b4-ty@linaro.org> <20241105-secret-seriema-of-anger-7acfdf@houat> <CD810D31-F9C5-499D-86CF-B94BEF82449A@linaro.org> <20241105-succinct-pygmy-dingo-4db79c@houat>
Message-ID: <7C2A2BDC-07E8-4ED7-B65B-BD7E4E5DC53F@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241106_012015_936553_498A4D31 
X-CRM114-Status: GOOD (  17.24  )
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

On 5 November 2024 17:39:40 GMT, Maxime Ripard <mripard@kernel=2Eorg> wrote=
:
>On Tue, Nov 05, 2024 at 05:33:21PM +0000, Dmitry Baryshkov wrote:
>> On 5 November 2024 16:13:26 GMT, Maxime Ripard <mripard@kernel=2Eorg> w=
rote:
>> >On Tue, Nov 05, 2024 at 01:28:48PM +0200, Dmitry Baryshkov wrote:
>> >> On Mon, 04 Nov 2024 11:27:53 +0800, Liu Ying wrote:
>> >> > This patch series aims to add ITE IT6263 LVDS to HDMI converter on
>> >> > i=2EMX8MP EVK=2E  Combined with LVDS receiver and HDMI 1=2E4a tran=
smitter,
>> >> > the IT6263 supports LVDS input and HDMI 1=2E4 output by conversion
>> >> > function=2E  IT6263 product link can be found at [1]=2E
>> >> >=20
>> >> > Patch 1 is a preparation patch to allow display mode of an existin=
g
>> >> > panel to pass the added mode validation logic in patch 3=2E
>> >> >=20
>> >> > [=2E=2E=2E]
>> >>=20
>> >> Applied to drm-misc-next, thanks!
>> >>=20
>> >> [04/13] media: uapi: Add MEDIA_BUS_FMT_RGB101010_1X7X5_{SPWG, JEIDA}
>> >>         commit: 5205b63099507a84458075c3ca7e648407e6c8cc
>> >
>> >Where's the immutable branch Laurent asked for?
>>=20
>> The patch set has been picked up after getting an Ack from Sakari,
>> before Laurent's email=2E I am sorry if I rushed it in=2E
>
>I mean, this was less than a day after you've asked that question
>yourself=2E Waiting less than a day for a mail to be answered seems a bit
>short, especially when there's no rush to merge these patches in the
>first place=2E

Point noted=2E I should have been more patient=2E As a lame excuse I could=
 point out that the patch has been up for review / comments for quite a whi=
le, etc, etc, but this is really lame=2E=20



>
>Maxime


