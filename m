Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72ACCC54F30
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 27 May 2025 13:38:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VyWGs92VxZHmYWq/MBjeYIKfJS3oITyIiMO5I+wjqS4=; b=CjIpwy7iawgsY8svTVhdamvUaL
	7xYCj7SF32CIDbf5LHCFm2LGpUJQlLjvh85VXJ6b9kHnUv24OM8utpV5UO0xXF1sn9QGAs7N63Q82
	AcHnz83PwPcLoA3jCWsz7zhqS0mNCHPFt9OaQLax23h3VaGKL9IaXyd2NVVnoU6ERMCGPJB++3MJq
	Fbm61Q0xghz5xR5+9Y68Hd1jCoNjQdT53al/rSrq8uZ0e+UjujFy4al/0HnIOznZ6+i5zPH3ETAwJ
	9fJyqyd6zxjLmo60tQavdfATpgbF1MtZ2ktZPikgRbWCaPGyKqDtdG3+PmdmSOnfcc20rbmSxmtvt
	dG71z/UQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uJuVD-0000000AqRb-1rty;
	Tue, 27 May 2025 13:37:59 +0000
Received: from mail-qk1-x72a.google.com ([2607:f8b0:4864:20::72a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uJuFm-0000000Ao9l-1FMb
	for linux-arm-kernel@lists.infradead.org;
	Tue, 27 May 2025 13:22:03 +0000
Received: by mail-qk1-x72a.google.com with SMTP id af79cd13be357-7cd0a7b672bso200254485a.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 27 May 2025 06:22:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20230601.gappssmtp.com; s=20230601; t=1748352120; x=1748956920; darn=lists.infradead.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=VyWGs92VxZHmYWq/MBjeYIKfJS3oITyIiMO5I+wjqS4=;
        b=WDKJRmGnwmqqrbMOiWhmVxWuEa4bf0wjP+1ZiY7FGKMEQBRX11t/lRfaCNi4f6CX0J
         Ijkz6l4tlX3levFzWXDDP3RYGir+SiBs+ZpQMOV8SmPUp/s3Fx0hBOEGJ7gLJ9O5uNkG
         7+jkr8ArApVt+55zkabYZPW2HYSAlxtHYUTCVjoRAlS6Mvc6ccw7XnQGpOVNL6OeXdK3
         LEAiW+pcfzKz0Aqy3cvL/0+9boaizxCRo7TX0eCEUrA4MkPoqAbt7XfoAhP+qT/0EJXs
         pxdGImpt9lW13/MvAHOPVFFz+GENGoR7tSWHk3n5iyHEFEOVY4JETCXikfiZPVpjFif9
         4GHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748352120; x=1748956920;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=VyWGs92VxZHmYWq/MBjeYIKfJS3oITyIiMO5I+wjqS4=;
        b=CEIHroNUw7h7PWfqBm006KI66AWHN7pDHn3eioQv1Tc8DFntWPdgqyjq0HR2paFUCX
         G2smigo/Nrq90zjJ0IDB6KNNY9zm4xE9c5ENBVlRd2drBAbaNcrqd7EL3pktydVCUgRq
         X74v+/sg2fva8e5LUk7NSp7MOXGXuDcddYoLe19UoGq89ctc699c6mCWqS5M61dpPxCG
         6DuR/JV3uymWdaSMMjoAJJ6En11Yi5JQJ9csfeGk6dL5kveQdd7eVX3+ETyr5ZFGV4m6
         NzutkuUM5aFDq5NoXV5JehD4UiT7BE1ACWtN1lWFXYpNpdwWw0Z591UdhHnqHUxsEM3p
         xH8Q==
X-Forwarded-Encrypted: i=1; AJvYcCWpH5Y6rXae9qxSLD2lek3h6p0Wps++T2ALplhwql9DuQRm9sNrFc66e9tlL5rClFW7HXD8xUHZv9L11nN8DALI@lists.infradead.org
X-Gm-Message-State: AOJu0YxQrh63dyk90G/tKBCdsGGIscANqDuUhqhfS80VJE6bDaMHStph
	RV/mZf9qjDwSu7uXZ4tMxYCWkA5lXWQyHoXS/2vfllXgPm+Z4xu7B2jLvtv37kqmetk=
X-Gm-Gg: ASbGncvatDDLomrVKp91Ksw98MULm65yFZrlhVxp3kVuFmC/QvTTa+jll8Nj+Aiiy2L
	CLbREy1v5AzC7p47wfME1JX6CaQIbCTN6ZUVBRD0U+Dtn15eOcGKNIxx1cvCe73NArm2vJWhCDZ
	V7tJsrSmXcwfbxCDe80OW6fC9urMaTPuXe6982ZO/GeeVi1EanrGYogyqDgIGuw5gqnzqgsrDYx
	bnzU88vL8qWaF0L1ZxHDTN5/2Ao2vAG1VL5/PSarA3ZDCBypbkcNkilQfa+PlHtsKDegajs8m43
	Opw2qFQbGRJ0uxKtyS2RF6XzjSeuEj+nTxB9FzsUO1AIuqHf8eMmWiKS
X-Google-Smtp-Source: AGHT+IGqjEuOc/rQc0o4CTVNkvRn1LeoDd94pgaJaN+RFhGpz7B5jdeGPrzKG2P1R07nsKaMUvmdnQ==
X-Received: by 2002:a05:620a:c4a:b0:7c5:e226:9da2 with SMTP id af79cd13be357-7ceecbf9338mr2045791485a.47.1748352120422;
        Tue, 27 May 2025 06:22:00 -0700 (PDT)
Received: from ?IPv6:2606:6d00:17:b2fc::5ac? ([2606:6d00:17:b2fc::5ac])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7cd467dd34csm1725927585a.47.2025.05.27.06.21.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 May 2025 06:21:59 -0700 (PDT)
Message-ID: <30acbaadc08869687c22e6a70052571c99556979.camel@ndufresne.ca>
Subject: Re: [PATCH 2/5] dt-bindings: media: allegro-dvt: add decoder
 dt-bindings for Gen3 IP
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: Yassine Ouaissa <yassine.ouaissa@allegrodvt.com>, Krzysztof Kozlowski
	 <krzk@kernel.org>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring
 <robh@kernel.org>,  Krzysztof Kozlowski	 <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Michael Tretter	 <m.tretter@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,  Michal Simek
 <michal.simek@amd.com>, Heiko Stuebner <heiko@sntech.de>, Neil Armstrong	
 <neil.armstrong@linaro.org>, Junhao Xie <bigfoot@classfun.cn>, Rafa??
 Mi??ecki	 <rafal@milecki.pl>, Kever Yang <kever.yang@rock-chips.com>,
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, Hans Verkuil
 <hverkuil@xs4all.nl>, Christophe JAILLET	 <christophe.jaillet@wanadoo.fr>,
 Sebastian Fricke	 <sebastian.fricke@collabora.com>, Gaosheng Cui
 <cuigaosheng1@huawei.com>,  Uwe Kleine-K??nig
 <u.kleine-koenig@baylibre.com>, Joe Hattori <joe@pf.is.s.u-tokyo.ac.jp>,
 Wolfram Sang	 <wsa+renesas@sang-engineering.com>, Ricardo Ribalda
 <ribalda@chromium.org>, 	linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, 	linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Date: Tue, 27 May 2025 09:21:58 -0400
In-Reply-To: <uys462vhrhzeapzkve7z5k3xg6bjvpdne4xw44voqn6uhjdkmc@owrdgvraiqyb>
References: <20250523134207.68481-1-yassine.ouaissa@allegrodvt.com>
	 <20250523134207.68481-3-yassine.ouaissa@allegrodvt.com>
	 <3e6be40a-2644-416a-bd32-f6256f1501ff@kernel.org>
	 <7863d15a-fa20-4db5-89b5-77a026d3f937@kernel.org>
	 <a72z6exgol5cbur2cy7wjwyroi4zddtki5ab3zdkfuwpskpavr@r26wahldhd3r>
	 <b5bb919e-6273-48ed-b5d8-29177dbbfb76@kernel.org>
	 <flwocneutp64bxxwfkfqvm6dq7klc2nu33ybr3ap6qeovopfq7@7qognvdf4zew>
	 <04e1f361-b3cf-4fdb-a008-42eb489f6c4d@kernel.org>
	 <uys462vhrhzeapzkve7z5k3xg6bjvpdne4xw44voqn6uhjdkmc@owrdgvraiqyb>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2 (3.56.2-1.fc42) 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250527_062202_600837_6FC668CF 
X-CRM114-Status: GOOD (  28.82  )
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

Hi Yassine,

Le lundi 26 mai 2025 =C3=A0 12:58 +0000, Yassine Ouaissa a =C3=A9crit=C2=A0=
:
> On 26.05.2025 14:46, Krzysztof Kozlowski wrote:
> > On 26/05/2025 14:27, Yassine Ouaissa wrote:
> > > On 26.05.2025 12:57, Krzysztof Kozlowski wrote:
> > > > On 26/05/2025 09:25, Yassine Ouaissa wrote:
> > > > > On 23.05.2025 19:13, Krzysztof Kozlowski wrote:
> > > > > > On 23/05/2025 19:11, Krzysztof Kozlowski wrote:
> > > > > > > On 23/05/2025 15:41, Yassine Ouaissa wrote:
> > > > > > > > Add compatible for video decoder on allegrodvt Gen 3 IP.
> > > > > > > >=20
> > > > > > > > Signed-off-by: Yassine Ouaissa <yassine.ouaissa@allegrodvt.=
com>
> > > > > > > Please do not send the same patches over and over again. You =
got review
> > > > > > > which you need to address.
> > > > > > >=20
> > > > > > > Once address you send NEXT version with proper CHANGELOG for =
each patch
> > > > > > > or top of cover letter. See submitting patches... or just use=
 b4. This
> > > > > > > should be actually requirement for this work.
> > > > > > >=20
> > > > > > > Anyway, I see all of previous review ignored so let's be expl=
icit:
> > > > > > >=20
> > > > > > > NAK
> > > > > > >=20
> > > > > Hi Krzysztof,
> > > > >=20
> > > > > Make sure that i'm not ignoring anyone reviews, i sent a new set =
of
> > > > > patches to start cleanly, and i have sent you an email about this=
.
> > > >=20
> > > > It is still v1 - the same? - while you already sent three patchsets=
 before.
> > >=20
> > > As i mentioned, this patch is sent to start cleanly, so it still v1.
> > > And the previous patchsets should be ignored.
> > This is not how the process works and it is not making reviewers life
> > easier. It makes it impossible for us to compare (try yourself with `b4
> > diff`) and forces to re-review everything every time.
>=20
> I know that i made a mistake by not respecting the "submitting patches".
> this is why, i prefer to start from a good base ( clean patches ).
> =C2=A0From this patchsets, You & I can use the b4 or other tools to get t=
he diffs.

For future submissions, once there is a base, don't try and "fix" things, j=
ust do
add V2, V3 on future submissions, even if its completely rewritten. Just sa=
y so in
your cover letter change log. If everyone was to reset to V1 all the time o=
ur work
as reviewer and maintainers would be completely un-manageable. Please under=
stand
and take our explanations for the future. There is no need for you to argue=
 on this,
this is not just personal preference. Same driver, second submission mean v=
2. That is
even true if you take over someone else series.

regards,
Nicolas

>=20
> >=20
> > Best regards,
> > Krzysztof
>=20
> Best regards,
> Yassine OUAISSA

