Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 357B6CA0FFD
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  1 Sep 2025 08:57:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=39DETOS6vNez6Y226+ALS8td0nl160a+Uf7v79luhD8=; b=DpeBQCp9Qqk2YzYSMiUc0q3FgO
	qb3NopNGC6Ek4YsKlo2rAMvgmQrdyluNjc5Z2FSbEtkFnxP3UiS/ljgSZLzkGljjJx+uicQ9cMlkE
	7u1rYijJW7Lv0PA6ywvS6PMzAIMwSDohQ/gfVtQUjONKwr0d2j2OqDwvz/u7mlyvSQBRHZ6YE/0D4
	+TBJSvXxYrUXs9saojbZ3uVCCB3dovxsWA1ZKdWAtlaF4q02oClS7NfOuleCv6FrN9vD9iWrvHD1p
	OLsRvqtzEzEi9XTtB1VW3rfTeCuuMoYhvfR6htYr54Dv191D9/C6YrKFaB7Q9VzZSFiwedwlVJ8zo
	LmTb2y9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ut0Le-0000000BecB-2qLp;
	Mon, 01 Sep 2025 08:57:10 +0000
Received: from mail-lf1-x131.google.com ([2a00:1450:4864:20::131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uszzp-0000000BamM-1wTD
	for linux-arm-kernel@lists.infradead.org;
	Mon, 01 Sep 2025 08:34:38 +0000
Received: by mail-lf1-x131.google.com with SMTP id 2adb3069b0e04-5607c2f1598so209723e87.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 01 Sep 2025 01:34:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1756715675; x=1757320475; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=39DETOS6vNez6Y226+ALS8td0nl160a+Uf7v79luhD8=;
        b=CrfLhQX4J+xEbeR2UiKrdbxHBd72//hMYIRX9OVgxM2ijgTF0qTpy+YOHu3Gl1moDK
         q9fRy1zMNsKbLBASlAfZsFk4ZkyzqInUOGsHfN3GnvyJTtQb0Q2V3ZIujItAAyevGhxa
         gJzr79VqFPWgP39xDZuprFinM4qxSRka73oRcUF+CJRyYzv+cO4MTH/Sfi8mRD+PnCpU
         aDa6vGLhzUMf9R5J9UrVFgRhwi6RJutK7Gugwux8l6CzZxSBQAKqVpGlnwQHWRv5/Lhe
         NUkwoe475lC6+Tq5wifzP3OMkBjQkSS8JDksS5VNS2+ZerWwwmFs/xhX5p3oeV2CBM/h
         5YIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756715675; x=1757320475;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=39DETOS6vNez6Y226+ALS8td0nl160a+Uf7v79luhD8=;
        b=ufPvghG15wBrcZNHQ5pixdlnAWQdJr6F4zIH9BkNM6s/LwhQqJwtnlW3toehdAjigN
         JlSxi9o43OJ5l8tvxA2cAbgRsZAw5PqWFzWdDJ59QtGVxrhnRCCKoEv18ts6ClbEZXfj
         QkMrv/xARdwcxujhcHSSV70+8RJSoNbB/eECZNHzoUBc1BvCIXNqYQ3C4YaAPdpsxgVM
         0uNvQjMRN1IsYxbVUmecGbBsV/JG7iBetHkQ/M57J2OmwMM9CT9kJYqabb9+mtEDZ/mx
         UxndO68DVPuDZMoR0vQYZLmWiFRpQ4hLAvd45rUne5K6jETMG2XKhGba3cBDRUgIVHwR
         2mtA==
X-Forwarded-Encrypted: i=1; AJvYcCVQtZuecJLOlcYZsiifOzB975u44zhm+Z0AhIpOPaW/YeXaKjXy5RDnxeF8ydsuUY2hUtsbE3jCpRHwA6WzVc5q@lists.infradead.org
X-Gm-Message-State: AOJu0Yw8FWC2qoSATpY74MOxUaL1xQx1jMZ9G0Msnl0kJDOCOSwvUf3u
	gHTRKLxYxYYPofHlpUceQfmi2ANpN+YaiWXg28LkUsl42Qp08xXXL8VHCaeYaGo7Hbg7/IpvEQA
	o4Egs1pKvPVl1BUenEStmKsWhSZHzyyVrZe4csOitU0KQjMHBdUC7
X-Gm-Gg: ASbGncvTW65H1VBRNEDYci7voAcvlaX/Hsn4YZ1hjEdtcYibHMrFWlVtl9+ZqNMJsmQ
	IugS5Syr/xyW4W0ROegtN1ojHd7fGpIpEHqlAf37gm+RwP2jfmfpnLqEOf7OstSdmTUOGyMBOIu
	S5GeDAH0drOQyWgAZpMIHCXDzEy8H4nk9lSMdKCiIJCBJVd5itqShVQ3ZtVwudQXJLUceXvYMmD
	JxKCszF8E6XDyiFU0qwflVuH6DtDg67Drv2Qfq820sdfnFSXA==
X-Google-Smtp-Source: AGHT+IFvvN9ahNPe5qHZqgsGxSWYWIYkUijyOt4zXNDAGa1vEQF6LNv4KjL2EC1uh6zpjK1hm4xOhtvSP0h6YecbdGs=
X-Received: by 2002:a05:6512:1289:b0:55f:3f25:f03d with SMTP id
 2adb3069b0e04-55f708dbc89mr2314529e87.32.1756715675202; Mon, 01 Sep 2025
 01:34:35 -0700 (PDT)
MIME-Version: 1.0
References: <20250828-pinctrl-gpio-pinfuncs-v6-0-c9abb6bdb689@linaro.org>
 <CAHp75Vd+q5NZ=4YSouU-EdbR4TZf7S8PGqR0B0HJG8DkVKKtAg@mail.gmail.com> <CACRpkdZcPwwpie51D55AHTQRSqG_EQ=tVG+0aMJpHhYZLGq1yg@mail.gmail.com>
In-Reply-To: <CACRpkdZcPwwpie51D55AHTQRSqG_EQ=tVG+0aMJpHhYZLGq1yg@mail.gmail.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Mon, 1 Sep 2025 10:34:23 +0200
X-Gm-Features: Ac12FXw1K_oL8rhC-DnjIn1Cs7YcfvulHGz-GiwjDWSfYP_4tIeMD4yzENOHaAA
Message-ID: <CAMRc=Mcy8ia5Cp-hpvZp4Pz-gLEibzjg=MHA01YTeFk-OkFspg@mail.gmail.com>
Subject: Re: [PATCH v6 00/15] pinctrl: introduce the concept of a GPIO pin
 function category
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Andy Shevchenko <andy.shevchenko@gmail.com>, Andrea della Porta <andrea.porta@suse.com>, 
	Konrad Dybcio <konradybcio@kernel.org>, Sean Wang <sean.wang@kernel.org>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Andy Shevchenko <andy@kernel.org>, 
	David Hildenbrand <david@redhat.com>, "Liam R. Howlett" <Liam.Howlett@oracle.com>, 
	Vlastimil Babka <vbabka@suse.cz>, Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, 
	Fabio Estevam <festevam@gmail.com>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Mark Brown <broonie@kernel.org>, linux-gpio@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250901_013437_501856_B8DDB002 
X-CRM114-Status: GOOD (  15.67  )
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

On Mon, Sep 1, 2025 at 10:31=E2=80=AFAM Linus Walleij <linus.walleij@linaro=
.org> wrote:
>
> On Sat, Aug 30, 2025 at 10:19=E2=80=AFAM Andy Shevchenko
> <andy.shevchenko@gmail.com> wrote:
>
> > Note mainly for Linus and Bart:
> > I agree with the patches 1..11, but starting from 12 needs more
> > discussion. That said, I hope Linus can apply the first 11 ones to
> > make it easier to continue with the rest.
>
> I applied patches 1 thru 11 so we get some traction.
>

Ah, I hoped to get a Tested-by from Mark on the IMX first as I'm not
100% sure the fix in this iteration actually works.

Bartosz

