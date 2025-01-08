Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D088E77188
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  8 Jan 2025 19:35:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pZ8OaEnCblGa//gqGF016T+aNas0t6We2C1yQ9rLcFU=; b=MNkP1moOC3DgEg5Z0zirAz/Jh7
	x6kzM4u13eo30e0D6YxQB0tOejZW1ybNS6bOQ0bxIEdJ46Mm5hk2VgJBy9GOFGTjOlcT6V36khUto
	MBgj45W5y8F1YmJ0ap0SsItqd4+HPCQ1fOvOa4I06WyZ6jdYkCRZuqpfic57Fgilx36j/xnvfXQpS
	O5yRYGn8aXm+Pbi6lPjUu4Mwl9Dn/yPth8T+RlDMGNwLRhEDW6MgLMMi/quyQe1YCwd6srzMw+8Qw
	walHS4mry6+pGYfU7qcDWVPYPY5/22jDt1mvvoheBIb+UQ2MZTqGCjUL3SOLsLpXlOq8SSth2cPjK
	wsO1/7xA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tVbq6-00000009fQU-36od;
	Wed, 08 Jan 2025 19:35:38 +0000
Received: from mail-qt1-x82c.google.com ([2607:f8b0:4864:20::82c])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tVbos-00000009fJO-18vf
	for linux-arm-kernel@lists.infradead.org;
	Wed, 08 Jan 2025 19:34:23 +0000
Received: by mail-qt1-x82c.google.com with SMTP id d75a77b69052e-4678cd314b6so612961cf.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 08 Jan 2025 11:34:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20230601.gappssmtp.com; s=20230601; t=1736364861; x=1736969661; darn=lists.infradead.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=pZ8OaEnCblGa//gqGF016T+aNas0t6We2C1yQ9rLcFU=;
        b=Nre4M/A8L8LUwNbOpiM03let3haPcm9TAkhyYJMeMAZ5GCs1m4U0C6eBTbuT/Ix5bW
         ank+4KygcaveRd0DMNglNR//0eqqd71zMaOzsBZsafR1cIKi+Apg/e/IlXjcLKhA1zr5
         AZOKQZa4QoYAbeExmQDb71cDskhjGdJ7xiURD9ONyW3HpvmDojU0ulLwY5mKpUhmQS/y
         2Lf+BF7Bxf0q+eQ/uZhGvBcY4Kggf0Hn4O6MOzbPtjsvSiUrhlHRhTDTD8E2Gec1rIMq
         B0LgE6zPb54oWbRBLYa3maYXyqMeoB5dubDRIvj8y/vkrSREoMH5gSDpjB7IL75o/Ula
         KWJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736364861; x=1736969661;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=pZ8OaEnCblGa//gqGF016T+aNas0t6We2C1yQ9rLcFU=;
        b=ryNLC0/LL8KGERNrhmwuQX3F7easrHOC33+hO6lbJniT9gv4dURPK69e2aiXym6hby
         OV68cN2fMrXo+RVk2C5pBO/daVUx8KUizf21EfXG0knqHXkfvmQpJ+H/cdSdB+Xgd9hF
         n6W/peG17RZj9H8QB9lo9f43NgE666/3prXFyAdWHOLiGAdxfX5CGl7OzVGuizi0m5bS
         aHpTpxyUtDEYCgalVOPApyp8OUK2WzxpBaAQY4PikrbS38l5sgIYPEoMIuLu/hZpEyfg
         E27gYwlFXnVC9CzlMRBnYmnC/ikeKBjUccPUlA3B5pF1rf3Du7Sy4cT3IVzMsDblJacR
         jE0A==
X-Forwarded-Encrypted: i=1; AJvYcCU90Ews2o3bBvx1mppE34JlFO7/G0aiI+jf0Fg4+dchDuLkFdeEsbG0uSjytmfc6yPx1K6wHaitUsyA/cEfog/M@lists.infradead.org
X-Gm-Message-State: AOJu0Yx9cz299f/C8geNgU3TSRjEHd2yuNUUDpqnX1P4duAr1zK084ng
	InLzRW1ZgIPTl9vy2s6MwXnvntpnhB3UXoPhg41+9TSt7xY0Q1r8eb27vYzisHw=
X-Gm-Gg: ASbGncueWGlR+TV5UN8n0lf4E3u68JscTwg2VVZ0pikhUGBHhad6Z1Czrbla6IVJwnY
	rBppl9cjAD/XjY0+FyRfvPtyHdp+TgsoqVpv+wc0ELKQRRBXZPeybN7eIkyNMZACHnyBzP92jri
	q6R9C094VWTtEHzzluRplAV/c+3dYaUdvrG5Aj0TEHmcl3t0wVacGN6hRpZcegcyEgbuXjnGm8K
	7OciUJrRNYWnHNxl6U82LfwJglGc6emFnC1E33Af7eroucchbqdZnirMA==
X-Google-Smtp-Source: AGHT+IHHoBOVEADoDwJ5SEc2bvPkTd9ig7fH6khIBw3ziijVw29fWtXY3bUiaQ9CQqXYbSXbLj0hfg==
X-Received: by 2002:a05:622a:1792:b0:463:64b2:2e0d with SMTP id d75a77b69052e-46c7107a922mr65440061cf.40.1736364860717;
        Wed, 08 Jan 2025 11:34:20 -0800 (PST)
Received: from nicolas-tpx395.localdomain ([2606:6d00:15:862e::7a9])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-46a3eb16c7bsm199636001cf.63.2025.01.08.11.34.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jan 2025 11:34:20 -0800 (PST)
Message-ID: <dcae7fbb810ebfa6e539c3b45c20e1d659600d80.camel@ndufresne.ca>
Subject: Re: [PATCH] media: docs: dev-decoder: Trigger dynamic source change
 for colorspace
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: Ming Qian <ming.qian@oss.nxp.com>, mchehab@kernel.org, 
	hverkuil-cisco@xs4all.nl
Cc: shawnguo@kernel.org, robh+dt@kernel.org, s.hauer@pengutronix.de, 
	kernel@pengutronix.de, festevam@gmail.com, linux-imx@nxp.com,
 xiahong.bao@nxp.com, 	eagle.zhou@nxp.com, tao.jiang_2@nxp.com,
 imx@lists.linux.dev, 	linux-media@vger.kernel.org,
 linux-kernel@vger.kernel.org, 	linux-arm-kernel@lists.infradead.org
Date: Wed, 08 Jan 2025 14:34:19 -0500
In-Reply-To: <20250107053622.1287461-1-ming.qian@oss.nxp.com>
References: <20250107053622.1287461-1-ming.qian@oss.nxp.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.2 (3.54.2-1.fc41) 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250108_113422_314837_C8D7D714 
X-CRM114-Status: GOOD (  17.45  )
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

Hi,

Le mardi 07 janvier 2025 =C3=A0 14:36 +0900, Ming Qian a =C3=A9crit=C2=A0:
> If colorspace changes, the client needs to renegotiate the pipeline,
> otherwise the decoded frame may not be displayed correctly.
>=20
> If it can trigger an source change event, then client can switch to the
> correct stream setting. And each frame can be displayed properly.
>=20
> So add colorspace as a trigger parameter for dynamic resolution change.
>=20
> Signed-off-by: Ming Qian <ming.qian@oss.nxp.com>
> ---
>  Documentation/userspace-api/media/v4l/dev-decoder.rst | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>=20
> diff --git a/Documentation/userspace-api/media/v4l/dev-decoder.rst b/Docu=
mentation/userspace-api/media/v4l/dev-decoder.rst
> index ef8e8cf31f90..49566569ad26 100644
> --- a/Documentation/userspace-api/media/v4l/dev-decoder.rst
> +++ b/Documentation/userspace-api/media/v4l/dev-decoder.rst
> @@ -932,7 +932,9 @@ reflected by corresponding queries):
> =20
>  * the minimum number of buffers needed for decoding,
> =20
> -* bit-depth of the bitstream has been changed.
> +* bit-depth of the bitstream has been changed,
> +
> +* colorspace of the bitstream has been changed.

Did you really mean colorspace in the way this term is used in V4L2 ? What =
we
want this event to be used for is when the capture storage size or amount
changes, perhaps you mean when the capture pixelformat changes ? This will
indeed happen if you change the bit-depth, subsampling (not mentioned here
either) or change the way colors are repsented (RGB, YCbCr, etc.).

> =20
>  Whenever that happens, the decoder must proceed as follows:
> =20


